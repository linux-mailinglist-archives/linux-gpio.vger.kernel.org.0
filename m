Return-Path: <linux-gpio+bounces-39552-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8OvoBk1vTGrzkQEAu9opvQ
	(envelope-from <linux-gpio+bounces-39552-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 05:15:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA4C716F96
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 05:15:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=V7bw4VLm;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39552-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39552-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 812D9303CC5E
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 03:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 860103859DF;
	Tue,  7 Jul 2026 03:14:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0337E3812C8
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 03:14:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783394053; cv=none; b=mo1W3IWwrN4m+0gJsiLm2rVYrcW8RRnUboVmV4AZsjEfJVn6yQ+QbBtYgHHSOcFtvAZxXqDeE09RyNEzZxNu7ZOXEGAJiUc6xVTDk9FLVqr6oPSJlCgcuZ4f7ikgJZtKENFcwHoaA6qLdPawXwOknnfafse6rJANS5woL5Jdmgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783394053; c=relaxed/simple;
	bh=5Jp8jeF+SrREW3hN60FmP3Iai5PVrGN+vsevf9e3tvA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sPp22CsRi/ChtByPtijOJQ07cc9XfE8Bm80tMbAkJviu1TP6f7VMnmq38E+eiwunRmRDw40bhzVzmttENvYZ2qMf8UTDxY//xBZt2LgkbsrcYobhuekVgWd63ZTadsAnWZq7m6Q3b06f58lZIE/w/pq36p78U2MsKaGUyfDFSCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V7bw4VLm; arc=none smtp.client-ip=209.85.210.169
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8481fb4324aso931562b3a.2
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 20:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783394051; x=1783998851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MMrqUfMvT5vpakCL5ikkaGZV0QE+15QhOUc7fLT1f/Q=;
        b=V7bw4VLmHs2aeobDjIEbW21HMiIkvJ/Nn2Y4n6eR7jE7k2AV4eqPi9ZU8YsDs4OGsU
         J+oC+dwUsmGcPHMp0esE59elnfkBqIpxyvrwfbFplQN+9F2wguy5+Ro4R+mRGOjB5c7y
         R301KQnD1pIoWsrhVGkaMVe5eJBew5y9hg3X46BSCLDKGu4CnUpop3QCChi1mz0bEYEb
         i25CYY9IQhVNAGX8e0jiPRZC89HraEJ+61/cGubM0hSAIe6p38pjDcrJPWTEp2ohXgQz
         8iZAst8kv3MYv1lVrOTHj7XDxTZGGRXMoemKAph3NHd6ql6BTWuNMAUfAaRno2ZB0Z9A
         Vf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783394051; x=1783998851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MMrqUfMvT5vpakCL5ikkaGZV0QE+15QhOUc7fLT1f/Q=;
        b=CtpF+Je06ehJvd18RzMbrKcS2PMgUsBcnOofmBshElA7xK0k3nmNELXgdvFOkyrWZo
         8dt8b34is/dbFSCAC3/L68fwFlqIF62VjrFbT3TII0e4BGgaRRzImTRLYsVzivoQqGwS
         k1M9Nux3+OLUbnzk8/sdw/q3v9extcfyDGa86q0RmBEVVtLWWkGIXDwIR0son0l3cdEx
         LKM6yzSRXRbiuTVg3HDNvnAhlAcbu2wdNfS4lFmyfOPlZECZyaAni36QXaIAV7B85mOh
         D6Rucrodw8LHBAW4QwiANArbHjVW68oWH40GIawxeWYFcPgTi3M4u0JP4ogBnbyaP+CO
         vHog==
X-Forwarded-Encrypted: i=1; AHgh+RpbRYxkCuZK5YZLlIohSjstH60XIYSrN12T1eDALHyzZa0eccy3akMz+0rqkwljDEqXFBtB0C/Uo5Qb@vger.kernel.org
X-Gm-Message-State: AOJu0YwjuWA1NwBUiec9jXRlmrtsQ/Ea7fjFq/KCEYMbMhLeAQtU5ulz
	fgjskaMMzZJ2LXqL65bm821S4CtXwYOZZuIN+3u01dIx7rSFqk34vYLv
X-Gm-Gg: AfdE7clv5J7EV1xuk7tyiVVduXF8rAlNxNXHVrZrPcLpHx6LiRntlufUIcf9WjHY71d
	76Vm6vjjLAjI5AgTsLLHg66FCrpTXm32anV2JqDahtAvm3AYIn304xn7PVaHH3ECwSGgFnzBlBb
	fGHu4BI0C0haRn1FpRwrNDgC/9B8L8VlhYY8mHAJnRKUeZhS/bF8ys8J9QvlExSYaQ3JRIo917k
	tdmiD1DDCCMZrZoedCIm0EHvh6oafcyavFxO2HzIEZsLWTx8DBXpXy09uG3cmpK5w0eY3xwcPze
	23FfxfuDkjEnFDpqmVw77s+m5bWGJhtqUfvo52xMAy0udnZt9IQASfWy6klnKdE9CQMrYKnlhaa
	WbM3f/VMKuwiJ5laCnVcjD+1h/grAQjlrFi+9tcHOw1cvdR4+V+ALTud8yyhp8bmF2lI6zdvgmI
	OeBcJf9oCQI0XwNbYJF8ndt5DBXv1wUD7wqMltgvHzIHjXHRvjkgGhaE0M+sXK4GIIQiW6uovKi
	K8/
X-Received: by 2002:a05:6a21:6b05:b0:38d:fad1:cf2a with SMTP id adf61e73a8af0-3c08ed0adfcmr3907819637.13.1783394051311;
        Mon, 06 Jul 2026 20:14:11 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d89b:1fdd:a8f2:dbeb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659666e7sm3339905c88.7.2026.07.06.20.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 20:14:10 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 06 Jul 2026 20:14:03 -0700
Subject: [PATCH 4/4] ARM: sa1100: h3xxx: convert gpio-keys to use software
 nodes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-sa1100-swnode-v1-4-332759bbd930@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-39552-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: 7CA4C716F96

Convert the legacy gpio-keys platform device on the StrongARM SA-1100
HP iPAQ H3xxx series boards to use software nodes and device properties.
This helps progress the removal of platform data support from the
gpio-keys driver.

Define static software nodes for the gpio-keys device and the power and
action button child nodes at file scope, referencing the SA-1100 GPIO
controller node directly. In h3xxx_mach_init(), register the software node
group and use platform_device_register_full() to register the device.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-sa1100/h3xxx.c | 69 +++++++++++++++++++++++++++-----------------
 1 file changed, 42 insertions(+), 27 deletions(-)

diff --git a/arch/arm/mach-sa1100/h3xxx.c b/arch/arm/mach-sa1100/h3xxx.c
index d685f03f51f3..13c0aa4c0bfa 100644
--- a/arch/arm/mach-sa1100/h3xxx.c
+++ b/arch/arm/mach-sa1100/h3xxx.c
@@ -8,9 +8,10 @@
 
 #include <linux/kernel.h>
 #include <linux/gpio/machine.h>
+#include <linux/gpio/property.h>
 #include <linux/gpio.h>
-#include <linux/gpio_keys.h>
 #include <linux/input.h>
+#include <linux/property.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 #include <linux/platform_data/gpio-htc-egpio.h>
@@ -168,35 +169,48 @@ static struct platform_device h3xxx_egpio = {
  * GPIO keys
  */
 
-static struct gpio_keys_button h3xxx_button_table[] = {
-	{
-		.code		= KEY_POWER,
-		.gpio		= H3XXX_GPIO_PWR_BUTTON,
-		.desc		= "Power Button",
-		.active_low	= 1,
-		.type		= EV_KEY,
-		.wakeup		= 1,
-	}, {
-		.code		= KEY_ENTER,
-		.gpio		= H3XXX_GPIO_ACTION_BUTTON,
-		.active_low	= 1,
-		.desc		= "Action button",
-		.type		= EV_KEY,
-		.wakeup		= 0,
-	},
+static const struct software_node h3xxx_gpio_keys_node = {
+	.name = "h3xxx-gpio-keys",
 };
 
-static struct gpio_keys_platform_data h3xxx_keys_data = {
-	.buttons  = h3xxx_button_table,
-	.nbuttons = ARRAY_SIZE(h3xxx_button_table),
+static const struct property_entry h3xxx_power_key_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_POWER),
+	PROPERTY_ENTRY_GPIO("gpios", &sa1100_gpiochip_node,
+			    H3XXX_GPIO_PWR_BUTTON, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_STRING("label", "Power Button"),
+	PROPERTY_ENTRY_BOOL("wakeup-source"),
+	{ }
 };
 
-static struct platform_device h3xxx_keys = {
-	.name	= "gpio-keys",
-	.id	= -1,
-	.dev	= {
-		.platform_data = &h3xxx_keys_data,
-	},
+static const struct software_node h3xxx_power_key_node = {
+	.parent = &h3xxx_gpio_keys_node,
+	.properties = h3xxx_power_key_props,
+};
+
+static const struct property_entry h3xxx_action_key_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_ENTER),
+	PROPERTY_ENTRY_GPIO("gpios", &sa1100_gpiochip_node,
+			    H3XXX_GPIO_ACTION_BUTTON, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_STRING("label", "Action button"),
+	{ }
+};
+
+static const struct software_node h3xxx_action_key_node = {
+	.parent = &h3xxx_gpio_keys_node,
+	.properties = h3xxx_action_key_props,
+};
+
+static const struct software_node * const h3xxx_gpio_keys_swnodes[] __initconst = {
+	&h3xxx_gpio_keys_node,
+	&h3xxx_power_key_node,
+	&h3xxx_action_key_node,
+	NULL
+};
+
+static const struct platform_device_info h3xxx_gpio_keys_dev_info __initconst = {
+	.name = "gpio-keys",
+	.id = PLATFORM_DEVID_NONE,
+	.swnode = &h3xxx_gpio_keys_node,
 };
 
 static struct resource h3xxx_micro_resources[] = {
@@ -214,7 +228,6 @@ struct platform_device h3xxx_micro_asic = {
 
 static struct platform_device *h3xxx_devices[] = {
 	&h3xxx_egpio,
-	&h3xxx_keys,
 	&h3xxx_micro_asic,
 };
 
@@ -240,6 +253,8 @@ void __init h3xxx_mach_init(void)
 	sa1100_register_uart_fns(&h3xxx_port_fns);
 	sa11x0_register_mtd(&h3xxx_flash_data, &h3xxx_flash_resource, 1);
 	platform_add_devices(h3xxx_devices, ARRAY_SIZE(h3xxx_devices));
+	software_node_register_node_group(h3xxx_gpio_keys_swnodes);
+	platform_device_register_full(&h3xxx_gpio_keys_dev_info);
 }
 
 static struct map_desc h3600_io_desc[] __initdata = {

-- 
2.55.0.rc2.803.g1fd1e6609c-goog


