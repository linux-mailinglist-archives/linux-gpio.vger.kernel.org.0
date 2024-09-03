Return-Path: <linux-gpio+bounces-9637-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3F9969D8B
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 14:28:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD59EB23BF6
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 12:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16C6C1D86F2;
	Tue,  3 Sep 2024 12:27:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98431D86E8;
	Tue,  3 Sep 2024 12:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725366449; cv=none; b=r6sTXmkntpPTtstrCxj+uIQ8hnTq1zF+A714bHw5hpQEiddHT50CSmMDpaVs+zPm5qL//Xj3wB7NE6locMF2QJO02/e02rMJ1IuCGps6oN2OMgZxn8KZFLFlN2hR3dEbOW59r9E30nb3/Aia0GmnJRlmjJQ4IyET0ZHF0at/vuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725366449; c=relaxed/simple;
	bh=72OUePKJmY9EObBTz2p3oSPWaKFyOulBRCi5gSja9tI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pDRAx47XJLhFv7yU46+y5s0PKGJRVRMEvd9O04iNV0A7AExGZNcq9CEOWEWHQgKSkYsiyn9xhDQ4v4XKoNpd51NosSV6AB4aZwjPkI1CetTBnveVOI5YX9fZHiwQXs0noooJGBjT4rGVc/P8doT8GTbbUJm2rtyCsMJ+JZyWUIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 03 Sep 2024 12:26:46 +0000
Subject: [PATCH v4 3/3] riscv: dts: spacemit: add pinctrl property to uart0
 in BPI-F3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-02-k1-pinctrl-v4-3-d76c00a33b2b@gentoo.org>
References: <20240903-02-k1-pinctrl-v4-0-d76c00a33b2b@gentoo.org>
In-Reply-To: <20240903-02-k1-pinctrl-v4-0-d76c00a33b2b@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
Cc: Yangyu Chen <cyy@cyyself.name>, Jisheng Zhang <jszhang@kernel.org>, 
 Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
 Meng Zhang <zhangmeng.kevin@spacemit.com>, 
 Meng Zhang <kevin.z.m@hotmail.com>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2235; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=72OUePKJmY9EObBTz2p3oSPWaKFyOulBRCi5gSja9tI=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBm1wCbeyJvCjfwfjk6CxerD0e3wqymKHbG2IGb5
 8rM/z5ULKmJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZtcAm18UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277WrOD/9QFex+y4trbZ+gJC
 YHw1005oEpM6MRg7yEsgUPuISrnLXM4a8S8R+J0AQaP7OV0gIF51d7rxqabRAHk9pW+GyAISSS6
 2YeBSA0Wd2luVEy4Ioc2qc0xkqYnuZR62kz/3QN4QG55JI6KRX9UQnSUwau4xNNa2ItFHGCb2cS
 qL8sVNPPdmBZe0TSUMByqV+ndT2SERktZtU0O5xkk1a3JHp6F+p5/99utf+QkkxnwkRxtVvZDtt
 B6lkhaGX5DVjygkugsuTr9Vj7C+Y8yb2w3xMdwOfc4xbMaAJ0IEhZ583peVog/STflOeJsi1nmu
 X44CAmGCODxpuMeTIW9AI5q+8Foc+sL0wt42IJB9rK58aYC+Dkq+e3IGumLNGdQmR1+xntXNxPk
 4Nsy5eYKt0aUnOJFa8sXYAB5SS06M2RKbxe4fqUio1p94ucHLvzyw8V7cIpiy8wk1dhUZJdwnaY
 HFqkW3l8kftO0cuucRmSquFfJ07ByMBcX3q0xUaIloF6j8xzV6OQwCopJYPuzAcSa0UA1wNtCVW
 TJI1OypksHZPzs4+NsFg+DVSleu9QVfWDRwIUVhr/qCzIyBKWMdTGpCbv2FbvisyuADQEL/Jxhk
 s8YcsJ+m3LJWdOfk/xJe6D85+LvkTR7QFEOuviA06Fa0nAeNjnFshLS+TiIHuynhBeNw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Before pinctrl driver implemented, the uart0 controller reply on
bootloader for setting correct pin mux and configurations.

Now, let's add pinctrl property to uart0 of Bananapi-F3 board.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts |  3 +++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi    | 20 ++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi            |  5 +++++
 3 files changed, 28 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 023274189b492..bc88d4de25a62 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -4,6 +4,7 @@
  */
 
 #include "k1.dtsi"
+#include "k1-pinctrl.dtsi"
 
 / {
 	model = "Banana Pi BPI-F3";
@@ -15,5 +16,7 @@ chosen {
 };
 
 &uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_2_cfg>;
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
new file mode 100644
index 0000000000000..a8eac5517f857
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (c) 2024 Yixun Lan <dlan@gentoo.org>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+#define K1_PADCONF(pin, func) (((pin) << 16) | (func))
+
+&pinctrl {
+	uart0_2_cfg: uart0-2-cfg {
+		uart0-2-pins {
+			pinmux = <K1_PADCONF(68, 2)>,
+				 <K1_PADCONF(69, 2)>;
+
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
+};
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 0777bf9e01183..a2d5f7d4a942a 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -416,6 +416,11 @@ uart9: serial@d4017800 {
 			status = "disabled";
 		};
 
+		pinctrl: pinctrl@d401e000 {
+			compatible = "spacemit,k1-pinctrl";
+			reg = <0x0 0xd401e000 0x0 0x400>;
+		};
+
 		plic: interrupt-controller@e0000000 {
 			compatible = "spacemit,k1-plic", "sifive,plic-1.0.0";
 			reg = <0x0 0xe0000000 0x0 0x4000000>;

-- 
2.45.2


