Return-Path: <linux-gpio+bounces-15716-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C95A30B26
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 13:09:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 204153A3CB8
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 12:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1581FCFC1;
	Tue, 11 Feb 2025 12:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wEXSWn+2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB951FBCBC
	for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 12:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739275736; cv=none; b=tFhMSKv9hQP4a4SJxeen4aPKXSx+z/gbY5qy8Cm9L6Hq3YBZS9kX/95Ir/Ll/9466N1FbVKglUvoz2ZXWXApBVsc0jRTwuKQzS0+PMxyq/15/7mvD8Rt5s1ufzPpzrZ1RmnQdI60eM2G8RlqKmiJGnUgNOzBvAXOXlTmm9GsPic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739275736; c=relaxed/simple;
	bh=DMmQKJUWoLWDTo6CsUcRWGqMfh0KVbe3frTIjat0dVs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fuYlq4o4HtTRw2rfEj2bg0CIPjQiqCsFf+28qBmITMwUfWP1cykHanaTatSTwWyoxOfZE7J9WDjvNQsmKsokkMWDxUTarQQ2YzTsiRdEwnSLOaqdWnv4KtYJsvVv4nuyYcvC0H+K3mUNms6VyVyv1U4R9s71rnHxgo1/6GM/d2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wEXSWn+2; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso55037885e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 04:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739275732; x=1739880532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aW+CbC+3CkKX6aO8ZADFZPA9ixVxGeRfqoxuCdLGR9k=;
        b=wEXSWn+2CACgypv+TqvOq4RAmQXX7MaHs6meynTIne8CStuRTWjuqIEYuuzM3oFKg0
         HiKjz9yz6a8a/bCceHnYMNNBsQonZ/3blbDPREWWC6CX79kyBYUU2wNw/IXvKS+trwww
         5wbs0DqhJH/KvtmVuACuLb6HI6UYdOHKzKg66a7yEMC4+7Q1UXK2CIq/IupRKhr4IK0B
         GfAPn9A84G9WVprh+NiXCnPw/n9tSn8xZua4X42JlmH8vyXJKhnR0BuA7T65ZuUdNyl2
         o6afhCcikqG9ZjRTQbYKQBdFDpnyTo/mI0lAa83YxCpdnyQqoetVUHP6VZiy+f653kl7
         yoeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739275732; x=1739880532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aW+CbC+3CkKX6aO8ZADFZPA9ixVxGeRfqoxuCdLGR9k=;
        b=vTbB3xNVz2FPDZ4rBXqG7RcKsK6xdMpXG9JAf7nsO57xRo7lsbFkLCczmmP3TDAMYG
         S0CNpVP7MOhIaOWe+iD0J/TFJMRqAaOfjNLhpW3ZZJXtHuUMDdI9U8JSv+He5oIBKMvV
         KJOVJy0CDBhBiloJG5u1NO/7Xkscwv0EH8E9544S6GPyAkotzRDd41t+ElVHatcIbXh5
         SgEUpb+YTQHeJgBOU4wl51JkfBR1ezVk/OcmUkeY2IaxD9Wb0dBsblIPqpAfA5r+jOPh
         05cmGiv7kC3x4UgRiQ7qUuYdWPEZHqssigy8B4S2s6kMb8smS3iPNEW8wFDEXtJvSeVh
         ILGQ==
X-Gm-Message-State: AOJu0Yy3kpSr3oxbnvRiSSJk+JEWdDJtLnu5JQ7QVThUr0BR5FYDUB5H
	OuWo/qM7SEGkyQt1WIp0JcG/PWLmUss8vSmwzudjN0abNBwonX0ZCcR6UGJ3lxIKsN99ps+RFpH
	6vIg=
X-Gm-Gg: ASbGnct8n27IyuYLoPRCAFkfGju5bzB70HMdxzR5j4pZePvuhH/qjxN0c0l8tz2FI1Z
	aRtIfdT1eEEwm2H5UWVsNsjPXXpn/MOKnT7bOwGp9DOhd5WHmod7jFoXStcyHM0qR/y6PqRG6VC
	SEoQ474hpYca2r7LatvP4fMAua1pdXQ36gmzZJZ3LPhctkUz3Uj2YIXewVVnoCKqh2Lq0bVOq6T
	10MRv5yAN9/Z6iHZec0mSqLoQ/TlQ0Wp0tRdoVqiwlyMnbFo4jnnJg8F+QethE2soYZ1Jr+YHkR
	4eJAm5Ouzs+Y5A==
X-Google-Smtp-Source: AGHT+IGDzevVeKanekK8LsK569/EGDe7hIKmgjII5hLLH9kDMlcAizGPk9JfK4EPb34oW1q9kfAhqg==
X-Received: by 2002:a05:600c:5844:b0:439:5560:c9a1 with SMTP id 5b1f17b1804b1-4395560cc1dmr14883275e9.4.1739275731736;
        Tue, 11 Feb 2025 04:08:51 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4393b66f3e3sm86966375e9.19.2025.02.11.04.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:08:51 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 1/2] gpio: latch: use generic device properties
Date: Tue, 11 Feb 2025 13:08:46 +0100
Message-ID: <20250211120847.42437-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Replace calls to OF-specific interface with generic device property
getters. This is good practice and also drops implicit run-time
dependency on CONFIG_OF.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-latch.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-latch.c b/drivers/gpio/gpio-latch.c
index d7c3b20c8482..722eb5b045f5 100644
--- a/drivers/gpio/gpio-latch.c
+++ b/drivers/gpio/gpio-latch.c
@@ -44,6 +44,7 @@
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/delay.h>
 
 #include "gpiolib.h"
@@ -138,9 +139,9 @@ static bool gpio_latch_can_sleep(struct gpio_latch_priv *priv, unsigned int n_la
 
 static int gpio_latch_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct gpio_latch_priv *priv;
 	unsigned int n_latches;
-	struct device_node *np = pdev->dev.of_node;
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -172,14 +173,16 @@ static int gpio_latch_probe(struct platform_device *pdev)
 		spin_lock_init(&priv->spinlock);
 	}
 
-	of_property_read_u32(np, "setup-duration-ns", &priv->setup_duration_ns);
+	device_property_read_u32(dev, "setup-duration-ns",
+				 &priv->setup_duration_ns);
 	if (priv->setup_duration_ns > DURATION_NS_MAX) {
 		dev_warn(&pdev->dev, "setup-duration-ns too high, limit to %d\n",
 			 DURATION_NS_MAX);
 		priv->setup_duration_ns = DURATION_NS_MAX;
 	}
 
-	of_property_read_u32(np, "clock-duration-ns", &priv->clock_duration_ns);
+	device_property_read_u32(dev, "clock-duration-ns",
+				 &priv->clock_duration_ns);
 	if (priv->clock_duration_ns > DURATION_NS_MAX) {
 		dev_warn(&pdev->dev, "clock-duration-ns too high, limit to %d\n",
 			 DURATION_NS_MAX);
-- 
2.45.2


