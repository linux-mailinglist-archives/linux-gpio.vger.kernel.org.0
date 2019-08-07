Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF9368541C
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2019 21:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388612AbfHGTv5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Aug 2019 15:51:57 -0400
Received: from mx2.mailbox.org ([80.241.60.215]:16084 "EHLO mx2.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388530AbfHGTv5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 7 Aug 2019 15:51:57 -0400
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mx2.mailbox.org (Postfix) with ESMTPS id 8BD1FA10D7
        for <linux-gpio@vger.kernel.org>; Wed,  7 Aug 2019 21:51:54 +0200 (CEST)
Authentication-Results: spamfilter04.heinlein-hosting.de (amavisd-new);
        dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
        header.d=mailbox.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1565207514;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SIbEZkys0xQkypKxJ37FNkvw177E8S5bs4RtcY9Y55I=;
        b=NRqRQLK5/RVqPxxYIh653PURBEhusMf8rRr9ic0DAYxWJZsQAn0/CDTaUwJ8xwr/ga64e0
        PQZg761IYKKDclnVbKMzauyeMKQFzcnzhrkNqxygX1rk1hXA13X2GyEoeomruCDV1JVBVH
        Mf8vIC5weL26/etmjpaC+wgcKTTkWhwLefFXoT2tIf5zuTWAxoT3fuorK4zpHPIP6b8haV
        7AUjwLHMV5RsE/kfdzaYhy0uV1dy1GL3R/7o9ogohRV9W6SHMGM8gxT+el+195zh9+GkDl
        +/2huYj1fshLi2qATiXu55e57A93SfBit4y74c1zcHmUUGtiBwWzzs6QgunHSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
        content-transfer-encoding:mime-version:references:in-reply-to
        :message-id:date:date:subject:subject:from:from:received; s=
        mail20150812; t=1565207509; bh=Wh4n28IkQbo1GN1qbpNUAgM5wbfksXu0A
        wsJv3VKJNQ=; b=ZVHkOgwpFWDw/r0KFptEZpIlOqsB9LAZ4ozRUCfNn7h5cj+eB
        7Oo85GUC6zs4f5Hr4UyuMBHhuh/cgEWoaXMQzflC7Q+5NHxQo0CYq/G/GryhEU8L
        SxWncAUuZ8eWV9RajeBt1inlZ85pgoJXDYgDTxIcnkHB/2zYKV0alYxW9p72EsWe
        /GwKWJ3PoWFwFhFDcbqc4qgUXC2xjfF0LfBY/dmVSuJ7RVezmJZKEUhGkg1BwlKi
        rxfHPkq7NmDP7oUdtE+66YyFyK15y0efitrZgT2Dnj3nJ9kKC5ljCpuCaKfQ4NPN
        CvbDpcRL4fzbJYnwyUdKylg47pHkHZemNLpzw==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de [80.241.56.122]) (amavisd-new, port 10030)
        with ESMTP id hOPQazYG9AeC; Wed,  7 Aug 2019 21:51:49 +0200 (CEST)
From:   Alexander Stein <alexander.stein@mailbox.org>
To:     linux-gpio@vger.kernel.org
Cc:     Alexander Stein <alexander.stein@mailbox.org>
Subject: [libgpiod] [PATCH 3/5] bindings: cxx: Split out catch's main()
Date:   Wed,  7 Aug 2019 21:51:30 +0200
Message-Id: <20190807195132.7538-3-alexander.stein@mailbox.org>
In-Reply-To: <20190807195132.7538-1-alexander.stein@mailbox.org>
References: <20190807195132.7538-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Compiling the source using CATCH_CONFIG_MAIN to provide main() takes
several seconds, so split it out from any library testing code, so it
really needs to be built once only.

Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
---
 bindings/cxx/tests/Makefile.am             | 3 ++-
 bindings/cxx/tests/gpiod-cxx-test-main.cpp | 2 ++
 bindings/cxx/tests/gpiod-cxx-test.cpp      | 2 --
 3 files changed, 4 insertions(+), 3 deletions(-)
 create mode 100644 bindings/cxx/tests/gpiod-cxx-test-main.cpp

diff --git a/bindings/cxx/tests/Makefile.am b/bindings/cxx/tests/Makefile.am
index d1da0d3..5800a23 100644
--- a/bindings/cxx/tests/Makefile.am
+++ b/bindings/cxx/tests/Makefile.am
@@ -15,7 +15,8 @@ AM_LDFLAGS += -pthread
 
 bin_PROGRAMS = gpiod-cxx-test
 
-gpiod_cxx_test_SOURCES =	gpiod-cxx-test.cpp \
+gpiod_cxx_test_SOURCES =	gpiod-cxx-test-main.cpp \
+				gpiod-cxx-test.cpp \
 				gpio-mockup.cpp \
 				gpio-mockup.hpp \
 				tests-chip.cpp \
diff --git a/bindings/cxx/tests/gpiod-cxx-test-main.cpp b/bindings/cxx/tests/gpiod-cxx-test-main.cpp
new file mode 100644
index 0000000..4ed06df
--- /dev/null
+++ b/bindings/cxx/tests/gpiod-cxx-test-main.cpp
@@ -0,0 +1,2 @@
+#define CATCH_CONFIG_MAIN
+#include <catch2/catch.hpp>
diff --git a/bindings/cxx/tests/gpiod-cxx-test.cpp b/bindings/cxx/tests/gpiod-cxx-test.cpp
index 236fd2d..e110a3c 100644
--- a/bindings/cxx/tests/gpiod-cxx-test.cpp
+++ b/bindings/cxx/tests/gpiod-cxx-test.cpp
@@ -5,8 +5,6 @@
  * Copyright (C) 2019 Bartosz Golaszewski <bgolaszewski@baylibre.com>
  */
 
-#define CATCH_CONFIG_MAIN
-#include <catch2/catch.hpp>
 #include <linux/version.h>
 #include <sys/utsname.h>
 #include <system_error>
-- 
2.22.0

