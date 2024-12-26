Return-Path: <linux-gpio+bounces-14238-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7539FC98E
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Dec 2024 08:57:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F14A7A0887
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Dec 2024 07:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D1851CF5DF;
	Thu, 26 Dec 2024 07:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SLQqn4xu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3130C8248C;
	Thu, 26 Dec 2024 07:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735199866; cv=none; b=Udr7tDnyBDRu1fs9h+Us0lTyGc/4Gjz9mau2R3hUOKUC5UDlbUZKt45tcirv7iHGpGKDVJP5lYmdtpyOktJPNQjhRFSvzAhQsCcLZ3AOZ9lnzJsGZcv/i7qJbd/0cMK99KUxGbdVSszCvDbKv/Dq623JLqsacoCuak+ySKoXGsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735199866; c=relaxed/simple;
	bh=8b/59hoXnXDAUbIUEYcQ6psWuniloV83ts4PS5yxSSc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=keYufqns76ibuEqrjukwC0BhiNaFMYE76dnbMpBTHL7uoo8+kGAgh9wPCwaQcmGPcm9q1A1NF/KDRzF+o1lC/Px+zQx5HF1TB6+MJ3Fi4mM5E59nswCcMzcLLC+2za35kEtpQ7BAZZB0crj9nB/GO+MiV5ZUVBwTWEWzeMcSyWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SLQqn4xu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CDB3AC4CED1;
	Thu, 26 Dec 2024 07:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735199865;
	bh=8b/59hoXnXDAUbIUEYcQ6psWuniloV83ts4PS5yxSSc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=SLQqn4xuB6CFv8dg3bnuYbi/1C02O547k/UDrtV12F7KcRWpKUUGMe109J/G/Lqg/
	 +rWTxvjJBw/a8ETfWImCTtHyKFvA0hPv8NwBgihKOckGKyQuUkTPgeZe8FtQz98W3L
	 6k0/DIcmqPOjZMWq0QAjHPrZsjF4zKsvcLeqNlxeAU6ssGg3lCbta173AxGeNX0eqg
	 mWpzL7LerxJiWkKAWRD+XrrXKjOSiJzEr7rd7ScTrkGmPEsoH7bOlqBOjhdeALrnTK
	 hSIQqMwcmbLVzN01MWV9fBuoLvcHuup6w3Q41XZ07+fpG7bCSHmmz4YA/V2jjx7CfI
	 OMdQwBlq5qu1g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5924E77188;
	Thu, 26 Dec 2024 07:57:45 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v2 0/5] Pinctrl: Add Amlogic pinctrl driver
Date: Thu, 26 Dec 2024 15:57:40 +0800
Message-Id: <20241226-amlogic-pinctrl-v2-0-cdae42a67b76@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHQMbWcC/3WNwQ6CMBBEf4Xs2TXdBUU9+R+GQ9NW2AQoaUmjI
 f13K/Hq8U1m3mwQXRAX4VZtEFySKH4uwIcKzKDn3qHYwsCKG2Ii1NPoezG4yGzWMCKz02e6sLL
 KQlktwT3ltRsfXeFB4urDez9I9E3/uxKhwoZUy21dn4iu91/jaPwEXc75A8+qYYuwAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735199863; l=2379;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=8b/59hoXnXDAUbIUEYcQ6psWuniloV83ts4PS5yxSSc=;
 b=g7vOqRgzWD6wbJu6ZnJIYzXnuvYrSKYObzaPPRDDncvr3/7T5Uh2NGMiBOE6kG9mOYKexn8bu
 c9P5+f3KiSADr1WYPYvuzAxx620iDH4bbdU8mO1fDqSnc8WFlMx9Ieu
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

 .../bindings/pinctrl/amlogic,pinctrl-a4.yaml       |  155 +++
 MAINTAINERS                                        |    8 +
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |  133 +++
 drivers/pinctrl/Kconfig                            |   18 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/pinconf-generic.c                  |  130 +++
 drivers/pinctrl/pinconf.h                          |    4 +
 drivers/pinctrl/pinctrl-amlogic.c                  | 1047 ++++++++++++++++++++
 include/dt-bindings/pinctrl/amlogic,pinctrl.h      |   68 ++
 include/linux/pinctrl/pinconf-generic.h            |    4 +
 10 files changed, 1568 insertions(+)
---
base-commit: 4de5110762b94b9978fb8182a568572fb2194f8b
change-id: 20241211-amlogic-pinctrl-22ea61820d0d

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



