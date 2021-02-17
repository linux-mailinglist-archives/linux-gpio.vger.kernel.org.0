Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 105BF31D9F1
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Feb 2021 14:05:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232220AbhBQNDZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Feb 2021 08:03:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232837AbhBQNDV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Feb 2021 08:03:21 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19EF8C0613D6
        for <linux-gpio@vger.kernel.org>; Wed, 17 Feb 2021 05:02:41 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id u14so17330511wri.3
        for <linux-gpio@vger.kernel.org>; Wed, 17 Feb 2021 05:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Bzg79/29OhbB6lxc5VZo3gmz1Yd0Or4Fa/047kiocsg=;
        b=TFZvwAmZKYX+tuTbyt+f9dcNS1P8wlzBPpSxKJUS1FqZ5YR57GoHi+1Yt1BReCHaUH
         GQHV/1bQVU67GD0WoZt8orbnUMBJb/PCTvAFXcO/mzkME1x0z5yYzWz0DIl9Vmc5sV/X
         SDyY2v4/WSYAkxg/G++wVK4k1baLjKCEOmR9i8UTjphUeCufkKMLS74E+iv9tGtfJNhe
         /Bzm5n2BdjV6yfM+k3SzObBeSX0erOX1xveEIwUm0ECms/Zyq3Jp8/lvPO05XE4hDuLg
         0KWDTs+d1OXlkyhdihqUNp1XbWBuwE3avJNfj4A92PEfQdLsAkHujKkMCqaGdEoBm8xP
         R+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bzg79/29OhbB6lxc5VZo3gmz1Yd0Or4Fa/047kiocsg=;
        b=EhAULH3QuJ9eZ7ERc+3NdijJUdNPvd4bHE4LnyMDI4Ge0jTlNqk25WUbwJKeOUexYW
         9yXB0peCHBsk7wMjc5166QVHjZM3yQfiCcxx8xSH4kYzSpLc9tNHQJ8NS7X0awNgT+jL
         iI+MONt1UvDL0gRecfmX4ehbiiOJ6ShlXXHJ4YD6ONYKeohmn/FmmLkXGHeiNcpLoH9n
         5hAKrECSxUEMA3s17XS4OXNwiWxqPV2/GkwT7OmJpmYN2FVoyqSMOhTBg9b8uKX0leoY
         M+VFPbGyHoNmzsv9Jd7a7O9wYLM/1WvB1t1wOzTuuxKbkfHZa+zmWLrfE/6dX1SxsM5e
         Z37w==
X-Gm-Message-State: AOAM530X/g/sr3ye2NxCJ6O1UgqZyyJ8IlicJgjoMOnuTyvkY9pqTU9x
        eVtRGyZIxLqRWjeVsKotdrjlUA==
X-Google-Smtp-Source: ABdhPJyqLWoHxbLR6LrxBFwP354gf7yq0X0nGZuMInqKoCjb4JRTgHlZ5gaScWK1aNr6yeZ82HdI/g==
X-Received: by 2002:adf:ab18:: with SMTP id q24mr29066689wrc.80.1613566959658;
        Wed, 17 Feb 2021 05:02:39 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id w8sm3910789wrm.21.2021.02.17.05.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 05:02:39 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 3/3] licensing: relicense C++ library code under LGPL-3.0-or-later
Date:   Wed, 17 Feb 2021 14:02:25 +0100
Message-Id: <20210217130225.6378-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20210217130225.6378-1-brgl@bgdev.pl>
References: <20210217130225.6378-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Using LGPL-2.1 for C++ library code is an issue raised several times on
the linux-gpio mailing list. Programs using C++ libraries often include
significant portions of code generated behind the scenes from C++ headers
(via templates, default implementations etc.).

Section 3 of LGPL-3.0 clarifies the use of code defined in or generated
from C++ headers so this changset proposes to use LGPL-3.0 for all C++
library code in libgpiod.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 LICENSES/LGPL-3.0-or-later.txt     | 165 +++++++++++++++++++++++++++++
 Makefile.am                        |   1 +
 bindings/cxx/chip.cpp              |   2 +-
 bindings/cxx/gpiod.hpp             |   2 +-
 bindings/cxx/iter.cpp              |   2 +-
 bindings/cxx/line.cpp              |   2 +-
 bindings/cxx/line_bulk.cpp         |   2 +-
 bindings/cxx/tests/gpio-mockup.cpp |   2 +-
 bindings/cxx/tests/gpio-mockup.hpp |   2 +-
 9 files changed, 173 insertions(+), 7 deletions(-)
 create mode 100644 LICENSES/LGPL-3.0-or-later.txt

diff --git a/LICENSES/LGPL-3.0-or-later.txt b/LICENSES/LGPL-3.0-or-later.txt
new file mode 100644
index 0000000..0a04128
--- /dev/null
+++ b/LICENSES/LGPL-3.0-or-later.txt
@@ -0,0 +1,165 @@
+                   GNU LESSER GENERAL PUBLIC LICENSE
+                       Version 3, 29 June 2007
+
+ Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
+ Everyone is permitted to copy and distribute verbatim copies
+ of this license document, but changing it is not allowed.
+
+
+  This version of the GNU Lesser General Public License incorporates
+the terms and conditions of version 3 of the GNU General Public
+License, supplemented by the additional permissions listed below.
+
+  0. Additional Definitions.
+
+  As used herein, "this License" refers to version 3 of the GNU Lesser
+General Public License, and the "GNU GPL" refers to version 3 of the GNU
+General Public License.
+
+  "The Library" refers to a covered work governed by this License,
+other than an Application or a Combined Work as defined below.
+
+  An "Application" is any work that makes use of an interface provided
+by the Library, but which is not otherwise based on the Library.
+Defining a subclass of a class defined by the Library is deemed a mode
+of using an interface provided by the Library.
+
+  A "Combined Work" is a work produced by combining or linking an
+Application with the Library.  The particular version of the Library
+with which the Combined Work was made is also called the "Linked
+Version".
+
+  The "Minimal Corresponding Source" for a Combined Work means the
+Corresponding Source for the Combined Work, excluding any source code
+for portions of the Combined Work that, considered in isolation, are
+based on the Application, and not on the Linked Version.
+
+  The "Corresponding Application Code" for a Combined Work means the
+object code and/or source code for the Application, including any data
+and utility programs needed for reproducing the Combined Work from the
+Application, but excluding the System Libraries of the Combined Work.
+
+  1. Exception to Section 3 of the GNU GPL.
+
+  You may convey a covered work under sections 3 and 4 of this License
+without being bound by section 3 of the GNU GPL.
+
+  2. Conveying Modified Versions.
+
+  If you modify a copy of the Library, and, in your modifications, a
+facility refers to a function or data to be supplied by an Application
+that uses the facility (other than as an argument passed when the
+facility is invoked), then you may convey a copy of the modified
+version:
+
+   a) under this License, provided that you make a good faith effort to
+   ensure that, in the event an Application does not supply the
+   function or data, the facility still operates, and performs
+   whatever part of its purpose remains meaningful, or
+
+   b) under the GNU GPL, with none of the additional permissions of
+   this License applicable to that copy.
+
+  3. Object Code Incorporating Material from Library Header Files.
+
+  The object code form of an Application may incorporate material from
+a header file that is part of the Library.  You may convey such object
+code under terms of your choice, provided that, if the incorporated
+material is not limited to numerical parameters, data structure
+layouts and accessors, or small macros, inline functions and templates
+(ten or fewer lines in length), you do both of the following:
+
+   a) Give prominent notice with each copy of the object code that the
+   Library is used in it and that the Library and its use are
+   covered by this License.
+
+   b) Accompany the object code with a copy of the GNU GPL and this license
+   document.
+
+  4. Combined Works.
+
+  You may convey a Combined Work under terms of your choice that,
+taken together, effectively do not restrict modification of the
+portions of the Library contained in the Combined Work and reverse
+engineering for debugging such modifications, if you also do each of
+the following:
+
+   a) Give prominent notice with each copy of the Combined Work that
+   the Library is used in it and that the Library and its use are
+   covered by this License.
+
+   b) Accompany the Combined Work with a copy of the GNU GPL and this license
+   document.
+
+   c) For a Combined Work that displays copyright notices during
+   execution, include the copyright notice for the Library among
+   these notices, as well as a reference directing the user to the
+   copies of the GNU GPL and this license document.
+
+   d) Do one of the following:
+
+       0) Convey the Minimal Corresponding Source under the terms of this
+       License, and the Corresponding Application Code in a form
+       suitable for, and under terms that permit, the user to
+       recombine or relink the Application with a modified version of
+       the Linked Version to produce a modified Combined Work, in the
+       manner specified by section 6 of the GNU GPL for conveying
+       Corresponding Source.
+
+       1) Use a suitable shared library mechanism for linking with the
+       Library.  A suitable mechanism is one that (a) uses at run time
+       a copy of the Library already present on the user's computer
+       system, and (b) will operate properly with a modified version
+       of the Library that is interface-compatible with the Linked
+       Version.
+
+   e) Provide Installation Information, but only if you would otherwise
+   be required to provide such information under section 6 of the
+   GNU GPL, and only to the extent that such information is
+   necessary to install and execute a modified version of the
+   Combined Work produced by recombining or relinking the
+   Application with a modified version of the Linked Version. (If
+   you use option 4d0, the Installation Information must accompany
+   the Minimal Corresponding Source and Corresponding Application
+   Code. If you use option 4d1, you must provide the Installation
+   Information in the manner specified by section 6 of the GNU GPL
+   for conveying Corresponding Source.)
+
+  5. Combined Libraries.
+
+  You may place library facilities that are a work based on the
+Library side by side in a single library together with other library
+facilities that are not Applications and are not covered by this
+License, and convey such a combined library under terms of your
+choice, if you do both of the following:
+
+   a) Accompany the combined library with a copy of the same work based
+   on the Library, uncombined with any other library facilities,
+   conveyed under the terms of this License.
+
+   b) Give prominent notice with the combined library that part of it
+   is a work based on the Library, and explaining where to find the
+   accompanying uncombined form of the same work.
+
+  6. Revised Versions of the GNU Lesser General Public License.
+
+  The Free Software Foundation may publish revised and/or new versions
+of the GNU Lesser General Public License from time to time. Such new
+versions will be similar in spirit to the present version, but may
+differ in detail to address new problems or concerns.
+
+  Each version is given a distinguishing version number. If the
+Library as you received it specifies that a certain numbered version
+of the GNU Lesser General Public License "or any later version"
+applies to it, you have the option of following the terms and
+conditions either of that published version or of any later version
+published by the Free Software Foundation. If the Library as you
+received it does not specify a version number of the GNU Lesser
+General Public License, you may choose any version of the GNU Lesser
+General Public License ever published by the Free Software Foundation.
+
+  If the Library as you received it specifies that a proxy can decide
+whether future versions of the GNU Lesser General Public License shall
+apply, that proxy's public statement of acceptance of any version is
+permanent authorization for you to choose that version for the
+Library.
diff --git a/Makefile.am b/Makefile.am
index 0e44305..dfc6c95 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -10,6 +10,7 @@ EXTRA_DIST = \
 	LICENSES/GPL-2.0-only.txt \
 	LICENSES/GPL-2.0-or-later.txt \
 	LICENSES/LGPL-2.1-or-later.txt \
+	LICENSES/LGPL-3.0-or-later.txt \
 	LICENSES/Linux-syscall-note.txt
 
 if WITH_TOOLS
diff --git a/bindings/cxx/chip.cpp b/bindings/cxx/chip.cpp
index 49c5602..5b8125b 100644
--- a/bindings/cxx/chip.cpp
+++ b/bindings/cxx/chip.cpp
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-License-Identifier: LGPL-3.0-or-later
 // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <functional>
diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
index 84669e7..d987b3a 100644
--- a/bindings/cxx/gpiod.hpp
+++ b/bindings/cxx/gpiod.hpp
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
 /* SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com> */
 
 #ifndef __LIBGPIOD_GPIOD_CXX_HPP__
diff --git a/bindings/cxx/iter.cpp b/bindings/cxx/iter.cpp
index 0d7e90a..eba7d30 100644
--- a/bindings/cxx/iter.cpp
+++ b/bindings/cxx/iter.cpp
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-License-Identifier: LGPL-3.0-or-later
 // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <gpiod.hpp>
diff --git a/bindings/cxx/line.cpp b/bindings/cxx/line.cpp
index d24df18..1d114ac 100644
--- a/bindings/cxx/line.cpp
+++ b/bindings/cxx/line.cpp
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-License-Identifier: LGPL-3.0-or-later
 // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <gpiod.hpp>
diff --git a/bindings/cxx/line_bulk.cpp b/bindings/cxx/line_bulk.cpp
index b31efb5..d40364d 100644
--- a/bindings/cxx/line_bulk.cpp
+++ b/bindings/cxx/line_bulk.cpp
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-License-Identifier: LGPL-3.0-or-later
 // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <gpiod.hpp>
diff --git a/bindings/cxx/tests/gpio-mockup.cpp b/bindings/cxx/tests/gpio-mockup.cpp
index 54e69b7..2e99dd4 100644
--- a/bindings/cxx/tests/gpio-mockup.cpp
+++ b/bindings/cxx/tests/gpio-mockup.cpp
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-License-Identifier: LGPL-3.0-or-later
 // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <system_error>
diff --git a/bindings/cxx/tests/gpio-mockup.hpp b/bindings/cxx/tests/gpio-mockup.hpp
index 7a071fb..9ca27bd 100644
--- a/bindings/cxx/tests/gpio-mockup.hpp
+++ b/bindings/cxx/tests/gpio-mockup.hpp
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
 /* SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com> */
 
 #ifndef __GPIOD_CXX_TEST_HPP__
-- 
2.29.1

