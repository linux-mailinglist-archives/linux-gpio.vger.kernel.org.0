Return-Path: <linux-gpio+bounces-9128-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE08B95E387
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Aug 2024 15:11:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 949711F21836
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Aug 2024 13:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE82B16C6AB;
	Sun, 25 Aug 2024 13:10:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0C5158DD2;
	Sun, 25 Aug 2024 13:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724591455; cv=none; b=DVhXixi7e0Z35iJ6Z1jyKGinUZw4zugCmUo6+41NdHEHTHk5gXZrfaJYp0c0XrD4feKrLK380ZaAK98hA4zCplFWidgtEAjzpm2Y/6xUhYXoDi9jRMzhWDjvn8rFnZMkIHbCyoH7I5kR8TmF3QMCFzhvFkFakBQmTPN+Qjaj91M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724591455; c=relaxed/simple;
	bh=QJkxKsIU1argkVZ7JBifjLz+hDB2JTSsXXcaDwOQPxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JyWCm62A8KEs3BEF5wR/u50D7w2oCntlqOgOPP/KNznr0ZlWWN4evto4TGv5ZUaGwPilysrD1jR8Pn1emRmGxN3C/oURurbf5Wa8lOtObcF6tPR4Qv7wyR19JSqRbLR9oGJbeEMYJmkU/fAx/1PRB0YwIgNAlMdkKICar7qHYLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Yixun Lan <dlan@gentoo.org>
Date: Sun, 25 Aug 2024 13:10:04 +0000
Subject: [PATCH v2 3/4] riscv: dts: spacemit: add pinctrl support for K1
 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240825-02-k1-pinctrl-v2-3-ddd38a345d12@gentoo.org>
References: <20240825-02-k1-pinctrl-v2-0-ddd38a345d12@gentoo.org>
In-Reply-To: <20240825-02-k1-pinctrl-v2-0-ddd38a345d12@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
Cc: Yangyu Chen <cyy@cyyself.name>, Jesse Taube <jesse@rivosinc.com>, 
 Jisheng Zhang <jszhang@kernel.org>, Inochi Amaoto <inochiama@outlook.com>, 
 Icenowy Zheng <uwu@icenowy.me>, Meng Zhang <zhangmeng.kevin@spacemit.com>, 
 Meng Zhang <kevin.z.m@hotmail.com>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1698; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=QJkxKsIU1argkVZ7JBifjLz+hDB2JTSsXXcaDwOQPxU=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmyy1IxeA2T6+u17A8pLbXNoLeUlQZi6Ywlz20n
 KjDdniBCAeJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZsstSF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277eJyD/9lPJ1nku5/PKAZwH
 SBVrSAu7teWSK9l23NmtgkFZwfW+7CbsOU7HHMi7WRGOs6N0bnRSqBojguaaZkt1EuQcFwubHsB
 FjGf18Z3Q5RGMRtE10jbwzR343oKoZGZsqXjvJYwRbj5xhGoxdVtg9BEBwv3CYgjRcSmlzwzk1Y
 2/4oVqgVuW4d/4oopeFca0Iz8n/Z+yN35kce2iPHq195b5cTVbaeKRECuVEoZWyziXSRRSoIHi5
 oH06yaihWCx24XfGN6sY1tiDnfa4vAERtQjyDG60m0CCd4ok2AlKNO9BlMALhfoEttsBw/Xno5i
 /GwxRA1n4iMCFD3r8ARmZmpGlgvoNSybdvBbCLifpusIXDABg9wlagKYegEdMxAZo4/wTo0v1WP
 d9GISECoyeXjS2Ob6xuDAlRVH4uFSrNU1DlzHr3OIXWcOYfbWc++gS/pdFgJQoDPSp8nW4Uu2zW
 HFjo7iJWxBKsRsrd0ANL2WVe/udBkISjvNn/evuTttO0AyPpV4Oklgji5f+0c/gg6s5ZwqF+Zc9
 r4bQGhxCaz1CRc9q3T79GWmgjV9kIe2RYJGRyma9HZbXLqF9fVyM8Evu2yF8USq+9MtHxs1DmSH
 Izgnl5AKgMO6GFQJvuLTjafWZwpbQ2+TGUbeyEJ4GPf/jl/yM4jl7P+J0xvTT2IsH6Gw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Add pinctrl device tree data to SpacemiT's K1 SoC.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Note, only minimal device tree data added in this series,
which just try to demonstrate this pinctrl driver, but
more dt data can be added later, in separate patches.
---
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 19 +++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi         |  5 +++++
 2 files changed, 24 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
new file mode 100644
index 0000000000000..38ccaad1209f5
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (c) 2024 Yixun Lan <dlan@gentoo.org>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/spacemit,k1-pinctrl.h>
+
+&pinctrl {
+	uart0_2_cfg: uart0-2-cfg {
+		uart0-2-pins {
+			pinmux = <K1_PADCONF(GPIO_68, 2)>,
+				 <K1_PADCONF(GPIO_69, 2)>;
+
+			bias-pull-up;
+			drive-strength-microamp = <32>;
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


