Return-Path: <linux-gpio+bounces-38307-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8nV5O4pqKmoVpAMAu9opvQ
	(envelope-from <linux-gpio+bounces-38307-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 09:58:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C99B66FA14
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 09:58:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=bIdFMKrV;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38307-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38307-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3334E314DE7E
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 07:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4779370ACE;
	Thu, 11 Jun 2026 07:54:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03BA368296;
	Thu, 11 Jun 2026 07:54:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781164481; cv=none; b=mJ2rD/LhKO37rDDdsXYnALOrAJvtxIUkInSMPXZT89FQ3Wh3oMnqaNcXGZVaB4DzwkIp9IvFWjacOD5tGu+wZTcoP2N9Mw7QbzW1b1N2HH8fyiutdNV9dQOvz3qLvNqF87Ydm66a8AIi/VW4f/hXMXGABoP0w5oHc/x6SeSQq3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781164481; c=relaxed/simple;
	bh=Lk019Dztwyn/9Xt9I2lihcTIhugfoZ5LXTUNTOSl0XA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qqH0ol091NhnQbaF8FA8BWLd9HBIliwuvUyWPE6Hwdp6WVBYbUHrBYX9hot0pP6XRj1RFrXNGg5P82esb69+BvlBRtLRVIbxNwJNbedzUuS/4Db2FdSXMlej2pnm8SvdU0umJi37OjAWiCcTvt+WcBA5HuQzd8wly0fTn2ruUIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bIdFMKrV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 66AA7C2BCB8;
	Thu, 11 Jun 2026 07:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781164481;
	bh=Lk019Dztwyn/9Xt9I2lihcTIhugfoZ5LXTUNTOSl0XA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bIdFMKrVFIKOJofERwD8lXccS52amM1URc1hQvin3+H0tKQrzGtJb3sDKFtGx+aL7
	 smxmXjlkuVYiEGpj1SAIGr4NfiAZQerIaVC2AqyIMoB9XnTGO3629HAR8vuGibBjP0
	 w48xMaxrG9HwyODOkSXjE8tGXavK0qH1MUahOusG+YiHCb6j7O0q7tQC6b7aChnlh0
	 LKT8tB8IE6hXWbyvffqSsd9YjJbNi/UcYsPk/8ZY1vjAcXj58LozrT02oSfutQRKqf
	 N4K304b6du+SHK13JJTxXGlQjKDng2Pmn5OU1b4Zr5wx1KlnfPiDeERI4eyf2uey3c
	 i9+oIW70r0bmA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50589CD98D4;
	Thu, 11 Jun 2026 07:54:41 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 11 Jun 2026 07:54:34 +0000
Subject: [PATCH RFC 2/2] pinctrl: meson: amlogic-a4: support gpiod_to_irq
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-gpio-to-irq-v1-2-12201716f23f@amlogic.com>
References: <20260611-gpio-to-irq-v1-0-12201716f23f@amlogic.com>
In-Reply-To: <20260611-gpio-to-irq-v1-0-12201716f23f@amlogic.com>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781164479; l=3292;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=wam4L3P2h/0NFdexAcbLeoEfUZ98TPeWasBAMHYVyak=;
 b=s65JzHoxnO5BzjEeGLbrqC0khJxXlE8BIifX49u9Y9PHSK4mRgDOh3fPDe/XP0mhHRyCgy3Zp
 5sEiMS4ywQNDGuHS8ziMDdXaacMr3Y7C2Mf8kNx3YDj5wdiSytG5hhT
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38307-lists,linux-gpio=lfdr.de,xianwei.zhao.amlogic.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:linux-amlogic@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:xianwei.zhao@amlogic.com,m:krzk@kernel.org,m:conor@kernel.org,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,baylibre.com,googlemail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[xianwei.zhao@amlogic.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5C99B66FA14

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add the to_irq() callback implementation so that
gpiod_to_irq() can map GPIO lines to IRQs correctly.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 54 ++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index 5ae0c19d007d..663681887f35 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -10,6 +10,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
@@ -97,6 +98,8 @@ struct aml_gpio_bank {
 	struct regmap			*reg_gpio;
 	struct regmap			*reg_ds;
 	const struct multi_mux		*p_mux;
+	struct device_node		*of_irq;
+	u32				irq_start;
 };
 
 struct aml_pinctrl {
@@ -836,6 +839,32 @@ static int aml_pctl_parse_functions(struct device_node *np,
 	return 0;
 }
 
+static struct device_node *aml_get_of_irq(struct device_node *np)
+{
+	struct device_node *of_irq;
+
+	of_irq = of_irq_find_parent(np);
+	if (of_irq && of_device_is_compatible(of_irq, "amlogic,meson-gpio-intc")) {
+		of_node_put(of_irq);
+		return of_irq;
+	}
+
+	if (of_irq)
+		of_node_put(of_irq);
+
+	return NULL;
+}
+
+static u32 aml_bank_irq(struct device_node *np)
+{
+	u32 hw_irq;
+
+	if (of_property_read_u32(np, "hw-irq", &hw_irq))
+		return U32_MAX;
+
+	return hw_irq;
+}
+
 static u32 aml_bank_pins(struct device_node *np)
 {
 	struct of_phandle_args of_args;
@@ -1003,6 +1032,27 @@ static int aml_gpio_get(struct gpio_chip *chip, unsigned int gpio)
 	return !!(val & BIT(bit));
 }
 
+static int aml_gpio_to_irq(struct gpio_chip *chip, unsigned int gpio)
+{
+	struct aml_gpio_bank *bank = gpiochip_get_data(chip);
+	struct irq_fwspec fwspec;
+	int hwirq;
+
+	if (bank->irq_start == U32_MAX)
+		return -EINVAL;
+	if (!bank->of_irq)
+		return -EINVAL;
+
+	hwirq = gpio + bank->irq_start;
+
+	fwspec.fwnode = of_fwnode_handle(bank->of_irq);
+	fwspec.param_count = 2;
+	fwspec.param[0] = hwirq;
+	fwspec.param[1] = IRQ_TYPE_NONE;
+
+	return irq_create_fwspec_mapping(&fwspec);
+}
+
 static const struct gpio_chip aml_gpio_template = {
 	.request		= gpiochip_generic_request,
 	.free			= gpiochip_generic_free,
@@ -1012,6 +1062,7 @@ static const struct gpio_chip aml_gpio_template = {
 	.direction_input	= aml_gpio_direction_input,
 	.direction_output	= aml_gpio_direction_output,
 	.get_direction		= aml_gpio_get_direction,
+	.to_irq			= aml_gpio_to_irq,
 	.can_sleep		= true,
 };
 
@@ -1079,6 +1130,7 @@ static int aml_gpiolib_register_bank(struct aml_pinctrl *info,
 		bank->reg_ds = bank->reg_gpio;
 	}
 
+	bank->irq_start = aml_bank_irq(np);
 	bank->gpio_chip = aml_gpio_template;
 	bank->gpio_chip.base = -1;
 	bank->gpio_chip.ngpio = aml_bank_pins(np);
@@ -1154,6 +1206,8 @@ static int aml_pctl_probe_dt(struct platform_device *pdev,
 				pdesc->name = pin_names[j];
 				pdesc++;
 			}
+
+			info->banks[bank].of_irq = aml_get_of_irq(np);
 			bank++;
 		} else {
 			ret = aml_pctl_parse_functions(child, info,

-- 
2.52.0



