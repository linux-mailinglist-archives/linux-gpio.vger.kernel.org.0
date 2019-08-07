Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EB368541F
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2019 21:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388669AbfHGTwE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Aug 2019 15:52:04 -0400
Received: from mx2.mailbox.org ([80.241.60.215]:16408 "EHLO mx2.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388488AbfHGTwD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 7 Aug 2019 15:52:03 -0400
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:105:465:1:2:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mx2.mailbox.org (Postfix) with ESMTPS id BFD72A1050
        for <linux-gpio@vger.kernel.org>; Wed,  7 Aug 2019 21:52:01 +0200 (CEST)
Authentication-Results: spamfilter03.heinlein-hosting.de (amavisd-new);
        dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
        header.d=mailbox.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1565207521; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=H1m80uKzIAFE/mF3ndNDkAbvlnV/ue1wAtMWXnY8wv0=;
        b=SG5OiQVMZgoC5Lyv92BO9ZDwvqf4K5qwznQPOjGHQs2CZJv9WqijNkyRWhXZRerHLE+Rur
        DHyb+oFkXj/bzAzcQEkTGX6eZ8eiLgxkLYWb64QAeQgGBKuTFjPErwJuPIqI6a9WT0uLWS
        wKlLJPqiWvXQWel06stTvztwnKKhOE5jIOnFJ2qiKcnKuZLZki83cJteU0BxBN4xBo/PP3
        6zEFFcca+oCXsdW9Mfmit7DpMps/kzbNE+z0YzXOA4SaLDCPAtiCAyZ972zAR/2xBZk0HB
        t4vtslp88KDiWw3wD7XoS3Zvh92ZdM/W83Qp4i5eW7IOSqjT9RNZulUz18GAwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
        content-transfer-encoding:mime-version:message-id:date:date
        :subject:subject:from:from:received; s=mail20150812; t=
        1565207508; bh=IVLMiHuS37YI+EtvtBodmJvmLHM9nzIPIlYlrxOirRo=; b=I
        XN1Ogc3Km9qr7AFf9Mq+2jdESn4JE1lm09XRpMY85IwigMPpxlIKs14M4KfsXmUl
        DPuHmE7k1dKHc/aPKUGPj1+xfPQyw9GJ40oAJV67iq753DRUI4P8A47FfOB3oFwX
        dIGp0GGEUGN44OMFF4Htnfok9aJvQ6yYpHeZTU3peUhtwOfP3IBick7rT0iK+CoI
        G3RxdIeGPk9xSNtUVAEiqjPMEJJKnfB5t5xmAIx+0dzgSep5EDVnynPrhcO3deSk
        K8LctGldjKfEk65hrBxiaSFp1mRPBxk7cuu0JeR4CcPDwrev4TCTLQW4yNoqwsKj
        NY1DgnFtpfH4LJokKTBCw==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de [80.241.56.117]) (amavisd-new, port 10030)
        with ESMTP id YeBPhWT1Xd4T; Wed,  7 Aug 2019 21:51:48 +0200 (CEST)
From:   Alexander Stein <alexander.stein@mailbox.org>
To:     linux-gpio@vger.kernel.org
Cc:     Alexander Stein <alexander.stein@mailbox.org>
Subject: [libgpiod] [PATCH 1/5] bindings: cxx: Use 'upstream' include path
Date:   Wed,  7 Aug 2019 21:51:28 +0200
Message-Id: <20190807195132.7538-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

According to https://github.com/catchorg/Catch2/issues/1202 the
regular include is 'catch2/catch.hpp'
Also CMake and pkg-config provide include paths for this include name.

Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
---
 bindings/cxx/tests/gpiod-cxx-test.cpp | 2 +-
 bindings/cxx/tests/tests-chip.cpp     | 2 +-
 bindings/cxx/tests/tests-event.cpp    | 2 +-
 bindings/cxx/tests/tests-iter.cpp     | 2 +-
 bindings/cxx/tests/tests-line.cpp     | 2 +-
 configure.ac                          | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/bindings/cxx/tests/gpiod-cxx-test.cpp b/bindings/cxx/tests/gpiod-cxx-test.cpp
index fbae84f..236fd2d 100644
--- a/bindings/cxx/tests/gpiod-cxx-test.cpp
+++ b/bindings/cxx/tests/gpiod-cxx-test.cpp
@@ -6,7 +6,7 @@
  */
 
 #define CATCH_CONFIG_MAIN
-#include <catch.hpp>
+#include <catch2/catch.hpp>
 #include <linux/version.h>
 #include <sys/utsname.h>
 #include <system_error>
diff --git a/bindings/cxx/tests/tests-chip.cpp b/bindings/cxx/tests/tests-chip.cpp
index 276b533..11c2d4c 100644
--- a/bindings/cxx/tests/tests-chip.cpp
+++ b/bindings/cxx/tests/tests-chip.cpp
@@ -5,7 +5,7 @@
  * Copyright (C) 2019 Bartosz Golaszewski <bgolaszewski@baylibre.com>
  */
 
-#include <catch.hpp>
+#include <catch2/catch.hpp>
 #include <gpiod.hpp>
 
 #include "gpio-mockup.hpp"
diff --git a/bindings/cxx/tests/tests-event.cpp b/bindings/cxx/tests/tests-event.cpp
index f93bb72..b34347f 100644
--- a/bindings/cxx/tests/tests-event.cpp
+++ b/bindings/cxx/tests/tests-event.cpp
@@ -5,7 +5,7 @@
  * Copyright (C) 2019 Bartosz Golaszewski <bgolaszewski@baylibre.com>
  */
 
-#include <catch.hpp>
+#include <catch2/catch.hpp>
 #include <gpiod.hpp>
 #include <map>
 #include <poll.h>
diff --git a/bindings/cxx/tests/tests-iter.cpp b/bindings/cxx/tests/tests-iter.cpp
index 1af0256..fdc2cb5 100644
--- a/bindings/cxx/tests/tests-iter.cpp
+++ b/bindings/cxx/tests/tests-iter.cpp
@@ -5,7 +5,7 @@
  * Copyright (C) 2019 Bartosz Golaszewski <bgolaszewski@baylibre.com>
  */
 
-#include <catch.hpp>
+#include <catch2/catch.hpp>
 #include <gpiod.hpp>
 
 #include "gpio-mockup.hpp"
diff --git a/bindings/cxx/tests/tests-line.cpp b/bindings/cxx/tests/tests-line.cpp
index 2684bcb..e827e60 100644
--- a/bindings/cxx/tests/tests-line.cpp
+++ b/bindings/cxx/tests/tests-line.cpp
@@ -5,7 +5,7 @@
  * Copyright (C) 2019 Bartosz Golaszewski <bgolaszewski@baylibre.com>
  */
 
-#include <catch.hpp>
+#include <catch2/catch.hpp>
 #include <gpiod.hpp>
 
 #include "gpio-mockup.hpp"
diff --git a/configure.ac b/configure.ac
index f72e13b..0459007 100644
--- a/configure.ac
+++ b/configure.ac
@@ -165,7 +165,7 @@ then
 	if test "x$with_tests" = xtrue
 	then
 		AC_LANG_PUSH([C++])
-		AC_CHECK_HEADERS([catch.hpp], [], [HEADER_NOT_FOUND_CXX([catch.hpp])])
+		AC_CHECK_HEADERS([catch2/catch.hpp], [], [HEADER_NOT_FOUND_CXX([catch2/catch.hpp])])
 		AC_LANG_POP([C++])
 	fi
 fi
-- 
2.22.0

