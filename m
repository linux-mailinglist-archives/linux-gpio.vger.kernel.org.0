Return-Path: <linux-gpio+bounces-15793-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39143A31DDA
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 06:24:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89355188ABAF
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 05:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA3951F4295;
	Wed, 12 Feb 2025 05:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uAo1JDSa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA231DB12C;
	Wed, 12 Feb 2025 05:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739337846; cv=none; b=mUp3BkFXiM5mxAp4zyvnk9EFD4elhWaPB4M0ZslF3Y1kJ2Iapn0n39k4PXowE7a4knMBplBBs2R3MjOEMtTt0Yoc0xs5n6GPULD+DsuWqKh/lJ1zVqxOlDm7BBFkCbRWJn8dhJhx11vAt0ExaePRxvCYwEymBa9gGXpuF3l0xms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739337846; c=relaxed/simple;
	bh=dHrGo3MQlhcb+bCCsVoydXD2nFxFqQhq9MWMEMJtsf0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OVD8uMQPirrgX3SemgmRDvb6J6v565qP35C/CWM5ppGV4Qx61Zn6A9ZKVT/uLhSyKCIPyurERfoDP0ijmUmcNLeKH+/XideMyPzqN84PgkfJZccCB0iZRfz2q5Z3sNxHjZDbK96Nt9UXGshHYwvUrs759qX3j18ZAwBoSw3E5DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uAo1JDSa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B44DC4CEDF;
	Wed, 12 Feb 2025 05:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739337845;
	bh=dHrGo3MQlhcb+bCCsVoydXD2nFxFqQhq9MWMEMJtsf0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=uAo1JDSajDjOdGtARdCHKbr06rWf+WGgb//DbXcB3s1LusNEcxyg7K5TOlAB1uw/d
	 6lGxLv7QB13j5Js/2Qn0rwlh9/62E7ARrV6rn3JRi3CaJcAI0/489PHF4sVA19fHGR
	 ebfG4jEsngo2fsAcXIBjbl/YKfsOKJyZZU1i1L+f4jerFjKmnZ+IDe2E4iKibBNkCb
	 ITrSNVgsOR2jcMIz6swONZ1cA3xrLHjOWaVKezIS1YN3nM1qibwpjTPtmqq1Q7l+8b
	 pBTYUADUmrKyV15b0lwJNckaBWT4cYp1kROTvt3LCLw8zOSb2RyqTaZvkem/d+dlvg
	 xfeGI57C8wRGQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10FA0C02198;
	Wed, 12 Feb 2025 05:24:05 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v5 0/5] Pinctrl: Add Amlogic pinctrl driver
Date: Wed, 12 Feb 2025 13:20:49 +0800
Message-Id: <20250212-amlogic-pinctrl-v5-0-282bc2516804@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALIvrGcC/3XPywrCMBAF0F8pWRvJTF7Vlf8hLtI0rQH7IC1FK
 f1306JQCS7vMPcMM5PBBe8Gcs5mEtzkB9+1MchDRuzdtLWjvoyZIEMBCEBN8+hqb2nvWzuGB0V
 0RkGOrGQlia0+uMo/N/F6i/nuh7ELr+3ABOv0vzUBZVQA06g5lwCny2fjaLuGrNqEOwFVKmAUb
 GmcQKN0oVUq8K8gGYBMBR4FLHLJlZDaFCYVxE5ATAWxfqG0LtBBXlXwKyzL8gaOnmPOdgEAAA=
 =
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739337841; l=3760;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=dHrGo3MQlhcb+bCCsVoydXD2nFxFqQhq9MWMEMJtsf0=;
 b=48ehFmexr5yBzIpiugk/aBUy3SDD2ySYKaPSO1jH0djIjbkaZPDx5ja95qCF5cNLzEZ/H198f
 +RjYNcMPgnMD4tKNn1OuOp6+DkWPuomKh+bYk3D6AceXOK+tVTjpcNj
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
Changes in v5:
- Some little modifications were made to bindings and dts according to Rob's suggestions.
- Move source file into driver/pinctrl/meson and fix license issue.
- Link to v4: https://lore.kernel.org/r/20250122-amlogic-pinctrl-v4-0-4677b2e18ff1@amlogic.com

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
      dt-bindings: pinctrl: Add support for Amlogic A4 SoC
      pinctrl: pinconf-generic: Add API for pinmux propertity in DTS file
      pinctrl: Add driver support for Amlogic SoCs
      arm64: dts: amlogic: a4: add pinctrl node
      MAINTAINERS: Add an entry for Amlogic pinctrl driver

 .../bindings/pinctrl/amlogic,pinctrl-a4.yaml       |  126 +++
 MAINTAINERS                                        |    8 +
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |  120 +++
 drivers/pinctrl/meson/Kconfig                      |   11 +
 drivers/pinctrl/meson/Makefile                     |    1 +
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c         | 1053 ++++++++++++++++++++
 drivers/pinctrl/pinconf-generic.c                  |  130 +++
 drivers/pinctrl/pinconf.h                          |    4 +
 include/dt-bindings/pinctrl/amlogic,pinctrl.h      |   46 +
 include/linux/pinctrl/pinconf-generic.h            |    4 +
 10 files changed, 1503 insertions(+)
---
base-commit: 4de5110762b94b9978fb8182a568572fb2194f8b
change-id: 20241211-amlogic-pinctrl-22ea61820d0d

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



