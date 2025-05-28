Return-Path: <linux-gpio+bounces-20643-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C75AC6772
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 12:44:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6383A16A6FE
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 10:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0407127A124;
	Wed, 28 May 2025 10:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A4GapL91"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0CF280333
	for <linux-gpio@vger.kernel.org>; Wed, 28 May 2025 10:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748428922; cv=none; b=fZdZEnulErN/M9a+siGxF4w/eBkMtPV+dGFqfYbYhz0dXJz2Nsb9/BFM9AzoFu40WN/X23WDw7oh4eJDAE9zpsdGfEEfNUVCGF/Vs42oXkYfOENnOQKSdumRRvgux68noSMegKUBAtjY2wkSmm49wjSvcU/2nRlNq5QI2au/2KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748428922; c=relaxed/simple;
	bh=8TSMAdNwJJ4cMP69sWF06naMdDsc0YKsL1F2ggY8MtU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yl8KmFNfdqN8H5rRrQ3LEx1MchcowF09qJVFqlezXghhG1nDugOkS6PZXcC7DGELplD2Asp0xPGsVqirw6xzwjMhtpHi9MQ0jK4gpxeo/OHE2gGsaxYYbb6eQgjj4NzxbvAgi08Uco/DSBvG0kaIWE64mRbAaagNKrPRs7QPBXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A4GapL91; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-440668acbf3so4924895e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 28 May 2025 03:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748428918; x=1749033718; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pf1YR4gqV6lGcgRNt14+w6xZNohisJw9ukNkMtmqRYQ=;
        b=A4GapL91ElpqDu8rytCKHqOvDc+7LHOhT/s4CkaDHcsbQEz9Fk3+CTcK0bAzX8mzBP
         RDWOw5nXr6P+jEYbseht5mI3NmDvijhVmIdqfk/7Z1C+nkJ9Y6dYEkqSGPZ1BPQtzMEE
         3/BVBGoueeRRXbGutij///mY5Bu3AEa7OncET/atBXgJcjAhCbnQ+FXAFbWnhoq+Ry5t
         1R5guscOzzgimGDEJQovBFJoI5lNPHbljAKHzrb2WdE9Pawq+yX+ju3byJB3/bsTA/6c
         lr6eLloFluGLGE+hKnOevsNAfafn4oCarIaFHJlxmIfFOjNqhPe0Ha7SSqX3co0aGHNV
         SnHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428918; x=1749033718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pf1YR4gqV6lGcgRNt14+w6xZNohisJw9ukNkMtmqRYQ=;
        b=TQ9slJZ4r113FW4qm7OvzUu3d8Z3ARDvBWD3nilD5XSoruq6FqP79Tj/YYixGSHfcZ
         wIBDuRBP16klTk4YWwPVwQ1x7+m+wPyw/pXefAlcn0C9msTmQLeas7/ipOyUvbpG6v5g
         YJBIog+08WPzsdZtF1gHn4aIiGr5ZXzVNeGM5ugqpS1qsWqxvQJiEJhfLkE3MGGOxqAS
         zOZTcw6Hq3O+cvMjVNL35PiaLy5OWKPnclyzrVqWisXCFkcGJz0X9b8z449PcSJGg1p0
         fWyPFajRZ3VAKCV4Bd5u5v94n5mmzgbXm0pywNYHgj/DGak1iJSSp/3iZvryLlpBANPK
         vbbA==
X-Gm-Message-State: AOJu0Yz8F92nXQKnRB1dEJ8TVB+5puwup9eIXDrUQ3rIEz4fy8NGY+WD
	U1UNlRmpJaa+6v4CqPQswvJxD3gxEYr+k3A/xWxoRzzLSDxfb3TSWPf4w/eWKUzHIxQ=
X-Gm-Gg: ASbGnctlM2556ISzFyk2Uev0dZkYv2JBgiZPykoFOKo6ebuKODdLsnvcC7bPP7rQyHW
	4wlqPJGgaqdlio++1vJZqMuKgf9sJwPjLZsNzmQgXnxWhbPZqOFFbwIeykpP8BSZ99AYGDTNEwv
	cHmjEBJEqnSDSIHJTmjT81DPQnZxaBhh0B+ZxpzR6EtA+H+ezR8Hp91ovdXxMbot5ic2e/C2vCa
	cLFgBy5XS4SXwZdgiP7yB0t5Vo9AZyLTdJ1J28st0ALp5HR4y3CUVbMdW6TqC8BHubkuwlbWIBl
	ZzzMoMg1reKAbyFJ0EfLvEm4snDSsCChlJ+sLExGJBp+8pR07a4ytpvwu6SHrCC13eLdd0o=
X-Google-Smtp-Source: AGHT+IH1zOEOLeCxje+RyhJLL9R7to4LG+S/YoypX4dofkpM8V4nOT+IYOSlqNv+mgg8x3vhGGPHiQ==
X-Received: by 2002:a05:6000:2303:b0:3a3:75ea:f9d3 with SMTP id ffacd0b85a97d-3a4cb4addbdmr5341295f8f.11.1748428917518;
        Wed, 28 May 2025 03:41:57 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:41:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:41:04 +0200
Subject: [PATCH 08/17] pinctrl: bcm: cygnus-mux: Move fixed assignments to
 'pinctrl_desc' definition
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-pinctrl-const-desc-v1-8-76fe97899945@linaro.org>
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
In-Reply-To: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
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
 Lars Persson <lars.persson@axis.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Damien Le Moal <dlemoal@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, 
 Michal Simek <michal.simek@amd.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
 linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2098;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=8TSMAdNwJJ4cMP69sWF06naMdDsc0YKsL1F2ggY8MtU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhP4ba+/mFh+oFgO6EmJOLE0PvaD+UB1YrZI
 JEnxOp0UJOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboTwAKCRDBN2bmhouD
 1wZUD/9bA+sdZ/7ZzrhcN224T33+HyLau7J4D7YZ4cKaBQB0U8+Zw8EsZqd4MTQZ6emR9L2iOku
 vB4WqG5e+8Z9LIfvJznXFBRZIVYlQMVs4gKMA6n1IQK+b3fdbSKyrWYxGzgWg1qHRWfrn6gFq8V
 qwQ3u4tXG8zk+5W7WCD/WmhtFm8AjfVPdLdTzD6BTNO5/1O3UECTfd4bdy5uAlIjjeeaglJ6U9x
 TfGg4iHSiUave8A4vNsJKpd2jh/UHo31b0ZzfwImQA+f8HM2q+iJGrpHX3CyIV6W2b20CcjaITi
 BVPzXRwFn1atUdyNm687e7TwfcAjztLBlCv8F8SICMdzeIwhYxkIJwrnzyA/XJKL8VZDWTgHXCG
 K2DF/qGfjZ5NgbqxaZoqwf1DAfB+eqty4Xax4UbJTIBeoox4mmxjYZGajNOOihw9gH0KKvHsj26
 zBwOdZRN9WJjBF/BLwvfGx358OA0ejwj8JIbMzzv7XPnPz8YhtHemtM/2Q/BUcu49g7M9Zn+SBQ
 kXnJY427cgGJL4hSfheW6ucWUtyWdpu9qP9QkoTJviZEn3MuNR1TyXnZlNQPQziFWzqHoSJpgWa
 B1C0T6yk8njHeARq0LwxzSDnTjEtcAmRHwCS5FH+LfTz1zCNy8ZkWDkhOkDAGNbKgggkp4iOtAa
 Y4YpkDzEcJUCemQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Assign 'struct pinctrl_desc' .npins member in definition to make clear
that number of pins is fixed and have less code in the probe.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-cygnus-mux.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c b/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c
index bf9597800954affd954e45a4baa01da4d5dbf420..e9aa99f85e05944a2a0cb9a3e6245c707dbc9b3a 100644
--- a/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c
+++ b/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c
@@ -903,6 +903,7 @@ static struct pinctrl_desc cygnus_pinctrl_desc = {
 	.name = "cygnus-pinmux",
 	.pctlops = &cygnus_pinctrl_ops,
 	.pmxops = &cygnus_pinmux_ops,
+	.npins = ARRAY_SIZE(cygnus_pins),
 };
 
 static int cygnus_mux_log_init(struct cygnus_pinctrl *pinctrl)
@@ -935,7 +936,6 @@ static int cygnus_pinmux_probe(struct platform_device *pdev)
 	struct cygnus_pinctrl *pinctrl;
 	int i, ret;
 	struct pinctrl_pin_desc *pins;
-	unsigned num_pins = ARRAY_SIZE(cygnus_pins);
 
 	pinctrl = devm_kzalloc(&pdev->dev, sizeof(*pinctrl), GFP_KERNEL);
 	if (!pinctrl)
@@ -963,11 +963,12 @@ static int cygnus_pinmux_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	pins = devm_kcalloc(&pdev->dev, num_pins, sizeof(*pins), GFP_KERNEL);
+	pins = devm_kcalloc(&pdev->dev, ARRAY_SIZE(cygnus_pins), sizeof(*pins),
+			    GFP_KERNEL);
 	if (!pins)
 		return -ENOMEM;
 
-	for (i = 0; i < num_pins; i++) {
+	for (i = 0; i < ARRAY_SIZE(cygnus_pins); i++) {
 		pins[i].number = cygnus_pins[i].pin;
 		pins[i].name = cygnus_pins[i].name;
 		pins[i].drv_data = &cygnus_pins[i].gpio_mux;
@@ -978,7 +979,6 @@ static int cygnus_pinmux_probe(struct platform_device *pdev)
 	pinctrl->functions = cygnus_pin_functions;
 	pinctrl->num_functions = ARRAY_SIZE(cygnus_pin_functions);
 	cygnus_pinctrl_desc.pins = pins;
-	cygnus_pinctrl_desc.npins = num_pins;
 
 	pinctrl->pctl = devm_pinctrl_register(&pdev->dev, &cygnus_pinctrl_desc,
 			pinctrl);

-- 
2.45.2


