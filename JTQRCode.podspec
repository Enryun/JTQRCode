Pod::Spec.new do |spec|
  spec.name         = "JTQRCode"
  spec.version      = "0.0.1"
  spec.summary      = "JTQRCode is a framework that simplifies integrating QR code generation and scanning into iOS apps."
  spec.description  = <<-DESC
  With a suite of customizable components, JTQRCode allows you to generate, display, and scan QR codes effortlessly, enhancing the user experience within your app.
                   DESC

  spec.homepage     = "https://github.com/Enryun/JTQRCode"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  spec.homepage     = "https://github.com/Enryun/Common_SwiftUI"
  
  spec.license      = { :type => "MIT", :text => 'MIT License
Copyright (c) 2024 James Thang

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.' }

  spec.author             = { "JamesThang" => "jamesthang1996@gmail.com" }
  spec.social_media_url   = "https://www.linkedin.com/in/jamesthang/"

  spec.platform     = :ios
  spec.platform     = :ios, "15.0"

  spec.source       = { :git => "https://github.com/Enryun/JTQRCode.git", :tag => "#{spec.version}" }

  spec.module_name = 'JTQRCode'
  spec.source_files  = 'Sources/**/*.{swift}'
  spec.exclude_files = "Classes/Exclude"
 
  spec.swift_versions = '5.9'
  
end
