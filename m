Return-Path: <linux-gpio+bounces-10172-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7E1979B7B
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 08:49:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DAAC1C22B16
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 06:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8156E130E4A;
	Mon, 16 Sep 2024 06:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="B8Xgwcoo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61EC377F01;
	Mon, 16 Sep 2024 06:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726469355; cv=none; b=PoJmcEf1VxelKj6Y+VaOU3a2k5pZGavO6WJ/fAejb/bwNdosQEKXdqDQ9fInmebnQLgX3pJ12qynkrzkNiTmD9FPXuepoBwZAhcEfVkF/BpAvNgXHmnKKuGo1yUT4VoaS1fOv2sERm9992Hf80wZDlZcmOJCM5TJIfYp2FALF6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726469355; c=relaxed/simple;
	bh=OuCf5XtUpLEJAaXpvuO13tnAB9M9h8/21ajr7rCfodA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N8W9QrgS3PYQGxuXNjIrKF6qYjJjiwK9oW9bMPOaJUDmTQFKNue1VVcUrT52xr57WqrQZbC4grtXOmCCKuwfrWkKjVqNbpO6GaYXN7rD8y/elEQMBlw5O4X6zegvb67vdiF7keGFc0zcjUTBRjK7gsgLEZggltaPYLLuVL9lmPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=B8Xgwcoo; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=JOP8q
	SR7Z3yhaJZZrM54f9DxjIHXIEkaJJZCRMA+NSQ=; b=B8XgwcooT3tZy456I8T6E
	2Xa/rMuLaQE1GqK7drij3MRffnHdtA3yQBUeqRugXjkv5CIzMYBdN4hPCEiTjBzx
	0FcWEd3b497RwjwFpHvlNKSCpKDcivbSWOFyzvAVn+AdCTGoKUgm6HJxYCtLJCtO
	IuwbeTzlmd5hkYPQJs7fyk=
Received: from jean.localdomain (unknown [27.18.168.209])
	by gzga-smtp-mta-g2-4 (Coremail) with SMTP id _____wDHD2du1OdmyQfeBg--.30056S3;
	Mon, 16 Sep 2024 14:47:13 +0800 (CST)
From: Ze Huang <18771902331@163.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ze Huang <18771902331@163.com>,
	Yangyu Chen <cyy@cyyself.name>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RESEND PATCH 3/3] riscv: dts: canaan: Add k230's pinctrl node
Date: Mon, 16 Sep 2024 14:47:05 +0800
Message-ID: <20240916064706.318793-2-18771902331@163.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240916063021.311721-1-18771902331@163.com>
References: <20240916063021.311721-1-18771902331@163.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDHD2du1OdmyQfeBg--.30056S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxtw15Ww1DXr4Dtr4fKF1UAwb_yoW3ZF1xpF
	WS9rn3K34j9rWrK3y0vr1jgF1UWF4q9r1rK3srKry7tw10gFs5K3s5Cr1YqFn8ur1Yk34j
	g395Zw4Ivrs7JwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRvPfLUUUUU=
X-CM-SenderInfo: zpryllqrzqjjitr6il2tof0z/1tbiNwBcomXAnRlTLAADsU

Add pinctrl device, containing default config for uart, pwm, iis, iic and
mmc.

Signed-off-by: Ze Huang <18771902331@163.com>
---
 arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi | 316 +++++++++++++++++++
 arch/riscv/boot/dts/canaan/k230-pinctrl.h    |  18 ++
 arch/riscv/boot/dts/canaan/k230.dtsi         |   2 +
 3 files changed, 336 insertions(+)
 create mode 100644 arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi
 create mode 100644 arch/riscv/boot/dts/canaan/k230-pinctrl.h

diff --git a/arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi b/arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi
new file mode 100644
index 000000000000..0737f50d2868
--- /dev/null
+++ b/arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi
@@ -0,0 +1,316 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2024 Ze Huang <18771902331@163.com>
+ */
+#include "k230-pinctrl.h"
+
+/ {
+	soc {
+		pinctrl: pinctrl@91105000 {
+			compatible = "canaan,k230-pinctrl";
+			reg = <0x0 0x91105000 0x0 0x100>;
+
+			jtag_pins: jtag-pins {
+				jtag-tck-cfg {
+					pinmux = <K230_PINMUX(2, 1)>;
+					slew-rate = <0>;
+					drive-strength = <4>;
+					power-source = <K230_MSC_1V8>;
+					input-enable;
+					bias-pull-down;
+					input-schmitt-enable;
+				};
+
+				jtag-tdi-cfg {
+					pinmux = <K230_PINMUX(3, 1)>;
+					slew-rate = <0>;
+					drive-strength = <4>;
+					power-source = <K230_MSC_1V8>;
+					input-enable;
+					bias-disable;
+				};
+
+				jtag-tdo-cfg {
+					pinmux = <K230_PINMUX(4, 1)>;
+					slew-rate = <0>;
+					drive-strength = <4>;
+					power-source = <K230_MSC_1V8>;
+					output-enable;
+					bias-disable;
+				};
+
+				jtag-tms-cfg {
+					pinmux = <K230_PINMUX(5, 1)>;
+					slew-rate = <0>;
+					drive-strength = <4>;
+					power-source = <K230_MSC_1V8>;
+					input-enable;
+					bias-pull-up;
+				};
+			};
+
+			uart2_pins: uart2-pins {
+				uart2-pins-cfg {
+					pinmux = <K230_PINMUX(5, 3)>, /* uart2 txd */
+						 <K230_PINMUX(6, 3)>; /* uart2 rxd */
+					slew-rate = <0>;
+					drive-strength = <4>;
+					power-source = <K230_MSC_1V8>;
+					input-enable;
+					output-enable;
+					bias-disable;
+				};
+			};
+
+			pwm2_pins: pwm2-pins {
+				pwm2-pin-cfg {
+					pinmux = <K230_PINMUX(7, 1)>;
+					slew-rate = <0>;
+					drive-strength = <7>;
+					power-source = <K230_MSC_1V8>;
+					input-enable;
+					output-enable;
+					bias-disable;
+					input-schmitt-enable;
+				};
+			};
+
+			pwm3_pins: pwm3-pins {
+				pwm3-pin-cfg {
+					pinmux = <K230_PINMUX(8, 1)>;
+					slew-rate = <0>;
+					drive-strength = <7>;
+					power-source = <K230_MSC_1V8>;
+					input-enable;
+					output-enable;
+					bias-disable;
+					input-schmitt-enable;
+				};
+			};
+
+			pwm4_pins: pwm4-pins {
+				pwm4-pin-cfg {
+					pinmux = <K230_PINMUX(9, 1)>;
+					slew-rate = <0>;
+					drive-strength = <7>;
+					power-source = <K230_MSC_1V8>;
+					input-enable;
+					output-enable;
+					bias-disable;
+					input-schmitt-enable;
+				};
+			};
+
+			iis_pins: iis-pins {
+				iis-clk-cfg {
+					pinmux = <K230_PINMUX(32, 2)>;
+					slew-rate = <0>;
+					drive-strength = <4>;
+					power-source = <K230_MSC_1V8>;
+					output-enable;
+					bias-disable;
+				};
+
+				iis-ws-cfg {
+					pinmux = <K230_PINMUX(33, 2)>;
+					slew-rate = <0>;
+					drive-strength = <4>;
+					power-source = <K230_MSC_1V8>;
+					output-enable;
+					bias-disable;
+				};
+
+				iis-din0-cfg {
+					pinmux = <K230_PINMUX(34, 2)>;
+					slew-rate = <0>;
+					drive-strength = <4>;
+					power-source = <K230_MSC_1V8>;
+					input-enable;
+					bias-disable;
+				};
+
+				iis-dout0-cfg {
+					pinmux = <K230_PINMUX(35, 2)>;
+					slew-rate = <0>;
+					drive-strength = <4>;
+					power-source = <K230_MSC_1V8>;
+					output-enable;
+					bias-disable;
+				};
+			};
+
+			uart4_pins: uart4-pins {
+				uart4-txd-cfg {
+					pinmux = <K230_PINMUX(36, 4)>;
+					slew-rate = <0>;
+					drive-strength = <7>;
+					power-source = <K230_MSC_1V8>;
+					output-enable;
+					bias-disable;
+					input-schmitt-enable;
+				};
+
+				uart4-rxd-cfg {
+					pinmux = <K230_PINMUX(37, 4)>;
+					slew-rate = <0>;
+					drive-strength = <7>;
+					power-source = <K230_MSC_1V8>;
+					input-enable;
+					bias-disable;
+					input-schmitt-enable;
+				};
+			};
+
+			uart0_pins: uart0-pins {
+				uart0-txd-cfg {
+					pinmux = <K230_PINMUX(38, 1)>;
+					slew-rate = <0>;
+					drive-strength = <7>;
+					power-source = <K230_MSC_1V8>;
+					output-enable;
+					bias-disable;
+					input-schmitt-enable;
+				};
+
+				uart0-rxd-cfg {
+					pinmux = <K230_PINMUX(39, 1)>;
+					slew-rate = <0>;
+					drive-strength = <7>;
+					power-source = <K230_MSC_1V8>;
+					input-enable;
+					bias-disable;
+					input-schmitt-enable;
+				};
+			};
+
+			iic1_pins: iic1-pins {
+				iic1-pins-cfg {
+					pinmux = <K230_PINMUX(40, 2)>, /* iic1 scl */
+						 <K230_PINMUX(41, 2)>; /* iic1 sda */
+					slew-rate = <0>;
+					drive-strength = <7>;
+					power-source = <K230_MSC_1V8>;
+					input-enable;
+					output-enable;
+					bias-pull-up;
+					input-schmitt-enable;
+				};
+			};
+
+			iic3_pins: iic3-pins {
+				iic3-pins-cfg {
+					pinmux = <K230_PINMUX(44, 2)>, /* iic3 scl */
+						 <K230_PINMUX(45, 2)>; /* iic3 sda */
+					slew-rate = <0>;
+					drive-strength = <7>;
+					power-source = <K230_MSC_1V8>;
+					input-enable;
+					output-enable;
+					bias-pull-up;
+					input-schmitt-enable;
+				};
+			};
+
+			iic4_pins: iic4-pins {
+				iic4-pins-cfg {
+					pinmux = <K230_PINMUX(46, 3)>, /* iic4 scl */
+						 <K230_PINMUX(47, 3)>; /* iic4 sda */
+					slew-rate = <0>;
+					drive-strength = <7>;
+					power-source = <K230_MSC_1V8>;
+					input-enable;
+					output-enable;
+					bias-pull-up;
+					input-schmitt-enable;
+				};
+			};
+
+			iic0_pins: iic0-pins {
+				iic0-pins-cfg {
+					pinmux = <K230_PINMUX(48, 3)>, /* iic0 scl */
+						 <K230_PINMUX(49, 3)>; /* iic0 sda */
+					slew-rate = <0>;
+					drive-strength = <7>;
+					power-source = <K230_MSC_1V8>;
+					input-enable;
+					output-enable;
+					bias-pull-up;
+					input-schmitt-enable;
+				};
+			};
+
+			uart3_pins: uart3-pins {
+				uart3-txd-cfg {
+					pinmux = <K230_PINMUX(50, 1)>;
+					slew-rate = <0>;
+					drive-strength = <7>;
+					power-source = <K230_MSC_3V3>;
+					output-enable;
+					bias-disable;
+					input-schmitt-enable;
+				};
+
+				uart3-rxd-cfg {
+					pinmux = <K230_PINMUX(51, 1)>;
+					slew-rate = <0>;
+					drive-strength = <7>;
+					power-source = <K230_MSC_3V3>;
+					input-enable;
+					bias-disable;
+					input-schmitt-enable;
+				};
+			};
+
+			key_pins: key-pins {
+				key-pins-cfg {
+					pinmux = <K230_PINMUX(52, 0)>, /* key0 */
+						 <K230_PINMUX(53, 0)>; /* key1 */
+					slew-rate = <0>;
+					drive-strength = <7>;
+					power-source = <K230_MSC_3V3>;
+					input-enable;
+					output-enable;
+					bias-disable;
+					input-schmitt-enable;
+				};
+			};
+
+			mmc1_pins: mmc1-pins {
+				mmc1-cmd-cfg {
+					pinmux = <K230_PINMUX(54, 2)>;
+					slew-rate = <0>;
+					drive-strength = <7>;
+					power-source = <K230_MSC_3V3>;
+					input-enable;
+					output-enable;
+					bias-pull-up;
+					input-schmitt-enable;
+				};
+
+				mmc1-clk-cfg {
+					pinmux = <K230_PINMUX(55, 2)>;
+					slew-rate = <0>;
+					drive-strength = <7>;
+					power-source = <K230_MSC_3V3>;
+					output-enable;
+					bias-disable;
+					input-schmitt-enable;
+				};
+
+				mmc1-data-cfg {
+					pinmux = <K230_PINMUX(56, 2)>, /* mmc1 data0 */
+						 <K230_PINMUX(57, 2)>, /* mmc1 data1 */
+						 <K230_PINMUX(58, 2)>, /* mmc1 data2 */
+						 <K230_PINMUX(59, 2)>; /* mmc1 data3 */
+					slew-rate = <0>;
+					drive-strength = <7>;
+					power-source = <K230_MSC_3V3>;
+					input-enable;
+					output-enable;
+					bias-pull-up;
+					input-schmitt-enable;
+				};
+			};
+		};
+	};
+};
diff --git a/arch/riscv/boot/dts/canaan/k230-pinctrl.h b/arch/riscv/boot/dts/canaan/k230-pinctrl.h
new file mode 100644
index 000000000000..f240a980f37a
--- /dev/null
+++ b/arch/riscv/boot/dts/canaan/k230-pinctrl.h
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
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
index 95c1a3d8fb11..a9354e538642 100644
--- a/arch/riscv/boot/dts/canaan/k230.dtsi
+++ b/arch/riscv/boot/dts/canaan/k230.dtsi
@@ -140,3 +140,5 @@ uart4: serial@91404000 {
 		};
 	};
 };
+
+#include "k230-pinctrl.dtsi"
-- 
2.46.1


