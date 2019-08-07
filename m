Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B49DA8541E
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2019 21:52:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388639AbfHGTwA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Aug 2019 15:52:00 -0400
Received: from mx2.mailbox.org ([80.241.60.215]:16202 "EHLO mx2.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388488AbfHGTwA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 7 Aug 2019 15:52:00 -0400
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:105:465:1:2:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mx2.mailbox.org (Postfix) with ESMTPS id 94463A11FA
        for <linux-gpio@vger.kernel.org>; Wed,  7 Aug 2019 21:51:57 +0200 (CEST)
Authentication-Results: spamfilter06.heinlein-hosting.de (amavisd-new);
        dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
        header.d=mailbox.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1565207517; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZM0q6fG66z18NMdEyIKUnWJVFj6hjUgzfqunUf4LTSw=;
        b=AgBF6h/WUuR9fIEMjABnmgXjofFW8H1ph1D9N6iUtekfH1GY5V2eU+eltIy2JsqQe0SfcL
        YUmFdwWycyKeaqRvYRN4a4Q4+j1AFO3yzi46OCZUXLYAd/huS3sRDncolk5OT/epVxOCxp
        JacMAC/7aSxq54q5knSMCqfVnjNfCrtI7bzXWQFaAOAxWlPVARTifFbAX4c4wQsK33YjxQ
        +68mxJ+J8LOHGAUsGlVP7uvGH16gBrpsJq2i4TPvRF9Y3SUuSby0xS68R82U5NU3zXZVCu
        NaVa+2RGCquMqOaYEZD24vV3J031sYDbBRD5UbnwiCkw5s42ryaJMY/SEJZPZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
        content-transfer-encoding:mime-version:references:in-reply-to
        :message-id:date:date:subject:subject:from:from:received; s=
        mail20150812; t=1565207508; bh=O0z/UI7q2gKvi236q3df6pyPF0i2asc5U
        +3NawpeZvI=; b=xB5Ql0eemoFiQrUfssQcPWG5VZyI9qmDssyrfZgwYEm1UV+cy
        JKE4s6I5RIFtJeHGkD4SxzXveWtGqqilsRyXlOdtyIP3o8ez6l9S++9MWaO76QDD
        u6W/1xPsf1WXGFYcs7JM8v4oWCTFyLfXCz6JRZf1OkPkIA6dWongACcWNOC8/dy5
        QqTNNPymtn0x8ppRWoOy+yBqsEk8MA+FTL9OGKIxHb5f/Pyv9EcXUZQvchOek+PE
        RFMS3Zq1MlZT8Ij0gXpnPFOqC4uQ/Q95bSjUf5k+Wz7GqBDBxB/A2YCypUfo7eRB
        F5Oxt9jsCLZrjg38kWuV4JZvVCmO1R8OVIMAA==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de [80.241.56.125]) (amavisd-new, port 10030)
        with ESMTP id LmkfEiqe_tpU; Wed,  7 Aug 2019 21:51:48 +0200 (CEST)
From:   Alexander Stein <alexander.stein@mailbox.org>
To:     linux-gpio@vger.kernel.org
Cc:     Alexander Stein <alexander.stein@mailbox.org>
Subject: [libgpiod] [PATCH 2/5] bindings: cxx: Try using pkg-config to detect catch2
Date:   Wed,  7 Aug 2019 21:51:29 +0200
Message-Id: <20190807195132.7538-2-alexander.stein@mailbox.org>
In-Reply-To: <20190807195132.7538-1-alexander.stein@mailbox.org>
References: <20190807195132.7538-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

If there is no system wide package, try using a regular header as before.

Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
---
 bindings/cxx/tests/Makefile.am | 2 +-
 configure.ac                   | 8 +++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/bindings/cxx/tests/Makefile.am b/bindings/cxx/tests/Makefile.am
index 155445f..d1da0d3 100644
--- a/bindings/cxx/tests/Makefile.am
+++ b/bindings/cxx/tests/Makefile.am
@@ -8,7 +8,7 @@
 
 AM_CPPFLAGS = -I$(top_srcdir)/bindings/cxx/ -I$(top_srcdir)/include
 AM_CPPFLAGS += -I$(top_srcdir)/tests/mockup/
-AM_CPPFLAGS += -Wall -Wextra -g -std=gnu++11
+AM_CPPFLAGS += -Wall -Wextra -g -std=gnu++11 $(CATCH2_CFLAGS)
 AM_LDFLAGS = -lgpiodcxx -L$(top_builddir)/bindings/cxx/
 AM_LDFLAGS += -lgpiomockup -L$(top_builddir)/tests/mockup/
 AM_LDFLAGS += -pthread
diff --git a/configure.ac b/configure.ac
index 0459007..bf364e7 100644
--- a/configure.ac
+++ b/configure.ac
@@ -164,9 +164,11 @@ then
 
 	if test "x$with_tests" = xtrue
 	then
-		AC_LANG_PUSH([C++])
-		AC_CHECK_HEADERS([catch2/catch.hpp], [], [HEADER_NOT_FOUND_CXX([catch2/catch.hpp])])
-		AC_LANG_POP([C++])
+		PKG_CHECK_MODULES([CATCH2], [catch2],, [
+			AC_LANG_PUSH([C++])
+			AC_CHECK_HEADERS([catch2/catch.hpp], [], [HEADER_NOT_FOUND_CXX([catch2/catch.hpp])])
+			AC_LANG_POP([C++])
+		])
 	fi
 fi
 
-- 
2.22.0

