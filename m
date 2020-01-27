Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCBC314A8D3
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jan 2020 18:18:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725897AbgA0RSY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jan 2020 12:18:24 -0500
Received: from mail-il1-f170.google.com ([209.85.166.170]:43480 "EHLO
        mail-il1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725845AbgA0RSX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jan 2020 12:18:23 -0500
Received: by mail-il1-f170.google.com with SMTP id o13so7475355ilg.10
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jan 2020 09:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=7iIzPWpmQyJWSR2R5TWvstPbb4a+HYx4eAah/vh85Qg=;
        b=mBA/pVl3Z3gq7ERKlY640uulSjGFHE/W2YJqztbCWCQcoBr5nThLCPqOteoMhDzzb/
         qJmgWL+1Rf269tHvbIIKL9RLYHPbvQJYXeEZKI6YjDjPAHzwF26/Z5zYbr6Nx4xF2WTJ
         X0fvuOYvP3PYMgVMmc5FrbZiDmh1ooo+D1yNWAVYDddF8rGAHI3YJtuumUmojzKsrozK
         SY+OqhyyEo1Y7mcEVBVH1+vZ9dWEQOoNgEDBT0DE74zgS2z6a6g4+Hq9cdC+PLAOWrdN
         ATYN5gVXt7I2swqtZp+bKRxXSv/BhnfrREtQ4PrMsKQScL1XhzA84jjPEV2HftXDMv/n
         osrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=7iIzPWpmQyJWSR2R5TWvstPbb4a+HYx4eAah/vh85Qg=;
        b=tQbLu+8RCQ0ec7LxottZa98QtuD5L9S95Cvm39L6nC8r6PZB44CKMlr1cHpzv/xFmx
         A6JD3WO4OZVVvnazuClDXxnUwaukFnKDPMvt+EzxMDd1B3PjW95zvZezcZd9d2P1G+y5
         ltKGguVRISJtiSW3+xW2ICGIo4FhAUNAE49X9Yk0EQP8+UW2mMvFtX3q08JNUmXSf+Id
         i3Rh9pSQmxZSuvF3xhnwsE+R3yB1eXgBDyiNFvdWqTfGjnd07kMpIUxvkj8AQeVWgY2y
         0zyZR+2la3GN3bt71b0vpQ0ILPeupzWUCMTywtOf21R/KEnGkuZ0z1YecLq7pDo0mDqd
         TuHg==
X-Gm-Message-State: APjAAAXHRGMQBM2CSTCZ7S5dSwrP82RhiSI9VRUUVsIryKIAuK+nvLg/
        56VXcP8y3fpdEJZ6la/Wm6nSumrOnjkvjr+fn1frWC9WEHw=
X-Google-Smtp-Source: APXvYqwG4OihMcVutoQeuOnXy/+X91A7V1e7f2Nb+AZIFSlPURWF1BcgC687OXubCDcdwN7D+c+PbWujfz9DF7fHfIA=
X-Received: by 2002:a92:9c1c:: with SMTP id h28mr14987230ili.189.1580145502787;
 Mon, 27 Jan 2020 09:18:22 -0800 (PST)
MIME-Version: 1.0
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 27 Jan 2020 18:18:12 +0100
Message-ID: <CAMRc=MenRimgW=1X93gh-pyuKbLhRir1rBUPYaLOXTT1v2SE8g@mail.gmail.com>
Subject: [ANNOUNCE] libgpiod v1.5
To:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Cc:     Drew Fustini <drew@pdp7.com>, Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello!

libgpiod v1.5 is now released with just a couple fixes on top of
v1.5-rc1. Final changelog is below.

The sources are available at:

    git://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git

The release tarballs can be downloaded from:

    https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/

I'm also making a bug-fix release for the v1.4.x series because v1.5
will be unavailable in yocto until it integrates linux v5.5.

Best regards,
Bartosz Golaszewski

---

libgpiod v1.5
=============

New features:
- switched to using the GLib testing framework for core library tests and BATS
  (Bash Automated Testing System) for command-line tools
- used Catch2 C++ testing framework to implement a proper test-suite for C++
  bindings while also reusing the API provided by libgpiomockup
- used Python's unittest package to implement a proper test suite for Python
  bindings and reused libgpiockup again
- provided line::update() and Line.update() routines for C++ and Python
  bindings respectively allowing to update the line info from bindings as well
- added support for bias flags which are a new functionality first available in
  linux v5.5; subsequently the library now requires v5.5 kernel headers to
  build; the new flags are supported in the core library, C++ and Python
  bindings as well as the command-line tools
- added support for the new SET_CONFIG ioctl(): this too is a new functionality
  added in linux v5.5; both features have been implemented in the library by
  Kent Gibson
- added routines for reading multiple line events at once to the core library,
  C++ and Python bindings

Improvements:
- constified function arguments where applicable in libgpiomockup
- fixed the name of the test exeucutable displayed at build time
- improved the function pointer casting in Python bindings to avoid warnings
  emitted by GCC8
- switched to using the KERNEL_VERSION() macro in tests instead of handcoded
  version parsing
- improved the setup ordering in tests (setup libgpiomockup before checking
  the kernel version
- add 'extern "c"' to the libgpiomockup header to make it usable from C++
- add chip index validation to libgpiomockup functions
- check if the debugfs directory used by libgpiomockup is writable before
  using it to set the pull of dummy lines
- add several new test cases
- improved Python example programs (made gpiomon's output similar to the
  original tool, make gpioset wait for an ENTER pres by default)
- fixed the major:minor number comparison between the device and sysfs
- deprecated the gpiod_line_needs_update() function and removed the logic
  behind it from the library
- shrank the Python bindings a bit by directly returning the value from
  PyErr_SetFromErrno()
- dropped noexcept from methods which can throw in C++ bindings
- switched to initializing the bitset with integers instead of strings in C++
  bindings
- allowed gpiod_line_set_value_bulk() to accept null pointers
- when building Python bindings: check for the existence of python-config
- improved the readability of help text messages for command-line tools
- reworked the .gitignore file: added libtool scripts generated during
  cross-compilation and split the main .gitignore into several fine-grained
  files
- fixed several misspellings
- other minor tweaks and improvements

Bug fixes:
- fixed memory leaks in libgpiomockup
- fixed memory leaks in the testing framework
- fixed a segfault in error path in tests
- make gpioinfo show lines claimed by the kernel as used even if they have no
  named consumer
- fixed the test cases validating the '--active-low' switch in gpiomon and
  the GPIOHANDLE_REQUEST_ACTIVE_LOW flag in the core library after a fix
  for incorrect behavior was merged in linux v5.2.7
- stopped failing at init-time of libgpiomockup if gpio-mockup is already
  loaded
- added a missing throw keyword in error path in C++ bindings
- fixed a segfault in Python bindings when calling Line.request() without
  the consumer argument
