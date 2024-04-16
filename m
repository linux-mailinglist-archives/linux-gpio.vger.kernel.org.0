Return-Path: <linux-gpio+bounces-5572-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E7F8A7670
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Apr 2024 23:29:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7373B247D7
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Apr 2024 21:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0A9D7581A;
	Tue, 16 Apr 2024 21:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZFOFPvgb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB0D6BFC5
	for <linux-gpio@vger.kernel.org>; Tue, 16 Apr 2024 21:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713302516; cv=none; b=STsUf40SLP6r9HXcFffRkEuGx6ds1k1ngTDiroYtv95Oq68Bgyl3TIBC0piBCBQDKT6QHeX1hYxvbQSKa4ZOixwvZkKiKOc5fGsb4bkzEZ8GNO6gS6ETJiRJSoXOojPAz+bia0YDapvKCPDDwwb+C8X1Wt4LTw4u8tlDQ6KSBrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713302516; c=relaxed/simple;
	bh=xAZXmbVMBIeWGSejCu9C34y332qKCpXkonR1l7E7ILQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nYRxt3AnLKJLKd8YspdBdx05P4hArZCtn91aghAjj/MTv9eBw9t5HMyfiLCbMYZQGpuXNQj0+weG3uUvlN8chCOKcffvgOhGHpN6ByzKuZlPEqCMBtgLg1Dqy1Yg/d2CTp8N/Ou6UpLivBf3qHHpDE8MGPiXw/Ja5tNzNvyp6mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZFOFPvgb; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6eaf9565e6bso3078754b3a.2
        for <linux-gpio@vger.kernel.org>; Tue, 16 Apr 2024 14:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713302513; x=1713907313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6FnuhnDWblzClbGnwvxyifqVnsb8dfnqb6lPMjZf7AY=;
        b=ZFOFPvgbgCTUpwuaN/xUc/clYaGjgtnQy0Q4tzVbSu1qe4PmVc2GyE8aI49+IihmMK
         s2yceKFAKKvAZgW84LzHxsaKztXsbei0IlZ6UaT9/FaeWejENG7ilYwMHvfIPR7lALuA
         JDh0vv7djzFsknu6sogF+SnmnwpokKCbaGSXzAI7vlSWlEX9OJrcvNY5dWhqsOCNLcGO
         k6Jq4H4SGbXkG/RZC+ftLTM4Lf30iSxhhIVBniiBYsSwIlgxTnK4DDh3/VJoB8jSsLG2
         9r68WYVL/VLaQNd6MRWyjZPW2phviu0E0zoSOQwk0HeJAILakgUT9Zjp97OqmFYR86Ra
         ubBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713302513; x=1713907313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6FnuhnDWblzClbGnwvxyifqVnsb8dfnqb6lPMjZf7AY=;
        b=Xz0iekCBZLnBL3X1MazB5KLg8t5rkrYGkpXd70+MfllDyQaPoEpyW4f2ny8SjyFd13
         kzzCmocKGZr7Amao6w2Hi0HC0jkwvfmB5hgy3WCdfHw6CPiXK+5utwbOhkkIWRIphOY5
         p+4EnN1E+pxbl7O3zQFPCJtYB3Zeg1qgZl8issd2o741yfC5CxGafeJrQOLLNjGwV40P
         57uMg3szOOgUV1wLAY1JZ3SnEPpaxEBJ/GdLZrI9FeEzpIJASdC+icxJGQ68KTxEcCBy
         19AqqCreSi/GzcTD+vqse32EDaEsrA1BrK3mgIroBg1Z5xrtp1JxLZmAO3SV/j9B/QDI
         upXQ==
X-Gm-Message-State: AOJu0YzIA7zzU6H/bEH3J3u8rhMyEnMiYL7CbP8TiLxDjNLYWcJycIsV
	g41fi55YrtLOwCaiVQYpcyOtMjv3wrbeHU5kSYFaINg4HMAfm5D4NM5svzR+Reo=
X-Google-Smtp-Source: AGHT+IEP5S1WPPx7pKp5LQBezOw5CsexrFcdjvA23YCraUgYG85wZJil1HmLMNmlEf2CiVDi6M7/Cw==
X-Received: by 2002:a05:6a20:6d20:b0:1a7:c1a0:d33b with SMTP id fv32-20020a056a206d2000b001a7c1a0d33bmr11431862pzb.39.1713302513215;
        Tue, 16 Apr 2024 14:21:53 -0700 (PDT)
Received: from brgl-uxlite.. ([24.75.208.145])
        by smtp.gmail.com with ESMTPSA id c19-20020aa78813000000b006e6b3c4e70bsm9792840pfo.171.2024.04.16.14.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 14:21:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Grant Likely <grant.likely@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Walter Lozano <walter.lozano@collabora.com>
Subject: [libgpiod][PATCH 1/2] licensing: relicense C++ bindings under LGPL-2.1-or-later
Date: Tue, 16 Apr 2024 23:21:40 +0200
Message-Id: <20240416212141.6683-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240416212141.6683-1-brgl@bgdev.pl>
References: <20240416212141.6683-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Commit ea84f882d5d3 ("licensing: relicense C++ library code under
LGPL-3.0-or-later") changed the license of C++ bindings in order to
solve potential issues with code generated from templates[1], default
implementations, etc. However this change makes the bindings less
attractive to projects that have strict licensing restrictions and avoid
GPL-3.0 code[2].

After talking to Grant Likely I decided that the best approach is to
make the bindings available under LGPL-v2.1-or-later and simply let the
end user decide which version's text to apply.

While at it: tweak the README to also mention that examples are provided
under GPL-2.0-or-later.

Link: [1] https://www.spinics.net/lists/linux-gpio/msg46605.html
Link: [2] https://github.com/brgl/libgpiod/issues/72
Suggested-by: Walter Lozano <walter.lozano@collabora.com>
Suggested-by: Grant Likely <grant.likely@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 COPYING                                     |  11 +-
 LICENSES/LGPL-3.0-or-later.txt              | 165 --------------------
 bindings/cxx/chip-info.cpp                  |   2 +-
 bindings/cxx/chip.cpp                       |   2 +-
 bindings/cxx/edge-event-buffer.cpp          |   2 +-
 bindings/cxx/edge-event.cpp                 |   2 +-
 bindings/cxx/exception.cpp                  |   2 +-
 bindings/cxx/gpiod.hpp                      |   2 +-
 bindings/cxx/gpiodcxx/chip-info.hpp         |   2 +-
 bindings/cxx/gpiodcxx/chip.hpp              |   2 +-
 bindings/cxx/gpiodcxx/edge-event-buffer.hpp |   2 +-
 bindings/cxx/gpiodcxx/edge-event.hpp        |   2 +-
 bindings/cxx/gpiodcxx/exception.hpp         |   2 +-
 bindings/cxx/gpiodcxx/info-event.hpp        |   2 +-
 bindings/cxx/gpiodcxx/line-config.hpp       |   2 +-
 bindings/cxx/gpiodcxx/line-info.hpp         |   2 +-
 bindings/cxx/gpiodcxx/line-request.hpp      |   2 +-
 bindings/cxx/gpiodcxx/line-settings.hpp     |   2 +-
 bindings/cxx/gpiodcxx/line.hpp              |   2 +-
 bindings/cxx/gpiodcxx/misc.hpp              |   2 +-
 bindings/cxx/gpiodcxx/request-builder.hpp   |   2 +-
 bindings/cxx/gpiodcxx/request-config.hpp    |   2 +-
 bindings/cxx/gpiodcxx/timestamp.hpp         |   2 +-
 bindings/cxx/info-event.cpp                 |   2 +-
 bindings/cxx/internal.cpp                   |   2 +-
 bindings/cxx/internal.hpp                   |   2 +-
 bindings/cxx/line-config.cpp                |   2 +-
 bindings/cxx/line-info.cpp                  |   2 +-
 bindings/cxx/line-request.cpp               |   2 +-
 bindings/cxx/line-settings.cpp              |   2 +-
 bindings/cxx/line.cpp                       |   2 +-
 bindings/cxx/misc.cpp                       |   2 +-
 bindings/cxx/request-builder.cpp            |   2 +-
 bindings/cxx/request-config.cpp             |   2 +-
 bindings/cxx/tests/gpiosim.cpp              |   2 +-
 bindings/cxx/tests/gpiosim.hpp              |   2 +-
 bindings/cxx/tests/helpers.cpp              |   2 +-
 bindings/cxx/tests/helpers.hpp              |   2 +-
 38 files changed, 37 insertions(+), 211 deletions(-)
 delete mode 100644 LICENSES/LGPL-3.0-or-later.txt

diff --git a/COPYING b/COPYING
index 87a9de5..84b4fc6 100644
--- a/COPYING
+++ b/COPYING
@@ -7,7 +7,7 @@ or any later version according with:
 
     LICENSES/LGPL-2.1-or-later.txt
 
-gpio-tools and test suites are provided under:
+gpio-tools, test suites and examples are provided under:
 
     SPDX-License-Identifier: GPL-2.0-or-later
 
@@ -16,15 +16,6 @@ later version according with:
 
     LICENSES/GPL-2.0-or-later.txt
 
-C++ bindings to libgpiod are provided under:
-
-    SPDX-License-Identifier: LGPL-3.0-or-later
-
-Being under the terms of the GNU Lesser General Public License version 3.0
-or any later version according with:
-
-    LICENSES/LGPL-3.0-or-later.txt
-
 The Linux Kernel uAPI headers are provided under:
 
     SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note
diff --git a/LICENSES/LGPL-3.0-or-later.txt b/LICENSES/LGPL-3.0-or-later.txt
deleted file mode 100644
index 0a04128..0000000
--- a/LICENSES/LGPL-3.0-or-later.txt
+++ /dev/null
@@ -1,165 +0,0 @@
-                   GNU LESSER GENERAL PUBLIC LICENSE
-                       Version 3, 29 June 2007
-
- Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
- Everyone is permitted to copy and distribute verbatim copies
- of this license document, but changing it is not allowed.
-
-
-  This version of the GNU Lesser General Public License incorporates
-the terms and conditions of version 3 of the GNU General Public
-License, supplemented by the additional permissions listed below.
-
-  0. Additional Definitions.
-
-  As used herein, "this License" refers to version 3 of the GNU Lesser
-General Public License, and the "GNU GPL" refers to version 3 of the GNU
-General Public License.
-
-  "The Library" refers to a covered work governed by this License,
-other than an Application or a Combined Work as defined below.
-
-  An "Application" is any work that makes use of an interface provided
-by the Library, but which is not otherwise based on the Library.
-Defining a subclass of a class defined by the Library is deemed a mode
-of using an interface provided by the Library.
-
-  A "Combined Work" is a work produced by combining or linking an
-Application with the Library.  The particular version of the Library
-with which the Combined Work was made is also called the "Linked
-Version".
-
-  The "Minimal Corresponding Source" for a Combined Work means the
-Corresponding Source for the Combined Work, excluding any source code
-for portions of the Combined Work that, considered in isolation, are
-based on the Application, and not on the Linked Version.
-
-  The "Corresponding Application Code" for a Combined Work means the
-object code and/or source code for the Application, including any data
-and utility programs needed for reproducing the Combined Work from the
-Application, but excluding the System Libraries of the Combined Work.
-
-  1. Exception to Section 3 of the GNU GPL.
-
-  You may convey a covered work under sections 3 and 4 of this License
-without being bound by section 3 of the GNU GPL.
-
-  2. Conveying Modified Versions.
-
-  If you modify a copy of the Library, and, in your modifications, a
-facility refers to a function or data to be supplied by an Application
-that uses the facility (other than as an argument passed when the
-facility is invoked), then you may convey a copy of the modified
-version:
-
-   a) under this License, provided that you make a good faith effort to
-   ensure that, in the event an Application does not supply the
-   function or data, the facility still operates, and performs
-   whatever part of its purpose remains meaningful, or
-
-   b) under the GNU GPL, with none of the additional permissions of
-   this License applicable to that copy.
-
-  3. Object Code Incorporating Material from Library Header Files.
-
-  The object code form of an Application may incorporate material from
-a header file that is part of the Library.  You may convey such object
-code under terms of your choice, provided that, if the incorporated
-material is not limited to numerical parameters, data structure
-layouts and accessors, or small macros, inline functions and templates
-(ten or fewer lines in length), you do both of the following:
-
-   a) Give prominent notice with each copy of the object code that the
-   Library is used in it and that the Library and its use are
-   covered by this License.
-
-   b) Accompany the object code with a copy of the GNU GPL and this license
-   document.
-
-  4. Combined Works.
-
-  You may convey a Combined Work under terms of your choice that,
-taken together, effectively do not restrict modification of the
-portions of the Library contained in the Combined Work and reverse
-engineering for debugging such modifications, if you also do each of
-the following:
-
-   a) Give prominent notice with each copy of the Combined Work that
-   the Library is used in it and that the Library and its use are
-   covered by this License.
-
-   b) Accompany the Combined Work with a copy of the GNU GPL and this license
-   document.
-
-   c) For a Combined Work that displays copyright notices during
-   execution, include the copyright notice for the Library among
-   these notices, as well as a reference directing the user to the
-   copies of the GNU GPL and this license document.
-
-   d) Do one of the following:
-
-       0) Convey the Minimal Corresponding Source under the terms of this
-       License, and the Corresponding Application Code in a form
-       suitable for, and under terms that permit, the user to
-       recombine or relink the Application with a modified version of
-       the Linked Version to produce a modified Combined Work, in the
-       manner specified by section 6 of the GNU GPL for conveying
-       Corresponding Source.
-
-       1) Use a suitable shared library mechanism for linking with the
-       Library.  A suitable mechanism is one that (a) uses at run time
-       a copy of the Library already present on the user's computer
-       system, and (b) will operate properly with a modified version
-       of the Library that is interface-compatible with the Linked
-       Version.
-
-   e) Provide Installation Information, but only if you would otherwise
-   be required to provide such information under section 6 of the
-   GNU GPL, and only to the extent that such information is
-   necessary to install and execute a modified version of the
-   Combined Work produced by recombining or relinking the
-   Application with a modified version of the Linked Version. (If
-   you use option 4d0, the Installation Information must accompany
-   the Minimal Corresponding Source and Corresponding Application
-   Code. If you use option 4d1, you must provide the Installation
-   Information in the manner specified by section 6 of the GNU GPL
-   for conveying Corresponding Source.)
-
-  5. Combined Libraries.
-
-  You may place library facilities that are a work based on the
-Library side by side in a single library together with other library
-facilities that are not Applications and are not covered by this
-License, and convey such a combined library under terms of your
-choice, if you do both of the following:
-
-   a) Accompany the combined library with a copy of the same work based
-   on the Library, uncombined with any other library facilities,
-   conveyed under the terms of this License.
-
-   b) Give prominent notice with the combined library that part of it
-   is a work based on the Library, and explaining where to find the
-   accompanying uncombined form of the same work.
-
-  6. Revised Versions of the GNU Lesser General Public License.
-
-  The Free Software Foundation may publish revised and/or new versions
-of the GNU Lesser General Public License from time to time. Such new
-versions will be similar in spirit to the present version, but may
-differ in detail to address new problems or concerns.
-
-  Each version is given a distinguishing version number. If the
-Library as you received it specifies that a certain numbered version
-of the GNU Lesser General Public License "or any later version"
-applies to it, you have the option of following the terms and
-conditions either of that published version or of any later version
-published by the Free Software Foundation. If the Library as you
-received it does not specify a version number of the GNU Lesser
-General Public License, you may choose any version of the GNU Lesser
-General Public License ever published by the Free Software Foundation.
-
-  If the Library as you received it specifies that a proxy can decide
-whether future versions of the GNU Lesser General Public License shall
-apply, that proxy's public statement of acceptance of any version is
-permanent authorization for you to choose that version for the
-Library.
diff --git a/bindings/cxx/chip-info.cpp b/bindings/cxx/chip-info.cpp
index c4f0ab5..93dd6f5 100644
--- a/bindings/cxx/chip-info.cpp
+++ b/bindings/cxx/chip-info.cpp
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-License-Identifier: LGPL-2.1-or-later
 // SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 #include <ostream>
diff --git a/bindings/cxx/chip.cpp b/bindings/cxx/chip.cpp
index d6a3a43..8086839 100644
--- a/bindings/cxx/chip.cpp
+++ b/bindings/cxx/chip.cpp
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-License-Identifier: LGPL-2.1-or-later
 // SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 #include <ostream>
diff --git a/bindings/cxx/edge-event-buffer.cpp b/bindings/cxx/edge-event-buffer.cpp
index c7347a2..0d5cb36 100644
--- a/bindings/cxx/edge-event-buffer.cpp
+++ b/bindings/cxx/edge-event-buffer.cpp
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-License-Identifier: LGPL-2.1-or-later
 // SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 #include <iterator>
diff --git a/bindings/cxx/edge-event.cpp b/bindings/cxx/edge-event.cpp
index 5ff3af2..9ef311c 100644
--- a/bindings/cxx/edge-event.cpp
+++ b/bindings/cxx/edge-event.cpp
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-License-Identifier: LGPL-2.1-or-later
 // SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 #include <map>
diff --git a/bindings/cxx/exception.cpp b/bindings/cxx/exception.cpp
index 6957e78..378b249 100644
--- a/bindings/cxx/exception.cpp
+++ b/bindings/cxx/exception.cpp
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-License-Identifier: LGPL-2.1-or-later
 // SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 #include "internal.hpp"
diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
index b090af4..91e41a5 100644
--- a/bindings/cxx/gpiod.hpp
+++ b/bindings/cxx/gpiod.hpp
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
 /* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
 
 /**
diff --git a/bindings/cxx/gpiodcxx/chip-info.hpp b/bindings/cxx/gpiodcxx/chip-info.hpp
index b6bd0f8..e740e94 100644
--- a/bindings/cxx/gpiodcxx/chip-info.hpp
+++ b/bindings/cxx/gpiodcxx/chip-info.hpp
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
 /* SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl> */
 
 /**
diff --git a/bindings/cxx/gpiodcxx/chip.hpp b/bindings/cxx/gpiodcxx/chip.hpp
index 297db3d..4d67476 100644
--- a/bindings/cxx/gpiodcxx/chip.hpp
+++ b/bindings/cxx/gpiodcxx/chip.hpp
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
 /* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
 
 /**
diff --git a/bindings/cxx/gpiodcxx/edge-event-buffer.hpp b/bindings/cxx/gpiodcxx/edge-event-buffer.hpp
index 025517f..2482e8a 100644
--- a/bindings/cxx/gpiodcxx/edge-event-buffer.hpp
+++ b/bindings/cxx/gpiodcxx/edge-event-buffer.hpp
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
 /* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
 
 /**
diff --git a/bindings/cxx/gpiodcxx/edge-event.hpp b/bindings/cxx/gpiodcxx/edge-event.hpp
index 4fde561..47c256a 100644
--- a/bindings/cxx/gpiodcxx/edge-event.hpp
+++ b/bindings/cxx/gpiodcxx/edge-event.hpp
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
 /* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
 
 /**
diff --git a/bindings/cxx/gpiodcxx/exception.hpp b/bindings/cxx/gpiodcxx/exception.hpp
index e89b384..34737d2 100644
--- a/bindings/cxx/gpiodcxx/exception.hpp
+++ b/bindings/cxx/gpiodcxx/exception.hpp
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
 /* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
 
 /**
diff --git a/bindings/cxx/gpiodcxx/info-event.hpp b/bindings/cxx/gpiodcxx/info-event.hpp
index e99cbc4..69b88b6 100644
--- a/bindings/cxx/gpiodcxx/info-event.hpp
+++ b/bindings/cxx/gpiodcxx/info-event.hpp
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
 /* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
 
 /**
diff --git a/bindings/cxx/gpiodcxx/line-config.hpp b/bindings/cxx/gpiodcxx/line-config.hpp
index 8a3335c..58c9d87 100644
--- a/bindings/cxx/gpiodcxx/line-config.hpp
+++ b/bindings/cxx/gpiodcxx/line-config.hpp
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
 /* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
 
 /**
diff --git a/bindings/cxx/gpiodcxx/line-info.hpp b/bindings/cxx/gpiodcxx/line-info.hpp
index 26d25a9..8b10dc4 100644
--- a/bindings/cxx/gpiodcxx/line-info.hpp
+++ b/bindings/cxx/gpiodcxx/line-info.hpp
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
 /* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
 
 /**
diff --git a/bindings/cxx/gpiodcxx/line-request.hpp b/bindings/cxx/gpiodcxx/line-request.hpp
index dfe3e0f..fcc4e0e 100644
--- a/bindings/cxx/gpiodcxx/line-request.hpp
+++ b/bindings/cxx/gpiodcxx/line-request.hpp
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
 /* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
 
 /**
diff --git a/bindings/cxx/gpiodcxx/line-settings.hpp b/bindings/cxx/gpiodcxx/line-settings.hpp
index bacf359..1004ccd 100644
--- a/bindings/cxx/gpiodcxx/line-settings.hpp
+++ b/bindings/cxx/gpiodcxx/line-settings.hpp
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
 /* SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl> */
 
 /**
diff --git a/bindings/cxx/gpiodcxx/line.hpp b/bindings/cxx/gpiodcxx/line.hpp
index 5d0752a..2810571 100644
--- a/bindings/cxx/gpiodcxx/line.hpp
+++ b/bindings/cxx/gpiodcxx/line.hpp
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
 /* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
 
 /**
diff --git a/bindings/cxx/gpiodcxx/misc.hpp b/bindings/cxx/gpiodcxx/misc.hpp
index 1e41e9b..eab8eba 100644
--- a/bindings/cxx/gpiodcxx/misc.hpp
+++ b/bindings/cxx/gpiodcxx/misc.hpp
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
 /* SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl> */
 
 /**
diff --git a/bindings/cxx/gpiodcxx/request-builder.hpp b/bindings/cxx/gpiodcxx/request-builder.hpp
index 90cc8f0..192bd91 100644
--- a/bindings/cxx/gpiodcxx/request-builder.hpp
+++ b/bindings/cxx/gpiodcxx/request-builder.hpp
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
 /* SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl> */
 
 /**
diff --git a/bindings/cxx/gpiodcxx/request-config.hpp b/bindings/cxx/gpiodcxx/request-config.hpp
index b099eb1..6ebbf99 100644
--- a/bindings/cxx/gpiodcxx/request-config.hpp
+++ b/bindings/cxx/gpiodcxx/request-config.hpp
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
 /* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
 
 /**
diff --git a/bindings/cxx/gpiodcxx/timestamp.hpp b/bindings/cxx/gpiodcxx/timestamp.hpp
index 7143ab3..fcb4d8d 100644
--- a/bindings/cxx/gpiodcxx/timestamp.hpp
+++ b/bindings/cxx/gpiodcxx/timestamp.hpp
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
 /* SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl> */
 
 /**
diff --git a/bindings/cxx/info-event.cpp b/bindings/cxx/info-event.cpp
index 0b19ee9..1f6d0d7 100644
--- a/bindings/cxx/info-event.cpp
+++ b/bindings/cxx/info-event.cpp
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-License-Identifier: LGPL-2.1-or-later
 // SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 #include <map>
diff --git a/bindings/cxx/internal.cpp b/bindings/cxx/internal.cpp
index 9f1f38f..237d5d5 100644
--- a/bindings/cxx/internal.cpp
+++ b/bindings/cxx/internal.cpp
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-License-Identifier: LGPL-2.1-or-later
 // SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 #include <map>
diff --git a/bindings/cxx/internal.hpp b/bindings/cxx/internal.hpp
index db78af6..b64daf1 100644
--- a/bindings/cxx/internal.hpp
+++ b/bindings/cxx/internal.hpp
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
 /* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
 
 #ifndef __LIBGPIOD_CXX_INTERNAL_HPP__
diff --git a/bindings/cxx/line-config.cpp b/bindings/cxx/line-config.cpp
index 1179e0a..7e3dc8c 100644
--- a/bindings/cxx/line-config.cpp
+++ b/bindings/cxx/line-config.cpp
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-License-Identifier: LGPL-2.1-or-later
 // SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 #include <cstdlib>
diff --git a/bindings/cxx/line-info.cpp b/bindings/cxx/line-info.cpp
index 9931ed0..2117f68 100644
--- a/bindings/cxx/line-info.cpp
+++ b/bindings/cxx/line-info.cpp
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-License-Identifier: LGPL-2.1-or-later
 // SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 #include <map>
diff --git a/bindings/cxx/line-request.cpp b/bindings/cxx/line-request.cpp
index e8e0b96..f6b0a66 100644
--- a/bindings/cxx/line-request.cpp
+++ b/bindings/cxx/line-request.cpp
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-License-Identifier: LGPL-2.1-or-later
 // SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 #include <iterator>
diff --git a/bindings/cxx/line-settings.cpp b/bindings/cxx/line-settings.cpp
index 30d7899..300858a 100644
--- a/bindings/cxx/line-settings.cpp
+++ b/bindings/cxx/line-settings.cpp
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-License-Identifier: LGPL-2.1-or-later
 // SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 #include <map>
diff --git a/bindings/cxx/line.cpp b/bindings/cxx/line.cpp
index d99e8fa..d6a92c1 100644
--- a/bindings/cxx/line.cpp
+++ b/bindings/cxx/line.cpp
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-License-Identifier: LGPL-2.1-or-later
 // SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 #include <iterator>
diff --git a/bindings/cxx/misc.cpp b/bindings/cxx/misc.cpp
index dde48e0..eba0b46 100644
--- a/bindings/cxx/misc.cpp
+++ b/bindings/cxx/misc.cpp
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-License-Identifier: LGPL-2.1-or-later
 // SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 #include "internal.hpp"
diff --git a/bindings/cxx/request-builder.cpp b/bindings/cxx/request-builder.cpp
index d11e47b..87ee2fe 100644
--- a/bindings/cxx/request-builder.cpp
+++ b/bindings/cxx/request-builder.cpp
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-License-Identifier: LGPL-2.1-or-later
 // SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 #include <ostream>
diff --git a/bindings/cxx/request-config.cpp b/bindings/cxx/request-config.cpp
index e578b15..b44b8b6 100644
--- a/bindings/cxx/request-config.cpp
+++ b/bindings/cxx/request-config.cpp
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-License-Identifier: LGPL-2.1-or-later
 // SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
 
 #include <ostream>
diff --git a/bindings/cxx/tests/gpiosim.cpp b/bindings/cxx/tests/gpiosim.cpp
index 7267e6d..4bda5a2 100644
--- a/bindings/cxx/tests/gpiosim.cpp
+++ b/bindings/cxx/tests/gpiosim.cpp
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
 /* SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl> */
 
 #include <map>
diff --git a/bindings/cxx/tests/gpiosim.hpp b/bindings/cxx/tests/gpiosim.hpp
index 320ae96..8151af6 100644
--- a/bindings/cxx/tests/gpiosim.hpp
+++ b/bindings/cxx/tests/gpiosim.hpp
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
 /* SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl> */
 
 #ifndef __GPIOD_CXX_GPIOSIM_HPP__
diff --git a/bindings/cxx/tests/helpers.cpp b/bindings/cxx/tests/helpers.cpp
index 6534fdb..eb2c3db 100644
--- a/bindings/cxx/tests/helpers.cpp
+++ b/bindings/cxx/tests/helpers.cpp
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-License-Identifier: LGPL-2.1-or-later
 // SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 #include "helpers.hpp"
diff --git a/bindings/cxx/tests/helpers.hpp b/bindings/cxx/tests/helpers.hpp
index 157d221..62d9827 100644
--- a/bindings/cxx/tests/helpers.hpp
+++ b/bindings/cxx/tests/helpers.hpp
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
 /* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
 
 #ifndef __GPIOD_CXX_TEST_HELPERS_HPP__
-- 
2.40.1


