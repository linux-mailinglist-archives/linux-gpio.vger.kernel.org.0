Return-Path: <linux-gpio+bounces-12957-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC719C72CE
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 15:10:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 82B96B2A9BB
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 13:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9995D208230;
	Wed, 13 Nov 2024 13:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="eplX5dRX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1059720822D
	for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2024 13:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731504985; cv=none; b=drs5parUYuTdvFX2ihnBQxxPrGGxFmR7MDjSZeTvWGypkIn1qYv/X5QeGe6JhbXnD++D+53bt01P+fChZxGN/r4bBCCMTpuEWQih/plD7b8ulqbMDMEPM1CBAMODrirIdgsSTnpNPDAZUMJDvCKC6E2IQ2D6/vMf3W9ZbfR3rQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731504985; c=relaxed/simple;
	bh=Vhh9JPSw9eNAHj3nanurhEISK2PasiE7mlzeDmZn/yg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lTCOrR6LSAvopBJC/lidQIxrNQPbeCGTS96z0Bn0HmGbUHhQBUlw4ACA/6eJUy3uJHpPCaUJ5oB8tSRy80bS5gtW7+SFbRzgbQgyeewHDuls1qeBhgDPND8UhmwYJVQcVsc2L7bEggRVyfBicbXb5gXt5imuKjT5JuhSnnOn4VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=eplX5dRX; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4315eeb2601so85877085e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2024 05:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731504981; x=1732109781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iAOEIREwEdqpb0AhX4IYBRCtf9AeRSdlB8XXG7E1jtA=;
        b=eplX5dRXp3gd2gkkMXnrdBOWM2Fuk+h+33jYEmc3zjskxlAN0J05DwVne5bmCwW2gG
         wt3RUnrCeaUQSSbphPS7kQVwsMsxU0tHmTE5bcuPmTeBthMOxTadc+5/7dKWvp1XCGPe
         iNTI8TiNAklr2/cXqBIO3aihaZlyyfbBjOpZ9hkLBhfpwJTdqaNpxtdwC8xII2hvvTu+
         p/r4z10pt/QnHa0IfUdutrR+xMjIFBYOVipZeJrIPlniYKBdQsquPmmXSMSj9JiJfrG7
         KTWalF1bYeIQ0unQJoZM2MskiJwtaF8PfEQr3sdfV/2zNlhnvWNQSLgG0FH7mRNW7JYD
         cvuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731504981; x=1732109781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iAOEIREwEdqpb0AhX4IYBRCtf9AeRSdlB8XXG7E1jtA=;
        b=VNNooeDN11yBV7jbBWo3m5Po4Qx7jj7gHyqrmNA8YhJ7YURlyApw6W9XbVAOef+PXr
         r9QE0WCIMGozc17bmbj1aY/tAFNWaIiwQen+pc61NcRMIPvvpyx6E5ko0i2ubzpcprJ5
         yty3zT88NplQ8QBeQSPmq0yrQmkOOrvsIUTtcx6g26DBoYqNu2hfb0OR3B8QpYpUcFnC
         /UXHrsN2BjUmiNWgrTk9ATE4vZxGrwoKQsPD7t32+Svoa9C8wqXwHbyB8P9m4e7+iOz8
         tVE6/b2RI+rM4asSEKdPHzB3qSaUHSq/VyMCZidGOJKzQKUpUzF0cMSv9xUvhbZWEX40
         sxcw==
X-Forwarded-Encrypted: i=1; AJvYcCWwn8d4DgSXJHwppdymrIYyT0V1wtBb2XlUs9qXwvUn9Q4RcFCbWWnx68TjZnwZD8jdtslHAgpqrtOi@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/R0lN6XWqQH670j7UvftMK12FOoJxNrTkQaPs+Q2flSeD8Szv
	wXZKijaHF7lPaLU3KTilN7Xgsb1dpUYS/n/Z0M1tQn1YZew/7zYcPm6fN2/BUqU=
X-Google-Smtp-Source: AGHT+IEOPGVzy3X2k51t+J6BKF8R/FUs7gMcGHvLNRCrb8EAG9aw6XFViwbx8eXYgzrcm0FYBdz3Xw==
X-Received: by 2002:a05:600c:3b29:b0:431:542d:2599 with SMTP id 5b1f17b1804b1-432b7518d17mr216963245e9.22.1731504981472;
        Wed, 13 Nov 2024 05:36:21 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d54e2f2esm25664165e9.1.2024.11.13.05.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 05:36:21 -0800 (PST)
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
Subject: [PATCH v3 18/25] ASoC: renesas: rz-ssi: Issue software reset in hw_params API
Date: Wed, 13 Nov 2024 15:35:33 +0200
Message-Id: <20241113133540.2005850-19-claudiu.beznea.uj@bp.renesas.com>
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

The code initially issued software reset on SNDRV_PCM_TRIGGER_START
action only before starting the first stream. This can be easily moved to
hw_params() as the action is similar to setting the clocks. Moreover,
according to the hardware manual (Table 35.7 Bits Initialized by Software
Reset of the SSIFCR.SSIRST Bit) the software reset action acts also on the
clock dividers bits. Due to this issue the software reset in hw_params()
before configuring the clock dividers. This also simplifies the code in
trigger API.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index d0e2665ec830..10dd973a1c85 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -388,6 +388,15 @@ static int rz_ssi_start(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 	return 0;
 }
 
+static int rz_ssi_swreset(struct rz_ssi_priv *ssi)
+{
+	u32 tmp;
+
+	rz_ssi_reg_mask_setl(ssi, SSIFCR, SSIFCR_SSIRST, SSIFCR_SSIRST);
+	rz_ssi_reg_mask_setl(ssi, SSIFCR, SSIFCR_SSIRST, 0);
+	return readl_poll_timeout_atomic(ssi->base + SSIFCR, tmp, !(tmp & SSIFCR_SSIRST), 1, 5);
+}
+
 static int rz_ssi_stop(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 {
 	strm->running = 0;
@@ -782,14 +791,6 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
-		/* Soft Reset */
-		if (!rz_ssi_is_stream_running(&ssi->playback) &&
-		    !rz_ssi_is_stream_running(&ssi->capture)) {
-			rz_ssi_reg_mask_setl(ssi, SSIFCR, 0, SSIFCR_SSIRST);
-			rz_ssi_reg_mask_setl(ssi, SSIFCR, SSIFCR_SSIRST, 0);
-			udelay(5);
-		}
-
 		rz_ssi_stream_init(strm, substream);
 
 		if (ssi->dma_rt) {
@@ -914,6 +915,7 @@ static int rz_ssi_dai_hw_params(struct snd_pcm_substream *substream,
 					SNDRV_PCM_HW_PARAM_SAMPLE_BITS)->min;
 	unsigned int channels = params_channels(params);
 	unsigned int rate = params_rate(params);
+	int ret;
 
 	if (sample_bits != 16) {
 		dev_err(ssi->dev, "Unsupported sample width: %d\n",
@@ -940,6 +942,10 @@ static int rz_ssi_dai_hw_params(struct snd_pcm_substream *substream,
 	rz_ssi_cache_hw_params(ssi, rate, channels, strm->sample_width,
 			       sample_bits);
 
+	ret = rz_ssi_swreset(ssi);
+	if (ret)
+		return ret;
+
 	return rz_ssi_clk_setup(ssi, rate, channels);
 }
 
-- 
2.39.2


