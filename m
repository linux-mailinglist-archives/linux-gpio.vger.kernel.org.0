Return-Path: <linux-gpio+bounces-38734-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y5Z/F3qBNmqfAgcAu9opvQ
	(envelope-from <linux-gpio+bounces-38734-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2026 14:03:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C39556A8DAA
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2026 14:03:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=sPCcFFxD;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38734-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38734-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 65840301CC6C
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2026 12:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F3C53921E7;
	Sat, 20 Jun 2026 12:02:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087513921E9
	for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2026 12:02:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781956923; cv=none; b=WcchAd3AEbw3c3GB3SvucDtCfxAfCf1iG9+h0Lb8I4SERWsrR761PZ36a/R52I2ghxP8OAzBxzfFZ5ZAMPzqMVXDjoDIkan4H9qb+kS0JVqpSRfFbf9yryaPcXHpsc4ZNcjZnuWPLGtEG5tu3dLEcjgt6wrIt7kscpiGTaySlj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781956923; c=relaxed/simple;
	bh=QmsmJNbC6vrfjAhrO7VSD4MkPVMyYErBRPBggPmIMc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yv2gFx3XTjIC+zdh1dc+Cwxc8hb20DMNGLpSmai3ddBex0FnejzjJnZNVarm28mk5kGP1iMUoTHZp2jvoPX3P6j/3fboru8opRlYG0qlmJrY3I9Umb6oaogXDR/7VuTE8aZ57wMvTRzoixIY2ssIPFEp9zYsBSDdI4jmYo458eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sPCcFFxD; arc=none smtp.client-ip=209.85.128.51
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4924593f45dso11822395e9.1
        for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2026 05:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781956920; x=1782561720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QcajxXS1ayGKmTxTpDWGQNyzgm6vOaYeElta+TaNDR4=;
        b=sPCcFFxDTUXmrojueq4HxdrrCmaBSDAlc4WSj9KuQyMJ4v+Wmz7Oy0jYg700njYzgG
         8ywdqS8X+Deh6l420Qb92kqtqsswbzE/y14CGJ+wGQNlXbEc/Xv+Nm6ICIuEhkHUPIcb
         dNJasdpDTbXK4nvf9UGZ3GhM+l1fW9MkjQwk+g9fDo0/ibiIkWFH1SvtsukupApvVtpS
         LG+wnxuQb4FsRSvldght1mCfYB137uyBAhTtVOMGP6wu/PA/mRXMMc1dbmh39VwKrPhi
         g9pt2v3XAjLvwIzekwrhYutGXis0cDJLCkUXt/D8Kg2haXi6S+2TmaQ4X/wmEjRU7qc4
         Qm1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781956920; x=1782561720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QcajxXS1ayGKmTxTpDWGQNyzgm6vOaYeElta+TaNDR4=;
        b=MX1P34gnHHf57Fn6XHPsrskZEjvurFk/9kKC8puvorMm4V1vxxJXnUnJXedMf5cgdH
         gRgG/DYXeUcR7oX36OMSjBpBq4WJBjQvWMvu7qk3siyroIW3sm6eIWwcxoLnGLgSFh+G
         zACKrvBirWrPPsiAI2eastX30f5hZVyxAgr7Ecm9vbQJ0q/zSF+Zel400qKO6S9Nep3+
         kB3a2NPRm20R3KbFqEWS+7z017X91jSwdn4DtM0nShg7uzkCpGloFZo/1JsvIxNycYJO
         Omi06XhXH+aon+faoT61l0Y+Q6YscAGoYO8NG6SyL1cQMd3gaVeeyyUtLmbvvcaoMlUm
         BIzg==
X-Gm-Message-State: AOJu0YybsT206dp9EJIAsjy6e37DobOnDakDQdgSVsyaWp6O7QMuTqy0
	y4kZ7wij+HI+vuzYPgF6zhXKpKv8GRhMAOHLTC9cy7E8Kbf1jVYCFqoRJdBV8g==
X-Gm-Gg: AfdE7clDa2P5x/pxqWDaW1IY6BFpl9jBqQKacqRftElvHDiOXuDzXk3IHUq344RxHYp
	ja1kVHukvXZAqAOYqCTRFRgsrZa0ocd+R8I4BIO2a/F3jlH4UKp/X4lexJJPCH/GyAbxybTtz1i
	QT+RrwLuLEvca7rZWLAPP8qlS8Kmb0RnyGOsV+h1W8GcnlZynvkrRdSe49K64KeD6d1JbyDAOoK
	QQMW497PeqQQ+JPv5CSjfo6KNcOrHLCYFhnaM2CxU8VlWWUXlq7El8B5VRsc6jzU7jxUoAo1dBl
	ETKX1eJ6762QfW7FWO/Oom7Bt6n29bG9PS88xDhacoAOuUmu0PEbJ8hG/sgpfBd/ByCR8skZEcE
	H3weJ8KTV1H/8BdU70l1vAK9KL3809IZEcGCXqHpFuif2tqir4Tfknc837PZ8S2PGZlf/ypRW2w
	SIrwe8eRlgzvLEDd+uubFvaODigymU12MVc0vGEIGNfyFOdOrpDlnKAb1PqKg=
X-Received: by 2002:a05:600c:3488:b0:492:4d82:70c1 with SMTP id 5b1f17b1804b1-4924d827119mr16214145e9.22.1781956916164;
        Sat, 20 Jun 2026 05:01:56 -0700 (PDT)
Received: from camaron.. (147.red-88-9-50.dynamicip.rima-tde.net. [88.9.50.147])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49240ee9bc2sm93161565e9.1.2026.06.20.05.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 05:01:54 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: linusw@kernel.org,
	brgl@kernel.org,
	vicencb@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] gpio: mt7621: unify naming style in driver code
Date: Sat, 20 Jun 2026 14:01:36 +0200
Message-ID: <20260620120136.2482872-5-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260620120136.2482872-1-sergio.paracuellos@gmail.com>
References: <20260620120136.2482872-1-sergio.paracuellos@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-38734-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C39556A8DAA

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


