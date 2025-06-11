Return-Path: <linux-gpio+bounces-21303-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3252AD4B07
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 08:15:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98C2E7AAC53
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 06:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE5E22D797;
	Wed, 11 Jun 2025 06:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jCjuaYR7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E4122CBE3
	for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 06:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749622463; cv=none; b=GEepw4pKGhGI5CIWdUynSjtayX/YcQdsqIuJgZpL/FMv2rkcVAe73tIOw086t1EPcp8M0kbb5f3Q1bu94xmCEoftZej00uVqXiP20ijAOM1ERRRvtfa3GQUMLjziV5bI1VQkKnNBa2AcQHp0BTbmXhMhu3GxSXTskPSsUwfDfqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749622463; c=relaxed/simple;
	bh=NNpY2A6LBp263syvyG1Ecsfx8CioM309dnOrlcmWHKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qvlpj5+hP32vDkkGTzrg0R1jpr43w2m3Z1VhcyuYXTF5eq7utb3dUNkLSh11hiKXW6taLiWufw6rl9lRxBxd46xNnPm48RHZ1lmqFkXoDNF7F+cYjri+x8iJR/Pl75El0yIuEuZ6jqMBft6O/p42enO40NgQ/K3eNjg/0Es866s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jCjuaYR7; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4531898b208so313455e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 23:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622459; x=1750227259; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q86QDWzbyqUrHwy10F9ZLVZs4bIWtafdYZALzNzfzYA=;
        b=jCjuaYR7O8tZkQzIrDwhyqdYKo7gzjZ6heJtIsGbQCMg90zGo1duRORdJqVtqhC3Rn
         bivuqUQZtpTVSqbOBs0fEY6AvyfrKimtF+8oOC8CrdqAMd1vkkcO5c3wh0hrGJWKNP9R
         cctucrVnc5l8ABnbI3mjbn+GBwldtp9NJIwf6UP5jbDfEcG5HVJDY1LGsqvGrGG8WHti
         63dTiJxUMuNAUP6QoKZDY6qbIO3NvuhuTbnLz8skuXYLXaPEaeJ1TPfcbXILOMiKGRH1
         syJmxEZXr1ej8YSiUg+PksC4eZDpXO3LX+oWtZIjEYLxCI88cYxcmLz8mbf7XZXJMeQL
         yA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622459; x=1750227259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q86QDWzbyqUrHwy10F9ZLVZs4bIWtafdYZALzNzfzYA=;
        b=MuN+JXEYng+KzO33vPBvHRyB9YfcssNa3WNKQa07YSMJ4QTnbNfdQjr/dXM9rGr965
         Ei8OzCy2AB2HCkcIkHYqBcaTHY2mM3Mh63XuVN8PFLuBs3tT/CA3YKSJC7oM7VM+7CJk
         1OmTF9+WZ+vhw/bCSVBL/PD/GoXTqOMKfW/Nqsi2lB3J0JvmdGtIdeYmhsvP7neZdaLh
         LSo28412MKJ3MxNw6dNhEx4Da2E1zd9aJ/glqJZpynTak0whF9deLXZ9mpqLALtom3H7
         crgwj+G+mu/bAxGMt3fMBUXLc7QudNem2gkx7tdj9Ljuya/37a61f4j6Tw/U+mVHABJX
         5zMA==
X-Gm-Message-State: AOJu0Yxjo0xBzGj3mHSUwHzw3b4II6/lNTU3LJvPKAZH6zGBjBxgs8LY
	jyH/qQRRfYFi1/UHz2wz/uGiqMhhggbaRy62B2i7sOUaKZgra0L/P+2tp/5At1i89Ar3izo3Ic7
	qoKN7
X-Gm-Gg: ASbGncs0S2YstpwGR8hCBM02Hd0jQGC7HEkOVpJW9N4wgbB95vk5hqyA9TAMfdQJbAe
	mujUiuenT8YXSViKwEY/ZyVMxSTlLcf9cpyK3ovRqmGQpQz+ujJgKFRf6NfTON+gXKU4dHZN3tu
	CujP2NLP9lYLIoVzgENCogE7z5dOJaWjiWS792PNQ/ly4RkCK3idXsgJz4GUicuQkxpuvK+7b6m
	x0OrAEkW3YVlgQNXGeDIY+y3tRXV4p0+FyPShh6THmMsq//H6ovi3FnRcTtsnNS5Qj14PiaLvop
	rF4A91U5gYx3uRnT0s0bikeSCg1Rz0nfm1r5usQDDa7r0Jcb7KjMOQIhS9czlobkpHisn3XyZRI
	sU9w1a08=
X-Google-Smtp-Source: AGHT+IG0MrurMqwANRNDslKVkh3dKprU9y6IrTQpViebfAkp6mB1Umn/L5OKQlg735b88DTWJ/T9nQ==
X-Received: by 2002:a05:6000:288e:b0:3a5:2dae:970f with SMTP id ffacd0b85a97d-3a558821396mr547873f8f.13.1749622459437;
        Tue, 10 Jun 2025 23:14:19 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:14:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:35 +0200
Subject: [PATCH v2 03/17] pinctrl: amd: Constify pointers to 'pinctrl_desc'
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-pinctrl-const-desc-v2-3-b11c1d650384@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2097;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=NNpY2A6LBp263syvyG1Ecsfx8CioM309dnOrlcmWHKA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6hdhqC2eDe217cvGUZMEh1W/4vld1oNnYW+
 YkZbRVX0u6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkeoQAKCRDBN2bmhouD
 15CoD/4hfYjkCZdVyazNq2ibT7AGxKu+nI1YPoMthyyZMz5plU+l+nNgmymy2NyhFPLVlkvCK4A
 4FsvS1iJn3Dkr+y2bC4QBIUT6dXj23C/I9Y+3v2Xg6Hx56dWfC6oNqEvF+rYuLqoJpq7A4T3RPj
 11snIaP0e4JrVwiKZh0u+TcJM7WOVXMiQmX60PHyUR1rnzJ8HXuhCqTtE+RTBK6gIjHFzZGp5L9
 q8UgvNJTUf5z2aiIeb1m20vw8f+zaUsHEVTBA5pQfrzaP3VRCuXmtWb9nRDuE1Q5btLjbaAmtiG
 9eaROFIx5bFOf+Sg9Ok9Gj2Q10AZYnHmnkoy4IqVI6kGx30tO/SVz/T3rgjNol+hXAQHI1hLcmk
 XVGVC16NfQipwhxK+aPcl2ywGautuFcWgIHKgPcVZZENQIcSUvtYzB18VACNwO+5ipDcASefqro
 QFP3fiWL3DaMswdeQCBUr36ds+srNu1ED0hRChkBFVsv/mKeJCXpoy9aEwWCSVtFi89Zld0QFFX
 MVKlitmuZXfSPnxmXiQaGaYXstF+0Fj4VHKYg2U27Irx1aunnaZdNwgPgX5pSPhe9Y4xoUm0xrm
 2HtZbv19j2BQ7vx/8hkKMv2025M8QDoGlqAB55eUy1ppAZx8gZ1ZQyAOOBIcShwwTyUgeLGvELM
 hElg3VcQFmHOyDg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Internal functions obtaining pointers to 'struct pinctrl_desc' do not
modify the contents so they can be made pointers to const.  This makes
code safer, explicit and later allows constifying 'pinctrl_desc' in
pinctrl core code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/pinctrl-amd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 5cf3db6d78b79af9ac5e7226de239a0d2f9aaacc..85617cfed2299e131c110e9d4084370790106404 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -872,7 +872,7 @@ static const struct pinconf_ops amd_pinconf_ops = {
 
 static void amd_gpio_irq_init(struct amd_gpio *gpio_dev)
 {
-	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
+	const struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
 	unsigned long flags;
 	u32 pin_reg, mask;
 	int i;
@@ -901,7 +901,7 @@ static void amd_gpio_irq_init(struct amd_gpio *gpio_dev)
 static void amd_gpio_check_pending(void)
 {
 	struct amd_gpio *gpio_dev = pinctrl_dev;
-	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
+	const struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
 	int i;
 
 	if (!pm_debug_messages_on)
@@ -957,7 +957,7 @@ static bool amd_gpio_should_save(struct amd_gpio *gpio_dev, unsigned int pin)
 static int amd_gpio_suspend_hibernate_common(struct device *dev, bool is_suspend)
 {
 	struct amd_gpio *gpio_dev = dev_get_drvdata(dev);
-	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
+	const struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
 	unsigned long flags;
 	int i;
 	u32 wake_mask = is_suspend ? WAKE_SOURCE_SUSPEND : WAKE_SOURCE_HIBERNATE;
@@ -1001,7 +1001,7 @@ static int amd_gpio_hibernate(struct device *dev)
 static int amd_gpio_resume(struct device *dev)
 {
 	struct amd_gpio *gpio_dev = dev_get_drvdata(dev);
-	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
+	const struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
 	unsigned long flags;
 	int i;
 

-- 
2.45.2


