Return-Path: <linux-gpio+bounces-29530-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FFFCBB67C
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Dec 2025 04:41:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 758FF301226B
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Dec 2025 03:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7453224634F;
	Sun, 14 Dec 2025 03:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="bVLjaNZI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA12C78F26
	for <linux-gpio@vger.kernel.org>; Sun, 14 Dec 2025 03:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765683663; cv=none; b=YS/EkeS7lwyosXF4tXf9CeS09qoXUPVjOhp18u15y/q/t1qIZOZfC0jBt9gTjt4Yv9cdNeWOmKLKuVtg3p9X7x+nZOwMiHHSrfVdOiu8g9i4zccbEKNtjTXvG8MHw9h23+rjLhr8XcHnV3cuvhBgYNfjruB7DWH/5CUUSoGAPn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765683663; c=relaxed/simple;
	bh=upnkDqK0jsYJUAUIR1U7J8vvEOYVDstthYc0bcbNVVs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IKpooUxTo4/BP47FRuQs8PTrCC3UjvtMG4FoLobueTKiPzbLjUQjEk39ap3hXnK/PvW5Cg2sF29QZhvozJgfSqfs1qRgDcDvgN1OUjdDiG3XC4QQyp/5gzXaFGX0WBhVUDnJYSNiFmxjmeAFktBGn29JxSB8tSBS3GLUzsZ+r9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=bVLjaNZI; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-29f102b013fso28487545ad.2
        for <linux-gpio@vger.kernel.org>; Sat, 13 Dec 2025 19:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1765683659; x=1766288459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ftlGwLraBwtP5qDAHdP3DeAImsaoltqnKOlDDZ3Wec=;
        b=bVLjaNZI3LYMiL81M4rDyobmZhgYSqaMASPlOC8APhl1TSzNdazE049WOOlk5vNw8c
         SXprmTawBEsRS/C8Jke8/UGgrV3FIXxPAD3v9vLgdt4M7oT0nwoKp2UO7+b+4inlqSfp
         eZrowxCniUD93q07ZXBj7hq+aq8InavFUa/RY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765683659; x=1766288459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ftlGwLraBwtP5qDAHdP3DeAImsaoltqnKOlDDZ3Wec=;
        b=bkUbXR3lsFnsDPbCP0jPgUysF6J0Vnc67wKDezkBWnHZKdAaotyvs/8h8346FGqQEn
         qsv9Gp9H1pu8TP1g/lsR9ZENYN61wbKLkn6RVGBItePM5nzYFLfBcr4Qu3b7EkmUAhO8
         7mfiav4wIcRvX5JWPxJ7alIpLcnfDD36jhkqEv3ifotbFIY41lT8vD64ViskERsXVeES
         tu2UGrTzAZj1VWE9f23zDNc2ufJADwd5fQYZat3jE78uroZGr1EmAueUivydiyyYQVJx
         VfHBUdtMCmWE+Rd8EDTYRp5SFF4mPRddyq4tj4A1grKEBMtDNz2hYQL9/78YKPugZuN4
         u+pw==
X-Forwarded-Encrypted: i=1; AJvYcCUHiZaoLZh3Md8J1fjuWJjpDEZWwOqPDt5HiJ5pBhVvPDW5aDLnlV+jZtgP1eart36mXYBa8KB8SU/R@vger.kernel.org
X-Gm-Message-State: AOJu0YwT8brpWB2xGH2kjqQWOFX6o4aj/mcm+tCXIj6lCjdQip70Q9Hi
	Agwsit3zdFc8Ob5uTxmHRGqKEXFvuut7jxLh8wjV++PPAYrlbj2At8rO16brzY7bkoTZEJfpFf3
	VjNa4U8I=
X-Gm-Gg: AY/fxX5VoIgt/K+Go5klvSN+95Mr3Q9oTCAGTBwZaepTty/a2BSiXVCXHdjyeR84eiK
	ifS/ufV+pLbgG0CVa0U2o5L+OakVP/c5Yos10wbH/LallyuK2rcqDyLPPVLBz6MWq6jrgljEoBw
	/uDRkKpU14KGJam5bFSCPKTDeyMD+7tHKgAUjcjohGoSozKz6X3HACJrxxZZKxNZdIhc3m55DZg
	r1tYuTtP/UglRosyo3heaxBfJ1yTIkyUDwMNVzIW7+F8SHalG+sfq72S7jkvqW+5NjGEEVGoio5
	GxyEoIHGnhkRUZC3EA2/aN6Cj3Flqshv4CF2qE/5qABxhWFkFx42dciHfkHqVVLYTDQOUsvYy91
	idbXSHT40OmNVGZyONfCQkjd3PUiolJjNZYoek7yArm8cAmBzG4upbm7Wi96wWSWxYMoL+JYM4F
	UrYi8v1rYB18l50DTIihAF/2+6CuZykyRoe4VFf71zI8PGAanGaqGRXjVMHd/tyYfU6hGWZyKrZ
	7s=
X-Google-Smtp-Source: AGHT+IFHc1+TYCvytPF78eCj6A1LcvaaIa6OPSv2vKyl032ofHC1uLqcY8uMfMoAo4FsDwk3re6ZoA==
X-Received: by 2002:a17:903:fa7:b0:297:ece8:a3cb with SMTP id d9443c01a7336-29f23e55212mr64866665ad.25.1765683659034;
        Sat, 13 Dec 2025 19:40:59 -0800 (PST)
Received: from kinako.work.home.arpa (p1344243-ipxg00a01sizuokaden.shizuoka.ocn.ne.jp. [114.145.20.243])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-29ee9d38adcsm94837555ad.30.2025.12.13.19.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 19:40:58 -0800 (PST)
From: Daniel Palmer <daniel@thingy.jp>
To: linusw@kernel.org,
	brgl@kernel.org,
	linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: [PATCH] gpiolib: of: Only compile in MT2701 quirk when it is needed.
Date: Sun, 14 Dec 2025 12:40:45 +0900
Message-ID: <20251214034045.4029590-1-daniel@thingy.jp>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The compiler cannot workout if this is actually needed or not
so machines that will never need this code also get it.

For example:
m68k-linux-gnu-nm vmlinux | grep mt27
00135742 t of_find_mt2701_gpio

Add some ugly ifdef'ery to get rid of it.

Signed-off-by: Daniel Palmer <daniel@thingy.jp>
---
 drivers/gpio/gpiolib-of.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 8657379e9165..ef1ac68b94b7 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -634,6 +634,7 @@ static struct gpio_desc *of_find_gpio_rename(struct device_node *np,
 	return ERR_PTR(-ENOENT);
 }
 
+#if IS_ENABLED(CONFIG_SND_SOC_MT2701_CS42448)
 static struct gpio_desc *of_find_mt2701_gpio(struct device_node *np,
 					     const char *con_id,
 					     unsigned int idx,
@@ -665,6 +666,7 @@ static struct gpio_desc *of_find_mt2701_gpio(struct device_node *np,
 
 	return desc;
 }
+#endif
 
 /*
  * Trigger sources are special, they allow us to use any GPIO as a LED trigger
@@ -699,7 +701,9 @@ typedef struct gpio_desc *(*of_find_gpio_quirk)(struct device_node *np,
 						enum of_gpio_flags *of_flags);
 static const of_find_gpio_quirk of_find_gpio_quirks[] = {
 	of_find_gpio_rename,
+#if IS_ENABLED(CONFIG_SND_SOC_MT2701_CS42448)
 	of_find_mt2701_gpio,
+#endif
 	of_find_trigger_gpio,
 	NULL
 };
-- 
2.51.0


