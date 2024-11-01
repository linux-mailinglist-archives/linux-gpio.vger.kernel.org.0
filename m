Return-Path: <linux-gpio+bounces-12438-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D17329B8D07
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 09:27:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DCF31F23846
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 08:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06BF7157E82;
	Fri,  1 Nov 2024 08:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aJra/82a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADE7158208;
	Fri,  1 Nov 2024 08:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730449640; cv=none; b=ooqjfqLsLt1hQqKS4WGmqbqPQe2rrv3w5aZ8+tjGHQ7EdvwgmAI4imSQCsHvJ61CjddOWyjmkhEpVc9CUPt7jELfH4erXOGABDDYMmdGHpdRUqiZMHrfrnKvTyMYxAzRFPWHmDrLKPe9LabWyJfkGm/d4d0kiFhhWLAjb/LXHlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730449640; c=relaxed/simple;
	bh=TDts9AQyyHimRSBgvjiw7JB16PDCCRdn8ZlqHDAtAyY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MWAwdaeP0/i8WWn6muXayWUp2lnn41PcXJyyaF+Ph/8217kIbj0jIpW4iIkgp8aqKCDSlkZYIvFUH+4ZwYFz5O7FSGxlA9u1M7epypX9JvNtFvh/0RzcVb1BFW8Ffe88KhWlN3SXob5XDn2lNo6FxyzzR90qp9Gq3REE3KIwD14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aJra/82a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2502CC4CED1;
	Fri,  1 Nov 2024 08:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730449640;
	bh=TDts9AQyyHimRSBgvjiw7JB16PDCCRdn8ZlqHDAtAyY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=aJra/82adHsVVg0c55ZyHsnQ29O2ToV/HtsoW8OfwZ0ddl/pHf7ZQtDHp238PnvWb
	 c0f92vKMN+5nDGaClf2bkt7gya8oCiWarx53X7KgF8pbYc+Gh8pQFvB7aOfzWki/Vo
	 XCv2ZmnrVpnoLXOgCs3fjXPVDIE6swPl7HS0+1QV38+P/rcUTHd74VtqIBIlLKIi1c
	 +0bIhTPuFtMF8zM8g77GSOFuPKL5gqNOIqLYGSIIx0TxtNRlLR3NHr6z52NNR8MAmw
	 oz8sKNVjeHYPckTCTFtKxl+COl5ngsXsdaguErR/AlCCNY8hJXnPzyb8mpYJy57tzD
	 K2tiyZocXLJew==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 111B9E67497;
	Fri,  1 Nov 2024 08:27:20 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH RFC v4 0/4] Pinctrl: A4: Add pinctrl driver
Date: Fri, 01 Nov 2024 16:27:16 +0800
Message-Id: <20241101-a4_pinctrl-v4-0-efd98edc3ad4@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOSQJGcC/1WNQQqDMBREryJZNyWJ0diuCoUeoNtSSpp89YMaS
 URaxLs3hC50OTO8NwsJ4BECOWcL8TBjQDfEIA8ZMa0eGqBoYyaCCckZF1TL14iDmXxH2cnyt9B
 cgVQkAqOHGj9J9iD325U8Y9limJz/poNZpOnvklvXLCijOSipy8KIqoCL7jvXoDka1yfRnG/ha
 gfnEQZV1pabmnGr9vC6rj9hIe1K6AAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730449638; l=2253;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=TDts9AQyyHimRSBgvjiw7JB16PDCCRdn8ZlqHDAtAyY=;
 b=tb0w3LwxFKvKhqjqjTwr+bTdKqQDRn5BFQheIW0/6we6WINAU7yhQp6BMZNh44V6J+pO7KY4p
 Md15Ea1KqvMAJFlKemu+BDdKckgZIXEk/ZQBA74YbN4+QyD9gVvYmlu
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

Add pinctrl driver support for Amloigc A4 SoC

I want to find out what kind of solution is feasible to
meet the needs of all parties. This RFC verion is one of them.

All of Amogic SoCs GPIO device requirement is met here by
adding GPIO bank definition instead of the pin definition.
Binding header files will no longer be added to future
SoCs's pin devices.

The pinctrl software only adds insterface of of_xlate to support
for transformation without affecting the overall framework and
is compatible with previous drivers.

The code in DTS file is also readable when using GPIO, as below:

reset-gpios = <&gpio AMLOGIC_GPIO(AMLOGIC_GPIO_X, 6) GPIO_ACTIVE_LOW>;

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
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
Xianwei Zhao (4):
      dt-bindings: pinctrl: Add support for Amlogic A4 SoCs
      pinctrl: meson: add interface of of_xlate
      pinctrl: meson: Add driver support for Amlogic A4 SoCs
      arm64: dts: amlogic: a4: add pinctrl node

 .../bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml |    2 +
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |   36 +
 drivers/pinctrl/meson/Kconfig                      |    6 +
 drivers/pinctrl/meson/Makefile                     |    1 +
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c         | 1321 ++++++++++++++++++++
 drivers/pinctrl/meson/pinctrl-meson.c              |    4 +
 drivers/pinctrl/meson/pinctrl-meson.h              |    4 +
 include/dt-bindings/gpio/amlogic-gpio.h            |   50 +
 8 files changed, 1424 insertions(+)
---
base-commit: 58e2d28ed28e5bc8836f8c14df1f94c27c1f9e2f
change-id: 20241012-a4_pinctrl-09d1b2a17e47

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



