Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BEA513142D
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2020 15:56:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbgAFO4g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jan 2020 09:56:36 -0500
Received: from mail-il1-f175.google.com ([209.85.166.175]:33749 "EHLO
        mail-il1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbgAFO4g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jan 2020 09:56:36 -0500
Received: by mail-il1-f175.google.com with SMTP id v15so42816322iln.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jan 2020 06:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=qsEWGebuFqIxIYVSQSrceXFGueRPmXvrIfpIRluyTdg=;
        b=TNCrkAs44wVOWbU7IR6izjh/e2dN0B2UY4pQaxlE8T7xalEU1N7H6BGqHDXsw5/Qxv
         URiCfCe5KxDZaVhGs2A0sP+TCg02BrjsNSQRVlOdBoC05v4OMnXPtviboR7IKqXloQ7S
         LgOCjPRrqlWGb3yrUJA9QetQu+lTKOMQK3D7DNMSDH+utSSdbAv1TBXqa3mjunfXPfsH
         nbyuxYBtUXhCsufDaHPNMVpvBc3XaVBJE1TVymvcdoewnUVIhJ0dcfAFcd53EtwdF2gp
         rcTVBMtqRqa75iMkGlVF/brZV8m7+JyiEsH/BmIr/vZvTvfLFyA7VftfNYokKgwDv4xc
         sEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=qsEWGebuFqIxIYVSQSrceXFGueRPmXvrIfpIRluyTdg=;
        b=L5dM/pT/pGawoJbXRoxdXzSJKu/p5BSB5GepVlJzCeZqhNy6QcQbeIBCkQ0XYdvUwE
         x080OjL5+TJgoF6bqwH/kTHg5OBDrUGwklgB4HKNXymEMNLpLblkGAavKAJJuy8In6y1
         l04NSnYDnu6s3KY9BME3KP3Hp6Zd/+uRIM9in1WWS5SWbKz98v22vRqVsFs/mxodoTBb
         a2IyC/xBsCcqwni0XQoGO7g1AxxSlnCTRFVUiMV1wr2VdOWD4yrotZP9/QTQi5XIbFHT
         OzNURbgJ9tAN3zkhP/81yRn5X9sIFgnIB/RyAtKlYT5V6pKKzF1j7PgFeEUko21FsP0U
         7NMw==
X-Gm-Message-State: APjAAAXvASX4eTbdX4WOE0gGPLB5y3ZMu7Ngsb7lYK5WE3mNmVI5GGX1
        JelZIrZYv/RLXAknvNh1ca75h1UXfZ/tcfxv0JEp9RcuTLo=
X-Google-Smtp-Source: APXvYqyy4UgO6Ut/mYqFzYXQe/D3fnupt0j9fKIHU2hrpnBteooV/kCfhDdPWfsphjn8TXZCtnmPKhQ+Q28RMlrtl/c=
X-Received: by 2002:a92:3b98:: with SMTP id n24mr82891564ilh.189.1578322595177;
 Mon, 06 Jan 2020 06:56:35 -0800 (PST)
MIME-Version: 1.0
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 6 Jan 2020 15:56:24 +0100
Message-ID: <CAMRc=MeZm0Ohja23y-CONnk7S-dgPRJiqYKN1FrAxH2ijtGfcA@mail.gmail.com>
Subject: [ANNOUNCE] libgpiod v1.5-rc1
To:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Drew Fustini <drew@pdp7.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi!

v1.5 will be a big release for libgpiod adding support for several new
features merged for linux v5.5 so I decided to make an rc for the
first time before we do the final release together with linux v5.5.

The changelog for v1.5 is below. Any testing is appreciated.

The sources are available at:

    git://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git

The release tarballs can be downloaded from:

    https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/

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
