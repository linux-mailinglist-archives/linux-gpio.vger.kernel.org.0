Return-Path: <linux-gpio+bounces-25320-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC36B3E3C4
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 14:55:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89262171739
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 12:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A982933437E;
	Mon,  1 Sep 2025 12:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wdBpPWzb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC4224DCF9
	for <linux-gpio@vger.kernel.org>; Mon,  1 Sep 2025 12:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756731321; cv=none; b=D+IEttjDejqKIT1Doih7wlvQo4JuMSkgpBP1yG171sxNH+1zuuEsGV3ZlTIemB7DWpdNCAR1UoVgBToIfb7WFLlK3LWC2VQptRgn2pwoni476RBHzvblccduiegnGlrzhN0fp/xNWsC2Ahn0zQfvO6iJgT3s5eZt4QyJ8l1dfmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756731321; c=relaxed/simple;
	bh=hd5YuUb43lmK9NYWKfd0042YSg6zpeLa+EqhNF43SKY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hy+OzA5HCQioGM6Yzj68wwu5E0Nu07mmTp5wOTuBlfJxim9TdpEQQ/m290nTHE8kijnbH+nvG/9YGpYGz447wARrrjLzAOgMCVXgh2aMLveEvBSiHOMiZckJIvKhBF/my4llUvER0IR6I31Tt62b05FWCvLE4AuItiGJqYeGRX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wdBpPWzb; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45b8b25296fso8584385e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 01 Sep 2025 05:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756731317; x=1757336117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QWKZDQFyYwOuNuulI3WR/HKsVV7Iww/yTWKQQUevPSM=;
        b=wdBpPWzbHRLTnzh2tNh14GkP2faT9kXMjhYz3VPyNkbTcycbRO+2E9JTzaHjsUEPSK
         PIeam9NPlrtl1I6R5jDfY2DGJRYKE87MUqIYpgItV/lxxpgZeLwetVX+vme7RNNzuWR4
         zhyRrDbFgogMDy+iJ09ikv1wPnPw9RLkXf1i4s7ehP1loDfmMTI+GgaT59uuTRNcpgtS
         8oaw8X0/FI3k3hz8pbKjullOTR1LYRaFZFlkgUyBxhoqU/Zr7s68U2zgy9N5CVf8sAL+
         O4jL02M+6DAVgiVU3HCryW/IFspOckLIpvXMFpybM+IAmUTibxQ7B0IYovdpbX9o8i60
         vVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756731317; x=1757336117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QWKZDQFyYwOuNuulI3WR/HKsVV7Iww/yTWKQQUevPSM=;
        b=b+Jamm5AYyppXst+Aov6CqfMW1igvDNGalSB+9pGN19uTQWx5cCdZ4jEN5LX6hdhEs
         scbDufOqs71nMe/9sYqVeveRQy/Iez7/eKKZAHaSgGKcuro4ZQq8tkTaEl+z/zLACDrW
         FOQ2HeLsJGQnrnywKxzM2z/j0XUctW6QcXmtw1QqdMGQp6JIY5L2q4XGL8O0puuQoPpT
         gS/GtYLpmnTL2rywIpJjJGmpyClUJ1JeywaBMbtQettXGEaZtNFSmSjA8x9Wb2d0vKbx
         kPwq7Pd6FBhNOPdDMPDOR7oNpCl+ygT8b9j7nVEpdOv7oyCmAO6hz3eVexRVl1o0KWUo
         hI5A==
X-Gm-Message-State: AOJu0YyP/2GZcBo7VWUySug8ybIBMjvNGIKKXvX1QTfI0nZCa+pfXGUR
	tz9qTGOjnVSkDRFoNjixM+5Z5iwplJVjYKzjy8BDuhnMFKvtOyLoLy8BRfMumZz7jKQ=
X-Gm-Gg: ASbGncvnj0uMuR9m0pucu0hez5Scvw1m77VMCfrf5buMA4qyFXP/EHcWcAjiSttpfp3
	WkF4hJXPdj9vBbW8iFpJD0NhLK0hcuTHCxw957vZ9Fa7L++YKK+AyMysdn4PoBJOp0V7wDV68DB
	1zoKLWAIX5A3zsH6sH9Jo+oysANmqcYL9IivE/TxAWOUgLX/WTVIDOJu/RtqJqDB5mfpfvTad1N
	X4lL5uWXzfOi6vjwVBO18cEOjzTyKXN93PyWe4XNZPtigRlus6EEO1q06ZLILECkrZcjhVstPeA
	WEvYWtcz7earDDd2NpBn32CGHfxjQ6idiIMQEetKsqxlChmgjVf82SrmmIjd6Qm0bCer8EBQc6B
	Sfmyh/MjFcrqGbfQ/YtAb0BDssVLVlmPxtQ==
X-Google-Smtp-Source: AGHT+IEfTJGjgZ6QGyy0XNs8W/KLBwucktc5Nnhf6C+tAQhHRtrP5B4Mes94NZ8oGoVH0Lqq/BK7wA==
X-Received: by 2002:a05:600c:3111:b0:45b:7185:9f4 with SMTP id 5b1f17b1804b1-45b8f477445mr15347715e9.34.1756731316267;
        Mon, 01 Sep 2025 05:55:16 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:fab9:fd92:e2cb:ddcb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b74950639sm208282115e9.17.2025.09.01.05.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 05:55:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH] gpio: fix GPIO submenu in Kconfig
Date: Mon,  1 Sep 2025 14:55:13 +0200
Message-ID: <20250901125513.108691-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Commit a86240a37d43 ("gpiolib: enable CONFIG_GPIOLIB_LEGACY even for
!GPIOLIB") accidentally pulled all items from within the GPIOLIB submenu
into the main driver menu. Put them back under the top-level GPIO entry.

Suggested-by: Rob Herring <robh@kernel.org>
Fixes: a86240a37d43 ("gpiolib: enable CONFIG_GPIOLIB_LEGACY even for !GPIOLIB")
Reported-by: Rob Herring <robh@kernel.org>
Closes: https://lore.kernel.org/all/20250813222649.GA965895-robh@kernel.org/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index a437fe652dbc6..6fd904e29c3e7 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -3,6 +3,9 @@
 # GPIO infrastructure and drivers
 #
 
+config GPIOLIB_LEGACY
+	def_bool y
+
 menuconfig GPIOLIB
 	bool "GPIO Support"
 	help
@@ -12,9 +15,6 @@ menuconfig GPIOLIB
 
 	  If unsure, say N.
 
-config GPIOLIB_LEGACY
-	def_bool y
-
 if GPIOLIB
 
 config GPIOLIB_FASTPATH_LIMIT
-- 
2.48.1


