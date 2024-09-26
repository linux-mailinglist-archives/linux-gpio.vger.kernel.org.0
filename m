Return-Path: <linux-gpio+bounces-10466-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE5B987719
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2024 17:59:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40FDD1C22E01
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2024 15:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D001714AD25;
	Thu, 26 Sep 2024 15:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="e+JCUzk6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFB50158DC3;
	Thu, 26 Sep 2024 15:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727366318; cv=none; b=ESM9UroP8t7k9WJkSOLOEFJJfu2OK16j/gsIT0wy/Zj0L/tbyh+2CbBSh3jkJcmLbgyGKAq9ur3c8Mysg/JIZq7h5ZJGmtqTOFjcvYDm1KYhm/kX95XRN7ybuOexu6hU9j4a0nBIJkiQrmppjz/WPH1jVNCU/9FM4XEnBcQPoQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727366318; c=relaxed/simple;
	bh=RJAlOij6i+RBsWNxwEJC6WQJ/+F/1w/EzLWl2qrNLKE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mL8tMIOLJHQeLBOUGjJxNEF6EYsD3XxE2uC16111QQ6hozBwu+gaa6oro1k+7mIG+8V4HqXpjVMxywjVbNotLZVKBrcOzNMkALx49FqC/1lelP982ZnfzdEODSINiihxDkJa6psWv1JnCeHRwrg98+Yr0q01Y4x0fufoLTzDtQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=e+JCUzk6; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Date:Subject:MIME-Version:Content-Type:
	Message-Id; bh=Yzp0Hgtz2km4R/+38jhyIqcRGarlCpDum3ovNWdjGj0=; b=e
	+JCUzk6JNSbnQ3z7Pkv9bMXHcIKeTbDNdKh6jcMkHUQ5WqgVx2/tek14tFg3Ev/S
	5O83yvGsbacbGGdy36WZdewvi51i0CMIVnE4sJOs118vgdIiwR7A0o/7AXpIy7nA
	j9fy3UEruwESMRVpYa+vyop40KG5GV2BZnEOqqtKfY=
Received: from [127.0.0.1] (unknown [27.18.107.33])
	by gzsmtp3 (Coremail) with SMTP id sigvCgBHA3OFhPVmTIX3AA--.42449S5;
	Thu, 26 Sep 2024 23:58:00 +0800 (CST)
From: Ze Huang <18771902331@163.com>
Date: Thu, 26 Sep 2024 23:57:45 +0800
Subject: [PATCH v2 3/3] riscv: dts: canaan: Add k230's pinctrl node
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-k230-pinctrl-v2-3-a9a36fba4b34@163.com>
References: <20240926-k230-pinctrl-v2-0-a9a36fba4b34@163.com>
In-Reply-To: <20240926-k230-pinctrl-v2-0-a9a36fba4b34@163.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Ze Huang <18771902331@163.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727366277; l=8878;
 i=18771902331@163.com; s=20240926; h=from:subject:message-id;
 bh=RJAlOij6i+RBsWNxwEJC6WQJ/+F/1w/EzLWl2qrNLKE=;
 b=iny35ryg6El26y7ZeuEI99xZY7YdrtzbWTm3lTCUKcGEs/KOxVFKU2xjbw0rq3y/GCnlvF0e+
 OqZ+N/ihz9UCXSDfxlv18TJugpRB1eFPr1csa4ikCrEkj14KFhronrm
X-Developer-Key: i=18771902331@163.com; a=ed25519;
 pk=M4cXLTlQ3syp0aIw4PNbFtajcroq/y7WBxK2F/jsUWI=
X-CM-TRANSID:sigvCgBHA3OFhPVmTIX3AA--.42449S5
X-Coremail-Antispam: 1Uf129KBjvJXoW3GF4DKrW8Gr1xtr45WFWxJFb_yoW3trW7pF
	WSkFn3K3409FWrK3y0qw1jgF1UWr4q9r1rG3srKry7tw10gFs5K3s5Gr1YqFn8ur1Yk34j
	g3ykZa1Ivrs7Jw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zMxR6-UUUUU=
X-CM-SenderInfo: zpryllqrzqjjitr6il2tof0z/1tbiNw5momb1gfgWrAABss

Add pinctrl device, containing default config for uart, pwm, iis, iic
and mmc.

Signed-off-by: Ze Huang <18771902331@163.com>
---
 arch/riscv/boot/dts/canaan/k230-canmv.dts | 304 ++++++++++++++++++++++++++++++
 arch/riscv/boot/dts/canaan/k230-pinctrl.h |  18 ++
 arch/riscv/boot/dts/canaan/k230.dtsi      |   6 +
 3 files changed, 328 insertions(+)

diff --git a/arch/riscv/boot/dts/canaan/k230-canmv.dts b/arch/riscv/boot/dts/canaan/k230-canmv.dts
index 9565915cead6ad2381ea8249b616e79575feb896..fc1429a31945b232e4bfcb735dbdb43dd655eb90 100644
--- a/arch/riscv/boot/dts/canaan/k230-canmv.dts
+++ b/arch/riscv/boot/dts/canaan/k230-canmv.dts
@@ -22,3 +22,307 @@ ddr: memory@0 {
 &uart0 {
 	status = "okay";
 };
+
+&pinctrl {
+	jtag_pins: jtag-pins {
+		jtag-tck-cfg {
+			pinmux = <K230_PINMUX(2, 1)>;
+			slew-rate = <0>;
+			drive-strength = <4>;
+			power-source = <K230_MSC_1V8>;
+			input-enable;
+			bias-pull-down;
+			input-schmitt-enable;
+		};
+
+		jtag-tdi-cfg {
+			pinmux = <K230_PINMUX(3, 1)>;
+			slew-rate = <0>;
+			drive-strength = <4>;
+			power-source = <K230_MSC_1V8>;
+			input-enable;
+			bias-disable;
+		};
+
+		jtag-tdo-cfg {
+			pinmux = <K230_PINMUX(4, 1)>;
+			slew-rate = <0>;
+			drive-strength = <4>;
+			power-source = <K230_MSC_1V8>;
+			output-enable;
+			bias-disable;
+		};
+
+		jtag-tms-cfg {
+			pinmux = <K230_PINMUX(5, 1)>;
+			slew-rate = <0>;
+			drive-strength = <4>;
+			power-source = <K230_MSC_1V8>;
+			input-enable;
+			bias-pull-up;
+		};
+	};
+
+	uart2_pins: uart2-pins {
+		uart2-pins-cfg {
+			pinmux = <K230_PINMUX(5, 3)>, /* uart2 txd */
+				 <K230_PINMUX(6, 3)>; /* uart2 rxd */
+			slew-rate = <0>;
+			drive-strength = <4>;
+			power-source = <K230_MSC_1V8>;
+			input-enable;
+			output-enable;
+			bias-disable;
+		};
+	};
+
+	pwm2_pins: pwm2-pins {
+		pwm2-pin-cfg {
+			pinmux = <K230_PINMUX(7, 1)>;
+			slew-rate = <0>;
+			drive-strength = <7>;
+			power-source = <K230_MSC_1V8>;
+			input-enable;
+			output-enable;
+			bias-disable;
+			input-schmitt-enable;
+		};
+	};
+
+	pwm3_pins: pwm3-pins {
+		pwm3-pin-cfg {
+			pinmux = <K230_PINMUX(8, 1)>;
+			slew-rate = <0>;
+			drive-strength = <7>;
+			power-source = <K230_MSC_1V8>;
+			input-enable;
+			output-enable;
+			bias-disable;
+			input-schmitt-enable;
+		};
+	};
+
+	pwm4_pins: pwm4-pins {
+		pwm4-pin-cfg {
+			pinmux = <K230_PINMUX(9, 1)>;
+			slew-rate = <0>;
+			drive-strength = <7>;
+			power-source = <K230_MSC_1V8>;
+			input-enable;
+			output-enable;
+			bias-disable;
+			input-schmitt-enable;
+		};
+	};
+
+	iis_pins: iis-pins {
+		iis-clk-cfg {
+			pinmux = <K230_PINMUX(32, 2)>;
+			slew-rate = <0>;
+			drive-strength = <4>;
+			power-source = <K230_MSC_1V8>;
+			output-enable;
+			bias-disable;
+		};
+
+		iis-ws-cfg {
+			pinmux = <K230_PINMUX(33, 2)>;
+			slew-rate = <0>;
+			drive-strength = <4>;
+			power-source = <K230_MSC_1V8>;
+			output-enable;
+			bias-disable;
+		};
+
+		iis-din0-cfg {
+			pinmux = <K230_PINMUX(34, 2)>;
+			slew-rate = <0>;
+			drive-strength = <4>;
+			power-source = <K230_MSC_1V8>;
+			input-enable;
+			bias-disable;
+		};
+
+		iis-dout0-cfg {
+			pinmux = <K230_PINMUX(35, 2)>;
+			slew-rate = <0>;
+			drive-strength = <4>;
+			power-source = <K230_MSC_1V8>;
+			output-enable;
+			bias-disable;
+		};
+	};
+
+	uart4_pins: uart4-pins {
+		uart4-txd-cfg {
+			pinmux = <K230_PINMUX(36, 4)>;
+			slew-rate = <0>;
+			drive-strength = <7>;
+			power-source = <K230_MSC_1V8>;
+			output-enable;
+			bias-disable;
+			input-schmitt-enable;
+		};
+
+		uart4-rxd-cfg {
+			pinmux = <K230_PINMUX(37, 4)>;
+			slew-rate = <0>;
+			drive-strength = <7>;
+			power-source = <K230_MSC_1V8>;
+			input-enable;
+			bias-disable;
+			input-schmitt-enable;
+		};
+	};
+
+	uart0_pins: uart0-pins {
+		uart0-txd-cfg {
+			pinmux = <K230_PINMUX(38, 1)>;
+			slew-rate = <0>;
+			drive-strength = <7>;
+			power-source = <K230_MSC_1V8>;
+			output-enable;
+			bias-disable;
+			input-schmitt-enable;
+		};
+
+		uart0-rxd-cfg {
+			pinmux = <K230_PINMUX(39, 1)>;
+			slew-rate = <0>;
+			drive-strength = <7>;
+			power-source = <K230_MSC_1V8>;
+			input-enable;
+			bias-disable;
+			input-schmitt-enable;
+		};
+	};
+
+	iic1_pins: iic1-pins {
+		iic1-pins-cfg {
+			pinmux = <K230_PINMUX(40, 2)>, /* iic1 scl */
+				 <K230_PINMUX(41, 2)>; /* iic1 sda */
+			slew-rate = <0>;
+			drive-strength = <7>;
+			power-source = <K230_MSC_1V8>;
+			input-enable;
+			output-enable;
+			bias-pull-up;
+			input-schmitt-enable;
+		};
+	};
+
+	iic3_pins: iic3-pins {
+		iic3-pins-cfg {
+			pinmux = <K230_PINMUX(44, 2)>, /* iic3 scl */
+				 <K230_PINMUX(45, 2)>; /* iic3 sda */
+			slew-rate = <0>;
+			drive-strength = <7>;
+			power-source = <K230_MSC_1V8>;
+			input-enable;
+			output-enable;
+			bias-pull-up;
+			input-schmitt-enable;
+		};
+	};
+
+	iic4_pins: iic4-pins {
+		iic4-pins-cfg {
+			pinmux = <K230_PINMUX(46, 3)>, /* iic4 scl */
+				 <K230_PINMUX(47, 3)>; /* iic4 sda */
+			slew-rate = <0>;
+			drive-strength = <7>;
+			power-source = <K230_MSC_1V8>;
+			input-enable;
+			output-enable;
+			bias-pull-up;
+			input-schmitt-enable;
+		};
+	};
+
+	iic0_pins: iic0-pins {
+		iic0-pins-cfg {
+			pinmux = <K230_PINMUX(48, 3)>, /* iic0 scl */
+				 <K230_PINMUX(49, 3)>; /* iic0 sda */
+			slew-rate = <0>;
+			drive-strength = <7>;
+			power-source = <K230_MSC_1V8>;
+			input-enable;
+			output-enable;
+			bias-pull-up;
+			input-schmitt-enable;
+		};
+	};
+
+	uart3_pins: uart3-pins {
+		uart3-txd-cfg {
+			pinmux = <K230_PINMUX(50, 1)>;
+			slew-rate = <0>;
+			drive-strength = <7>;
+			power-source = <K230_MSC_3V3>;
+			output-enable;
+			bias-disable;
+			input-schmitt-enable;
+		};
+
+		uart3-rxd-cfg {
+			pinmux = <K230_PINMUX(51, 1)>;
+			slew-rate = <0>;
+			drive-strength = <7>;
+			power-source = <K230_MSC_3V3>;
+			input-enable;
+			bias-disable;
+			input-schmitt-enable;
+		};
+	};
+
+	key_pins: key-pins {
+		key-pins-cfg {
+			pinmux = <K230_PINMUX(52, 0)>, /* key0 */
+				 <K230_PINMUX(53, 0)>; /* key1 */
+			slew-rate = <0>;
+			drive-strength = <7>;
+			power-source = <K230_MSC_3V3>;
+			input-enable;
+			output-enable;
+			bias-disable;
+			input-schmitt-enable;
+		};
+	};
+
+	mmc1_pins: mmc1-pins {
+		mmc1-cmd-cfg {
+			pinmux = <K230_PINMUX(54, 2)>;
+			slew-rate = <0>;
+			drive-strength = <7>;
+			power-source = <K230_MSC_3V3>;
+			input-enable;
+			output-enable;
+			bias-pull-up;
+			input-schmitt-enable;
+		};
+
+		mmc1-clk-cfg {
+			pinmux = <K230_PINMUX(55, 2)>;
+			slew-rate = <0>;
+			drive-strength = <7>;
+			power-source = <K230_MSC_3V3>;
+			output-enable;
+			bias-disable;
+			input-schmitt-enable;
+		};
+
+		mmc1-data-cfg {
+			pinmux = <K230_PINMUX(56, 2)>, /* mmc1 data0 */
+				 <K230_PINMUX(57, 2)>, /* mmc1 data1 */
+				 <K230_PINMUX(58, 2)>, /* mmc1 data2 */
+				 <K230_PINMUX(59, 2)>; /* mmc1 data3 */
+			slew-rate = <0>;
+			drive-strength = <7>;
+			power-source = <K230_MSC_3V3>;
+			input-enable;
+			output-enable;
+			bias-pull-up;
+			input-schmitt-enable;
+		};
+	};
+};
diff --git a/arch/riscv/boot/dts/canaan/k230-pinctrl.h b/arch/riscv/boot/dts/canaan/k230-pinctrl.h
new file mode 100644
index 0000000000000000000000000000000000000000..63dd999ca55b64ac5aea4026465f38f9fb7ee9ea
--- /dev/null
+++ b/arch/riscv/boot/dts/canaan/k230-pinctrl.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (C) 2024 Canaan Bright Sight Co. Ltd
+ * Copyright (C) 2024 Ze Huang <18771902331@163.com>
+ */
+
+#ifndef _K230_PINCTRL_H
+#define _K230_PINCTRL_H
+
+#define K230_MSC_3V3 0
+#define K230_MSC_1V8 1
+
+#define BANK_VOLTAGE_DEFAULT       K230_MSC_1V8
+#define BANK_VOLTAGE_IO50_IO61     K230_MSC_3V3
+
+#define K230_PINMUX(pin, mode) (((pin) << 8) | (mode))
+
+#endif /* _K230_PINCTRL_H */
diff --git a/arch/riscv/boot/dts/canaan/k230.dtsi b/arch/riscv/boot/dts/canaan/k230.dtsi
index 95c1a3d8fb1192e30113d96d3e96329545bc6ae7..f7648d8c86ec16a8b0d3660067413d5ebd143dc7 100644
--- a/arch/riscv/boot/dts/canaan/k230.dtsi
+++ b/arch/riscv/boot/dts/canaan/k230.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/irq.h>
+#include "k230-pinctrl.h"
 
 /dts-v1/;
 / {
@@ -89,6 +90,11 @@ clint: timer@f04000000 {
 			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
 		};
 
+		pinctrl: pinctrl@91105000 {
+			compatible = "canaan,k230-pinctrl";
+			reg = <0x0 0x91105000 0x0 0x100>;
+		};
+
 		uart0: serial@91400000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x0 0x91400000 0x0 0x1000>;

-- 
2.46.2


