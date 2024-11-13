Return-Path: <linux-gpio+bounces-12954-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 708D79C70FA
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 14:40:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24FDD286611
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 13:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1DE2071EA;
	Wed, 13 Nov 2024 13:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="lycCngBI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E802206E66
	for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2024 13:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731504979; cv=none; b=XFMLh8zm3QzAott8sZz0rG5XiDGlSHgFN8rn94cFwfU+uHPE3p2hQiFMdwGFH8zuNgpMutQQ4thzZnR9Ir+yLvYlvDYhtXukdKEoTDvAbjoDlJ8fP6ab2TK4L3q7V/5ZIxfy09/k9abj0MDMe0cd8AHOO4G2HZyQ0UWJ2WDkYJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731504979; c=relaxed/simple;
	bh=Hb+vwu3in96zGGIqIx/aQip48C7Np65T0IXGvehWm4Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OdXpntKXlmS8ab3ns2HztHc+yQ3KSDVANl/JYQ/IDiEswSK9XHjsuhfAK9oSCGZknQr1GhppP3Ht7uV3jQAX1VIcjEdBYFyS04LPzNeN+CRxkSwi/L+1ZMt7wdK2IC23Sj5VBU5z0qO2oJ1hPprxbFEd2aXF+wT8ojjfrJFlzjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=lycCngBI; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53da353eb35so356051e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2024 05:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731504976; x=1732109776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rm8JuVgQ7iKPfViIiadsm8ecEHZvGTd39nDcvF7dJ0=;
        b=lycCngBI/2MkAypiG6kFwQxZ3SkwNWftjwCTjM9lHrHDrMNKNEU8R3zCkbRcKNhGhp
         vmXLyhdgCIoCOQXneSIwS11AGZ7vcy5vRptQbDq/YR7X9D8Dtgln11mZ4XQv1wmO82oD
         msRZzuo1yq6UvJ+55WDluGSucU14wvdre4feDrwUni5VL3Zor4ZoA965iItkaB5ozGrT
         vJs34z75pwdXDTDZW5pnhKv9S5dWX7Qwbrc2ZP88HgFVZXgIN9jEnobW8o1Lcj3tV3V5
         6sE9Hyv8paE2LEyjR4l6MNYSQ/gkpM4osR+mMjRO0oCtOGeNhU7YwidLUK42uXxI3N4k
         rDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731504976; x=1732109776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0rm8JuVgQ7iKPfViIiadsm8ecEHZvGTd39nDcvF7dJ0=;
        b=Z2bWt4rzJ6C9BarMGFFfISma5yfw07BqvsH7nsv2AQrYNalT1IMb8ychI4iKFErGxU
         Oftn9c3CQL51J9VexNdIQ0OHQKSzy7P7suvKQCRwRzKAinW/6B7LA7AOzdVUMNgyoOoy
         LtLKjCJhNfYU1lZxUpgIPH111EZICjpwBfwx2Urm3b2KNShjgXzefHTB6j7Awcb/OZlA
         b9zGrFCqdgZ12gTDPDJ25sQP9JbLsye4COXenByRZsDpMS3IPRGc5QCiDudNCkwMceWb
         VzZriJjJfwF3wPUVfrhE0ISoLH2aKU4U99Lf90WXI3b4ocVAidAqTeuZbEZCvHzkhic6
         aPsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKZbtMSPCnxolbnfL35OWlT8raG8Gi+nnzqKxQHVQIqX2hG1PG9HzD7rjRtlpSULpBHI4c92OIg6qb@vger.kernel.org
X-Gm-Message-State: AOJu0Yym6ONkvxyKuqHbGmYQB4KveFTj1fBYl0w5oXnM0V0/ONxTAbwT
	KgR1k4tDG99RTVncjqncjhmlKNrkku9nd9mY865ErjmXJapwUqVsgpxrFd1jvJQ=
X-Google-Smtp-Source: AGHT+IEnvTVlqiO6GIBm7lampTt9bPx2RUwGdovCKknaCN6PZBCzx+SyTqmg5qzcSMj7gEWzB99BNQ==
X-Received: by 2002:a05:6512:39d4:b0:53a:bb9:b54a with SMTP id 2adb3069b0e04-53d9fee1ff7mr1607071e87.48.1731504975767;
        Wed, 13 Nov 2024 05:36:15 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d54e2f2esm25664165e9.1.2024.11.13.05.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 05:36:15 -0800 (PST)
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
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 15/25] ASoC: renesas: rz-ssi: Rely on the ASoC subsystem to runtime resume/suspend the SSI
Date: Wed, 13 Nov 2024 15:35:30 +0200
Message-Id: <20241113133540.2005850-16-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The ASoC subsystem takes care of runtime resume/suspend the audio
devices when needed. Just enable the runtime PM on the SSI driver and
let the subsystem runtime resume/suspend it. While at it use directly
the devm_pm_runtime_enable().

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 4af381f6d470..35172630be8b 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -1140,11 +1140,10 @@ static int rz_ssi_probe(struct platform_device *pdev)
 	}
 
 	reset_control_deassert(ssi->rstc);
-	pm_runtime_enable(dev);
-	ret = pm_runtime_resume_and_get(dev);
+	ret = devm_pm_runtime_enable(dev);
 	if (ret < 0) {
-		dev_err(dev, "pm_runtime_resume_and_get failed\n");
-		goto err_pm;
+		dev_err(dev, "Failed to enable runtime PM!\n");
+		goto err_reset;
 	}
 
 	ret = devm_snd_soc_register_component(dev, &rz_ssi_soc_component,
@@ -1152,15 +1151,12 @@ static int rz_ssi_probe(struct platform_device *pdev)
 					      ARRAY_SIZE(rz_ssi_soc_dai));
 	if (ret < 0) {
 		dev_err(dev, "failed to register snd component\n");
-		goto err_pm_put;
+		goto err_reset;
 	}
 
 	return 0;
 
-err_pm_put:
-	pm_runtime_put(dev);
-err_pm:
-	pm_runtime_disable(dev);
+err_reset:
 	reset_control_assert(ssi->rstc);
 err_release_dma_chs:
 	rz_ssi_release_dma_channels(ssi);
@@ -1174,8 +1170,6 @@ static void rz_ssi_remove(struct platform_device *pdev)
 
 	rz_ssi_release_dma_channels(ssi);
 
-	pm_runtime_put(ssi->dev);
-	pm_runtime_disable(ssi->dev);
 	reset_control_assert(ssi->rstc);
 }
 
-- 
2.39.2


