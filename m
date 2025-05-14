Return-Path: <linux-gpio+bounces-20114-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 00075AB6396
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 09:02:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E9E01885A78
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 07:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9B5E2040A7;
	Wed, 14 May 2025 07:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UNcD5uGQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B161FCFFC;
	Wed, 14 May 2025 07:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747206102; cv=none; b=MJYLH8EOdx7rMd46ED5XhY4fnb1uU7/zMVLSrbRREu8zBYj1fSw73n3EKCT8HIpOfwC+Tc8KVCXkYXPYWCWeWv2hrhRDd5CpebJSIeSVj2P1O1iOVa3BbsV2dDpR3s7v66ct3YNA9YrJo3FO+ChAeOUZLQKaC+oOKW9LzKI5Cvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747206102; c=relaxed/simple;
	bh=urScH87aRUYYRU4uMH/UcgcwqDXNvfnULC466CYiu1A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mGWrlicG8UdSkYLOJerFRlRjY5XDBbRgDLFqFDluF4SBNL4gfRXYjpXLMXtQEdnWdNXGujp1Gk0kqzp7T+43DSdx9++T9YAtdg5a724wV+SuSCcN3d8EytwY17bSqgFDQTjpIwPaubeIE1AewWuRfHuozwOwhTXOKCbk9LaJDTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UNcD5uGQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54D4FC4CEF3;
	Wed, 14 May 2025 07:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747206102;
	bh=urScH87aRUYYRU4uMH/UcgcwqDXNvfnULC466CYiu1A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UNcD5uGQI9/jVyg8Di29D94BA3lKhnw11VkC391nr75+adpIkN071VF/MsE2+vrA0
	 +3vu8f0btFQcB+KRwbLqMN03cxrGnEwzPK0w0rSh30VztddhiA73C5rgTxVGTDN0uu
	 OEBbCNDG5H+UDkGePv5de6fRQKWCUDctFhz+E/laIG1sBCTfo9sWn6MLf/1bo5J8uz
	 pxsHx9nqDkU/hJSyVo4isAaxf3+J5Fp+63HutVj2ONwrGePxK0SPD2ht8OGWPNMXP3
	 PrKw97EuTruCSAvf39BfyK//xCTp1rV4GQdD4S34qIW80Y/Ra37Mo6BEzKGwmIx3+r
	 x1of5bS0L+Ypg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AF4AC3ABDC;
	Wed, 14 May 2025 07:01:42 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 14 May 2025 15:01:31 +0800
Subject: [PATCH 4/8] pinctrl: meson: a4: remove special data processing
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-s6-s7-pinctrl-v1-4-39d368cad250@amlogic.com>
References: <20250514-s6-s7-pinctrl-v1-0-39d368cad250@amlogic.com>
In-Reply-To: <20250514-s6-s7-pinctrl-v1-0-39d368cad250@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747206100; l=1982;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=FRMEmxN5zjpQVQOxtUKSm3GQm/lC+q2P8YsijCrDdRM=;
 b=+6hLKSp0TODk9+4jPyX0PxesuamsmX2QcK+x5esdSc3SYblzTFKWXatB/oAB2U0+Tfv5MEg6X
 ZWVfF23ZwRGA4BhIn08ObpMSlwTK3z44oHVT+iB42n7EHzbE+Qh2xO9
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



