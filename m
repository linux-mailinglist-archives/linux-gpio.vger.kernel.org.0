Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4815731D9F3
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Feb 2021 14:05:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232143AbhBQND2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Feb 2021 08:03:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232842AbhBQNDX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Feb 2021 08:03:23 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA1D9C061786
        for <linux-gpio@vger.kernel.org>; Wed, 17 Feb 2021 05:02:41 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id a132so2072322wmc.0
        for <linux-gpio@vger.kernel.org>; Wed, 17 Feb 2021 05:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qd7TVYxXTEMAcQfB5HJiVyJIfUXzA7crSYLFGZ+Gd2Q=;
        b=DYfi0tPTtSE6+65s3ddBkqHUc5AVvQ9AiqX+JEq+AQfAmf3BoehAHEYcRaKBl+3Y9V
         AcghIn66BEA0Jke76zGmi22XCBStkC7T6bTNUb2XoKtahJ88vpO7ahM5YZJZstwxskWZ
         wCXBQF3o6wFxrPzkuuNLwDa3oZTHK4DgxjF1rvERgcxXvUI2bG+5XqFUYSig/F9fhu5C
         YpgTjFXbux7BRwYhYIY1ePNAE9QNCkrMmXhwqZ8LiQw8cmvO794KKq1sZ0oALIi7LYi2
         2OIvWpldW4eLQcfIBDxNd93qdHSweP3Yl9NpXTC9j4jw3T+8RcoX6aXjtEASaL2L4G9c
         Aq5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qd7TVYxXTEMAcQfB5HJiVyJIfUXzA7crSYLFGZ+Gd2Q=;
        b=VhmlwKEv6CBrYWIHvEEAEbgWBd6pR8Pg7kWNJCU1/GDWDec52I+Z+bHSRhk7Foc8p1
         +wA6wHJyNu2Ce1e3Qxd4eWXxThj4rxnAA9IVlPrYAfGAtUnYWEZXOPK0sW13Rpz/0F7v
         bRMsZ8j8j8RrSY94ZK+h7wt4UOT4LMxpiqYQTRZRsvNetHb6SXz1LW9rOQId4B8wITGn
         8jX2B6UHtoP3FZLZQFWYHg/agvH/aPoKCcXR4Jy6gO7AfLctKGW+sd+L6/s3UBO5TqLD
         amqXO3cn10CuiPa4RXn7zLcyYoH1cv8RvJPnKyEgeBY2PbGTU0JYN+5c8gN0MQnbtm0G
         2+7Q==
X-Gm-Message-State: AOAM533GImQ+c4ZkCL0BLRCzaUybHbGJQ2FcRq2NSVSdEwQXnbDG0FeA
        f9PEe8ZgNW21ote5slvOo/q51HyGmnJBYQ==
X-Google-Smtp-Source: ABdhPJwBEVBz6j+BGiD0ICJAoIpHe0HOEr5a6vFPidhQ38sqs9SClAzofEoU37z00mnNKDEZ4Y9Vjg==
X-Received: by 2002:a7b:cbd4:: with SMTP id n20mr6281647wmi.171.1613566956060;
        Wed, 17 Feb 2021 05:02:36 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id w8sm3910789wrm.21.2021.02.17.05.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 05:02:35 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 1/3] licensing: make the project REUSE-compliant
Date:   Wed, 17 Feb 2021 14:02:23 +0100
Message-Id: <20210217130225.6378-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20210217130225.6378-1-brgl@bgdev.pl>
References: <20210217130225.6378-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

In order to make the licensing situation of libgpiod clear and enable
easy reusing of the code, let's make all the files in the repository
compliant with the REUSE v3.0 specification.

In order to achieve that:
  - put all used licenses into a separate LICENSES/ directory
  - add SPDX license identifiers to all files that were missing them with
    regular text files being licensed under CC-BY-SA-4.0, while files
    containing code and configuration are licensed under GPL-2.0-or-later
  - replace custom copyright texts with SPDX-FileCopyrightText
  - update the gpio.h kernel uAPI header with the upstream version where
    the SDPX license identifier was fixed to use 'GPL-2.0-only' variant
    instead of the deprecated 'GPL-2.0'

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .gitignore                                 |   3 +
 COPYING                                    | 511 +--------------------
 Doxyfile.in                                |   9 +-
 LICENSES/CC-BY-SA-4.0.txt                  | 427 +++++++++++++++++
 LICENSES/GPL-2.0-only.txt                  | 339 ++++++++++++++
 LICENSES/GPL-2.0-or-later.txt              |   1 +
 LICENSES/LGPL-2.1-or-later.txt             | 502 ++++++++++++++++++++
 LICENSES/Linux-syscall-note.txt            |  25 +
 Makefile.am                                |  15 +-
 NEWS                                       |   3 +
 README                                     |   3 +
 TODO                                       |   3 +
 autogen.sh                                 |   9 +-
 bindings/Makefile.am                       |   7 +-
 bindings/cxx/Makefile.am                   |   7 +-
 bindings/cxx/chip.cpp                      |   6 +-
 bindings/cxx/examples/.gitignore           |   3 +
 bindings/cxx/examples/Makefile.am          |   7 +-
 bindings/cxx/examples/gpiodetectcxx.cpp    |   6 +-
 bindings/cxx/examples/gpiofindcxx.cpp      |   6 +-
 bindings/cxx/examples/gpiogetcxx.cpp       |   6 +-
 bindings/cxx/examples/gpioinfocxx.cpp      |   6 +-
 bindings/cxx/examples/gpiomoncxx.cpp       |   6 +-
 bindings/cxx/examples/gpiosetcxx.cpp       |   6 +-
 bindings/cxx/gpiod.hpp                     |   6 +-
 bindings/cxx/iter.cpp                      |   6 +-
 bindings/cxx/libgpiodcxx.pc.in             |   3 +
 bindings/cxx/line.cpp                      |   8 +-
 bindings/cxx/line_bulk.cpp                 |   6 +-
 bindings/cxx/tests/.gitignore              |   3 +
 bindings/cxx/tests/Makefile.am             |   7 +-
 bindings/cxx/tests/gpio-mockup.cpp         |   8 +-
 bindings/cxx/tests/gpio-mockup.hpp         |   6 +-
 bindings/cxx/tests/gpiod-cxx-test-main.cpp |   8 +-
 bindings/cxx/tests/gpiod-cxx-test.cpp      |   8 +-
 bindings/cxx/tests/tests-chip.cpp          |   8 +-
 bindings/cxx/tests/tests-event.cpp         |   8 +-
 bindings/cxx/tests/tests-iter.cpp          |   8 +-
 bindings/cxx/tests/tests-line.cpp          |   8 +-
 bindings/python/Makefile.am                |   7 +-
 bindings/python/examples/Makefile.am       |   7 +-
 bindings/python/examples/gpiodetect.py     |   7 +-
 bindings/python/examples/gpiofind.py       |   7 +-
 bindings/python/examples/gpioget.py        |   7 +-
 bindings/python/examples/gpioinfo.py       |   7 +-
 bindings/python/examples/gpiomon.py        |   7 +-
 bindings/python/examples/gpioset.py        |   7 +-
 bindings/python/gpiodmodule.c              |   6 +-
 bindings/python/tests/Makefile.am          |   7 +-
 bindings/python/tests/gpiod_py_test.py     |   7 +-
 bindings/python/tests/gpiomockupmodule.c   |   6 +-
 configure.ac                               |   7 +-
 include/Makefile.am                        |   7 +-
 include/gpiod.h                            |   6 +-
 lib/Makefile.am                            |   7 +-
 lib/core.c                                 |   6 +-
 lib/helpers.c                              |   6 +-
 lib/libgpiod.pc.in                         |   4 +
 lib/misc.c                                 |   6 +-
 lib/uapi/gpio.h                            |  22 +-
 man/.gitignore                             |   3 +
 man/Makefile.am                            |   7 +-
 man/template                               |   3 +
 tests/.gitignore                           |   3 +
 tests/Makefile.am                          |   7 +-
 tests/gpiod-test.c                         |   6 +-
 tests/gpiod-test.h                         |   6 +-
 tests/mockup/Makefile.am                   |   7 +-
 tests/mockup/gpio-mockup.c                 |   8 +-
 tests/mockup/gpio-mockup.h                 |   6 +-
 tests/tests-bulk.c                         |   6 +-
 tests/tests-chip.c                         |   6 +-
 tests/tests-event.c                        |   6 +-
 tests/tests-line.c                         |   6 +-
 tests/tests-misc.c                         |   6 +-
 tools/.gitignore                           |   3 +
 tools/Makefile.am                          |   7 +-
 tools/gpio-tools-test                      |   7 +-
 tools/gpio-tools-test.bats                 |   7 +-
 tools/gpiodetect.c                         |   6 +-
 tools/gpiofind.c                           |   6 +-
 tools/gpioget.c                            |   6 +-
 tools/gpioinfo.c                           |   6 +-
 tools/gpiomon.c                            |   6 +-
 tools/gpioset.c                            |   6 +-
 tools/tools-common.c                       |   8 +-
 tools/tools-common.h                       |   6 +-
 87 files changed, 1445 insertions(+), 885 deletions(-)
 create mode 100644 LICENSES/CC-BY-SA-4.0.txt
 create mode 100644 LICENSES/GPL-2.0-only.txt
 create mode 120000 LICENSES/GPL-2.0-or-later.txt
 create mode 100644 LICENSES/LGPL-2.1-or-later.txt
 create mode 100644 LICENSES/Linux-syscall-note.txt

diff --git a/.gitignore b/.gitignore
index a77efde..2d7cc7f 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,3 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+
 *.o
 *.lo
 *.la
diff --git a/COPYING b/COPYING
index 5522aa5..aa85945 100644
--- a/COPYING
+++ b/COPYING
@@ -1,508 +1,23 @@
+libgpiod is provided under:
 
-                  GNU LESSER GENERAL PUBLIC LICENSE
-                       Version 2.1, February 1999
+    SPDX-License-Identifier: LGPL-2.1-or-later
 
- Copyright (C) 1991, 1999 Free Software Foundation, Inc.
-	51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
- Everyone is permitted to copy and distribute verbatim copies
- of this license document, but changing it is not allowed.
+Being under the terms of the GNU Lesser General Public License version 2.1
+or any later version according with:
 
-[This is the first released version of the Lesser GPL.  It also counts
- as the successor of the GNU Library Public License, version 2, hence
- the version number 2.1.]
+    LICENSES/LGPL-2.1.txt
 
-                            Preamble
+The Linux Kernel uAPI headers are provided under:
 
-  The licenses for most software are designed to take away your
-freedom to share and change it.  By contrast, the GNU General Public
-Licenses are intended to guarantee your freedom to share and change
-free software--to make sure the software is free for all its users.
+    SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note
 
-  This license, the Lesser General Public License, applies to some
-specially designated software packages--typically libraries--of the
-Free Software Foundation and other authors who decide to use it.  You
-can use it too, but we suggest you first think carefully about whether
-this license or the ordinary General Public License is the better
-strategy to use in any particular case, based on the explanations
-below.
+Being under the terms of the GNU General Public License version 2 only,
+according with:
 
-  When we speak of free software, we are referring to freedom of use,
-not price.  Our General Public Licenses are designed to make sure that
-you have the freedom to distribute copies of free software (and charge
-for this service if you wish); that you receive source code or can get
-it if you want it; that you can change the software and use pieces of
-it in new free programs; and that you are informed that you can do
-these things.
+    LICENSES/GPL-2.0.txt
 
-  To protect your rights, we need to make restrictions that forbid
-distributors to deny you these rights or to ask you to surrender these
-rights.  These restrictions translate to certain responsibilities for
-you if you distribute copies of the library or if you modify it.
+With an explicit syscall exception, as stated at:
 
-  For example, if you distribute copies of the library, whether gratis
-or for a fee, you must give the recipients all the rights that we gave
-you.  You must make sure that they, too, receive or can get the source
-code.  If you link other code with the library, you must provide
-complete object files to the recipients, so that they can relink them
-with the library after making changes to the library and recompiling
-it.  And you must show them these terms so they know their rights.
+    LICENSES/Linux-syscall-note.txt
 
-  We protect your rights with a two-step method: (1) we copyright the
-library, and (2) we offer you this license, which gives you legal
-permission to copy, distribute and/or modify the library.
-
-  To protect each distributor, we want to make it very clear that
-there is no warranty for the free library.  Also, if the library is
-modified by someone else and passed on, the recipients should know
-that what they have is not the original version, so that the original
-author's reputation will not be affected by problems that might be
-introduced by others.
-
-  Finally, software patents pose a constant threat to the existence of
-any free program.  We wish to make sure that a company cannot
-effectively restrict the users of a free program by obtaining a
-restrictive license from a patent holder.  Therefore, we insist that
-any patent license obtained for a version of the library must be
-consistent with the full freedom of use specified in this license.
-
-  Most GNU software, including some libraries, is covered by the
-ordinary GNU General Public License.  This license, the GNU Lesser
-General Public License, applies to certain designated libraries, and
-is quite different from the ordinary General Public License.  We use
-this license for certain libraries in order to permit linking those
-libraries into non-free programs.
-
-  When a program is linked with a library, whether statically or using
-a shared library, the combination of the two is legally speaking a
-combined work, a derivative of the original library.  The ordinary
-General Public License therefore permits such linking only if the
-entire combination fits its criteria of freedom.  The Lesser General
-Public License permits more lax criteria for linking other code with
-the library.
-
-  We call this license the "Lesser" General Public License because it
-does Less to protect the user's freedom than the ordinary General
-Public License.  It also provides other free software developers Less
-of an advantage over competing non-free programs.  These disadvantages
-are the reason we use the ordinary General Public License for many
-libraries.  However, the Lesser license provides advantages in certain
-special circumstances.
-
-  For example, on rare occasions, there may be a special need to
-encourage the widest possible use of a certain library, so that it
-becomes a de-facto standard.  To achieve this, non-free programs must
-be allowed to use the library.  A more frequent case is that a free
-library does the same job as widely used non-free libraries.  In this
-case, there is little to gain by limiting the free library to free
-software only, so we use the Lesser General Public License.
-
-  In other cases, permission to use a particular library in non-free
-programs enables a greater number of people to use a large body of
-free software.  For example, permission to use the GNU C Library in
-non-free programs enables many more people to use the whole GNU
-operating system, as well as its variant, the GNU/Linux operating
-system.
-
-  Although the Lesser General Public License is Less protective of the
-users' freedom, it does ensure that the user of a program that is
-linked with the Library has the freedom and the wherewithal to run
-that program using a modified version of the Library.
-
-  The precise terms and conditions for copying, distribution and
-modification follow.  Pay close attention to the difference between a
-"work based on the library" and a "work that uses the library".  The
-former contains code derived from the library, whereas the latter must
-be combined with the library in order to run.
-
-                  GNU LESSER GENERAL PUBLIC LICENSE
-   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
-
-  0. This License Agreement applies to any software library or other
-program which contains a notice placed by the copyright holder or
-other authorized party saying it may be distributed under the terms of
-this Lesser General Public License (also called "this License").
-Each licensee is addressed as "you".
-
-  A "library" means a collection of software functions and/or data
-prepared so as to be conveniently linked with application programs
-(which use some of those functions and data) to form executables.
-
-  The "Library", below, refers to any such software library or work
-which has been distributed under these terms.  A "work based on the
-Library" means either the Library or any derivative work under
-copyright law: that is to say, a work containing the Library or a
-portion of it, either verbatim or with modifications and/or translated
-straightforwardly into another language.  (Hereinafter, translation is
-included without limitation in the term "modification".)
-
-  "Source code" for a work means the preferred form of the work for
-making modifications to it.  For a library, complete source code means
-all the source code for all modules it contains, plus any associated
-interface definition files, plus the scripts used to control
-compilation and installation of the library.
-
-  Activities other than copying, distribution and modification are not
-covered by this License; they are outside its scope.  The act of
-running a program using the Library is not restricted, and output from
-such a program is covered only if its contents constitute a work based
-on the Library (independent of the use of the Library in a tool for
-writing it).  Whether that is true depends on what the Library does
-and what the program that uses the Library does.
-
-  1. You may copy and distribute verbatim copies of the Library's
-complete source code as you receive it, in any medium, provided that
-you conspicuously and appropriately publish on each copy an
-appropriate copyright notice and disclaimer of warranty; keep intact
-all the notices that refer to this License and to the absence of any
-warranty; and distribute a copy of this License along with the
-Library.
-
-  You may charge a fee for the physical act of transferring a copy,
-and you may at your option offer warranty protection in exchange for a
-fee.
-
-  2. You may modify your copy or copies of the Library or any portion
-of it, thus forming a work based on the Library, and copy and
-distribute such modifications or work under the terms of Section 1
-above, provided that you also meet all of these conditions:
-
-    a) The modified work must itself be a software library.
-
-    b) You must cause the files modified to carry prominent notices
-    stating that you changed the files and the date of any change.
-
-    c) You must cause the whole of the work to be licensed at no
-    charge to all third parties under the terms of this License.
-
-    d) If a facility in the modified Library refers to a function or a
-    table of data to be supplied by an application program that uses
-    the facility, other than as an argument passed when the facility
-    is invoked, then you must make a good faith effort to ensure that,
-    in the event an application does not supply such function or
-    table, the facility still operates, and performs whatever part of
-    its purpose remains meaningful.
-
-    (For example, a function in a library to compute square roots has
-    a purpose that is entirely well-defined independent of the
-    application.  Therefore, Subsection 2d requires that any
-    application-supplied function or table used by this function must
-    be optional: if the application does not supply it, the square
-    root function must still compute square roots.)
-
-These requirements apply to the modified work as a whole.  If
-identifiable sections of that work are not derived from the Library,
-and can be reasonably considered independent and separate works in
-themselves, then this License, and its terms, do not apply to those
-sections when you distribute them as separate works.  But when you
-distribute the same sections as part of a whole which is a work based
-on the Library, the distribution of the whole must be on the terms of
-this License, whose permissions for other licensees extend to the
-entire whole, and thus to each and every part regardless of who wrote
-it.
-
-Thus, it is not the intent of this section to claim rights or contest
-your rights to work written entirely by you; rather, the intent is to
-exercise the right to control the distribution of derivative or
-collective works based on the Library.
-
-In addition, mere aggregation of another work not based on the Library
-with the Library (or with a work based on the Library) on a volume of
-a storage or distribution medium does not bring the other work under
-the scope of this License.
-
-  3. You may opt to apply the terms of the ordinary GNU General Public
-License instead of this License to a given copy of the Library.  To do
-this, you must alter all the notices that refer to this License, so
-that they refer to the ordinary GNU General Public License, version 2,
-instead of to this License.  (If a newer version than version 2 of the
-ordinary GNU General Public License has appeared, then you can specify
-that version instead if you wish.)  Do not make any other change in
-these notices.
-
-  Once this change is made in a given copy, it is irreversible for
-that copy, so the ordinary GNU General Public License applies to all
-subsequent copies and derivative works made from that copy.
-
-  This option is useful when you wish to copy part of the code of
-the Library into a program that is not a library.
-
-  4. You may copy and distribute the Library (or a portion or
-derivative of it, under Section 2) in object code or executable form
-under the terms of Sections 1 and 2 above provided that you accompany
-it with the complete corresponding machine-readable source code, which
-must be distributed under the terms of Sections 1 and 2 above on a
-medium customarily used for software interchange.
-
-  If distribution of object code is made by offering access to copy
-from a designated place, then offering equivalent access to copy the
-source code from the same place satisfies the requirement to
-distribute the source code, even though third parties are not
-compelled to copy the source along with the object code.
-
-  5. A program that contains no derivative of any portion of the
-Library, but is designed to work with the Library by being compiled or
-linked with it, is called a "work that uses the Library".  Such a
-work, in isolation, is not a derivative work of the Library, and
-therefore falls outside the scope of this License.
-
-  However, linking a "work that uses the Library" with the Library
-creates an executable that is a derivative of the Library (because it
-contains portions of the Library), rather than a "work that uses the
-library".  The executable is therefore covered by this License.
-Section 6 states terms for distribution of such executables.
-
-  When a "work that uses the Library" uses material from a header file
-that is part of the Library, the object code for the work may be a
-derivative work of the Library even though the source code is not.
-Whether this is true is especially significant if the work can be
-linked without the Library, or if the work is itself a library.  The
-threshold for this to be true is not precisely defined by law.
-
-  If such an object file uses only numerical parameters, data
-structure layouts and accessors, and small macros and small inline
-functions (ten lines or less in length), then the use of the object
-file is unrestricted, regardless of whether it is legally a derivative
-work.  (Executables containing this object code plus portions of the
-Library will still fall under Section 6.)
-
-  Otherwise, if the work is a derivative of the Library, you may
-distribute the object code for the work under the terms of Section 6.
-Any executables containing that work also fall under Section 6,
-whether or not they are linked directly with the Library itself.
-
-  6. As an exception to the Sections above, you may also combine or
-link a "work that uses the Library" with the Library to produce a
-work containing portions of the Library, and distribute that work
-under terms of your choice, provided that the terms permit
-modification of the work for the customer's own use and reverse
-engineering for debugging such modifications.
-
-  You must give prominent notice with each copy of the work that the
-Library is used in it and that the Library and its use are covered by
-this License.  You must supply a copy of this License.  If the work
-during execution displays copyright notices, you must include the
-copyright notice for the Library among them, as well as a reference
-directing the user to the copy of this License.  Also, you must do one
-of these things:
-
-    a) Accompany the work with the complete corresponding
-    machine-readable source code for the Library including whatever
-    changes were used in the work (which must be distributed under
-    Sections 1 and 2 above); and, if the work is an executable linked
-    with the Library, with the complete machine-readable "work that
-    uses the Library", as object code and/or source code, so that the
-    user can modify the Library and then relink to produce a modified
-    executable containing the modified Library.  (It is understood
-    that the user who changes the contents of definitions files in the
-    Library will not necessarily be able to recompile the application
-    to use the modified definitions.)
-
-    b) Use a suitable shared library mechanism for linking with the
-    Library.  A suitable mechanism is one that (1) uses at run time a
-    copy of the library already present on the user's computer system,
-    rather than copying library functions into the executable, and (2)
-    will operate properly with a modified version of the library, if
-    the user installs one, as long as the modified version is
-    interface-compatible with the version that the work was made with.
-
-    c) Accompany the work with a written offer, valid for at least
-    three years, to give the same user the materials specified in
-    Subsection 6a, above, for a charge no more than the cost of
-    performing this distribution.
-
-    d) If distribution of the work is made by offering access to copy
-    from a designated place, offer equivalent access to copy the above
-    specified materials from the same place.
-
-    e) Verify that the user has already received a copy of these
-    materials or that you have already sent this user a copy.
-
-  For an executable, the required form of the "work that uses the
-Library" must include any data and utility programs needed for
-reproducing the executable from it.  However, as a special exception,
-the materials to be distributed need not include anything that is
-normally distributed (in either source or binary form) with the major
-components (compiler, kernel, and so on) of the operating system on
-which the executable runs, unless that component itself accompanies
-the executable.
-
-  It may happen that this requirement contradicts the license
-restrictions of other proprietary libraries that do not normally
-accompany the operating system.  Such a contradiction means you cannot
-use both them and the Library together in an executable that you
-distribute.
-
-  7. You may place library facilities that are a work based on the
-Library side-by-side in a single library together with other library
-facilities not covered by this License, and distribute such a combined
-library, provided that the separate distribution of the work based on
-the Library and of the other library facilities is otherwise
-permitted, and provided that you do these two things:
-
-    a) Accompany the combined library with a copy of the same work
-    based on the Library, uncombined with any other library
-    facilities.  This must be distributed under the terms of the
-    Sections above.
-
-    b) Give prominent notice with the combined library of the fact
-    that part of it is a work based on the Library, and explaining
-    where to find the accompanying uncombined form of the same work.
-
-  8. You may not copy, modify, sublicense, link with, or distribute
-the Library except as expressly provided under this License.  Any
-attempt otherwise to copy, modify, sublicense, link with, or
-distribute the Library is void, and will automatically terminate your
-rights under this License.  However, parties who have received copies,
-or rights, from you under this License will not have their licenses
-terminated so long as such parties remain in full compliance.
-
-  9. You are not required to accept this License, since you have not
-signed it.  However, nothing else grants you permission to modify or
-distribute the Library or its derivative works.  These actions are
-prohibited by law if you do not accept this License.  Therefore, by
-modifying or distributing the Library (or any work based on the
-Library), you indicate your acceptance of this License to do so, and
-all its terms and conditions for copying, distributing or modifying
-the Library or works based on it.
-
-  10. Each time you redistribute the Library (or any work based on the
-Library), the recipient automatically receives a license from the
-original licensor to copy, distribute, link with or modify the Library
-subject to these terms and conditions.  You may not impose any further
-restrictions on the recipients' exercise of the rights granted herein.
-You are not responsible for enforcing compliance by third parties with
-this License.
-
-  11. If, as a consequence of a court judgment or allegation of patent
-infringement or for any other reason (not limited to patent issues),
-conditions are imposed on you (whether by court order, agreement or
-otherwise) that contradict the conditions of this License, they do not
-excuse you from the conditions of this License.  If you cannot
-distribute so as to satisfy simultaneously your obligations under this
-License and any other pertinent obligations, then as a consequence you
-may not distribute the Library at all.  For example, if a patent
-license would not permit royalty-free redistribution of the Library by
-all those who receive copies directly or indirectly through you, then
-the only way you could satisfy both it and this License would be to
-refrain entirely from distribution of the Library.
-
-If any portion of this section is held invalid or unenforceable under
-any particular circumstance, the balance of the section is intended to
-apply, and the section as a whole is intended to apply in other
-circumstances.
-
-It is not the purpose of this section to induce you to infringe any
-patents or other property right claims or to contest validity of any
-such claims; this section has the sole purpose of protecting the
-integrity of the free software distribution system which is
-implemented by public license practices.  Many people have made
-generous contributions to the wide range of software distributed
-through that system in reliance on consistent application of that
-system; it is up to the author/donor to decide if he or she is willing
-to distribute software through any other system and a licensee cannot
-impose that choice.
-
-This section is intended to make thoroughly clear what is believed to
-be a consequence of the rest of this License.
-
-  12. If the distribution and/or use of the Library is restricted in
-certain countries either by patents or by copyrighted interfaces, the
-original copyright holder who places the Library under this License
-may add an explicit geographical distribution limitation excluding those
-countries, so that distribution is permitted only in or among
-countries not thus excluded.  In such case, this License incorporates
-the limitation as if written in the body of this License.
-
-  13. The Free Software Foundation may publish revised and/or new
-versions of the Lesser General Public License from time to time.
-Such new versions will be similar in spirit to the present version,
-but may differ in detail to address new problems or concerns.
-
-Each version is given a distinguishing version number.  If the Library
-specifies a version number of this License which applies to it and
-"any later version", you have the option of following the terms and
-conditions either of that version or of any later version published by
-the Free Software Foundation.  If the Library does not specify a
-license version number, you may choose any version ever published by
-the Free Software Foundation.
-
-  14. If you wish to incorporate parts of the Library into other free
-programs whose distribution conditions are incompatible with these,
-write to the author to ask for permission.  For software which is
-copyrighted by the Free Software Foundation, write to the Free
-Software Foundation; we sometimes make exceptions for this.  Our
-decision will be guided by the two goals of preserving the free status
-of all derivatives of our free software and of promoting the sharing
-and reuse of software generally.
-
-                            NO WARRANTY
-
-  15. BECAUSE THE LIBRARY IS LICENSED FREE OF CHARGE, THERE IS NO
-WARRANTY FOR THE LIBRARY, TO THE EXTENT PERMITTED BY APPLICABLE LAW.
-EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR
-OTHER PARTIES PROVIDE THE LIBRARY "AS IS" WITHOUT WARRANTY OF ANY
-KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE
-IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-PURPOSE.  THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE
-LIBRARY IS WITH YOU.  SHOULD THE LIBRARY PROVE DEFECTIVE, YOU ASSUME
-THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
-
-  16. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN
-WRITING WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY
-AND/OR REDISTRIBUTE THE LIBRARY AS PERMITTED ABOVE, BE LIABLE TO YOU
-FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR
-CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE THE
-LIBRARY (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
-RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
-FAILURE OF THE LIBRARY TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
-SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH
-DAMAGES.
-
-                     END OF TERMS AND CONDITIONS
-
-           How to Apply These Terms to Your New Libraries
-
-  If you develop a new library, and you want it to be of the greatest
-possible use to the public, we recommend making it free software that
-everyone can redistribute and change.  You can do so by permitting
-redistribution under these terms (or, alternatively, under the terms
-of the ordinary General Public License).
-
-  To apply these terms, attach the following notices to the library.
-It is safest to attach them to the start of each source file to most
-effectively convey the exclusion of warranty; and each file should
-have at least the "copyright" line and a pointer to where the full
-notice is found.
-
-
-    <one line to give the library's name and a brief idea of what it does.>
-    Copyright (C) <year>  <name of author>
-
-    This library is free software; you can redistribute it and/or
-    modify it under the terms of the GNU Lesser General Public
-    License as published by the Free Software Foundation; either
-    version 2.1 of the License, or (at your option) any later version.
-
-    This library is distributed in the hope that it will be useful,
-    but WITHOUT ANY WARRANTY; without even the implied warranty of
-    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-    Lesser General Public License for more details.
-
-    You should have received a copy of the GNU Lesser General Public
-    License along with this library; if not, write to the Free Software
-    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
-
-Also add information on how to contact you by electronic and paper mail.
-
-You should also get your employer (if you work as a programmer) or
-your school, if any, to sign a "copyright disclaimer" for the library,
-if necessary.  Here is a sample; alter the names:
-
-  Yoyodyne, Inc., hereby disclaims all copyright interest in the
-  library `Frob' (a library for tweaking knobs) written by James
-  Random Hacker.
-
-  <signature of Ty Coon>, 1 April 1990
-  Ty Coon, President of Vice
-
-That's all there is to it!
+All contributions to libgpiod are subject to this COPYING file.
diff --git a/Doxyfile.in b/Doxyfile.in
index be2d250..22d4721 100644
--- a/Doxyfile.in
+++ b/Doxyfile.in
@@ -1,10 +1,5 @@
-# SPDX-License-Identifier: LGPL-2.1-or-later
-
-#
-# This file is part of libgpiod.
-#
-# Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
-#
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 # libgpiod doxygen configuration
 
diff --git a/LICENSES/CC-BY-SA-4.0.txt b/LICENSES/CC-BY-SA-4.0.txt
new file mode 100644
index 0000000..3b7b82d
--- /dev/null
+++ b/LICENSES/CC-BY-SA-4.0.txt
@@ -0,0 +1,427 @@
+Attribution-ShareAlike 4.0 International
+
+=======================================================================
+
+Creative Commons Corporation ("Creative Commons") is not a law firm and
+does not provide legal services or legal advice. Distribution of
+Creative Commons public licenses does not create a lawyer-client or
+other relationship. Creative Commons makes its licenses and related
+information available on an "as-is" basis. Creative Commons gives no
+warranties regarding its licenses, any material licensed under their
+terms and conditions, or any related information. Creative Commons
+disclaims all liability for damages resulting from their use to the
+fullest extent possible.
+
+Using Creative Commons Public Licenses
+
+Creative Commons public licenses provide a standard set of terms and
+conditions that creators and other rights holders may use to share
+original works of authorship and other material subject to copyright
+and certain other rights specified in the public license below. The
+following considerations are for informational purposes only, are not
+exhaustive, and do not form part of our licenses.
+
+     Considerations for licensors: Our public licenses are
+     intended for use by those authorized to give the public
+     permission to use material in ways otherwise restricted by
+     copyright and certain other rights. Our licenses are
+     irrevocable. Licensors should read and understand the terms
+     and conditions of the license they choose before applying it.
+     Licensors should also secure all rights necessary before
+     applying our licenses so that the public can reuse the
+     material as expected. Licensors should clearly mark any
+     material not subject to the license. This includes other CC-
+     licensed material, or material used under an exception or
+     limitation to copyright. More considerations for licensors:
+	wiki.creativecommons.org/Considerations_for_licensors
+
+     Considerations for the public: By using one of our public
+     licenses, a licensor grants the public permission to use the
+     licensed material under specified terms and conditions. If
+     the licensor's permission is not necessary for any reason--for
+     example, because of any applicable exception or limitation to
+     copyright--then that use is not regulated by the license. Our
+     licenses grant only permissions under copyright and certain
+     other rights that a licensor has authority to grant. Use of
+     the licensed material may still be restricted for other
+     reasons, including because others have copyright or other
+     rights in the material. A licensor may make special requests,
+     such as asking that all changes be marked or described.
+     Although not required by our licenses, you are encouraged to
+     respect those requests where reasonable. More_considerations
+     for the public:
+	wiki.creativecommons.org/Considerations_for_licensees
+
+=======================================================================
+
+Creative Commons Attribution-ShareAlike 4.0 International Public
+License
+
+By exercising the Licensed Rights (defined below), You accept and agree
+to be bound by the terms and conditions of this Creative Commons
+Attribution-ShareAlike 4.0 International Public License ("Public
+License"). To the extent this Public License may be interpreted as a
+contract, You are granted the Licensed Rights in consideration of Your
+acceptance of these terms and conditions, and the Licensor grants You
+such rights in consideration of benefits the Licensor receives from
+making the Licensed Material available under these terms and
+conditions.
+
+
+Section 1 -- Definitions.
+
+  a. Adapted Material means material subject to Copyright and Similar
+     Rights that is derived from or based upon the Licensed Material
+     and in which the Licensed Material is translated, altered,
+     arranged, transformed, or otherwise modified in a manner requiring
+     permission under the Copyright and Similar Rights held by the
+     Licensor. For purposes of this Public License, where the Licensed
+     Material is a musical work, performance, or sound recording,
+     Adapted Material is always produced where the Licensed Material is
+     synched in timed relation with a moving image.
+
+  b. Adapter's License means the license You apply to Your Copyright
+     and Similar Rights in Your contributions to Adapted Material in
+     accordance with the terms and conditions of this Public License.
+
+  c. BY-SA Compatible License means a license listed at
+     creativecommons.org/compatiblelicenses, approved by Creative
+     Commons as essentially the equivalent of this Public License.
+
+  d. Copyright and Similar Rights means copyright and/or similar rights
+     closely related to copyright including, without limitation,
+     performance, broadcast, sound recording, and Sui Generis Database
+     Rights, without regard to how the rights are labeled or
+     categorized. For purposes of this Public License, the rights
+     specified in Section 2(b)(1)-(2) are not Copyright and Similar
+     Rights.
+
+  e. Effective Technological Measures means those measures that, in the
+     absence of proper authority, may not be circumvented under laws
+     fulfilling obligations under Article 11 of the WIPO Copyright
+     Treaty adopted on December 20, 1996, and/or similar international
+     agreements.
+
+  f. Exceptions and Limitations means fair use, fair dealing, and/or
+     any other exception or limitation to Copyright and Similar Rights
+     that applies to Your use of the Licensed Material.
+
+  g. License Elements means the license attributes listed in the name
+     of a Creative Commons Public License. The License Elements of this
+     Public License are Attribution and ShareAlike.
+
+  h. Licensed Material means the artistic or literary work, database,
+     or other material to which the Licensor applied this Public
+     License.
+
+  i. Licensed Rights means the rights granted to You subject to the
+     terms and conditions of this Public License, which are limited to
+     all Copyright and Similar Rights that apply to Your use of the
+     Licensed Material and that the Licensor has authority to license.
+
+  j. Licensor means the individual(s) or entity(ies) granting rights
+     under this Public License.
+
+  k. Share means to provide material to the public by any means or
+     process that requires permission under the Licensed Rights, such
+     as reproduction, public display, public performance, distribution,
+     dissemination, communication, or importation, and to make material
+     available to the public including in ways that members of the
+     public may access the material from a place and at a time
+     individually chosen by them.
+
+  l. Sui Generis Database Rights means rights other than copyright
+     resulting from Directive 96/9/EC of the European Parliament and of
+     the Council of 11 March 1996 on the legal protection of databases,
+     as amended and/or succeeded, as well as other essentially
+     equivalent rights anywhere in the world.
+
+  m. You means the individual or entity exercising the Licensed Rights
+     under this Public License. Your has a corresponding meaning.
+
+
+Section 2 -- Scope.
+
+  a. License grant.
+
+       1. Subject to the terms and conditions of this Public License,
+          the Licensor hereby grants You a worldwide, royalty-free,
+          non-sublicensable, non-exclusive, irrevocable license to
+          exercise the Licensed Rights in the Licensed Material to:
+
+            a. reproduce and Share the Licensed Material, in whole or
+               in part; and
+
+            b. produce, reproduce, and Share Adapted Material.
+
+       2. Exceptions and Limitations. For the avoidance of doubt, where
+          Exceptions and Limitations apply to Your use, this Public
+          License does not apply, and You do not need to comply with
+          its terms and conditions.
+
+       3. Term. The term of this Public License is specified in Section
+          6(a).
+
+       4. Media and formats; technical modifications allowed. The
+          Licensor authorizes You to exercise the Licensed Rights in
+          all media and formats whether now known or hereafter created,
+          and to make technical modifications necessary to do so. The
+          Licensor waives and/or agrees not to assert any right or
+          authority to forbid You from making technical modifications
+          necessary to exercise the Licensed Rights, including
+          technical modifications necessary to circumvent Effective
+          Technological Measures. For purposes of this Public License,
+          simply making modifications authorized by this Section 2(a)
+          (4) never produces Adapted Material.
+
+       5. Downstream recipients.
+
+            a. Offer from the Licensor -- Licensed Material. Every
+               recipient of the Licensed Material automatically
+               receives an offer from the Licensor to exercise the
+               Licensed Rights under the terms and conditions of this
+               Public License.
+
+            b. Additional offer from the Licensor -- Adapted Material.
+               Every recipient of Adapted Material from You
+               automatically receives an offer from the Licensor to
+               exercise the Licensed Rights in the Adapted Material
+               under the conditions of the Adapter's License You apply.
+
+            c. No downstream restrictions. You may not offer or impose
+               any additional or different terms or conditions on, or
+               apply any Effective Technological Measures to, the
+               Licensed Material if doing so restricts exercise of the
+               Licensed Rights by any recipient of the Licensed
+               Material.
+
+       6. No endorsement. Nothing in this Public License constitutes or
+          may be construed as permission to assert or imply that You
+          are, or that Your use of the Licensed Material is, connected
+          with, or sponsored, endorsed, or granted official status by,
+          the Licensor or others designated to receive attribution as
+          provided in Section 3(a)(1)(A)(i).
+
+  b. Other rights.
+
+       1. Moral rights, such as the right of integrity, are not
+          licensed under this Public License, nor are publicity,
+          privacy, and/or other similar personality rights; however, to
+          the extent possible, the Licensor waives and/or agrees not to
+          assert any such rights held by the Licensor to the limited
+          extent necessary to allow You to exercise the Licensed
+          Rights, but not otherwise.
+
+       2. Patent and trademark rights are not licensed under this
+          Public License.
+
+       3. To the extent possible, the Licensor waives any right to
+          collect royalties from You for the exercise of the Licensed
+          Rights, whether directly or through a collecting society
+          under any voluntary or waivable statutory or compulsory
+          licensing scheme. In all other cases the Licensor expressly
+          reserves any right to collect such royalties.
+
+
+Section 3 -- License Conditions.
+
+Your exercise of the Licensed Rights is expressly made subject to the
+following conditions.
+
+  a. Attribution.
+
+       1. If You Share the Licensed Material (including in modified
+          form), You must:
+
+            a. retain the following if it is supplied by the Licensor
+               with the Licensed Material:
+
+                 i. identification of the creator(s) of the Licensed
+                    Material and any others designated to receive
+                    attribution, in any reasonable manner requested by
+                    the Licensor (including by pseudonym if
+                    designated);
+
+                ii. a copyright notice;
+
+               iii. a notice that refers to this Public License;
+
+                iv. a notice that refers to the disclaimer of
+                    warranties;
+
+                 v. a URI or hyperlink to the Licensed Material to the
+                    extent reasonably practicable;
+
+            b. indicate if You modified the Licensed Material and
+               retain an indication of any previous modifications; and
+
+            c. indicate the Licensed Material is licensed under this
+               Public License, and include the text of, or the URI or
+               hyperlink to, this Public License.
+
+       2. You may satisfy the conditions in Section 3(a)(1) in any
+          reasonable manner based on the medium, means, and context in
+          which You Share the Licensed Material. For example, it may be
+          reasonable to satisfy the conditions by providing a URI or
+          hyperlink to a resource that includes the required
+          information.
+
+       3. If requested by the Licensor, You must remove any of the
+          information required by Section 3(a)(1)(A) to the extent
+          reasonably practicable.
+
+  b. ShareAlike.
+
+     In addition to the conditions in Section 3(a), if You Share
+     Adapted Material You produce, the following conditions also apply.
+
+       1. The Adapter's License You apply must be a Creative Commons
+          license with the same License Elements, this version or
+          later, or a BY-SA Compatible License.
+
+       2. You must include the text of, or the URI or hyperlink to, the
+          Adapter's License You apply. You may satisfy this condition
+          in any reasonable manner based on the medium, means, and
+          context in which You Share Adapted Material.
+
+       3. You may not offer or impose any additional or different terms
+          or conditions on, or apply any Effective Technological
+          Measures to, Adapted Material that restrict exercise of the
+          rights granted under the Adapter's License You apply.
+
+
+Section 4 -- Sui Generis Database Rights.
+
+Where the Licensed Rights include Sui Generis Database Rights that
+apply to Your use of the Licensed Material:
+
+  a. for the avoidance of doubt, Section 2(a)(1) grants You the right
+     to extract, reuse, reproduce, and Share all or a substantial
+     portion of the contents of the database;
+
+  b. if You include all or a substantial portion of the database
+     contents in a database in which You have Sui Generis Database
+     Rights, then the database in which You have Sui Generis Database
+     Rights (but not its individual contents) is Adapted Material,
+
+     including for purposes of Section 3(b); and
+  c. You must comply with the conditions in Section 3(a) if You Share
+     all or a substantial portion of the contents of the database.
+
+For the avoidance of doubt, this Section 4 supplements and does not
+replace Your obligations under this Public License where the Licensed
+Rights include other Copyright and Similar Rights.
+
+
+Section 5 -- Disclaimer of Warranties and Limitation of Liability.
+
+  a. UNLESS OTHERWISE SEPARATELY UNDERTAKEN BY THE LICENSOR, TO THE
+     EXTENT POSSIBLE, THE LICENSOR OFFERS THE LICENSED MATERIAL AS-IS
+     AND AS-AVAILABLE, AND MAKES NO REPRESENTATIONS OR WARRANTIES OF
+     ANY KIND CONCERNING THE LICENSED MATERIAL, WHETHER EXPRESS,
+     IMPLIED, STATUTORY, OR OTHER. THIS INCLUDES, WITHOUT LIMITATION,
+     WARRANTIES OF TITLE, MERCHANTABILITY, FITNESS FOR A PARTICULAR
+     PURPOSE, NON-INFRINGEMENT, ABSENCE OF LATENT OR OTHER DEFECTS,
+     ACCURACY, OR THE PRESENCE OR ABSENCE OF ERRORS, WHETHER OR NOT
+     KNOWN OR DISCOVERABLE. WHERE DISCLAIMERS OF WARRANTIES ARE NOT
+     ALLOWED IN FULL OR IN PART, THIS DISCLAIMER MAY NOT APPLY TO YOU.
+
+  b. TO THE EXTENT POSSIBLE, IN NO EVENT WILL THE LICENSOR BE LIABLE
+     TO YOU ON ANY LEGAL THEORY (INCLUDING, WITHOUT LIMITATION,
+     NEGLIGENCE) OR OTHERWISE FOR ANY DIRECT, SPECIAL, INDIRECT,
+     INCIDENTAL, CONSEQUENTIAL, PUNITIVE, EXEMPLARY, OR OTHER LOSSES,
+     COSTS, EXPENSES, OR DAMAGES ARISING OUT OF THIS PUBLIC LICENSE OR
+     USE OF THE LICENSED MATERIAL, EVEN IF THE LICENSOR HAS BEEN
+     ADVISED OF THE POSSIBILITY OF SUCH LOSSES, COSTS, EXPENSES, OR
+     DAMAGES. WHERE A LIMITATION OF LIABILITY IS NOT ALLOWED IN FULL OR
+     IN PART, THIS LIMITATION MAY NOT APPLY TO YOU.
+
+  c. The disclaimer of warranties and limitation of liability provided
+     above shall be interpreted in a manner that, to the extent
+     possible, most closely approximates an absolute disclaimer and
+     waiver of all liability.
+
+
+Section 6 -- Term and Termination.
+
+  a. This Public License applies for the term of the Copyright and
+     Similar Rights licensed here. However, if You fail to comply with
+     this Public License, then Your rights under this Public License
+     terminate automatically.
+
+  b. Where Your right to use the Licensed Material has terminated under
+     Section 6(a), it reinstates:
+
+       1. automatically as of the date the violation is cured, provided
+          it is cured within 30 days of Your discovery of the
+          violation; or
+
+       2. upon express reinstatement by the Licensor.
+
+     For the avoidance of doubt, this Section 6(b) does not affect any
+     right the Licensor may have to seek remedies for Your violations
+     of this Public License.
+
+  c. For the avoidance of doubt, the Licensor may also offer the
+     Licensed Material under separate terms or conditions or stop
+     distributing the Licensed Material at any time; however, doing so
+     will not terminate this Public License.
+
+  d. Sections 1, 5, 6, 7, and 8 survive termination of this Public
+     License.
+
+
+Section 7 -- Other Terms and Conditions.
+
+  a. The Licensor shall not be bound by any additional or different
+     terms or conditions communicated by You unless expressly agreed.
+
+  b. Any arrangements, understandings, or agreements regarding the
+     Licensed Material not stated herein are separate from and
+     independent of the terms and conditions of this Public License.
+
+
+Section 8 -- Interpretation.
+
+  a. For the avoidance of doubt, this Public License does not, and
+     shall not be interpreted to, reduce, limit, restrict, or impose
+     conditions on any use of the Licensed Material that could lawfully
+     be made without permission under this Public License.
+
+  b. To the extent possible, if any provision of this Public License is
+     deemed unenforceable, it shall be automatically reformed to the
+     minimum extent necessary to make it enforceable. If the provision
+     cannot be reformed, it shall be severed from this Public License
+     without affecting the enforceability of the remaining terms and
+     conditions.
+
+  c. No term or condition of this Public License will be waived and no
+     failure to comply consented to unless expressly agreed to by the
+     Licensor.
+
+  d. Nothing in this Public License constitutes or may be interpreted
+     as a limitation upon, or waiver of, any privileges and immunities
+     that apply to the Licensor or You, including from the legal
+     processes of any jurisdiction or authority.
+
+
+=======================================================================
+
+Creative Commons is not a party to its public
+licenses. Notwithstanding, Creative Commons may elect to apply one of
+its public licenses to material it publishes and in those instances
+will be considered the “Licensor.” The text of the Creative Commons
+public licenses is dedicated to the public domain under the CC0 Public
+Domain Dedication. Except for the limited purpose of indicating that
+material is shared under a Creative Commons public license or as
+otherwise permitted by the Creative Commons policies published at
+creativecommons.org/policies, Creative Commons does not authorize the
+use of the trademark "Creative Commons" or any other trademark or logo
+of Creative Commons without its prior written consent including,
+without limitation, in connection with any unauthorized modifications
+to any of its public licenses or any other arrangements,
+understandings, or agreements concerning use of licensed material. For
+the avoidance of doubt, this paragraph does not form part of the
+public licenses.
+
+Creative Commons may be contacted at creativecommons.org.
diff --git a/LICENSES/GPL-2.0-only.txt b/LICENSES/GPL-2.0-only.txt
new file mode 100644
index 0000000..d159169
--- /dev/null
+++ b/LICENSES/GPL-2.0-only.txt
@@ -0,0 +1,339 @@
+                    GNU GENERAL PUBLIC LICENSE
+                       Version 2, June 1991
+
+ Copyright (C) 1989, 1991 Free Software Foundation, Inc.,
+ 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ Everyone is permitted to copy and distribute verbatim copies
+ of this license document, but changing it is not allowed.
+
+                            Preamble
+
+  The licenses for most software are designed to take away your
+freedom to share and change it.  By contrast, the GNU General Public
+License is intended to guarantee your freedom to share and change free
+software--to make sure the software is free for all its users.  This
+General Public License applies to most of the Free Software
+Foundation's software and to any other program whose authors commit to
+using it.  (Some other Free Software Foundation software is covered by
+the GNU Lesser General Public License instead.)  You can apply it to
+your programs, too.
+
+  When we speak of free software, we are referring to freedom, not
+price.  Our General Public Licenses are designed to make sure that you
+have the freedom to distribute copies of free software (and charge for
+this service if you wish), that you receive source code or can get it
+if you want it, that you can change the software or use pieces of it
+in new free programs; and that you know you can do these things.
+
+  To protect your rights, we need to make restrictions that forbid
+anyone to deny you these rights or to ask you to surrender the rights.
+These restrictions translate to certain responsibilities for you if you
+distribute copies of the software, or if you modify it.
+
+  For example, if you distribute copies of such a program, whether
+gratis or for a fee, you must give the recipients all the rights that
+you have.  You must make sure that they, too, receive or can get the
+source code.  And you must show them these terms so they know their
+rights.
+
+  We protect your rights with two steps: (1) copyright the software, and
+(2) offer you this license which gives you legal permission to copy,
+distribute and/or modify the software.
+
+  Also, for each author's protection and ours, we want to make certain
+that everyone understands that there is no warranty for this free
+software.  If the software is modified by someone else and passed on, we
+want its recipients to know that what they have is not the original, so
+that any problems introduced by others will not reflect on the original
+authors' reputations.
+
+  Finally, any free program is threatened constantly by software
+patents.  We wish to avoid the danger that redistributors of a free
+program will individually obtain patent licenses, in effect making the
+program proprietary.  To prevent this, we have made it clear that any
+patent must be licensed for everyone's free use or not licensed at all.
+
+  The precise terms and conditions for copying, distribution and
+modification follow.
+
+                    GNU GENERAL PUBLIC LICENSE
+   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+
+  0. This License applies to any program or other work which contains
+a notice placed by the copyright holder saying it may be distributed
+under the terms of this General Public License.  The "Program", below,
+refers to any such program or work, and a "work based on the Program"
+means either the Program or any derivative work under copyright law:
+that is to say, a work containing the Program or a portion of it,
+either verbatim or with modifications and/or translated into another
+language.  (Hereinafter, translation is included without limitation in
+the term "modification".)  Each licensee is addressed as "you".
+
+Activities other than copying, distribution and modification are not
+covered by this License; they are outside its scope.  The act of
+running the Program is not restricted, and the output from the Program
+is covered only if its contents constitute a work based on the
+Program (independent of having been made by running the Program).
+Whether that is true depends on what the Program does.
+
+  1. You may copy and distribute verbatim copies of the Program's
+source code as you receive it, in any medium, provided that you
+conspicuously and appropriately publish on each copy an appropriate
+copyright notice and disclaimer of warranty; keep intact all the
+notices that refer to this License and to the absence of any warranty;
+and give any other recipients of the Program a copy of this License
+along with the Program.
+
+You may charge a fee for the physical act of transferring a copy, and
+you may at your option offer warranty protection in exchange for a fee.
+
+  2. You may modify your copy or copies of the Program or any portion
+of it, thus forming a work based on the Program, and copy and
+distribute such modifications or work under the terms of Section 1
+above, provided that you also meet all of these conditions:
+
+    a) You must cause the modified files to carry prominent notices
+    stating that you changed the files and the date of any change.
+
+    b) You must cause any work that you distribute or publish, that in
+    whole or in part contains or is derived from the Program or any
+    part thereof, to be licensed as a whole at no charge to all third
+    parties under the terms of this License.
+
+    c) If the modified program normally reads commands interactively
+    when run, you must cause it, when started running for such
+    interactive use in the most ordinary way, to print or display an
+    announcement including an appropriate copyright notice and a
+    notice that there is no warranty (or else, saying that you provide
+    a warranty) and that users may redistribute the program under
+    these conditions, and telling the user how to view a copy of this
+    License.  (Exception: if the Program itself is interactive but
+    does not normally print such an announcement, your work based on
+    the Program is not required to print an announcement.)
+
+These requirements apply to the modified work as a whole.  If
+identifiable sections of that work are not derived from the Program,
+and can be reasonably considered independent and separate works in
+themselves, then this License, and its terms, do not apply to those
+sections when you distribute them as separate works.  But when you
+distribute the same sections as part of a whole which is a work based
+on the Program, the distribution of the whole must be on the terms of
+this License, whose permissions for other licensees extend to the
+entire whole, and thus to each and every part regardless of who wrote it.
+
+Thus, it is not the intent of this section to claim rights or contest
+your rights to work written entirely by you; rather, the intent is to
+exercise the right to control the distribution of derivative or
+collective works based on the Program.
+
+In addition, mere aggregation of another work not based on the Program
+with the Program (or with a work based on the Program) on a volume of
+a storage or distribution medium does not bring the other work under
+the scope of this License.
+
+  3. You may copy and distribute the Program (or a work based on it,
+under Section 2) in object code or executable form under the terms of
+Sections 1 and 2 above provided that you also do one of the following:
+
+    a) Accompany it with the complete corresponding machine-readable
+    source code, which must be distributed under the terms of Sections
+    1 and 2 above on a medium customarily used for software interchange; or,
+
+    b) Accompany it with a written offer, valid for at least three
+    years, to give any third party, for a charge no more than your
+    cost of physically performing source distribution, a complete
+    machine-readable copy of the corresponding source code, to be
+    distributed under the terms of Sections 1 and 2 above on a medium
+    customarily used for software interchange; or,
+
+    c) Accompany it with the information you received as to the offer
+    to distribute corresponding source code.  (This alternative is
+    allowed only for noncommercial distribution and only if you
+    received the program in object code or executable form with such
+    an offer, in accord with Subsection b above.)
+
+The source code for a work means the preferred form of the work for
+making modifications to it.  For an executable work, complete source
+code means all the source code for all modules it contains, plus any
+associated interface definition files, plus the scripts used to
+control compilation and installation of the executable.  However, as a
+special exception, the source code distributed need not include
+anything that is normally distributed (in either source or binary
+form) with the major components (compiler, kernel, and so on) of the
+operating system on which the executable runs, unless that component
+itself accompanies the executable.
+
+If distribution of executable or object code is made by offering
+access to copy from a designated place, then offering equivalent
+access to copy the source code from the same place counts as
+distribution of the source code, even though third parties are not
+compelled to copy the source along with the object code.
+
+  4. You may not copy, modify, sublicense, or distribute the Program
+except as expressly provided under this License.  Any attempt
+otherwise to copy, modify, sublicense or distribute the Program is
+void, and will automatically terminate your rights under this License.
+However, parties who have received copies, or rights, from you under
+this License will not have their licenses terminated so long as such
+parties remain in full compliance.
+
+  5. You are not required to accept this License, since you have not
+signed it.  However, nothing else grants you permission to modify or
+distribute the Program or its derivative works.  These actions are
+prohibited by law if you do not accept this License.  Therefore, by
+modifying or distributing the Program (or any work based on the
+Program), you indicate your acceptance of this License to do so, and
+all its terms and conditions for copying, distributing or modifying
+the Program or works based on it.
+
+  6. Each time you redistribute the Program (or any work based on the
+Program), the recipient automatically receives a license from the
+original licensor to copy, distribute or modify the Program subject to
+these terms and conditions.  You may not impose any further
+restrictions on the recipients' exercise of the rights granted herein.
+You are not responsible for enforcing compliance by third parties to
+this License.
+
+  7. If, as a consequence of a court judgment or allegation of patent
+infringement or for any other reason (not limited to patent issues),
+conditions are imposed on you (whether by court order, agreement or
+otherwise) that contradict the conditions of this License, they do not
+excuse you from the conditions of this License.  If you cannot
+distribute so as to satisfy simultaneously your obligations under this
+License and any other pertinent obligations, then as a consequence you
+may not distribute the Program at all.  For example, if a patent
+license would not permit royalty-free redistribution of the Program by
+all those who receive copies directly or indirectly through you, then
+the only way you could satisfy both it and this License would be to
+refrain entirely from distribution of the Program.
+
+If any portion of this section is held invalid or unenforceable under
+any particular circumstance, the balance of the section is intended to
+apply and the section as a whole is intended to apply in other
+circumstances.
+
+It is not the purpose of this section to induce you to infringe any
+patents or other property right claims or to contest validity of any
+such claims; this section has the sole purpose of protecting the
+integrity of the free software distribution system, which is
+implemented by public license practices.  Many people have made
+generous contributions to the wide range of software distributed
+through that system in reliance on consistent application of that
+system; it is up to the author/donor to decide if he or she is willing
+to distribute software through any other system and a licensee cannot
+impose that choice.
+
+This section is intended to make thoroughly clear what is believed to
+be a consequence of the rest of this License.
+
+  8. If the distribution and/or use of the Program is restricted in
+certain countries either by patents or by copyrighted interfaces, the
+original copyright holder who places the Program under this License
+may add an explicit geographical distribution limitation excluding
+those countries, so that distribution is permitted only in or among
+countries not thus excluded.  In such case, this License incorporates
+the limitation as if written in the body of this License.
+
+  9. The Free Software Foundation may publish revised and/or new versions
+of the General Public License from time to time.  Such new versions will
+be similar in spirit to the present version, but may differ in detail to
+address new problems or concerns.
+
+Each version is given a distinguishing version number.  If the Program
+specifies a version number of this License which applies to it and "any
+later version", you have the option of following the terms and conditions
+either of that version or of any later version published by the Free
+Software Foundation.  If the Program does not specify a version number of
+this License, you may choose any version ever published by the Free Software
+Foundation.
+
+  10. If you wish to incorporate parts of the Program into other free
+programs whose distribution conditions are different, write to the author
+to ask for permission.  For software which is copyrighted by the Free
+Software Foundation, write to the Free Software Foundation; we sometimes
+make exceptions for this.  Our decision will be guided by the two goals
+of preserving the free status of all derivatives of our free software and
+of promoting the sharing and reuse of software generally.
+
+                            NO WARRANTY
+
+  11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
+FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
+OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
+PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED
+OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
+MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK AS
+TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE
+PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,
+REPAIR OR CORRECTION.
+
+  12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
+WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
+REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES,
+INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING
+OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED
+TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY
+YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER
+PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
+POSSIBILITY OF SUCH DAMAGES.
+
+                     END OF TERMS AND CONDITIONS
+
+            How to Apply These Terms to Your New Programs
+
+  If you develop a new program, and you want it to be of the greatest
+possible use to the public, the best way to achieve this is to make it
+free software which everyone can redistribute and change under these terms.
+
+  To do so, attach the following notices to the program.  It is safest
+to attach them to the start of each source file to most effectively
+convey the exclusion of warranty; and each file should have at least
+the "copyright" line and a pointer to where the full notice is found.
+
+    <one line to give the program's name and a brief idea of what it does.>
+    Copyright (C) <year>  <name of author>
+
+    This program is free software; you can redistribute it and/or modify
+    it under the terms of the GNU General Public License as published by
+    the Free Software Foundation; either version 2 of the License, or
+    (at your option) any later version.
+
+    This program is distributed in the hope that it will be useful,
+    but WITHOUT ANY WARRANTY; without even the implied warranty of
+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+    GNU General Public License for more details.
+
+    You should have received a copy of the GNU General Public License along
+    with this program; if not, write to the Free Software Foundation, Inc.,
+    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+
+Also add information on how to contact you by electronic and paper mail.
+
+If the program is interactive, make it output a short notice like this
+when it starts in an interactive mode:
+
+    Gnomovision version 69, Copyright (C) year name of author
+    Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
+    This is free software, and you are welcome to redistribute it
+    under certain conditions; type `show c' for details.
+
+The hypothetical commands `show w' and `show c' should show the appropriate
+parts of the General Public License.  Of course, the commands you use may
+be called something other than `show w' and `show c'; they could even be
+mouse-clicks or menu items--whatever suits your program.
+
+You should also get your employer (if you work as a programmer) or your
+school, if any, to sign a "copyright disclaimer" for the program, if
+necessary.  Here is a sample; alter the names:
+
+  Yoyodyne, Inc., hereby disclaims all copyright interest in the program
+  `Gnomovision' (which makes passes at compilers) written by James Hacker.
+
+  <signature of Ty Coon>, 1 April 1989
+  Ty Coon, President of Vice
+
+This General Public License does not permit incorporating your program into
+proprietary programs.  If your program is a subroutine library, you may
+consider it more useful to permit linking proprietary applications with the
+library.  If this is what you want to do, use the GNU Lesser General
+Public License instead of this License.
diff --git a/LICENSES/GPL-2.0-or-later.txt b/LICENSES/GPL-2.0-or-later.txt
new file mode 120000
index 0000000..0a87fbd
--- /dev/null
+++ b/LICENSES/GPL-2.0-or-later.txt
@@ -0,0 +1 @@
+GPL-2.0-only.txt
\ No newline at end of file
diff --git a/LICENSES/LGPL-2.1-or-later.txt b/LICENSES/LGPL-2.1-or-later.txt
new file mode 100644
index 0000000..e5ab03e
--- /dev/null
+++ b/LICENSES/LGPL-2.1-or-later.txt
@@ -0,0 +1,502 @@
+                  GNU LESSER GENERAL PUBLIC LICENSE
+                       Version 2.1, February 1999
+
+ Copyright (C) 1991, 1999 Free Software Foundation, Inc.
+ 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
+ Everyone is permitted to copy and distribute verbatim copies
+ of this license document, but changing it is not allowed.
+
+[This is the first released version of the Lesser GPL.  It also counts
+ as the successor of the GNU Library Public License, version 2, hence
+ the version number 2.1.]
+
+                            Preamble
+
+  The licenses for most software are designed to take away your
+freedom to share and change it.  By contrast, the GNU General Public
+Licenses are intended to guarantee your freedom to share and change
+free software--to make sure the software is free for all its users.
+
+  This license, the Lesser General Public License, applies to some
+specially designated software packages--typically libraries--of the
+Free Software Foundation and other authors who decide to use it.  You
+can use it too, but we suggest you first think carefully about whether
+this license or the ordinary General Public License is the better
+strategy to use in any particular case, based on the explanations below.
+
+  When we speak of free software, we are referring to freedom of use,
+not price.  Our General Public Licenses are designed to make sure that
+you have the freedom to distribute copies of free software (and charge
+for this service if you wish); that you receive source code or can get
+it if you want it; that you can change the software and use pieces of
+it in new free programs; and that you are informed that you can do
+these things.
+
+  To protect your rights, we need to make restrictions that forbid
+distributors to deny you these rights or to ask you to surrender these
+rights.  These restrictions translate to certain responsibilities for
+you if you distribute copies of the library or if you modify it.
+
+  For example, if you distribute copies of the library, whether gratis
+or for a fee, you must give the recipients all the rights that we gave
+you.  You must make sure that they, too, receive or can get the source
+code.  If you link other code with the library, you must provide
+complete object files to the recipients, so that they can relink them
+with the library after making changes to the library and recompiling
+it.  And you must show them these terms so they know their rights.
+
+  We protect your rights with a two-step method: (1) we copyright the
+library, and (2) we offer you this license, which gives you legal
+permission to copy, distribute and/or modify the library.
+
+  To protect each distributor, we want to make it very clear that
+there is no warranty for the free library.  Also, if the library is
+modified by someone else and passed on, the recipients should know
+that what they have is not the original version, so that the original
+author's reputation will not be affected by problems that might be
+introduced by others.
+
+  Finally, software patents pose a constant threat to the existence of
+any free program.  We wish to make sure that a company cannot
+effectively restrict the users of a free program by obtaining a
+restrictive license from a patent holder.  Therefore, we insist that
+any patent license obtained for a version of the library must be
+consistent with the full freedom of use specified in this license.
+
+  Most GNU software, including some libraries, is covered by the
+ordinary GNU General Public License.  This license, the GNU Lesser
+General Public License, applies to certain designated libraries, and
+is quite different from the ordinary General Public License.  We use
+this license for certain libraries in order to permit linking those
+libraries into non-free programs.
+
+  When a program is linked with a library, whether statically or using
+a shared library, the combination of the two is legally speaking a
+combined work, a derivative of the original library.  The ordinary
+General Public License therefore permits such linking only if the
+entire combination fits its criteria of freedom.  The Lesser General
+Public License permits more lax criteria for linking other code with
+the library.
+
+  We call this license the "Lesser" General Public License because it
+does Less to protect the user's freedom than the ordinary General
+Public License.  It also provides other free software developers Less
+of an advantage over competing non-free programs.  These disadvantages
+are the reason we use the ordinary General Public License for many
+libraries.  However, the Lesser license provides advantages in certain
+special circumstances.
+
+  For example, on rare occasions, there may be a special need to
+encourage the widest possible use of a certain library, so that it becomes
+a de-facto standard.  To achieve this, non-free programs must be
+allowed to use the library.  A more frequent case is that a free
+library does the same job as widely used non-free libraries.  In this
+case, there is little to gain by limiting the free library to free
+software only, so we use the Lesser General Public License.
+
+  In other cases, permission to use a particular library in non-free
+programs enables a greater number of people to use a large body of
+free software.  For example, permission to use the GNU C Library in
+non-free programs enables many more people to use the whole GNU
+operating system, as well as its variant, the GNU/Linux operating
+system.
+
+  Although the Lesser General Public License is Less protective of the
+users' freedom, it does ensure that the user of a program that is
+linked with the Library has the freedom and the wherewithal to run
+that program using a modified version of the Library.
+
+  The precise terms and conditions for copying, distribution and
+modification follow.  Pay close attention to the difference between a
+"work based on the library" and a "work that uses the library".  The
+former contains code derived from the library, whereas the latter must
+be combined with the library in order to run.
+
+                  GNU LESSER GENERAL PUBLIC LICENSE
+   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+
+  0. This License Agreement applies to any software library or other
+program which contains a notice placed by the copyright holder or
+other authorized party saying it may be distributed under the terms of
+this Lesser General Public License (also called "this License").
+Each licensee is addressed as "you".
+
+  A "library" means a collection of software functions and/or data
+prepared so as to be conveniently linked with application programs
+(which use some of those functions and data) to form executables.
+
+  The "Library", below, refers to any such software library or work
+which has been distributed under these terms.  A "work based on the
+Library" means either the Library or any derivative work under
+copyright law: that is to say, a work containing the Library or a
+portion of it, either verbatim or with modifications and/or translated
+straightforwardly into another language.  (Hereinafter, translation is
+included without limitation in the term "modification".)
+
+  "Source code" for a work means the preferred form of the work for
+making modifications to it.  For a library, complete source code means
+all the source code for all modules it contains, plus any associated
+interface definition files, plus the scripts used to control compilation
+and installation of the library.
+
+  Activities other than copying, distribution and modification are not
+covered by this License; they are outside its scope.  The act of
+running a program using the Library is not restricted, and output from
+such a program is covered only if its contents constitute a work based
+on the Library (independent of the use of the Library in a tool for
+writing it).  Whether that is true depends on what the Library does
+and what the program that uses the Library does.
+
+  1. You may copy and distribute verbatim copies of the Library's
+complete source code as you receive it, in any medium, provided that
+you conspicuously and appropriately publish on each copy an
+appropriate copyright notice and disclaimer of warranty; keep intact
+all the notices that refer to this License and to the absence of any
+warranty; and distribute a copy of this License along with the
+Library.
+
+  You may charge a fee for the physical act of transferring a copy,
+and you may at your option offer warranty protection in exchange for a
+fee.
+
+  2. You may modify your copy or copies of the Library or any portion
+of it, thus forming a work based on the Library, and copy and
+distribute such modifications or work under the terms of Section 1
+above, provided that you also meet all of these conditions:
+
+    a) The modified work must itself be a software library.
+
+    b) You must cause the files modified to carry prominent notices
+    stating that you changed the files and the date of any change.
+
+    c) You must cause the whole of the work to be licensed at no
+    charge to all third parties under the terms of this License.
+
+    d) If a facility in the modified Library refers to a function or a
+    table of data to be supplied by an application program that uses
+    the facility, other than as an argument passed when the facility
+    is invoked, then you must make a good faith effort to ensure that,
+    in the event an application does not supply such function or
+    table, the facility still operates, and performs whatever part of
+    its purpose remains meaningful.
+
+    (For example, a function in a library to compute square roots has
+    a purpose that is entirely well-defined independent of the
+    application.  Therefore, Subsection 2d requires that any
+    application-supplied function or table used by this function must
+    be optional: if the application does not supply it, the square
+    root function must still compute square roots.)
+
+These requirements apply to the modified work as a whole.  If
+identifiable sections of that work are not derived from the Library,
+and can be reasonably considered independent and separate works in
+themselves, then this License, and its terms, do not apply to those
+sections when you distribute them as separate works.  But when you
+distribute the same sections as part of a whole which is a work based
+on the Library, the distribution of the whole must be on the terms of
+this License, whose permissions for other licensees extend to the
+entire whole, and thus to each and every part regardless of who wrote
+it.
+
+Thus, it is not the intent of this section to claim rights or contest
+your rights to work written entirely by you; rather, the intent is to
+exercise the right to control the distribution of derivative or
+collective works based on the Library.
+
+In addition, mere aggregation of another work not based on the Library
+with the Library (or with a work based on the Library) on a volume of
+a storage or distribution medium does not bring the other work under
+the scope of this License.
+
+  3. You may opt to apply the terms of the ordinary GNU General Public
+License instead of this License to a given copy of the Library.  To do
+this, you must alter all the notices that refer to this License, so
+that they refer to the ordinary GNU General Public License, version 2,
+instead of to this License.  (If a newer version than version 2 of the
+ordinary GNU General Public License has appeared, then you can specify
+that version instead if you wish.)  Do not make any other change in
+these notices.
+
+  Once this change is made in a given copy, it is irreversible for
+that copy, so the ordinary GNU General Public License applies to all
+subsequent copies and derivative works made from that copy.
+
+  This option is useful when you wish to copy part of the code of
+the Library into a program that is not a library.
+
+  4. You may copy and distribute the Library (or a portion or
+derivative of it, under Section 2) in object code or executable form
+under the terms of Sections 1 and 2 above provided that you accompany
+it with the complete corresponding machine-readable source code, which
+must be distributed under the terms of Sections 1 and 2 above on a
+medium customarily used for software interchange.
+
+  If distribution of object code is made by offering access to copy
+from a designated place, then offering equivalent access to copy the
+source code from the same place satisfies the requirement to
+distribute the source code, even though third parties are not
+compelled to copy the source along with the object code.
+
+  5. A program that contains no derivative of any portion of the
+Library, but is designed to work with the Library by being compiled or
+linked with it, is called a "work that uses the Library".  Such a
+work, in isolation, is not a derivative work of the Library, and
+therefore falls outside the scope of this License.
+
+  However, linking a "work that uses the Library" with the Library
+creates an executable that is a derivative of the Library (because it
+contains portions of the Library), rather than a "work that uses the
+library".  The executable is therefore covered by this License.
+Section 6 states terms for distribution of such executables.
+
+  When a "work that uses the Library" uses material from a header file
+that is part of the Library, the object code for the work may be a
+derivative work of the Library even though the source code is not.
+Whether this is true is especially significant if the work can be
+linked without the Library, or if the work is itself a library.  The
+threshold for this to be true is not precisely defined by law.
+
+  If such an object file uses only numerical parameters, data
+structure layouts and accessors, and small macros and small inline
+functions (ten lines or less in length), then the use of the object
+file is unrestricted, regardless of whether it is legally a derivative
+work.  (Executables containing this object code plus portions of the
+Library will still fall under Section 6.)
+
+  Otherwise, if the work is a derivative of the Library, you may
+distribute the object code for the work under the terms of Section 6.
+Any executables containing that work also fall under Section 6,
+whether or not they are linked directly with the Library itself.
+
+  6. As an exception to the Sections above, you may also combine or
+link a "work that uses the Library" with the Library to produce a
+work containing portions of the Library, and distribute that work
+under terms of your choice, provided that the terms permit
+modification of the work for the customer's own use and reverse
+engineering for debugging such modifications.
+
+  You must give prominent notice with each copy of the work that the
+Library is used in it and that the Library and its use are covered by
+this License.  You must supply a copy of this License.  If the work
+during execution displays copyright notices, you must include the
+copyright notice for the Library among them, as well as a reference
+directing the user to the copy of this License.  Also, you must do one
+of these things:
+
+    a) Accompany the work with the complete corresponding
+    machine-readable source code for the Library including whatever
+    changes were used in the work (which must be distributed under
+    Sections 1 and 2 above); and, if the work is an executable linked
+    with the Library, with the complete machine-readable "work that
+    uses the Library", as object code and/or source code, so that the
+    user can modify the Library and then relink to produce a modified
+    executable containing the modified Library.  (It is understood
+    that the user who changes the contents of definitions files in the
+    Library will not necessarily be able to recompile the application
+    to use the modified definitions.)
+
+    b) Use a suitable shared library mechanism for linking with the
+    Library.  A suitable mechanism is one that (1) uses at run time a
+    copy of the library already present on the user's computer system,
+    rather than copying library functions into the executable, and (2)
+    will operate properly with a modified version of the library, if
+    the user installs one, as long as the modified version is
+    interface-compatible with the version that the work was made with.
+
+    c) Accompany the work with a written offer, valid for at
+    least three years, to give the same user the materials
+    specified in Subsection 6a, above, for a charge no more
+    than the cost of performing this distribution.
+
+    d) If distribution of the work is made by offering access to copy
+    from a designated place, offer equivalent access to copy the above
+    specified materials from the same place.
+
+    e) Verify that the user has already received a copy of these
+    materials or that you have already sent this user a copy.
+
+  For an executable, the required form of the "work that uses the
+Library" must include any data and utility programs needed for
+reproducing the executable from it.  However, as a special exception,
+the materials to be distributed need not include anything that is
+normally distributed (in either source or binary form) with the major
+components (compiler, kernel, and so on) of the operating system on
+which the executable runs, unless that component itself accompanies
+the executable.
+
+  It may happen that this requirement contradicts the license
+restrictions of other proprietary libraries that do not normally
+accompany the operating system.  Such a contradiction means you cannot
+use both them and the Library together in an executable that you
+distribute.
+
+  7. You may place library facilities that are a work based on the
+Library side-by-side in a single library together with other library
+facilities not covered by this License, and distribute such a combined
+library, provided that the separate distribution of the work based on
+the Library and of the other library facilities is otherwise
+permitted, and provided that you do these two things:
+
+    a) Accompany the combined library with a copy of the same work
+    based on the Library, uncombined with any other library
+    facilities.  This must be distributed under the terms of the
+    Sections above.
+
+    b) Give prominent notice with the combined library of the fact
+    that part of it is a work based on the Library, and explaining
+    where to find the accompanying uncombined form of the same work.
+
+  8. You may not copy, modify, sublicense, link with, or distribute
+the Library except as expressly provided under this License.  Any
+attempt otherwise to copy, modify, sublicense, link with, or
+distribute the Library is void, and will automatically terminate your
+rights under this License.  However, parties who have received copies,
+or rights, from you under this License will not have their licenses
+terminated so long as such parties remain in full compliance.
+
+  9. You are not required to accept this License, since you have not
+signed it.  However, nothing else grants you permission to modify or
+distribute the Library or its derivative works.  These actions are
+prohibited by law if you do not accept this License.  Therefore, by
+modifying or distributing the Library (or any work based on the
+Library), you indicate your acceptance of this License to do so, and
+all its terms and conditions for copying, distributing or modifying
+the Library or works based on it.
+
+  10. Each time you redistribute the Library (or any work based on the
+Library), the recipient automatically receives a license from the
+original licensor to copy, distribute, link with or modify the Library
+subject to these terms and conditions.  You may not impose any further
+restrictions on the recipients' exercise of the rights granted herein.
+You are not responsible for enforcing compliance by third parties with
+this License.
+
+  11. If, as a consequence of a court judgment or allegation of patent
+infringement or for any other reason (not limited to patent issues),
+conditions are imposed on you (whether by court order, agreement or
+otherwise) that contradict the conditions of this License, they do not
+excuse you from the conditions of this License.  If you cannot
+distribute so as to satisfy simultaneously your obligations under this
+License and any other pertinent obligations, then as a consequence you
+may not distribute the Library at all.  For example, if a patent
+license would not permit royalty-free redistribution of the Library by
+all those who receive copies directly or indirectly through you, then
+the only way you could satisfy both it and this License would be to
+refrain entirely from distribution of the Library.
+
+If any portion of this section is held invalid or unenforceable under any
+particular circumstance, the balance of the section is intended to apply,
+and the section as a whole is intended to apply in other circumstances.
+
+It is not the purpose of this section to induce you to infringe any
+patents or other property right claims or to contest validity of any
+such claims; this section has the sole purpose of protecting the
+integrity of the free software distribution system which is
+implemented by public license practices.  Many people have made
+generous contributions to the wide range of software distributed
+through that system in reliance on consistent application of that
+system; it is up to the author/donor to decide if he or she is willing
+to distribute software through any other system and a licensee cannot
+impose that choice.
+
+This section is intended to make thoroughly clear what is believed to
+be a consequence of the rest of this License.
+
+  12. If the distribution and/or use of the Library is restricted in
+certain countries either by patents or by copyrighted interfaces, the
+original copyright holder who places the Library under this License may add
+an explicit geographical distribution limitation excluding those countries,
+so that distribution is permitted only in or among countries not thus
+excluded.  In such case, this License incorporates the limitation as if
+written in the body of this License.
+
+  13. The Free Software Foundation may publish revised and/or new
+versions of the Lesser General Public License from time to time.
+Such new versions will be similar in spirit to the present version,
+but may differ in detail to address new problems or concerns.
+
+Each version is given a distinguishing version number.  If the Library
+specifies a version number of this License which applies to it and
+"any later version", you have the option of following the terms and
+conditions either of that version or of any later version published by
+the Free Software Foundation.  If the Library does not specify a
+license version number, you may choose any version ever published by
+the Free Software Foundation.
+
+  14. If you wish to incorporate parts of the Library into other free
+programs whose distribution conditions are incompatible with these,
+write to the author to ask for permission.  For software which is
+copyrighted by the Free Software Foundation, write to the Free
+Software Foundation; we sometimes make exceptions for this.  Our
+decision will be guided by the two goals of preserving the free status
+of all derivatives of our free software and of promoting the sharing
+and reuse of software generally.
+
+                            NO WARRANTY
+
+  15. BECAUSE THE LIBRARY IS LICENSED FREE OF CHARGE, THERE IS NO
+WARRANTY FOR THE LIBRARY, TO THE EXTENT PERMITTED BY APPLICABLE LAW.
+EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR
+OTHER PARTIES PROVIDE THE LIBRARY "AS IS" WITHOUT WARRANTY OF ANY
+KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE
+IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
+PURPOSE.  THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE
+LIBRARY IS WITH YOU.  SHOULD THE LIBRARY PROVE DEFECTIVE, YOU ASSUME
+THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
+
+  16. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN
+WRITING WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY
+AND/OR REDISTRIBUTE THE LIBRARY AS PERMITTED ABOVE, BE LIABLE TO YOU
+FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR
+CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE THE
+LIBRARY (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
+RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
+FAILURE OF THE LIBRARY TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
+SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH
+DAMAGES.
+
+                     END OF TERMS AND CONDITIONS
+
+           How to Apply These Terms to Your New Libraries
+
+  If you develop a new library, and you want it to be of the greatest
+possible use to the public, we recommend making it free software that
+everyone can redistribute and change.  You can do so by permitting
+redistribution under these terms (or, alternatively, under the terms of the
+ordinary General Public License).
+
+  To apply these terms, attach the following notices to the library.  It is
+safest to attach them to the start of each source file to most effectively
+convey the exclusion of warranty; and each file should have at least the
+"copyright" line and a pointer to where the full notice is found.
+
+    <one line to give the library's name and a brief idea of what it does.>
+    Copyright (C) <year>  <name of author>
+
+    This library is free software; you can redistribute it and/or
+    modify it under the terms of the GNU Lesser General Public
+    License as published by the Free Software Foundation; either
+    version 2.1 of the License, or (at your option) any later version.
+
+    This library is distributed in the hope that it will be useful,
+    but WITHOUT ANY WARRANTY; without even the implied warranty of
+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+    Lesser General Public License for more details.
+
+    You should have received a copy of the GNU Lesser General Public
+    License along with this library; if not, write to the Free Software
+    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
+
+Also add information on how to contact you by electronic and paper mail.
+
+You should also get your employer (if you work as a programmer) or your
+school, if any, to sign a "copyright disclaimer" for the library, if
+necessary.  Here is a sample; alter the names:
+
+  Yoyodyne, Inc., hereby disclaims all copyright interest in the
+  library `Frob' (a library for tweaking knobs) written by James Random Hacker.
+
+  <signature of Ty Coon>, 1 April 1990
+  Ty Coon, President of Vice
+
+That's all there is to it!
diff --git a/LICENSES/Linux-syscall-note.txt b/LICENSES/Linux-syscall-note.txt
new file mode 100644
index 0000000..9abdad7
--- /dev/null
+++ b/LICENSES/Linux-syscall-note.txt
@@ -0,0 +1,25 @@
+SPDX-Exception-Identifier: Linux-syscall-note
+SPDX-URL: https://spdx.org/licenses/Linux-syscall-note.html
+SPDX-Licenses: GPL-2.0, GPL-2.0+, GPL-1.0+, LGPL-2.0, LGPL-2.0+, LGPL-2.1, LGPL-2.1+, GPL-2.0-only, GPL-2.0-or-later
+Usage-Guide:
+  This exception is used together with one of the above SPDX-Licenses
+  to mark user space API (uapi) header files so they can be included
+  into non GPL compliant user space application code.
+  To use this exception add it with the keyword WITH to one of the
+  identifiers in the SPDX-Licenses tag:
+    SPDX-License-Identifier: <SPDX-License> WITH Linux-syscall-note
+License-Text:
+
+   NOTE! This copyright does *not* cover user programs that use kernel
+ services by normal system calls - this is merely considered normal use
+ of the kernel, and does *not* fall under the heading of "derived work".
+ Also note that the GPL below is copyrighted by the Free Software
+ Foundation, but the instance of code that it refers to (the Linux
+ kernel) is copyrighted by me and others who actually wrote it.
+
+ Also note that the only valid version of the GPL as far as the kernel
+ is concerned is _this_ particular version of the license (ie v2, not
+ v2.2 or v3.x or whatever), unless explicitly otherwise stated.
+
+			Linus Torvalds
+
diff --git a/Makefile.am b/Makefile.am
index b67312f..203c291 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -1,15 +1,16 @@
 # SPDX-License-Identifier: LGPL-2.1-or-later
-
-#
-# This file is part of libgpiod.
-#
-# Copyright (C) 2017-2019 Bartosz Golaszewski <bartekgola@gmail.com>
-#
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 ACLOCAL_AMFLAGS = -I m4
 AUTOMAKE_OPTIONS = foreign
 SUBDIRS = include lib
 
+EXTRA_DIST = \
+	LICENSES/CC-BY-SA-4.0.txt \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/LGPL-2.1-or-later.txt \
+	LICENSES/Linux-syscall-note.txt
+
 if WITH_TOOLS
 
 SUBDIRS += tools man
@@ -35,6 +36,6 @@ doc: Doxyfile
 clean-local:
 	rm -rf doc
 
-EXTRA_DIST = Doxyfile
+EXTRA_DIST += Doxyfile
 
 endif
diff --git a/NEWS b/NEWS
index d367ee8..c843c3c 100644
--- a/NEWS
+++ b/NEWS
@@ -1,3 +1,6 @@
+# SPDX-License-Identifier: CC-BY-SA-4.0
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+
 libgpiod v1.6
 =============
 
diff --git a/README b/README
index 5d29157..814a0f1 100644
--- a/README
+++ b/README
@@ -1,3 +1,6 @@
+# SPDX-License-Identifier: CC-BY-SA-4.0
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+
 libgpiod
 ========
 
diff --git a/TODO b/TODO
index c7cae8e..b4fe991 100644
--- a/TODO
+++ b/TODO
@@ -1,3 +1,6 @@
+# SPDX-License-Identifier: CC-BY-SA-4.0
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+
 TODO list for libgpiod
 
 ==========
diff --git a/autogen.sh b/autogen.sh
index 1da6874..7d21070 100755
--- a/autogen.sh
+++ b/autogen.sh
@@ -1,12 +1,7 @@
 #!/bin/sh
 # SPDX-License-Identifier: LGPL-2.1-or-later
-
-#
-# This file is part of libgpiod.
-#
-# Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
-#                    2017 Thierry Reding <treding@nvidia.com>
-#
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+# SPDX-FileCopyrightText: 2017 Thierry Reding <treding@nvidia.com>
 
 srcdir=`dirname $0`
 test -z "$srcdir" && srcdir=.
diff --git a/bindings/Makefile.am b/bindings/Makefile.am
index 24e2c98..c5301f9 100644
--- a/bindings/Makefile.am
+++ b/bindings/Makefile.am
@@ -1,10 +1,5 @@
 # SPDX-License-Identifier: LGPL-2.1-or-later
-
-#
-# This file is part of libgpiod.
-#
-# Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
-#
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 SUBDIRS = .
 
diff --git a/bindings/cxx/Makefile.am b/bindings/cxx/Makefile.am
index 87463b0..23c03f4 100644
--- a/bindings/cxx/Makefile.am
+++ b/bindings/cxx/Makefile.am
@@ -1,10 +1,5 @@
 # SPDX-License-Identifier: LGPL-2.1-or-later
-
-#
-# This file is part of libgpiod.
-#
-# Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
-#
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 lib_LTLIBRARIES = libgpiodcxx.la
 libgpiodcxx_la_SOURCES = chip.cpp iter.cpp line.cpp line_bulk.cpp
diff --git a/bindings/cxx/chip.cpp b/bindings/cxx/chip.cpp
index 59351dd..49c5602 100644
--- a/bindings/cxx/chip.cpp
+++ b/bindings/cxx/chip.cpp
@@ -1,9 +1,5 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
- */
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <functional>
 #include <gpiod.hpp>
diff --git a/bindings/cxx/examples/.gitignore b/bindings/cxx/examples/.gitignore
index acb5791..54bda46 100644
--- a/bindings/cxx/examples/.gitignore
+++ b/bindings/cxx/examples/.gitignore
@@ -1,3 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+
 gpiodetectcxx
 gpiofindcxx
 gpiogetcxx
diff --git a/bindings/cxx/examples/Makefile.am b/bindings/cxx/examples/Makefile.am
index 43e9875..bdd951d 100644
--- a/bindings/cxx/examples/Makefile.am
+++ b/bindings/cxx/examples/Makefile.am
@@ -1,10 +1,5 @@
 # SPDX-License-Identifier: LGPL-2.1-or-later
-
-#
-# This file is part of libgpiod.
-#
-# Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
-#
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 AM_CPPFLAGS = -I$(top_srcdir)/bindings/cxx/ -I$(top_srcdir)/include
 AM_CPPFLAGS += -Wall -Wextra -g -std=gnu++17
diff --git a/bindings/cxx/examples/gpiodetectcxx.cpp b/bindings/cxx/examples/gpiodetectcxx.cpp
index 76d367d..84dff9d 100644
--- a/bindings/cxx/examples/gpiodetectcxx.cpp
+++ b/bindings/cxx/examples/gpiodetectcxx.cpp
@@ -1,9 +1,5 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
- */
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 /* C++ reimplementation of the gpiodetect tool. */
 
diff --git a/bindings/cxx/examples/gpiofindcxx.cpp b/bindings/cxx/examples/gpiofindcxx.cpp
index f8b771c..cafcbb1 100644
--- a/bindings/cxx/examples/gpiofindcxx.cpp
+++ b/bindings/cxx/examples/gpiofindcxx.cpp
@@ -1,9 +1,5 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
- */
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 /* C++ reimplementation of the gpiofind tool. */
 
diff --git a/bindings/cxx/examples/gpiogetcxx.cpp b/bindings/cxx/examples/gpiogetcxx.cpp
index d565a43..486ff57 100644
--- a/bindings/cxx/examples/gpiogetcxx.cpp
+++ b/bindings/cxx/examples/gpiogetcxx.cpp
@@ -1,9 +1,5 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
- */
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 /* Simplified C++ reimplementation of the gpioget tool. */
 
diff --git a/bindings/cxx/examples/gpioinfocxx.cpp b/bindings/cxx/examples/gpioinfocxx.cpp
index 384286e..76b7bc1 100644
--- a/bindings/cxx/examples/gpioinfocxx.cpp
+++ b/bindings/cxx/examples/gpioinfocxx.cpp
@@ -1,9 +1,5 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
- */
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 /* Simplified C++ reimplementation of the gpioinfo tool. */
 
diff --git a/bindings/cxx/examples/gpiomoncxx.cpp b/bindings/cxx/examples/gpiomoncxx.cpp
index 75bd715..6b199c4 100644
--- a/bindings/cxx/examples/gpiomoncxx.cpp
+++ b/bindings/cxx/examples/gpiomoncxx.cpp
@@ -1,9 +1,5 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
- */
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 /* Simplified C++ reimplementation of the gpiomon tool. */
 
diff --git a/bindings/cxx/examples/gpiosetcxx.cpp b/bindings/cxx/examples/gpiosetcxx.cpp
index 5c0b8c9..fb093cb 100644
--- a/bindings/cxx/examples/gpiosetcxx.cpp
+++ b/bindings/cxx/examples/gpiosetcxx.cpp
@@ -1,9 +1,5 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
- */
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 /* Simplified C++ reimplementation of the gpioset tool. */
 
diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
index 9028822..84669e7 100644
--- a/bindings/cxx/gpiod.hpp
+++ b/bindings/cxx/gpiod.hpp
@@ -1,9 +1,5 @@
 /* SPDX-License-Identifier: LGPL-2.1-or-later */
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
- */
+/* SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com> */
 
 #ifndef __LIBGPIOD_GPIOD_CXX_HPP__
 #define __LIBGPIOD_GPIOD_CXX_HPP__
diff --git a/bindings/cxx/iter.cpp b/bindings/cxx/iter.cpp
index 846d36b..0d7e90a 100644
--- a/bindings/cxx/iter.cpp
+++ b/bindings/cxx/iter.cpp
@@ -1,9 +1,5 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
- */
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <gpiod.hpp>
 #include <system_error>
diff --git a/bindings/cxx/libgpiodcxx.pc.in b/bindings/cxx/libgpiodcxx.pc.in
index 9d227c9..731227c 100644
--- a/bindings/cxx/libgpiodcxx.pc.in
+++ b/bindings/cxx/libgpiodcxx.pc.in
@@ -1,3 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+
 prefix=@prefix@
 exec_prefix=@exec_prefix@
 libdir=@libdir@
diff --git a/bindings/cxx/line.cpp b/bindings/cxx/line.cpp
index 9b66d1a..d24df18 100644
--- a/bindings/cxx/line.cpp
+++ b/bindings/cxx/line.cpp
@@ -1,9 +1,5 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
- */
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <gpiod.hpp>
 #include <array>
@@ -337,7 +333,7 @@ void line::throw_if_null(void) const
 line::chip_guard::chip_guard(const line& line)
 	: _m_chip(line._m_owner)
 {
-	
+
 }
 
 } /* namespace gpiod */
diff --git a/bindings/cxx/line_bulk.cpp b/bindings/cxx/line_bulk.cpp
index 17b7208..b31efb5 100644
--- a/bindings/cxx/line_bulk.cpp
+++ b/bindings/cxx/line_bulk.cpp
@@ -1,9 +1,5 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
- */
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <gpiod.hpp>
 #include <map>
diff --git a/bindings/cxx/tests/.gitignore b/bindings/cxx/tests/.gitignore
index 580672e..7990193 100644
--- a/bindings/cxx/tests/.gitignore
+++ b/bindings/cxx/tests/.gitignore
@@ -1 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+
 gpiod-cxx-test
diff --git a/bindings/cxx/tests/Makefile.am b/bindings/cxx/tests/Makefile.am
index 5fa8f95..3599c02 100644
--- a/bindings/cxx/tests/Makefile.am
+++ b/bindings/cxx/tests/Makefile.am
@@ -1,10 +1,5 @@
 # SPDX-License-Identifier: LGPL-2.1-or-later
-
-#
-# This file is part of libgpiod.
-#
-# Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
-#
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 AM_CPPFLAGS = -I$(top_srcdir)/bindings/cxx/ -I$(top_srcdir)/include
 AM_CPPFLAGS += -I$(top_srcdir)/tests/mockup/
diff --git a/bindings/cxx/tests/gpio-mockup.cpp b/bindings/cxx/tests/gpio-mockup.cpp
index e8db962..54e69b7 100644
--- a/bindings/cxx/tests/gpio-mockup.cpp
+++ b/bindings/cxx/tests/gpio-mockup.cpp
@@ -1,9 +1,5 @@
-/* SPDX-License-Identifier: LGPL-2.1-or-later */
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2019 Bartosz Golaszewski <bgolaszewski@baylibre.com>
- */
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <system_error>
 
diff --git a/bindings/cxx/tests/gpio-mockup.hpp b/bindings/cxx/tests/gpio-mockup.hpp
index 38fb649..7a071fb 100644
--- a/bindings/cxx/tests/gpio-mockup.hpp
+++ b/bindings/cxx/tests/gpio-mockup.hpp
@@ -1,9 +1,5 @@
 /* SPDX-License-Identifier: LGPL-2.1-or-later */
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2019 Bartosz Golaszewski <bgolaszewski@baylibre.com>
- */
+/* SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com> */
 
 #ifndef __GPIOD_CXX_TEST_HPP__
 #define __GPIOD_CXX_TEST_HPP__
diff --git a/bindings/cxx/tests/gpiod-cxx-test-main.cpp b/bindings/cxx/tests/gpiod-cxx-test-main.cpp
index 5494bee..7343c1a 100644
--- a/bindings/cxx/tests/gpiod-cxx-test-main.cpp
+++ b/bindings/cxx/tests/gpiod-cxx-test-main.cpp
@@ -1,9 +1,5 @@
-/* SPDX-License-Identifier: LGPL-2.1-or-later */
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2019 Bartosz Golaszewski <bgolaszewski@baylibre.com>
- */
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #define CATCH_CONFIG_MAIN
 #include <catch2/catch.hpp>
diff --git a/bindings/cxx/tests/gpiod-cxx-test.cpp b/bindings/cxx/tests/gpiod-cxx-test.cpp
index 373ba10..1f1f20f 100644
--- a/bindings/cxx/tests/gpiod-cxx-test.cpp
+++ b/bindings/cxx/tests/gpiod-cxx-test.cpp
@@ -1,9 +1,5 @@
-/* SPDX-License-Identifier: LGPL-2.1-or-later */
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2019 Bartosz Golaszewski <bgolaszewski@baylibre.com>
- */
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <linux/version.h>
 #include <sys/utsname.h>
diff --git a/bindings/cxx/tests/tests-chip.cpp b/bindings/cxx/tests/tests-chip.cpp
index 1b16b65..bf4db0d 100644
--- a/bindings/cxx/tests/tests-chip.cpp
+++ b/bindings/cxx/tests/tests-chip.cpp
@@ -1,9 +1,5 @@
-/* SPDX-License-Identifier: LGPL-2.1-or-later */
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2019 Bartosz Golaszewski <bgolaszewski@baylibre.com>
- */
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <catch2/catch.hpp>
 #include <gpiod.hpp>
diff --git a/bindings/cxx/tests/tests-event.cpp b/bindings/cxx/tests/tests-event.cpp
index 97ea670..25cccde 100644
--- a/bindings/cxx/tests/tests-event.cpp
+++ b/bindings/cxx/tests/tests-event.cpp
@@ -1,9 +1,5 @@
-/* SPDX-License-Identifier: LGPL-2.1-or-later */
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2019 Bartosz Golaszewski <bgolaszewski@baylibre.com>
- */
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <catch2/catch.hpp>
 #include <gpiod.hpp>
diff --git a/bindings/cxx/tests/tests-iter.cpp b/bindings/cxx/tests/tests-iter.cpp
index 0dee754..11243c9 100644
--- a/bindings/cxx/tests/tests-iter.cpp
+++ b/bindings/cxx/tests/tests-iter.cpp
@@ -1,9 +1,5 @@
-/* SPDX-License-Identifier: LGPL-2.1-or-later */
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2019 Bartosz Golaszewski <bgolaszewski@baylibre.com>
- */
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <catch2/catch.hpp>
 #include <gpiod.hpp>
diff --git a/bindings/cxx/tests/tests-line.cpp b/bindings/cxx/tests/tests-line.cpp
index e201b99..01f785d 100644
--- a/bindings/cxx/tests/tests-line.cpp
+++ b/bindings/cxx/tests/tests-line.cpp
@@ -1,9 +1,5 @@
-/* SPDX-License-Identifier: LGPL-2.1-or-later */
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2019 Bartosz Golaszewski <bgolaszewski@baylibre.com>
- */
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <catch2/catch.hpp>
 #include <gpiod.hpp>
diff --git a/bindings/python/Makefile.am b/bindings/python/Makefile.am
index 5403bcb..fd4092d 100644
--- a/bindings/python/Makefile.am
+++ b/bindings/python/Makefile.am
@@ -1,10 +1,5 @@
 # SPDX-License-Identifier: LGPL-2.1-or-later
-
-#
-# This file is part of libgpiod.
-#
-# Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
-#
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 pyexec_LTLIBRARIES = gpiod.la
 
diff --git a/bindings/python/examples/Makefile.am b/bindings/python/examples/Makefile.am
index a0e06c0..c9bee28 100644
--- a/bindings/python/examples/Makefile.am
+++ b/bindings/python/examples/Makefile.am
@@ -1,10 +1,5 @@
 # SPDX-License-Identifier: LGPL-2.1-or-later
-
-#
-# This file is part of libgpiod.
-#
-# Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
-#
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 EXTRA_DIST =				\
 		gpiodetect.py		\
diff --git a/bindings/python/examples/gpiodetect.py b/bindings/python/examples/gpiodetect.py
index 781939b..665f07a 100755
--- a/bindings/python/examples/gpiodetect.py
+++ b/bindings/python/examples/gpiodetect.py
@@ -1,11 +1,6 @@
 #!/usr/bin/env python3
 # SPDX-License-Identifier: LGPL-2.1-or-later
-
-#
-# This file is part of libgpiod.
-#
-# Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
-#
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 '''Reimplementation of the gpiodetect tool in Python.'''
 
diff --git a/bindings/python/examples/gpiofind.py b/bindings/python/examples/gpiofind.py
index 2655742..74aff8e 100755
--- a/bindings/python/examples/gpiofind.py
+++ b/bindings/python/examples/gpiofind.py
@@ -1,11 +1,6 @@
 #!/usr/bin/env python3
 # SPDX-License-Identifier: LGPL-2.1-or-later
-
-#
-# This file is part of libgpiod.
-#
-# Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
-#
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 '''Reimplementation of the gpiofind tool in Python.'''
 
diff --git a/bindings/python/examples/gpioget.py b/bindings/python/examples/gpioget.py
index bdff23d..6cff18b 100755
--- a/bindings/python/examples/gpioget.py
+++ b/bindings/python/examples/gpioget.py
@@ -1,11 +1,6 @@
 #!/usr/bin/env python3
 # SPDX-License-Identifier: LGPL-2.1-or-later
-
-#
-# This file is part of libgpiod.
-#
-# Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
-#
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 '''Simplified reimplementation of the gpioget tool in Python.'''
 
diff --git a/bindings/python/examples/gpioinfo.py b/bindings/python/examples/gpioinfo.py
index 1593337..238e04c 100755
--- a/bindings/python/examples/gpioinfo.py
+++ b/bindings/python/examples/gpioinfo.py
@@ -1,11 +1,6 @@
 #!/usr/bin/env python3
 # SPDX-License-Identifier: LGPL-2.1-or-later
-
-#
-# This file is part of libgpiod.
-#
-# Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
-#
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 '''Simplified reimplementation of the gpioinfo tool in Python.'''
 
diff --git a/bindings/python/examples/gpiomon.py b/bindings/python/examples/gpiomon.py
index 1c56176..891760e 100755
--- a/bindings/python/examples/gpiomon.py
+++ b/bindings/python/examples/gpiomon.py
@@ -1,11 +1,6 @@
 #!/usr/bin/env python3
 # SPDX-License-Identifier: LGPL-2.1-or-later
-
-#
-# This file is part of libgpiod.
-#
-# Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
-#
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 '''Simplified reimplementation of the gpiomon tool in Python.'''
 
diff --git a/bindings/python/examples/gpioset.py b/bindings/python/examples/gpioset.py
index 3e7b121..947e916 100755
--- a/bindings/python/examples/gpioset.py
+++ b/bindings/python/examples/gpioset.py
@@ -1,11 +1,6 @@
 #!/usr/bin/env python3
 # SPDX-License-Identifier: LGPL-2.1-or-later
-
-#
-# This file is part of libgpiod.
-#
-# Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
-#
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 '''Simplified reimplementation of the gpioset tool in Python.'''
 
diff --git a/bindings/python/gpiodmodule.c b/bindings/python/gpiodmodule.c
index 02514cc..91b0c04 100644
--- a/bindings/python/gpiodmodule.c
+++ b/bindings/python/gpiodmodule.c
@@ -1,9 +1,5 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
- */
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <Python.h>
 #include <gpiod.h>
diff --git a/bindings/python/tests/Makefile.am b/bindings/python/tests/Makefile.am
index 9030e7b..7c8bb5e 100644
--- a/bindings/python/tests/Makefile.am
+++ b/bindings/python/tests/Makefile.am
@@ -1,10 +1,5 @@
 # SPDX-License-Identifier: LGPL-2.1-or-later
-
-#
-# This file is part of libgpiod.
-#
-# Copyright (C) 2019 Bartosz Golaszewski <bgolaszewski@baylibre.com>
-#
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 dist_bin_SCRIPTS = gpiod_py_test.py
 
diff --git a/bindings/python/tests/gpiod_py_test.py b/bindings/python/tests/gpiod_py_test.py
index 324f5e3..a1e22e8 100755
--- a/bindings/python/tests/gpiod_py_test.py
+++ b/bindings/python/tests/gpiod_py_test.py
@@ -1,11 +1,6 @@
 #!/usr/bin/env python3
 # SPDX-License-Identifier: LGPL-2.1-or-later
-
-#
-# This file is part of libgpiod.
-#
-# Copyright (C) 2019 Bartosz Golaszewski <bgolaszewski@baylibre.com>
-#
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 import errno
 import gpiod
diff --git a/bindings/python/tests/gpiomockupmodule.c b/bindings/python/tests/gpiomockupmodule.c
index d54ecf9..761d431 100644
--- a/bindings/python/tests/gpiomockupmodule.c
+++ b/bindings/python/tests/gpiomockupmodule.c
@@ -1,9 +1,5 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2019 Bartosz Golaszewski <bgolaszewski@baylibre.com>
- */
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <Python.h>
 #include <gpio-mockup.h>
diff --git a/configure.ac b/configure.ac
index f6db096..32b50a8 100644
--- a/configure.ac
+++ b/configure.ac
@@ -1,10 +1,5 @@
 # SPDX-License-Identifier: LGPL-2.1-or-later
-
-#
-# This file is part of libgpiod.
-#
-# Copyright (C) 2017-2019 Bartosz Golaszewski <bartekgola@gmail.com>
-#
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 AC_PREREQ([2.69])
 
diff --git a/include/Makefile.am b/include/Makefile.am
index dc1afa9..dcbfde0 100644
--- a/include/Makefile.am
+++ b/include/Makefile.am
@@ -1,9 +1,4 @@
 # SPDX-License-Identifier: LGPL-2.1-or-later
-
-#
-# This file is part of libgpiod.
-#
-# Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
-#
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 include_HEADERS = gpiod.h
diff --git a/include/gpiod.h b/include/gpiod.h
index 532f70a..76aa1dd 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -1,9 +1,5 @@
 /* SPDX-License-Identifier: LGPL-2.1-or-later */
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
- */
+/* SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com> */
 
 #ifndef __LIBGPIOD_GPIOD_H__
 #define __LIBGPIOD_GPIOD_H__
diff --git a/lib/Makefile.am b/lib/Makefile.am
index fb0dae9..1bc86e0 100644
--- a/lib/Makefile.am
+++ b/lib/Makefile.am
@@ -1,10 +1,5 @@
 # SPDX-License-Identifier: LGPL-2.1-or-later
-
-#
-# This file is part of libgpiod.
-#
-# Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
-#
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 lib_LTLIBRARIES = libgpiod.la
 libgpiod_la_SOURCES = core.c helpers.c misc.c uapi/gpio.h
diff --git a/lib/core.c b/lib/core.c
index d015567..077ea3e 100644
--- a/lib/core.c
+++ b/lib/core.c
@@ -1,9 +1,5 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
- */
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 /* Low-level, core library code. */
 
diff --git a/lib/helpers.c b/lib/helpers.c
index ac6325d..0071a2d 100644
--- a/lib/helpers.c
+++ b/lib/helpers.c
@@ -1,9 +1,5 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
- */
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 /*
  * More specific variants of the core API and misc functions that don't need
diff --git a/lib/libgpiod.pc.in b/lib/libgpiod.pc.in
index 48ff113..913859a 100644
--- a/lib/libgpiod.pc.in
+++ b/lib/libgpiod.pc.in
@@ -1,3 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+# SPDX-FileCopyrightText: 2018 Clemens Gruber <clemens.gruber@pqgruber.com>
+
 prefix=@prefix@
 exec_prefix=@exec_prefix@
 libdir=@libdir@
diff --git a/lib/misc.c b/lib/misc.c
index b812416..5583eb0 100644
--- a/lib/misc.c
+++ b/lib/misc.c
@@ -1,9 +1,5 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
- */
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 /* Misc code that didn't fit anywhere else. */
 
diff --git a/lib/uapi/gpio.h b/lib/uapi/gpio.h
index b8d2687..eaaea3d 100644
--- a/lib/uapi/gpio.h
+++ b/lib/uapi/gpio.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
 /*
  * <linux/gpio.h> - userspace ABI for the GPIO character devices
  *
@@ -8,8 +8,8 @@
  * under the terms of the GNU General Public License version 2 as published by
  * the Free Software Foundation.
  */
-#ifndef _GPIO_H_
-#define _GPIO_H_
+#ifndef _UAPI_GPIO_H_
+#define _UAPI_GPIO_H_
 
 #include <linux/const.h>
 #include <linux/ioctl.h>
@@ -65,6 +65,7 @@ struct gpiochip_info {
  * @GPIO_V2_LINE_FLAG_BIAS_PULL_UP: line has pull-up bias enabled
  * @GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN: line has pull-down bias enabled
  * @GPIO_V2_LINE_FLAG_BIAS_DISABLED: line has bias disabled
+ * @GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME: line events contain REALTIME timestamps
  */
 enum gpio_v2_line_flag {
 	GPIO_V2_LINE_FLAG_USED			= _BITULL(0),
@@ -78,6 +79,7 @@ enum gpio_v2_line_flag {
 	GPIO_V2_LINE_FLAG_BIAS_PULL_UP		= _BITULL(8),
 	GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN	= _BITULL(9),
 	GPIO_V2_LINE_FLAG_BIAS_DISABLED		= _BITULL(10),
+	GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME	= _BITULL(11),
 };
 
 /**
@@ -210,7 +212,7 @@ struct gpio_v2_line_request {
  * @offset: the local offset on this GPIO chip, fill this in when
  * requesting the line information from the kernel
  * @num_attrs: the number of attributes in @attrs
- * @flags: flags for the GPIO lines, with values from &enum
+ * @flags: flags for this GPIO line, with values from &enum
  * gpio_v2_line_flag, such as %GPIO_V2_LINE_FLAG_ACTIVE_LOW,
  * %GPIO_V2_LINE_FLAG_OUTPUT etc, added together.
  * @attrs: the configuration attributes associated with the line
@@ -270,9 +272,6 @@ enum gpio_v2_line_event_id {
 /**
  * struct gpio_v2_line_event - The actual event being pushed to userspace
  * @timestamp_ns: best estimate of time of event occurrence, in nanoseconds.
- * The @timestamp_ns is read from %CLOCK_MONOTONIC and is intended to allow
- * the accurate measurement of the time between events. It does not provide
- * the wall-clock time.
  * @id: event identifier with value from &enum gpio_v2_line_event_id
  * @offset: the offset of the line that triggered the event
  * @seqno: the sequence number for this event in the sequence of events for
@@ -280,6 +279,13 @@ enum gpio_v2_line_event_id {
  * @line_seqno: the sequence number for this event in the sequence of
  * events on this particular line
  * @padding: reserved for future use
+ *
+ * By default the @timestamp_ns is read from %CLOCK_MONOTONIC and is
+ * intended to allow the accurate measurement of the time between events.
+ * It does not provide the wall-clock time.
+ *
+ * If the %GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME flag is set then the
+ * @timestamp_ns is read from %CLOCK_REALTIME.
  */
 struct gpio_v2_line_event {
 	__aligned_u64 timestamp_ns;
@@ -519,4 +525,4 @@ struct gpioevent_data {
 #define GPIOHANDLE_SET_CONFIG_IOCTL _IOWR(0xB4, 0x0A, struct gpiohandle_config)
 #define GPIO_GET_LINEINFO_WATCH_IOCTL _IOWR(0xB4, 0x0B, struct gpioline_info)
 
-#endif /* _GPIO_H_ */
+#endif /* _UAPI_GPIO_H_ */
diff --git a/man/.gitignore b/man/.gitignore
index 900429f..1263cf7 100644
--- a/man/.gitignore
+++ b/man/.gitignore
@@ -1 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+
 *.man
diff --git a/man/Makefile.am b/man/Makefile.am
index 0f9c644..c6d589f 100644
--- a/man/Makefile.am
+++ b/man/Makefile.am
@@ -1,10 +1,5 @@
 # SPDX-License-Identifier: LGPL-2.1-or-later
-
-#
-# This file is part of libgpiod.
-#
-# Copyright (C) 2019 Bartosz Golaszewski <bartekgola@gmail.com>
-#
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 if WITH_MANPAGES
 
diff --git a/man/template b/man/template
index f1040ff..7ce5415 100644
--- a/man/template
+++ b/man/template
@@ -1,3 +1,6 @@
+# SPDX-License-Identifier: CC-BY-SA-4.0
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+
 [AUTHOR]
 Bartosz Golaszewski <bartekgola@gmail.com>
 
diff --git a/tests/.gitignore b/tests/.gitignore
index 703dc7c..676f092 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -1 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+
 gpiod-test
diff --git a/tests/Makefile.am b/tests/Makefile.am
index 91798f7..04fa3b2 100644
--- a/tests/Makefile.am
+++ b/tests/Makefile.am
@@ -1,10 +1,5 @@
 # SPDX-License-Identifier: LGPL-2.1-or-later
-
-#
-# This file is part of libgpiod.
-#
-# Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
-#
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 SUBDIRS = mockup
 
diff --git a/tests/gpiod-test.c b/tests/gpiod-test.c
index 343e836..46249a7 100644
--- a/tests/gpiod-test.c
+++ b/tests/gpiod-test.c
@@ -1,9 +1,5 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2019 Bartosz Golaszewski <bgolaszewski@baylibre.com>
- */
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <errno.h>
 #include <glib/gstdio.h>
diff --git a/tests/gpiod-test.h b/tests/gpiod-test.h
index 7ed4d23..9b9e4ba 100644
--- a/tests/gpiod-test.h
+++ b/tests/gpiod-test.h
@@ -1,9 +1,5 @@
 /* SPDX-License-Identifier: LGPL-2.1-or-later */
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2019 Bartosz Golaszewski <bgolaszewski@baylibre.com>
- */
+/* SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com> */
 
 /*
  * Testing framework for the core library.
diff --git a/tests/mockup/Makefile.am b/tests/mockup/Makefile.am
index d3449cc..af29a95 100644
--- a/tests/mockup/Makefile.am
+++ b/tests/mockup/Makefile.am
@@ -1,10 +1,5 @@
 # SPDX-License-Identifier: LGPL-2.1-or-later
-
-#
-# This file is part of libgpiod.
-#
-# Copyright (C) 2019 Bartosz Golaszewski <bgolaszewski@baylibre.com>
-#
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 lib_LTLIBRARIES = libgpiomockup.la
 
diff --git a/tests/mockup/gpio-mockup.c b/tests/mockup/gpio-mockup.c
index 5e85819..eba26d3 100644
--- a/tests/mockup/gpio-mockup.c
+++ b/tests/mockup/gpio-mockup.c
@@ -1,9 +1,5 @@
-/* SPDX-License-Identifier: LGPL-2.1-or-later */
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2019 Bartosz Golaszewski <bgolaszewski@baylibre.com>
- */
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <errno.h>
 #include <libkmod.h>
diff --git a/tests/mockup/gpio-mockup.h b/tests/mockup/gpio-mockup.h
index b04dafa..4a55032 100644
--- a/tests/mockup/gpio-mockup.h
+++ b/tests/mockup/gpio-mockup.h
@@ -1,9 +1,5 @@
 /* SPDX-License-Identifier: LGPL-2.1-or-later */
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2019 Bartosz Golaszewski <bgolaszewski@baylibre.com>
- */
+/* SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com> */
 
 #ifndef __GPIO_MOCKUP_H__
 #define __GPIO_MOCKUP_H__
diff --git a/tests/tests-bulk.c b/tests/tests-bulk.c
index 22cae84..d079003 100644
--- a/tests/tests-bulk.c
+++ b/tests/tests-bulk.c
@@ -1,9 +1,5 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2020 Bartosz Golaszewski <bgolaszewski@baylibre.com>
- */
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <errno.h>
 
diff --git a/tests/tests-chip.c b/tests/tests-chip.c
index c18bd5d..6713565 100644
--- a/tests/tests-chip.c
+++ b/tests/tests-chip.c
@@ -1,9 +1,5 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2019 Bartosz Golaszewski <bgolaszewski@baylibre.com>
- */
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <errno.h>
 
diff --git a/tests/tests-event.c b/tests/tests-event.c
index 5fa4459..a213bf0 100644
--- a/tests/tests-event.c
+++ b/tests/tests-event.c
@@ -1,9 +1,5 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2019 Bartosz Golaszewski <bgolaszewski@baylibre.com>
- */
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <errno.h>
 #include <unistd.h>
diff --git a/tests/tests-line.c b/tests/tests-line.c
index 2bfb8b4..8de1e6a 100644
--- a/tests/tests-line.c
+++ b/tests/tests-line.c
@@ -1,9 +1,5 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2019 Bartosz Golaszewski <bgolaszewski@baylibre.com>
- */
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <errno.h>
 #include <string.h>
diff --git a/tests/tests-misc.c b/tests/tests-misc.c
index d077d49..a98329f 100644
--- a/tests/tests-misc.c
+++ b/tests/tests-misc.c
@@ -1,9 +1,5 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2019 Bartosz Golaszewski <bgolaszewski@baylibre.com>
- */
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <string.h>
 
diff --git a/tools/.gitignore b/tools/.gitignore
index 33bc931..0d53de9 100644
--- a/tools/.gitignore
+++ b/tools/.gitignore
@@ -1,3 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+
 gpiodetect
 gpioinfo
 gpioget
diff --git a/tools/Makefile.am b/tools/Makefile.am
index b08bc3b..bbfcab6 100644
--- a/tools/Makefile.am
+++ b/tools/Makefile.am
@@ -1,10 +1,5 @@
 # SPDX-License-Identifier: LGPL-2.1-or-later
-
-#
-# This file is part of libgpiod.
-#
-# Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
-#
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 AM_CFLAGS = -I$(top_srcdir)/include/ -include $(top_builddir)/config.h
 AM_CFLAGS += -Wall -Wextra -g -std=gnu89
diff --git a/tools/gpio-tools-test b/tools/gpio-tools-test
index 1b9f9a1..7d42374 100755
--- a/tools/gpio-tools-test
+++ b/tools/gpio-tools-test
@@ -1,11 +1,6 @@
 #!/usr/bin/env bash
 # SPDX-License-Identifier: LGPL-2.1-or-later
-
-#
-# This file is part of libgpiod.
-#
-# Copyright (C) 2019 Bartosz Golaszewski <bgolaszewski@baylibre.com>
-#
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 MIN_KERNEL_VERSION="5.5.0"
 BATS_SCRIPT="gpio-tools-test.bats"
diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
index ec39046..ba0a904 100755
--- a/tools/gpio-tools-test.bats
+++ b/tools/gpio-tools-test.bats
@@ -1,11 +1,6 @@
 #!/usr/bin/env bats
 # SPDX-License-Identifier: LGPL-2.1-or-later
-
-#
-# This file is part of libgpiod.
-#
-# Copyright (C) 2019 Bartosz Golaszewski <bgolaszewski@baylibre.com>
-#
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 # Simple test harness for the gpio-tools.
 
diff --git a/tools/gpiodetect.c b/tools/gpiodetect.c
index 6f94f91..1780f40 100644
--- a/tools/gpiodetect.c
+++ b/tools/gpiodetect.c
@@ -1,9 +1,5 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
- */
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <dirent.h>
 #include <errno.h>
diff --git a/tools/gpiofind.c b/tools/gpiofind.c
index 3760ada..45033d9 100644
--- a/tools/gpiofind.c
+++ b/tools/gpiofind.c
@@ -1,9 +1,5 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
- */
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <dirent.h>
 #include <errno.h>
diff --git a/tools/gpioget.c b/tools/gpioget.c
index efbacce..0d8e286 100644
--- a/tools/gpioget.c
+++ b/tools/gpioget.c
@@ -1,9 +1,5 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
- */
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <getopt.h>
 #include <gpiod.h>
diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
index 729b179..aba5bde 100644
--- a/tools/gpioinfo.c
+++ b/tools/gpioinfo.c
@@ -1,9 +1,5 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
- */
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <dirent.h>
 #include <errno.h>
diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index 3586cb4..e9f2055 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -1,9 +1,5 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
- */
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <errno.h>
 #include <getopt.h>
diff --git a/tools/gpioset.c b/tools/gpioset.c
index 20a7d3b..b34efea 100644
--- a/tools/gpioset.c
+++ b/tools/gpioset.c
@@ -1,9 +1,5 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
- */
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <errno.h>
 #include <gpiod.h>
diff --git a/tools/tools-common.c b/tools/tools-common.c
index 9d4612a..98a4b9d 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -1,9 +1,5 @@
-/* SPDX-License-Identifier: LGPL-2.1-or-later */
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
- */
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 /* Common code for GPIO tools. */
 
diff --git a/tools/tools-common.h b/tools/tools-common.h
index 866f809..779dde5 100644
--- a/tools/tools-common.h
+++ b/tools/tools-common.h
@@ -1,9 +1,5 @@
 /* SPDX-License-Identifier: LGPL-2.1-or-later */
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
- */
+/* SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com> */
 
 #ifndef __GPIOD_TOOLS_COMMON_H__
 #define __GPIOD_TOOLS_COMMON_H__
-- 
2.29.1

