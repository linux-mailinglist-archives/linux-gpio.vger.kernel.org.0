Return-Path: <linux-gpio+bounces-21315-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D3EAD4B44
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 08:18:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAC183A7620
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 06:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98BD923A99D;
	Wed, 11 Jun 2025 06:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OWTrqd77"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AA3238C16
	for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 06:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749622507; cv=none; b=nfA4JSkm95SZ5stZWkOYdpGnlxfjkOqyj8Z60zRvvIj1JYoV7ls1Kwu4IBlXnQoBAJ+UlkOIE6yoj2R/UDiOPHkX4bVZjG3SKW4tekoXa5ouy8hHcIfv7l3ROlzRUjjfRHwa0pCc5adsXDNc+rtp6DA9/TgnPuAQ8TZ0Bhx5UyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749622507; c=relaxed/simple;
	bh=UtgeU3dDjW57LMOT846YXV02Tw4GcYGErdMblZiJj2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uiu5UKMjznZxGcdbirgC5wbfoOkWyqhq/ri7N4Ls83iru6uy09AoFcvDBeixsNUNVwnip0y4wUmzmzFike2mKOh/e67Djn4hNJU79CyfNABet2z+Wt+Z5vLIRUAicYtLm9UPKdgVggSoFVIvaop1Hlu1W56f9JVa5IU7CWVxXj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OWTrqd77; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4ef05f631so25067f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 23:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622503; x=1750227303; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k3Ze+vADApZQcXHHJvnQw5idboAhTO4ZZm7oXpqIyA0=;
        b=OWTrqd77hv85uVaffLnxSAa3k6evvJDOcog+gyPwvEeIQ550QooSZFwSHToe86fu8i
         AS0cs+EIyvc9lBcV+Duxww2bITV+U4nMvk/LJG3/dB67hev/g/6GzpwmutzVUmzLgl/M
         oaGfcVMR++TIuRovWTIJJiHoTdyE6WQjwhqgq5aOrFofUClm21596z0ec4nvkH92aIdL
         WwyzK593Zu/xIVlw9gOsfrLOaHnbbIJLFPYdH2nYQI5XH1L6mI0hn+9027CBJz4/n2o2
         QmS/CMKKOk8gCyt24dMgr3VB0kOWZv/5H86th+i0TzRGodXSH1Lva3hDHYsIkxlFhOob
         L6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622503; x=1750227303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k3Ze+vADApZQcXHHJvnQw5idboAhTO4ZZm7oXpqIyA0=;
        b=SCwMAIJ5NAZOPL5m0XTzBgi+qZcCBycWQa2xhACPBGVlYm+GCixDxd06fx1PCCu4eN
         oysPI+LrYyH7TwCqa/iNHUyzpQKMY8a75/1ihAm59ArCbpsldEo/OW/hJhIw8oD344Ma
         u1atVPiib25LABn2HisD7hiojXQXPMdXxmVsjzg9SefL239Cy+d7QUmxmJYvgJ91zZxW
         icv5DvwdwdrTZfh1aoF9pkIenE0D5Nn2ABtDVTClE/5aQ/J+GNNUSDV+HLzNO07e0X3f
         QrSC/7HVOKpn8byu61ji1Dt4oRCGe3sgTRysosocPz6Y9QB/1jI5dHGgAieJFJSetini
         42og==
X-Gm-Message-State: AOJu0YxzZIYLOR2lUlpkiJ7sxnbSJdcqP/+5J3YBFmBkymvpuu1/ofY1
	OFHe4DteH8M7UdRQwAo+nd3gxAhRVX0/ZO/zJ6cdnnKi0HnbhmE23nj44JwmJ1UxCZ+EIufnIvD
	3vMbv
X-Gm-Gg: ASbGncsO5SJ95hNfCMpl8gPwUpzTisaA9/GsRA27hk0B9R9+N81kWu4O9rMTD8L6111
	f6ixUPx8CGzxJ/smoWvsELNdCXyHPZUpA/F6hlnIvNdVeuDyeH/iVXLwT2RqCBmOLCfNtu50jPh
	K462k120DnyJNNYxorXFWRsMmkqttLFY0/PYKuigl+xaMB8yQHoMJswseyiKEx3DvH32ZV27B5i
	5jLbymKUl7862YtEvI3B+i3kZbwu76l7RykRu9nDmgWa2cwTPzb0b8jEf+QcbL0tVM0rBD2Pwc/
	yDrj9bK6kQfCj3H9MmfoOPTZ54R5rMIRxx2p/Dxv9w8yjmOAXJtZ2pKb/Z3g4iu57bCW0VBUy8w
	DMBNM9ig=
X-Google-Smtp-Source: AGHT+IFam/Q8ke2FDO4E1F/HTitp0FP+gKJ3/gukW0/Bc+eEcP61V5NJDu4WYFt0kcJQLnkHsxn5Qw==
X-Received: by 2002:a05:6000:290f:b0:3a4:dbdf:7152 with SMTP id ffacd0b85a97d-3a558827131mr510215f8f.14.1749622503270;
        Tue, 10 Jun 2025 23:15:03 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:15:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:47 +0200
Subject: [PATCH v2 15/17] pinctrl: pistachio: Constify static
 'pinctrl_desc'
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-pinctrl-const-desc-v2-15-b11c1d650384@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1566;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=UtgeU3dDjW57LMOT846YXV02Tw4GcYGErdMblZiJj2Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6rl3kHrTfHT+G/WppDKwo9ZAF99RmPNy2e5
 FK25/IXhjOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkeqwAKCRDBN2bmhouD
 11zjD/44mTi6E0UEUF+WOA5PYfQSA3YrJhhb1gdB9LJEaYmqZ5heGdhEkd11b9u21M9uM04L2ZM
 omR6mvdKQb/PUr5s6pB4c+fvGy+edBch7wENWeAZTNkmTv3ucsbHEXczrgo33adLBv5AsrWXetE
 4z0tcvt9p0PZIwyoJuxHwgjWE3/oYJIHyfJmzOYXZdd9kRuIIYlBE1K97q/hOmQ0VG5MfdaawBc
 /Ld6CQJ8SRFCASzKJe+9jRrxsHoSLW/JCnoA0ZQFUq+Yf670EaZbzi3k4udIwkie9Hv1PUhPzQL
 loPBNXTxubGL5cnqEnKpoMKPSeage04tUhOnjnUQfZX+m1dUP2EK30OskgV/e+PJGji5xsLvoEE
 AzTFaWnBiwlGVii8+4/o6VagcwsLWxudJ/khpn3Bp9gnvjFXoYjtATT6dIL3qzKWKZIqaFO0ZNl
 898lFaYQS0Zi13pQngS2Vv880F3sQ36GsZjqEpZUXgHMDR2vprhGNNcHLTPoEkv3tOUFo7davtm
 vdJl53vfkJM26COh8m75lKvxQnXcCBYW8zSUYw23DN4X/qtIPpGhEyuNQlUDiE14kSOsydQ8l1V
 72P5Y2/V87/GZfYMvLdj5X6bDG43/wT//B8GiRvoSxrL/0k6zXQudwTV79njlMNb5+Yxi83QZqi
 f/UtiAkNVB3+pSg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The local static 'struct pinctrl_desc' is not modified, so can be made
const for code safety after moving .pins and .npins assignment to
definition.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/pinctrl-pistachio.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-pistachio.c b/drivers/pinctrl/pinctrl-pistachio.c
index e7bf609609617d6af2f10a3df56c62e3bfe2dcd3..7f8b562c81c9cfd1ac3a0bd50018857450bdf609 100644
--- a/drivers/pinctrl/pinctrl-pistachio.c
+++ b/drivers/pinctrl/pinctrl-pistachio.c
@@ -1156,11 +1156,14 @@ static const struct pinconf_ops pistachio_pinconf_ops = {
 	.is_generic = true,
 };
 
-static struct pinctrl_desc pistachio_pinctrl_desc = {
+static const struct pinctrl_desc pistachio_pinctrl_desc = {
 	.name = "pistachio-pinctrl",
 	.pctlops = &pistachio_pinctrl_ops,
 	.pmxops = &pistachio_pinmux_ops,
 	.confops = &pistachio_pinconf_ops,
+	.pins = pistachio_pins,
+	.npins = ARRAY_SIZE(pistachio_pins),
+
 };
 
 static int pistachio_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
@@ -1474,9 +1477,6 @@ static int pistachio_pinctrl_probe(struct platform_device *pdev)
 	pctl->gpio_banks = pistachio_gpio_banks;
 	pctl->nbanks = ARRAY_SIZE(pistachio_gpio_banks);
 
-	pistachio_pinctrl_desc.pins = pctl->pins;
-	pistachio_pinctrl_desc.npins = pctl->npins;
-
 	pctl->pctldev = devm_pinctrl_register(&pdev->dev, &pistachio_pinctrl_desc,
 					      pctl);
 	if (IS_ERR(pctl->pctldev)) {

-- 
2.45.2


