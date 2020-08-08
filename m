Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1447F23F731
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Aug 2020 12:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725980AbgHHKGj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 8 Aug 2020 06:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726190AbgHHKGi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 8 Aug 2020 06:06:38 -0400
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [IPv6:2001:67c:2050::465:101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95C4FC061A27
        for <linux-gpio@vger.kernel.org>; Sat,  8 Aug 2020 03:06:38 -0700 (PDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:105:465:1:2:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4BNyQK2pYMzKmrf
        for <linux-gpio@vger.kernel.org>; Sat,  8 Aug 2020 12:00:09 +0200 (CEST)
Authentication-Results: spamfilter04.heinlein-hosting.de (amavisd-new);
        dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
        header.d=mailbox.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1596880807;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1F1TiS/llMSlRFBhEU+mAwyr4zGbGajeXGcSzv26sAY=;
        b=NrJTpDj8I4HWdwAVjlrsJqJi/O13ErNJr0f4maqTsxErXWnMnoBANBOt7+clfcc0yC2Kvn
        zkM0ZUL61cq8+iD4eUK7GQFlWmwUihs1uXX7VkP3SL3d8wZWVxZ94L7j9BUJPkL3VPJvlS
        86WynGniqLTCH3qNFfdjHylN9QmoJ5Rg8oozy6a3oXLqRe3CNB7tr9X+7eSuzT1Shj7WP4
        zbhWp1DgHCotmB57GGZfqUwuspnyoGIlP4UfJFIHifNPDRKUPu8ejKA82+D8KwHuQM6XfG
        0TC4/6ulXDGHvj8YKNHKE9i2fctFv3YyrEMsCZHRsUO9YUku4tsuUA4tJWn2hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
        content-transfer-encoding:mime-version:references:in-reply-to
        :message-id:date:date:subject:subject:from:from:received; s=
        mail20150812; t=1596880806; bh=x5T7ui+O9aMTi+N6iqjPE8ZpTFc2TrncW
        qia6FcNsJ8=; b=NWlLcu6RfRVZcv7n7TDUAuglaRp83iSm7CtKA9rwsi0kU+BO+
        tnP1XTO1fQu1JBMExh5PXeX/C0vnC2pE1LB0D3j6wZYCVRzpNSWa0m5mnGuKl+r2
        bO4QKIkDnb6zpdRysqZIJxMiw2UzdpXRrH7ef98SqguVH7IeQPU/E4cdntKMd9d7
        npXdtX0pJQjJ9v5yxKZGS+z1KAM74GYs19AXXthGFt6DBXMy1hz8dlCqcQifIhVc
        vcwN6BB22JMt+B/lRUbaRYHLAVOOch6c3ly1464833G55ghPDc95fYDuN2cMm3KU
        5M/ahCOroaLhAX9esP5ycE52CSGol8DTWoqzA==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de [80.241.56.122]) (amavisd-new, port 10030)
        with ESMTP id IY6J1vydltCz; Sat,  8 Aug 2020 12:00:06 +0200 (CEST)
From:   Alexander Stein <alexander.stein@mailbox.org>
To:     linux-gpio@vger.kernel.org
Cc:     Alexander Stein <alexander.stein@mailbox.org>
Subject: [libgpiod] [PATCH 5/5] doc: Add @file to headers
Date:   Sat,  8 Aug 2020 11:59:44 +0200
Message-Id: <20200808095944.188479-6-alexander.stein@mailbox.org>
In-Reply-To: <20200808095944.188479-1-alexander.stein@mailbox.org>
References: <20200808095944.188479-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -5.67 / 15.00 / 15.00
X-Rspamd-Queue-Id: 882DB17BE
X-Rspamd-UID: fdab8f
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is necessary to have a file reference linked in the file list.
Also strip the top_srcdir from paths

Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
---
 Doxyfile.in            | 2 +-
 bindings/cxx/gpiod.hpp | 4 ++++
 include/gpiod.h        | 4 ++++
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/Doxyfile.in b/Doxyfile.in
index 4abad2d..be2d250 100644
--- a/Doxyfile.in
+++ b/Doxyfile.in
@@ -22,7 +22,7 @@ BRIEF_MEMBER_DESC      = YES
 REPEAT_BRIEF           = YES
 ALWAYS_DETAILED_SEC    = NO
 FULL_PATH_NAMES        = NO
-STRIP_FROM_PATH        =
+STRIP_FROM_PATH        = @top_srcdir@
 INTERNAL_DOCS          = NO
 STRIP_CODE_COMMENTS    = YES
 CASE_SENSE_NAMES       = YES
diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
index 59719aa..8dfc172 100644
--- a/bindings/cxx/gpiod.hpp
+++ b/bindings/cxx/gpiod.hpp
@@ -23,6 +23,10 @@ class line_iter;
 class chip_iter;
 struct line_event;
 
+/**
+ * @file gpiod.hpp
+ */
+
 /**
  * @defgroup gpiod_cxx C++ bindings
  * @{
diff --git a/include/gpiod.h b/include/gpiod.h
index 58de66f..d1f9830 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -16,6 +16,10 @@
 extern "C" {
 #endif
 
+/**
+ * @file gpiod.h
+ */
+
 /**
  * @mainpage libgpiod public API
  *
-- 
2.28.0

