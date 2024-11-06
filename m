Return-Path: <linux-gpio+bounces-12599-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5409BE080
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 09:22:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D4CC281F1C
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 08:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B29181DDC1A;
	Wed,  6 Nov 2024 08:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="VuzvpTeR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6041DDC19
	for <linux-gpio@vger.kernel.org>; Wed,  6 Nov 2024 08:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881188; cv=none; b=gFRF85WBNzBwS4nbf4uz36BpZU7VIh2hr/D5hto2ZFLqJRa1WNZV4+1dmbFmYmk3itcSiitiet1nJnx+EB+2Mz6aQW3Y00e6Bf2i6//hgShmpGyqonba3oyPreGeHHr2fuNS5LE3bgeSO6Ya4JNCQGtMHlsup/Yb/2qMr+304nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881188; c=relaxed/simple;
	bh=LFeHXjCSHvGJ9f5bEliHn9u4zOTAWW7IaEgzhjWU0BU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QfdvjkBIm9lgjV7BBWt1LDtbVaENnuFt3d8RGhnJJCKvn0CBrRWsWrZkgJxfp4WwqoTG+8Zo0Ta2Zy3SWCBWYQ2bPbQU41UuhDUafuwNZ37F5jtUhhQdc+yi1ZcoIMptOAxt/S74+bjLPGImGCj/5nFbT/lXQOAUbu8oogwF1Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=VuzvpTeR; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a9ec86a67feso70920266b.1
        for <linux-gpio@vger.kernel.org>; Wed, 06 Nov 2024 00:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730881185; x=1731485985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wUDv2V4Ojl7MBP9CjzLyQU4gcEGw43YJcE+AX+Wm+CE=;
        b=VuzvpTeRV7hnQAO+MzMO3385BijpjmzjACx65ZhXHkzzWIuMwWwTCTkRpD1IiHITWQ
         6kY3Sf1E5dG1cGCpHBJugUicoT6NIaXMj8xQ0gcUfC2FZhBviDQFhPnP6LbhGzHCz6Tz
         WVB1mN8zObzbv8uEajUrCHt1BlzREnv7yPtZBIa9VUNAPmUPyq3URmiIJdkzhswIOH77
         36SEx8lYNwiABfQJADsuneFB8t3LFq4idr4r4mfR0LlO53zIje56zLReCTJdRvg+rVYC
         XOCEnPD8EOCntFGIG3VsZvjnpFbrX+Yc9g1pvhROCtNrGDDlNKknGm6UxILgl0zVKzzy
         bHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881185; x=1731485985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wUDv2V4Ojl7MBP9CjzLyQU4gcEGw43YJcE+AX+Wm+CE=;
        b=W3kgr4B6pb2HVS7w+zRxHp4GV9c3UkN+9MPQnbUNMPi/Pbu8vxkbdSq+ijGIei38Rp
         4EJ+fLyrihTlotpYnp1d+3ONhNHJ4q13glsmOXWm12gU2GPYqyPFXs3xrlV1EiPgyVSi
         Vy5qi0/hllFfNxdyXCSP4EoMT1b4u+R7zSzcwNjfU/RdW0RY9Hv8cBRgFeRpz7c6vvhf
         sYuuvoMkbh9nX/dVU24FctY3WjJwniodipem34FT2DbfvjNYGXbGTmrfkYCM5rjNkR1d
         1+A5oT8vdaf/PeyA7vsn2BsWdkBM0VqOsalf77tH9DOl/LaEa4d84aIwftX04xbrEiNW
         RRZw==
X-Forwarded-Encrypted: i=1; AJvYcCVZyVXYldly7bufcf01/sYnFKoJIWTIhkNvKqcFL0ltg9RO6oO6ruZl1vpFk0xsEpwn9OxbhTxr2tAF@vger.kernel.org
X-Gm-Message-State: AOJu0Yy23K2aw0VABWIj4dXGnYHuM3BSKnIw02EsXIeUZkP1Nc23NSEK
	CSbNM39UPlYscnoxeAtKrrtHmjQGJV1LXIS3MjmEBLTTwREssm0CJW86sVzzM2I=
X-Google-Smtp-Source: AGHT+IGMGXzRTzgLznZtPCTJncxWj0MNaZdFWxwIvcNHeHd86TUV3ZZ1+93Or+q4LW+LR2d/O0S5Kg==
X-Received: by 2002:a17:907:724c:b0:a99:fa01:2b72 with SMTP id a640c23a62f3a-a9de5ee15e8mr3705175966b.33.1730881184964;
        Wed, 06 Nov 2024 00:19:44 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a2dbcsm241369766b.40.2024.11.06.00.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 00:19:44 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	linus.walleij@linaro.org,
	support.opensource@diasemi.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	Adam.Thomson.Opensource@diasemi.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 14/31] ASoC: sh: rz-ssi: Use temporary variable for struct device
Date: Wed,  6 Nov 2024 10:18:09 +0200
Message-Id: <20241106081826.1211088-15-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Use a temporary variable for the struct device pointers to avoid
dereferencing.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 sound/soc/renesas/rz-ssi.c | 62 +++++++++++++++++++-------------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 14d1edac6c34..0b5bc973a23c 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -1021,36 +1021,37 @@ static const struct snd_soc_component_driver rz_ssi_soc_component = {
 
 static int rz_ssi_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct rz_ssi_priv *ssi;
 	struct clk *audio_clk;
 	struct resource *res;
 	int ret;
 
-	ssi = devm_kzalloc(&pdev->dev, sizeof(*ssi), GFP_KERNEL);
+	ssi = devm_kzalloc(dev, sizeof(*ssi), GFP_KERNEL);
 	if (!ssi)
 		return -ENOMEM;
 
-	ssi->dev = &pdev->dev;
+	ssi->dev = dev;
 	ssi->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(ssi->base))
 		return PTR_ERR(ssi->base);
 
 	ssi->phys = res->start;
-	ssi->clk = devm_clk_get(&pdev->dev, "ssi");
+	ssi->clk = devm_clk_get(dev, "ssi");
 	if (IS_ERR(ssi->clk))
 		return PTR_ERR(ssi->clk);
 
-	ssi->sfr_clk = devm_clk_get(&pdev->dev, "ssi_sfr");
+	ssi->sfr_clk = devm_clk_get(dev, "ssi_sfr");
 	if (IS_ERR(ssi->sfr_clk))
 		return PTR_ERR(ssi->sfr_clk);
 
-	audio_clk = devm_clk_get(&pdev->dev, "audio_clk1");
+	audio_clk = devm_clk_get(dev, "audio_clk1");
 	if (IS_ERR(audio_clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(audio_clk),
 				     "no audio clk1");
 
 	ssi->audio_clk_1 = clk_get_rate(audio_clk);
-	audio_clk = devm_clk_get(&pdev->dev, "audio_clk2");
+	audio_clk = devm_clk_get(dev, "audio_clk2");
 	if (IS_ERR(audio_clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(audio_clk),
 				     "no audio clk2");
@@ -1063,13 +1064,13 @@ static int rz_ssi_probe(struct platform_device *pdev)
 	ssi->audio_mck = ssi->audio_clk_1 ? ssi->audio_clk_1 : ssi->audio_clk_2;
 
 	/* Detect DMA support */
-	ret = rz_ssi_dma_request(ssi, &pdev->dev);
+	ret = rz_ssi_dma_request(ssi, dev);
 	if (ret < 0) {
-		dev_warn(&pdev->dev, "DMA not available, using PIO\n");
+		dev_warn(dev, "DMA not available, using PIO\n");
 		ssi->playback.transfer = rz_ssi_pio_send;
 		ssi->capture.transfer = rz_ssi_pio_recv;
 	} else {
-		dev_info(&pdev->dev, "DMA enabled");
+		dev_info(dev, "DMA enabled");
 		ssi->playback.transfer = rz_ssi_dma_transfer;
 		ssi->capture.transfer = rz_ssi_dma_transfer;
 	}
@@ -1078,7 +1079,7 @@ static int rz_ssi_probe(struct platform_device *pdev)
 	ssi->capture.priv = ssi;
 
 	spin_lock_init(&ssi->lock);
-	dev_set_drvdata(&pdev->dev, ssi);
+	dev_set_drvdata(dev, ssi);
 
 	/* Error Interrupt */
 	ssi->irq_int = platform_get_irq_byname(pdev, "int_req");
@@ -1087,12 +1088,11 @@ static int rz_ssi_probe(struct platform_device *pdev)
 		return ssi->irq_int;
 	}
 
-	ret = devm_request_irq(&pdev->dev, ssi->irq_int, &rz_ssi_interrupt,
-			       0, dev_name(&pdev->dev), ssi);
+	ret = devm_request_irq(dev, ssi->irq_int, &rz_ssi_interrupt,
+			       0, dev_name(dev), ssi);
 	if (ret < 0) {
 		rz_ssi_release_dma_channels(ssi);
-		return dev_err_probe(&pdev->dev, ret,
-				     "irq request error (int_req)\n");
+		return dev_err_probe(dev, ret, "irq request error (int_req)\n");
 	}
 
 	if (!rz_ssi_is_dma_enabled(ssi)) {
@@ -1104,11 +1104,11 @@ static int rz_ssi_probe(struct platform_device *pdev)
 			if (ssi->irq_rt < 0)
 				return ssi->irq_rt;
 
-			ret = devm_request_irq(&pdev->dev, ssi->irq_rt,
+			ret = devm_request_irq(dev, ssi->irq_rt,
 					       &rz_ssi_interrupt, 0,
-					       dev_name(&pdev->dev), ssi);
+					       dev_name(dev), ssi);
 			if (ret < 0)
-				return dev_err_probe(&pdev->dev, ret,
+				return dev_err_probe(dev, ret,
 						     "irq request error (dma_rt)\n");
 		} else {
 			if (ssi->irq_tx < 0)
@@ -1117,50 +1117,50 @@ static int rz_ssi_probe(struct platform_device *pdev)
 			if (ssi->irq_rx < 0)
 				return ssi->irq_rx;
 
-			ret = devm_request_irq(&pdev->dev, ssi->irq_tx,
+			ret = devm_request_irq(dev, ssi->irq_tx,
 					       &rz_ssi_interrupt, 0,
-					       dev_name(&pdev->dev), ssi);
+					       dev_name(dev), ssi);
 			if (ret < 0)
-				return dev_err_probe(&pdev->dev, ret,
+				return dev_err_probe(dev, ret,
 						"irq request error (dma_tx)\n");
 
-			ret = devm_request_irq(&pdev->dev, ssi->irq_rx,
+			ret = devm_request_irq(dev, ssi->irq_rx,
 					       &rz_ssi_interrupt, 0,
-					       dev_name(&pdev->dev), ssi);
+					       dev_name(dev), ssi);
 			if (ret < 0)
-				return dev_err_probe(&pdev->dev, ret,
+				return dev_err_probe(dev, ret,
 						"irq request error (dma_rx)\n");
 		}
 	}
 
-	ssi->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+	ssi->rstc = devm_reset_control_get_exclusive(dev, NULL);
 	if (IS_ERR(ssi->rstc)) {
 		ret = PTR_ERR(ssi->rstc);
 		goto err_reset;
 	}
 
 	reset_control_deassert(ssi->rstc);
-	pm_runtime_enable(&pdev->dev);
-	ret = pm_runtime_resume_and_get(&pdev->dev);
+	pm_runtime_enable(dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0) {
-		dev_err(&pdev->dev, "pm_runtime_resume_and_get failed\n");
+		dev_err(dev, "pm_runtime_resume_and_get failed\n");
 		goto err_pm;
 	}
 
-	ret = devm_snd_soc_register_component(&pdev->dev, &rz_ssi_soc_component,
+	ret = devm_snd_soc_register_component(dev, &rz_ssi_soc_component,
 					      rz_ssi_soc_dai,
 					      ARRAY_SIZE(rz_ssi_soc_dai));
 	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to register snd component\n");
+		dev_err(dev, "failed to register snd component\n");
 		goto err_snd_soc;
 	}
 
 	return 0;
 
 err_snd_soc:
-	pm_runtime_put(ssi->dev);
+	pm_runtime_put(dev);
 err_pm:
-	pm_runtime_disable(ssi->dev);
+	pm_runtime_disable(dev);
 	reset_control_assert(ssi->rstc);
 err_reset:
 	rz_ssi_release_dma_channels(ssi);
-- 
2.39.2


