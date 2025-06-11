Return-Path: <linux-gpio+bounces-21309-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45003AD4B29
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 08:16:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8D213A6AAC
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 06:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E514234963;
	Wed, 11 Jun 2025 06:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uxPT9g/k"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A8122B8AB
	for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 06:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749622486; cv=none; b=bL2tnXuM5B66ayGibbG2rRlyGMWVEwDsis4kmxqAtBoITF+rTAyBY2nCswYsFvY0GDNpBQHmRytTY27VLHbE3NrNcFaLgpysLt+aR37cDzULmOpJ3R12riN2PT2wf300gMZUDJML+us2p+TyJtUsJQaHMjQ5tYIpRE9jDicfzNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749622486; c=relaxed/simple;
	bh=oujbO0vd7z9+7S7Dumee/cfvfloJlAjLJrEg6CF9wFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N98qtfm2p7K5wj2vnUNqB4MK5gUwdZbZ4KhWTU4MueF9mPszRhDBienXZdtu67gkj0nQvjw2IZw+SIsZpb15uq/kH44GrlQOwZoSK3PQs2/DGTJXePwaCYYF9bXY94av+sJ2cXOMt5m7BkEaOivo6qXnS4IJKi5LS75y8hd1JyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uxPT9g/k; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a4ef05f631so25003f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 23:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622483; x=1750227283; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hsgXI4B2PtLxGVvjlo+6E+TN7UEoR/brseumFotN0IU=;
        b=uxPT9g/kFsr/I2IysrNdxCOVn9RqTIle+djugI1QT555j0aXu25rbghZOO1zX723XM
         A5ORDfNCPIrsO0IfBd8RQZtH1DPYf/SDobAL9XU/MUD4eoBPKrMFy4WzGuk9FEZka3X0
         f9ZYQ0Uzejr5yhFuR4R/gskWYOpdrnNDEeS99Mmg2finlAsvlisi5dgs6/S/QGTi0PkA
         F1YXk4QkkA810KdcwduSsz59I82hH1LINMa8KAS2ED/WJUMf2iTmvfxuatnnnfnm727H
         UuSIKWbMwT0Vmt7NrDUDX7H3tZAocu+TJ/9/X9jYFdQ8jt7G4v+Lvg8O3soOdhoWBShQ
         Pu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622483; x=1750227283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hsgXI4B2PtLxGVvjlo+6E+TN7UEoR/brseumFotN0IU=;
        b=BwOwfsUVvEaU8bbsrkgzZwDBR3g7VALClRz9jedqj2boPPoAlITuTZKUeOqcx+USbU
         MseF585Ie5Sok3xlnGb+iNzwRnvXDLo49S6RkofEO+ix05ReTiHY9q1O5A4YEMzy4UZL
         xqIycIR3iL2tLrBjAi38pzUQ9yPEJuh+I7ty7TCZnFeljQQLQ51MEbq6aXGdiLOMAUZA
         sl6LWtukUN6qTsWlW7v0WDTM+T1/iLKQSb1zJUeJ2EAw83G9HV41PewzGE3oSYuEKf/d
         3RtQpL3nBBQXl1FRZJtYStneoEzlmoJ+6KltM/z6OI60+DZT50iBXvJm4QAIkW4hvx4P
         +JEQ==
X-Gm-Message-State: AOJu0Yygm39nM51LzDIZAAPHPTkZEhqO/sVboVfUSiJkABF4zwMPb5OG
	/Ojw7D4BcM60IQ8yQRJ+n77+5dO5rYni6KRzg1vi41QRaHhgiQr4VKhPNpD60BUxSbjxPXGX83c
	XM+DT
X-Gm-Gg: ASbGnct8cYr/iGMDSadJbvlj+5P1p8CaADPn53IubJwAnnaWnSVLVNs+6FDtuY8UpDT
	3jDpC4zdBAjDmc37Yg0aL9FAaYQeVRshaDWiyPMMzN49C/nG0XznzjZcVSmthWVOjevjmW0Q2Ck
	pb/rYyjtPn/XkhIpTl47uP/MTNMR6iVNh3clSPf/UpD6/D1Cs3rsaXohze1M0YtxYBnRMcZbXIX
	SVrHItjUrbKVouPpN7Ia9vJGdDz0+silMOv0nMTzgjA8uYcQ+QFM6mJIOk8AWOPMWlS36N8jDJe
	Xh7PAd48CRp0ee8jshutluM81tDuQJMdEzT/6HStcfGxzAeqZRZJrJU33GKhoAbyh3P7lfndc05
	HLpb8k8A=
X-Google-Smtp-Source: AGHT+IFLtmW6b7D9+O2NLZ8hADlUJWZ1Zra0CDRSmw1bBjFKMHIhCxju9chZEeLj/rRLY7C0uzCZNw==
X-Received: by 2002:a05:6000:40c9:b0:3a5:22bb:8b41 with SMTP id ffacd0b85a97d-3a5586c6283mr512971f8f.6.1749622482841;
        Tue, 10 Jun 2025 23:14:42 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:14:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:41 +0200
Subject: [PATCH v2 09/17] pinctrl: bcm: cygnus-ns2: Move fixed assignments
 to 'pinctrl_desc' definition
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-pinctrl-const-desc-v2-9-b11c1d650384@linaro.org>
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
In-Reply-To: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, Damien Le Moal <dlemoal@kernel.org>, 
 Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
 Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
 linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2076;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=oujbO0vd7z9+7S7Dumee/cfvfloJlAjLJrEg6CF9wFQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6mfuZb7tQiO77XcefLLGrVblzxwrSovVkXX
 cwivTfGRymJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkepgAKCRDBN2bmhouD
 11HiD/4xfmHoNJDh/S3CTGyURdVO6HJ20Md3oC9K4sMgDqvNeAzwsNayXPh8CQBqxZrfrPtfTEe
 EKJouf9bclFwhb6t7Z+x4Es2OUbtNyIKSqtw7R3vlMtw96fS+499jkyjprTViJtSFMpSo96VYuK
 BN5NaTb+P6TYsoop5UmihTuguxkVBH8jl/aasttq5TSupl67L3T67CDxwwZ42gZT8mImJvH94aJ
 OUaV/cRxEBTcOSurX9xTvFzKS6sSdilSEQHYvTDt05U1fZ7B4FRiNdQf0zYovRIT4FQopoXPh7l
 kMW3Mx8XWrjuWUb3v55s7eohdKrymxUnopB+/tTpjd1LwdZPdVR5yLrlO8CReZHJaJ3erKp+3Fk
 sEHN3AK4RtYIjlUM+o/3V/eGhwdUqSSml3pFKNEIePrZ5SZQGzTBbjQFfBroRKa0yrKKzRvKD7z
 0wgIMguwbM8Iz6ynYPcO7YB0Ao/ugOxLGbP0PYjn94OFTWxINL5wpl+0ly+zsGAhMRxcWhmKvWS
 2ziJK2Xd8WxHchwpTv1vk2Z71cDm6mQWuzLUHbDGcbsPuKrXblGw+ujIpW4FOo/8OrhQjAXpBz+
 MHBHNsoSYjVI+Nn9wm0liTIbSji44ugG2ZEZyX2gqMIDf6qzqfrXGE4SSBlOScO/SxFfdugKToh
 vqoClCRF0JCU/og==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Assign 'struct pinctrl_desc' .npins member in definition to make clear
that number of pins is fixed and have less code in the probe.

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-ns2-mux.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
index 04f4fca854cc05c6ccc75fbcb640b18fcfd37453..23ab3ab064b6f2b0aaa15afd6b9c582f1a1256b2 100644
--- a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
+++ b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
@@ -971,6 +971,7 @@ static struct pinctrl_desc ns2_pinctrl_desc = {
 	.pctlops = &ns2_pinctrl_ops,
 	.pmxops = &ns2_pinmux_ops,
 	.confops = &ns2_pinconf_ops,
+	.npins = ARRAY_SIZE(ns2_pins),
 };
 
 static int ns2_mux_log_init(struct ns2_pinctrl *pinctrl)
@@ -1026,7 +1027,6 @@ static int ns2_pinmux_probe(struct platform_device *pdev)
 	struct resource *res;
 	int i, ret;
 	struct pinctrl_pin_desc *pins;
-	unsigned int num_pins = ARRAY_SIZE(ns2_pins);
 
 	pinctrl = devm_kzalloc(&pdev->dev, sizeof(*pinctrl), GFP_KERNEL);
 	if (!pinctrl)
@@ -1060,11 +1060,12 @@ static int ns2_pinmux_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	pins = devm_kcalloc(&pdev->dev, num_pins, sizeof(*pins), GFP_KERNEL);
+	pins = devm_kcalloc(&pdev->dev, ARRAY_SIZE(ns2_pins), sizeof(*pins),
+			    GFP_KERNEL);
 	if (!pins)
 		return -ENOMEM;
 
-	for (i = 0; i < num_pins; i++) {
+	for (i = 0; i < ARRAY_SIZE(ns2_pins); i++) {
 		pins[i].number = ns2_pins[i].pin;
 		pins[i].name = ns2_pins[i].name;
 		pins[i].drv_data = &ns2_pins[i];
@@ -1075,7 +1076,6 @@ static int ns2_pinmux_probe(struct platform_device *pdev)
 	pinctrl->functions = ns2_pin_functions;
 	pinctrl->num_functions = ARRAY_SIZE(ns2_pin_functions);
 	ns2_pinctrl_desc.pins = pins;
-	ns2_pinctrl_desc.npins = num_pins;
 
 	pinctrl->pctl = pinctrl_register(&ns2_pinctrl_desc, &pdev->dev,
 			pinctrl);

-- 
2.45.2


