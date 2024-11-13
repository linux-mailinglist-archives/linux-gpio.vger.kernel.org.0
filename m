Return-Path: <linux-gpio+bounces-12950-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D799C721B
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 15:03:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81292B2E416
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 13:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F3E2204F88;
	Wed, 13 Nov 2024 13:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="NRQTING4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02DF205127
	for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2024 13:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731504971; cv=none; b=celpk74G8gdEZYqag9M5Th5w/c7YrPLinDlVnxGSm6j6xOyMxoKGfD5N27YHGDiHtSU0b31FJgkGQ8kZ+T/pTbbLmvTL6pILV4F7xBbbvNptPwKe71DBcH71A6UcWOyifLBcZTd3CDMZZn+pKWO0ux703ZF9kODS3qrhyZ0YrEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731504971; c=relaxed/simple;
	bh=bcuv/Z+JYnKCJCaQbVftUSfcWAvwQCjEjjPAWiaXpwA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U8W0qJMHr6QSA1YM2tp5HY52SdegPtnmr2k8TICJTjiXuJzs2wVgQQALgei6OdtJVWp5Nn5jLfS9V/vDyVOvZYJTsyV8WEP3XNEd+CW3B6HPnEb25tUhMjIlwVINhsZq+PVo+BNBW06+nC9gVu9SrQpr6JZLhsCFIiE46bvJe6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=NRQTING4; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43158625112so61390095e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2024 05:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731504967; x=1732109767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+RYfRSDygLocWxmAowbtXVeeQBfySAofB4F1anuoVtA=;
        b=NRQTING4W/75DvhMpp867F4hwhqcnEG+/kaqxww1g3ucYbWeOXN54oxj/UCFfYc2Sd
         DfVirare+ecGUpaaZmJ6cooFCqBr3Ul/GU2Iw4Rd16byVoROcgd+lMKFUX1Xmr+QtHIH
         rbJwzOVWIPUDfdVPPpe+aJ+9TY6/4/9WmBI9+q3DorSEvOkz3azGOChI3RRIgSbyCtI8
         JNGVDPDnNDitCnBfV8ULrvw4XUruYVLw90Y69OH2FYqO4/W8bqGJCPRtRVS4x0T9rSUw
         PvqfV2FcjRl0aNX86q0yzCDF5LHbhxtgGutJLC7QG2XHY4+stbBmNxOm5GjsRnvkpPaB
         f/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731504967; x=1732109767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+RYfRSDygLocWxmAowbtXVeeQBfySAofB4F1anuoVtA=;
        b=BHLKTWlybuT/OWCvRC/gPVfcrkbzK5Qr+uk0H9IsCm4ha2NehgDF7KmCBfJjXQD8gy
         3wr68upmfgJ/xvAs1o0igG4817ExXp/nSFtotfHJv47TMJ8DudJDJ2tr1uR0V8KAnGwX
         JH4ofl6H+pmkLxim10fH1tjPz6qFPWkVnwGL8IPOmKIqEEXGLQr5dZ9dBPAi31/f/okE
         uGqAHZg0QXGySDM9Lv0aNZU0d4wx4+thehb1LsK2vP+Y5ib1NmTSwDW11Zyin/W6s3S7
         8arBAME6B9U2shIx535VnZTvvl1Xmp4In5O2p2C7oCx1QknnEICZjGEMT5FPYoV9l1K/
         GHHw==
X-Forwarded-Encrypted: i=1; AJvYcCXQsgAlV3MLJUUYkd/pcIUKxGQ/iBpUq6RICdGlGJqWCRJMEiy/l91Jaalaf+s7ru/Y+HsfNS8PTXBr@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+lPmQTh8Dv0VVoqFssOjGifE0ObqS2KFBXWFhQECiIoF78CmH
	Y2OXHylDzPdoTaDNJXAF9uOEDBto+fabmSKLL7P8/Br3JZRn5Wm7EQtZ0jMtYKo=
X-Google-Smtp-Source: AGHT+IGol4gxAbjDqjhagtSmjyPLmh4siEpgtwJ8dLnWMTnbAXoyvBEjm0wzQ1FNLexGNh9ce+2v5Q==
X-Received: by 2002:a05:600c:3b9a:b0:431:52f5:f497 with SMTP id 5b1f17b1804b1-432b7502771mr179603495e9.9.1731504967397;
        Wed, 13 Nov 2024 05:36:07 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d54e2f2esm25664165e9.1.2024.11.13.05.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 05:36:06 -0800 (PST)
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
Subject: [PATCH v3 11/25] ASoC: renesas: rz-ssi: Remove the first argument of rz_ssi_stream_is_play()
Date: Wed, 13 Nov 2024 15:35:26 +0200
Message-Id: <20241113133540.2005850-12-claudiu.beznea.uj@bp.renesas.com>
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

The first argument of the rz_ssi_stream_is_play() is not used. Remove it.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- fixed typos in patch title and description
- collected tags

 sound/soc/renesas/rz-ssi.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 4c33663a0ae4..f230d63339e8 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -162,8 +162,7 @@ static void rz_ssi_reg_mask_setl(struct rz_ssi_priv *priv, uint reg,
 	writel(val, (priv->base + reg));
 }
 
-static inline bool rz_ssi_stream_is_play(struct rz_ssi_priv *ssi,
-					 struct snd_pcm_substream *substream)
+static inline bool rz_ssi_stream_is_play(struct snd_pcm_substream *substream)
 {
 	return substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 }
@@ -337,7 +336,7 @@ static void rz_ssi_set_idle(struct rz_ssi_priv *ssi)
 
 static int rz_ssi_start(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 {
-	bool is_play = rz_ssi_stream_is_play(ssi, strm->substream);
+	bool is_play = rz_ssi_stream_is_play(strm->substream);
 	bool is_full_duplex;
 	u32 ssicr, ssifcr;
 
@@ -674,7 +673,7 @@ static int rz_ssi_dma_transfer(struct rz_ssi_priv *ssi,
 		 */
 		return 0;
 
-	dir = rz_ssi_stream_is_play(ssi, substream) ? DMA_MEM_TO_DEV : DMA_DEV_TO_MEM;
+	dir = rz_ssi_stream_is_play(substream) ? DMA_MEM_TO_DEV : DMA_DEV_TO_MEM;
 
 	/* Always transfer 1 period */
 	amount = runtime->period_size;
@@ -800,7 +799,7 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 		if (ssi->dma_rt) {
 			bool is_playback;
 
-			is_playback = rz_ssi_stream_is_play(ssi, substream);
+			is_playback = rz_ssi_stream_is_play(substream);
 			ret = rz_ssi_dma_slave_config(ssi, ssi->playback.dma_ch,
 						      is_playback);
 			/* Fallback to pio */
-- 
2.39.2


