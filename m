Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F28FC694077
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Feb 2023 10:13:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230210AbjBMJNu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Feb 2023 04:13:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbjBMJNt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Feb 2023 04:13:49 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 926C6AD31
        for <linux-gpio@vger.kernel.org>; Mon, 13 Feb 2023 01:13:45 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id o18so11388660wrj.3
        for <linux-gpio@vger.kernel.org>; Mon, 13 Feb 2023 01:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OftGLc/bfxXYc+Ui/vNbOe0RZ6VNbF/lEjk9AmgUL/w=;
        b=J5bLZRO5PbIXXXLWAMMOgiBTtrkn1fXRvYaqp9ERs19x0LvxtG2eTPz5q17j5LsVFo
         WLDNDBjbRuoHMDBYUr3/KvR1vxQnuDmM/ptfMPIhT6QPRVlhkdBy5W7pBd2q8VwRMAPt
         t23+5gZ9gsJ+DSp4OISOAkcRWEO24XnHpA25SBC9plLFmzV3siutDPX770Qsj7fwe63c
         HTjTmtzGNiDBb1RF/WKFylik4CBv5k/hhsaJw5JrmEf/PBui3s3Dl/kx20Y3p/C2fAFf
         1sqMNk5Xu4twzo6SAirohZaj8t73cAO9rof/zZ62Uiui8aK5uBZfeePIEPlirFLH1GNw
         uzcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OftGLc/bfxXYc+Ui/vNbOe0RZ6VNbF/lEjk9AmgUL/w=;
        b=V9tKGII08aCIxwPxIfmt2fIIaO8VD1Xl65DXO2laDEMSBNFHzJOC7i2MHR4X2Vu0yE
         VGSmCFaEZEWle1cQa7SaDyG05OPcpITSFdFPQvfN935Jon/y7hQqZukrDdFJ4Upm8GWl
         SUEIAKHhGcE7sKqj0zm4uge6nTdQjeYAKXu3ygfIfC46HCLZ/0kB7JzR90xdpeFyZ64m
         uIdpGmPQameZRTxEUURLQ2FLyYc6WVS8IzHulUwGf2Lf8tVfV+WRN+nPv1zXHXsUtASK
         d4WrnrS1QW6X7j7WzeraA/dB2DWZiVEhtGFhyVe0mFzrZf2BIBNPqxwMdyiPoNz6lfoO
         nahw==
X-Gm-Message-State: AO0yUKUvHvwamqUjCb1uHM3mOCBtxj7RYIGHj39uDOcqmucSHwwVu9LS
        o7ym6ocBL6wD9ni1kECZ8CpyVQ==
X-Google-Smtp-Source: AK7set/2+hfYbloJLNcDpM0HM2nVQsCjejnUVSgg7xHAuqV6GnD+oeu2zRhaNlLh0osdRwBZtltWhw==
X-Received: by 2002:a5d:55cf:0:b0:2c5:557b:f837 with SMTP id i15-20020a5d55cf000000b002c5557bf837mr2764265wrw.14.1676279624094;
        Mon, 13 Feb 2023 01:13:44 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:b003:f645:fa8:ccfc])
        by smtp.gmail.com with ESMTPSA id i2-20020adfefc2000000b002c553e061fdsm3533888wrp.112.2023.02.13.01.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 01:13:43 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH] gpiosim: use twalk() instead of twalk_r()
Date:   Mon, 13 Feb 2023 10:13:42 +0100
Message-Id: <20230213091342.33128-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

twalk_r() is a GNU extension for the binary search tree API. Musl libc
doesn't provide it and after inquiring with the maintainer it turned out
it won't provide it anytime soon as musl strives to only implement well
standardized functions.

In order to not limit building libgpiosim and tests to glibc only, let's
replace twalk_r() with twalk() and use global variables for the state.
It's not a big deal as we're already using a global root node and a mutex
to protect it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 configure.ac            |  2 +-
 tests/gpiosim/gpiosim.c | 54 +++++++++++++++++++----------------------
 2 files changed, 26 insertions(+), 30 deletions(-)

diff --git a/configure.ac b/configure.ac
index 2bd71b0..d42b089 100644
--- a/configure.ac
+++ b/configure.ac
@@ -162,7 +162,7 @@ then
 	AC_CHECK_FUNC([openat], [], [FUNC_NOT_FOUND_LIB([openat])])
 	AC_CHECK_FUNC([mkdirat], [], [FUNC_NOT_FOUND_LIB([mkdirat])])
 	AC_CHECK_FUNC([write], [], [FUNC_NOT_FOUND_LIB([write])])
-	AC_CHECK_FUNC([twalk_r], [], [FUNC_NOT_FOUND_LIB([twalk_r])])
+	AC_CHECK_FUNC([twalk], [], [FUNC_NOT_FOUND_LIB([twalk])])
 	AC_CHECK_FUNC([tsearch], [], [FUNC_NOT_FOUND_LIB([tsearch])])
 	AC_CHECK_FUNC([tdestroy], [], [FUNC_NOT_FOUND_LIB([tdestroy])])
 	AC_CHECK_FUNC([tdelete], [], [FUNC_NOT_FOUND_LIB([tdelete])])
diff --git a/tests/gpiosim/gpiosim.c b/tests/gpiosim/gpiosim.c
index f46adfa..88d79f4 100644
--- a/tests/gpiosim/gpiosim.c
+++ b/tests/gpiosim/gpiosim.c
@@ -23,6 +23,7 @@
 #include "gpiosim.h"
 
 #define GPIOSIM_API		__attribute__((visibility("default")))
+#define UNUSED			__attribute__((unused))
 #define ARRAY_SIZE(x)		(sizeof(x) / sizeof(*(x)))
 #define MIN_KERNEL_VERSION	KERNEL_VERSION(5, 17, 4)
 
@@ -30,15 +31,15 @@ static pthread_mutex_t id_lock = PTHREAD_MUTEX_INITIALIZER;
 static pthread_once_t id_init_once = PTHREAD_ONCE_INIT;
 static void *id_root;
 
-struct id_find_next_ctx {
+struct {
 	int lowest;
 	bool found;
-};
+} id_find_next_ctx;
 
-struct id_del_ctx {
+struct {
 	int id;
 	int *idp;
-};
+} id_del_ctx;
 
 static void id_cleanup(void)
 {
@@ -62,40 +63,38 @@ static int id_compare(const void *p1, const void *p2)
 	return 0;
 }
 
-static void id_find_next(const void *node, VISIT which, void *data)
+static void id_find_next(const void *node, VISIT which, int depth UNUSED)
 {
-	struct id_find_next_ctx *ctx = data;
 	int *id = *(int **)node;
 
-	if (ctx->found)
+	if (id_find_next_ctx.found)
 		return;
 
 	switch (which) {
 	case postorder:
 	case leaf:
-		if (*id != ctx->lowest)
-			ctx->found = true;
+		if (*id != id_find_next_ctx.lowest)
+			id_find_next_ctx.found = true;
 		else
-			ctx->lowest++;
+			id_find_next_ctx.lowest++;
 		break;
 	default:
 		break;
 	};
 }
 
-static void id_del(const void *node, VISIT which, void *data)
+static void id_del(const void *node, VISIT which, int depth UNUSED)
 {
-	struct id_del_ctx *ctx = data;
 	int *id = *(int **)node;
 
-	if (ctx->idp)
+	if (id_del_ctx.idp)
 		return;
 
 	switch (which) {
 	case postorder:
 	case leaf:
-		if (*id == ctx->id)
-			ctx->idp = id;
+		if (*id == id_del_ctx.id)
+			id_del_ctx.idp = id;
 		break;
 	default:
 		break;
@@ -104,18 +103,17 @@ static void id_del(const void *node, VISIT which, void *data)
 
 static int id_alloc(void)
 {
-	struct id_find_next_ctx ctx;
 	void *ret;
 	int *id;
 
 	pthread_once(&id_init_once, id_schedule_cleanup);
 
-	ctx.lowest = 0;
-	ctx.found = false;
-
 	pthread_mutex_lock(&id_lock);
 
-	twalk_r(id_root, id_find_next, &ctx);
+	id_find_next_ctx.lowest = 0;
+	id_find_next_ctx.found = false;
+
+	twalk(id_root, id_find_next);
 
 	id = malloc(sizeof(*id));
 	if (!id) {
@@ -123,7 +121,7 @@ static int id_alloc(void)
 		return -1;
 	}
 
-	*id = ctx.lowest;
+	*id = id_find_next_ctx.lowest;
 
 	ret = tsearch(id, &id_root, id_compare);
 	if (!ret) {
@@ -140,17 +138,15 @@ static int id_alloc(void)
 
 static void id_free(int id)
 {
-	struct id_del_ctx ctx;
-
-	ctx.id = id;
-	ctx.idp = NULL;
+	id_del_ctx.id = id;
+	id_del_ctx.idp = NULL;
 
 	pthread_mutex_lock(&id_lock);
 
-	twalk_r(id_root, id_del, &ctx);
-	if (ctx.idp) {
-		tdelete(ctx.idp, &id_root, id_compare);
-		free(ctx.idp);
+	twalk(id_root, id_del);
+	if (id_del_ctx.idp) {
+		tdelete(id_del_ctx.idp, &id_root, id_compare);
+		free(id_del_ctx.idp);
 	}
 
 	pthread_mutex_unlock(&id_lock);
-- 
2.37.2

