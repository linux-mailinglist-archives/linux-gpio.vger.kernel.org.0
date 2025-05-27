Return-Path: <linux-gpio+bounces-20573-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63226AC478B
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 07:23:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 452AE3A93C7
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 05:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C2AF1DF749;
	Tue, 27 May 2025 05:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mbkJdXsD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FF01D5170;
	Tue, 27 May 2025 05:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748323411; cv=none; b=GexRrats3FL2n40ed7dAIQzE5tZar78PR4Aa6orAgJD5lRBlOlsUVg4ukkvGbNzWcxHJfXQrilC8zOk2iKh9wJ+TdUrxxZKi0T63EYE5eLLB4x7XY4oKocYZleantl5nMO0ufDG+woUpIBJvSZrx6irh3ixD7MwjJLZJJRNscHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748323411; c=relaxed/simple;
	bh=1L6yZi98OMXSwGuVg1fqDNJOAY9tKiGWyTN1OH6EbiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j9ojHpk0PmJ6cgqWDHCLvJDsadv9nSkUkIqG8yIgLQP+zN5zPAD4Jym5SASLxIKRCyUF4MbCqTY+Z3ixclzwQMeKW3Zm8QVF8LP7AEu3DjbYwRFzKAM9vTxUZQZ2mVPDQgQl+6Ojq3YERU9PLKwLrgeMu/pLyP/P+A+KXwowjKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mbkJdXsD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76803C4CEEF;
	Tue, 27 May 2025 05:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748323410;
	bh=1L6yZi98OMXSwGuVg1fqDNJOAY9tKiGWyTN1OH6EbiI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mbkJdXsDLBUaGBxZHauuX2jN7tcoNNQqY4H6OsyI6zTjnIR6p8Ing/dHjdqWikFF8
	 XmUK2A7hGXtzklVEW4S8W4SHRFNoOSfElO7FaM6Oq9/t8oZxEZfxa8ZThCkf4tidUR
	 nG2NtZhorbAriHWLzIFGfRg/8ZvX4OZf2iAMaZZeeIFw/EcuxSKFda0i7pR5sbEZTM
	 h+MCEd+9HSODB2JSrdXmdD1fsTxn3ZhR80V/F7Ud99xj6F5cye6F4TC+/FjNjH1fno
	 TnoGRcfQyTcVvTowlGjG1rHu00abSfvAuZFdKR/qz4J50BliQsqUEZwHKhI9VuRg5k
	 iOa6X1828qAVg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 655A4C54F30;
	Tue, 27 May 2025 05:23:30 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 27 May 2025 13:23:29 +0800
Subject: [PATCH v3 2/6] pinctrl: meson: a4: remove special data processing
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-s6-s7-pinctrl-v3-2-44f6a0451519@amlogic.com>
References: <20250527-s6-s7-pinctrl-v3-0-44f6a0451519@amlogic.com>
In-Reply-To: <20250527-s6-s7-pinctrl-v3-0-44f6a0451519@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748323408; l=1982;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=g72piH28WZYJsuGTLrHAVcqtzDHjy35+PP/ZYnzW+rI=;
 b=rrK5/km3xKR3SJKuUH/4jDuMIKsv8qSz/aPkYq10bR2tZPJayF7mVdVQyuwBjHtR+yWBtREce
 LR2LUpEfu5tDH/vEu3hsoIA7N96Ws/T7KUNGgupXnZcd5CKOdSjxjNN
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
index 385cc619df13..11f68224342e 100644
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
@@ -829,31 +822,11 @@ static const struct gpio_chip aml_gpio_template = {
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



