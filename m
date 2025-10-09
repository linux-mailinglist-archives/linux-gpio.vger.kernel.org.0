Return-Path: <linux-gpio+bounces-26952-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A68BCA95E
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Oct 2025 20:38:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 900F74ECA6D
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Oct 2025 18:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9BF2248F77;
	Thu,  9 Oct 2025 18:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+5Plnch"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B129A23D7CF
	for <linux-gpio@vger.kernel.org>; Thu,  9 Oct 2025 18:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760035071; cv=none; b=uf2ECQX0BUfKeBvJfA4mqiOfFILT9aO+4kEITUZCAiXmXXhXpPnDWS3ht2PNVRoFySfYt6P+nSmmmObKXP/IpHUC50/v4DFAaSqU48ZB+clqEZk/0Gj3FQP1khnu76Ir97MXJACuWbLQy/5vl77G2FpdOxfxSUiI47uHfifMzck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760035071; c=relaxed/simple;
	bh=PDh+AfzjhV3uXacrn4srFE3snwuuql5OJ6C9U1sJEIU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D0jHcykcuRVKrNGu6AOsKDxh9yRfevl3fmo+mfgy5asly1hQvf4R+0GSCVrn5nl7qFAj2+CQ/kp83RsfFXClyrzU4za5JVIqf/mwNtTJRBLdju7ksyztFa3kyHrroZSm3t6V8SWbvFCG2zmq19lnBPooVPm7Xwh0bEgU5dCXlcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P+5Plnch; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-782a77b5ec7so1176382b3a.1
        for <linux-gpio@vger.kernel.org>; Thu, 09 Oct 2025 11:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760035068; x=1760639868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OLBmvaasF2LSEi3ZR2o1HrWy9QPsvaaeIfrmaMHo1Zw=;
        b=P+5Plnch7cVC+pPy69mOpbxpSzHv8M5Rs6v2W6y4vraAELZ7GgTy6e4KSz5vxIKC/5
         xAy5mPJHupbFRXaSpatn2erlcs5sd+xZz/66dDKyMJaFFPvuyBui4qFjlBQwWvGBIpfj
         HHh9EZTKOXJK9jpSaGymNh2aKt2dzRZKLHVGrcNr/K2u6vDBZ+EdBmuZ/tZ3Na1XMAd6
         WCOLgmw5hRedVVg24iVa28YD8nfeuAc8K30VjhOFKSlyH+eu7AsvSgnJCjDuxlLPwHeN
         pkWa0tBhRrUMtziCHloR/qtrv2eo+GQVXLZUMw3TaTg7RXrV+c46M9zx1hyi+w7BKsI+
         UTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760035068; x=1760639868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OLBmvaasF2LSEi3ZR2o1HrWy9QPsvaaeIfrmaMHo1Zw=;
        b=vBiEs+2nIn4jF3fiZQZGrqexOGDqBa+0nN4XZai4MgG3VVp/s0NvdYbY5tgbwNMX4L
         W+45TfVTd4uemTafWKvoLzcx4kPc98ZMdgj18X2yGiAuihYlyPmGZ/QUuVkkcvL06qGg
         I1Hreh9cApI5oCjwoje5zKaFqEAotcDLnRYbK7hm5ZFfEbBoBWzFGJcm6wdPY0cdcoxX
         6vw1o7/AKpxEde8Mo5kpnmdnhfMeFP0+0lCuSUp3Wj5LlxpcL3y2oRHkXd/ezvXlJwEh
         1U9JZy7sWaU1Xk8ncF3hMqeuYkFqG+Tqrvsc2lmQGCFtnymIDwD+VCM7O29/G3LQvLCr
         jbAw==
X-Forwarded-Encrypted: i=1; AJvYcCVOxECcD4VaPMbbGuSZvObPH4vNWFolE2Pabo/elKAPdgzmxANfgFJULnoxnKuTO315XVjpIrQlIFcy@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1e8NgxcvT3Z5GJRKta4q+99aOaXwwbpw65wTThRMZdkfg/2KB
	GpaYdpYSrz4G3Ph1a6d68uYFec5cRxYmmeS/mjmoa+owZ+bfSR3P43M=
X-Gm-Gg: ASbGncspvsKQL+IH6Zr1x4XcWT3C2jFk5AGb3YSzkpQeJAHCst3j1kM733phch1qldS
	gWdU9Mi6yhUJ892H0ap/J8E0GZaxMkdgkxmBKavFjb3elopLZ0gcSAESMTeKq4Xfv/xPlWIUeUW
	YdadCCrrVj8PxJPJYQ8VNlYmv1wNp96jFxhpqxn82zPMkMv0BiJKRxynSPLXvI4lF/qr6b8G9Ay
	LKMDyqNedXjWQDhHOeksOB3kPJONMsyE9wwtaVpwT3jxdodY9iZvVK0AQwd3Dr1iCzQ1Svs1XT+
	mOazK7kVughZ9CgMnGDpGbavyxrSNtD3jv7MpFDnJ4W6bofKMyQRLuopixWPIfDBoWWpJCA7Cdv
	2kv1dZKeWgMuG6UG15dqc1ciQ3xg+k60XaZogZM46BhEWwJ+FALQ6UxRvZKMFTdDD8YAahD6u8H
	UafN1d++diUQ==
X-Google-Smtp-Source: AGHT+IHufRCD1gspY8glmM8lax7BUG8ynHHaY9o6yM1T8DIIM/vktiuj0NUkBXjxADybbCWs5+RgFg==
X-Received: by 2002:a05:6a00:1894:b0:776:130f:e1a1 with SMTP id d2e1a72fcca58-79385709579mr9273576b3a.5.1760035067817;
        Thu, 09 Oct 2025 11:37:47 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([171.78.199.202])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0c3a38sm411630b3a.41.2025.10.09.11.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 11:37:47 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: atharvatiwarilinuxdev@gmail.com,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Sebastian Reichel <sre@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH] macsmc: check for missing SMC to avoid crash
Date: Fri, 10 Oct 2025 00:07:32 +0530
Message-ID: <20251009183735.1288-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Users might manually install these drivers
without the core SMC device, causing
a NULL deref. Add a guard and return -ENODEV.

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/gpio/gpio-macsmc.c          | 3 +++
 drivers/power/reset/macsmc-reboot.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpio/gpio-macsmc.c b/drivers/gpio/gpio-macsmc.c
index 30ef258e7655..7048b45953bb 100644
--- a/drivers/gpio/gpio-macsmc.c
+++ b/drivers/gpio/gpio-macsmc.c
@@ -238,6 +238,9 @@ static int macsmc_gpio_probe(struct platform_device *pdev)
 	smc_key key;
 	int ret;
 
+	if (!smc)
+		return -ENODEV;
+
 	smcgp = devm_kzalloc(&pdev->dev, sizeof(*smcgp), GFP_KERNEL);
 	if (!smcgp)
 		return -ENOMEM;
diff --git a/drivers/power/reset/macsmc-reboot.c b/drivers/power/reset/macsmc-reboot.c
index e9702acdd366..739f94e4ed7e 100644
--- a/drivers/power/reset/macsmc-reboot.c
+++ b/drivers/power/reset/macsmc-reboot.c
@@ -205,6 +205,9 @@ static int macsmc_reboot_probe(struct platform_device *pdev)
 	struct macsmc_reboot *reboot;
 	int ret, i;
 
+	if (!smc)
+		return -ENODEV;
+
 	reboot = devm_kzalloc(&pdev->dev, sizeof(*reboot), GFP_KERNEL);
 	if (!reboot)
 		return -ENOMEM;
-- 
2.43.0


