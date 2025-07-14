Return-Path: <linux-gpio+bounces-23248-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD000B048A2
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 22:33:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25D861A60036
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 20:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D131427815E;
	Mon, 14 Jul 2025 20:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gW5Pb9/a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FB9239E97;
	Mon, 14 Jul 2025 20:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752524986; cv=none; b=OR80CmrWesnLln66zIc8aK37WCQyPvv+SDccg2xahraS4T5Yi1RCmZVbpp8dWgne6lhiO2YuLkwYjapBOc4G70TXTkXRn3+0cTh0CuKRkLhMqSx2Am9tvbyhfh+FCnj99kzFIqhlZbei/V25ooXAewHMvoPjkEx7ytZ9cesQU+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752524986; c=relaxed/simple;
	bh=M2jBlVykSqgpKIbdwPfdRivn6FmOBX/bBqJ5c01oet4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rn9MIhwYOnPiQBsja0mUqAsN//d0Xs7wtSmrluvPbbV2EOob6VtvqZxIohPtlk3Uxtr4/bZ7XgmYC+/IxBhpL2i+Vw/L6i2hQ6yRp4T4LFax6jT8fzQXvBXdBoAX6NXWTagmBDxXhozgnnR0VLLx2REFJNzLDxSebjKeqSJQfFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gW5Pb9/a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3242C4CEED;
	Mon, 14 Jul 2025 20:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752524985;
	bh=M2jBlVykSqgpKIbdwPfdRivn6FmOBX/bBqJ5c01oet4=;
	h=From:To:Cc:Subject:Date:From;
	b=gW5Pb9/aCxj48ILwq7EEUCzLcxDWNVymhfH5zmaO/0TaRZeEqQuzxvZAFfIGxMoNx
	 J8b3vdwdN2amjaDjzWDWDldwew0I1nIxiGHx7R0f7OQNWiyEsqN0QqWDqKE4ITBrDT
	 9VBq2WaZvd4jt08xr2QiEUQ4FHNvqyfmuzud3JBL5oZIX048xlr+wQQWzGPg/GRdot
	 D+j1kVduKQDVFU3dJ/CXToyymrYUdBD5Zqbs1DuqUSklH1XA0hOEsuk7yuh/dFUy8n
	 3oPso3uV10FDe9eL2CSZtLlj5vhUpvuPfK001VKs4XQ/Sd4c7m/rYDjyJ8HgWfVYJn
	 Ymy7xexB8RKTw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: gpio: fsl,qoriq-gpio: Add missing mpc8xxx compatibles
Date: Mon, 14 Jul 2025 15:29:40 -0500
Message-ID: <20250714202941.3013390-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fsl,mpc8349-gpio, fsl,mpc8572-gpio, and fsl,mpc8610-gpio compatibles
are already documented in fsl,qoriq-gpio.yaml. Add the additional
compatibles that use fsl,mpc8349-gpio as a fallback. With that,
the 8xxx_gpio.txt binding document is redundant and can be removed.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/gpio/8xxx_gpio.txt    | 72 -------------------
 .../bindings/gpio/fsl,qoriq-gpio.yaml         |  7 ++
 2 files changed, 7 insertions(+), 72 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/8xxx_gpio.txt

diff --git a/Documentation/devicetree/bindings/gpio/8xxx_gpio.txt b/Documentation/devicetree/bindings/gpio/8xxx_gpio.txt
deleted file mode 100644
index 973362eb3f1e..000000000000
--- a/Documentation/devicetree/bindings/gpio/8xxx_gpio.txt
+++ /dev/null
@@ -1,72 +0,0 @@
-GPIO controllers on MPC8xxx SoCs
-
-This is for the non-QE/CPM/GUTs GPIO controllers as found on
-8349, 8572, 8610 and compatible.
-
-Every GPIO controller node must have #gpio-cells property defined,
-this information will be used to translate gpio-specifiers.
-See bindings/gpio/gpio.txt for details of how to specify GPIO
-information for devices.
-
-The GPIO module usually is connected to the SoC's internal interrupt
-controller, see bindings/interrupt-controller/interrupts.txt (the
-interrupt client nodes section) for details how to specify this GPIO
-module's interrupt.
-
-The GPIO module may serve as another interrupt controller (cascaded to
-the SoC's internal interrupt controller).  See the interrupt controller
-nodes section in bindings/interrupt-controller/interrupts.txt for
-details.
-
-Required properties:
-- compatible:		"fsl,<chip>-gpio" followed by "fsl,mpc8349-gpio"
-			for 83xx, "fsl,mpc8572-gpio" for 85xx, or
-			"fsl,mpc8610-gpio" for 86xx.
-- #gpio-cells:		Should be two. The first cell is the pin number
-			and the second cell is used to specify optional
-			parameters (currently unused).
-- interrupts:		Interrupt mapping for GPIO IRQ.
-- gpio-controller:	Marks the port as GPIO controller.
-
-Optional properties:
-- interrupt-controller:	Empty boolean property which marks the GPIO
-			module as an IRQ controller.
-- #interrupt-cells:	Should be two.  Defines the number of integer
-			cells required to specify an interrupt within
-			this interrupt controller.  The first cell
-			defines the pin number, the second cell
-			defines additional flags (trigger type,
-			trigger polarity).  Note that the available
-			set of trigger conditions supported by the
-			GPIO module depends on the actual SoC.
-
-Example of gpio-controller nodes for a MPC8347 SoC:
-
-	gpio1: gpio-controller@c00 {
-		#gpio-cells = <2>;
-		compatible = "fsl,mpc8347-gpio", "fsl,mpc8349-gpio";
-		reg = <0xc00 0x100>;
-		interrupt-parent = <&ipic>;
-		interrupts = <74 0x8>;
-		gpio-controller;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-	};
-
-	gpio2: gpio-controller@d00 {
-		#gpio-cells = <2>;
-		compatible = "fsl,mpc8347-gpio", "fsl,mpc8349-gpio";
-		reg = <0xd00 0x100>;
-		interrupt-parent = <&ipic>;
-		interrupts = <75 0x8>;
-		gpio-controller;
-	};
-
-Example of a peripheral using the GPIO module as an IRQ controller:
-
-	funkyfpga@0 {
-		compatible = "funky-fpga";
-		...
-		interrupt-parent = <&gpio1>;
-		interrupts = <4 3>;
-	};
diff --git a/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml
index f1b60ab3f356..4cb2a6b9fabf 100644
--- a/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml
@@ -29,6 +29,13 @@ properties:
               - fsl,ls1088a-gpio
               - fsl,ls2080a-gpio
           - const: fsl,qoriq-gpio
+      - items:
+          - enum:
+              - fsl,mpc8308-gpio
+              - fsl,mpc8377-gpio
+              - fsl,mpc8378-gpio
+              - fsl,mpc8379-gpio
+          - const: fsl,mpc8349-gpio
 
   reg:
     maxItems: 1
-- 
2.47.2


