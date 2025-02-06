Return-Path: <linux-gpio+bounces-15460-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE29A2A86A
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 13:22:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 040311888DB2
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 12:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A5DD22D4F8;
	Thu,  6 Feb 2025 12:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="S8mbeMG3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCC222D4E9
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 12:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738844559; cv=none; b=afNZuIXvFsRWJ53YbvY+gxsueblveS61aQp9IDUicPSEtVAGrmJpzFIYQ2ogkC5rbpfD5/gfYisvcFr8llxo3rew1uBplXiWvJYUGiNMbeAVjuS1GviQkjoZ+phgQ0/feJ3K+jVvfQHgxwR9pr3qtCLHhhzdTwOefCVB8pdF6/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738844559; c=relaxed/simple;
	bh=kHt4JppA9KoDQM6JoGGFF2Sta1pIN9pvL/Bp61estpA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WoYIWqTD5qBE2580QgggfkLDoLkUIlRwy09wlDydiN9vSzjABSPe/COp8Y7x3dDl2Y/6yL2xQgp2RhwxFkEzENZCG53GUf+9rBFTqGDP5u2PSMPuUA9ONovZIEqmYn1TsEKhwMDS1EV2E4oxEI7A0U5lmGOcl7WflQSoPXz2dkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=S8mbeMG3; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-436281c8a38so5541535e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 04:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738844553; x=1739449353; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M2cP955ovmWP6uEcUtIsq/Fyd6FDbSlJTttPAOGYs7Y=;
        b=S8mbeMG3S2kOjYdEZSmYTkbXWKCk4SHwrVAqR25o3MzZmi1n3jkIDErEoxdFfBk9iy
         Ck6o8EbJlFVCJwI8KFhUvj0D9Lx8u85B25fO/hzF2t6RR4X8YQEqfUxwtWZf0XKn+8NY
         DgxMvtLvT/3ypmLU8zTXWH2oZlLW7l6U2StHuMu6qcHsDx1SCRFZ4jX6rWuvrZbrG+iH
         eixyWNZqsg7+Dw1zc18+lh/KRtZrclvfbhWdnEKNvj2Wm7dGVRyIhrO7oJP6rhFqAOvD
         oab6Pz8ot9UwGUCBWINJ8rJTVwHQJqrVJr9lUzdriRcixxLzBk+EuO6YnpLLmj7iqLH3
         2nrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738844553; x=1739449353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M2cP955ovmWP6uEcUtIsq/Fyd6FDbSlJTttPAOGYs7Y=;
        b=KGhql10cCjFkOv52xexjFFudANYC3vSYJUnufQlEadfDMjev+k2dxBtWfacTVB41EM
         GA+nQKCPUWKAkfdgCX/BmpWVHazB2FLY/IRSWIv2dns9quFTxhTfnFqZh11yaE/VfIz5
         MNSrT8WKCZrupQvwS0LXIGn+PgI2gl3qUAScHH+iech5r5TnlXdEt/Q3+XvzXnMZH8gw
         d5vru09RiGxjLe/cl3w0NY/av4PPBCMsnFjBxTnY/NNRMhmSOMfFDPqflkBfNv6rjk0H
         dOlV2kHXeRuGb6uhppATTBfOCHxnjuTf2WG7SGkagrhyNJlI3olC/EOneaVshkvahefv
         esIA==
X-Forwarded-Encrypted: i=1; AJvYcCWKPl24dUSHxFu1pKDKkf92/ScpCOIna0YC59Mt3pHTkDbYugAB736CseRgyQavxIN+SxNLZCqkLEHB@vger.kernel.org
X-Gm-Message-State: AOJu0Yy691aiQck4BLnvTOfQGSxKTyl7TLj8EJxAhsSOqR+g4FjEWE14
	0bPFyGevBGHICSdwkRby3W38DOFN/Md1pFBfiLQ1qj8rF6bRN80rF82gRt0o3u4=
X-Gm-Gg: ASbGnctQaPtDzS6/tJ9LQUGIpa+ArKeCsgRQXKl9YOqUoy4BHj0SSsfsZuTALn0Rgt/
	hL5a1y+tv4Bf3nUDN/2BneGG0Ob7Rr/NKJvjjhhGsaQYLvz/oGMYNg9Fvi+1CsgeDCvl7EFDr9h
	YHj1M1Fi2JGxKBX+NIx1gDr9X5TLPPGzkDhepZU3vdaWNCnzM9QRrORAzCrPKrdkwdMjbu5/7+V
	r+/dUNacdTQzPOlDZPWEJ8DxzNiAMsTJuws0U5OdvQsPLuZh//C9XiDQhpg+J3RKFOGeNSc7sPK
	0BbKhw==
X-Google-Smtp-Source: AGHT+IGBxizUYkqg2qi2zJkJA2cp+18wC2qVVgGBjBk4svcRjsKPBvwzQC2cWwf9OyqhNavqb4QV/g==
X-Received: by 2002:a05:6000:188f:b0:38a:86fe:52b5 with SMTP id ffacd0b85a97d-38db4872051mr5288450f8f.14.1738844552211;
        Thu, 06 Feb 2025 04:22:32 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c726:a8e:825:b823])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfd7d7asm17366775e9.36.2025.02.06.04.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 04:22:31 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 06 Feb 2025 13:22:13 +0100
Subject: [PATCH libgpiod v3 16/16] doc: move README contents to sphinx docs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-improve-docs-v3-16-2065191fff6f@linaro.org>
References: <20250206-improve-docs-v3-0-2065191fff6f@linaro.org>
In-Reply-To: <20250206-improve-docs-v3-0-2065191fff6f@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=40011;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=4BvnDKZ0sjfkpW65p9guwpCJbbn+svsamT4NAV1Y4tQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnpKl0YzY3hbY4He9b0b/EKAMUPtxP2eDDc2Lvy
 jOXJnqP4xOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6SpdAAKCRARpy6gFHHX
 cpyxD/407w2B4jUXieEWsOdTwpqQW4jx6DofErdYype0/8d1+fI/BmlLNRBNr4DdFlO+9XW7B90
 UrtD8LC2i5kVC608yvzvKFcb14cnTfK2ZBWMbe9KwvS5kBL6mxTLZHf/ThUaTn0rpDdEn/kDPur
 3W5h1pqwtjAF7r15eowySCxtgkY3pKt2jSbKhcVX21YdOY3M/XwbMMKj14IOgA0nEU1GvGpdq/M
 9cNz4SfdpLUrYLFVs9OsttbCX/MzIzXnGrn4nvG9R0oLIu2XwisPi14m6ZtxzvWhiKUnzgvZNe0
 QGPYUVa4ea6qdETarPqXNNdHxH/0Q2G0UFmVksp4/EW1Nu4s7t4EZ/kQkglEw9o4kcXbos+vjN+
 bUc8d2xU9bQKuN6VM7DsUwhG++0YVBTndpVS7TsZcJ8EV3Gd6t7a31vrLn0TvEE69SnrQmk+GwD
 +M9otK4PAAzDs/XrrzIv9fiktX/K5037vceza4L81EeqsegKYBCW/8myGCGaoFpldkXKSh3lKET
 DtqCI5e/YwqZqeGmaGVk1aSUHAc06b1yLDo/5RPanH3fXuxA7mo/oH+4No35Ds2GZthNUj1cKQr
 BWfrnq6N0JcD/4DDGF4XlvtIARWQW+zupbpCAg0jIT/UmVWN8sdow18JyTae/LDAJPm5aljl2wG
 LwzW1lHxyQ9RBSA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We now have comprehensive documentation available online on readthedocs.
Let's not duplicate docs in README - move all information into the
sphinx files.

While at it: make the remaining README use markdown.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 README                | 384 --------------------------------------------------
 README.md             |  11 ++
 docs/bindings.rst     |  25 +++-
 docs/building.rst     |  74 ++++++++++
 docs/contributing.rst |  45 ++++++
 docs/cpp_api.rst      |   3 +
 docs/dbus.rst         |  19 ++-
 docs/glib_api.rst     |   3 +
 docs/gpio_tools.rst   | 216 ++++++++++++++++++++++++++++
 docs/gpiocli_top.rst  |  81 +++++++++++
 docs/index.rst        |  23 ++-
 docs/python_api.rst   |   8 ++
 docs/testing.rst      |  46 ++++++
 13 files changed, 544 insertions(+), 394 deletions(-)

diff --git a/README b/README
deleted file mode 100644
index 28a3dfd..0000000
--- a/README
+++ /dev/null
@@ -1,384 +0,0 @@
-# SPDX-License-Identifier: CC-BY-SA-4.0
-# SPDX-FileCopyrightText: 2017-2023 Bartosz Golaszewski <brgl@bgdev.pl>
-
-libgpiod
-========
-
-  libgpiod - C library and tools for interacting with the linux GPIO
-             character device (gpiod stands for GPIO device)
-
-Since linux 4.8 the GPIO sysfs interface is deprecated. User space should use
-the character device instead. Version 2 of libgpiod requires GPIO character
-device uAPI v2 which was first released in linux 5.10. This library
-encapsulates the ioctl calls and data structures behind a straightforward API.
-
-RATIONALE
----------
-
-The new character device interface guarantees all allocated resources are
-freed after closing the device file descriptor and adds several new features
-that are not present in the obsolete sysfs interface (like event polling,
-setting/reading multiple values at once or open-source and open-drain GPIOs).
-
-Unfortunately interacting with the linux device file can no longer be done
-using only standard command-line tools. This is the reason for creating a
-library encapsulating the cumbersome, ioctl-based kernel-userspace interaction
-in a set of convenient functions and opaque data structures.
-
-Additionally this project contains a set of command-line tools that should
-allow an easy conversion of user scripts to using the character device.
-
-BUILDING
---------
-
-This is a pretty standard autotools project. The core C library does not have
-any external dependencies other than the standard C library with GNU extensions.
-
-The build system requires autotools, autoconf-archive, libtool and pkg-config
-to be installed on the host system for the basic build. Development files for
-additional libraries may be required depending on selected options. The
-configure script will report any missing additional required dependencies.
-
-The command-line tools optionally depend on libedit for the interactive feature.
-
-To build the project (including command-line utilities) run:
-
-    ./autogen.sh --enable-tools=yes --prefix=<install path>
-    make
-    make install
-
-The autogen script will execute ./configure and pass all the command-line
-arguments to it.
-
-If building from release tarballs, the configure script is already provided and
-there's no need to invoke autogen.sh.
-
-For all configure features, see: ./configure --help.
-
-TOOLS
------
-
-There are currently six command-line tools available:
-
-* gpiodetect - list all gpiochips present on the system, their names, labels
-               and number of GPIO lines
-
-* gpioinfo   - list lines, their gpiochip, offset, name, and direction, and
-               if in use then the consumer name and any other configured
-               attributes, such as active state, bias, drive, edge detection
-               and debounce period
-
-* gpioget    - read values of specified GPIO lines
-
-* gpioset    - set values of specified GPIO lines, holding the lines until the
-               process is killed or otherwise exits
-
-* gpiomon    - wait for edge events on GPIO lines, specify which edges to watch
-               for, how many events to process before exiting, or if the events
-               should be reported to the console
-
-* gpionotify - wait for changed to the info for GPIO lines, specify which
-               changes to watch for, how many events to process before exiting,
-               or if the events should be reported to the console
-
-Examples:
-
-    (using a Raspberry Pi 4B)
-
-    # Detect the available gpiochips.
-    $ gpiodetect
-    gpiochip0 [pinctrl-bcm2711] (58 lines)
-    gpiochip1 [raspberrypi-exp-gpio] (8 lines)
-
-    # Read the info for all the lines on a gpiochip.
-    $ gpioinfo -c 1
-    gpiochip1 - 8 lines:
-     line   0: "BT_ON"          output
-     line   1: "WL_ON"          output
-     line   2: "PWR_LED_OFF"    output active-low consumer="led1"
-     line   3: "GLOBAL_RESET"   output
-     line   4: "VDD_SD_IO_SEL"  output consumer="vdd-sd-io"
-     line   5: "CAM_GPIO"       output consumer="cam1_regulator"
-     line   6: "SD_PWR_ON"      output consumer="sd_vcc_reg"
-     line   7: "SD_OC_N"        input
-
-    # Read the info for particular lines.
-    $ ./gpioinfo PWR_LED_OFF STATUS_LED_G_CLK GLOBAL_RESET
-    gpiochip0 42 "STATUS_LED_G_CLK" output consumer="led0"
-    gpiochip1 2 "PWR_LED_OFF"    output active-low consumer="led1"
-    gpiochip1 3 "GLOBAL_RESET"   output
-
-    # Read the value of a single GPIO line by name.
-    $ gpioget RXD1
-    "RXD1"=active
-
-    # Read the value of a single GPIO line by chip and offset.
-    $ gpioget -c 0 15
-    "15"=active
-
-    # Read the value of a single GPIO line as a numeric value.
-    $ gpioget --numeric RXD1
-    1
-
-    # Read two values at the same time. Set the active state of the lines
-    # to low and without quoted names.
-    $ gpioget --active-low --unquoted GPIO23 GPIO24
-    GPIO23=active GPIO24=active
-
-    # Set the value of a line and hold the line until killed.
-    $ gpioset GPIO23=1
-
-    # Set values of two lines, then daemonize and hold the lines.
-    $ gpioset --daemonize GPIO23=1 GPIO24=0
-
-    # Set the value of a single line, hold it for 20ms, then exit.
-    $ gpioset --hold-period 20ms -t0 GPIO23=1
-
-    # Blink an LED on GPIO22 at 1Hz
-    $ gpioset -t500ms GPIO22=1
-
-    # Blink an LED on GPIO22 at 1Hz with a 20% duty cycle
-    $ gpioset -t200ms,800ms GPIO22=1
-
-    # Set some lines interactively (requires --enable-gpioset-interactive)
-    $ gpioset --interactive --unquoted GPIO23=inactive GPIO24=active
-    gpioset> get
-    GPIO23=inactive GPIO24=active
-    gpioset> toggle
-    gpioset> get
-    GPIO23=active GPIO24=inactive
-    gpioset> set GPIO24=1
-    gpioset> get
-    GPIO23=active GPIO24=active
-    gpioset> toggle
-    gpioset> get
-    GPIO23=inactive GPIO24=inactive
-    gpioset> toggle GPIO23
-    gpioset> get
-    GPIO23=active GPIO24=inactive
-    gpioset> exit
-
-    # Wait for three rising edge events on a single GPIO line, then exit.
-    $ gpiomon --num-events=3 --edges=rising GPIO22
-    10002.907638045	rising	"GPIO22"
-    10037.132562259	rising	"GPIO22"
-    10047.179790748	rising	"GPIO22"
-
-    # Wait for three edge events on a single GPIO line, with time in local time
-    # and with unquoted line name, then exit.
-    $ gpiomon --num-events=3 --edges=both --localtime --unquoted GPIO22
-    2022-11-15T10:36:59.109615508	rising	GPIO22
-    2022-11-15T10:36:59.129681898	falling	GPIO22
-    2022-11-15T10:36:59.698971886	rising	GPIO22
-
-    # Wait for falling edge events with a custom output format.
-    $ gpiomon --format="%e %c %o %l %S" --edges=falling -c gpiochip0 22
-    2 gpiochip0 22 GPIO22 10946.693481859
-    2 gpiochip0 22 GPIO22 10947.025347604
-    2 gpiochip0 22 GPIO22 10947.283716669
-    2 gpiochip0 22 GPIO22 10947.570109430
-    ...
-
-    # Block until an edge event occurs. Don't print anything.
-    $ gpiomon --num-events=1 --quiet GPIO22
-
-    # Monitor multiple lines, exit after the first edge event.
-    $ gpiomon --quiet --num-events=1 GPIO5 GPIO6 GPIO12 GPIO17
-
-    # Monitor a line for changes to info.
-    $ gpionotify GPIO23
-    11571.816473718	requested	"GPIO23"
-    11571.816535124	released	"GPIO23"
-    11572.722894029	requested	"GPIO23"
-    11572.722932843	released	"GPIO23"
-    11573.222998598	requested	"GPIO23"
-    ...
-
-    # Monitor a line for requests, reporting UTC time and unquoted line name.
-     $ gpionotify --utc --unquoted GPIO23
-    2022-11-15T03:05:23.807090687Z	requested	GPIO23
-    2022-11-15T03:05:23.807151390Z	released	GPIO23
-    2022-11-15T03:05:24.784984280Z	requested	GPIO23
-    2022-11-15T03:05:24.785023873Z	released	GPIO23
-    ...
-
-    # Monitor multiple lines, exit after the first is requested.
-    $ gpionotify --quiet --num-events=1 --event=requested GPIO5 GPIO6 GPIO12 GPIO17
-
-    # Block until a line is released.
-    $ gpionotify --quiet --num-events=1 --event=released GPIO6
-
-BINDINGS
---------
-
-High-level, object-oriented bindings for C++, GLib, python3 and Rust are
-provided. They can be enabled by passing --enable-bindings-cxx,
---enable-bindings-glib, --enable-bindings-python and --enable-bindings-rust
-arguments respectively to configure.
-
-C++ bindings require C++11 support and autoconf-archive collection if building
-from git.
-
-GLib bindings requires GLib (as well as GObject, GIO and GIO-Unix) v2.54.
-
-Python bindings require python3 support and libpython development files. Please
-refer to bindings/python/README.md for more information.
-
-Rust bindings require cargo support. When building the Rust bindings along the
-C library using make, they will be automatically configured to build against the
-build results of the C library. Please refer to bindings/rust/libgpiod/README.md
-for more information.
-
-DBUS
-----
-
-A commonly requested feature for the GPIO character device was state persistence
-after releasing the lines (as a kernel feature) or providing a central authority
-(in user-space) that would be in charge of keeping the lines requested and in a
-certain state (similarily to how the sysfs ABI works). DBus API has been
-provided to address this requirement. We define an interface covering the
-majority of the GPIO chardev's functionality and implement it from both the
-server and client sides in the form of the gpio-manager daemon and the gpiocli
-command-line utility for talking to the manager.
-
-DBus support can be built by passing --enable-dbus to configure. The daemon
-is bundled with a systemd unit file and an example configuration file for the
-io.gpiod1 interface that allows all users to access basic information about the
-GPIOs in the system but only root to request lines or change their values.
-
-With the manager running the user can run gpiocli to control GPIOs by asking
-gpio-manager to act on their behalf:
-
-    # Detect chips in the system.
-    $ gpiocli detect
-    gpiochip0 [INT34C6:00] (463 lines)
-
-    # Request a set of lines. Note that gpiocli exits immediately but the
-    # state of the lines is retained because it's the gpio-manager that
-    # requested them.
-    $ gpiocli request --output foo=active
-    request0
-
-    # Previous invocation printed out the name of the request by which the
-    # caller can refer to it later. All active requests can also be inspected
-    # at any time.
-    $ gpiocli requests
-    request0 (gpiochip1) Offsets: [5]
-
-    # We can print the information about the requested line using the
-    # information above.
-    $ gpiocli info --chip=gpiochip1 5
-    gpiochip1   5:	"foo"		[used,consumer="gpiocli request",managed="request0",output,push-pull]
-
-    # We can now change the value of the line.
-    $ gpiocli set foo=inactive
-
-    # And read it.
-    $ gpiocli get foo
-    "foo"=inactive
-
-    # We can even reconfigure it to input and enable edge-detection.
-    $ gpiocli reconfigure --input --both-edges request0
-
-    # And wait for edge events.
-    $ gpiocli monitor cos
-    21763952894920 rising  "foo"
-
-    # And finally release the request.
-    $ gpiocli release request0
-
-For more information please refer to the output of gpiocli --help as well as
-gpiocli <command> --help which prints detailed info on every available command.
-
-Of course - this being DBus - users can talk to gpio-manager using any DBus
-library available and are not limited to the provided client.
-
-TESTING
--------
-
-A comprehensive testing framework is included with the library and can be
-used to test both the core library code as well as the kernel-to-user-space
-interface.
-
-The minimum kernel version required to run the tests can be checked in the
-tests/gpiod-test.c source file (it's subject to change if new features are
-added to the kernel). The tests work together with the gpio-sim kernel module
-which must either be built-in or available for loading using kmod. A helper
-library - libgpiosim - is included to enable straightforward interaction with
-the module.
-
-To build the testing executable add the '--enable-tests' option when running
-the configure script. If enabled, the tests will be installed next to
-gpio-tools.
-
-As opposed to standard autotools projects, libgpiod doesn't execute any tests
-when invoking 'make check'. Instead the user must run them manually with
-superuser privileges.
-
-The testing framework uses the GLib unit testing library so development package
-for GLib must be installed.
-
-The gpio-tools programs can be tested separately using the gpio-tools-test.bash
-script. It requires shunit2[1] to run and assumes that the tested executables are
-in the same directory as the script.
-
-C++, Rust and Python bindings also include their own test-suites. All three
-reuse the libgpiosim library to avoid code duplication when interacting with
-gpio-sim.
-
-Python test-suite uses the standard unittest package. C++ tests use an external
-testing framework - Catch2 - which must be installed in the system. Rust
-bindings use the standard tests module layout and the #[test] attribute.
-
-DOCUMENTATION
--------------
-
-The project uses sphinx to automatically generate the documentation. The system
-needs to provide doxygen and sphinx-build programs. With those in place, the
-build can be invoked with 'make docs'. This generates documentation for the
-core C API as well as C++ and python bindings.
-
-Rust bindings use rustdoc, GLib bindings use gi-docgen.
-
-Man pages for command-line programs are generated automatically if gpio-tools
-were selected and help2man is available in the system.
-
-CONTRIBUTING
-------------
-
-Contributions are welcome - please send questions, patches and bug reports
-to the linux-gpio mailing list[2] by e-mailing to linux-gpio@vger.kernel.org
-(add the [libgpiod] prefix to the e-mail subject line).
-Note that the mailing list quietly drops HTML formatted e-mail, so be sure
-to send plain text[3].
-
-Code submissions should stick to the linux kernel coding style[4] and
-follow the kernel patch submission process[5] as applied to the libgpiod
-source tree. All shell scripts must pass `shellcheck` tests[9]. All files
-must have a license and copyright SPDX headers and the repo is expected to
-pass the `reuse lint` check[10].
-
-The mailing list archive[6] contains all the historical mails to the list,
-and is the place to check to ensure your e-mail has been received.
-Search for "libgpiod" to filter the list down to relevant messages.
-Those also provide examples of the expected formatting.
-Allow some time for your e-mail to propagate to the list before retrying,
-particularly if there are no e-mails in the list more recent than yours.
-
-There is a libgpiod github page[7] available for reporting bugs and general
-discussions and although PRs can be submitted and discussed, upstreambound
-patches need to go through the mailing list nevertheless while release
-tarballs should be fetched from kernel.org[8].
-
-For more information, refer to CONTRIBUTING.md in this repository.
-
-[1]  https://github.com/kward/shunit2
-[2]  http://vger.kernel.org/vger-lists.html#linux-gpio
-[3]  https://docs.kernel.org/process/email-clients.html
-[4]  https://docs.kernel.org/process/coding-style.html
-[5]  https://docs.kernel.org/process/submitting-patches.html
-[6]  https://lore.kernel.org/linux-gpio/
-[7]  https://github.com/brgl/libgpiod
-[8]  https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/
-[9]  https://www.shellcheck.net/
-[10] https://reuse.software/
diff --git a/README.md b/README.md
new file mode 100644
index 0000000..664dbc5
--- /dev/null
+++ b/README.md
@@ -0,0 +1,11 @@
+<!-- SPDX-License-Identifier: CC-BY-SA-4.0 -->
+<!-- SPDX-FileCopyrightText: 2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> -->
+
+libgpiod
+========
+
+C library and tools for interacting with the linux GPIO character device.
+
+The project is hosted at https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/.
+
+Documentation is available at https://libgpiod.readthedocs.io/.
diff --git a/docs/bindings.rst b/docs/bindings.rst
index 73f1262..7f0f6b7 100644
--- a/docs/bindings.rst
+++ b/docs/bindings.rst
@@ -10,8 +10,12 @@
 High-level language bindings to libgpiod
 ========================================
 
-The bindings provide a more straightforward interface to the base, low-level
-C library.
+Bindings provide a more straightforward interface to the core, low-level
+C library. Object-oriented bindings for C++, GLib, python3 and Rust are
+provided as part of the project. They can be enabled by passing
+``--enable-bindings-cxx``, ``--enable-bindings-glib``,
+``--enable-bindings-python`` and ``--enable-bindings-rust`` arguments to
+configure respectively.
 
 .. toctree::
    :maxdepth: 1
@@ -20,3 +24,20 @@ C library.
    cpp_api
    python_api
    glib_api
+
+.. warning::
+   There's currently no good way of integrating rust documentation with sphinx.
+   Rust bindings should be documented on https://docs.rs/ but due to a yet
+   unsolved build problem, this is currently not the case. Please refer to the
+   in-source comments for now.
+
+.. note::
+   Rust bindings are available on https://crates.io/ as the ``libgpiod``
+   package.
+   
+.. note::
+   When building the Rust bindings along the C library using make, they will
+   be automatically configured to build against the build results of the
+   C library. Building rust bindings requires cargo to be available on the
+   system.
+
diff --git a/docs/building.rst b/docs/building.rst
new file mode 100644
index 0000000..958c6fb
--- /dev/null
+++ b/docs/building.rst
@@ -0,0 +1,74 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+Downloading, building & installing
+==================================
+
+Downloading
+-----------
+
+Libgpiod is packaged by several linux distributions. You should typically be
+able to install it using your package manager. If you want to build libgpiod
+from sources, the upstream git repository for libgpiod is hosted at
+`kernel.org <https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/>`_.
+together with
+`release tarballs <https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/>`_.
+
+Building
+--------
+
+This is a pretty standard autotools project. The core C library does not have
+any external dependencies other than the standard C library with GNU extensions.
+
+The build system requires the following packages to be installed on the host
+system for the basic build:
+
+  * ``autotools``
+  * ``autoconf-archive``
+  * ``libtool``
+  * ``pkg-config``
+
+.. note::
+   Development files for additional libraries may be required depending on
+   selected options. The configure script will report any missing additional
+   required dependencies.
+
+To build the project (including command-line utilities) run:
+
+.. code-block:: none
+
+   ./autogen.sh --enable-tools=yes
+   make
+
+.. note::
+   The command-line tools optionally depend on libedit for the interactive
+   feature.
+
+The autogen script will execute ``./configure`` and pass all the command-line
+arguments to it.
+
+.. note::
+   If building from release tarballs, the configure script is already provided
+   and there's no need to invoke autogen.sh.
+
+For all configure features, see: ``./configure --help``.
+
+Installing
+----------
+
+To install the project run:
+
+.. code-block:: none
+
+   make install
+
+.. note::
+   The above may require superuser privileges.
+
+This will install libgpiod under the default system paths. If you want to
+install it under non-standard path, pass the ``--prefix=<install path>``
+option to ``configure``.
diff --git a/docs/contributing.rst b/docs/contributing.rst
new file mode 100644
index 0000000..e46d50f
--- /dev/null
+++ b/docs/contributing.rst
@@ -0,0 +1,45 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+   Contribution guide.
+
+Contributing
+============
+
+Contributions are welcome - please send questions, patches and bug reports to
+the `linux-gpio mailing list
+<http://vger.kernel.org/vger-lists.html#linux-gpio>`_
+by e-mailing to ``linux-gpio@vger.kernel.org`` (add the ``[libgpiod]`` prefix
+to the e-mail subject line). Note that the mailing list quietly drops HTML
+formatted e-mail, so be sure to `send plain text
+<https://docs.kernel.org/process/email-clients.html>`_.
+
+Code submissions should stick to the `linux kernel coding style
+<https://docs.kernel.org/process/coding-style.html>`_ and follow the kernel
+`patch submission process
+<https://docs.kernel.org/process/submitting-patches.html>`_ as applied to the
+libgpiod source tree. All shell scripts must pass `shellcheck tests
+<https://www.shellcheck.net/>`_. All files must have a license and copyright
+SPDX headers and the repo is expected to pass the `reuse lint check
+<https://reuse.software/>`_.
+
+The `mailing list archive <https://lore.kernel.org/linux-gpio/>`_ contains all
+the historical mails to the list, and is the place to check to ensure your
+e-mail has been received.
+Search for `"libgpiod"` to filter the list down to relevant messages. Those
+also provide examples of the expected formatting. Allow some time for your
+e-mail to propagate to the list before retrying, particularly if there are no
+e-mails in the list more recent than yours.
+
+There is a `libgpiod github page <https://github.com/brgl/libgpiod>`_
+available for reporting bugs and general discussions and although PRs can be
+submitted and discussed, upstreambound patches need to go through the mailing
+list nevertheless.
+
+.. note::
+   For more information, please refer to the ``CONTRIBUTING.md`` file in the
+   libgpiod source tree.
diff --git a/docs/cpp_api.rst b/docs/cpp_api.rst
index 83a6aa4..4c76b56 100644
--- a/docs/cpp_api.rst
+++ b/docs/cpp_api.rst
@@ -15,6 +15,9 @@ core C API. These bindings make it easier to work with GPIO lines in C++ by
 offering an **object-oriented** approach and **RAII** (Resource Acquisition
 Is Initialization) principles for managing resources.
 
+.. note::
+   C++17 compiler support is required to build the bindings.
+
 .. toctree::
    :maxdepth: 1
    :caption: Contents
diff --git a/docs/dbus.rst b/docs/dbus.rst
index 0dcbb81..98d2cbe 100644
--- a/docs/dbus.rst
+++ b/docs/dbus.rst
@@ -10,11 +10,24 @@
 D-Bus interface
 ===============
 
-The **libgpiod D-Bus API** provides an abstraction for interacting with GPIO
-chips on Linux systems via the D-Bus messaging system. It enables relatively
-efficient, asynchronous control of GPIO lines, offering methods for
+A commonly requested feature for the GPIO character device was state persistence
+after releasing the lines (as a kernel feature) or providing a central authority
+(in user-space) that would be in charge of keeping the lines requested and in a
+certain state (similarily to how the sysfs ABI works). **GPIO D-Bus API** has
+been provided to address this requirement. We define an interface covering the
+majority of the GPIO chardev's functionality and implement it from both the
+server and client sides in the form of the **gpio-manager** daemon and the
+**gpiocli** command-line utility for talking to the manager. It enables
+relatively efficient, asynchronous control of GPIO lines, offering methods for
 configuring, monitoring, and manipulating GPIOs.
 
+.. note::
+   DBus support can be built by passing ``--enable-dbus`` to configure. The
+   daemon is bundled with a systemd unit file and an example configuration file
+   for the ``io.gpiod1`` interface that allows all users to access basic
+   information about the GPIOs in the system but only root to request lines or
+   change their values.
+
 .. toctree::
    :maxdepth: 1
    :caption: Contents
diff --git a/docs/glib_api.rst b/docs/glib_api.rst
index 307f5f7..f6d8665 100644
--- a/docs/glib_api.rst
+++ b/docs/glib_api.rst
@@ -15,6 +15,9 @@ interface to interact with GPIO (General Purpose Input/Output) lines on Linux
 systems. These bindings leverage the **GObject framework**, commonly used in
 GNOME and GTK+ applications, to wrap the lower-level C API of libgpiod.
 
+.. note::
+   GLib bindings require GLib (as well as GObject, GIO and GIO-Unix) v2.80.
+
 .. warning::
    The documentation for GObject bindings is generated using gi-docgen and
    cannot be easily integrated with sphinx documentation. Please navigate to
diff --git a/docs/gpio_tools.rst b/docs/gpio_tools.rst
index 7372de4..e4bf584 100644
--- a/docs/gpio_tools.rst
+++ b/docs/gpio_tools.rst
@@ -10,9 +10,29 @@
 Command-line tools
 ==================
 
+Overview
+--------
+
 The **libgpiod** project includes a suite of **command-line tools** to
 facilitate GPIO manipulation from console and shell scripts.
 
+There are currently six command-line tools available:
+
+* **gpiodetect**: list all gpiochips present on the system, their names, labels
+  and number of GPIO lines
+* **gpioinfo**: list lines, their gpiochip, offset, name, and direction, and if
+  in use then the consumer name and any other configured attributes, such as
+  active state, bias, drive, edge detection and debounce period
+* **gpioget**: read values of specified GPIO lines
+* **gpioset**: set values of specified GPIO lines, holding the lines until the
+  process is killed or otherwise exits
+* **gpiomon**: wait for edge events on GPIO lines, specify which edges to watch
+  for, how many events to process before exiting, or if the events should be
+  reported to the console
+* **gpionotify**: wait for changed to the info for GPIO lines, specify which
+  changes to watch for, how many events to process before exiting, or if the
+  events should be reported to the console
+
 .. toctree::
    :maxdepth: 1
    :caption: Manual entries
@@ -23,3 +43,199 @@ facilitate GPIO manipulation from console and shell scripts.
    gpioset<gpioset>
    gpiomon<gpiomon>
    gpionotify<gpionotify>
+
+Examples
+--------
+
+.. note::
+   The following examples where creating using a Raspberry Pi 4B. The pins
+   will be different on other board.
+
+Detect the available gpiochips:
+
+.. code-block:: none
+
+   $ gpiodetect
+   gpiochip0 [pinctrl-bcm2711] (58 lines)
+   gpiochip1 [raspberrypi-exp-gpio] (8 lines)
+
+Read the info for all the lines on a gpiochip:
+
+.. code-block:: none
+
+   $ gpioinfo -c 1
+   gpiochip1 - 8 lines:
+    line   0: "BT_ON"          output
+    line   1: "WL_ON"          output
+    line   2: "PWR_LED_OFF"    output active-low consumer="led1"
+    line   3: "GLOBAL_RESET"   output
+    line   4: "VDD_SD_IO_SEL"  output consumer="vdd-sd-io"
+    line   5: "CAM_GPIO"       output consumer="cam1_regulator"
+    line   6: "SD_PWR_ON"      output consumer="sd_vcc_reg"
+    line   7: "SD_OC_N"        input
+
+Read the info for particular lines:
+
+.. code-block:: none
+
+   $ ./gpioinfo PWR_LED_OFF STATUS_LED_G_CLK GLOBAL_RESET
+   gpiochip0 42 "STATUS_LED_G_CLK" output consumer="led0"
+   gpiochip1 2 "PWR_LED_OFF"    output active-low consumer="led1"
+   gpiochip1 3 "GLOBAL_RESET"   output
+
+Read the value of a single GPIO line by name:
+
+.. code-block:: none
+
+   $ gpioget RXD1
+   "RXD1"=active
+
+Read the value of a single GPIO line by chip and offset:
+
+.. code-block:: none
+
+   $ gpioget -c 0 15
+   "15"=active
+
+Read the value of a single GPIO line as a numeric value:
+
+.. code-block:: none
+
+   $ gpioget --numeric RXD1
+   1
+
+Read two values at the same time, set the active state of the lines to low and
+without quoted names:
+
+.. code-block:: none
+
+   $ gpioget --active-low --unquoted GPIO23 GPIO24
+   GPIO23=active GPIO24=active
+
+Set the value of a line and hold the line until killed:
+
+.. code-block:: none
+
+   $ gpioset GPIO23=1
+
+Set values of two lines, then daemonize and hold the lines:
+
+.. code-block:: none
+
+   $ gpioset --daemonize GPIO23=1 GPIO24=0
+
+Set the value of a single line, hold it for 20ms, then exit:
+
+.. code-block:: none
+
+   $ gpioset --hold-period 20ms -t0 GPIO23=1
+
+Blink an LED on GPIO22 at 1Hz:
+
+.. code-block:: none
+
+   $ gpioset -t500ms GPIO22=1
+
+Blink an LED on GPIO22 at 1Hz with a 20% duty cycle:
+
+.. code-block:: none
+
+   $ gpioset -t200ms,800ms GPIO22=1
+
+Set some lines interactively (requires ``--enable-gpioset-interactive``):
+
+.. code-block:: none
+
+   $ gpioset --interactive --unquoted GPIO23=inactive GPIO24=active
+   gpioset> get
+   GPIO23=inactive GPIO24=active
+   gpioset> toggle
+   gpioset> get
+   GPIO23=active GPIO24=inactive
+   gpioset> set GPIO24=1
+   gpioset> get
+   GPIO23=active GPIO24=active
+   gpioset> toggle
+   gpioset> get
+   GPIO23=inactive GPIO24=inactive
+   gpioset> toggle GPIO23
+   gpioset> get
+   GPIO23=active GPIO24=inactive
+   gpioset> exit
+
+Wait for three rising edge events on a single GPIO line, then exit:
+
+.. code-block:: none
+
+   $ gpiomon --num-events=3 --edges=rising GPIO22
+   10002.907638045     rising  "GPIO22"
+   10037.132562259     rising  "GPIO22"
+   10047.179790748     rising  "GPIO22"
+
+Wait for three edge events on a single GPIO line, with time in local time and
+with unquoted line name, then exit:
+
+.. code-block:: none
+
+   $ gpiomon --num-events=3 --edges=both --localtime --unquoted GPIO22
+   2022-11-15T10:36:59.109615508       rising  GPIO22
+   2022-11-15T10:36:59.129681898       falling GPIO22
+   2022-11-15T10:36:59.698971886       rising  GPIO22
+
+Wait for falling edge events with a custom output format:
+
+.. code-block:: none
+
+   $ gpiomon --format="%e %c %o %l %S" --edges=falling -c gpiochip0 22
+   2 gpiochip0 22 GPIO22 10946.693481859
+   2 gpiochip0 22 GPIO22 10947.025347604
+   2 gpiochip0 22 GPIO22 10947.283716669
+   2 gpiochip0 22 GPIO22 10947.570109430
+   ...
+
+Block until an edge event occurs, don't print anything:
+
+.. code-block:: none
+
+   $ gpiomon --num-events=1 --quiet GPIO22
+
+Monitor multiple lines, exit after the first edge event:
+
+.. code-block:: none
+
+   $ gpiomon --quiet --num-events=1 GPIO5 GPIO6 GPIO12 GPIO17
+
+Monitor a line for changes to info:
+
+.. code-block:: none
+
+   $ gpionotify GPIO23
+   11571.816473718     requested       "GPIO23"
+   11571.816535124     released        "GPIO23"
+   11572.722894029     requested       "GPIO23"
+   11572.722932843     released        "GPIO23"
+   11573.222998598     requested       "GPIO23"
+   ...
+
+Monitor a line for requests, reporting UTC time and unquoted line name:
+
+.. code-block:: none
+
+   $ gpionotify --utc --unquoted GPIO23
+   2022-11-15T03:05:23.807090687Z      requested       GPIO23
+   2022-11-15T03:05:23.807151390Z      released        GPIO23
+   2022-11-15T03:05:24.784984280Z      requested       GPIO23
+   2022-11-15T03:05:24.785023873Z      released        GPIO23
+   ...
+
+Monitor multiple lines, exit after the first is requested:
+
+.. code-block:: none
+
+   $ gpionotify --quiet --num-events=1 --event=requested GPIO5 GPIO6 GPIO12 GPIO17
+
+Block until a line is released:
+
+.. code-block:: none
+
+   $ gpionotify --quiet --num-events=1 --event=released GPIO6
diff --git a/docs/gpiocli_top.rst b/docs/gpiocli_top.rst
index 52e3295..3b50b91 100644
--- a/docs/gpiocli_top.rst
+++ b/docs/gpiocli_top.rst
@@ -10,6 +10,87 @@
 Command-line client
 ===================
 
+With the manager running the user can run ``gpiocli`` to control GPIOs by
+asking the ``gpio-manager`` to act on their behalf.
+
+Examples
+--------
+
+Detect chips in the system:
+
+.. code-block:: none
+
+   $ gpiocli detect
+   gpiochip0 [INT34C6:00] (463 lines)
+
+Request a set of lines:
+
+.. note::
+   **gpiocli** exits immediately but the state of the lines is retained
+   because it's the **gpio-manager** that requested them.
+
+.. code-block:: none
+
+   $ gpiocli request --output foo=active
+   request0
+
+Previous invocation printed out the name of the request by which the caller
+can refer to it later. All active requests can also be inspected at any time:
+
+.. code-block:: none
+
+   $ gpiocli requests
+   request0 (gpiochip1) Offsets: [5]
+
+
+Print the information about the requested line using the information above:
+
+.. code-block:: none
+
+   $ gpiocli info --chip=gpiochip1 5
+   gpiochip1   5:      "foo"           [used,consumer="gpiocli request",managed="request0",output,push-pull]
+
+Change the value of the line:
+
+.. code-block:: none
+
+   $ gpiocli set foo=inactive
+
+Read it back:
+
+.. code-block:: none
+
+   $ gpiocli get foo
+   "foo"=inactive
+
+We can even reconfigure it to input and enable edge-detection:
+
+.. code-block:: none
+
+   $ gpiocli reconfigure --input --both-edges request0
+
+And wait for edge events:
+
+.. code-block:: none
+
+   $ gpiocli monitor cos
+   21763952894920 rising  "foo"
+
+And finally release the request:
+
+.. code-block:: none
+
+   $ gpiocli release request0
+
+.. note::
+   For more information please refer to the output of ``gpiocli --help`` as
+   well as ``gpiocli <command> --help`` which prints detailed info on every
+   available command.
+
+.. note::
+   Users can talk to **gpio-manager** using any **D-Bus** library available
+   and are not limited to the provided client.
+
 .. toctree::
    :maxdepth: 1
    :caption: Manual entries
diff --git a/docs/index.rst b/docs/index.rst
index 3101e14..8c02c6a 100644
--- a/docs/index.rst
+++ b/docs/index.rst
@@ -14,17 +14,30 @@ The **libgpiod** project provides a low-level C library, bindings to high-level
 languages and tools for interacting with the GPIO (General Purpose Input/Output)
 lines on Linux systems.
 
-It replaces the older, legacy GPIO sysfs interface, which has been deprecated
-in the Linux kernel. The newer GPIO character device interface (introduced in
-Linux kernel version 4.8) provides a more flexible and efficient way to
-interact with GPIO lines, and libgpiod is the primary tool for working with
-this interface.
+It replaces the older, **legacy GPIO sysfs interface**, which has been
+deprecated in the Linux kernel. The newer **GPIO character device** interface
+(introduced in **Linux kernel version 4.8**) provides a more flexible and
+efficient way to interact with GPIO lines, and libgpiod is the **primary tool**
+for working with this interface.
+
+The character device interface guarantees all allocated resources are freed
+after closing the device file descriptor and adds several new features that
+are not present in the obsolete sysfs interface (like reliable event polling,
+setting/reading multiple values at once or open-source and open-drain GPIOs).
+
+Unfortunately interacting with the linux device file can no longer be done
+using only standard command-line tools. This is the reason for creating a
+library encapsulating the cumbersome, ioctl-based kernel-userspace interaction
+in a set of convenient functions and opaque data structures.
 
 .. toctree::
    :maxdepth: 1
    :caption: Contents
 
+   building
    core_api
    bindings
    gpio_tools
    dbus
+   testing
+   contributing
diff --git a/docs/python_api.rst b/docs/python_api.rst
index 00b30cb..2c4f59d 100644
--- a/docs/python_api.rst
+++ b/docs/python_api.rst
@@ -17,6 +17,10 @@ easily through Python scripts, enabling tasks such as reading input values,
 setting outputs, monitoring events, and configuring more fine-grained pin
 options.
 
+.. note::
+   Python bindings require python3 support and libpython development files for
+   building from sources.
+
 .. toctree::
    :maxdepth: 1
    :caption: Contents
@@ -31,3 +35,7 @@ options.
    python_line_settings
    python_line_request
    python_misc
+
+.. note::
+   Python bindings can be installed from https://pypi.org/ with pip by running
+   ``pip install gpiod``.
diff --git a/docs/testing.rst b/docs/testing.rst
new file mode 100644
index 0000000..e645e71
--- /dev/null
+++ b/docs/testing.rst
@@ -0,0 +1,46 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+   Contribution guide.
+
+Testing
+=======
+
+A comprehensive testing framework is included with the library and can be used
+to test both the core library code as well as the kernel-to-user-space
+interface.
+
+The minimum kernel version required to run the tests can be checked in the
+``tests/gpiod-test.c`` source file (it's subject to change if new features are
+added to the kernel). The tests work together with the **gpio-sim** kernel
+module which must either be built-in or available for loading using kmod.
+A helper library - **libgpiosim** - is included to enable straightforward
+interaction with the module.
+
+To build the testing executable add the ``--enable-tests`` option when running
+the configure script. If enabled, the tests will be installed next to
+**gpio-tools**.
+
+As opposed to standard autotools projects, libgpiod doesn't execute any tests
+when invoking ``make check``. Instead the user must run them manually with
+superuser privileges.
+
+The testing framework uses the **GLib unit testing** library so development
+package for GLib must be installed.
+
+The **gpio-tools** programs can be tested separately using the
+``gpio-tools-test.bash`` script. It requires `shunit2
+<https://github.com/kward/shunit2>`_ to run and assumes that the tested
+executables are in the same directory as the script.
+
+C++, Rust and Python bindings also include their own test-suites. All three
+reuse the **libgpiosim** library to avoid code duplication when interacting
+with **gpio-sim**.
+
+Python test-suite uses the standard unittest package. C++ tests use an external
+testing framework - **Catch2** - which must be installed in the system. Rust
+bindings use the standard tests module layout and the ``#[test]`` attribute.

-- 
2.45.2


