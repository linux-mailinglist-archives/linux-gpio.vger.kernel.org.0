Return-Path: <linux-gpio+bounces-11395-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1520199FDA8
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 03:02:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A72E0286E89
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 01:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FACA17622F;
	Wed, 16 Oct 2024 01:00:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEAE13BAE2;
	Wed, 16 Oct 2024 01:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729040425; cv=none; b=fdlwp5oyBp2G/CwlmHZN0+/tl28BETEyo1It0goj6K3bDlXF3w6EE2GKxyMx4yU7WQT0rmBg3tK9t0bEaYK1X9hXTWWbBjmC58GlYL12qyY3118zlP5LyANqIldKT+SEFrtdDLVert2XoiAcfVY2z+8+a2zuWJHrAS+aIzzs5f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729040425; c=relaxed/simple;
	bh=3f4GLOsluvHuCgnEd7+tScd/3iBGplIPsNtjui2V1jw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AQikcrqqRDYx9DtsleBpGm4X9L/sGHeR4bHVKkcrJhpm5s2kHQOBU5KCODp3KgncTtrtR42LgGs3OFsWspyszFVIMtlWEKLEGIW8vtm5f4DoTFPmIgst6GiDH4FYmPpmAAjumPxZQYWV+3xtyFzNbtZMll5T0rbHiTxemMNsdXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 16 Oct 2024 08:59:43 +0800
Subject: [PATCH v5 3/3] riscv: dts: spacemit: add pinctrl property to uart0
 in BPI-F3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241016-02-k1-pinctrl-v5-3-03d395222e4f@gentoo.org>
References: <20241016-02-k1-pinctrl-v5-0-03d395222e4f@gentoo.org>
In-Reply-To: <20241016-02-k1-pinctrl-v5-0-03d395222e4f@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
Cc: Yangyu Chen <cyy@cyyself.name>, Jesse Taube <mr.bossman075@gmail.com>, 
 Jisheng Zhang <jszhang@kernel.org>, Inochi Amaoto <inochiama@outlook.com>, 
 Icenowy Zheng <uwu@icenowy.me>, Meng Zhang <zhangmeng.kevin@spacemit.com>, 
 Meng Zhang <kevin.z.m@hotmail.com>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2397; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=3f4GLOsluvHuCgnEd7+tScd/3iBGplIPsNtjui2V1jw=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnDxAUXO1zc9Ta5tpeIyJ2hq8POoNXUp36J5SWW
 j325v/ZbzCJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZw8QFF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277fn2EACeD6FHKXHz5bLlk9
 YMe230S4sl1NDB31Ct1jK3fgjJv4E1eKpGO3Wjj696e/f13vBKIfW1VLXzncYCifOQqV1yfGrRX
 wSdZOgA8RYiq8JGNn7DBvENGHjkDcQulGNZo7kac8SpHmLTeucu3R8BuQ1hj9nY+ABgYxp/dvhV
 PQKt35+Vxnd3PqVqt6HAl3sEpzFH4JnRBPKn2SDRa65UgWJ2BDQIm2UiMVcNO5uqx0cvZZlhxVg
 XTJd24XxFH8jlv/SNIXVRebnT1AN8yzs0Gspzk4EV2p5gz1VgSoLk0u94hYE8Vkz/s3+75Fk+vY
 2T0H4CgfhfhL0GQvWy0zOPSVNE75TdV/YAnKIkL/afOaNowm5af/l8FFHssDjcg8CKN/wIKN4N/
 y5e2hIb1oIKYs+cuLuTjT4uKq8b1p6OsGwmdDmn9X+r/69YNIrsebG8M4F5TVAQNDV2W7ZkXoMo
 Q7D0xOjUjmZmD5Y5TWJOZKkYxOd/7pZ88thSKMzUUCSGl2sqK3fjY4/j2ZBElqCnEvt8AVuM7kH
 PQKXdaU3I6yuqADx9JuGNHFMJkyTG1c2pIxqKxbdAvRqtVrdD6D6o1q0e7qiQne6jesgzewwvsI
 35yS9RaH5xf8S+3giwv3APN7oyMvrdawRvUGCytnYFl0j8W4qOe4Ijuwh1d4rIgces0w==
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
index 023274189b492598b312d27609051a855c021d40..bc88d4de25a621f1baa5b2b96cfa0083144847af 100644
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
index 0000000000000000000000000000000000000000..a8eac5517f8578d60cb45214589ccb45ac376b9a
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
index 0777bf9e01183f34c1eb82525418fe1a660b25a9..a2d5f7d4a942af26b3ba991928f23b2d9943366a 100644
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
2.47.0


