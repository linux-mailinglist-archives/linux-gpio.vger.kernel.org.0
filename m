Return-Path: <linux-gpio+bounces-24929-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 891D7B33F7F
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 14:33:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6165116C6F9
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 12:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF5FB19DF8D;
	Mon, 25 Aug 2025 12:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SYKnRMoz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1D13594F;
	Mon, 25 Aug 2025 12:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756125162; cv=none; b=XGYjtNDgEiJiY3Oery2DoAD/lAXj3ftCmPH/s6niD7iyDcNk+Dvyvq7v25eihp2ogiGy3ifHz6PwGkLHgllDpsuvKX1joFZdzVip7dElzpCFtaWaFwDKCmCyiyY7wnp9olOYa0x2Ras74/qZcVo8Nac4ah0E2HQ2y9cF3XdXXnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756125162; c=relaxed/simple;
	bh=P/UDeMbttcPSVyBfhR/SlfF0HWH/j0Dfq4acB/iaDFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jsko0+QiXZaQyxoFCtVe4truAdQZehYEdqYsrXFJhoFYuXbQoCO9YjXTV0MKgDsCuVIJP8H/ZVVoP4UKQUsVdisznIoIL1hyk6lFsVw9HEw7UMvgMkYfz13MoPWpVUgANk3GVV5blT4Q+PRzLXdT1+s0VSOC+D5Vs1jVm8U91Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SYKnRMoz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1BE57C116C6;
	Mon, 25 Aug 2025 12:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756125162;
	bh=P/UDeMbttcPSVyBfhR/SlfF0HWH/j0Dfq4acB/iaDFs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SYKnRMozwSTs9BhHL0+crl9G5HlDXFTAHExBjKcfZISl5kKOln2BUBIL8oBRzQfl2
	 tevQw7gxIJHZ7LKvDMhaaYMHmHfakA0ZSyLkk3gle8SsW30GrkMdvXvmJniE9viwgx
	 MtyjAjbZpfLsm4l28taBY1CUAyvtEopIOq0trxRF/gBf6EUCYCuIu49Er6UbxtfZZ6
	 5TkH/ZARX4/lqV7bAR7dChu07HVGGEn8xq7etlGdkgZ2X4U7w8xEcicmzGRs0hkyce
	 lJWQvfy/aH1W3wqv4IrOYbecfsdSPIOzErVqSUff95UO4JEESv0cXCPwtt7vvw+8rP
	 VNJN5tMtJ6slQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED652CA0FE9;
	Mon, 25 Aug 2025 12:32:41 +0000 (UTC)
From: Nickolay Goppen via B4 Relay <devnull+setotau.yandex.ru@kernel.org>
Date: Mon, 25 Aug 2025 15:32:28 +0300
Subject: [PATCH v3 1/3] pinctrl: qcom: lpass-lpi: Introduce pin_offset
 callback
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-sdm660-lpass-lpi-v3-1-65d4a4db298e@yandex.ru>
References: <20250825-sdm660-lpass-lpi-v3-0-65d4a4db298e@yandex.ru>
In-Reply-To: <20250825-sdm660-lpass-lpi-v3-0-65d4a4db298e@yandex.ru>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Nickolay Goppen <setotau@yandex.ru>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756125160; l=2711;
 i=setotau@yandex.ru; s=20250815; h=from:subject:message-id;
 bh=JXoM3miyeg5XfaW9RV8i7oWQ6FTIiwpKlwfmyKxAlDw=;
 b=FYawZWsVh/I4+POXMh4WtPpuOBsqAOadAxCDc7xg66BNRj8/zgcbhRtuW/jkUoznfI8gihU28
 4EWLH8v3AIQCdcaNVEu5huCywip/atLGEDQpkPXJwB1sHx0OUS/dQWF
X-Developer-Key: i=setotau@yandex.ru; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=
X-Endpoint-Received: by B4 Relay for setotau@yandex.ru/20250815 with
 auth_id=492
X-Original-From: Nickolay Goppen <setotau@yandex.ru>
Reply-To: setotau@yandex.ru

From: Nickolay Goppen <setotau@yandex.ru>

By default pin_offset is calculated by formula: LPI_TLMM_REG_OFFSET * pin_id.
However not all platforms are using this pin_offset formula (e.g. SDM660 LPASS
LPI uses a predefined array of offsets [1]), so add a callback to the default
pin_offset function to add an ability for some platforms to use their own quirky
pin_offset functions and add callbacks to pin_offset_default function for other
platforms.

[1] https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.7.2.c27-07400-sdm660.0/drivers/pinctrl/qcom/pinctrl-lpi.c#L107

Signed-off-by: Nickolay Goppen <setotau@yandex.ru>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 18 ++++++++++++++++--
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h |  7 +++++++
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 57fefeb603f0e2502fccd14ba3982ae3cb591978..aa307088b0eedd3f2fe86045c1d71ab8a855858f 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -41,13 +41,27 @@ struct lpi_pinctrl {
 static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
 			 unsigned int addr)
 {
-	return ioread32(state->tlmm_base + LPI_TLMM_REG_OFFSET * pin + addr);
+	u32 pin_offset;
+
+	if (!state->data->pin_offset)
+		pin_offset = lpi_pinctrl_pin_offset_default(pin);
+	else
+		pin_offset = state->data->pin_offset(pin);
+
+	return ioread32(state->tlmm_base + pin_offset + addr);
 }
 
 static int lpi_gpio_write(struct lpi_pinctrl *state, unsigned int pin,
 			  unsigned int addr, unsigned int val)
 {
-	iowrite32(val, state->tlmm_base + LPI_TLMM_REG_OFFSET * pin + addr);
+	u32 pin_offset;
+
+	if (!state->data->pin_offset)
+		pin_offset = lpi_pinctrl_pin_offset_default(pin);
+	else
+		pin_offset = state->data->pin_offset(pin);
+
+	iowrite32(val, state->tlmm_base + pin_offset + addr);
 
 	return 0;
 }
diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
index a9b2f65c1ebe0f8fb5d7814f8ef8b723c617c85b..bfb85d438a02a5041c4d0218fd64bb68324b5881 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
@@ -85,9 +85,16 @@ struct lpi_pinctrl_variant_data {
 	const struct lpi_function *functions;
 	int nfunctions;
 	unsigned int flags;
+	u32 (*pin_offset)(int pin_id);
 };
 
 int lpi_pinctrl_probe(struct platform_device *pdev);
 void lpi_pinctrl_remove(struct platform_device *pdev);
 
+static inline u32 lpi_pinctrl_pin_offset_default(int pin_id)
+{
+	return LPI_TLMM_REG_OFFSET * pin_id;
+}
+
+
 #endif /*__PINCTRL_LPASS_LPI_H__*/

-- 
2.51.0



