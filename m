Return-Path: <linux-gpio+bounces-20380-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AA3ABEA4C
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 05:20:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6774C1B61940
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 03:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 970BF22DA0E;
	Wed, 21 May 2025 03:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U8U69ETY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC06BA36;
	Wed, 21 May 2025 03:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747797598; cv=none; b=WQHUjBJ0vIGCjhM0wyCm9Ocboj0sAxb6rsRmsI+814uh4NUhKBhLAcB6Dk+3kX/LZ76mOKuM0XcS/AILmzY5m56yaNwqsi3nDeVAZVAz/aN35oOSVWEEUz4jHNoe1BcQu57n+f92KNvA6l41ggaxsYPH7Io2CCP0zqcqB33t0i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747797598; c=relaxed/simple;
	bh=urScH87aRUYYRU4uMH/UcgcwqDXNvfnULC466CYiu1A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=St7LnqoV9LaztUAmRzoZW30KNr6pJk4fwt1Hxkh9pFQobIDeNTdujnz6qZigYquWfUU6ZKkM9DSOpvsNWWEkPl4QivAHlfIsg81icnxWM0fL1DDlGX1uIEOO8cpXlsYHJ0NOyAOfaoJLaT+FZqeLFyksqwvTzHNiG9cvTCZjasA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U8U69ETY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E8A88C4CEF3;
	Wed, 21 May 2025 03:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747797598;
	bh=urScH87aRUYYRU4uMH/UcgcwqDXNvfnULC466CYiu1A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=U8U69ETYhCgpd/7xhhjYmm8NwvdXgy+CAK9MhNtZD6qGE97BjA8XblYcuWq1XhReZ
	 KaBPn47XEl368VuF4STArQwOSMgk4effgpJ3Qva433ElHV3esM6cyL85csvXQl3xcY
	 5gHioKfhrl/r1cn8H4uoaP3E3g1N9VEGl9XL/WlYcf/gexDDbJgQ86DcBOBGMK9yIs
	 q81a9arOPqFxsnM7ykfccjngF761oSsD6ldvn/tuAdZTMrc0VrIDTwfX8f7uFJJu4a
	 FIscGGuE+jv+AIlBZh6AjKEX36oCGklU2nX0nO3ZSs2Vo3kYXoABu/qwxPOqA6PSlE
	 l7YL1PuWECqow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE33DC2D0CD;
	Wed, 21 May 2025 03:19:57 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 21 May 2025 11:19:58 +0800
Subject: [PATCH v2 4/8] pinctrl: meson: a4: remove special data processing
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-s6-s7-pinctrl-v2-4-0ce5e3728404@amlogic.com>
References: <20250521-s6-s7-pinctrl-v2-0-0ce5e3728404@amlogic.com>
In-Reply-To: <20250521-s6-s7-pinctrl-v2-0-0ce5e3728404@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747797595; l=1982;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=FRMEmxN5zjpQVQOxtUKSm3GQm/lC+q2P8YsijCrDdRM=;
 b=BnUKwq9rFXD1xM0UERW/kxg0uFOop/YPcCnUe/9W5BaSlFuIliZYLkIBEsUp33Ekw0SpcHRNL
 6PVxLZTla9/B/3TM2VXV73w0ISjrM18REAbx66iqdQx8TP3YxfETe1G
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

According to the data specifications of Amlogic's existing SoCs,
the function register offset and the bit offset are the same
value among various chips. Therefore, general processing can
be carried out without the need for private data modification.
Drop special data processing.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 33 +++---------------------------
 1 file changed, 3 insertions(+), 30 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index a76f266b4b94..90d4d10ca10b 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -50,15 +50,8 @@ struct aml_pio_control {
 	u32 bit_offset[AML_NUM_REG];
 };
 
-struct aml_reg_bit {
-	u32 bank_id;
-	u32 reg_offs[AML_NUM_REG];
-	u32 bit_offs[AML_NUM_REG];
-};
-
 struct aml_pctl_data {
 	unsigned int number;
-	struct aml_reg_bit rb_offs[];
 };
 
 struct aml_pmx_func {
@@ -843,31 +836,11 @@ static const struct gpio_chip aml_gpio_template = {
 static void init_bank_register_bit(struct aml_pinctrl *info,
 				   struct aml_gpio_bank *bank)
 {
-	const struct aml_pctl_data *data = info->data;
-	const struct aml_reg_bit *aml_rb;
-	bool def_offs = true;
 	int i;
 
-	if (data) {
-		for (i = 0; i < data->number; i++) {
-			aml_rb = &data->rb_offs[i];
-			if (bank->bank_id == aml_rb->bank_id) {
-				def_offs = false;
-				break;
-			}
-		}
-	}
-
-	if (def_offs) {
-		for (i = 0; i < AML_NUM_REG; i++) {
-			bank->pc.reg_offset[i] = aml_def_regoffs[i];
-			bank->pc.bit_offset[i] = 0;
-		}
-	} else {
-		for (i = 0; i < AML_NUM_REG; i++) {
-			bank->pc.reg_offset[i] = aml_rb->reg_offs[i];
-			bank->pc.bit_offset[i] = aml_rb->bit_offs[i];
-		}
+	for (i = 0; i < AML_NUM_REG; i++) {
+		bank->pc.reg_offset[i] = aml_def_regoffs[i];
+		bank->pc.bit_offset[i] = 0;
 	}
 }
 

-- 
2.37.1



