Return-Path: <linux-gpio+bounces-20590-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C03B2AC4CF3
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 13:15:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03000189F8EC
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 11:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D968E25A349;
	Tue, 27 May 2025 11:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rbi+klCS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8DB259CB6
	for <linux-gpio@vger.kernel.org>; Tue, 27 May 2025 11:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748344445; cv=none; b=BxvMxdHWra6pvD3eEEK02ErJujKMO0iouEig03KZgj3CQI3Xn7hjXSwK9wGt5SfXhdIEujwN8htWWNuWfQ6uiaFT6l6hKNIu5wP0cvSDDzYsH3GJVJHNCLI9Q2GWyNW8DzAJT/r/0Rdqs5bq40Uz1wSgq/d4RWVLjNxb6UgB3Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748344445; c=relaxed/simple;
	bh=7xV9gBlCY8b19EKcOHBAPhpFl9Egi1GXkjeOkA6dkIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q22Gr8a0xB36GeYVT+xWx+hjD0s1PPol91VQm6h/Eclf5/xrt2kse2NxlqqeI+H0/4DZJ67FfZBHEPcPAZ3Nr/yrpbQBpZubhMDw61371W6R7ZzRZw279D9fret2Ix5OjPwWjLQqOqIbBQF+w399d8Csks59B/B/ss0FDizFwaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rbi+klCS; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a4dba2c767so1285780f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 27 May 2025 04:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1748344442; x=1748949242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T9Mv8rBtATew6MrRBMBX7UtmzjFrS1BeqdLPFyFXnvs=;
        b=rbi+klCSz4q96Q5wVC6oWubQyiDjYZaDMnvcReGiWsZmwFTpCLcOpbpvfP436Km8Aw
         kyonLx7sOfw5XYlmNpzb7KplCQ42QcWrYdoWB2C+LKk5AE/gUqUwRW2sBFDnn1Y5le/N
         nSoAD5vyTDWJwMugiRPa9eT21ipSismGVQ2/qoE9oZwusw8YTYcbTgylXvdFFjvQxEiP
         O2NiC7+gIvAeeM0t33EMNml4YAYALzJXYgJ+Z7gzO4EKqjAJ2keNgBhxBnO6TWhQJAjm
         kjdeOGv8LeIB7DoA4ipFtRnBdEInGsldYTh/uD6urvfn5asHfbVBGB3Nn+wic1OKBq/b
         JKlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748344442; x=1748949242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T9Mv8rBtATew6MrRBMBX7UtmzjFrS1BeqdLPFyFXnvs=;
        b=etjW7H9yeTtVDvvSLzykhH+2oSYduCsFjbwK1GLZu8UdYFDRMdkbno1wd5ans+oLbg
         LoQL2hryQXyKjDq0J5RM4rKJgH0PT5zpEuO/M9aMkKuPDBgv4XGCCB/rwOPwOtKmG85P
         5Ejgsjvdw0Pms88BXlf0y/0rsvyF/txUldaM8m+Vhg47j5BirB8SixMY0Z6sp8iIh3M/
         gerEO2bUparzfxzACXL+xL72mMV22QGltv/y6tkL6l4nI466zRqiyQXAgP+ZIuvTwCQg
         5CMF6WWnvtLYxt4qi+GMzYCa4A28Cahjxbx+asQAa98CrkUsxF0lL4WodlzF5oscZJUv
         KtXQ==
X-Gm-Message-State: AOJu0YyGcqDT8BSZfD5wjl5Zw/oqhFhcNx2tSlIu6j8esSgJ0V7DqIyn
	bp72XNfey6Rt/SxwFkTEXUcbpKm74HFUjtMiuFkYQDNU3AorLxvU2JKw16fTBSRbn6A=
X-Gm-Gg: ASbGncuoEOHobHQbChxlZxpvz2T01mUln0WYApLUxbneZXNYaFrhjAo6vyA9NsCVeHu
	01CvKg22B14XERDJ6GzhST6RR7GTLq2pJcCWr1XzU4CVJSd/MwrThmEIaaG2bCI+bXUki6qM36s
	GPLBF27cUfAFVHABLjg+ueFovY8Il4aEw/hBl6qt4fywJw4EzVQ5mkfi/BzygBU1jBQjXUMMFJs
	Z8tz2QlMVue0lZOjh7uwCsrD/mbL5mohb2VNOgNngtCH1Edu73+kZCTCFoOcEt1d6+keLi87UEG
	wriNYTNPOe4m160Hqex+Fp1JCCGkGctVSFxsGVauWlJl7l0n5XA=
X-Google-Smtp-Source: AGHT+IGEfaGDigCwu7r4I2UXBnlCsbwxk6WCqIVgjikS5CsXO+Dp82HB5UCqMOdEXfU3JqXv+5KJ6w==
X-Received: by 2002:a05:6000:2583:b0:3a4:cc8f:a3d5 with SMTP id ffacd0b85a97d-3a4e5e69de5mr162780f8f.15.1748344441464;
        Tue, 27 May 2025 04:14:01 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:bd12:adce:b990:490a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb56sm260935355e9.27.2025.05.27.04.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 04:14:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: TODO: add a task for removing MMIO-specific fields from gpio_chip
Date: Tue, 27 May 2025 13:13:53 +0200
Message-ID: <20250527111353.71540-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Currently for CONFIG_GPIO_GENERIC=y each struct gpio_chip object
contains the fields relevant only for gpio-mmio users. It's not an
insignificant number either as it's several pointers and integers.

It makes sense to remove these fields from struct gpio_chip into a
dedicated structure but this is not trivial due to how the bgpio_init()
function is implemented.

Add a task for tracking this rework.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/TODO | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpio/TODO b/drivers/gpio/TODO
index 4a8b349f2483a..ef53892cb44d7 100644
--- a/drivers/gpio/TODO
+++ b/drivers/gpio/TODO
@@ -131,6 +131,11 @@ Work items:
   helpers (x86 inb()/outb()) and convert port-mapped I/O drivers to use
   this with dry-coding and sending to maintainers to test
 
+- Move the MMIO GPIO specific fields out of struct gpio_chip into a
+  dedicated structure. Currently every GPIO chip has them if gpio-mmio is
+  enabled in Kconfig even if it itself doesn't register with the helper
+  library.
+
 -------------------------------------------------------------------------------
 
 Generic regmap GPIO
-- 
2.48.1


