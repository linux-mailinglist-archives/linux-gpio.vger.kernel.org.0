Return-Path: <linux-gpio+bounces-39550-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Es4hDhhvTGrokQEAu9opvQ
	(envelope-from <linux-gpio+bounces-39550-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 05:14:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 543F2716F80
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 05:14:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=p84IeR1l;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39550-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39550-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7FBE2300F78E
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 03:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1273397699;
	Tue,  7 Jul 2026 03:14:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D1E3093DB
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 03:14:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783394050; cv=none; b=AqEM4IjnTGx22NUrMeVFOyP//CkdqHlgREJ8f02+wXVCl3Lr5s3TfWUSLqidCT+Iw+ug9ExDu8oDlw3MvY1TZKKJzB3o7M+D+wpkE687ugkRdrVOruzLAAFfKRNXIXygmNwER5rq5DCEAllzXfZkgktsiAIHRWwiLQ6wU+OTvE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783394050; c=relaxed/simple;
	bh=htYOVpebTX0RCUzuTTIdoToW26XugbTANpRTT0kaVWw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nGqMsuuM6IECbqwNxIqo+lJm5XBoO0w3k0gTCtdb/ok+05tmJpFn+m6G8IuKhosoTNPofOM4qe1TSpQBIoPvaKLGrwFpU6jjiPGg+XMYi3lN8U7fFaQAaaJENSebmFfw5kVdvjNTYUy4NGGQllt99NZ9j8O/rzpznyOHGiHI8xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p84IeR1l; arc=none smtp.client-ip=209.85.214.177
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cad8076b01so47166955ad.2
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 20:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783394048; x=1783998848; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oYtf60a9vKyBgN3UPVLnsPxCyGwr8zfAeFMSG9lOvrg=;
        b=p84IeR1loawgqr3v68xt2UPQllosu+JW8uBNSO8N4zdoOTS/A5OFiUEcVX6e7+3ltL
         KQAQt0Edf+jpqp4VBLdQ/+MIkvvhKtUF1eoz29OJarW0U5kiVYL1jK7lL7MSwTRWcz8D
         WIAd8h7QVn1yxzIr+cx0DjQtUOKss6yE3Y3oVX3UscWox4WrsdB++jVNLFIB5SsumfMj
         yyJvO2ilsxcTwku8srnWPh/7y07w3DnsCziM6QQQRwx//0oFSFMZzl6Y0ZAJofwQeTQ/
         AxBPJznYkKNpjcnqq44AZ4NOXIOlSoSORPxLBYD9qY+ZI5Fhogxfe9Md74E27Ujy0t+B
         XeHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783394048; x=1783998848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oYtf60a9vKyBgN3UPVLnsPxCyGwr8zfAeFMSG9lOvrg=;
        b=su6qCkBPA0jrKMyFnxcvjbg8tSCitH2PNVcSFAhgdfccUphxu9TbNb0z4JF0DjeR39
         YFABw1rc4YRfgCPEn6gBVEObSbpy5myW9Wg9emYKyBQH2xChu1S0tPqn7JMOjUHR8QGE
         RLpJcV3s1blBVfss/gKZ51+rcXWZNh5NyDiyWVFTyBCXv7Dyd4BRWzaUG1LGBI3GCtS0
         QjW7gnpfzkIKTTz99gwMnF+BjmAaeNqm8jCgw5Xu9iiHUw8TtcLGGXdui+lLMbixrv9b
         dA6fR9XQmpPj24Z/HRuoGUTljnbpP42NGjfticvCr49yJ8CcuecODp99X9j3YF53MsD9
         1yEg==
X-Forwarded-Encrypted: i=1; AHgh+RpuMYycvm274mpWabf6xYpah99tKpexbLbK4ugw1Ieu6k6e4v5zf4jQFr79O77kmQtVOAYFU+H1D5ab@vger.kernel.org
X-Gm-Message-State: AOJu0YxegBaqmnbSktquLUOm1nYTKQRIhy+Su+uDgBwLGfB4RsDb92lh
	+fFM1a6MypK/YgNY2oYsIcFvrnUbYrJEtOFgzSvdRZQqtdl0o/SaQM07
X-Gm-Gg: AfdE7clTyEA4UymxNbGW1Ep1gXL75pDtaWNUP0bJupVLc1YsPAT8EzSX/xK/M5akz/t
	3aQd7piRv6jobdQEnZHZe2+3oZbC0t5kcclpGNRHO5euyYRnx9sKaqYnKehZiWuTTYrX9AIAFVM
	J4DTC7BKrLtiVcxNer+nnw93XfilHVsYTMOPr59XaGODn5kygydaBGuQuGDB0F17YsQMhGFn2SC
	9RXei/9Xlb6/7p/0scr9Snpys4Iid5in1Bn+hZzAfFvZvIbCxtRSukL1JtABJiavZz07FVF7vM5
	6ZNBv3kXTBs6WWf8+HW8946zsIahL2lkaXgKRU8qZCtJsUA9O8ZG9pH/xjC30v1h+1kpt3HQsMo
	E9i8tZCr4TwyNP219GeewrHutXj1hp0rQeajMdwIf1NnAM7gfxA1W/8xJtl7FGoD2el3OOOu9iC
	5KZlgC9Rnxd4PXZxntoWvhyCyA5zpxFo62P//Lkmf3cXU00LWrmY+fYg7A2kI6gaT2VLLzyBl8H
	ZU4
X-Received: by 2002:a05:6a20:1615:b0:3bf:6c05:ad with SMTP id adf61e73a8af0-3c08f020a10mr4089430637.60.1783394048343;
        Mon, 06 Jul 2026 20:14:08 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d89b:1fdd:a8f2:dbeb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659666e7sm3339905c88.7.2026.07.06.20.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 20:14:07 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 06 Jul 2026 20:14:01 -0700
Subject: [PATCH 2/4] ARM: sa1100: assabet: convert gpio-keys to use
 software nodes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-sa1100-swnode-v1-2-332759bbd930@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39550-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 543F2716F80

Convert the legacy gpio-keys platform device on the StrongARM SA-1100
Assabet evaluation board to use software nodes and device properties.
This allows describing the buttons and their GPIO bindings via software
nodes so that platform data support can eventually be removed from the
gpio-keys driver.

Define static software nodes for the gpio-keys device and the two button
child nodes at file scope, referencing the SA-1100 GPIO controller node
directly. In assabet_init(), register the software node group and use
platform_device_register_full() to register the gpio-keys device.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-sa1100/assabet.c | 75 ++++++++++++++++++++++++++++--------------
 1 file changed, 50 insertions(+), 25 deletions(-)

diff --git a/arch/arm/mach-sa1100/assabet.c b/arch/arm/mach-sa1100/assabet.c
index 2b833aa0212b..b001f0b6a3fa 100644
--- a/arch/arm/mach-sa1100/assabet.c
+++ b/arch/arm/mach-sa1100/assabet.c
@@ -13,8 +13,10 @@
 #include <linux/gpio/driver.h>
 #include <linux/gpio/gpio-reg.h>
 #include <linux/gpio/machine.h>
-#include <linux/gpio_keys.h>
+#include <linux/gpio/property.h>
+#include <linux/input.h>
 #include <linux/ioport.h>
+#include <linux/property.h>
 #include <linux/platform_data/sa11x0-serial.h>
 #include <linux/regulator/fixed.h>
 #include <linux/regulator/machine.h>
@@ -467,28 +469,53 @@ static const struct gpio_led_platform_data assabet_leds_pdata __initconst = {
 	.leds = assabet_leds,
 };
 
-static struct gpio_keys_button assabet_keys_buttons[] = {
-	{
-		.gpio = 0,
-		.irq = IRQ_GPIO0,
-		.desc = "gpio0",
-		.wakeup = 1,
-		.can_disable = 1,
-		.debounce_interval = 5,
-	}, {
-		.gpio = 1,
-		.irq = IRQ_GPIO1,
-		.desc = "gpio1",
-		.wakeup = 1,
-		.can_disable = 1,
-		.debounce_interval = 5,
-	},
+static const struct software_node assabet_gpio_keys_node = {
+	.name = "assabet-gpio-keys",
+};
+
+static const struct property_entry assabet_key0_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_RESERVED),
+	PROPERTY_ENTRY_GPIO("gpios", &sa1100_gpiochip_node,
+			    0, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_STRING("label", "gpio0"),
+	PROPERTY_ENTRY_BOOL("wakeup-source"),
+	PROPERTY_ENTRY_BOOL("linux,can-disable"),
+	PROPERTY_ENTRY_U32("debounce-interval", 5),
+	{ }
+};
+
+static const struct software_node assabet_key0_node = {
+	.parent = &assabet_gpio_keys_node,
+	.properties = assabet_key0_props,
+};
+
+static const struct property_entry assabet_key1_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_RESERVED),
+	PROPERTY_ENTRY_GPIO("gpios", &sa1100_gpiochip_node,
+			    1, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_STRING("label", "gpio1"),
+	PROPERTY_ENTRY_BOOL("wakeup-source"),
+	PROPERTY_ENTRY_BOOL("linux,can-disable"),
+	PROPERTY_ENTRY_U32("debounce-interval", 5),
+	{ }
+};
+
+static const struct software_node assabet_key1_node = {
+	.parent = &assabet_gpio_keys_node,
+	.properties = assabet_key1_props,
+};
+
+static const struct software_node * const assabet_gpio_keys_swnodes[] __initconst = {
+	&assabet_gpio_keys_node,
+	&assabet_key0_node,
+	&assabet_key1_node,
+	NULL
 };
 
-static const struct gpio_keys_platform_data assabet_keys_pdata = {
-	.buttons = assabet_keys_buttons,
-	.nbuttons = ARRAY_SIZE(assabet_keys_buttons),
-	.rep = 0,
+static const struct platform_device_info assabet_gpio_keys_dev_info __initconst = {
+	.name = "gpio-keys",
+	.id = PLATFORM_DEVID_NONE,
+	.swnode = &assabet_gpio_keys_node,
 };
 
 static struct gpiod_lookup_table assabet_uart1_gpio_table = {
@@ -571,10 +598,8 @@ static void __init assabet_init(void)
 
 	}
 
-	platform_device_register_resndata(NULL, "gpio-keys", 0,
-					  NULL, 0,
-					  &assabet_keys_pdata,
-					  sizeof(assabet_keys_pdata));
+	software_node_register_node_group(assabet_gpio_keys_swnodes);
+	platform_device_register_full(&assabet_gpio_keys_dev_info);
 
 	gpiod_add_lookup_table(&assabet_leds_gpio_table);
 	gpio_led_register_device(-1, &assabet_leds_pdata);

-- 
2.55.0.rc2.803.g1fd1e6609c-goog


