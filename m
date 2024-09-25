Return-Path: <linux-gpio+bounces-10442-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C476D986091
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 16:27:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B4081F266DC
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 14:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1E3F18C00D;
	Wed, 25 Sep 2024 13:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Crqhtoco"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FFD18C004;
	Wed, 25 Sep 2024 13:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727269949; cv=none; b=BXyKCIRd+E/JHR2nHhXZfDiIU5ug4eFeystIehFSlmv7CDiAfLT53apl54oKwuMKwnSiMlj+HhjG4stkyCxKD5tiRrC4VbWcBIGV+xGFKi8O3UhKbAOkA1fbqjJNx4BWPDfP47QCjygd0SZLSOXo6MKD4jha4TBC3qJJMo/zwnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727269949; c=relaxed/simple;
	bh=UeDkwbmJSVVb+6EeoAPD3T85InEae0+dBckAFjBy7uY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sZOoWKGh42r//KstM5UIwbfz87YDlrK/qrLRsUnlhedqqcxU0Rto5QrYetRrD1AR9cMC6iJR49jQ01Ipc0Jsj0/ro0+Nd9oltyIuStNJHhlGM4iV3+vhNFF6hgJK+AprL0TWFI5yDWhmYT+aeYOSrk6QlrSFMSpaM0gqlcVdxj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Crqhtoco; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7178df70f28so5144954b3a.2;
        Wed, 25 Sep 2024 06:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727269947; x=1727874747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=faAzbfCVHd1movVl3Gdx3/iQrBI1ffHa9CbcxGsEAyg=;
        b=CrqhtocoJni/q3xja/D4BbayKIpLpX7PqQfPGBenSHWwo8djOD5lugtBpmis0IErjY
         kxs2A5ZZWsacaJIH1h7wYRnIFZ9x0Vet1yl7qfBsgVe4MLX5b2Sf4ra1yS3MV/DI4NDt
         nOJFGvYX4zwUBsxMt0r0z2NZuEWCgVRlWKgB0pWpWdXdCjqCQmn1OxfPivJMQUVhD8Yv
         LsW9R2ARPF6jmw3y1+vAsIukm1+flx97V0E9hOatmdVr1KjjExgtX3332Cqed87Gkc9m
         hwxapreMkSkjotF+gZaL9tR9RumG+QkBEkUM1rTwijPobfMbAZW4Hny2HMTlTAxcLLHh
         d9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727269947; x=1727874747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=faAzbfCVHd1movVl3Gdx3/iQrBI1ffHa9CbcxGsEAyg=;
        b=k4jZx96OXPOuWeRj0IlgatU2i0eY+9+CTXzwyKYiBC2dnGHFUwmrU0+XsdTHPVD7RA
         RfK6R4cHoFNVoHOrDiPoiaqfKqYn0uTqGYrdSDAOO5rdPXammDRJbQheTSNnTAr+Nl3z
         fawo+62+EjpQYENqMNmXvzdS6KdU5jARUgWLAdTsQn++eExnR00eXaQpqFUxZ9nAmSxO
         E2Ox6tpeLDznucK0OYKR8UpE2yXDDBvNYm4YNtjNHoP5HS8Cw/yjUHQtHDqXxSQk9G5Y
         TM/KHR3JejRgg/asUFwi6JAcZri+kv0AiUB0uPy5vWItcMWK+u2BKe7ngg92A78zYWs6
         +I+g==
X-Forwarded-Encrypted: i=1; AJvYcCU0ElEhz8tojoYyFjM2ARsKj+CKaLTE8mQyQtIuotGQCL6Bf4+cfBVXyZ/AM2C2Y7np8e4DSdab+ziKzsGd@vger.kernel.org, AJvYcCXTvUiBKHx1lcOGGe/BCqI7FyzWllgtka69gRMo8F7GRVuUbC/rokfgz+kvpSLjS2p5W+WCjm0ZVWlf@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3mF7cK0LeX1W8IcjQQ+Yfeep8UiTt4Gfup1COdGKRyJ6PTXfF
	e+o3l1zHkApvik2Fprvlju/j7/IsgcQQ2hbHdvAaXsakk9IrDvnOXvRGNe5E
X-Google-Smtp-Source: AGHT+IHLooNSOfabY0P8Bed32e0Xag9VC4/Ep2PgBnfIyEF0odak/k6ESwQrbDrHLDsVnNQLSN/Y/w==
X-Received: by 2002:a05:6a00:464f:b0:714:2198:26af with SMTP id d2e1a72fcca58-71b0aaa2693mr3369028b3a.3.1727269947193;
        Wed, 25 Sep 2024 06:12:27 -0700 (PDT)
Received: from rigel.home.arpa (14-202-6-222.static.tpgi.com.au. [14.202.6.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71afc97c168sm2816922b3a.148.2024.09.25.06.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 06:12:26 -0700 (PDT)
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
Subject: [PATCH 6.1.y 6.6.y] gpiolib: cdev: Ignore reconfiguration without direction
Date: Wed, 25 Sep 2024 21:10:13 +0800
Message-Id: <20240925131013.651551-1-warthog618@gmail.com>
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
 drivers/gpio/gpiolib-cdev.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index d526a4c91e82..545998e9f6ad 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -1565,12 +1565,14 @@ static long linereq_set_config_unlocked(struct linereq *lr,
 		line = &lr->lines[i];
 		desc = lr->lines[i].desc;
 		flags = gpio_v2_line_config_flags(lc, i);
-		gpio_v2_line_config_flags_to_desc_flags(flags, &desc->flags);
-		edflags = flags & GPIO_V2_LINE_EDGE_DETECTOR_FLAGS;
 		/*
-		 * Lines have to be requested explicitly for input
-		 * or output, else the line will be treated "as is".
+		 * Lines not explicitly reconfigured as input or output
+		 * are left unchanged.
 		 */
+		if (!(flags & GPIO_V2_LINE_DIRECTION_FLAGS))
+			continue;
+		gpio_v2_line_config_flags_to_desc_flags(flags, &desc->flags);
+		edflags = flags & GPIO_V2_LINE_EDGE_DETECTOR_FLAGS;
 		if (flags & GPIO_V2_LINE_FLAG_OUTPUT) {
 			int val = gpio_v2_line_config_output_value(lc, i);

@@ -1578,7 +1580,7 @@ static long linereq_set_config_unlocked(struct linereq *lr,
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


