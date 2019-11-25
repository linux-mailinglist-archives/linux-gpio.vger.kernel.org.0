Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 429E3108A56
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2019 09:51:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727026AbfKYIvS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Nov 2019 03:51:18 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53038 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbfKYIvS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Nov 2019 03:51:18 -0500
Received: by mail-wm1-f66.google.com with SMTP id l1so14470854wme.2
        for <linux-gpio@vger.kernel.org>; Mon, 25 Nov 2019 00:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N4b8sEBcQ0k718b7OxgMPvfpBWt1MsLaHOD7p0BxYIA=;
        b=Naa8XBxGiw4yQvQ1Kad6BKAwKTfhzRAfVkcVHwhiB7bU8xaGKgKjfoKbEirSzd2Qna
         jcvwPWrDhzN/QYDC/K8LEXUSAH279ZbdfPNpUhrTQKwHSMt48GHtJGd4/CQlD8M6+BAZ
         +xqRd5di/XAxKm3X5BX/piksBmAcsP27unBwhl2AwejANJ/cXD7IWZFT00TrMIpcJ4ub
         YXPpFrd8RiohyYIYOlOKSLvI/1vAdlEeqWVRXE+0+jYQQzFp6lousnR2YTDj3+EkVU53
         96MJ+OgzYhApODdABNoqwcwewY0XiXASe0JvblhcRGme6SvOThmlVhH/5yCELW1/3nwu
         ZWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N4b8sEBcQ0k718b7OxgMPvfpBWt1MsLaHOD7p0BxYIA=;
        b=fMMZBxXMvCFsrNLozNRGeyfr/aYRVlIpbsYUxAqUthErckXWBdVxL1+VoEcnWSwynq
         GIolPiS+6Prdm1rBu1UfuUE08c+FN3xoryVWWDq0/7w4/vfgH/ss/q+CPLZdnn5qIXm5
         Lyg7RldycFaSCDtbAmHgR5yMghNJJlZZQvLayjG69BEaFwUOF0CPeBCV8zD9Ub1U8gBW
         MB2PObxoCxwwbAaQSxjYtAVZUShbOI+ZybJH4o7WXG3DOnafMpwMzeoeb9mQCVZl22qB
         m4oxlnF5UgSjGuscTNoX9Da1sE1fzkCutZkWjFpPNPZl93TGr81jUG+41yKnH2udxS22
         wazg==
X-Gm-Message-State: APjAAAV8ry50fI2p/++Tis0VZpddItBSbeI40pt5bqg4oJAIx1bS483h
        xEJASrqX2mjtzgatOFP3ligGWJTKDaA=
X-Google-Smtp-Source: APXvYqwjJIIffaad6ZoULiQyPxFz7CWSMrD3nTsYoE43RJ5jFafWTEI05HaEF2tECCcQ1W5CBdZOMg==
X-Received: by 2002:a7b:ce12:: with SMTP id m18mr29149938wmc.130.1574671874756;
        Mon, 25 Nov 2019 00:51:14 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id g11sm7843274wmh.27.2019.11.25.00.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 00:51:14 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Joel Savitz <joelsavitz@gmail.com>
Subject: [libgpiod][PATCH] build: use AC_CHECK_PROG() instead of AC_CHECK_FILE() for python3-config
Date:   Mon, 25 Nov 2019 09:51:05 +0100
Message-Id: <20191125085105.32679-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Commit 9ed02fc793b3 ("build: check for python-config in configure")
breaks cross-compilation because AC_CHECK_FILE() only checks the host
machine. Use AC_CHECK_PROG() instead.

Cc: Joel Savitz <joelsavitz@gmail.com>
Fixes: 9ed02fc793b3 ("build: check for python-config in configure")
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 configure.ac | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/configure.ac b/configure.ac
index 066c1ad..62e2671 100644
--- a/configure.ac
+++ b/configure.ac
@@ -183,8 +183,11 @@ if test "x$with_bindings_python" = xtrue
 then
 	AM_PATH_PYTHON([3.0], [],
 		[AC_MSG_ERROR([python3 not found - needed for python bindings])])
-	AC_CHECK_FILE(["$PYTHON-config"], [],
-		[AC_MSG_ERROR([python3-config not found - needed for python bindings])])
+	AC_CHECK_PROG([has_python_config], [python3-config], [true], [false])
+	if test "x$has_python_config" = xfalse
+	then
+		AC_MSG_ERROR([python3-config not found - needed for python bindings])
+	fi
 	AS_IF([test -z "$PYTHON_CPPFLAGS"],
 		[AC_SUBST(PYTHON_CPPFLAGS, [`$PYTHON-config --includes`])])
 	AS_IF([test -z "$PYTHON_LIBS"],
-- 
2.23.0

