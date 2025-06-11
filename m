Return-Path: <linux-gpio+bounces-21316-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0ACAD4B48
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 08:18:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F1BE3A6E36
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 06:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 378F322DFA3;
	Wed, 11 Jun 2025 06:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R76wgQT0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CCB228CA3
	for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 06:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749622510; cv=none; b=TXnDDvyPbW1fsZ0J4PiSsN9KxFAQGmhiVm3TgtLc3Z59j1BivJUXBv9bpKJ+cBVnN4tKgIlhvBKrkTAczCmJ3OBocbflOsrY4fYgJiqfYNUHfZ4+oqf37qNydDoJn/XCO8aHVJdy2TFf9itvQn0lPiG73GOkYXMBXTAYzTzcr4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749622510; c=relaxed/simple;
	bh=Yg+ckOrH0WLaxHkGgs1KteCaW8JIcss9g2Abd14ew30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Oukhi67vGilfU1Z4Ku6aSHeTrUF1eeoqzvyGlrtp1+nPUlnf7AKEnsT0mwoLooQapgSWz28kT5Vj46mSEDTDxPe8TI7TmX/OtZMfHPlZdeWWg5UbcsNQS4kZyvCKxMtLwgTvqQP6HGIzryGJlPTyCBtoxqooC6MT84NTbiZwUkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R76wgQT0; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-450d0526132so43625e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 23:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622506; x=1750227306; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aNGt00qg7VwSs2+q3jw8T5TN27AreSOovDlc8CyaZ1s=;
        b=R76wgQT0QpnDy4LFXmEA5Rh+/HQeJrKjMI3p/G/H3LL0+ZpuKd06e1/8zwca40XETU
         Agw0lA5dLJHfDa3E0PBH9Xfbi8aE/Gf20lTJ26btv0laM9rNK9WQpKHHsHl9dt34C8PE
         mW1KdxbiSQ0QRJxIgGgGBBvbNQrKr7oe8LnpLHSsb9RxEBoru8WVm8+pDRsKHwEZSoq2
         sCIckCM+0NmxysM7Jcgz1AmL6I7FZuI9oK60jxh3KVraD/fQXUBvLxzuSWBuO5Tncw8A
         PHDrNr5E1iqlmAJ/XJ344Uq82NkHrsGkDTbbh6s10bOLknkP+ByHVBPbev1C4VXzJbfO
         p1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622506; x=1750227306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aNGt00qg7VwSs2+q3jw8T5TN27AreSOovDlc8CyaZ1s=;
        b=l+cnHhoYz1Et+h53dLxy4WS8ExTCB0jew5/LRQeGCffvyVFbxY1TSzarGZWGmvGFX7
         aYk2RHAzTzKjtXiTPGzhrJcGRuXsdME0PrKJ9lBj50uo4NOZu6MEqQfDktI/uQfDL3jH
         TPDa/AJtRc8SexPUFv3LgcOiqWP5FBL6lYzcq5qwA6soUj4SANsNz7d7ust0qArI5VrO
         PeQpLtv1zgPsFTC7OVQ4IodS2dtuDQ5aei8RXYBH8GCUtOmV1urqqS4H274ozxaI895G
         4QAo/J0hdeDNxtAI+sdKqLV6ZJC5bbYHn8cGXbRSRaGCaXnt+qFZYnpLVVaLJpJz0GxZ
         WYwA==
X-Gm-Message-State: AOJu0Yzdeh9wJptAz2UbV2PNIr7cjEROJtbvrtbp9x1+rgmh4gYnZtI9
	frkvgf99l1FWm1F7CA6ZwoMLP3Sjg08w8A0YRaqmbfKiASK2q0lZ8oYRShQbu4g//RyLCS6trET
	Zy9UV
X-Gm-Gg: ASbGncvo+C1yk3YQPsp7O0yTFWr60sY8oq1hZk5seFNsmqAaGT1H8wOpu5kh9YtNKCz
	8XfB854uvlOPNG172X7VgQd/OcQh4FWk6aH/l6KOoe+BXS6maT3E018PSQQxxOxjhx9a0g07rGd
	IEQx0xiZUDjLO0XPq0uRNIIB1MEwCdrBClrGHVaaRg8wOq0Frd+0JGGzEUODb0Spi/RGXzqQjSP
	Ix1s8osA2wo+L5QzZRLab5nIBayVswyLlXi9gzDn6zNcHmDqeU/zaBNYueUg9REncVxI77fu1V0
	P0vh2wW2ZVG23cR1ucToDsrqguI46jsOUxJ8xEEY7Cyb1/WvaD3aF4GiMpBn1JDVmSCmNcjtY0+
	iK06w18E=
X-Google-Smtp-Source: AGHT+IE9iZS2ogk7tJvE3rsCnY0wk29G93paez5PAAUjPtvkW7CHHsEWc6qFRUHnr1G7smpnBlKSHQ==
X-Received: by 2002:a05:600c:859c:b0:453:c39:d0b1 with SMTP id 5b1f17b1804b1-45324875832mr4048235e9.2.1749622506314;
        Tue, 10 Jun 2025 23:15:06 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:15:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:48 +0200
Subject: [PATCH v2 16/17] pinctrl: Constify static 'pinctrl_desc'
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-pinctrl-const-desc-v2-16-b11c1d650384@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7477;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Yg+ckOrH0WLaxHkGgs1KteCaW8JIcss9g2Abd14ew30=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6shEIN/DUxc27nmKSxmuEsUQ1U0xEoqpgrx
 /T0IwSTLwCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkerAAKCRDBN2bmhouD
 17j+EACF9prxhUrQuEqt1EdqbYho5Qt8xy00eIHDjjk68M7IfneU+MytLVtXHc90NbhgLcT86mm
 vdCWelYNgNKA668j3/VA6xXTopwL1hlMy/jnTB8jh5rMJ2hlGxFDCqJ86j6MNWvW60HRFzApvm2
 6huEh4fnrAjg+R+g3yEdRW7Qe6MueHuz9QVcCqul2QrdmgoPV49FPMoD0PnR+pHwcyVvqZHKtJU
 1cLarE6mR7IN9rtq8VTY89MWghmWHcObWYCTjXh0TqMu0KkzSxtiCk0d94XSq6g/QjgdivQHC5u
 ADT9IDcY8pgR02EHdGcECrVO6CktxyWN+unzYizFvXVuK5EQB/YjHDw7E6DBnQQnOQCbkmfJxSN
 r6fhH9CqmgZc+cZ3FGhuYcV7tLm1+NT2FmFE8E5mAjma+8Pu6/anSWofW7rGt2FBrN5UNn1NE6C
 E2unp6xRnREFIFCwxDnPpgCl/OVIpEO5mWkjST0EzqM2KFyNghU6qsolX2yGMn2W+5pWxjZUlRc
 L+AAfic6Pv5S/kzwYI18kabcNT0oC2alEojFJoFx+gzSZBOkePVYApK1geqESaBkyQhIme9cn3u
 BFhDrCi2icxQZIxntSOVUajxKCVuR9iync3tfL+BFwkpSef/Ss5g73RCcYvg8Gi3R5Gm3Eu082P
 /bztidBtdBUhi6A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The local static 'struct pinctrl_desc' is not modified, so can be made
const for code safety.

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/berlin/berlin.c                    | 2 +-
 drivers/pinctrl/cirrus/pinctrl-cs42l43.c           | 2 +-
 drivers/pinctrl/mediatek/pinctrl-airoha.c          | 2 +-
 drivers/pinctrl/pinctrl-artpec6.c                  | 2 +-
 drivers/pinctrl/pinctrl-bm1880.c                   | 2 +-
 drivers/pinctrl/pinctrl-k210.c                     | 2 +-
 drivers/pinctrl/pinctrl-lpc18xx.c                  | 2 +-
 drivers/pinctrl/pinctrl-mlxbf3.c                   | 2 +-
 drivers/pinctrl/pinctrl-tb10x.c                    | 2 +-
 drivers/pinctrl/pinctrl-zynq.c                     | 2 +-
 drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/berlin/berlin.c b/drivers/pinctrl/berlin/berlin.c
index c372a2a24be4bb80b1f2475ef8512171c8e1326f..e5a35b803ce66d247c5e5ad78e6677570a1add60 100644
--- a/drivers/pinctrl/berlin/berlin.c
+++ b/drivers/pinctrl/berlin/berlin.c
@@ -283,7 +283,7 @@ static int berlin_pinctrl_build_state(struct platform_device *pdev)
 	return 0;
 }
 
-static struct pinctrl_desc berlin_pctrl_desc = {
+static const struct pinctrl_desc berlin_pctrl_desc = {
 	.name		= "berlin-pinctrl",
 	.pctlops	= &berlin_pinctrl_ops,
 	.pmxops		= &berlin_pinmux_ops,
diff --git a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
index 628b60ccc2b07dc77e36da8919436fa348749e0c..a90beb986f5bb707c54552e1333802943a4b04bc 100644
--- a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
+++ b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
@@ -448,7 +448,7 @@ static const struct pinconf_ops cs42l43_pin_conf_ops = {
 	.pin_config_group_set	= cs42l43_pin_config_group_set,
 };
 
-static struct pinctrl_desc cs42l43_pin_desc = {
+static const struct pinctrl_desc cs42l43_pin_desc = {
 	.name		= "cs42l43-pinctrl",
 	.owner		= THIS_MODULE,
 
diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index b97b28ebb37a6ec092360f8ea404dd67e6c43eac..ccd2b512e8365b3a5af0bb223329f39119bc7078 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -2852,7 +2852,7 @@ static const struct pinctrl_ops airoha_pctlops = {
 	.dt_free_map = pinconf_generic_dt_free_map,
 };
 
-static struct pinctrl_desc airoha_pinctrl_desc = {
+static const struct pinctrl_desc airoha_pinctrl_desc = {
 	.name = KBUILD_MODNAME,
 	.owner = THIS_MODULE,
 	.pctlops = &airoha_pctlops,
diff --git a/drivers/pinctrl/pinctrl-artpec6.c b/drivers/pinctrl/pinctrl-artpec6.c
index 717f9592b28b51737e67aafc93664b1345511908..af67057128ff1e9e766b958fece9c71518c89081 100644
--- a/drivers/pinctrl/pinctrl-artpec6.c
+++ b/drivers/pinctrl/pinctrl-artpec6.c
@@ -907,7 +907,7 @@ static const struct pinconf_ops artpec6_pconf_ops = {
 	.pin_config_group_set	= artpec6_pconf_group_set,
 };
 
-static struct pinctrl_desc artpec6_desc = {
+static const struct pinctrl_desc artpec6_desc = {
 	.name	 = "artpec6-pinctrl",
 	.owner	 = THIS_MODULE,
 	.pins	 = artpec6_pins,
diff --git a/drivers/pinctrl/pinctrl-bm1880.c b/drivers/pinctrl/pinctrl-bm1880.c
index b0000fe5b31dfbcd6af6eaf0c01029f00cbd205b..387798fb09be51cabd5cb76e0d90a28b1d363050 100644
--- a/drivers/pinctrl/pinctrl-bm1880.c
+++ b/drivers/pinctrl/pinctrl-bm1880.c
@@ -1298,7 +1298,7 @@ static const struct pinmux_ops bm1880_pinmux_ops = {
 	.set_mux = bm1880_pinmux_set_mux,
 };
 
-static struct pinctrl_desc bm1880_desc = {
+static const struct pinctrl_desc bm1880_desc = {
 	.name = "bm1880_pinctrl",
 	.pins = bm1880_pins,
 	.npins = ARRAY_SIZE(bm1880_pins),
diff --git a/drivers/pinctrl/pinctrl-k210.c b/drivers/pinctrl/pinctrl-k210.c
index eddb01796a83eb86c8c5bcf6788c999e8bf2926a..66c04120c29deccf53b21cbf8705f1d10c74ace5 100644
--- a/drivers/pinctrl/pinctrl-k210.c
+++ b/drivers/pinctrl/pinctrl-k210.c
@@ -879,7 +879,7 @@ static const struct pinctrl_ops k210_pinctrl_ops = {
 	.dt_free_map = pinconf_generic_dt_free_map,
 };
 
-static struct pinctrl_desc k210_pinctrl_desc = {
+static const struct pinctrl_desc k210_pinctrl_desc = {
 	.name = "k210-pinctrl",
 	.pins = k210_pins,
 	.npins = K210_NPINS,
diff --git a/drivers/pinctrl/pinctrl-lpc18xx.c b/drivers/pinctrl/pinctrl-lpc18xx.c
index 0f5a7bed2f81b731714e3b65908df23f2ffdfd63..5e0201768323521754e7ecd27e878a81925c18a6 100644
--- a/drivers/pinctrl/pinctrl-lpc18xx.c
+++ b/drivers/pinctrl/pinctrl-lpc18xx.c
@@ -1257,7 +1257,7 @@ static const struct pinctrl_ops lpc18xx_pctl_ops = {
 	.dt_free_map		= pinctrl_utils_free_map,
 };
 
-static struct pinctrl_desc lpc18xx_scu_desc = {
+static const struct pinctrl_desc lpc18xx_scu_desc = {
 	.name = "lpc18xx/43xx-scu",
 	.pins = lpc18xx_pins,
 	.npins = ARRAY_SIZE(lpc18xx_pins),
diff --git a/drivers/pinctrl/pinctrl-mlxbf3.c b/drivers/pinctrl/pinctrl-mlxbf3.c
index ffb5dda364dc81808cfd5a168ce3f1e9f119357d..fcd9d46de89fb3e5215784109ba31b171fd15448 100644
--- a/drivers/pinctrl/pinctrl-mlxbf3.c
+++ b/drivers/pinctrl/pinctrl-mlxbf3.c
@@ -231,7 +231,7 @@ static const struct pinmux_ops mlxbf3_pmx_ops = {
 	.gpio_request_enable = mlxbf3_gpio_request_enable,
 };
 
-static struct pinctrl_desc mlxbf3_pin_desc = {
+static const struct pinctrl_desc mlxbf3_pin_desc = {
 	.name = "pinctrl-mlxbf3",
 	.pins = mlxbf3_pins,
 	.npins = ARRAY_SIZE(mlxbf3_pins),
diff --git a/drivers/pinctrl/pinctrl-tb10x.c b/drivers/pinctrl/pinctrl-tb10x.c
index 4edb20e619510b2f52c7cde41c2540328ec4e95d..129fa51d13b1e265b8145c87f19fba0e8f14f1aa 100644
--- a/drivers/pinctrl/pinctrl-tb10x.c
+++ b/drivers/pinctrl/pinctrl-tb10x.c
@@ -735,7 +735,7 @@ static const struct pinmux_ops tb10x_pinmux_ops = {
 	.set_mux = tb10x_pctl_set_mux,
 };
 
-static struct pinctrl_desc tb10x_pindesc = {
+static const struct pinctrl_desc tb10x_pindesc = {
 	.name = "TB10x",
 	.pins = tb10x_pins,
 	.npins = ARRAY_SIZE(tb10x_pins),
diff --git a/drivers/pinctrl/pinctrl-zynq.c b/drivers/pinctrl/pinctrl-zynq.c
index caa8a2ca3e681718fe213921deca8d130371b122..dcde86fed10db3e2dfebc19cb841ea7f63e74989 100644
--- a/drivers/pinctrl/pinctrl-zynq.c
+++ b/drivers/pinctrl/pinctrl-zynq.c
@@ -1143,7 +1143,7 @@ static const struct pinconf_ops zynq_pinconf_ops = {
 	.pin_config_group_set = zynq_pinconf_group_set,
 };
 
-static struct pinctrl_desc zynq_desc = {
+static const struct pinctrl_desc zynq_desc = {
 	.name = "zynq_pinctrl",
 	.pins = zynq_pins,
 	.npins = ARRAY_SIZE(zynq_pins),
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
index 27f99183d994dccb92aac81ca42228bdb9225e87..aeaa0ded7c1e5ee7f9c5e4113bfd208fb844ba7d 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
@@ -898,7 +898,7 @@ static const struct pinconf_ops starfive_pinconf_ops = {
 	.is_generic = true,
 };
 
-static struct pinctrl_desc starfive_desc = {
+static const struct pinctrl_desc starfive_desc = {
 	.name = DRIVER_NAME,
 	.pins = starfive_pins,
 	.npins = ARRAY_SIZE(starfive_pins),

-- 
2.45.2


