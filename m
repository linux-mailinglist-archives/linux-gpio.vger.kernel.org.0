Return-Path: <linux-gpio+bounces-5764-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E498AE8BB
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Apr 2024 15:54:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 558801C21EEE
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Apr 2024 13:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 700D6136E2A;
	Tue, 23 Apr 2024 13:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gL+PxhQt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868221369A9
	for <linux-gpio@vger.kernel.org>; Tue, 23 Apr 2024 13:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713880447; cv=none; b=snjfFlEYRS+aLFt0PxPqImV1jcYOCexmWZ3nFOiuV59rhP8LiSApdXO+ZZMTw2jsncrhNUkMe9j3n8gBSdPF2/lSHd/AFfvT+CgFnaJa2rjGZoD8+c7jioYNRMXZnwMOxQ1QnBRUG976ZuBWTGat66HUOBJ9/L2Qs8oGor0/Fek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713880447; c=relaxed/simple;
	bh=Rc2IumjbQ8OjG4qfb9Z/1cwn+g9VCp4urj9gZ8iGneE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LEJeH0wKtB6UUI2unxFgRJybwrc8TlQigWSHdkrKhPBg5TEBRY1R2cEPcrz8OJPkuP4Ok9kfneYZuCcSUZrUmV24pgFQcB+NEbYpGopP0KDQCue2+wJ2X901ZGAy+NgXhrNZwgzB6VH9HrNPd57Kzc5LZL6Dbe+KBrtprtFQuZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gL+PxhQt; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-51b09c3a111so3790114e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 23 Apr 2024 06:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713880443; x=1714485243; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gtSA0+kfCH0DzApn0Z0KwQ9Ybzg48e+TinciXUnlIO0=;
        b=gL+PxhQtlBkKCKXD98D2fu1xrRdORNGEnBDV/FrEbJNoBoc7FFnRYyd5UvRhJzb2l2
         RzCdzfltTycU79WqlEZj7VtEhLVBx6AAOrS3d13s1U7+xYabw7PJIDytySBbvrQw7Mjr
         UP4WZQR/3o7QAsgw3agtrqWOzFiPjShjC/ZC8wbiA5pe1sn+KUwdfCvYnQdvJdzpQ1hC
         2SYe6hmYZyYcv8yQjZicliIoCpmS7zHzjEOIu32MEUm2jn6AevV/cylDobxClyZy1Ote
         HGWbFQ4ihwWPeVLlP5NgnxKL4o4NXkFW6Gbb3NSFp+6I7drLhK5xqIqqq42CQGZSROhw
         lDaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713880443; x=1714485243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gtSA0+kfCH0DzApn0Z0KwQ9Ybzg48e+TinciXUnlIO0=;
        b=HusnikhvBifQEIKY5DCMK1+VPSdpQpUezlS0RrxUaHUQn+2/58EsWb6D1kyR+bjMhR
         EmM2+wXug1Cd0MP8SN/ibRmQeZG/u1W4vymRx2pZ3Vbec0hipsnYmNIKnHJUARGk5X/q
         95zVjDtO7ceid3heZ44hqQ9INkBd3UqhcS7xX1XmgqBIyOL6U2dWanteLcpVS1a+DrIb
         hhhQxoKPFdJ8+hUvMXID2gnWiWU5rdtR5yeZD/UaysfVISwRdVXkiD+ebghJ00dmP8/y
         HXIHny+Q9N6r/h5JVyhyI/rxvvM4rewLENgP1ytiAMOiA/o8y5G+/7q88VQWmARv2C7T
         g9yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdyT3UGxMBEC8cYBJe2PJ3I3hC1tMscbrdPavkE6XSCzT7ba2TLIVlhdXD6NaINFC97yzOFhI4Aa8Ri2o6i62/NBLTfdCnz/IHJQ==
X-Gm-Message-State: AOJu0YxdOt5zynbxwq0RCl5LdUQ0RnMp3jsaZr0N4QpeJGyOVKd5TdoH
	ja5yPMuEpC1ysEk9iR3JDk8xO8mbZ8OXAjAsJZFWzMiVdtUMRxcBQLp1Il5UiwkUIbooKjA1a9M
	V
X-Google-Smtp-Source: AGHT+IFlE4pqogUlR+eZ37BQq666pDAg97ATWOgkDpFMSX8lWAbA7K/Gu3ABd18BwtKzqHaH18zFDA==
X-Received: by 2002:a19:640e:0:b0:519:6691:4135 with SMTP id y14-20020a19640e000000b0051966914135mr8449450lfb.67.1713880443491;
        Tue, 23 Apr 2024 06:54:03 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id b18-20020ac24112000000b0051a61f2d251sm1875997lfi.290.2024.04.23.06.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 06:54:02 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 23 Apr 2024 15:54:01 +0200
Subject: [PATCH 5/5] ARM: orion5x: Convert TS409 board to GPIO descriptors
 for LEDs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240423-gpio-leds-v1-5-799c2f6bc61c@linaro.org>
References: <20240423-gpio-leds-v1-0-799c2f6bc61c@linaro.org>
In-Reply-To: <20240423-gpio-leds-v1-0-799c2f6bc61c@linaro.org>
To: Andrew Lunn <andrew@lunn.ch>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Gregory Clement <gregory.clement@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.13.0

This makes the LEDs on the TS409 Orion5x board use GPIO
descriptors instead of hardcoded GPIOs from the global
numberspace.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-orion5x/ts409-setup.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-orion5x/ts409-setup.c b/arch/arm/mach-orion5x/ts409-setup.c
index 6f60dc1dfa22..8131982c10d9 100644
--- a/arch/arm/mach-orion5x/ts409-setup.c
+++ b/arch/arm/mach-orion5x/ts409-setup.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2008  Martin Michlmayr <tbm@cyrius.com>
  */
 #include <linux/gpio.h>
+#include <linux/gpio/machine.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
@@ -168,20 +169,27 @@ static struct i2c_board_info __initdata qnap_ts409_i2c_rtc = {
 static struct gpio_led ts409_led_pins[] = {
 	{
 		.name		= "ts409:red:sata1",
-		.gpio		= 4,
-		.active_low	= 1,
 	}, {
 		.name		= "ts409:red:sata2",
-		.gpio		= 5,
-		.active_low	= 1,
 	}, {
 		.name		= "ts409:red:sata3",
-		.gpio		= 6,
-		.active_low	= 1,
 	}, {
 		.name		= "ts409:red:sata4",
-		.gpio		= 7,
-		.active_low	= 1,
+	},
+};
+
+static struct gpiod_lookup_table ts409_leds_gpio_table = {
+	.dev_id = "leds-gpio",
+	.table = {
+		GPIO_LOOKUP_IDX("orion_gpio0", 4, NULL,
+				0, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("orion_gpio0", 5, NULL,
+				1, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("orion_gpio0", 6, NULL,
+				2, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("orion_gpio0", 7, NULL,
+				3, GPIO_ACTIVE_LOW),
+		{ },
 	},
 };
 
@@ -300,6 +308,7 @@ static void __init qnap_ts409_init(void)
 	if (qnap_ts409_i2c_rtc.irq == 0)
 		pr_warn("qnap_ts409_init: failed to get RTC IRQ\n");
 	i2c_register_board_info(0, &qnap_ts409_i2c_rtc, 1);
+	gpiod_add_lookup_table(&ts409_leds_gpio_table);
 	platform_device_register(&ts409_leds);
 
 	/* register tsx09 specific power-off method */

-- 
2.44.0


