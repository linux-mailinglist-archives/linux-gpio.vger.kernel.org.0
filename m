Return-Path: <linux-gpio+bounces-14808-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA576A119D8
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 07:42:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E32001882964
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 06:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F2222FAE1;
	Wed, 15 Jan 2025 06:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dV5O3ZPa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43C922F3B9;
	Wed, 15 Jan 2025 06:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736923322; cv=none; b=j8CY1Zsk8pbsxLeHiyIZ7jfGjoufH/hw4NXpQKejyWSViozBCN8mFAU14Vu9BEZFlmnaJz4GjCDo2AJgFpTqCmPFVzOBwm55ozjCI8ekA/wZno0VHISS2BZamhixRPMMZ4pAwb/ZmoFyfhyiJIyZht9VqWvkTBaXjlQNHNs7Vls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736923322; c=relaxed/simple;
	bh=yAzz8DVv15VnfgafeklHW7SZXuVzWgf+QTN4jS3Z664=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EBEXrSD3Bu21RX+tfFQnwwqsuudxPXRiUkhxzsht6mRHsBY/ZOPyd6zabq8P4PCRWPgqyaj1IGz9UhRIrreekDbXcnGeRub/E9nSP/eO1qllcQHPrLigrj9ecx4mTewMTR3GRG25Riwex/HPI99KlbCQoxkV0FUETMCCwDpWNhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dV5O3ZPa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45047C4CEE1;
	Wed, 15 Jan 2025 06:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736923322;
	bh=yAzz8DVv15VnfgafeklHW7SZXuVzWgf+QTN4jS3Z664=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=dV5O3ZPaW+Evdnz7DrdLFujPTNgjEib+dakvMRgxXZsBqwKc8PZauufuOPONWSxZ7
	 9v5PVXALZyzDgDtzxxGpCQwamFuyPUtkFPXrI/1lEcfLTap82Yk6Sn/7kh9R+KwtXr
	 pNflNa4d/izvnj/FVcHTHksCTMR6hnBfqLeFcWTal158+A70aINO0bB1Px9bAUzVJf
	 /JPg5UIMt4rB26yfh0Tuk2WtQKThi9UiZuKikWf2QWHORrauazEHtFp+ezlROwEHAk
	 oMcmtbURStwrMsn1qihG9whXrCuJJLE1fVtWuVKk7AupzdkmKRobW0GZCfJ22Npsuy
	 x2hz5Zu0WiKQQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A51FC02180;
	Wed, 15 Jan 2025 06:42:02 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v3 0/5] Pinctrl: Add Amlogic pinctrl driver
Date: Wed, 15 Jan 2025 14:41:58 +0800
Message-Id: <20250115-amlogic-pinctrl-v3-0-2b8536457aba@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALZYh2cC/3XNwQ6CMAyA4VchOzuzFtyUk+9hPMxtQhNgZCOLh
 vDuDuJBYzz+Tft1ZtEFcpHVxcyCSxTJDznKXcFMq4fGcbK5GQqsAAG47jvfkOEjDWYKHUd0WsI
 RhRWW5asxuDs9NvFyzd1SnHx4bg8SrNP/VgIueAVCoSrLA8Dp/N7YG9+zVUv4IaD8FTALxmpXo
 ZbqpuS3sCzLCw4DEJXyAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736923319; l=2866;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=yAzz8DVv15VnfgafeklHW7SZXuVzWgf+QTN4jS3Z664=;
 b=Oh4+tcghBMmFd5b0eO2G34Vd5bpa0jqVva6QPVtlL8HxmBP8pu8kSegvKUbjSZ8xaorNRArsH
 ngIHUTxMgMuBKPPJnxZxwuogTfB0TtIvh4c9BE5fLTChkfLbxc/YDOy
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

 .../bindings/pinctrl/amlogic,pinctrl-a4.yaml       |  132 +++
 MAINTAINERS                                        |    8 +
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |  133 +++
 drivers/pinctrl/Kconfig                            |   18 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/pinconf-generic.c                  |  130 +++
 drivers/pinctrl/pinconf.h                          |    4 +
 drivers/pinctrl/pinctrl-amlogic.c                  | 1040 ++++++++++++++++++++
 include/dt-bindings/pinctrl/amlogic,pinctrl.h      |   46 +
 include/linux/pinctrl/pinconf-generic.h            |    4 +
 10 files changed, 1516 insertions(+)
---
base-commit: 4de5110762b94b9978fb8182a568572fb2194f8b
change-id: 20241211-amlogic-pinctrl-22ea61820d0d

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



