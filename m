Return-Path: <linux-gpio+bounces-39549-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yuqOOwxvTGrhkQEAu9opvQ
	(envelope-from <linux-gpio+bounces-39549-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 05:14:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CB5716F7D
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 05:14:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=LoTavUdV;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39549-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39549-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C8C20300CF38
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 03:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0848E3876C3;
	Tue,  7 Jul 2026 03:14:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A6A3806DD
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 03:14:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783394048; cv=none; b=pDBK/njG2klOCGNzvPoz49sPFs0TM4JrW3aUAD9vlSzW/sAAB5dIfyKznfhV/WtHeVEshrg5p+BfZ6thEdjg201fb1TRaRnllUhlCMGixogH1fby5GLnfQ92W/RA2ebxpz2eQqmd9AHQ4jnY9ux3tQoPz5eQGZjh/xkJXOMzITo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783394048; c=relaxed/simple;
	bh=23ZMI3BNq1Z9j7vAAvxAPIlBUZZ9Zjk2yQ37dRvW0w4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZWeQTblGeAiL103BH2S9SbiMte3doY7B6Hy6cpw3xvQ3z3fykIxT4mfZWGc7KD6GVFLdbPkqzdQzS+8t+jefAczLbuQQeCJ4SjgAQY6eHZnLzmRSKPRZUSIqK+EYnsGla8dA+qkbeg0L9M59YtSyokfZblma7oKu5hwcowBDiCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LoTavUdV; arc=none smtp.client-ip=209.85.215.180
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c99eaa1f020so3792909a12.2
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 20:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783394047; x=1783998847; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dZWRhCcUrvPvTTZjoxUn5wLx5Cz3X6hhXARWRFQg4Ow=;
        b=LoTavUdVMdU2D3viCpxesUdVw+lQqxD0MiivLdYfSj0e/f/SleiHcXHgGzbOYWjlmn
         zFWf6fa+hOBOnLz/Gf66Hp0NbQGfdnvdLf8KXZY7OL3I3nA9osTyZxzY/KIARVpQ9jUJ
         +Ix7C05r4ojNeK0/AC5at6Cyxr0/dm3SQh4M1AT9xHPGi5x/M3pMUhiGfNOv1S7rZqF3
         NYhBEufm2CA9KZ1/E7zaOGkmaY+P+BzeTQL6ct7wcjZIaauIndQxUAY892j6kJVcAg93
         sX4Y60mfG9SrSWvL1VwAjivABaK7PLRed4xZabLx3MjZb/H+vFsTIOoHIP0m67TqPJ7j
         0PIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783394047; x=1783998847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dZWRhCcUrvPvTTZjoxUn5wLx5Cz3X6hhXARWRFQg4Ow=;
        b=guKu+b3iscm5WQ96kWRzGoUv3uBb97TU5IFXK9cfaIEBJVnSAmfNTvZMAP8Ebu/oUo
         iwWv//t/mj+FJKYwQG8J5ZiDdSBz1A+yboqZ7Guz6ZWGDXJuZs0NWkdgO7PzeaGg2UoB
         SraEVvz0ug33NXFrVVfoBJ8V6x7dWdyY1BTdxoCQXTk2ErbaYr1/lKUrtg1o27XjEF3Q
         7UNTHd1b0dWxLJ9mOxRSOgzJV+dwaBGYJdWakEllkQFffgLzdifdOxveysfDbLmFPLnc
         Rw1CHYxCFar9AyYC9bLXU2UNPlWnuPrxpFImUhNMmxvVf/Vepw5SOogROtQNb8kpXOgl
         0fmg==
X-Forwarded-Encrypted: i=1; AHgh+RoF2k/CsPOVfp0RRuHd/Q14zdpfJ8ALATvtDZ+O19dJC/DLzO4eCFx0gyiZkXk2ABIME4A38RRKZv4+@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/UKuq7JBhmuWmQH5gj6xDWKuBs45v7Egx1fl1TMme3+1YDnSz
	zgAewDu6iYCRGLRuU0q70/1T/bvudIl6yXp0psRL1xgN5noxKyRMScXs
X-Gm-Gg: AfdE7clBlGV5IfOUULex3nek9T8eD+oueY9mmYtHI0knMHicOR7uDaUUf/SQu1Ma3/4
	ykmUFQUGO+U8byKJhoMRsvdJSca0zh4xOYdV8O4dfub89nT/g2Uv8GGqwpIrF+yradUwmmtHC16
	msmotEuEuNZHwX0PynmPNo6t0FytKy7TK67Ne3OX/njNwywgGaQJHtOZZE43uhEtewyBpjIdsL9
	5wFR2VOyxuHRleqQ8lqznxCbAwVHNFAbLEUK9whenO6Bm0CE4EXvo+47JPfbxCiIY3ubslx1dxg
	+wbfu404t0nR+a8Dm5pQRxUKasfionGwo7LYq1EkyAwNXlXgu/+0WrMRHqi2D0pfaxXl1S6d327
	FPkEvw5yDEUXTi7uMsYZ/CNN2LxOoh+aMnw/eMB503/1rRRhY3rZ+1Jn+KoH4bZwAuDNa6VsnAB
	ivNm2aXxAA7y+xczJIruStWrrPrZ848mdSNBfzt8U8Hwu30zCWr75G3o9FGFnzeb66WGL0c1o84
	T3PcA4SCR2UgTo=
X-Received: by 2002:a05:6a20:c996:b0:3b4:93b9:2b91 with SMTP id adf61e73a8af0-3c08ec7451dmr4414105637.12.1783394046925;
        Mon, 06 Jul 2026 20:14:06 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d89b:1fdd:a8f2:dbeb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659666e7sm3339905c88.7.2026.07.06.20.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 20:14:06 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 06 Jul 2026 20:14:00 -0700
Subject: [PATCH 1/4] gpio: sa1100: register software node for GPIO
 controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-sa1100-swnode-v1-1-332759bbd930@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39549-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: 06CB5716F7D

Define and register a static software node (sa1100_gpiochip_node) for the
SA-1100 GPIO controller during sa1100_init_gpio(). Assign its firmware node
directly to the GPIO chip prior to calling gpiochip_add_data().

This allows StrongARM SA-1100 board setup files to reference the SoC GPIO
controller in property entries when converting legacy platform data to
software nodes, resolving pin bindings directly via the attached firmware
node without relying on name matching.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-sa1100/generic.h |  3 +++
 drivers/gpio/gpio-sa1100.c     | 10 +++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-sa1100/generic.h b/arch/arm/mach-sa1100/generic.h
index 5fe0d4fc0f8c..3cfe3b647711 100644
--- a/arch/arm/mach-sa1100/generic.h
+++ b/arch/arm/mach-sa1100/generic.h
@@ -48,6 +48,9 @@ int sa11xx_clk_init(void);
 struct gpiod_lookup_table;
 void sa11x0_register_pcmcia(int socket, struct gpiod_lookup_table *);
 
+struct software_node;
+extern const struct software_node sa1100_gpiochip_node;
+
 struct fixed_voltage_config;
 struct regulator_consumer_supply;
 int sa11x0_register_fixed_regulator(int n, struct fixed_voltage_config *cfg,
diff --git a/drivers/gpio/gpio-sa1100.c b/drivers/gpio/gpio-sa1100.c
index 1938ffa2f4f3..ffa73dd3b982 100644
--- a/drivers/gpio/gpio-sa1100.c
+++ b/drivers/gpio/gpio-sa1100.c
@@ -13,6 +13,11 @@
 #include <mach/hardware.h>
 #include <mach/irqs.h>
 #include <mach/generic.h>
+#include <linux/property.h>
+
+const struct software_node sa1100_gpiochip_node = {
+	.name = "sa1100-gpio",
+};
 
 struct sa1100_gpio_chip {
 	struct gpio_chip chip;
@@ -317,6 +322,7 @@ static const int sa1100_gpio_irqs[] __initconst = {
 void __init sa1100_init_gpio(void)
 {
 	struct sa1100_gpio_chip *sgc = &sa1100_gpio_chip;
+	struct gpio_chip *gc = &sgc->chip;
 	int i;
 
 	/* clear all GPIO edge detects */
@@ -324,7 +330,9 @@ void __init sa1100_init_gpio(void)
 	writel_relaxed(0, sgc->membase + R_GRER);
 	writel_relaxed(-1, sgc->membase + R_GEDR);
 
-	gpiochip_add_data(&sa1100_gpio_chip.chip, NULL);
+	software_node_register(&sa1100_gpiochip_node);
+	gc->fwnode = software_node_fwnode(&sa1100_gpiochip_node);
+	gpiochip_add_data(gc, NULL);
 
 	sa1100_gpio_irqdomain = irq_domain_create_simple(NULL,
 			28, IRQ_GPIO0,

-- 
2.55.0.rc2.803.g1fd1e6609c-goog


