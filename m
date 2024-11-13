Return-Path: <linux-gpio+bounces-12918-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 873D99C6B8F
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 10:37:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4776528415E
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 09:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87CDE1F80D9;
	Wed, 13 Nov 2024 09:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OWzWrLDq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3094F1C9B62;
	Wed, 13 Nov 2024 09:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731490656; cv=none; b=qrG4u+d3xoXAppepbK4BvoYJXjRmYYEhZEyJUJONUOQhgJ4LAWXHASFP1UCrPhjE6xPzgpEVIkqj6sg87EJZddkLdyg7111P7lfxGqygPjZIkRHJCnfVDnT4V7c2unG/6275bZaQDyP/v+5+bOBptVLctd/P93obnVm8sxNHpPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731490656; c=relaxed/simple;
	bh=qTS2ziexAh89vvy4FSHg7dzW319+bsLiuJWRRaM9kfs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uOJsVMxYo0c9VhBYHqh7oMq6tChHK5tIwuO9G8PG2aPKPjCbqhfPPk+TjR62BUhaomXKc9ytQTpV30HjWTt+HqM+W45VptUZZbiQ+Z8vsmWnFnakZjj+n9mwMhJ8AyH8jDYN1P3IAkdb6uKQhfRz/s4g3UTsaGP6bV9ekd2+QQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OWzWrLDq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F4B3C4CECD;
	Wed, 13 Nov 2024 09:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731490655;
	bh=qTS2ziexAh89vvy4FSHg7dzW319+bsLiuJWRRaM9kfs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=OWzWrLDqWavENPjjF7MlpPVcZKHR50slUJkPVjP/XwNTPCmPlLCY9qSbcq1bKyV7L
	 06wPIIh1DTwlKzedLx9jiHLlY6WvL98d4UMxmKTOFk2IFAuXMOgjBuyuZ3WCOTmCEW
	 HVAr5ss7wlVYJbvucy21vjmFh+zK1Wgw6h4EOT++RQxk+wpCCJvf9Ylu5g+rWFl3JS
	 prSS09wwyqVb7+f/kpFYOWrngkfNy9y69s5/9RO6s0adExGRko5KVdVkfRZVd80nAC
	 WabSKCK38VEnB142TDOggrd/KFgGXSf1gARQcNhfXqvOEihKf5EB7iLUJOEsvd9Vny
	 nFMZjF8Ymyc+g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9231ED41C24;
	Wed, 13 Nov 2024 09:37:35 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v7 0/5] Pinctrl: A4: Add pinctrl driver
Date: Wed, 13 Nov 2024 17:37:27 +0800
Message-Id: <20241113-a4_pinctrl-v7-0-0546a20c1c22@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFdzNGcC/2XP0YoCIRTG8VcJrzOOetRpr/Y9llhMz5RQM+GEb
 MS8+2oQjczlJ/z+HJ9sohRpYl+bJ0uU4xTHoQy73TB/dsOJeAxlMwkSBQjJHf7e4uDv6cJhH8R
 ROmEJLSvglqiPf6/Yz6Hsc5zuY3q82lnW13cGl5ksOXBFFp3RXnaavt31Mp6i3/nxymooqyXuG
 qwKJmv6IHwPItg1xg8uusFYcR/2HQWvXMA11gvc/j7rejYa8CTAYwdrbJZYNdhUrI9OIggipVs
 8z/M/b9ou45oBAAA=
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731490653; l=3357;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=qTS2ziexAh89vvy4FSHg7dzW319+bsLiuJWRRaM9kfs=;
 b=rVtfd7vxwtUNkzCi2pn9hCbxfuRYSfTKlT18lUv3Tzahuctx0RDSKWrhvzhSwQamm7cQgGRPW
 OMR9fcgHNwjDL7k0eMuzDAew3mlwzGHQM8bER6qm2c9BRBt7XYJ1V+T
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

Add pinctrl driver support for Amloigc A4 SoC

All of Amogic SoCs GPIO device requirement is met here by
adding GPIO bank definition instead of the pin definition.
Binding header files will no longer be added to future
SoCs's pin devices.

The pinctrl software only adds insterface of of_xlate to support
for transformation without affecting the overall framework and
is compatible with previous drivers.

The code in DTS file is also readable when using GPIO, as below:

reset-gpios = <&gpio AMLOGIC_GPIO_X 6 GPIO_ACTIVE_LOW>;

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v7:
- Move gpio-controller property with "#gpio-cells" property
- Link to v6: https://lore.kernel.org/r/20241113-a4_pinctrl-v6-0-35ba2401ee35@amlogic.com

Changes in v6:
- Adjust code formatting and style.
- Remove "#gpio-cells" definition from amlogic,meson-pinctrl-common.yaml
  and add them in all amlogic,meson-pinctrl-XXX.yaml with const: 2, and then
  add amlogic,meson-pinctrl-a4.yaml(copy form  amlogic,meson-pinctrl-a1.yaml) with const: 3.
- Link to v5: https://lore.kernel.org/r/20241112-a4_pinctrl-v5-0-3460ce10c480@amlogic.com

Changes in v5:
- Modify if to switch.
- Dropped parameter combination, bank and offset as independent parameter passing
- Link to v4: https://lore.kernel.org/r/20241101-a4_pinctrl-v4-0-efd98edc3ad4@amlogic.com

Changes in v4:
- Add interface of of_xlate support.
- Add const for some variable.
- Link to v3: https://lore.kernel.org/r/20241018-a4_pinctrl-v3-0-e76fd1cf01d7@amlogic.com

Changes in v3:
- Remove head file from binding.
- Move GPIO define to file *.c.
- Link to v2: https://lore.kernel.org/r/20241014-a4_pinctrl-v2-0-3e74a65c285e@amlogic.com

Changes in v2:
- Use one marco instead of all pin define.
- Add unit name for dts node.
- Link to v1: https://lore.kernel.org/all/20240611-a4_pinctrl-v1-0-dc487b1977b3@amlogic.com/

---
Xianwei Zhao (5):
      dt-bindings: pinctrl: move gpio-cells and gpio-controller property
      dt-bindings: pinctrl: Add support for Amlogic A4 SoCs
      pinctrl: meson: add interface of of_xlate
      pinctrl: meson: Add driver support for Amlogic A4 SoCs
      arm64: dts: amlogic: a4: add pinctrl node

 .../bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml |    5 +
 .../bindings/pinctrl/amlogic,meson-pinctrl-a4.yaml |   82 ++
 .../pinctrl/amlogic,meson-pinctrl-common.yaml      |    5 -
 .../pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml  |    5 +
 .../amlogic,meson-pinctrl-g12a-periphs.yaml        |    5 +
 .../pinctrl/amlogic,meson8-pinctrl-aobus.yaml      |    5 +
 .../pinctrl/amlogic,meson8-pinctrl-cbus.yaml       |    5 +
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |   36 +
 drivers/pinctrl/meson/Kconfig                      |    6 +
 drivers/pinctrl/meson/Makefile                     |    1 +
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c         | 1324 ++++++++++++++++++++
 drivers/pinctrl/meson/pinctrl-meson.c              |    4 +
 drivers/pinctrl/meson/pinctrl-meson.h              |    4 +
 include/dt-bindings/gpio/amlogic-gpio.h            |   45 +
 14 files changed, 1527 insertions(+), 5 deletions(-)
---
base-commit: 58e2d28ed28e5bc8836f8c14df1f94c27c1f9e2f
change-id: 20241012-a4_pinctrl-09d1b2a17e47

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



