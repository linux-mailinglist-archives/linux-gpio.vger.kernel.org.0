Return-Path: <linux-gpio+bounces-21313-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EEEAD4B45
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 08:18:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BE131BC09A8
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 06:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61C6F22D78F;
	Wed, 11 Jun 2025 06:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QFYuj6Jg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560D02367AA
	for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 06:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749622501; cv=none; b=gVxzYOCP75R/jy3homj9/DQODTGfhs5isfa6yzgRQR2jr5OATj3j0hWPuv1y1WSQ1m2jcZ3xMLU7I7F7vCIlF6jdnXYROojv8JDKehPaziR0vN1KTtcFfoX5wV1HGkqbhsDSbNvG9cW93vWWL5bVCBLugRkuo94qVulib0OqdOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749622501; c=relaxed/simple;
	bh=dTmy1ylBupLBEHMWc/Z23V5px0USEJlmCJKSN1EAvfE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kYA8r3Rc1eSU9bHhtvXlNEmi68d/+k/cDBY5tlZMSNPSvbdgrJJz1HJXx917E4e+eQF5W+ZigfuMVqgFy9CeHF64p8DJt90wMf3jRCNivBaPeS4ivwMGsxVF90TbFw8KGOUZe0V0IEh1Fb88eI6VnLYj84NC3IrwzqO8ZNQb7cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QFYuj6Jg; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4e6a0c274so24880f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 23:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622497; x=1750227297; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sCzXGrMy4mrth9Y9XnnMqTwemBq/IlPbQZ3QBo3OiYA=;
        b=QFYuj6Jgc65b12nmoQf5i+MRkWA5Jn8nvUenUHnsgidQps9GcLVNhwIoP3eiQxMbQh
         oi66YEYRePrfcbF0ekPMX0yEwH5WPCIk/wT+tGeWhvc7FKd/GGr/yMFEIZLWEgucJh3P
         +VZuvOGzAoM2kK8XCUYeDIbsyBTwb4N/mV2CgvPsb13+jDx+vFnRxr5RQUSb759Bb3DT
         WlbTtK+Okl6K08+gwRY97v0bllKi+nxD8RUkg4sPszaK/ohp5WFIQ4kbK1b2IfgbAY6M
         nteFEia7REbyalcndXcu2MWqIFi053EmwQ2nLmBrDtFN4W0gwQyoxkKygBqqEHjnwcqW
         Ur8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622497; x=1750227297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sCzXGrMy4mrth9Y9XnnMqTwemBq/IlPbQZ3QBo3OiYA=;
        b=vcHgwA1t3YBm5fs25Y0oYvcQ85gCrZjsp42bJo6E/sbkWqp4uoV51fbUJ/JzzW25Wj
         oez3AvBc6jXnoqUiLV5sjrlFp+OT3yL59xnlMbYcsWsM6SXeZzMwNUl2qc6n+WT5ishV
         HTrDVMTl4oQ50n4AO5/S9HdWKu0IpFyFWtDnnH8Tp9oqm3iRcE5TPtQJy4dWWaWGNj6H
         ns3t7EUGpMIErzdD+bFc223sdBrIHdCDDN319ug0IVIU+idQH7aYrqz7GU+Bq8FoeKiq
         kUnYcfUubbxG6Sk/t9+qAhLGjGT3yCPKqidJ3LXbXYd7s8n9qzp0TFndk5mvGbitxSOe
         EUXw==
X-Gm-Message-State: AOJu0YwoXRgHGtqrO9isR1ktZ+BUJnTVa1pIoWzwp6LUCMEgWfLruZeD
	sBfqeTGf/dnQMwsbiH2ZovWabe/6a5A31TvHwAq/oKhJrc/oOnBCs6ZGH3ZAfB/tR3p8irDDvP/
	6qTLo
X-Gm-Gg: ASbGncsSqAbRRPddx29YQiP2fquRH7pA3u3Oi/VGKbhFOag8Xe33oembe12RK9/8pay
	xUgmQpGXZW7aI3anbxzGnaMbACgRsskGfe3+d+vuWE63uyKzBx+aI0LhFdJpRMgCXPPyroh2QH7
	OzzrhgyPvPoEJgsd4s7DhdSvVrmivgtaVP7ywMOYFCPecnuGnejU1M5Yjf2bJPwEegFWliFxLCR
	Q32e4lzCFY0WQG9w6vXlSXTvWO0iQ/LgRcwI11fo/UY265dlDcjgn1Kbp8OxvIldF4qdujuOWYD
	5B138vSPUEp/b/NkA3Ky5EHn2uFQyM/+EqjVvRQt2VdDUmra7PK/m+TRl+b57CFFH7nhBOLvlj8
	zug088Bw=
X-Google-Smtp-Source: AGHT+IH0XZ1xTYWRRaO/KxoZgyHwo88VqXTdr3SM+3aZCDHpuiwknECFcoWGBMSsZB+S7AbudZJGmw==
X-Received: by 2002:a05:6000:40c9:b0:3a5:22bb:8b41 with SMTP id ffacd0b85a97d-3a5586c6283mr513239f8f.6.1749622496932;
        Tue, 10 Jun 2025 23:14:56 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:14:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:45 +0200
Subject: [PATCH v2 13/17] pinctrl: palmas: Move fixed assignments to
 'pinctrl_desc' definition
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-pinctrl-const-desc-v2-13-b11c1d650384@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1235;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=dTmy1ylBupLBEHMWc/Z23V5px0USEJlmCJKSN1EAvfE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6q4AzpL6d1wSLiktMd45hf80LKncfJThmGJ
 j9tWAIcbRqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkeqgAKCRDBN2bmhouD
 1zW2D/9sgizTHa8UYpq5W08yfaWQQY5LIJPddSSvcnOBIPHSGldHl5KnuPm5CR7btgpemW+s5wk
 +B7d3ypQAREOql3KHh3KhN4AIXdCBqYRhiXPktlMuJullbPSpdfQwUDGPWbKkl5ZGYFsutt8LXO
 2oR/wII7OuWQyqXM+zszHSuArLZ91UWpjox09xD2BjvaZqbt4U7WBXnpdBM6EirqirObi7+Unmx
 vRD2aXkAFWnCt5fSmhwFsxQ87SO68h+yAaVnpgUVxzSeE5DSZaynVyvBTcjnMZ4pPo8j7uxX9ee
 Brc7ycoIJiDUuzzcHWIpF6ebtMZtGNyZWC79sMRgTW4btZZyj0A78+J7yoEX8MRDbdfBLYL+fv5
 SmdiydXrA1oaQHQbUJBiSlHx1gEFO4BiG4ZnAaNY5m3JU2P0un6OAzOE9a/dEOMpbHazykDXjD5
 jcyV8+Eh9nGCS8xrgB+uEOfLCMuG2/VXTxXBxhkRQj0uAjevYzMJm3kovLQh4nKH4talFCxMtLb
 aUDFOmzG/NXN1+jKrev2W+nylhYVoF2QCLptpuvwWkWS/XOJJ0xJpd0gJX+TtLSBwdgyXUDey9E
 CmgGts4sk2ZGmkIIwag50Rlholelm/UNtTVFHxIYfZjshyD22hdqRuS4j3hnI7uREsSTOniRjoR
 /5HfKm3NrrNXYxQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Assign 'struct pinctrl_desc' .pins and .npins members in definition to
make clear that number of pins is fixed and have less code in the probe.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/pinctrl-palmas.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-palmas.c b/drivers/pinctrl/pinctrl-palmas.c
index 9e272f9deb4f8c49f91d2f09c2c100018a7617f8..d69f114e46426c345d9ffe7567a326eecdd91bb5 100644
--- a/drivers/pinctrl/pinctrl-palmas.c
+++ b/drivers/pinctrl/pinctrl-palmas.c
@@ -956,6 +956,8 @@ static struct pinctrl_desc palmas_pinctrl_desc = {
 	.pmxops = &palmas_pinmux_ops,
 	.confops = &palmas_pinconf_ops,
 	.owner = THIS_MODULE,
+	.pins = palmas_pins_desc,
+	.npins = ARRAY_SIZE(palmas_pins_desc),
 };
 
 struct palmas_pinctrl_data {
@@ -1023,8 +1025,6 @@ static int palmas_pinctrl_probe(struct platform_device *pdev)
 	}
 
 	palmas_pinctrl_desc.name = dev_name(&pdev->dev);
-	palmas_pinctrl_desc.pins = palmas_pins_desc;
-	palmas_pinctrl_desc.npins = ARRAY_SIZE(palmas_pins_desc);
 	pci->pctl = devm_pinctrl_register(&pdev->dev, &palmas_pinctrl_desc,
 					  pci);
 	if (IS_ERR(pci->pctl)) {

-- 
2.45.2


