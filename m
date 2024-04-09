Return-Path: <linux-gpio+bounces-5221-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C8D89D5A3
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Apr 2024 11:33:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7DC83B23871
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Apr 2024 09:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C10B7FBC1;
	Tue,  9 Apr 2024 09:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1WZbjlW8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C065F7F47F
	for <linux-gpio@vger.kernel.org>; Tue,  9 Apr 2024 09:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712655224; cv=none; b=GT1Zk0mBcZsZEC9UMmE0zX1woe8cHUzvmbO2LA3o8NLjj7EUKKoduzOz5VSsBXku377foJYgzfs2MvVGhhMqIU4bZcMfLiUQ9ywhyTawTfhxV6/NIWkSw3AoNiwonVDAIbbk/Y01k1cAgdZI9iMcBWtH0FSHMPbTxJHAhaHxXdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712655224; c=relaxed/simple;
	bh=oeluw4IXXhbrlNixTihfvPA0YRN5wCQW9P/b5KpqBqM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lYWkxinfHo9InoWx68ImFInkLp6qe98GP5y2UhOOI6c/T49Iljn9tuYqXtMPESXCtkxX40wbYTDpFmLf80lN3fCRr1J94mYxohA/P4UN6yIijki8hvLfAmgmeUWKgVXNoJqABb5OLZ5C/ux36dCZx81u3Bp5ptt35MSfP1Qsx4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1WZbjlW8; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-41650de9e1eso13214475e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 09 Apr 2024 02:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712655221; x=1713260021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNOL3vkJDM2aN8A30zu4f4DuqyN97loXJYNkXXMB4ko=;
        b=1WZbjlW8x0bvR4EoBj8QuokNklly4CncIt6bmTZfpTf6wV1qGePRtRHFiYJm9VFHd+
         1NrXCl3kaADkVDKMhHXU/xlZnRaJJnrjjd3GxpS7+Ew4NrwR6PJP8/cr9lP84dv1bYGa
         SZiKLj1oKQVqc8kUCPDKTNANgPiTsZDuMQDPkDKe49hqLC6sGSPClGf5LhjFVwAUxJ/k
         D+xvjhZU0XSGTNuDf7KLrzeQ+4c6/a8N2DEaxZkLR9YQcMaxAYCsgAgJomV9ui+oo6F4
         fkmPeECM7WEs78mQ9G2Ua6x88o/svYEnc7XfUR1+oVeqtU3mNSai+V5+951HFysgDiXs
         q5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712655221; x=1713260021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KNOL3vkJDM2aN8A30zu4f4DuqyN97loXJYNkXXMB4ko=;
        b=sKOpaZV7hs11TuORk0JbHWWGBYSjavKDsvVhgQV5ZpfWugG4/z+j34rsl/kyu9/99t
         Ut99FJIX2A61YYDNqjUoyZOURIKl3XEUmEHpMMVuc2Fgf4pRtEoISWlHp5xSgMhjj1zQ
         3d8rr1yyRLmS62X37Ynt4J4Z0FORYqgtCpTNwoKFcPfL9eZOOC+nyUeTpIcTO6QyOUgR
         JYbx2+fnOWweu1chCeRmrqOUz9+Hu2GnDwJ88Zy3CrHQ4EpUdWT3JY+MnbSe3dokHOdk
         rOZgUkApbpQy+8VoZ9WDLLZO5TLKkATrSBGpsrZ6FbmghGlC+gFoYcjqvQ58NgFggPX0
         o3fg==
X-Gm-Message-State: AOJu0Ywe3eTvW95l5kYySmeDbztf09iN7ktcUrsCbL8N+1E64dxZL4V/
	W65/TDH2b8bc2TfezV5k8B4PljjlScsedgbgEolcOo+vwrHB3GzUZ5MkjmlyCzo=
X-Google-Smtp-Source: AGHT+IERykoMaotib+VrcECStgdPKVmrkcKj2oTYBprLU1ELnvw3qeeU5pHxRsVVXgG2gRq2fBqXFQ==
X-Received: by 2002:a05:600c:4fcb:b0:416:6adf:fe44 with SMTP id o11-20020a05600c4fcb00b004166adffe44mr1794917wmq.17.1712655220896;
        Tue, 09 Apr 2024 02:33:40 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:bec9:44d9:5791:fb97])
        by smtp.gmail.com with ESMTPSA id fc9-20020a05600c524900b004162d0676cdsm16463072wmb.29.2024.04.09.02.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 02:33:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	=?UTF-8?q?Gunnar=20Th=C3=B6rnqvist?= <gunnar@igl.se>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 1/2] build: fix configure error messages on missing functions
Date: Tue,  9 Apr 2024 11:33:32 +0200
Message-Id: <20240409093333.138408-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240409093333.138408-1-brgl@bgdev.pl>
References: <20240409093333.138408-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Fix three incorrect messages that report missing library functions as
required to build the core library when they are actually needed to build
the gpio-tools.

Fixes: 9e69d7552cf2 ("configure: improve the header and library function checks")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 configure.ac | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configure.ac b/configure.ac
index 04787d4..3b5bbf2 100644
--- a/configure.ac
+++ b/configure.ac
@@ -117,9 +117,9 @@ AM_CONDITIONAL([WITH_GPIOSET_INTERACTIVE],
 AS_IF([test "x$with_tools" = xtrue],
 	[# These are only needed to build tools
 	AC_CHECK_FUNC([daemon], [], [FUNC_NOT_FOUND_TOOLS([daemon])])
-	AC_CHECK_FUNC([asprintf], [], [FUNC_NOT_FOUND_LIB([asprintf])])
-	AC_CHECK_FUNC([scandir], [], [FUNC_NOT_FOUND_LIB([scandir])])
-	AC_CHECK_FUNC([versionsort], [], [FUNC_NOT_FOUND_LIB([versionsort])])
+	AC_CHECK_FUNC([asprintf], [], [FUNC_NOT_FOUND_TOOLS([asprintf])])
+	AC_CHECK_FUNC([scandir], [], [FUNC_NOT_FOUND_TOOLS([scandir])])
+	AC_CHECK_FUNC([versionsort], [], [FUNC_NOT_FOUND_TOOLS([versionsort])])
 	AS_IF([test "x$with_gpioset_interactive" = xtrue],
 		[PKG_CHECK_MODULES([LIBEDIT], [libedit >= 3.1])])
 	])
-- 
2.40.1


