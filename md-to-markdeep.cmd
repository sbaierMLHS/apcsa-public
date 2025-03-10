@REM echo off & setlocal
echo %time%

@REM software needed to build GitHub pages and .pdf
@REM sed http://gnuwin32.sourceforge.net/packages/sed.htm
@REM headless chrome https://www.google.com/chrome/
@REM pdftk https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/

@REM usage to capture output and errors: md-to-markdeep > out.txt 2>&1

@REM -- Set up the GitHub pages directory structure by copying curriculum content.
robocopy /E .\curriculum .\docs

@REM -- Move to docs directory
cd .\docs
set sed="C:\Program Files (x86)\GnuWin32\bin\sed"
set chrome="C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"

@REM -- Convert files in each unit

for /r . %%f in (*.md) do (
    @echo %%f

    @REM -- Create .pdf version of markdown files with no toc
    @REM - type >"%%f-pdf.html" ..\markdeep-header.txt
    @REM - %sed% >>"%%f-pdf.html" "s/\.md/.md.html/g" "%%f"
    @REM - type >>"%%f-pdf.html" ..\markdeep-footer-tocstyle-none.txt
    
    @REM --no-margins does not work, had to edit the javascript
    @REM - %chrome% --headless --print-to-pdf="%%~pf%%~nf.pdf" --no-margins "%%f-pdf.html"
    @REM - del "%%f-pdf.html"

    @REM -- Create html version of markdown files
    type >"%%f.html" ..\markdeep-header.txt
    %sed% >>"%%f.html" "s/\.md/.md.html/g" "%%f"
    type >>"%%f.html" ..\markdeep-footer.txt
    del "%%f"
)

@REM - pdftk README.pdf Video-Tutorials.pdf Assets.pdf  Unit1\Unit1-Map.pdf Unit2\Unit2-Map.pdf Unit3\Unit3-Map.pdf Unit4\Unit4-Map.pdf Unit5\Unit5-Map.pdf Unit6\Unit6-Map.pdf Unit7\Unit7-Map.pdf Unit8\Unit8-Map.pdf Unit9\Unit9-Map.pdf UnitA\UnitA-Map.pdf ^
@REM - Unit1\Lesson-101.pdf Unit1\Lesson-102.pdf Unit1\Lesson-103.pdf Unit1\Lesson-104.pdf Unit1\Lesson-105.pdf Unit1\Lesson-106.pdf Unit1\Lesson-107.pdf Unit1\Lesson-108.pdf Unit1\Lesson-109.pdf Unit1\Lesson-1XX.pdf ^
@REM - Unit2\Lesson-200.pdf Unit2\Lesson-201.pdf Unit2\Lesson-202.pdf Unit2\Lesson-203.pdf Unit2\Lesson-204.pdf Unit2\Lesson-205.pdf Unit2\Lesson-206.pdf Unit2\Lesson-207.pdf Unit2\Lesson-208.pdf Unit2\Lesson-208a.pdf Unit2\Lesson-209.pdf Unit2\Lesson-210.pdf Unit2\Lesson-211.pdf ^
@REM - Unit3\Lesson-300.pdf Unit3\Lesson-301.pdf Unit3\Lesson-302.pdf Unit3\Lesson-303.pdf Unit3\Lesson-304.pdf Unit3\Lesson-305.pdf Unit3\Lesson-306.pdf Unit3\Lesson-307.pdf Unit3\Lesson-308.pdf Unit3\Lesson-309.pdf Unit3\Lesson-310.pdf Unit3\Lesson-311.pdf Unit3\Lesson-312.pdf Unit3\Lesson-313.pdf Unit3\Lesson-314.pdf Unit3\Lesson-315.pdf Unit3\Lesson-316.pdf Unit3\Lesson-317.pdf Unit3\Lesson-318.pdf Unit3\Lesson-319.pdf  Unit3\Lesson-3XX1.pdf ^
@REM - Unit4\Lesson-400.pdf Unit4\Lesson-401.pdf Unit4\Lesson-402.pdf Unit4\Lesson-403.pdf Unit4\Lesson-404.pdf Unit4\Lesson-405.pdf Unit4\Lesson-406.pdf Unit4\Lesson-407.pdf Unit4\Lesson-408.pdf Unit4\Lesson-409.pdf Unit4\Lesson-409a.pdf Unit4\Lesson-410.pdf Unit4\Lesson-4XX.pdf ^
@REM - Unit5\Lesson-500.pdf Unit5\Lesson-501.pdf Unit5\Lesson-502.pdf Unit5\Lesson-503.pdf Unit5\Lesson-504.pdf Unit5\Lesson-505.pdf Unit5\Lesson-506.pdf Unit5\Lesson-506a.pdf Unit5\Lesson-507.pdf Unit6\Lesson-600.pdf Unit5\Lesson-5XX.pdf ^
@REM - Unit6\Lesson-601.pdf Unit6\Lesson-602.pdf Unit6\Lesson-603.pdf Unit6\Lesson-604.pdf Unit6\Lesson-605.pdf Unit6\Lesson-606.pdf Unit6\Lesson-607.pdf Unit6\Lesson-607a.pdf Unit6\Lesson-608.pdf Unit6\Lesson-609.pdf ^
@REM - Unit7\Lesson-700.pdf Unit7\Lesson-701.pdf Unit7\Lesson-702.pdf Unit7\Lesson-703.pdf Unit7\Lesson-704.pdf ^
@REM - Unit8\Lesson-800.pdf Unit8\Lesson-801.pdf Unit8\Lesson-802.pdf Unit8\Lesson-803.pdf Unit8\Lesson-804.pdf Unit8\Lesson-805.pdf Unit8\Lesson-806.pdf Unit8\Lesson-808.pdf ^
@REM - Unit9\Lesson-900.pdf Unit9\Lesson-901.pdf ^
@REM - finalproject\CharacterClashProject.pdf ^
@REM - culturedays\culture_day_lesson_a.pdf culturedays\culture_day_lesson_b.pdf culturedays\culture_day_lesson_c.pdf culturedays\culture_day_lesson_d.pdf ^
@REM - About.pdf CONTRIBUTING.pdf cat output AP-CSA.pdf

@REM delete all temporary .pdf files  
@REM - move /Y AP-CSA.pdf AP-CSA.save
@REM - del /s *.pdf
@REM - move /Y AP-CSA.save AP-CSA.pdf

@REM move GitBook Pages index file
move /Y README-pages.md.html index.html

cd ..

echo %time%

Exit /B
