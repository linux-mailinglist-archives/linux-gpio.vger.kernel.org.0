Return-Path: <linux-gpio+bounces-10443-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC110986265
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 17:12:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 308F5B33572
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 14:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7151AD400;
	Wed, 25 Sep 2024 13:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KlaVt/Ja"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0E0178364;
	Wed, 25 Sep 2024 13:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727270011; cv=none; b=pVWVZPuM1JVKmXSwzXYuOJH7PYpkz840WBdKtw5Ny5B11b/miRLbIURKrr0e1VljDGxx/Hyctc5zp1JO1PmghxTqazyV3QHLUEVAYH+wK+AhbExHnrmMMeipT4IB8k4eP4o0y0+b9ym6Pbu1uotfJqJJmv2fXvHqKUTAWLU0Kzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727270011; c=relaxed/simple;
	bh=wUArarG6n2kJj23FJq/ZMQBAp3XK0MTI36XBDrbYweQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JcxmDb2CN+KSRa5FZDV3EXbLMKQ6pEWcgYi+JlnxBmVRxaWaQ/mwo/8Ib3xSr/l0fDcGSRBxaub/dwRtkhcWqwPmnBEPOEGq9VlACOa2Y+WblJQJP4Hkf0yjvI4WbEgLZ3tn7n/hf2DXyRG8+C6Gpcy2uxNgCD718T3jPcZAJbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KlaVt/Ja; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7db90a28cf6so663552a12.0;
        Wed, 25 Sep 2024 06:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727270009; x=1727874809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pF+8WlBbXZYz8Bkk1bGI+HA3coAVwVqgSPCrJ+jSKNg=;
        b=KlaVt/JazX7mpqNe0sQmdaQdRHosSRNucX2rH35/3dSsVHypswRrYKUf96CQWI2ZzT
         4AL9FkSngECt4GL0bgdoZIOaVGxTtpAMzgJMBcFZKS+0uegIZuRFcb6n+e7M0x6pOcS/
         9JQslkigFdD6Zrrf13NhO7NtoRDjh3SuhR5TQhPCGh3c+nXQOXXRMmdLxZilxmAiq89p
         1mAn60L0VPCBq9vYCEx6tLyw/8qIRQfgVqRzD5n8yDE0V+fEuQdxUEwPiymtnrBpB/hK
         9H7md5JFOHXFW2HOgHccD0GNXBZNZCmDoBLCnIf/t4YIrEPJkj5Z0NZVVSfxiv/NDa+4
         WPWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727270009; x=1727874809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pF+8WlBbXZYz8Bkk1bGI+HA3coAVwVqgSPCrJ+jSKNg=;
        b=nwPfxFtdb/cT1wc7S/aU/sBu1j++kff/qFL4rKvLj5PwFlkIAiNyPZKmIxSbzo+LYT
         0cYzSBuIuqrsLmFmGOXBI9njooccuqGlaiGmNgl0YkeXZvjtwWUL60aw/IMC81BhVRcA
         ogH7zXzGi0bC8VtAMLEv2fTKUQhkdvriH6eyimRuZYu82EARLM+eW2xWQyxUcEzWY3Rt
         J9uboUdpN1uqNzzAjWsuAYb9i/n3bazBdqglGD9aKzXhPxiq4KQ0JaSIJM5qTPkzSXU3
         1zmr6lIde3PybwF2S3UafYD3QgKGWi1ZP/hESTfvulVtTjK/Qn5MFwYyrFN9JYVRmzuI
         FcOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfx0VMG4ALmDxEVzMMZGY3AHguVK2vvlKlazkS95O0zfdRbNEBI0MSL2FJxrTXSP9mK4++xMli/8TsF8pb@vger.kernel.org, AJvYcCX8r1wtKRQHQTeHyEXjI6+q/LaOfIP5uzyIjzTg7RPH+jyqIFtRYqvbN6wk0zjYKF0d3KZ3ZwNsNnyX@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3uipdOtjqTAud5zzXoYN9GAlKzPkbUa1YZwovz0oOE0fjrPQO
	o3VHHAtxopsfTahPrVwk2G5FGQiRUBd8ONZ3x9miVwXQnDP1lAw+
X-Google-Smtp-Source: AGHT+IGfDyKdsibjf7iP9mgQXsToZxWJyjsVkvPRdIPhfxBNkAZUDgM6Q7UmYzDciFRtQ9adkuACTA==
X-Received: by 2002:a17:90b:388b:b0:2d8:a744:a81c with SMTP id 98e67ed59e1d1-2e0567ba473mr10175586a91.1.1727270008997;
        Wed, 25 Sep 2024 06:13:28 -0700 (PDT)
Received: from rigel.home.arpa (14-202-6-222.static.tpgi.com.au. [14.202.6.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e1fedadsm1481973a91.28.2024.09.25.06.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 06:13:28 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: brgl@bgdev.pl,
	gregkh@linuxfoundation.org,
	sashal@kernel.org,
	linus.walleij@linaro.org
Cc: stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Kent Gibson <warthog618@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 5.10.y 5.15.y] gpiolib: cdev: Ignore reconfiguration without direction
Date: Wed, 25 Sep 2024 21:13:12 +0800
Message-Id: <20240925131312.653040-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[ Upstream commit b440396387418fe2feaacd41ca16080e7a8bc9ad ]

linereq_set_config() behaves badly when direction is not set.
The configuration validation is borrowed from linereq_create(), where,
to verify the intent of the user, the direction must be set to in order to
effect a change to the electrical configuration of a line. But, when
applied to reconfiguration, that validation does not allow for the unset
direction case, making it possible to clear flags set previously without
specifying the line direction.

Adding to the inconsistency, those changes are not immediately applied by
linereq_set_config(), but will take effect when the line value is next get
or set.

For example, by requesting a configuration with no flags set, an output
line with GPIO_V2_LINE_FLAG_ACTIVE_LOW and GPIO_V2_LINE_FLAG_OPEN_DRAIN
set could have those flags cleared, inverting the sense of the line and
changing the line drive to push-pull on the next line value set.

Skip the reconfiguration of lines for which the direction is not set, and
only reconfigure the lines for which direction is set.

Fixes: a54756cb24ea ("gpiolib: cdev: support GPIO_V2_LINE_SET_CONFIG_IOCTL")
Signed-off-by: Kent Gibson <warthog618@gmail.com>
Link: https://lore.kernel.org/r/20240626052925.174272-3-warthog618@gmail.com
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-cdev.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index c2f9d95d1086..fe0926ce0068 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -1186,15 +1186,18 @@ static long linereq_set_config_unlocked(struct linereq *lr,
 	for (i = 0; i < lr->num_lines; i++) {
 		desc = lr->lines[i].desc;
 		flags = gpio_v2_line_config_flags(lc, i);
+		/*
+		 * Lines not explicitly reconfigured as input or output
+		 * are left unchanged.
+		 */
+		if (!(flags & GPIO_V2_LINE_DIRECTION_FLAGS))
+			continue;
+
 		polarity_change =
 			(!!test_bit(FLAG_ACTIVE_LOW, &desc->flags) !=
 			 ((flags & GPIO_V2_LINE_FLAG_ACTIVE_LOW) != 0));

 		gpio_v2_line_config_flags_to_desc_flags(flags, &desc->flags);
-		/*
-		 * Lines have to be requested explicitly for input
-		 * or output, else the line will be treated "as is".
-		 */
 		if (flags & GPIO_V2_LINE_FLAG_OUTPUT) {
 			int val = gpio_v2_line_config_output_value(lc, i);

@@ -1202,7 +1205,7 @@ static long linereq_set_config_unlocked(struct linereq *lr,
 			ret = gpiod_direction_output(desc, val);
 			if (ret)
 				return ret;
-		} else if (flags & GPIO_V2_LINE_FLAG_INPUT) {
+		} else {
 			ret = gpiod_direction_input(desc);
 			if (ret)
 				return ret;
--
2.39.5


