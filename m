Return-Path: <linux-gpio+bounces-12597-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 380909BE075
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 09:22:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E34C31F24AC3
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 08:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC90F1DD553;
	Wed,  6 Nov 2024 08:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="c0vUaQyX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7447F1DD860
	for <linux-gpio@vger.kernel.org>; Wed,  6 Nov 2024 08:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881184; cv=none; b=DVCzI+2M5Z7U1Hn3WEWc58UqT2B3BHA3jcI41nUYQ8xlyth63JNXXXLWPX3DSt5SQtjg7fdcZM6hSHK/QV1t3xmZ3n0xlE79qtkchH8ePe+68EgDRs4bP2uKJyX8cNfZhiPiqdxFlMixywyY2mPHlRIfU+g0g8AHy9p7v5qtknI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881184; c=relaxed/simple;
	bh=IlzV64fO6uJJh1hPPD4D3vMSSZyX+CrHtv6dOm87frE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bOuR4pZYQ3IPXecTtPUnPLj2m43py2feSz3hlLvfBAH8hMF6aiqsojf4SF++ynYLzQEkyKdyGVJFNZOv3dlVHGa/GWqQUWluKZZ7nNvpkGYi7Pv86ZLDsdhZaSYr74KAtl2EC84GwHdiigUVGdLlVLbuO1geLLy1HWujdC2fz0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=c0vUaQyX; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a9eb68e0bd1so196719566b.3
        for <linux-gpio@vger.kernel.org>; Wed, 06 Nov 2024 00:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730881181; x=1731485981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WXOsXWAMtSTYQ212z41y5UW4GbeVT2rMx2mc46WkYEI=;
        b=c0vUaQyX3V5FBzzZi91qgokwG1J93OwklQl3eRM41mBrOknD2MovgJsyobtRcsJwTW
         rVeYewVNe+CVNox2GwdYEbvuSAivCBD/dbCmJvVkU+9xDEkvWPmuOHnPFZEar3ytXHxu
         G1SjT5zci2M+tLekZKdl/7Da+dceovjaCK/nDloDOWGodf3tiNqswPLMLNK/3KMCfPLg
         Mm/v1IeC1c9onaxk732N2s9ixNcnGzbfYZ0Aviu45Z9/rrdX4T6w7ZEclhr9YaY9cNu4
         18mW1aJZu9f3bWZjdfrZ2z6DnScnl/rpRa+FCfAUFT6JZJfYZh5NJsypzPjQ10s7vUZJ
         hvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881181; x=1731485981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WXOsXWAMtSTYQ212z41y5UW4GbeVT2rMx2mc46WkYEI=;
        b=PZUs8Wlk8DRYTG/F+kpdinT9vUnVz7/LABwlFECQERQN+uVN+0GkfSGEVIXrxMLqB+
         a0YAU6sPuO3CndUOau+mp1XWEeMDuFeE3yF0cboIGhZSc6DVACnJH4blZZuZ/twD5Lx7
         ElQ0Hs9jzv8u0pToDQVnybjouEWvEw++DOlqvpUa6yB1ZKXjSmRRXZbmUJUd0y99eZXP
         fhT1DUtjv8fqON42mcL8LMqlMhHgyRpfdmsR/t8yZHP7PSSA4OhoFVQDIFC3plCkW8LX
         KfSm/Ad65AUiUDyCDb7rKS04uopOzhUV7tupr+oZkvWVZ57d3AX0zUZCdTSuWNtxAb5l
         uf9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUQPxUEuQn14fXhHpu6HbhcfgoGq7HHkc0FALbkkdJVPJshV2Lg6FeqfwKpopasSE0LsXIAf378G8qT@vger.kernel.org
X-Gm-Message-State: AOJu0YyoU8bQlEEQ9HvlAZRWGpTGq0xWvl2WSFsoOrYeHmSkeL0fV0Q+
	pYenDn7H0uS4LY//w+Vj6e6MMs4LDgXDh0F3HqQzDPAb2ZG+Oj8dlBIVS9/K/uU=
X-Google-Smtp-Source: AGHT+IGI82+/kvSoBV/R5AWe4VGlMpF8Tsx2W6U8jW2pq8WFOPcu/x4sZis0FCEsyVQt0Dr9l3s0EQ==
X-Received: by 2002:a17:907:2d10:b0:a9a:1115:486e with SMTP id a640c23a62f3a-a9e655b9327mr1846201166b.45.1730881180836;
        Wed, 06 Nov 2024 00:19:40 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a2dbcsm241369766b.40.2024.11.06.00.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 00:19:40 -0800 (PST)
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
Subject: [PATCH 12/31] ASoC: sh: rz-ssi: Use a proper bitmask for clear bits
Date: Wed,  6 Nov 2024 10:18:07 +0200
Message-Id: <20241106081826.1211088-13-claudiu.beznea.uj@bp.renesas.com>
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

While it is still correct to pass zero as the bit-clear mask it may be
confusing. For this, use a proper bitmask for clear bits.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 sound/soc/renesas/rz-ssi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index f230d63339e8..47b82fe549ac 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -331,7 +331,7 @@ static void rz_ssi_set_idle(struct rz_ssi_priv *ssi)
 		dev_info(ssi->dev, "timeout waiting for SSI idle\n");
 
 	/* Hold FIFOs in reset */
-	rz_ssi_reg_mask_setl(ssi, SSIFCR, 0, SSIFCR_FIFO_RST);
+	rz_ssi_reg_mask_setl(ssi, SSIFCR, SSIFCR_FIFO_RST, SSIFCR_FIFO_RST);
 }
 
 static int rz_ssi_start(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
-- 
2.39.2


