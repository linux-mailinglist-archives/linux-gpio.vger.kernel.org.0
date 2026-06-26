Return-Path: <linux-gpio+bounces-39016-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZhN/LE8WPmrA/ggAu9opvQ
	(envelope-from <linux-gpio+bounces-39016-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 08:03:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE2F6CA8C2
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 08:03:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=pceh2AaX;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39016-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39016-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 073C030C9E9B
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 06:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9BC03D1CB5;
	Fri, 26 Jun 2026 06:01:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70072580CF
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 06:01:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782453695; cv=none; b=SX6BaaNs+C7dY4SzZwQbR/1biqVEyts0SYR5Tf+wGf3zUmrRT8siGQjhCG7nI9uVIxTfryxj2/+kxm8vk6VFyGlW4E7JMraE5Qy8aombhhwz/Sf7NVH0Zmf857VY3yGBLnnHKZ6Jlichqg9c4lbQHRYXGPIfUyM3DTnHkD5JdHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782453695; c=relaxed/simple;
	bh=QmsmJNbC6vrfjAhrO7VSD4MkPVMyYErBRPBggPmIMc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CC8lKfwqUpvm8xli0zrT3kOx+yikjS3X27jbNG3tI25nwSjYrJQZAHd94aY3EjfWfPctuF3LbOepIWntOMRJfs35hBxEtexs6g9ZuRsAI/YBrosdjV3Xp7yBP18QSSoocgc1zNXKi7OpzM3bCatCmNxKJV1S3KpfwGj8pL93obU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pceh2AaX; arc=none smtp.client-ip=209.85.221.50
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4624c1409c9so318795f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 23:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782453682; x=1783058482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QcajxXS1ayGKmTxTpDWGQNyzgm6vOaYeElta+TaNDR4=;
        b=pceh2AaXv8pq5EQ7L6hvoZKyYWKp8McgpySCT9DCd4klUmjiCTjP/io92HdfiiyxpT
         jdwDbgRqgM1EhIM/gitm8WtaKoMn+AnhmmEBoUKAMJ7wZhTkzRiFIOkFlu5B7HizJiWQ
         X/YvbYwhPQ0mlc2470eXLw61hA0BWUY1fPT2SvvgAf36rRk7GoNpMdVFP8pWx/y+fLfJ
         YP6+EGXEQ0eQdKiXXKedDRERFT+Wfp+TI6InnwRQyZJLH1539qz9pRsrjqrj2wmpzM5Q
         t6nioDgQWT3sHVAryMZoveeKq67ydShyXs5WsxD6eTi/sPm3yqWZrrykTDbDt0BgayNU
         RfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782453682; x=1783058482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QcajxXS1ayGKmTxTpDWGQNyzgm6vOaYeElta+TaNDR4=;
        b=KNCdk40K8YODFPgndW2eaHd06Zgjj4tVf0QAUu167qm67Q0qOlYZlFGJvwps3qvwia
         bzc/QIyBxH5LS6T6x2pY6wyD7lBEU5q8VHMzej4w2c8psC7r9uVfh+mOZ/4L880NTOJf
         rAMnLwYeRm3UqUhLiGoRJ8xDWiHBcfImNgBm53/YBxQpazMgR3NhRwZSNGvbp5GdiuzF
         /vc70+r44okNsCxt6fv1j+jgpZK+N6gdLc65t0YffzXMTReffB/OWKr5/4kTLi6fdGww
         IWebEgIXrRVCpKSqjHTzdOAkEyhQ4pkD/1dBrEYnAAcs9LZaW5z/Nh1axsXmJ0tFkFc+
         SBmA==
X-Gm-Message-State: AOJu0YxLECReCPmDro7y6/cr7oqIrc7HhJu2iuA7VT6SFFkLU++a7T5D
	Ba3jvGg1pZF/eq2dc2bJtEUQ3wjzbaq53Tyyao7yrCNxupll2sAMgsvt72yFzA==
X-Gm-Gg: AfdE7cm375HY1Mo8goqQFaKkOK2gZn/EkhsGrUoXY+2KKRmL9xLHZNff/WAXaP1ES/+
	DPERZd6+I7Hg5rry/ZdWEugNEhF85o6hSwZRKB/VgjUtb1Val0fW8ljEcj1eyRBJ8HtyNGaffiW
	09UQr9bDOHtojZzRaxa3u9WTESRcp1kIwPV/bM+jMyUf9SSQ8dWkLLVUZVB/8zce/jnE6XsguEw
	dze3bF5nGasW6egwiKEu38atWxn2c9NIJjUBsqhLGuNt8veHcAy7dCS6RR0l+Z9QsvHsfRGOuo3
	jX29leJu0S6yBR8EJqo0SZ8flpL+l+sxvrS40jHrQ8EXWbxN1UMIwPb/rH1fadkxMONfO//uxxj
	7ZN1vQDL+PwFXYj8PejiieRXpoE0IADxXVOF3pylm1j82Clmv5iM/Wsk2yjVHtLP9M4zmmZ+C7b
	iGAbPCvFT75L9Tmt8EHcZAJBmWczueBAebwPOBZdWzPDtQqRLtdLfbv/aVn/g8W2XiNgLVwQ==
X-Received: by 2002:a05:6000:2409:b0:46f:558:a43e with SMTP id ffacd0b85a97d-46f0558a939mr1683988f8f.9.1782453681744;
        Thu, 25 Jun 2026 23:01:21 -0700 (PDT)
Received: from camaron.. (147.red-88-9-50.dynamicip.rima-tde.net. [88.9.50.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f0db007b3sm2767936f8f.2.2026.06.25.23.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:01:20 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: linusw@kernel.org,
	brgl@kernel.org,
	vicencb@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] gpio: mt7621: unify naming style in driver code
Date: Fri, 26 Jun 2026 08:01:12 +0200
Message-ID: <20260626060112.2498324-5-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626060112.2498324-1-sergio.paracuellos@gmail.com>
References: <20260626060112.2498324-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-39016-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:vicencb@gmail.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sergioparacuellos@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[sergioparacuellos@gmail.com,linux-gpio@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0DE2F6CA8C2

There is a mix of 'mediatek' and 'mt7621' mix of prefix in different
function names along the code of the driver. Be consistent using 'mt7621'
for all function prefixes.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/gpio/gpio-mt7621.c | 40 +++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index 1b0b5247d3c9..87086c322f08 100644
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -68,7 +68,7 @@ mt7621_gpio_gc_to_priv(struct gpio_chip *gc)
 }
 
 static inline struct mtk_gc *
-to_mediatek_gpio(struct gpio_chip *chip)
+to_mt7621_gpio(struct gpio_chip *chip)
 {
 	struct gpio_generic_chip *gen_gc = to_gpio_generic_chip(chip);
 
@@ -137,7 +137,7 @@ mt7621_gpio_hwirq_to_offset(irq_hw_number_t hwirq, struct mtk_gc *bank)
 }
 
 static void
-mediatek_gpio_irq_unmask(struct irq_data *d)
+mt7621_gpio_irq_unmask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct mtk_gc *rg = gpiochip_get_data(gc);
@@ -159,7 +159,7 @@ mediatek_gpio_irq_unmask(struct irq_data *d)
 }
 
 static void
-mediatek_gpio_irq_mask(struct irq_data *d)
+mt7621_gpio_irq_mask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct mtk_gc *rg = gpiochip_get_data(gc);
@@ -181,7 +181,7 @@ mediatek_gpio_irq_mask(struct irq_data *d)
 }
 
 static int
-mediatek_gpio_irq_type(struct irq_data *d, unsigned int type)
+mt7621_gpio_irq_type(struct irq_data *d, unsigned int type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct mtk_gc *rg = gpiochip_get_data(gc);
@@ -245,11 +245,11 @@ mt7621_gpio_irq_relres(struct irq_data *d)
 }
 
 static int
-mediatek_gpio_xlate(struct gpio_chip *chip,
+mt7621_gpio_xlate(struct gpio_chip *chip,
 		    const struct of_phandle_args *spec, u32 *flags)
 {
 	int gpio = spec->args[0];
-	struct mtk_gc *rg = to_mediatek_gpio(chip);
+	struct mtk_gc *rg = to_mt7621_gpio(chip);
 
 	if (rg->bank != gpio / MTK_BANK_WIDTH)
 		return -EINVAL;
@@ -264,10 +264,10 @@ static const struct irq_chip mt7621_irq_chip = {
 	.name		= "mt7621-gpio",
 	.irq_request_resources = mt7621_gpio_irq_reqres,
 	.irq_release_resources = mt7621_gpio_irq_relres,
-	.irq_mask_ack	= mediatek_gpio_irq_mask,
-	.irq_mask	= mediatek_gpio_irq_mask,
-	.irq_unmask	= mediatek_gpio_irq_unmask,
-	.irq_set_type	= mediatek_gpio_irq_type,
+	.irq_mask_ack	= mt7621_gpio_irq_mask,
+	.irq_mask	= mt7621_gpio_irq_mask,
+	.irq_unmask	= mt7621_gpio_irq_unmask,
+	.irq_set_type	= mt7621_gpio_irq_type,
 	.flags		= IRQCHIP_IMMUTABLE,
 };
 
@@ -380,7 +380,7 @@ mt7621_gpio_to_irq(struct gpio_chip *gc, unsigned int offset)
 }
 
 static int
-mediatek_gpio_bank_probe(struct device *dev, int bank)
+mt7621_gpio_bank_probe(struct device *dev, int bank)
 {
 	struct gpio_generic_chip_config config;
 	struct mtk *mtk = dev_get_drvdata(dev);
@@ -416,7 +416,7 @@ mediatek_gpio_bank_probe(struct device *dev, int bank)
 	}
 
 	rg->chip.gc.of_gpio_n_cells = 2;
-	rg->chip.gc.of_xlate = mediatek_gpio_xlate;
+	rg->chip.gc.of_xlate = mt7621_gpio_xlate;
 	rg->chip.gc.ngpio = MTK_BANK_WIDTH;
 	rg->chip.gc.label = devm_kasprintf(dev, GFP_KERNEL, "%s-bank%d",
 					dev_name(dev), bank);
@@ -443,7 +443,7 @@ mediatek_gpio_bank_probe(struct device *dev, int bank)
 }
 
 static int
-mediatek_gpio_probe(struct platform_device *pdev)
+mt7621_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk *mtk;
@@ -477,7 +477,7 @@ mediatek_gpio_probe(struct platform_device *pdev)
 		return ret;
 
 	for (i = 0; i < MTK_BANK_CNT; i++) {
-		ret = mediatek_gpio_bank_probe(dev, i);
+		ret = mt7621_gpio_bank_probe(dev, i);
 		if (ret)
 			return ret;
 	}
@@ -485,18 +485,18 @@ mediatek_gpio_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id mediatek_gpio_match[] = {
+static const struct of_device_id mt7621_gpio_match[] = {
 	{ .compatible = "mediatek,mt7621-gpio" },
 	{},
 };
-MODULE_DEVICE_TABLE(of, mediatek_gpio_match);
+MODULE_DEVICE_TABLE(of, mt7621_gpio_match);
 
-static struct platform_driver mediatek_gpio_driver = {
-	.probe = mediatek_gpio_probe,
+static struct platform_driver mt7621_gpio_driver = {
+	.probe = mt7621_gpio_probe,
 	.driver = {
 		.name = "mt7621_gpio",
-		.of_match_table = mediatek_gpio_match,
+		.of_match_table = mt7621_gpio_match,
 	},
 };
 
-builtin_platform_driver(mediatek_gpio_driver);
+builtin_platform_driver(mt7621_gpio_driver);
-- 
2.43.0


