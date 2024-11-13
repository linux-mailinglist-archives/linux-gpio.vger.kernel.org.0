Return-Path: <linux-gpio+bounces-12945-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 243EB9C70DA
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 14:37:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCD211F223A8
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 13:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B22F0202631;
	Wed, 13 Nov 2024 13:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="rPzztnyQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5926320262D
	for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2024 13:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731504961; cv=none; b=meOwMwE5MzvR0/GpMKxo3mAN9LSJseIvRsx2GS+X3zVJZaMqc6utOMwfVMx8nLlpPBcoJlsX1DVowWjW1N5D1IL9CjIldNm6y5nyDLOmNsRTdgJeamQ6wU78abK6H9oabXZlsLs5pHPF/vd0DonKFCNO/UAM0NoOjg60olCB3y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731504961; c=relaxed/simple;
	bh=MN67nAF+CszefP3gr8RMGEznclhS5zNcjbkW5w4l35Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YPEOpubfZ4kxCCq6qdtqNQEgf3YdV9vuV4YrGY9BjOwzkWn1MZYNDQqV2Mkvw1ixcNNVuCaerx7YUopsQkpOXJhilOhyiz6/8v74DjPNOcTeiuHiJS5Yrc4I/yU7bKXXUr56e+qwcyj8BB1sLwMSnh+S8DDN0DuGyoUNM9tkDGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=rPzztnyQ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-431616c23b5so4748995e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2024 05:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731504958; x=1732109758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1OvTZSeNAGKIV1seMePes99WD5Hn6Ptwq+/QcTfM4OA=;
        b=rPzztnyQnWc53nQPqtQRzK30csntTKsCs8KwjXCgnVLwhrO+qHUdSv3F26A+Fbxu+P
         pmHX0jNSaRXVxCtUq/z83LmReidtEGaAW0hLNcl36DXY6CZwuOAml+ctZnYN3F6K+1/N
         nwPl4HiqDotbA6mcaz29gp1Ue4RD/OzySFWM/qDDx6L285B3hsEqY7pmjN32E+VGl42s
         +FxLteK8tfuja9au5F9VRH35Gs7MN8Csg3gDksHz6y1BqImDZPBswbcIgrBc2+9UGzES
         zPKtQQjmcJ3NRX4xI3pNtxNw559M5gIVXS1cABqNN7kmWWGu9OtWBBj99DwsbAN3Xg5e
         PqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731504958; x=1732109758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1OvTZSeNAGKIV1seMePes99WD5Hn6Ptwq+/QcTfM4OA=;
        b=iZ21Lwmrryy6G8fGD5W1SLc6Y3asYBp54P6GKYrlS72GdHX1mex2rmHN/lmluvLyF6
         fOVg79KGWjSkYUXoj+YpPPAq3D++MTG1lmbGFHteGM6ZGIn6sfJwyZzb98eN3mxiLZAi
         pxlEtL/OrVpuzsKzY9j7fFo6wRo/ur9K19zK7V5Qf3N/uHVVFgaixK2R3s/VupuB6s2e
         Dt2tC5KTccFBFaDJM65fmjYkpy/j2Sz8x0Vglm2iS6IV8oA1rf3UWvMjTqb8+Pw3J0Gt
         TI+eHl3fMqN9UlXh4X05nH5ANcvf1YC/VqtUUPGIjNC9QLA7eAG5fhQwLDyvI0Wn7yEx
         n3AA==
X-Forwarded-Encrypted: i=1; AJvYcCUA5Zh2uN108jQuBvQ2xlmzuD1giSlahKkojUthdjJgbBuqneMugffK1QXXZA/TPGLLfWQyFPUPw23m@vger.kernel.org
X-Gm-Message-State: AOJu0YyBFun4MVOcsQKXDceYVOKBcb/Y8vd2Lr+aHCPixK4vE3egssZQ
	lJuea2IVa64sm5hYOjA5K1IGgWwRJboWBmphqRcLYdex/1ZuMNWm1M1AvGeSyk8=
X-Google-Smtp-Source: AGHT+IH0MgOpNYoww+cJhT91aFWRPXzfgZYVlvmgv7xhY7iMIMEQpgepNOVaV+LNO6p7EhOHTMdqGw==
X-Received: by 2002:a05:600c:3c9d:b0:431:4fbd:f571 with SMTP id 5b1f17b1804b1-432b74ce199mr179115085e9.13.1731504957851;
        Wed, 13 Nov 2024 05:35:57 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d54e2f2esm25664165e9.1.2024.11.13.05.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 05:35:57 -0800 (PST)
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 06/25] ASoC: renesas: rz-ssi: Terminate all the DMA transactions
Date: Wed, 13 Nov 2024 15:35:21 +0200
Message-Id: <20241113133540.2005850-7-claudiu.beznea.uj@bp.renesas.com>
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

In case of full duplex the 1st closed stream doesn't benefit from the
dmaengine_terminate_async(). Call it after the companion stream is
closed.

Fixes: 4f8cd05a4305 ("ASoC: sh: rz-ssi: Add full duplex support")
Cc: stable@vger.kernel.org
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags
- use proper fixes commit SHA1 and description
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 6efd017aaa7f..2d8721156099 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -415,8 +415,12 @@ static int rz_ssi_stop(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 	rz_ssi_reg_mask_setl(ssi, SSICR, SSICR_TEN | SSICR_REN, 0);
 
 	/* Cancel all remaining DMA transactions */
-	if (rz_ssi_is_dma_enabled(ssi))
-		dmaengine_terminate_async(strm->dma_ch);
+	if (rz_ssi_is_dma_enabled(ssi)) {
+		if (ssi->playback.dma_ch)
+			dmaengine_terminate_async(ssi->playback.dma_ch);
+		if (ssi->capture.dma_ch)
+			dmaengine_terminate_async(ssi->capture.dma_ch);
+	}
 
 	rz_ssi_set_idle(ssi);
 
-- 
2.39.2


