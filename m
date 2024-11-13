Return-Path: <linux-gpio+bounces-12907-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FA99C69FB
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 08:30:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25503B228DC
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 07:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB580188708;
	Wed, 13 Nov 2024 07:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kgsNtBFP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A66C175D38;
	Wed, 13 Nov 2024 07:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731482982; cv=none; b=RKZoOLAIk1uwB6LgmeW1+jkP/jk3qTDdPy83/W5ZDKJgD+B/HtW7PwV/MSEDgMk2SZZknF9KWwRcVwroQQm6isDcJIUBo/2MJ9muHtxXajsztW+xAJJRCCsw9cyE3Y4kcALOv33TXjJVM6m7OjiXc0EOysRv12s0Ju0RYp9BgRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731482982; c=relaxed/simple;
	bh=jTZlTZlZlc/8oe7tDDpKMU27TjCaQVXWIYr+dhvV8jI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hibQO5Mv91Q0SAYdeRXG+Gh2uinT9FKFrL6JfFaiTTmz9g6M+v3YTS5DiAqFbzath8eWYeLH+B5SslmdCU+C4aAv8olowgI7zq29EfLqveJpWcO0grD7qnKadH0Opdc5qG1cAVSnplvRD4ZN2Ae/QytMN4x49aRf5HJdaEva1mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kgsNtBFP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01BD1C4CED0;
	Wed, 13 Nov 2024 07:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731482982;
	bh=jTZlTZlZlc/8oe7tDDpKMU27TjCaQVXWIYr+dhvV8jI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=kgsNtBFPiSUBR4Koe4a+lmtEI4IyQLsuaxD5Pnr4rjGjUvzjDvYoZA70VF0wtUr6C
	 Hx8eTjL3EXnP/xdlhQGueDNpYK4V36oa7nWqJLbi7cWFiTdKyWCSxVpTVSQgmZ5GY4
	 uwzH8/gF2NLSU+HW3OCopmNZujev3LTe17Z8O7HoqIz1I3ZcFI3sttEX5S0VpnPKEi
	 IbXN5PqVbLgcvI0n6AaWVhWXCxXJa3RG3/R12AGxe7fqZ1Wp+L9nd6LLaCRaO+Rixa
	 Kh+qKPxlYPF/VAAutuZqVkhqQ+SG0MC5Oy2kW8MtFr6Y4ZbyeC1HU5wxMmeWdPY1VF
	 TQI9N8ydEJFtg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D81ECD41C00;
	Wed, 13 Nov 2024 07:29:41 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v6 0/5] Pinctrl: A4: Add pinctrl driver
Date: Wed, 13 Nov 2024 15:29:38 +0800
Message-Id: <20241113-a4_pinctrl-v6-0-35ba2401ee35@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGJVNGcC/2XP0QqCMBTG8VeRXbfY5tFZV71HRKyzow7UxYxRh
 O/eDCLFy2/w+3P2ZiMFRyM7Zm8WKLrR+SGNcpcxbM3QEHc2baaEAimk4gaudzfgI3RcHKy8KSM
 1gWYJ3APV7vmNnS9pt258+PD6tqOaX38ZWGai4oLnpMGUBaqqoJPpO9843KPv2RyK+RJXK5wnT
 LqsrcRaSKu3GP446RWGGdf2UJHF3FjY4mKB17+PxXw2lAJJCoRKrPE0TR/FIPJkXQEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731482979; l=3167;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=jTZlTZlZlc/8oe7tDDpKMU27TjCaQVXWIYr+dhvV8jI=;
 b=m4K96oRnL5/UOrRY29MRVvvw544CUEkerxoU9h9+7gESaPC+1p4F26yp8bt0b3sdQ+/DisqvJ
 TQPy19ewAEQCS6TZcCKjgOP75oiW4iuhjTXIynPf891+IeErHIFnSoj
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
      dt-bindings: pinctrl: move gpio-cells property
      dt-bindings: pinctrl: Add support for Amlogic A4 SoCs
      pinctrl: meson: add interface of of_xlate
      pinctrl: meson: Add driver support for Amlogic A4 SoCs
      arm64: dts: amlogic: a4: add pinctrl node

 .../bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml |    3 +
 .../bindings/pinctrl/amlogic,meson-pinctrl-a4.yaml |   80 ++
 .../pinctrl/amlogic,meson-pinctrl-common.yaml      |    3 -
 .../pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml  |    3 +
 .../amlogic,meson-pinctrl-g12a-periphs.yaml        |    3 +
 .../pinctrl/amlogic,meson8-pinctrl-aobus.yaml      |    3 +
 .../pinctrl/amlogic,meson8-pinctrl-cbus.yaml       |    3 +
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |   36 +
 drivers/pinctrl/meson/Kconfig                      |    6 +
 drivers/pinctrl/meson/Makefile                     |    1 +
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c         | 1324 ++++++++++++++++++++
 drivers/pinctrl/meson/pinctrl-meson.c              |    4 +
 drivers/pinctrl/meson/pinctrl-meson.h              |    4 +
 include/dt-bindings/gpio/amlogic-gpio.h            |   45 +
 14 files changed, 1515 insertions(+), 3 deletions(-)
---
base-commit: 58e2d28ed28e5bc8836f8c14df1f94c27c1f9e2f
change-id: 20241012-a4_pinctrl-09d1b2a17e47

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



