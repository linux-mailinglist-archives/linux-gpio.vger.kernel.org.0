Return-Path: <linux-gpio+bounces-21305-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D5BAD4B22
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 08:16:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FED518998F9
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 06:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F69228CA5;
	Wed, 11 Jun 2025 06:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q+l3Jz6B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048A2229B29
	for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 06:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749622470; cv=none; b=q/8pGRI29v/uEyXLqH/YtGeWy3bOhUH/ymkLfTiqmcmq+BpunMkaQKc9Q0usHrCQcYnuyY+k0rQgwFEACwf7o2gre1m4oY0BRzrFQYThd++Vu4DJsb3wE8Mt1DsNqTQUC7UwvwWsf9xoJVc05oWeXwXdT8qsIHDmnE6BCizeYCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749622470; c=relaxed/simple;
	bh=MUWLp3Nt5eChdJhKGynTZdb05flOTAfJJ85UEeTcZlo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j08hL/yYnjkrbpsYy/NlRIryCeBvTAdtOSByyKXjsvvCaLdgY5GkxChtITpHlZQdXzfI7EZZfrfs1vaW/4vXic2zeu+kYGGymbYwjYN9tutEHPfVXvcBwk+F+1IN+3uilPJ3wZj4T+h1yiiagrrkxUEiDNYLNXDKw0FJMQGHFrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q+l3Jz6B; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a4ef05f631so24947f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 23:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622467; x=1750227267; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TEB3joLDGNQ10Dxn2W6U+Wspv7QV9CHlEFicTB8VL5c=;
        b=Q+l3Jz6B6zW7EQBjdhQ58Yu7E6z2rY7Oi9/PGSxk+JQqnQEWdcVkLZJ0FowgTxnzsJ
         mVZYYBlhutTULel5eGdrVcJg0GgZF5QYpVBG2z41VZUrjHPUo8FiNKEUPebzd2Qf+xhT
         XEVLqm9ob9E/7Y4X1NrOz0vDBigud6y6khXFqwyfHoiZEignEd/3+zvmk3GI+xgtQPiD
         7FK3YLiItwPgRiYeq/N+Mqarw1giu6ShCyHoyv5HgSdapaxtlDLbFdq08NZr1ThdUShB
         UUW83Hvg5+stth/8ZXrmeT8WwmYtb2xqT6xYLglZFaMPfKeGo2avGPivAhrjynbrTiTy
         LXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622467; x=1750227267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TEB3joLDGNQ10Dxn2W6U+Wspv7QV9CHlEFicTB8VL5c=;
        b=R5qoyK4ZNXbxIKEpRdtkVp57LpaN437M7L/2SK9EGDPxEz1W5BuZN+o9hnE5CC+QU1
         ZKhkthfzX/+nDd18QrMO6JfiikuFZyS2nrAFpM2lyXwuak6RhLekbC/nA8EEyx8PNC/8
         LdD86A7U56R590wehUPTLG0hPg9OGEGy4lYoCsZHQU2pMzTy/zLspSQh+rrHGh7fibnN
         pIs+P6eULIuryFFB07w3rC4zsM6nNGUsH4EU4Gy+uO7Mx3PgGWKiZdzblSGqfKxlt9hh
         FmdjbnRGrbIn37Pkr9VHjApLgKFK9S0NY8ln1N1gvQAqfo49v47PuKXt5z5AQJ9mvMpE
         zjaA==
X-Gm-Message-State: AOJu0YyTbX/X8MakGZP20F2SmND6aClitE484dMkweIhJtvd09oSWdYB
	jLsgNhju4xyR/MzWc7RFe1GbL0vchPVQwO3fbmpYCKBIeZ6C9mo93Tu2Iv5o3ESsvWicQNhTVml
	Th4yO
X-Gm-Gg: ASbGncurtJxPu1yJDvPO3XJ5iElt5T9nNGywNTbpBmB95jd9K7pbzjKNF9teC/e3tFt
	ZThCB7w+OsmOvEo11cb+KdBbaSVajYiQouFKnthdWqrABON+3Shico5MfB2cMp0VqIOYaXnufyL
	LGlEPrBYvnMIa1hQGkDmYEHR50zT5D0VkdfMSYrHcRrRrmtSRxqnSvAZPk6J1Nmfy9IWU4iZxVL
	ajj5fAek5GNx/fR3S5G4UE1uDt1iHsy+KEkRYAdP0dC2hYdV5HznS2BaI//R0wvKTxwmLaXdGOV
	CMpgmGObe94o5CwckE4KUXApEAUz9YQ76LbCrfCgpP32ODsJ0SsIpX138O0XzS9qYERuFZET8hP
	nxI/qYrE=
X-Google-Smtp-Source: AGHT+IGKArwmT43Jp39W/IH9DrAfebUf487r6XRBJJfTxXZ7wZrfvcgLM2/UusAKtEurR1Oql+1dkg==
X-Received: by 2002:a5d:64ca:0:b0:3a4:d30a:7633 with SMTP id ffacd0b85a97d-3a558a219bfmr553112f8f.15.1749622466767;
        Tue, 10 Jun 2025 23:14:26 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:14:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:37 +0200
Subject: [PATCH v2 05/17] pinctrl: aspeed: Constify static 'pinctrl_desc'
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-pinctrl-const-desc-v2-5-b11c1d650384@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3815;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=MUWLp3Nt5eChdJhKGynTZdb05flOTAfJJ85UEeTcZlo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6iwlO2tQ/UpCj0vvsGMdn11hh5s2rcGYP+x
 QO7DZiy+8GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkeogAKCRDBN2bmhouD
 1xQ9EACNGt2WyM5b4AkDlzKbhuD6nAbgGjDViCR7KZyPgUO70TNbTmXSywc0SAXADggMLD36i9B
 /MyCOvxlkIQRYFBsGI5cjokf97+vpM45r3Ey8O0/VpJGYomDjOu9O8synMz+BccVLyNGtbrDIPY
 FgdWz/Z/vUq7vkSM6yT/yFMW652cUeZafnSLEFe4xPvyy3ib1Wevr5rm4tmM0hAQQhicljGiDVu
 QBQGPXd8y7HM/fXUA0S2wuyzWGG541W/oI75yde3jV9XqvGpRYQfyLdoQ4x9Uo5qe6Ao9aeNHgF
 Szpcr5DTsQIjtCvy+ObGvzDHXLF9TlEyAoyqS1b7NtI/FKFaJpL/0VDCDSqYYgqRHTSeRGvCfTH
 a4vfnXy21HJ2vCvNd5Py45HkrKi8ku/uWOQeeWlPAARoGdEgR8ZKbDxzX7bXKoIpDGLrS8jrkvs
 x1TX5MnTnEQ2FZvO/Ex0rqguCfQoZXWDxhg3TW/ChFXjQR3kWtxA146wVDmfCLjwPy+NIqHcRgg
 IVaaFfTXPbGGJRU1M8m/RGL3g62rPoFv/bWdPLFktxqifMdLnFY2a6SHq0m5eoqpYdX0wVV/iP9
 5PKUq9+nUx1UtfJIOma14ebdxYJa8wgkyllbcdXsD8JhnbaQ9h1CK4gOjI4AK5pP5TJOfxtwVkz
 JeKCJJV2+52S1Dg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The local static 'struct pinctrl_desc' is not modified, so can be made
const for code safety.

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c | 2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed.c    | 2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed.h    | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
index 774f8d05142f2d90c238f8e6661eca4685601db7..cb295856dda1244f2205305cf4c505d4ea4a326f 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
@@ -2653,7 +2653,7 @@ static const struct pinconf_ops aspeed_g4_conf_ops = {
 	.pin_config_group_set = aspeed_pin_config_group_set,
 };
 
-static struct pinctrl_desc aspeed_g4_pinctrl_desc = {
+static const struct pinctrl_desc aspeed_g4_pinctrl_desc = {
 	.name = "aspeed-g4-pinctrl",
 	.pins = aspeed_g4_pins,
 	.npins = ARRAY_SIZE(aspeed_g4_pins),
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index 5bb8fd0d1e41bda799119a67887ccbc277e0f9f4..792089628362a1ed1c3eccd4e46c41a3ac7a79f6 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -2845,7 +2845,7 @@ static const struct pinconf_ops aspeed_g5_conf_ops = {
 	.pin_config_group_set = aspeed_pin_config_group_set,
 };
 
-static struct pinctrl_desc aspeed_g5_pinctrl_desc = {
+static const struct pinctrl_desc aspeed_g5_pinctrl_desc = {
 	.name = "aspeed-g5-pinctrl",
 	.pins = aspeed_g5_pins,
 	.npins = ARRAY_SIZE(aspeed_g5_pins),
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index 5a7cd0a8868764dc5e3dc70f325c25ba29d50a64..51a63cf92023f7dc7a27466331c77bb5dcbaa9bb 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -2763,7 +2763,7 @@ static const struct pinconf_ops aspeed_g6_conf_ops = {
 	.pin_config_group_set = aspeed_pin_config_group_set,
 };
 
-static struct pinctrl_desc aspeed_g6_pinctrl_desc = {
+static const struct pinctrl_desc aspeed_g6_pinctrl_desc = {
 	.name = "aspeed-g6-pinctrl",
 	.pins = aspeed_g6_pins,
 	.npins = ARRAY_SIZE(aspeed_g6_pins),
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index 9c6ee46ac7a096ce693639d88d387b089ffe5239..7e0ebf11af163c90184231686b1e0d9920755d76 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -441,7 +441,7 @@ int aspeed_gpio_request_enable(struct pinctrl_dev *pctldev,
 }
 
 int aspeed_pinctrl_probe(struct platform_device *pdev,
-			 struct pinctrl_desc *pdesc,
+			 const struct pinctrl_desc *pdesc,
 			 struct aspeed_pinctrl_data *pdata)
 {
 	struct device *parent;
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.h b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
index 4dcde3bc29c825cbc6be954dae9a654a310b4cd8..28f3bde25081b2c8099977129acdcdfb3e4b1dd5 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.h
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
@@ -102,7 +102,7 @@ int aspeed_gpio_request_enable(struct pinctrl_dev *pctldev,
 		struct pinctrl_gpio_range *range,
 		unsigned int offset);
 int aspeed_pinctrl_probe(struct platform_device *pdev,
-		struct pinctrl_desc *pdesc,
+		const struct pinctrl_desc *pdesc,
 		struct aspeed_pinctrl_data *pdata);
 int aspeed_pin_config_get(struct pinctrl_dev *pctldev, unsigned int offset,
 		unsigned long *config);

-- 
2.45.2


