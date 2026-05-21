Return-Path: <linux-gpio+bounces-37242-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KA7EFLyUDmqtAQYAu9opvQ
	(envelope-from <linux-gpio+bounces-37242-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 07:14:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF2259EF81
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 07:14:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9398C3067FBA
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 05:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBBAD335BA8;
	Thu, 21 May 2026 05:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gqgccGcL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0256A339844
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 05:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779340432; cv=none; b=JOb5UDpTmhrmGOCpp9I9goW6nZcf3Gv3UWHEEWvjr8rWJC4Px93dzDnZZI2uZuYYvIUuHGFW/STYXjvRiMzBOjaL5t9mS8QCdGvlfRgVE/09W5Vh58sX/27bAAaC0PP2FsMXd8uonotoSiVbhRadJPLewBv8VbWYjRb4K7+ZrsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779340432; c=relaxed/simple;
	bh=84IYOUDRqLdOZnUza+I5M9XOglV9RpLSILXCdsenQOo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rT08Qow5/mGZOkGFbLgFlF4R8CSi/me9sI5nrJtKAXhFfPl75O5XMNuxsFsWbpWt1Wp9SWp4QAShkE9ZcIVZAUSaV1tdEjTYJCZJJ/WtSLFfT9IADdfID+iwhqHdmvD+Tf0m0igPah/okCW3sLCnTHKzxFyt6X+6P9PxFSg2SLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gqgccGcL; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1309f4ee97fso6577793c88.1
        for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 22:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779340428; x=1779945228; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dC01VeKjcCopxQgK4IvKVGSUYqXlRoKtYIJqUaE3G8s=;
        b=gqgccGcL7ikNdfUlba6O0OKe01h8wGXTVdhJwTJjWMeGH+B/tPkwxhkSSNjmbONHn8
         kG9VeCsGByrR0XeiCjydp+FaObjJbw1b4BHhbrrxHHlrN3cGrwYPCi8f2EA1Bl7WUzzL
         zHsCl6wMaAPHfHo/72B8i/Ia1VuLkfiuWoD22WMwrI0lhkGCtFnQ86uJ7hg28Xzs2ZDn
         X7WOiM4aWQg+ztNGr7t01adly3kMGAGAlPvkUNphStKMq1RCnGBCWKZ71vtmtHyunPes
         NSARwOfNTRxzmKH/EpRlufEPXTXYHNXN6QiQJ0XQW+uwZVoCpn+J87xs4XwOZMQZNtH1
         KbJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779340428; x=1779945228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dC01VeKjcCopxQgK4IvKVGSUYqXlRoKtYIJqUaE3G8s=;
        b=JXobI1dvQ/4wfAfqYsnT4jMmwSxyZV9QsqkNsQfVDalFqoEd1HvQgFudmAvAgIkHC+
         7mPDq68oNbjrWxHKJnDGi0mZuIpTCse4DKZI/XodkfU8Yu9PIM8LUZh4vjlmkCPxdm5Z
         JWu25kq9say/go/cuW/Dx/H4nnaWI7azBYYpCjbigXt5dU9zHiVFI1FzJkfg+mpQZR3Q
         iBKJJ3LvR5+qpxyKLzDcNK26dJjLK1cUYbbUZ+B8/sJFOhS7SvWkjL4xtXcyDp3fT3b8
         aMmE3zVhDkNxEadBJZ4KcLOdxvVUZfzlVbmq81/GBmqyOEDi2x5Ch8wq4GoBdR+9JTJs
         Sukw==
X-Forwarded-Encrypted: i=1; AFNElJ9nL6nGT0JoqO7JDvhtksjGIQmjp2ZV8X+DNoSTjktWm+e9v2n7xkqIq8V0MLi2ODdsN1NU4lyM803Z@vger.kernel.org
X-Gm-Message-State: AOJu0YyraUQ61QNoGczVg/lXr2ejrMepJcN6isyuKDF+3vY1v81HgwSF
	GjpucNNPZ0qYEH6j2CskwT29flTRL/q61nRufmGrpzycfLNkrGbc5bmE5mr1yA==
X-Gm-Gg: Acq92OGVIXDqF43cXwMzNxkrHLPOo0HMN5jqozUf8L2ZY54BiDlT4suVvOzb4Qyq1QO
	c8TqpQmpLNRnKHin9hZ2zamxJcSl/kYqSLvrrHKcaxlgWGUexdcIi0s2SIrbHkYKWnczbDRk2LL
	LNwUWGzxXgjLPB9LxpG4vUvaufJ2WvPUqizclk0KD+fniRCX59xhUlErd9TD+WHfy3Ib6mquZXH
	HNP5mHFn1nxyhJZNwCvw9M6RivcX0/hGeuNZ8YXtDX0P9TWfANGTcmXTT8wJJ8xKEqBxrdOAsmy
	IrimnKob9r+MCpVePvz8+sfrECmcMDncX2Aw+N+0OKgD6SFjXr/csWOxDfgleR1cmfquVxsOyWk
	N5B0e4Lm/bTouhBSwJFgt/TY0MjWb+ZO7ln/2CAd+R5nJLTk8XIGR/TlOxIRIt6n4NgHS9AYCjo
	XugJLHf5x7wDjpG93UdQR3aY2gLxEyylfrRQa04+NcG9WE5eQAISjDrg2EBMKIicTwDyznxOF0V
	R64ixo1a8cC8A==
X-Received: by 2002:a05:7022:438c:b0:134:a6f0:6f08 with SMTP id a92af1059eb24-13632f60d3amr652796c88.39.1779340428152;
        Wed, 20 May 2026 22:13:48 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d457:597:d576:1eb8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-135e5c0a918sm6231360c88.14.2026.05.20.22.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 22:13:47 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 20 May 2026 22:13:21 -0700
Subject: [PATCH v2 5/5] sh: mach-rsk: rsk7203: convert pin configuration to
 using software nodes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-rsk7203-properties-v2-5-465f3308021b@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37242-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: DDF2259EF81
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace legacy gpio_request() calls used to configure function pins
(SCIF0 TXD/RXD and LAN9118 IRQ) with software nodes describing GPIO
hogs. These hogs are attached to the PFC gpiochip node, allowing the
GPIO subsystem to automatically configure these pins when the driver is
registered.

Assisted-by: Gemini:gemini-3.1-pro
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/sh/boards/mach-rsk/devices-rsk7203.c | 97 +++++++++++++++++++++++++++----
 1 file changed, 85 insertions(+), 12 deletions(-)

diff --git a/arch/sh/boards/mach-rsk/devices-rsk7203.c b/arch/sh/boards/mach-rsk/devices-rsk7203.c
index f8760a91e2f1..e8a8fc1d2ca9 100644
--- a/arch/sh/boards/mach-rsk/devices-rsk7203.c
+++ b/arch/sh/boards/mach-rsk/devices-rsk7203.c
@@ -12,7 +12,6 @@
 #include <linux/smsc911x.h>
 #include <linux/input.h>
 #include <linux/io.h>
-#include <linux/gpio.h>
 #include <linux/gpio/machine.h>
 #include <linux/gpio/property.h>
 #include <asm/machvec.h>
@@ -131,6 +130,56 @@ static const struct software_node rsk7203_sw3_key_node = {
 	},
 };
 
+/* The base of the function GPIOs in the flat enum */
+#define SH7203_FN_BASE GPIO_FN_PINT7_PB
+
+static const struct software_node rsk7203_pfc_functions_node = {
+	.name = "functions",
+	.parent = &pfc_gpiochip_node,
+};
+
+static const struct software_node rsk7203_txd0_hog_node = {
+	.name = "txd0-hog",
+	.parent = &rsk7203_pfc_functions_node,
+	.properties = (const struct property_entry[]) {
+		PROPERTY_ENTRY_BOOL("gpio-hog"),
+		PROPERTY_ENTRY_U32_ARRAY("gpios", ((u32[]){
+			GPIO_FN_TXD0 - SH7203_FN_BASE, GPIO_ACTIVE_HIGH
+		})),
+		PROPERTY_ENTRY_BOOL("input"),
+		PROPERTY_ENTRY_STRING("line-name", "TXD0"),
+		{ }
+	},
+};
+
+static const struct software_node rsk7203_rxd0_hog_node = {
+	.name = "rxd0-hog",
+	.parent = &rsk7203_pfc_functions_node,
+	.properties = (const struct property_entry[]) {
+		PROPERTY_ENTRY_BOOL("gpio-hog"),
+		PROPERTY_ENTRY_U32_ARRAY("gpios", ((u32[]){
+			GPIO_FN_RXD0 - SH7203_FN_BASE, GPIO_ACTIVE_HIGH
+		})),
+		PROPERTY_ENTRY_BOOL("input"),
+		PROPERTY_ENTRY_STRING("line-name", "RXD0"),
+		{ }
+	},
+};
+
+static const struct software_node rsk7203_irq0_hog_node = {
+	.name = "irq0-hog",
+	.parent = &rsk7203_pfc_functions_node,
+	.properties = (const struct property_entry[]) {
+		PROPERTY_ENTRY_BOOL("gpio-hog"),
+		PROPERTY_ENTRY_U32_ARRAY("gpios", ((u32[]){
+			GPIO_FN_IRQ0_PB - SH7203_FN_BASE, GPIO_ACTIVE_HIGH
+		})),
+		PROPERTY_ENTRY_BOOL("input"),
+		PROPERTY_ENTRY_STRING("line-name", "IRQ0_PB"),
+		{ }
+	},
+};
+
 static const struct software_node * const rsk7203_swnodes[] __initconst = {
 	&rsk7203_gpio_leds_node,
 	&rsk7203_green_led_node,
@@ -141,6 +190,10 @@ static const struct software_node * const rsk7203_swnodes[] __initconst = {
 	&rsk7203_sw1_key_node,
 	&rsk7203_sw2_key_node,
 	&rsk7203_sw3_key_node,
+	&rsk7203_pfc_functions_node,
+	&rsk7203_txd0_hog_node,
+	&rsk7203_rxd0_hog_node,
+	&rsk7203_irq0_hog_node,
 	NULL
 };
 
@@ -165,26 +218,46 @@ static const struct platform_device_info rsk7203_devices[] __initconst = {
 	},
 };
 
-static int __init rsk7203_devices_setup(void)
+/*
+ * The pfc-sh7203 device is registered at arch_initcall level, and the
+ * sh-pfc driver (registered at postcore_initcall level) probes as soon
+ * as the device is created.
+ *
+ * We need to register our software nodes at postcore_initcall level so
+ * they are already present in the system when the driver probes and
+ * tries to apply GPIO hogs.
+ */
+static int __init rsk7203_sw_nodes_setup(void)
 {
-	struct platform_device *pd;
 	int error;
-	int i;
 
-	/* Select pins for SCIF0 */
-	gpio_request(GPIO_FN_TXD0, NULL);
-	gpio_request(GPIO_FN_RXD0, NULL);
-
-	/* Setup LAN9118: CS1 in 16-bit Big Endian Mode, IRQ0 at Port B */
-	__raw_writel(0x36db0400, 0xfffc0008); /* CS1BCR */
-	gpio_request(GPIO_FN_IRQ0_PB, NULL);
+	error = software_node_register(&pfc_gpiochip_node);
+	if (error && error != -EEXIST) {
+		pr_err("RSK7203: failed to register PFC software node: %d\n",
+		       error);
+		return error;
+	}
 
 	error = software_node_register_node_group(rsk7203_swnodes);
 	if (error) {
-		pr_err("failed to register software nodes: %d\n", error);
+		pr_err("RSK7203: failed to register board software nodes: %d\n",
+		       error);
 		return error;
 	}
 
+	return 0;
+}
+postcore_initcall(rsk7203_sw_nodes_setup);
+
+static int __init rsk7203_devices_setup(void)
+{
+	struct platform_device *pd;
+	int error;
+	int i;
+
+	/* Setup LAN9118: CS1 in 16-bit Big Endian Mode, IRQ0 at Port B */
+	__raw_writel(0x36db0400, 0xfffc0008); /* CS1BCR */
+
 	for (i = 0; i < ARRAY_SIZE(rsk7203_devices); i++) {
 		pd = platform_device_register_full(&rsk7203_devices[i]);
 		error = PTR_ERR_OR_ZERO(pd);

-- 
2.54.0.669.g59709faab0-goog


