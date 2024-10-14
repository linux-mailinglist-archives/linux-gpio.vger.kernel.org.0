Return-Path: <linux-gpio+bounces-11291-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 228BA99C4B1
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 11:06:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0FFC1F21804
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 09:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F7E1156227;
	Mon, 14 Oct 2024 09:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h3gLC+9l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC44C1514EE;
	Mon, 14 Oct 2024 09:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728896764; cv=none; b=B+kbuemz0Z4H+w3eRv4ox1rNOuoKbay3OOMbNxuq+WRVGy3FnVhZstBpXBmjG9UlyyNtTJ2JMUdd+vuFzCbs3iZcc6n0ANJwI5JcKor3ac2nGZLhhjeG+9jhO7Q+7u+ohJoucHtU/VP0qO27o/IG++YagmWfVc1iyx6BiIT+jjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728896764; c=relaxed/simple;
	bh=uBz7Xc7gQtf95hJb68A2dT80+ygVVbnU/Cf1MU3Vr9s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rTKSduVqA1zSIgQBTjjewZasslcBP+nvin6XevtqCk40R4oPH8VPlT8YwyyYMg1vjMCmCMNO05bEjzv4mj2HavIFSKIvsfTgs7ICsUXFs9l6XlMVxuCQc2geSWHkU3lTRFXWR/PTKJD2MbL75+ZD5llJKbTWIrVlvBxn5qYXVU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h3gLC+9l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 610CFC4CEC7;
	Mon, 14 Oct 2024 09:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728896764;
	bh=uBz7Xc7gQtf95hJb68A2dT80+ygVVbnU/Cf1MU3Vr9s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=h3gLC+9lwUH84sN9NqAAGl65XttX7p/feuyQzcRoSa3NO98j70VlI0VoJmSmkeFnk
	 lKFC1CLbMG+xBtAfIUHCgMTVM14HTAOaK04EpHRVNWJXg6JnMGA40AQOR1hu9YLWjQ
	 chFj4pPvw15Qh6tI8U893kUeiHmJKzJpecsddgy4MS4jaC7vmKDW3ahe4yeGWH8PO1
	 fvnK07XhHA4hD1QKZTb+H6PQ551+nVKvIhuofKc6jzVB6kNREEBJKSjOQg8jt7jj+W
	 gS+6QPv0wfMGiOR5t1olifPZYztmAv0usUPM6p0O0z+OTIJ2I+xz3ZvUUna1qYUx5i
	 yj5Mg6NOll32A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B2C2CFC50A;
	Mon, 14 Oct 2024 09:06:04 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Mon, 14 Oct 2024 17:05:51 +0800
Subject: [PATCH v2 1/3] dt-bindings: pinctrl: Add support for Amlogic A4
 SoCs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241014-a4_pinctrl-v2-1-3e74a65c285e@amlogic.com>
References: <20241014-a4_pinctrl-v2-0-3e74a65c285e@amlogic.com>
In-Reply-To: <20241014-a4_pinctrl-v2-0-3e74a65c285e@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728896762; l=2278;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=tfEbx/nawoF1xymN0PzEB9cyZ2GpGq42qC+H+M4aI/8=;
 b=hbSz+mu67oz8Xm3gwvv7Dh0vl4KUYQSgtNRar5EuSG7izhaLeElmw5rswB13rHysVOkjfsYat
 Oxl87PcxB9HD0SW7ijUpWi5fv4tZyx+2WMCKICJSOJ0qIMNpn7HYo7e
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add the new compatible name for Amlogic A4 pin controller, and add
a new dt-binding header file which document the detail pin names.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml |  2 ++
 include/dt-bindings/gpio/amlogic-a4-gpio.h         | 38 ++++++++++++++++++++++
 2 files changed, 40 insertions(+)

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
diff --git a/include/dt-bindings/gpio/amlogic-a4-gpio.h b/include/dt-bindings/gpio/amlogic-a4-gpio.h
new file mode 100644
index 000000000000..e39f5e041875
--- /dev/null
+++ b/include/dt-bindings/gpio/amlogic-a4-gpio.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
+ * Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
+ */
+
+#ifndef _DT_BINDINGS_AMLOGIC_A4_GPIO_H
+#define _DT_BINDINGS_AMLOGIC_A4_GPIO_H
+
+/* Standard port */
+#define GPIOB_START	0
+#define GPIOB_NUM	14
+
+#define GPIOD_START	(GPIOB_START + GPIOB_NUM)
+#define GPIOD_NUM	16
+
+#define GPIOE_START	(GPIOD_START + GPIOD_NUM)
+#define GPIOE_NUM	2
+
+#define GPIOT_START	(GPIOE_START + GPIOE_NUM)
+#define GPIOT_NUM	23
+
+#define GPIOX_START	(GPIOT_START + GPIOT_NUM)
+#define GPIOX_NUM	18
+
+#define PERIPHS_PIN_NUM	(GPIOX_START + GPIOX_NUM)
+
+/* Aobus port */
+#define GPIOAO_START	0
+#define GPIOAO_NUM	7
+
+/* It's a special definition, put at the end, just 1 num */
+#define	GPIO_TEST_N	(GPIOAO_START +  GPIOAO_NUM)
+#define	AOBUS_PIN_NUM	(GPIO_TEST_N + 1)
+
+#define AMLOGIC_GPIO(port, offset)	(port##_START + (offset))
+
+#endif /* _DT_BINDINGS_AMLOGIC_A4_GPIO_H */

-- 
2.37.1



