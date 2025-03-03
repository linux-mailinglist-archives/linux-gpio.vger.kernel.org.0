Return-Path: <linux-gpio+bounces-16895-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA565A4B894
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 08:53:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 745653B097B
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 07:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE2C91EA7D4;
	Mon,  3 Mar 2025 07:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gz50eZ79"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B334C85;
	Mon,  3 Mar 2025 07:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740988402; cv=none; b=Vh+jwNPVrJfzmyUYg+I3+y2uUo4JO++yoO5tAjbWZerpRPYQni1XDB6mwa2RfIfpUEnyN8+If1UGoEVoj4SS28VoFP/9EHDsw+ZsVUpyqbNDomDgHa2KucXHreUnXsK4ju4z9aNDKDSc51Xrux6z+BvJbXYAxcEGhfyfgxlLENU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740988402; c=relaxed/simple;
	bh=5Fy1JHZwgirUMzgviaoNnoeqtcdMUPjkKfMSR5S3E1U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CuK+X3Wr07BADokO3ayCPDCU+/EyVfJMmWY0OQCnKo4g45e4TgaMUqqI0HTTtA7BSFxMSaYxzcSwTUzqp0n4VDWKhJSt6/zyHF1jysXXbrGfrNMO8YzDqdeP/YeKb0d+kff5P6V3vlcmTvOistIYj44zpJgG1VBmZH9hKqqjdGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gz50eZ79; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05138C4CEE4;
	Mon,  3 Mar 2025 07:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740988402;
	bh=5Fy1JHZwgirUMzgviaoNnoeqtcdMUPjkKfMSR5S3E1U=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=gz50eZ79yZpQQ4AlK7w5ZxlkSinjqxwbRqqnh+Ktb9l76fhDJU841cYkRnJvHgluW
	 AK8NP3k+0DUAn8zZsjJhu3+19L3JLAYNE4qcSuFU4iMnRAsEnd5JljG503MrS5cylW
	 iJRN7/Yt/vlGkj1TQNSy1+F75kXw4IdBzd2mjmWk9rbgVKQTiQ6gPSB0W6/0741hHo
	 J2zzjYc7UWJCxpYXzFCj+3H8u27sizt95iE0wGym8mNqiF1FbRQZQvf3+rBY32Pz3E
	 4Du6Ylb3icoap3+GzS173u7Nn8UXvGQac2QrRyK2+WITeIpBWY3IxQ58/p6SsU6XIC
	 hMbI/8ku0iMXg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8269C282C5;
	Mon,  3 Mar 2025 07:53:21 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Mon, 03 Mar 2025 15:53:20 +0800
Subject: [PATCH] pinctrl: meson: fix pin input property for a4
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-fix-a4-pinctl-v1-1-6579888b4272@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAO9fxWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYwNj3bTMCt1EE92CzLzkkhxdkyQjQ9M04zRLEwsLJaCegqJUoAKwedG
 xtbUAl0BJTl8AAAA=
To: Linus Walleij <linus.walleij@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740988400; l=1905;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=8KAlxGwDBrTjecjGM2UBSMoeZW/HVDXc337RfYbdpLs=;
 b=lSCzkCPO4V0PMaYz3RHyLMVvoDIJFa+ttEleYaHx84tqa5hPPEuIuhBgqPVQxEuCkdXP9TslC
 bIGD/OzMizrAHgH73PTjU+OBpqW5wF23nSa2kAG3qyHAmbGpcSMfPcW
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

The register of pin input attribute means the opposite.
value of reigster meaning is 1 for input and 0 for output.
So fix it.

Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index a5218e8f1e03..35d5540b8eaa 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -775,7 +775,7 @@ static int aml_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
 	if (ret)
 		return ret;
 
-	return BIT(bit) & val ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
+	return BIT(bit) & val ? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
 }
 
 static int aml_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
@@ -785,7 +785,7 @@ static int aml_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
 
 	aml_gpio_calc_reg_and_bit(bank, AML_REG_DIR, gpio, &reg, &bit);
 
-	return regmap_update_bits(bank->reg_gpio, reg, BIT(bit), 0);
+	return regmap_update_bits(bank->reg_gpio, reg, BIT(bit), BIT(bit));
 }
 
 static int aml_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
@@ -796,7 +796,7 @@ static int aml_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
 	int ret;
 
 	aml_gpio_calc_reg_and_bit(bank, AML_REG_DIR, gpio, &reg, &bit);
-	ret = regmap_update_bits(bank->reg_gpio, reg, BIT(bit), BIT(bit));
+	ret = regmap_update_bits(bank->reg_gpio, reg, BIT(bit), 0);
 	if (ret < 0)
 		return ret;
 

---
base-commit: 73e4ffb27bb8a093d557bb2dac1a271474cca99c
change-id: 20250303-fix-a4-pinctl-4b215f3f9488

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



