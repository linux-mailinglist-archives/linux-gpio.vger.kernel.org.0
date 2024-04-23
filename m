Return-Path: <linux-gpio+bounces-5763-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB728AE8B9
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Apr 2024 15:54:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 587C4288503
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Apr 2024 13:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D315136E21;
	Tue, 23 Apr 2024 13:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wJCVoQph"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A1B1369A8
	for <linux-gpio@vger.kernel.org>; Tue, 23 Apr 2024 13:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713880446; cv=none; b=r4fCIvG59pJcJGZiYAKaTfOWnUGINyiA+7W+/8+r/JrRx6KG1RWLpiTLZLGShSj9AqqvvmiQhq3474OL482qAppKzzysVXEIwtyJ9Un4BtYYcilZUHDJCMAgF6XU5KdcF2Jgz9AR4Lak89XeGAlj9CLhEVwqLuVFRtxhKSjB4X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713880446; c=relaxed/simple;
	bh=uq44RX/SgqmbfC6VXLuuo7CPLcLJMnmCEO+mCpGAG9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hkWdTacFa5HkSsJEGVtn0rN4Ri+k1w6b4dVShznu3id+fklMZzPLhmpFqlm6sje+Cy7N/xaUHcvbbjyPblwI4OyUVIBDUYJOwi3FNeVDqngIGhFxek81FedWZs/BxDqJmJKSCYgdZED90XbX6BtSwz2QXYZ2sqrgRpTOm/jW6E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wJCVoQph; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-518a56cdbcfso8847206e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 23 Apr 2024 06:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713880442; x=1714485242; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wEjTI295LgCVV5ERwS4DZP1yxmv81nEiKm3GiKi945M=;
        b=wJCVoQphwfHr3Som77wHFjx2dnBkZkeJnH7BA74zlHVnCL12gwpNF1TFOOtTCo5SD/
         okIgDyP+2tE7t1vtsYy3lkaRCSkXIYh+Z560BEh2mW3Aq5XZ/aQOTLgMxR1A0VpEf2yf
         sh5nJ9gJ22iZdPBRSuLLDPd5U5JF0hZ7rz133Y86r8rtOKoPDSudIFbAhqMvuo6xG6xp
         LzWeiOyCv+yk5in+eNaMUiDmkHsQxAagtwn8JJSiGBcbQp4umFK/jt6zlV33ForAv0zp
         NZWD5Y6o5aGJZaK31sj2SZ+ayP8UNsTiJEQrJ785fYtgGYscHeXkeuaFUBvIiX6S4Zfz
         fftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713880442; x=1714485242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wEjTI295LgCVV5ERwS4DZP1yxmv81nEiKm3GiKi945M=;
        b=rOBnGeQxF+tzjwcQd18CVL/jN/jJ3x10jhNWylpXM0Ud+I6uAqvfhdRS2iAi2OYAVj
         5uATTHQZyWS6zHzObNsmnuK+wGP69dDfmu1q6GGbWRN0odBYqXOeObs/VUeAr88CSXc1
         KFX8BFGTUZaqLPjB6xFo+HForKRS/LkUHUwuSHnbj9zrWP1b7PUCU467r95jR848SV+5
         M/qfjE/NbEpEz8Ji+cOAsK0Mzw2oxJDJWKXzOXVBK9oBzidZQbVeXJ7OirM+aGnD8Kkh
         uCg5RI7w2yn506WZB59XrLB32qQhomcftNdB4GY+UW3MR4gMpqKiLivIBNXDPo847Mdy
         DfYQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9+C1K2GjzNYyyXEjRMAphgA7mzvIdQVwYePyHfcdhHKggmCkPwY+6bvx+bjG50LCl6JxH0lc07MNWfqSeqHWvgHkqmqFGffwxBw==
X-Gm-Message-State: AOJu0YybkpNcyu7mNx+CncaXOGi6pExvZ+ip6gqyNNb4zrojZOnpn44Z
	X1CC16tU9/8rdu4qjnniGB911SeEs05VC93UlONdwKHju5f81lT1md5K5XtLtnJh+ipQMHAbwUH
	2
X-Google-Smtp-Source: AGHT+IH1+21GmNgWo02XyqGVWT6stfzMs6P+xDchhUAi6mGeLDA4OOkHSmQk2cCYv1GfQn1MhOL7Aw==
X-Received: by 2002:ac2:4bd0:0:b0:516:9f03:6a92 with SMTP id o16-20020ac24bd0000000b005169f036a92mr13267766lfq.43.1713880442576;
        Tue, 23 Apr 2024 06:54:02 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id b18-20020ac24112000000b0051a61f2d251sm1875997lfi.290.2024.04.23.06.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 06:54:02 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 23 Apr 2024 15:54:00 +0200
Subject: [PATCH 4/5] ARM: orion5x: Convert Net2big board to GPIO
 descriptors for LEDs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240423-gpio-leds-v1-4-799c2f6bc61c@linaro.org>
References: <20240423-gpio-leds-v1-0-799c2f6bc61c@linaro.org>
In-Reply-To: <20240423-gpio-leds-v1-0-799c2f6bc61c@linaro.org>
To: Andrew Lunn <andrew@lunn.ch>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Gregory Clement <gregory.clement@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.13.0

This makes the LEDs on the Net2big Orion5x board use GPIO
descriptors instead of hardcoded GPIOs from the global
numberspace.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-orion5x/net2big-setup.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-orion5x/net2big-setup.c b/arch/arm/mach-orion5x/net2big-setup.c
index 695cc683cd83..6ad9740b426b 100644
--- a/arch/arm/mach-orion5x/net2big-setup.c
+++ b/arch/arm/mach-orion5x/net2big-setup.c
@@ -18,6 +18,7 @@
 #include <linux/i2c.h>
 #include <linux/ata_platform.h>
 #include <linux/gpio.h>
+#include <linux/gpio/machine.h>
 #include <linux/delay.h>
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
@@ -214,19 +215,30 @@ static void __init net2big_sata_power_init(void)
 static struct gpio_led net2big_leds[] = {
 	{
 		.name = "net2big:red:power",
-		.gpio = NET2BIG_GPIO_PWR_RED_LED,
 	},
 	{
 		.name = "net2big:blue:power",
-		.gpio = NET2BIG_GPIO_PWR_BLUE_LED,
 	},
 	{
 		.name = "net2big:red:sata0",
-		.gpio = NET2BIG_GPIO_SATA0_RED_LED,
 	},
 	{
 		.name = "net2big:red:sata1",
-		.gpio = NET2BIG_GPIO_SATA1_RED_LED,
+	},
+};
+
+static struct gpiod_lookup_table net2big_leds_gpio_table = {
+	.dev_id = "leds-gpio",
+	.table = {
+		GPIO_LOOKUP_IDX("orion_gpio0", NET2BIG_GPIO_PWR_RED_LED, NULL,
+				0, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("orion_gpio0", NET2BIG_GPIO_PWR_BLUE_LED, NULL,
+				1, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("orion_gpio0", NET2BIG_GPIO_SATA0_RED_LED, NULL,
+				2, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("orion_gpio0", NET2BIG_GPIO_SATA1_RED_LED, NULL,
+				3, GPIO_ACTIVE_HIGH),
+		{ },
 	},
 };
 
@@ -282,6 +294,7 @@ static void __init net2big_gpio_leds_init(void)
 	if (err)
 		pr_err("net2big: failed to setup SATA1 blue LED GPIO\n");
 
+	gpiod_add_lookup_table(&net2big_leds_gpio_table);
 	platform_device_register(&net2big_gpio_leds);
 }
 

-- 
2.44.0


