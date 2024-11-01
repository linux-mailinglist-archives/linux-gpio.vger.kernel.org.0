Return-Path: <linux-gpio+bounces-12439-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B11B59B8D0A
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 09:28:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4F041C221F3
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 08:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E6F815820E;
	Fri,  1 Nov 2024 08:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IKEN5X5p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260D71581F8;
	Fri,  1 Nov 2024 08:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730449641; cv=none; b=rBIgVEmuSdIf4tCu7Uvpejppk1NE/l4LsdcQJkLJ/Legtk3haKybdwGW4QM1xURrPLq062iGl0IX6dejMXpyZVZiu83P6w3y/iaU1J1yQ8jhZOFby4QUoYTb8o//g5xvLuuDThFNfO+DEiJyMofp/wu3vqOaxbGmgVvkNnDD2/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730449641; c=relaxed/simple;
	bh=dGSJKKibBdsxpLP+p+OmdmQOfOzLfl3woFtR4N/TQBE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UGUO+l0yY3g8GHAIz2xb7ePJsVs9lo/Ip3HQnCZJ3NMhz/jUwG7ZgMM4FC9ueL9JES2Tgb1TZVsdqusETogmkY9kzxBiH08+0TLrl4M4d+uhxSYWBnWN4V7zaBMsAAC51orDX/BNDpu8X7iso2O4TvOQf/rC0a+gTY0wHif8K38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IKEN5X5p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 994DDC4CED5;
	Fri,  1 Nov 2024 08:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730449640;
	bh=dGSJKKibBdsxpLP+p+OmdmQOfOzLfl3woFtR4N/TQBE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IKEN5X5pG3QE2X/Wr4RMzypsRq+bt7lLisG/x5dEu/kCrjEfN9Ltz77NPK1f51Zjs
	 wXKJpr4b9CJValsKe5RhtAmSXx9sC6+yMIN3xL8Yd/o+K7P5hdexvHp/7GxxnwppLr
	 Y3l+t+qcSTmCOUhcY+kzcN7nuKNaBoOeSUYUov+woAdTvDFEGVl9QF96J1vRY9hqXW
	 HDHVVhUEiF+ZVoxuaLGH/rX5NvRELgqSICxSfnx7bCI5e4++rILoZeNCs6OlmT2a+S
	 TUAhRob78wH0QG+bbJi9x68YQXcVcdsw+po68fMYzLpLu6FW0WxHMC/VtXiyVhZpCp
	 e82l+bqpnG9Fg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CAFCE674B7;
	Fri,  1 Nov 2024 08:27:20 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 01 Nov 2024 16:27:17 +0800
Subject: [PATCH RFC v4 1/4] dt-bindings: pinctrl: Add support for Amlogic
 A4 SoCs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-a4_pinctrl-v4-1-efd98edc3ad4@amlogic.com>
References: <20241101-a4_pinctrl-v4-0-efd98edc3ad4@amlogic.com>
In-Reply-To: <20241101-a4_pinctrl-v4-0-efd98edc3ad4@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730449638; l=2697;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=bJ9PuDYnWANl7P1yiHKRKdX2JeV+qu35Ep5kAka2CKo=;
 b=ZZqw0wsF7CTMNHzqWqYHFmOXXeZmyJ5Q4ZbK+2iG4CMo70y8TGx/ep/Pw/nrM+bVztZjk5uuN
 fvJgnfAJ/ngC0Wg93qVHKJa5Bg+TX8xgzFDnS07lX+2H5HsnD34vFdi
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add the new compatible name for Amlogic A4 pin controller, and add
a new dt-binding header file which document the GPIO bank names of
all Amlogic subsequent SoCs.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml |  2 +
 include/dt-bindings/gpio/amlogic-gpio.h            | 50 ++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
index d9e0b2c48e84..f5eefa0fab5b 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
@@ -15,6 +15,8 @@ allOf:
 properties:
   compatible:
     enum:
+      - amlogic,a4-aobus-pinctrl
+      - amlogic,a4-periphs-pinctrl
       - amlogic,c3-periphs-pinctrl
       - amlogic,t7-periphs-pinctrl
       - amlogic,meson-a1-periphs-pinctrl
diff --git a/include/dt-bindings/gpio/amlogic-gpio.h b/include/dt-bindings/gpio/amlogic-gpio.h
new file mode 100644
index 000000000000..37bb688d41d8
--- /dev/null
+++ b/include/dt-bindings/gpio/amlogic-gpio.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
+ * Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
+ */
+
+#ifndef _DT_BINDINGS_AMLOGIC_GPIO_H
+#define _DT_BINDINGS_AMLOGIC_GPIO_H
+
+#include <dt-bindings/gpio/gpio.h>
+
+/* Normal GPIO bank */
+#define AMLOGIC_GPIO_A		0
+#define AMLOGIC_GPIO_B		1
+#define AMLOGIC_GPIO_C		2
+#define AMLOGIC_GPIO_D		3
+#define AMLOGIC_GPIO_E		4
+#define AMLOGIC_GPIO_F		5
+#define AMLOGIC_GPIO_G		6
+#define AMLOGIC_GPIO_H		7
+#define AMLOGIC_GPIO_I		8
+#define AMLOGIC_GPIO_J		9
+#define AMLOGIC_GPIO_K		10
+#define AMLOGIC_GPIO_L		11
+#define AMLOGIC_GPIO_M		12
+#define AMLOGIC_GPIO_N		13
+#define AMLOGIC_GPIO_O		14
+#define AMLOGIC_GPIO_P		15
+#define AMLOGIC_GPIO_Q		16
+#define AMLOGIC_GPIO_R		17
+#define AMLOGIC_GPIO_S		18
+#define AMLOGIC_GPIO_T		19
+#define AMLOGIC_GPIO_U		20
+#define AMLOGIC_GPIO_V		21
+#define AMLOGIC_GPIO_W		22
+#define AMLOGIC_GPIO_X		23
+#define AMLOGIC_GPIO_Y		24
+#define AMLOGIC_GPIO_Z		25
+/* Special GPIO bank */
+#define AMLOGIC_GPIO_DV		26
+#define AMLOGIC_GPIO_AO		27
+#define AMLOGIC_GPIO_CC		28
+#define AMLOGIC_GPIO_TEST_N	29
+
+#define AMLOGIC_GPIO(bank, offset)	(((bank) << 8) + (offset))
+
+#define AMLOGIC_BANK(gpio)		((gpio) >> 8)
+#define AMLOGIC_OFFSET(gpio)		((gpio) & 0xff)
+
+#endif /* _DT_BINDINGS_AMLOGIC_GPIO_H */

-- 
2.37.1



