Return-Path: <linux-gpio+bounces-35542-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIIlMvwi72lV7gAAu9opvQ
	(envelope-from <linux-gpio+bounces-35542-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 10:49:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CA546F60B
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 10:49:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1684D3019819
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 08:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4947D3A1690;
	Mon, 27 Apr 2026 08:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pxZnIzVo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC6439A7F9
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 08:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777279684; cv=none; b=tM3/rE0a4+6pLtmRyBjpekduX80oHqRJaQ0Zlbq9Gq0ZHFF1u8+ZpDsZtikU2i4npF2j/soqUnNdzXCuLHZErsKx2VS8WBfVDkqLYAin3zpYFPBH+BDNH05AmJzdhA5m5HEikmP0vp9yXnu4Izd82+sAz66MoTuFcGexUfnhVlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777279684; c=relaxed/simple;
	bh=T+fxeqy3rqUcR9SvRnEr8qzs/4WoEz+DWEJrOWem89w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qe6UoFvfzoR/Fn6e8rB7JNbb/gVXGgL2yIBrmrip8dzpHcS3ajiWDCcAz/wawPUWZ5C6Ya3JtNX7LE1q5k0bhD/z9xVOgGdiBZtqjpPM+3ZxaHmRNi0wKmOV9ldF0aMTmevo86h+cjyqCkj8+dUHmG4eJUlVJtpWjrnPArQrXek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pxZnIzVo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA09FC19425;
	Mon, 27 Apr 2026 08:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777279683;
	bh=T+fxeqy3rqUcR9SvRnEr8qzs/4WoEz+DWEJrOWem89w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pxZnIzVoiyvBPkSHshZccvWs2Uy3VlpbxnbyPTki1QlcPqo6hMIROuZu8ThNO9H/K
	 lmtR44DhW+GuNPE6wVEbvVFoRzewgkMxnQspHIqKb6QHMM3AmJc6UILMEpzbKfnpgo
	 GAQkk8EJ6YggRJMPEIRkNmI+j3lyycQ4cC1qETLwe4W9UTBPZEzI/r7rM1+M2Rz20V
	 7fLPYyaibHdIgtcFhqWaQzMX+1hkh/M+QqcdvdKEYBnzr5MPrY0IG8GojtdGUYOVN0
	 6A+rH3aGNoa4aqekaRgX38N6GUnX/VWfv1/XkpG5f4eoCnEvLiAv1qUWEHeQwIQp5U
	 6pd3ukx/T+sDw==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 27 Apr 2026 10:47:58 +0200
Subject: [PATCH v3 2/3] gpio: altera: User gc helper variable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-gpio-mmio-more-v3-2-fe1882351424@kernel.org>
References: <20260427-gpio-mmio-more-v3-0-fe1882351424@kernel.org>
In-Reply-To: <20260427-gpio-mmio-more-v3-0-fe1882351424@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, 
 Mun Yew Tham <mun.yew.tham@intel.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 81CA546F60B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35542-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

From: Linus Walleij <linus.walleij@linaro.org>

Make the code easier to read by adding a local gpio_chip *gc
variable.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-altera.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
index 9508d764cce4..cb04700c8ccd 100644
--- a/drivers/gpio/gpio-altera.c
+++ b/drivers/gpio/gpio-altera.c
@@ -234,6 +234,7 @@ static int altera_gpio_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	int reg, ret;
 	struct altera_gpio_chip *altera_gc;
+	struct gpio_chip *gc;
 	struct gpio_irq_chip *girq;
 	int mapped_irq;
 
@@ -243,29 +244,31 @@ static int altera_gpio_probe(struct platform_device *pdev)
 
 	raw_spin_lock_init(&altera_gc->gpio_lock);
 
+	gc = &altera_gc->gc;
+
 	if (device_property_read_u32(dev, "altr,ngpio", &reg))
 		/* By default assume maximum ngpio */
-		altera_gc->gc.ngpio = ALTERA_GPIO_MAX_NGPIO;
+		gc->ngpio = ALTERA_GPIO_MAX_NGPIO;
 	else
-		altera_gc->gc.ngpio = reg;
+		gc->ngpio = reg;
 
-	if (altera_gc->gc.ngpio > ALTERA_GPIO_MAX_NGPIO) {
+	if (gc->ngpio > ALTERA_GPIO_MAX_NGPIO) {
 		dev_warn(&pdev->dev,
 			"ngpio is greater than %d, defaulting to %d\n",
 			ALTERA_GPIO_MAX_NGPIO, ALTERA_GPIO_MAX_NGPIO);
-		altera_gc->gc.ngpio = ALTERA_GPIO_MAX_NGPIO;
+		gc->ngpio = ALTERA_GPIO_MAX_NGPIO;
 	}
 
-	altera_gc->gc.direction_input	= altera_gpio_direction_input;
-	altera_gc->gc.direction_output	= altera_gpio_direction_output;
-	altera_gc->gc.get		= altera_gpio_get;
-	altera_gc->gc.set		= altera_gpio_set;
-	altera_gc->gc.owner		= THIS_MODULE;
-	altera_gc->gc.parent		= &pdev->dev;
-	altera_gc->gc.base		= -1;
+	gc->direction_input	= altera_gpio_direction_input;
+	gc->direction_output	= altera_gpio_direction_output;
+	gc->get		= altera_gpio_get;
+	gc->set		= altera_gpio_set;
+	gc->owner		= THIS_MODULE;
+	gc->parent		= &pdev->dev;
+	gc->base		= -1;
 
-	altera_gc->gc.label = devm_kasprintf(dev, GFP_KERNEL, "%pfw", dev_fwnode(dev));
-	if (!altera_gc->gc.label)
+	gc->label = devm_kasprintf(dev, GFP_KERNEL, "%pfw", dev_fwnode(dev));
+	if (!gc->label)
 		return -ENOMEM;
 
 	altera_gc->regs = devm_platform_ioremap_resource(pdev, 0);
@@ -283,7 +286,7 @@ static int altera_gpio_probe(struct platform_device *pdev)
 	}
 	altera_gc->interrupt_trigger = reg;
 
-	girq = &altera_gc->gc.irq;
+	girq = &gc->irq;
 	gpio_irq_chip_set_chip(girq, &altera_gpio_irq_chip);
 
 	if (altera_gc->interrupt_trigger == IRQ_TYPE_LEVEL_HIGH)

-- 
2.53.0


