Return-Path: <linux-gpio+bounces-39333-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8peBE7tIRWo7+AoAu9opvQ
	(envelope-from <linux-gpio+bounces-39333-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 19:04:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C32976F0241
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 19:04:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=cAFbRxej;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39333-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39333-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B41B31018F6
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 16:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71E2F385D98;
	Wed,  1 Jul 2026 16:57:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0800379973
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 16:57:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782925030; cv=none; b=FbVlTaEXXXbbRfGg8BZjTKB17PD54sL/ytutf4oZqNL0SQkAjSuEcsvTynyDIztHQG6wDVuehGSsyHwpQzvVFb/SDkEpEAqVidtFWnrfV2md0B0ahwaI+yGUgdDr/aMTrW5Ygs3l8E8MeUsEmhiaVpJykuZgnp46jBOkoYaIunc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782925030; c=relaxed/simple;
	bh=Y20u31rBSLsRQPUY+PtGSgeYtTe8qjiyJIEwU5bfVVw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lumx3Uo9eIpjYcpwanQsROBm/+JI5DmnbS9QR1LIdrR0nUcmzpxOmIMRmP8x02AzK4txXnWMMZT7f4HGFtjG6ZvUjyclAWUD6eJqxyJCiIMmWQG/PB+67Mh5vbCPePGDJbrDnbBhD+WU3G4N/HtKBvstsKfaCr+6/E0tKXfhsa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cAFbRxej; arc=none smtp.client-ip=185.246.85.4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9004F4E40BFE;
	Wed,  1 Jul 2026 16:57:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 64D5B5FD9D;
	Wed,  1 Jul 2026 16:57:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ACB51104C9688;
	Wed,  1 Jul 2026 18:57:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782925026; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=l91BGgbqr7YyneeHqPAOt3f1WHw2iUoAMT+4Nm81h9s=;
	b=cAFbRxejJpMXZsBshzeGIRoLjmy+unEt7AR8qJHZg0CVhgA8yhHCuRhdFVkbx+IShmwWft
	ax7U1QxXfDyz7eqdiZQyJLRnkxA8USrk7Ui005NTjxORWk7URhOraO2w9OgEFqlrHnzBOm
	KrEt2wGqTsm2ZYoTK1Wvv4iXdRsEiGqaB57cEnKIw4YyCFIiKGEQb9ouRsst8CNkRCHyE9
	XXTknQAHLmcuvLAz8Jkhz0AfMFzlcmFo8q3Yi5S0wvIGnmnEeIvmh1zOnxBksWLi+/Ec+j
	nlrnd299qv/ujrGUwtsBoNBtP09JaQA+t+CKjtIr/x/6zv6wUlYlaUKXp+doaA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 01 Jul 2026 18:57:01 +0200
Subject: [PATCH 4/5] gpio: nomadik: use dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260701-gpio-nomadik-silent-v1-4-644d10316cef@bootlin.com>
References: <20260701-gpio-nomadik-silent-v1-0-644d10316cef@bootlin.com>
In-Reply-To: <20260701-gpio-nomadik-silent-v1-0-644d10316cef@bootlin.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39333-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[theo.lebrun@bootlin.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:p.zabel@pengutronix.de,m:vladimir.kondratiev@mobileye.com,m:gregory.clement@bootlin.com,m:benoit.monin@bootlin.com,m:tawfik.bayouk@mobileye.com,m:thomas.petazzoni@bootlin.com,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:theo.lebrun@bootlin.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[theo.lebrun@bootlin.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C32976F0241

gpio-nomadik depends on a few resources. In one case the reset is taking
time to show up leading to a boot log containing:

[    0.544230] nomadik-gpio 1400000.gpio: failed getting reset control: -EPROBE_DEFER

Fix by replacing all dev_err() calls that might be made at probe with
dev_err_probe().

On nomadik platforms, the nmk_gpio_populate_chip() log calls might
attach their reasons to the gpio or pinctrl device depending on boot
order.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/gpio/gpio-nomadik.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
index eba095eeb3d6..1ee46f59d708 100644
--- a/drivers/gpio/gpio-nomadik.c
+++ b/drivers/gpio/gpio-nomadik.c
@@ -520,21 +520,22 @@ struct nmk_gpio_chip *nmk_gpio_populate_chip(struct fwnode_handle *fwnode,
 
 	gpio_dev = bus_find_device_by_fwnode(&platform_bus_type, fwnode);
 	if (!gpio_dev) {
-		dev_err(dev, "populate \"%pfwP\": device not found\n", fwnode);
-		return ERR_PTR(-ENODEV);
+		ret = -ENODEV;
+		dev_err_probe(dev, ret, "populate \"%pfwP\": device not found\n", fwnode);
+		return ERR_PTR(ret);
 	}
 	gpio_pdev = to_platform_device(gpio_dev);
 
 	if (device_property_read_u32(gpio_dev, "gpio-bank", &id)) {
-		dev_err(dev, "populate: gpio-bank property not found\n");
 		ret = -EINVAL;
+		dev_err_probe(dev, ret, "populate: gpio-bank property not found\n");
 		goto err_put_pdev;
 	}
 
 #ifdef CONFIG_PINCTRL_NOMADIK
 	if (id >= ARRAY_SIZE(nmk_gpio_chips)) {
-		dev_err(dev, "populate: invalid id: %u\n", id);
 		ret = -EINVAL;
+		dev_err_probe(dev, ret, "populate: invalid id: %u\n", id);
 		goto err_put_pdev;
 	}
 	/* Already populated? */
@@ -578,7 +579,7 @@ struct nmk_gpio_chip *nmk_gpio_populate_chip(struct fwnode_handle *fwnode,
 	clk = clk_get_optional(gpio_dev, NULL);
 	if (IS_ERR(clk)) {
 		ret = PTR_ERR(clk);
-		dev_err(dev, "failed getting clock: %d\n", ret);
+		dev_err_probe(dev, ret, "failed getting clock\n");
 		goto err_put_pdev;
 	}
 	clk_prepare(clk);
@@ -587,8 +588,8 @@ struct nmk_gpio_chip *nmk_gpio_populate_chip(struct fwnode_handle *fwnode,
 	/* NOTE: do not use devm_ here! */
 	reset = reset_control_get_optional_shared(gpio_dev, NULL);
 	if (IS_ERR(reset)) {
-		dev_err(dev, "failed getting reset control: %pe\n", reset);
 		ret = PTR_ERR(reset);
+		dev_err_probe(dev, ret, "failed getting reset control\n");
 		goto err_unprepare_clk;
 	}
 
@@ -599,7 +600,7 @@ struct nmk_gpio_chip *nmk_gpio_populate_chip(struct fwnode_handle *fwnode,
 	 */
 	ret = reset_control_deassert(reset);
 	if (ret) {
-		dev_err(dev, "failed reset deassert: %d\n", ret);
+		dev_err_probe(dev, ret, "failed reset deassert\n");
 		goto err_put_reset;
 	}
 
@@ -695,7 +696,7 @@ static int nmk_gpio_probe(struct platform_device *pdev)
 	ret = devm_request_irq(dev, irq, nmk_gpio_irq_handler, IRQF_SHARED,
 			       dev_name(dev), nmk_chip);
 	if (ret) {
-		dev_err(dev, "failed requesting IRQ\n");
+		dev_err_probe(dev, ret, "failed requesting IRQ\n");
 		return ret;
 	}
 

-- 
2.55.0


