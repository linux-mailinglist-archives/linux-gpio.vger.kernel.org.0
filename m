Return-Path: <linux-gpio+bounces-39551-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id W0juHD5vTGrykQEAu9opvQ
	(envelope-from <linux-gpio+bounces-39551-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 05:15:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFD3716F92
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 05:15:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=AE5PEFfx;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39551-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39551-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 24C8E3039F52
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 03:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78CDF39E194;
	Tue,  7 Jul 2026 03:14:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC837398902
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 03:14:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783394052; cv=none; b=djG+WnuV5OKzaz84w22ThrxkUtqidux8j/zyAiOEYQBh7u/NFL14sungO4jWvdAIzp38DUGnBEVFqwZwHtFvbvrqvbr56ZpH7oAwetS+abz9GIIsm286CFIIih8cRnJsHDL5eNYQeGB78tZT/7E464PIFU4SC1fIujcU0WHuKlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783394052; c=relaxed/simple;
	bh=nmnbvZ4nrQF/XALe3TNYVildY/MYZkjzLTs27GDLksU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sO/gky2FFfX3mEn87YeDvlLifq3QSmSnimPvGdN+/e7ICapSAf4DkKvT9BTWxENUO8DAGCmKVEsmfIfbM0qZ6Ur1Yc7JggukultlasFoFm9vwtGN1S08Vpd19RUDPLLhH0QqO1WeSFqODBmB+rsQEC98xA6hqlc+bp7Vwy81vto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AE5PEFfx; arc=none smtp.client-ip=209.85.214.176
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso22055025ad.2
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 20:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783394050; x=1783998850; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lQ2OUfXyXPiXVwMUZqWdZ7fztGiD1A5bWtr7SaHjq24=;
        b=AE5PEFfx43IbFO5Ddkr1dN8E7/nV7FBwm0VX6RFasPaj+aboUo4WN1y7bKER4Y2Xst
         ybculaSq+cl4vbEGpN2I5viAT+Sp1Y8IzpX+S/PIGtofZhW281Kcc2LglQ6wqsZr3vV2
         eMG41szIxXKFxrzM84GDINOIZpclrrZuRtd8M9O1Te2xVWUjNexFDWMth0tvrSYpNeMg
         hHOgGPClQwa2WyZdmTxKoSaJirtMizJZnN4yNwQNg1Gb/Y4Z/Ue7R8MJFWfOwK0e2N0x
         f6ds2B74mGXbugTiAE7SwkitChQf3/XrDzuNZ/+zu5fSGBHFGmziWgJsRlPlMYBtyY+3
         R4aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783394050; x=1783998850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lQ2OUfXyXPiXVwMUZqWdZ7fztGiD1A5bWtr7SaHjq24=;
        b=HrYZsNvFqvI/3HtaUVHyMiHiI34MrN/cXyy4zU+gTl08kQnSzv0UMMxan99D4HAZGG
         3m2zWu14Rfrc6Tf4LM9g4dMi9BrY0HN4FzEjCvSNpM4xaVuW0pRYrYZ17VoayRSXdGFg
         3tez25NwGT7cvijJbIsM73BRW8b93fBJceTbH3zEK1mCEPjO2sIMxNCoWV244P8g83uY
         OcBAndYrdUKexQdzRV4IF55E4/tUREB+474HOUqXKCLZ/cj8BI+kX2VqLWNs0K/+aBas
         GFOngo59rsr2K93PyUiqQICM+ryshUJMVtvgG+TMiIa5tkagdm2Hw0KyBd62SAAYMBs3
         KecQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr/tG2gXE2hmjMSMg91KV28e0pyRb3u3VF2JjECDDC2VnqVSM7Ig5JFZisIuMm2P4ydBPwh1Dub/hYl@vger.kernel.org
X-Gm-Message-State: AOJu0YzGkpeyQBkXNfghfB0ue5Z1tqqwNNlaT7QNT0xybBpKdwIluyQQ
	etzwPUNB7RfYnWC0iH1aMzDUAcQsgq7DT1/DGEZUGet2rd7UtFtIhnP3
X-Gm-Gg: AfdE7clBWh6qd7HgAa7CUH8at0rTIau7wbq01H6O48yZtnY5Oh6AMmKvAnXLJ38vIYP
	rr/5c9rTgCOzMvhPZcsBdKHg/7ai0Z2/J0nSDezGkfCIQsK+gxgYsckrZDFqEGajkQKUPyeFvyz
	VaGNsyobOLQplrdFdQ3vsHdV/Y5F8PFUxrRxwdhdUZUwKz+oR6IEWa2OjJFm2x8jaE1i/E4PxbS
	YE7jWCKggfRoJt8ZEOahi0FfzLrAJBInZ7RhsUR0mdUqHwYUhtcHgFAp1bGrmQJxKMEknW571Kh
	xI0xeymxSulCyEU0hVmlJ5++y0Q8quNgrM3VhBa0su/0gjq480brsz9kUSXyf/TIvi8IyUJNt1W
	8Mu4ymGTC2MAJGDLhcInAMmuKHz2YC+OiV6J6NYcUzHhYSrgswmM3rMJTyRdzGzrRMQEuuPYvNw
	1YFUXNBAijW0RkzVvUEI+0+kSkvKHC1powMX2sCmaJ9X6NyfdHVWp8ti1LS6voI97NuBKXm+cHj
	PU9f835VtWXv3Q=
X-Received: by 2002:a05:6a20:5499:b0:3bf:9e25:1a18 with SMTP id adf61e73a8af0-3c08ef55ba0mr4090827637.52.1783394049834;
        Mon, 06 Jul 2026 20:14:09 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d89b:1fdd:a8f2:dbeb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659666e7sm3339905c88.7.2026.07.06.20.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 20:14:09 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 06 Jul 2026 20:14:02 -0700
Subject: [PATCH 3/4] ARM: sa1100: collie: convert gpio-keys to use software
 nodes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-sa1100-swnode-v1-3-332759bbd930@gmail.com>
References: <20260706-sa1100-swnode-v1-0-332759bbd930@gmail.com>
In-Reply-To: <20260706-sa1100-swnode-v1-0-332759bbd930@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 soc@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16-dev-b242f
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39551-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@arndb.de,m:linux@armlinux.org.uk,m:linusw@kernel.org,m:brgl@kernel.org,m:soc@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DBFD3716F92

Convert the legacy gpio-keys platform device on the StrongARM SA-1100
Collie (Sharp Zaurus SL-5500) board to use software nodes and device
properties. This helps progress the removal of platform data support
from the gpio-keys driver.

Define static software nodes for the gpio-keys device and the power and
sync button child nodes at file scope, referencing the SA-1100 GPIO
controller node directly and specifying EV_PWR input type. In
collie_init(), register the software node group and use
platform_device_register_full() to register the gpio-keys device.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-sa1100/collie.c | 74 +++++++++++++++++++++++++++----------------
 1 file changed, 46 insertions(+), 28 deletions(-)

diff --git a/arch/arm/mach-sa1100/collie.c b/arch/arm/mach-sa1100/collie.c
index 466d755d5702..53df6eb9ce83 100644
--- a/arch/arm/mach-sa1100/collie.c
+++ b/arch/arm/mach-sa1100/collie.c
@@ -27,10 +27,11 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 #include <linux/timer.h>
-#include <linux/gpio_keys.h>
+#include <linux/gpio/property.h>
 #include <linux/input.h>
 #include <linux/gpio.h>
 #include <linux/gpio/machine.h>
+#include <linux/property.h>
 #include <linux/power/gpio-charger.h>
 
 #include <video/sa1100fb.h>
@@ -228,43 +229,57 @@ struct platform_device collie_locomo_device = {
 	.resource	= locomo_resources,
 };
 
-static struct gpio_keys_button collie_gpio_keys[] = {
-	{
-		.type	= EV_PWR,
-		.code	= KEY_RESERVED,
-		.gpio	= COLLIE_GPIO_ON_KEY,
-		.desc	= "On key",
-		.wakeup	= 1,
-		.active_low = 1,
-	},
-	{
-		.type	= EV_PWR,
-		.code	= KEY_WAKEUP,
-		.gpio	= COLLIE_GPIO_WAKEUP,
-		.desc	= "Sync",
-		.wakeup = 1,
-		.active_low = 1,
-	},
+static const struct software_node collie_gpio_keys_node = {
+	.name = "collie-gpio-keys",
 };
 
-static struct gpio_keys_platform_data collie_gpio_keys_data = {
-	.buttons	= collie_gpio_keys,
-	.nbuttons	= ARRAY_SIZE(collie_gpio_keys),
+static const struct property_entry collie_on_key_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_RESERVED),
+	PROPERTY_ENTRY_GPIO("gpios", &sa1100_gpiochip_node,
+			    COLLIE_GPIO_ON_KEY, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_STRING("label", "On key"),
+	PROPERTY_ENTRY_U32("linux,input-type", EV_PWR),
+	PROPERTY_ENTRY_BOOL("wakeup-source"),
+	{ }
 };
 
-static struct platform_device collie_gpio_keys_device = {
-	.name	= "gpio-keys",
-	.id	= -1,
-	.dev	= {
-		.platform_data = &collie_gpio_keys_data,
-	},
+static const struct software_node collie_on_key_node = {
+	.parent = &collie_gpio_keys_node,
+	.properties = collie_on_key_props,
+};
+
+static const struct property_entry collie_wakeup_key_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_WAKEUP),
+	PROPERTY_ENTRY_GPIO("gpios", &sa1100_gpiochip_node,
+			    COLLIE_GPIO_WAKEUP, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_STRING("label", "Sync"),
+	PROPERTY_ENTRY_U32("linux,input-type", EV_PWR),
+	PROPERTY_ENTRY_BOOL("wakeup-source"),
+	{ }
+};
+
+static const struct software_node collie_wakeup_key_node = {
+	.parent = &collie_gpio_keys_node,
+	.properties = collie_wakeup_key_props,
+};
+
+static const struct software_node * const collie_gpio_keys_swnodes[] __initconst = {
+	&collie_gpio_keys_node,
+	&collie_on_key_node,
+	&collie_wakeup_key_node,
+	NULL
+};
+
+static const struct platform_device_info collie_gpio_keys_dev_info __initconst = {
+	.name = "gpio-keys",
+	.id = PLATFORM_DEVID_NONE,
+	.swnode = &collie_gpio_keys_node,
 };
 
 static struct platform_device *devices[] __initdata = {
 	&collie_locomo_device,
 	&colliescoop_device,
 	&collie_power_device,
-	&collie_gpio_keys_device,
 };
 
 static struct mtd_partition collie_partitions[] = {
@@ -384,6 +399,9 @@ static void __init collie_init(void)
 		printk(KERN_WARNING "collie: Unable to register LoCoMo device\n");
 	}
 
+	software_node_register_node_group(collie_gpio_keys_swnodes);
+	platform_device_register_full(&collie_gpio_keys_dev_info);
+
 	sa11x0_register_lcd(&collie_lcd_info);
 	sa11x0_register_mtd(&collie_flash_data, collie_flash_resources,
 			    ARRAY_SIZE(collie_flash_resources));

-- 
2.55.0.rc2.803.g1fd1e6609c-goog


