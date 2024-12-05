Return-Path: <linux-gpio+bounces-13527-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A25269E4D02
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 05:19:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BB90161C1C
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 04:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0BC01465B8;
	Thu,  5 Dec 2024 04:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RnHPszmx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64EB179A3;
	Thu,  5 Dec 2024 04:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733372350; cv=none; b=oDKxyfIduTeGEkFeBE9/MIv6zCEr+u0xtWA+BUZ7SFPYrLBrzdYww5t/UHdJ/ETMiz1cA8ERLh9/17GPpaf5oJMIvq5WIMtAgMVt73aRNPjfFp4SPDTIOcAQaAUq0H5SSZ1NiNLQrLwemCFK4T5cxjoyGjT+p6LBf6/hxliic4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733372350; c=relaxed/simple;
	bh=eU0xF9m0VlCJgERO/ImrJwRfxMh/h2TsanEkWuiggAE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gqYlVmK3DEtwEosP7zK1d3fIWvQ7Vm1PF4oqaw4mQ0b/XWrlX3ihDiDesQCDWH4pFiLriCy7VxA2NBkS2eoFf3GvpKVdwVfF694BxSlVqZXzRB39Byn1Xhhbgahq2mg+g1kIYOtFBDULwijYNecFCyqedpeWCsR8m2kzyq0BhuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RnHPszmx; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7b676152a86so172210785a.1;
        Wed, 04 Dec 2024 20:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733372348; x=1733977148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fIsW9ZbBJH35/ofhXRoLLDoPk7qr9yyhaAH28xywAJs=;
        b=RnHPszmx2slTt4V+PDWBNMa7KsSl4mYPeAf+rhMMhgnEO2M7dhEcrRXhILN7MHoiP9
         rhwPNAhvg1pwEiR7UPXKYcfvVosaAOcFuaRR3fwv87ggxMeYLFJYJBMHc1RCBppfOLUC
         NiOLa1MOhfQwaLeWm0A2GPYomjr6C6Y43EhTLhfAK/Uu2MAZWRm2usEEpGlangiohNBd
         2H4PM0CRW1x2vMBEz2DWciDka561Saa/K8oY9YdrFOVt57EiFoML+D3zwp9vK2FQnyIB
         ekDpCQRG0JWv3JEBhbGJ1ee3ncIjheQhee/AK3buaqhZ3oXzwc0c56k9FHp67T7pni/b
         ZIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733372348; x=1733977148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fIsW9ZbBJH35/ofhXRoLLDoPk7qr9yyhaAH28xywAJs=;
        b=fZwZRnw6lo1nsnmKmmxGbNgvSQyjNAMx9R+ELof6EdrKhvs5kcUm1fcl6MEQTqwa1+
         SswCTqYs/IyvJVpHgsk3jbWaoXyJQxTyi/GVUut6xJPipagKFUoPGXoONGDS9SExMUxt
         NbgY8eqj4RwhbV3MNx+Q19r3N0Pt0yCjq+fPlWwxFtjLrcvvs/Cs3mzkQxWjPOG8r8e1
         RtuCN3Y1Ue2/2TtdDHRIsv4NgeDbTgmljNFgmpEOQ/wkpzb62I3uoFEQ2RLYWMKzi4kw
         3X0p1M5OUszS814KO8C9tkrF3cQD0DuHDtismfaoGvBNry60M5Onqtpq1RGTno9ukEXn
         SD7g==
X-Forwarded-Encrypted: i=1; AJvYcCX/jNaC6RDHmCmQBRtVLUCgmjEJBe/hluZPu/e78uAfY+cIuyjnT7h42D4nr3gLniyh4u6cZoW9udYo@vger.kernel.org, AJvYcCX8dpvV5rpBJWdCQ86bEWgYFYHN+UQadbO0hXMWoJlETjL/2NCt1z58vFfqYGS8Y3UViOFeZyt1NcENZQG+@vger.kernel.org
X-Gm-Message-State: AOJu0YyXqAZQxmmMuAXvhs0KX7LeRpbAfBAQoZnfDxZEh7L3Vkoms1IA
	bV9ejbIbh+PL8M8YlvsBV9I3JzJZrpp6J8+2tWRo09PR5X6IZ1r/
X-Gm-Gg: ASbGncsQwqdHh7kZ7qwWEX4Kn7H9xOTjUZMiWIQsZ41IfXZ+T2xy1NvwlBhJM7w/+7E
	vjvObgmsudk2Mj9kbXCdTe6j2XWZKJtc77TZakGwiKI4DwnTy5RXZIgd1AzOTn+rTEjbu627rrL
	ci7Lq5ZfE+FX0YqWhiDd9VcOacqwwyutrA8z2ffC2uRiPfI/rym37A4hkPKcnLBv2z4c2w5Bpbw
	R8uX8CGl3NnAWhmOOezIRb3lveKFL1fWg1Or3wOaTtnBIneoqiTSgQb0jSV2g==
X-Google-Smtp-Source: AGHT+IGb15BU9VZuTfcCc0Kt4sxDfpy9Ekjg2I7uCZCEK0h+QJBSNLMKU3cxm4nqE2b2Ha98hRfcsg==
X-Received: by 2002:a05:620a:488e:b0:7b6:6fb4:2967 with SMTP id af79cd13be357-7b6b4188fdemr333159985a.10.1733372347741;
        Wed, 04 Dec 2024 20:19:07 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6b5a5c2e6sm26301585a.42.2024.12.04.20.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 20:19:07 -0800 (PST)
From: Mingwei Zheng <zmw12306@gmail.com>
To: linus.walleij@linaro.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mingwei Zheng <zmw12306@gmail.com>,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH] pinctrl: nomadik: Add check for clk_enable()
Date: Wed,  4 Dec 2024 23:22:14 -0500
Message-Id: <20241205042214.2410982-1-zmw12306@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add check for the return value of clk_enable() to catch the potential
error. Change return type of nmk_gpio_glitch_slpm_init casade.

Fixes: 3a19805920f1 ("pinctrl: nomadik: move all Nomadik drivers to subdir")
Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 drivers/pinctrl/nomadik/pinctrl-nomadik.c | 29 +++++++++++++++++------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index f4f10c60c1d2..2207c9513afd 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -438,9 +438,9 @@ static void nmk_prcm_altcx_set_mode(struct nmk_pinctrl *npct,
  *  - Any spurious wake up event during switch sequence to be ignored and
  *    cleared
  */
-static void nmk_gpio_glitch_slpm_init(unsigned int *slpm)
+static int nmk_gpio_glitch_slpm_init(unsigned int *slpm)
 {
-	int i;
+	int i, ret;
 
 	for (i = 0; i < NMK_MAX_BANKS; i++) {
 		struct nmk_gpio_chip *chip = nmk_gpio_chips[i];
@@ -449,11 +449,15 @@ static void nmk_gpio_glitch_slpm_init(unsigned int *slpm)
 		if (!chip)
 			break;
 
-		clk_enable(chip->clk);
+		ret = clk_enable(chip->clk);
+		if (ret)
+			return ret;
 
 		slpm[i] = readl(chip->addr + NMK_GPIO_SLPC);
 		writel(temp, chip->addr + NMK_GPIO_SLPC);
 	}
+
+	return 0;
 }
 
 static void nmk_gpio_glitch_slpm_restore(unsigned int *slpm)
@@ -923,7 +927,9 @@ static int nmk_pmx_set(struct pinctrl_dev *pctldev, unsigned int function,
 
 			slpm[nmk_chip->bank] &= ~BIT(bit);
 		}
-		nmk_gpio_glitch_slpm_init(slpm);
+		ret = nmk_gpio_glitch_slpm_init(slpm);
+		if (ret)
+			goto out_pre_slpm_init;
 	}
 
 	for (i = 0; i < g->grp.npins; i++) {
@@ -940,7 +946,10 @@ static int nmk_pmx_set(struct pinctrl_dev *pctldev, unsigned int function,
 		dev_dbg(npct->dev, "setting pin %d to altsetting %d\n",
 			g->grp.pins[i], g->altsetting);
 
-		clk_enable(nmk_chip->clk);
+		ret = clk_enable(nmk_chip->clk);
+		if (ret)
+			goto out_glitch;
+
 		/*
 		 * If the pin is switching to altfunc, and there was an
 		 * interrupt installed on it which has been lazy disabled,
@@ -988,6 +997,7 @@ static int nmk_gpio_request_enable(struct pinctrl_dev *pctldev,
 	struct nmk_gpio_chip *nmk_chip;
 	struct gpio_chip *chip;
 	unsigned int bit;
+	int ret;
 
 	if (!range) {
 		dev_err(npct->dev, "invalid range\n");
@@ -1004,7 +1014,9 @@ static int nmk_gpio_request_enable(struct pinctrl_dev *pctldev,
 
 	find_nmk_gpio_from_pin(pin, &bit);
 
-	clk_enable(nmk_chip->clk);
+	ret = clk_enable(nmk_chip->clk);
+	if (ret)
+		return ret;
 	/* There is no glitch when converting any pin to GPIO */
 	__nmk_gpio_set_mode(nmk_chip, bit, NMK_GPIO_ALT_GPIO);
 	clk_disable(nmk_chip->clk);
@@ -1058,6 +1070,7 @@ static int nmk_pin_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	unsigned long cfg;
 	int pull, slpm, output, val, i;
 	bool lowemi, gpiomode, sleep;
+	int ret;
 
 	nmk_chip = find_nmk_gpio_from_pin(pin, &bit);
 	if (!nmk_chip) {
@@ -1116,7 +1129,9 @@ static int nmk_pin_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			output ? (val ? "high" : "low") : "",
 			lowemi ? "on" : "off");
 
-		clk_enable(nmk_chip->clk);
+		ret = clk_enable(nmk_chip->clk);
+		if (ret)
+			return ret;
 		if (gpiomode)
 			/* No glitch when going to GPIO mode */
 			__nmk_gpio_set_mode(nmk_chip, bit, NMK_GPIO_ALT_GPIO);
-- 
2.34.1


