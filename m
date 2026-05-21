Return-Path: <linux-gpio+bounces-37239-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEmSDguVDmrJAQYAu9opvQ
	(envelope-from <linux-gpio+bounces-37239-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 07:15:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B3559EFC4
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 07:15:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 714F9306D867
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 05:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16032349B0D;
	Thu, 21 May 2026 05:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r5uo/TcK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454A1339844
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 05:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779340427; cv=none; b=mu74xEJJCzSMYIJ30WHYlrYx+pZswXbS55/uynlN084sfYHeCkrXjWiZweOfXevzAtvf2cSXSLPHOerGT5ruOSWwHbuLo6MggSj03zbTxZAV2nOWYYgZQKaMQxHYuf5ge2Uf+oN9c3Am619/CDobZ5nUjDl9eJuqwIqXkgDmMic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779340427; c=relaxed/simple;
	bh=sqigRYMe9Ei/euDhl7m0Dt51zXJI7/WmeHuh6kLpDkk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EVdCaNPK1WRMEVq+Cp+N16uxvsb7oh+lAbI8F51py+QSLYfK4uDpbBAC7P2BPN6AIRMT+rBclH/bzYVftvGFQw2Hu+QWTvV+0tWhN/oF07AFGDQwYjzGKkdiJNW/3/pBB3TDny7m3nYXYBzprQAK7k/EdazrEB/LJKh2+OjHXBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r5uo/TcK; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3042a388168so443290eec.1
        for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 22:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779340425; x=1779945225; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+AeVt9B3IyF1WrSPsCMEkGadYjuCmhfMkRPmef3xtU=;
        b=r5uo/TcK1qi0shN1gb4pqRbrKFPp0VZNn125tjyCzudBg2OSKCUF0XoKlm0GZ6OQTJ
         u7/WIKwFoizQRhAKNOsS2ouSsh/UTfmrgpmaG1YS0D6fCWuDQcyp4A+6ve4k9KNnOi4y
         unJZnAL1ZAKuQDn5M3gUsTj66nVBoS7bCiNF4gAMr5ymkYGEOVclIOBQY3TxcOrA3qyh
         zxCo2dwdJz6JJQBTXGM48H7s1OvU4G4aLiqUODNe2DLjcLdRocZOBb1SaPBxOE0OY416
         zujro/m+0FIfKp6kWDCfpacjypLxMMu2kAacNDSqHFV3FIALfCh/Sd4/GEIRF42OxB9D
         IDwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779340425; x=1779945225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f+AeVt9B3IyF1WrSPsCMEkGadYjuCmhfMkRPmef3xtU=;
        b=hPBnJouM2ZAfDW+fgJs+fq2zH10S7TsU7RFd9w+ZidxHeasyleOp03yxMjjT5bQJOt
         /qQvfhJXITNaB9OFVfbWnHRJjvme7Btot4Qhtuk/1ls8rQ4cZlqhkqjJQN8F+TnuCHSW
         4cs0iioyIYnjIc3Eu2vKoQKgfDHaMiJ/3QzskBkH1vl8kOAsglnF4Hu3OSRsI3feU59E
         8Fl7eCAKx3tmOIs7HTBREGq6MKWpDUD3QJJtbhhRFGBIhzDVH/YzZbrYwh1v0IdmeDPg
         eqvPU3n0pyWFF03oBHE4kyiY2hsfOI/eK5xnSttehgMYR2aG0iiu9Z+VRE6BMfyOugK1
         9O5w==
X-Forwarded-Encrypted: i=1; AFNElJ/HTtYmqK/Z2JVNj6k+bPlcWmML/QDJM1F3UQbN7F0VtaIiZOXfzNI44Lm6XyXjO3qmuC1VyetYdx5k@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7RONLSKGKHsRIGuPQN3siZEQmsG2cPb/50WVFpq5sNtPiFEXH
	66hgkQ8tefQWC2nHlZ80xNBnUCoGAjSMCifIKsWhX/trN2HgmCfUXXymxz2lNg==
X-Gm-Gg: Acq92OFLM41DYygJvwVvr7IayGX55L2+ft7y9kotMagIsm0iFat9l2/2f6frwmd8fQj
	N9RoDYHquu0/4Cv10YIXGHi91DuRoUczohnOGquuNdf771OKOUq08NVW6EnAf6gFxu1CnwYeXOK
	Jl3MUvtrTAx24t6HNyY1I+T6Fxifig8O41W51LwcPToGKomOUWjZso68RQl03N9FDmEFMw7HNtq
	nBiw9KSZnrCodX/kP3ZKKhwOodB2AI/g4RdGdT4Lb2v80j0D1zI2tOrR3lTJlnPFpOF159Z+SUd
	FFpb72LID8kpT4Rhl7uPkhRi/v5fi8LGzf9qQKoFh3gRxd06JeYweIG2OLD5EBAkNrN6upRIWPW
	/LN2y0kFxT1YxAiTsTo85BZxOXl3j3R1QAnxcoq5IEFVX3ad2c7dBeW8LZtQNQ04pvNwAFjMKVH
	SexYreEzskqd8QT5/Ic7Xq4aJhu+ZFLAsMkF9untkRAw5NVZ+xnfXsIIzGjYHtCEv8QzcVBY63u
	wQttqlpFBZiaA==
X-Received: by 2002:a05:7022:609c:b0:11a:fb0a:ceca with SMTP id a92af1059eb24-13633eb60b4mr545331c88.16.1779340425118;
        Wed, 20 May 2026 22:13:45 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d457:597:d576:1eb8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-135e5c0a918sm6231360c88.14.2026.05.20.22.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 22:13:44 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 20 May 2026 22:13:19 -0700
Subject: [PATCH v2 3/5] sh: mach-rsk: rsk7203: use static device properties
 for LEDs and GPIO buttons
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-rsk7203-properties-v2-3-465f3308021b@gmail.com>
References: <20260520-rsk7203-properties-v2-0-465f3308021b@gmail.com>
In-Reply-To: <20260520-rsk7203-properties-v2-0-465f3308021b@gmail.com>
To: Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Arnd Bergmann <arnd@kernel.org>, linux-sh@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16-dev-6911d
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37239-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D7B3559EFC4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert the board to use static device properties instead of platform
data to describe LEDs and GPIO-connected buttons on the board, so
that support for platform data can be removed from gpio-keys and other
drivers, unifying their behavior.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/sh/boards/mach-rsk/devices-rsk7203.c | 199 ++++++++++++++++++++----------
 1 file changed, 131 insertions(+), 68 deletions(-)

diff --git a/arch/sh/boards/mach-rsk/devices-rsk7203.c b/arch/sh/boards/mach-rsk/devices-rsk7203.c
index e6b05d4588b7..f8760a91e2f1 100644
--- a/arch/sh/boards/mach-rsk/devices-rsk7203.c
+++ b/arch/sh/boards/mach-rsk/devices-rsk7203.c
@@ -4,17 +4,19 @@
  *
  * Copyright (C) 2008 - 2010  Paul Mundt
  */
+#include <linux/err.h>
 #include <linux/init.h>
 #include <linux/types.h>
 #include <linux/platform_device.h>
 #include <linux/interrupt.h>
 #include <linux/smsc911x.h>
 #include <linux/input.h>
+#include <linux/io.h>
 #include <linux/gpio.h>
-#include <linux/gpio_keys.h>
-#include <linux/leds.h>
+#include <linux/gpio/machine.h>
+#include <linux/gpio/property.h>
 #include <asm/machvec.h>
-#include <asm/io.h>
+#include <cpu/pfc.h>
 #include <cpu/sh7203.h>
 
 static struct smsc911x_platform_config smsc911x_config = {
@@ -37,92 +39,138 @@ static struct resource smsc911x_resources[] = {
 	},
 };
 
-static struct platform_device smsc911x_device = {
-	.name		= "smsc911x",
-	.id		= -1,
-	.num_resources	= ARRAY_SIZE(smsc911x_resources),
-	.resource	= smsc911x_resources,
-	.dev		= {
-		.platform_data = &smsc911x_config,
+static const struct software_node rsk7203_gpio_leds_node = {
+	.name = "rsk7203-gpio-leds",
+};
+
+static const struct software_node rsk7203_green_led_node = {
+	.name = "green",
+	.parent = &rsk7203_gpio_leds_node,
+	.properties = (const struct property_entry[]) {
+		PROPERTY_ENTRY_STRING("label", "green"),
+		PROPERTY_ENTRY_GPIO("gpios", &pfc_gpiochip_node,
+				    GPIO_PE10, GPIO_ACTIVE_LOW),
+		{ }
 	},
 };
 
-static struct gpio_led rsk7203_gpio_leds[] = {
-	{
-		.name			= "green",
-		.gpio			= GPIO_PE10,
-		.active_low		= 1,
-	}, {
-		.name			= "orange",
-		.default_trigger	= "nand-disk",
-		.gpio			= GPIO_PE12,
-		.active_low		= 1,
-	}, {
-		.name			= "red:timer",
-		.default_trigger	= "timer",
-		.gpio			= GPIO_PC14,
-		.active_low		= 1,
-	}, {
-		.name			= "red:heartbeat",
-		.default_trigger	= "heartbeat",
-		.gpio			= GPIO_PE11,
-		.active_low		= 1,
+static const struct software_node rsk7203_orange_led_node = {
+	.name = "orange",
+	.parent = &rsk7203_gpio_leds_node,
+	.properties = (const struct property_entry[]) {
+		PROPERTY_ENTRY_STRING("label", "orange"),
+		PROPERTY_ENTRY_STRING("linux,default-trigger", "nand-disk"),
+		PROPERTY_ENTRY_GPIO("gpios", &pfc_gpiochip_node,
+				    GPIO_PE12, GPIO_ACTIVE_LOW),
+		{ }
 	},
 };
 
-static struct gpio_led_platform_data rsk7203_gpio_leds_info = {
-	.leds		= rsk7203_gpio_leds,
-	.num_leds	= ARRAY_SIZE(rsk7203_gpio_leds),
+static const struct software_node rsk7203_red1_led_node = {
+	.name = "red:timer",
+	.parent = &rsk7203_gpio_leds_node,
+	.properties = (const struct property_entry[]) {
+		PROPERTY_ENTRY_STRING("label", "red:timer"),
+		PROPERTY_ENTRY_STRING("linux,default-trigger", "timer"),
+		PROPERTY_ENTRY_GPIO("gpios", &pfc_gpiochip_node,
+				    GPIO_PC14, GPIO_ACTIVE_LOW),
+		{ }
+	},
 };
 
-static struct platform_device led_device = {
-	.name		= "leds-gpio",
-	.id		= -1,
-	.dev		= {
-		.platform_data	= &rsk7203_gpio_leds_info,
+static const struct software_node rsk7203_red2_led_node = {
+	.name = "red:heartbeat",
+	.parent = &rsk7203_gpio_leds_node,
+	.properties = (const struct property_entry[]) {
+		PROPERTY_ENTRY_STRING("label", "red:heartbeat"),
+		PROPERTY_ENTRY_STRING("linux,default-trigger", "heartbeat"),
+		PROPERTY_ENTRY_GPIO("gpios", &pfc_gpiochip_node,
+				    GPIO_PE11, GPIO_ACTIVE_LOW),
+		{ }
 	},
 };
 
-static struct gpio_keys_button rsk7203_gpio_keys_table[] = {
-	{
-		.code		= BTN_0,
-		.gpio		= GPIO_PB0,
-		.active_low	= 1,
-		.desc		= "SW1",
-	}, {
-		.code		= BTN_1,
-		.gpio		= GPIO_PB1,
-		.active_low	= 1,
-		.desc		= "SW2",
-	}, {
-		.code		= BTN_2,
-		.gpio		= GPIO_PB2,
-		.active_low	= 1,
-		.desc		= "SW3",
+static const struct software_node rsk7203_gpio_keys_node = {
+	.name = "rsk7203-gpio-keys",
+	.properties = (const struct property_entry[]) {
+		PROPERTY_ENTRY_U32("poll-interval", 50),
+		{ }
 	},
 };
 
-static struct gpio_keys_platform_data rsk7203_gpio_keys_info = {
-	.buttons	= rsk7203_gpio_keys_table,
-	.nbuttons	= ARRAY_SIZE(rsk7203_gpio_keys_table),
-	.poll_interval	= 50, /* default to 50ms */
+static const struct software_node rsk7203_sw1_key_node = {
+	.parent = &rsk7203_gpio_keys_node,
+	.properties = (const struct property_entry[]) {
+		PROPERTY_ENTRY_U32("linux,code", BTN_0),
+		PROPERTY_ENTRY_GPIO("gpios", &pfc_gpiochip_node,
+				    GPIO_PB0, GPIO_ACTIVE_LOW),
+		PROPERTY_ENTRY_STRING("label", "SW1"),
+		{ }
+	},
 };
 
-static struct platform_device keys_device = {
-	.name		= "gpio-keys-polled",
-	.dev		= {
-		.platform_data	= &rsk7203_gpio_keys_info,
+static const struct software_node rsk7203_sw2_key_node = {
+	.parent = &rsk7203_gpio_keys_node,
+	.properties = (const struct property_entry[]) {
+		PROPERTY_ENTRY_U32("linux,code", BTN_1),
+		PROPERTY_ENTRY_GPIO("gpios", &pfc_gpiochip_node,
+				    GPIO_PB1, GPIO_ACTIVE_LOW),
+		PROPERTY_ENTRY_STRING("label", "SW2"),
+		{ }
 	},
 };
 
-static struct platform_device *rsk7203_devices[] __initdata = {
-	&smsc911x_device,
-	&led_device,
-	&keys_device,
+static const struct software_node rsk7203_sw3_key_node = {
+	.parent = &rsk7203_gpio_keys_node,
+	.properties = (const struct property_entry[]) {
+		PROPERTY_ENTRY_U32("linux,code", BTN_2),
+		PROPERTY_ENTRY_GPIO("gpios", &pfc_gpiochip_node,
+				    GPIO_PB2, GPIO_ACTIVE_LOW),
+		PROPERTY_ENTRY_STRING("label", "SW3"),
+		{ }
+	},
+};
+
+static const struct software_node * const rsk7203_swnodes[] __initconst = {
+	&rsk7203_gpio_leds_node,
+	&rsk7203_green_led_node,
+	&rsk7203_orange_led_node,
+	&rsk7203_red1_led_node,
+	&rsk7203_red2_led_node,
+	&rsk7203_gpio_keys_node,
+	&rsk7203_sw1_key_node,
+	&rsk7203_sw2_key_node,
+	&rsk7203_sw3_key_node,
+	NULL
+};
+
+static const struct platform_device_info rsk7203_devices[] __initconst = {
+	{
+		.name		= "smsc911x",
+		.id		= PLATFORM_DEVID_NONE,
+		.res		= smsc911x_resources,
+		.num_res	= ARRAY_SIZE(smsc911x_resources),
+		.data		= &smsc911x_config,
+		.size_data	= sizeof(smsc911x_config),
+	},
+	{
+		.name		= "leds-gpio",
+		.id		= PLATFORM_DEVID_NONE,
+		.swnode		= &rsk7203_gpio_leds_node,
+	},
+	{
+		.name		= "gpio-keys-polled",
+		.id		= PLATFORM_DEVID_NONE,
+		.swnode		= &rsk7203_gpio_keys_node,
+	},
 };
 
 static int __init rsk7203_devices_setup(void)
 {
+	struct platform_device *pd;
+	int error;
+	int i;
+
 	/* Select pins for SCIF0 */
 	gpio_request(GPIO_FN_TXD0, NULL);
 	gpio_request(GPIO_FN_RXD0, NULL);
@@ -131,7 +179,22 @@ static int __init rsk7203_devices_setup(void)
 	__raw_writel(0x36db0400, 0xfffc0008); /* CS1BCR */
 	gpio_request(GPIO_FN_IRQ0_PB, NULL);
 
-	return platform_add_devices(rsk7203_devices,
-				    ARRAY_SIZE(rsk7203_devices));
+	error = software_node_register_node_group(rsk7203_swnodes);
+	if (error) {
+		pr_err("failed to register software nodes: %d\n", error);
+		return error;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(rsk7203_devices); i++) {
+		pd = platform_device_register_full(&rsk7203_devices[i]);
+		error = PTR_ERR_OR_ZERO(pd);
+		if (error) {
+			pr_err("failed to create platform device %s: %d\n",
+			       rsk7203_devices[i].name, error);
+			return error;
+		}
+	}
+
+	return 0;
 }
 device_initcall(rsk7203_devices_setup);

-- 
2.54.0.669.g59709faab0-goog


