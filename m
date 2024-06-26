Return-Path: <linux-gpio+bounces-7697-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B72E2917823
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 07:30:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46904B22A0E
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 05:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E41D514534D;
	Wed, 26 Jun 2024 05:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UTntpJMS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A62143882;
	Wed, 26 Jun 2024 05:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719379799; cv=none; b=YvXXmJ70YvbdYJQ/lyjvXXL4toThisD9kYNVF0uZcQwACUo+HHeGBaKA9QkzYURGTVv0N2ZL4jXMdndcShsZD0h/iXvwJTbtXEjkFqVBZqotrl5N7C6R2p8CJQ2ZuU+MMN/zfHrOopXWjJpSYn1+Nckch9nMq4jr+lONtPaD34Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719379799; c=relaxed/simple;
	bh=OIEjf1PmNuRJQdMYjG/K8J0cSTFB4cdxAArbfqrK5vw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jf95FCkGANphO/7kMBU/2R9WfRZnE1AGNqPlz3YPh7uafILqaVhaugnQGnaODkeFLjo37rwnwYFwO5cmg45OlHTkOCGVhl1M4EKemky5NpkKbGUEIxwHe6bYpn4EaRBQNlm4zRhDk4MX9jWmsWPRWCXSLxn9TnTq3eZKFtFaZdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UTntpJMS; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-70666ac8f81so159064b3a.1;
        Tue, 25 Jun 2024 22:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719379797; x=1719984597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F2HewnJ2y3xpq3HKpApD6R+6vfVQF+cUrNl05u8p3oY=;
        b=UTntpJMS3VwxwuNoegKGPEq2g/4hodZWAUnvDa5eJEWUN5vW0fWU9TkDyZhPQl55is
         L70fmjLSaXxQAm+1yEoW3D8tH1hlTjtaufrZZGiIicsVcP3pnF95I8te6PuMbaZncWnR
         lRY/+iKAsbx0QS5ixht2DziS1SKaxVbbggjaK+AQa7zlNFgKYaiMcRdMCj7qmjqVHB0h
         WsBLzGv+uGn7H6DyE+OTB5S4PJH8eOeg4UsMIS+1Lh0lTVOys/HKRq/W7qivSRDwD/nr
         nWufa4p72hfF0BYBjpqGYCMdoIKoKDu0kewoNkH4/Nvg7DKyfM7rIv0aH03x/r8r9spj
         KX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719379797; x=1719984597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F2HewnJ2y3xpq3HKpApD6R+6vfVQF+cUrNl05u8p3oY=;
        b=ICBD0aor8tuca6FSEo0ipNttzS2Fh8ugsDTpFiMR0v5tT0Kp8TqkjrrBWwyDS8ZsGA
         xo1aCOZ9hawpqzHL6IB3XXAKGg0z1U8xQzOBtE8NloxsZr2q9jc9q7i0D/InZCQCHr63
         B01NWlcxRzVSaT204q3edXrXOMkgcGkDspi5MpeHbCNeqxb3uYhlsZkziCagRsaENSE9
         /3VtRqAp2frjDbe7n6Okis02mY2H+X8I3nUNCUW+1R2HD7d7B/cOaW0UD666xl5VaNSy
         HNTfZeyYg9VngCo6gT0zCn15hHPdTMvgpMvJunQT6ko3CF0n/2ksmSBNZ7H41LvMUcrd
         z4Dw==
X-Forwarded-Encrypted: i=1; AJvYcCU1oVwb0yLOCK4ONJApJUE2vs0Pscd1lVLqmEvONlFypNWKHqb+bg6ra4367wtUnhWuSdDzNju7fN023zchauYXhsZNm1yWODrHgA==
X-Gm-Message-State: AOJu0YzkcopI9PerpmQBDxY3LUGtflURvIfa4Iyof7Qu5LDPII/twpBu
	f1E8e7qqbo6rsQ+cnPliKE5DF1UqsU1M7tsaAArXrfVteutfyB2Wlhd4Qw==
X-Google-Smtp-Source: AGHT+IG31733UcUI+4wlncV0gMyPhtutHGo8Sw2LufM7FncAEos4V2X1raZr9gthAU8YfZ1lupAnMg==
X-Received: by 2002:a05:6a20:4694:b0:1bd:2cb0:2e8e with SMTP id adf61e73a8af0-1bd2cb0325dmr1471901637.12.1719379797292;
        Tue, 25 Jun 2024 22:29:57 -0700 (PDT)
Received: from rigel.home.arpa ([118.209.204.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70661b9f2f6sm7804000b3a.187.2024.06.25.22.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 22:29:56 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	brgl@bgdev.pl,
	linus.walleij@linaro.org
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 2/4] gpiolib: cdev: Ignore reconfiguration without direction
Date: Wed, 26 Jun 2024 13:29:23 +0800
Message-Id: <20240626052925.174272-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240626052925.174272-1-warthog618@gmail.com>
References: <20240626052925.174272-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
---
 drivers/gpio/gpiolib-cdev.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index f7a129d67b7d..ef08b23a56e2 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -1534,12 +1534,14 @@ static long linereq_set_config(struct linereq *lr, void __user *ip)
 		line = &lr->lines[i];
 		desc = lr->lines[i].desc;
 		flags = gpio_v2_line_config_flags(&lc, i);
+		/*
+		 * Lines not explicitly reconfigured as input or output
+		 * are left unchanged.
+		 */
+		if (!(flags & GPIO_V2_LINE_DIRECTION_FLAGS))
+			continue;
 		gpio_v2_line_config_flags_to_desc_flags(flags, &desc->flags);
 		edflags = flags & GPIO_V2_LINE_EDGE_DETECTOR_FLAGS;
-		/*
-		 * Lines have to be requested explicitly for input
-		 * or output, else the line will be treated "as is".
-		 */
 		if (flags & GPIO_V2_LINE_FLAG_OUTPUT) {
 			int val = gpio_v2_line_config_output_value(&lc, i);
 
@@ -1547,7 +1549,7 @@ static long linereq_set_config(struct linereq *lr, void __user *ip)
 			ret = gpiod_direction_output(desc, val);
 			if (ret)
 				return ret;
-		} else if (flags & GPIO_V2_LINE_FLAG_INPUT) {
+		} else {
 			ret = gpiod_direction_input(desc);
 			if (ret)
 				return ret;
-- 
2.39.2


