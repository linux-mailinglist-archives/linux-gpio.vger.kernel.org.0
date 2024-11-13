Return-Path: <linux-gpio+bounces-12949-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE959C70EB
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 14:39:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B96A41F2244D
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 13:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21476205140;
	Wed, 13 Nov 2024 13:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Sn9RmcaS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293F72040AA
	for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2024 13:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731504968; cv=none; b=Fb+Wh/ek4P5nMqZfSQLBVSOrMiqtOpHwarX3rYMdYWl39OSiRekTkQlZr++HKPkVGHQxhdbKWcpSwf5AMQDNoD4gwpOnjiz9ekCEegn09hWBOcj2cSEsMLYfQNLaDefzK25WRJ25JqzzhFAZcnk7KOrisEFhOEuEMKQSnYU/X2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731504968; c=relaxed/simple;
	bh=dJmFxi/XYSim2RdASfGpckOphjsM6InegciA9dIPVKQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KldwiyjgzBTNVJUkzDDTvlPtbGxqG0PtYQJZ0ZWYc1z2dZt7yVIHGUhXtl/CBXj27tYSzM9UazC8x3XuwbCWqQrOcsip5R+tX4gtRCqePyRS9dahRLucr5LCgEktXojT6bapG7ezGii8TTJd2tDq824cJTsyRYipH/cPOs5oRZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Sn9RmcaS; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37d495d217bso6185106f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2024 05:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731504965; x=1732109765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wRi48491gMOm4lIS/PpTnq0/Cq5SxV3TTLqC1PMh+ZM=;
        b=Sn9RmcaSko1DPVIPty9nti/0NNHCKU/R5qpEDxBLp3EADgN+05sh90kkZ/WnewGGSS
         UDixYNDdiRCn45s+aEr1W547yWxl5CmJ3W4vwWUatpJeOZCrYU3LyhaFIjr083LQxiPq
         lU+hJYJrg4VKSIjKdxQcso03xP9V1e/iOZMMtDKAzIH7Pdz5rK+inXKUp3TLpLoJ6AkC
         u/RjvKhsfHe3qzsCfr7tCIzQ4KIalciIfkK8WNXhkO+emlS50Zir8GveeWlwIFP6747r
         H7hnf2Nr7HHAimeN6tLED/Kd+C3NIzSmdaG5vfn7UhX6c1bror2YATmP+zBsXMuc4ZIf
         UJBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731504965; x=1732109765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRi48491gMOm4lIS/PpTnq0/Cq5SxV3TTLqC1PMh+ZM=;
        b=agwQH6vleZpELKuNNtTuOJ8hzmGDwGrqlTlzdwECnD40Hyxq9QbnoLxryaRxnOi99W
         dE4l/0Z9w11f9ImyyXhjdTHWlkDNxAgbIctZE0beGX+PGNvLMjxmCyz+xyuBuTG6tW68
         yODlK4zuGNNG01xb5A7/xB62MLxY0rLShLAWjueKJGBoY8Qeswap/raNxSQH6lQT94rf
         Q9JXALfq2BdvNQI3d+WwvYMpt/xp3y8Gwr+s8o6TDieU1kWPiA7pks9en/JFEfOV6jwM
         9S9uUQoMcXzJxxozJ1VQX46XY0oqwgJ1+Gxx/wFChOTKRlqfG+G4FM+rqYBDP2Fvm7LI
         Pxiw==
X-Forwarded-Encrypted: i=1; AJvYcCVC796WX4cipwxiEhx9AUc7aTyGiHGjXVKnpF+1XaXMxsSclJfvvSDXVm/CUrg6SEuSbuxc4tbXF+Xi@vger.kernel.org
X-Gm-Message-State: AOJu0YzmsAUhB2lbdD5t41Qu2/n+osvDS1LEX9oKfv1xzOEGO3AFrq99
	DxQekmsVllXAW2mCXFjOwqUML37C2GM7zaYFDm4+YreDjEfm8DXMvXnJmM3ByLI=
X-Google-Smtp-Source: AGHT+IEhme3hP10Mj4FLpm2uYfql8eXZjzA8iO0gRxt+QEncxuEJxi6BwwbDWP/PNDtpBtbagGah2w==
X-Received: by 2002:a05:6000:1543:b0:37d:95a7:9e57 with SMTP id ffacd0b85a97d-381f1866efamr21723054f8f.2.1731504965480;
        Wed, 13 Nov 2024 05:36:05 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d54e2f2esm25664165e9.1.2024.11.13.05.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 05:36:05 -0800 (PST)
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
Subject: [PATCH v3 10/25] ASoC: renesas: rz-ssi: Remove the rz_ssi_get_dai() function
Date: Wed, 13 Nov 2024 15:35:25 +0200
Message-Id: <20241113133540.2005850-11-claudiu.beznea.uj@bp.renesas.com>
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

Remove the rz_ssi_get_dai() function as there are already helpers that
can give the same output that rz_ssi_get_dai() gives.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index a359235b55af..4c33663a0ae4 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -162,14 +162,6 @@ static void rz_ssi_reg_mask_setl(struct rz_ssi_priv *priv, uint reg,
 	writel(val, (priv->base + reg));
 }
 
-static inline struct snd_soc_dai *
-rz_ssi_get_dai(struct snd_pcm_substream *substream)
-{
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-
-	return snd_soc_rtd_to_cpu(rtd, 0);
-}
-
 static inline bool rz_ssi_stream_is_play(struct rz_ssi_priv *ssi,
 					 struct snd_pcm_substream *substream)
 {
@@ -243,15 +235,15 @@ static void rz_ssi_stream_init(struct rz_ssi_stream *strm,
 static void rz_ssi_stream_quit(struct rz_ssi_priv *ssi,
 			       struct rz_ssi_stream *strm)
 {
-	struct snd_soc_dai *dai = rz_ssi_get_dai(strm->substream);
+	struct device *dev = ssi->dev;
 
 	rz_ssi_set_substream(strm, NULL);
 
 	if (strm->oerr_num > 0)
-		dev_info(dai->dev, "overrun = %d\n", strm->oerr_num);
+		dev_info(dev, "overrun = %d\n", strm->oerr_num);
 
 	if (strm->uerr_num > 0)
-		dev_info(dai->dev, "underrun = %d\n", strm->uerr_num);
+		dev_info(dev, "underrun = %d\n", strm->uerr_num);
 }
 
 static int rz_ssi_clk_setup(struct rz_ssi_priv *ssi, unsigned int rate,
@@ -988,7 +980,8 @@ static int rz_ssi_pcm_open(struct snd_soc_component *component,
 static snd_pcm_uframes_t rz_ssi_pcm_pointer(struct snd_soc_component *component,
 					    struct snd_pcm_substream *substream)
 {
-	struct snd_soc_dai *dai = rz_ssi_get_dai(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct rz_ssi_priv *ssi = snd_soc_dai_get_drvdata(dai);
 	struct rz_ssi_stream *strm = rz_ssi_stream_get(ssi, substream);
 
-- 
2.39.2


