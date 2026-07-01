Return-Path: <linux-gpio+bounces-39330-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pY+1JDFHRWrR9woAu9opvQ
	(envelope-from <linux-gpio+bounces-39330-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 18:58:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B17E6F010F
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 18:58:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=gt9ENIli;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39330-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39330-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 849D5308FEBC
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 16:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0726A37C0FC;
	Wed,  1 Jul 2026 16:57:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB091E1E12;
	Wed,  1 Jul 2026 16:57:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782925026; cv=none; b=aFpVmRuKlTryFjvs0kymbvjlAPjztQJFn+Qenb0YUPXQyL3ys/dd41HP/FersSIlEUMGFzUBRAXRsFfJ03uyDsJ70vICa0dtMvT7CS+AzMOkUNFujR7YM5NBmVwrIRtMpds+LaBNrCmHCZyeMiYsSfvzfCg8kxbir1aiiZnJTXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782925026; c=relaxed/simple;
	bh=IiN0xWJqJja1dE2Bcqsqgz/vkXxRozCtG+9Wfrp6VQg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KdjIRRPh1jFjiik9kuoANTdskqekdzZxOX0WPAr088uWls+Vgc7C5c9o81cCq6ZxWSg5VFSrqHvF65UoGcsJHDkqa+ayKqI6zHzNQdcuBGjHLXKzVUDdErI5Bpn5gbAS52jnIOgNNwa6RsqBzDgylUtaTqoyH8uuyjZEKnS0fTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gt9ENIli; arc=none smtp.client-ip=185.246.84.56
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CCDD31A0DC3;
	Wed,  1 Jul 2026 16:57:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 99AFA5FD9D;
	Wed,  1 Jul 2026 16:57:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 95C8C104C9688;
	Wed,  1 Jul 2026 18:57:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782925022; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=o2O8g8Db5b5I21/nPDlKVMMKnQYMRRmUA/SB/cdxABs=;
	b=gt9ENIliZ32mgrUzE2kwt9mfwxdjDm71T12KARKTSEp8bhrL9fpEMQIKD5ZIXaRx+qqqkZ
	ceJKpnUY94E4E8m0jY/KcmB7FeVL/OsKEh4T/KnCw5A0iHjUqQUdxfOwH/0HRvAXaALqk1
	j3n9iC/FGve3lFSa5sfatvQy2C7eY+qBe/1XTmJKGQII9BWnh7a0e02S5cjj48XNONk+d8
	/wFXgDx5Mcmz69CMsWL2WMSwwmSdMyoUY3x1WV8tyc2PD41tjl1WdQTEbCt8OGY/ZVStE0
	eV6SKk9ILOgGbuJFo5dCxC7Ck12WjCMshVdhtflyFWaJ5DivsMdgHlhwTnBeyQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 01 Jul 2026 18:56:58 +0200
Subject: [PATCH 1/5] gpio: nomadik: convert nmk_gpio_populate_chip() to
 goto cleanup
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260701-gpio-nomadik-silent-v1-1-644d10316cef@bootlin.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39330-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B17E6F010F

Remove duplicate teardown code that is found in all error if
statements. Replace by goto-based cleanup labels.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/gpio/gpio-nomadik.c | 44 +++++++++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
index e22b713166d7..f25f251f4757 100644
--- a/drivers/gpio/gpio-nomadik.c
+++ b/drivers/gpio/gpio-nomadik.c
@@ -527,15 +527,15 @@ struct nmk_gpio_chip *nmk_gpio_populate_chip(struct fwnode_handle *fwnode,
 
 	if (device_property_read_u32(gpio_dev, "gpio-bank", &id)) {
 		dev_err(dev, "populate: gpio-bank property not found\n");
-		platform_device_put(gpio_pdev);
-		return ERR_PTR(-EINVAL);
+		ret = -EINVAL;
+		goto err_put_pdev;
 	}
 
 #ifdef CONFIG_PINCTRL_NOMADIK
 	if (id >= ARRAY_SIZE(nmk_gpio_chips)) {
 		dev_err(dev, "populate: invalid id: %u\n", id);
-		platform_device_put(gpio_pdev);
-		return ERR_PTR(-EINVAL);
+		ret = -EINVAL;
+		goto err_put_pdev;
 	}
 	/* Already populated? */
 	nmk_chip = nmk_gpio_chips[id];
@@ -547,8 +547,8 @@ struct nmk_gpio_chip *nmk_gpio_populate_chip(struct fwnode_handle *fwnode,
 
 	nmk_chip = devm_kzalloc(dev, sizeof(*nmk_chip), GFP_KERNEL);
 	if (!nmk_chip) {
-		platform_device_put(gpio_pdev);
-		return ERR_PTR(-ENOMEM);
+		ret = -ENOMEM;
+		goto err_put_pdev;
 	}
 
 	if (device_property_read_u32(gpio_dev, "ngpios", &ngpio)) {
@@ -569,16 +569,16 @@ struct nmk_gpio_chip *nmk_gpio_populate_chip(struct fwnode_handle *fwnode,
 	res = platform_get_resource(gpio_pdev, IORESOURCE_MEM, 0);
 	base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(base)) {
-		platform_device_put(gpio_pdev);
-		return ERR_CAST(base);
+		ret = PTR_ERR(base);
+		goto err_put_pdev;
 	}
 	nmk_chip->addr = base;
 
 	/* NOTE: do not use devm_ here! */
 	clk = clk_get_optional(gpio_dev, NULL);
 	if (IS_ERR(clk)) {
-		platform_device_put(gpio_pdev);
-		return ERR_CAST(clk);
+		ret = PTR_ERR(clk);
+		goto err_put_pdev;
 	}
 	clk_prepare(clk);
 	nmk_chip->clk = clk;
@@ -586,12 +586,9 @@ struct nmk_gpio_chip *nmk_gpio_populate_chip(struct fwnode_handle *fwnode,
 	/* NOTE: do not use devm_ here! */
 	reset = reset_control_get_optional_shared(gpio_dev, NULL);
 	if (IS_ERR(reset)) {
-		clk_unprepare(clk);
-		clk_put(clk);
-		platform_device_put(gpio_pdev);
-		dev_err(dev, "failed getting reset control: %pe\n",
-			reset);
-		return ERR_CAST(reset);
+		dev_err(dev, "failed getting reset control: %pe\n", reset);
+		ret = PTR_ERR(reset);
+		goto err_unprepare_clk;
 	}
 
 	/*
@@ -601,18 +598,23 @@ struct nmk_gpio_chip *nmk_gpio_populate_chip(struct fwnode_handle *fwnode,
 	 */
 	ret = reset_control_deassert(reset);
 	if (ret) {
-		reset_control_put(reset);
-		clk_unprepare(clk);
-		clk_put(clk);
-		platform_device_put(gpio_pdev);
 		dev_err(dev, "failed reset deassert: %d\n", ret);
-		return ERR_PTR(ret);
+		goto err_put_reset;
 	}
 
 #ifdef CONFIG_PINCTRL_NOMADIK
 	nmk_gpio_chips[id] = nmk_chip;
 #endif
 	return nmk_chip;
+
+err_put_reset:
+	reset_control_put(reset);
+err_unprepare_clk:
+	clk_unprepare(clk);
+	clk_put(clk);
+err_put_pdev:
+	platform_device_put(gpio_pdev);
+	return ERR_PTR(ret);
 }
 
 static void nmk_gpio_irq_print_chip(struct irq_data *d, struct seq_file *p)

-- 
2.55.0


