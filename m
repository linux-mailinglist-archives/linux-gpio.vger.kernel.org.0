Return-Path: <linux-gpio+bounces-14990-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB20A18A9C
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jan 2025 04:26:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D41A16B32B
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jan 2025 03:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07974158553;
	Wed, 22 Jan 2025 03:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HsAuuP8M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9E213B7B3;
	Wed, 22 Jan 2025 03:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737516365; cv=none; b=r4QoMVEFB09pmnUJ23h/s6Xm6tsDzPq4zBZ+djA9tQ4MgKMw6bgt4T2CCYDkqOuewWrp9/aCKdW9ufP6DQbu6EDm8odE/0UZfklVmP9QGoUnxoiK1Dm4N2CrzCg4v6NSf505E3X8bFtiXoQmw7XGqyHINaKzc74AtqQAQucjR6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737516365; c=relaxed/simple;
	bh=t2wfr4/PkO9Lh3Bw0KccXsVOWadq4npkK7mf3G0pXFk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NHIHnpYhXDU178lBPtDbmcxZs65EI1NeYpRA3+nkrpFV1J0ww9Yc4gyZnBKb/2oJZaZynpWj/0/RoHZeoe64tHxc7ua8wKbeThaHnrSlOwU7vdaRU62ZqzI9ore5Yyfxn2L3z59Rf/VJnVWAzUEhz5Y69zoxO1eRr6IsiDOXOC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HsAuuP8M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 242BFC4CED6;
	Wed, 22 Jan 2025 03:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737516365;
	bh=t2wfr4/PkO9Lh3Bw0KccXsVOWadq4npkK7mf3G0pXFk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=HsAuuP8MbMZBzLK/VV8ifd69BBHYv/kuC4reZIhYDpm9sSnmKcOZIbh6e4r+AbL3D
	 HAeywFOcRtzLPEGoAevNJLJk0ozZnAmqB8XLhR6iAt0KuaicfLFZMD9NM1X0L9e8sB
	 Akn7t9JgI/TIVwrAbAyn10XDbhmLMFcPkELPKlNMWZprmKBLYvRxcNPz6WiDOWf7gA
	 33Vjqsb606YiRb/n16A5BKygCbks81pL9fVZtRwNO5eEtkhM4RnCdyjAyX8hms3awX
	 ka4qnfL5DOIhm/rBOgFD8ZcNbAo0sMzhUL+8QInlqMzNl1VulJucc3KhI1pGFbUpFd
	 r4b3G7l6Rex3w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B61AC02181;
	Wed, 22 Jan 2025 03:26:05 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v4 0/5] Pinctrl: Add Amlogic pinctrl driver
Date: Wed, 22 Jan 2025 11:25:58 +0800
Message-Id: <20250122-amlogic-pinctrl-v4-0-4677b2e18ff1@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEdlkGcC/3XNSw6CMBCA4auQrq3pTF/oynsYF6VUaAKUFEI0h
 LtbiCYa4vKfzHwzk8FF7wZyzmYS3eQHH7oU4pARW5uuctSXqQkyFIAA1LRNqLylve/sGBuK6Iy
 CHFnJSpKu+uju/rGJ11vq2g9jiM/twQTr9L81AWVUANOoOZcAp8t742hDS1Ztwi8B1V7AJNjSO
 IFG6UKrvcA/gmQAci/wJGCRS66E1KYwv8KyLC8v+5EfNAEAAA==
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737516363; l=3484;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=t2wfr4/PkO9Lh3Bw0KccXsVOWadq4npkK7mf3G0pXFk=;
 b=oql750cdOMuzojijnhNz0Mv/peGMkD6Mlq6I4ChVZCwrxxDIfpOtbXRbXrKWxuoD6LDqlG86u
 VkI6c1lxlToC+jYdnFNEdKNOjhV244OzNscoE/5FuxvVv5N8JwDFEur
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

Add pinctrl driver support for Amloigc SoCs

Base on the previous discussion,
https://lore.kernel.org/r/20241113-a4_pinctrl-v6-0-35ba2401ee35@amlogic.com
The existed meson driver failed to meet the requirement of the current dt-binding.
So we start this new pinctrl driver to solve problem.

The advantage of this version: Once the source file and binding document
are added, adding dts node will be only operation for subsequent Amlogic SoCs
(such as A4, A5).

The code in DTS file is also readable when using GPIO, as below:
reset-gpios = <&gpiob 6 GPIO_ACTIVE_LOW>;

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v4:
- Drop bank-number property, and get information from gpio-ranges property.
- Keep required of pinctrol after patternProperties, and add missing "ranges" for required.
- Add required(pinmux) of function.
- Keep address-cells and size-cells property values, because:
  Previously only represented a register address offset value, now directly represents a register, through 'ranges" which to represent.
- Some little modifications were made to bindings and dts according to Krzysztof's suggestions.
- Link to v3: https://lore.kernel.org/r/20250115-amlogic-pinctrl-v3-0-2b8536457aba@amlogic.com

Changes in v3:
- Move reg and reg-name from pin controller node into gpio-controller node and drop mask property.
- Use gpio-range instead of ngpios property.
- Some little modifications were made to bindings according to Rob's suggestions.
- Fix bug reported by kernel test robot.
- Two pin controller node compressed into one because of register address defined in gpio-controller.
- Link to v2: https://lore.kernel.org/r/20241226-amlogic-pinctrl-v2-0-cdae42a67b76@amlogic.com

Changes in v2:
- Some modifications and optimizations were made to bindings according to Rob's suggestions.
- Refined some details on functions node for bindings. 
- Some source code optimizations were made according to Linus's suggestions.
- Add stand API to generic to deal pinmux propertity.
- Add private reg data to deal with for future SoCs.
- Simplified some unused processing (previously used for extension).
- Sync add to MAINTAINERS files.
- Link to v1: https://lore.kernel.org/r/20241211-amlogic-pinctrl-v1-0-410727335119@amlogic.com

---
Xianwei Zhao (5):
      dt-bindings: pinctrl: Add support for Amlogic SoCs
      pinctrl: pinconf-generic: Add API for pinmux propertity in DTS file
      pinctrl: Add driver support for Amlogic SoCs
      arm64: dts: amlogic: a4: add pinctrl node
      MAINTAINERS: Add an entry for Amlogic pinctrl driver

 .../bindings/pinctrl/amlogic,pinctrl-a4.yaml       |  127 +++
 MAINTAINERS                                        |    8 +
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |  120 +++
 drivers/pinctrl/Kconfig                            |   18 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/pinconf-generic.c                  |  130 +++
 drivers/pinctrl/pinconf.h                          |    4 +
 drivers/pinctrl/pinctrl-amlogic.c                  | 1053 ++++++++++++++++++++
 include/dt-bindings/pinctrl/amlogic,pinctrl.h      |   46 +
 include/linux/pinctrl/pinconf-generic.h            |    4 +
 10 files changed, 1511 insertions(+)
---
base-commit: 4de5110762b94b9978fb8182a568572fb2194f8b
change-id: 20241211-amlogic-pinctrl-22ea61820d0d

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



