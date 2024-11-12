Return-Path: <linux-gpio+bounces-12854-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D86FB9C5372
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 11:29:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D175288CBF
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 10:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E9B42141C0;
	Tue, 12 Nov 2024 10:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="grShRzqD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95632123CF;
	Tue, 12 Nov 2024 10:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731407221; cv=none; b=eSaGzSFKVY5C+DAUHgeCJGiH9Y3/N4b+kzZHivB+tdMa9gOtPAezvr7dHDILNsYp7e5TnhHNBPeoEMjArrCQK7CKfd161yp1GLLnyo7S3t3f4tpP8I9M5NHbH4dG3au5gH+2RPLiO8a/fq6z0ol7SxxIcjCxoOYC+61rMb3ymgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731407221; c=relaxed/simple;
	bh=ozCy6ZU2hX5f6zY41iGDT6qBtG5/wtGMJOKYzcXL8mI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MrkZqRIviNBXINBo44iNrZ2/55JjisUOoWCd86oaEQGUXRWW6kQ0YQVXAnp/HqeZtdtWeJQUWbP/x910Cfb/+Cd8rx/hCjIGuyNOvyCIkf3aoeXKXfz5SSfWHB74sxdMOJXFPA/p4cG0IwB/uFs2i2pxoCuKWNydVk++uvnEgws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=grShRzqD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91DC7C4CED4;
	Tue, 12 Nov 2024 10:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731407221;
	bh=ozCy6ZU2hX5f6zY41iGDT6qBtG5/wtGMJOKYzcXL8mI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=grShRzqDOC6wD6g9HQ/AGhq4F32MxiJQKNMgTzVhCyM9PW8pBla9yzUqIWKOX05bt
	 EG4DiqxZaZmziVO1FD9KgFLKTSpIyyiexE4qoBnmJVNPOAXIAqJ2iOqC6GtMIMgc2T
	 iAJMZBJ9vcdHWT6hrKhESFz01bit9vTnpeBS60mYN0xp98cfjKngUWVJ11UILDNS69
	 m7xrsbbULN24OBRuR5ur1DJb64Z65q5QrKK76Kc/Jdb/16QqvlopDUmOiuHeWkENFO
	 ADumb6tQvXXdzj0rgFsDZsbdWHS1KhQZJup8FiCWFeMlmrBMjiX9VYAVWI45JFInmV
	 VglxNgYbo16lA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88068D32D75;
	Tue, 12 Nov 2024 10:27:01 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v5 0/5] Pinctrl: A4: Add pinctrl driver
Date: Tue, 12 Nov 2024 18:26:54 +0800
Message-Id: <20241112-a4_pinctrl-v5-0-3460ce10c480@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG4tM2cC/2XM3wqCMByG4VuRHbfYP5121H1ExNp+04E62UQK8
 d6bQqR0+H3wvDOKEBxEdMlmFGBy0fk+jfyUId2ovgbsTNqIESYooQwr8Rhcr8fQYlIZ+mSKShA
 SJTAEsO61xW73tBsXRx/eW3ti6/vNiH1mYphgDlKoIteszOGqutbXTp+179AamvgelwfMEwZZW
 EO1JdTIfyx+OOkDFiu2pirBaK6MOOJlWT4n9FvRIAEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731407219; l=2465;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=ozCy6ZU2hX5f6zY41iGDT6qBtG5/wtGMJOKYzcXL8mI=;
 b=sOGzqIGmNL31284iCxi1Im2K6kJYoy+yb5BpDC2T9TUmiq625OP+fUfHSwf99+yMwsOCF/1nF
 Pa2dYuD0s4QAr2AkEy7txineOfnN2uYSdPybPk+c3kLiBt2IX9nu1Bo
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
      dt-bindings: pinctrl: modify gpio-cells property
      dt-bindings: pinctrl: Add support for Amlogic A4 SoCs
      pinctrl: meson: add interface of of_xlate
      pinctrl: meson: Add driver support for Amlogic A4 SoCs
      arm64: dts: amlogic: a4: add pinctrl node

 .../bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml |    2 +
 .../pinctrl/amlogic,meson-pinctrl-common.yaml      |    2 +-
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |   36 +
 drivers/pinctrl/meson/Kconfig                      |    6 +
 drivers/pinctrl/meson/Makefile                     |    1 +
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c         | 1335 ++++++++++++++++++++
 drivers/pinctrl/meson/pinctrl-meson.c              |    4 +
 drivers/pinctrl/meson/pinctrl-meson.h              |    4 +
 include/dt-bindings/gpio/amlogic-gpio.h            |   45 +
 9 files changed, 1434 insertions(+), 1 deletion(-)
---
base-commit: 58e2d28ed28e5bc8836f8c14df1f94c27c1f9e2f
change-id: 20241012-a4_pinctrl-09d1b2a17e47

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



