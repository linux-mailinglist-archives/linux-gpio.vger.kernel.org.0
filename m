Return-Path: <linux-gpio+bounces-16434-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65157A40E91
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Feb 2025 12:51:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0382E178848
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Feb 2025 11:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC64C20766A;
	Sun, 23 Feb 2025 11:50:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612B720764E;
	Sun, 23 Feb 2025 11:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740311435; cv=none; b=SAg2LRthyjW7h7rXmxbz4XrjPMqO/NvVJuITLMyy4WHF9ry4/KzmFglezHYLGydMy12zt+7DvsmH1MUFIAY8TU61JpNFEPzlcyKbpngIP7bv12g5IZrshX2NPsCwV11gt+GRkdpaleaDZxTPUonFk1dqcsKa7RxKfiNu9umVFpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740311435; c=relaxed/simple;
	bh=wtQfZAe5q6h9LIhqpr/DAcv/omJD+9pnXTTCbG9Weq4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qx27Ki8EvomWBj6f4nknBzYYkU1E0MquAB31hQC5IiWBFkRLd0PULDL5TL4Bq7UWsbJ78tDzHbC4qkVXCxoncM/A8Vrvqyx6di+6OLem00WHrcSdr+7WpIl+SRuZuMx7N/98oeHFl4c7Namyql+/wwU4971ZslNS/Cm84JvWlZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [180.172.118.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 5ED2A343003;
	Sun, 23 Feb 2025 11:50:28 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sun, 23 Feb 2025 19:49:34 +0800
Subject: [PATCH v6 3/4] riscv: dts: spacemit: add gpio support for K1 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250223-03-k1-gpio-v6-3-db2e4adeef1c@gentoo.org>
References: <20250223-03-k1-gpio-v6-0-db2e4adeef1c@gentoo.org>
In-Reply-To: <20250223-03-k1-gpio-v6-0-db2e4adeef1c@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: Yangyu Chen <cyy@cyyself.name>, Jisheng Zhang <jszhang@kernel.org>, 
 Jesse Taube <mr.bossman075@gmail.com>, 
 Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1793; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=wtQfZAe5q6h9LIhqpr/DAcv/omJD+9pnXTTCbG9Weq4=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnuwtp8wjgDLyfsc8/aGEqxfmS8LF+zSDQP7b30
 pFom2BPw+SJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ7sLaV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277RgtEACN3iMvAqmFefluWH
 MoKlUv9qiM5+v8wtcMeAcOFoJJYgHBvRpyE5Osy5gHcMJ8IYEKR0WrpxRWn8x0qWSH1UGn54/cz
 IE2jPpQXF9qcyRRVMgrvL8jBRAARL5iLjqVgQ/ONFE667cRzCuUzWiSPeHqM1P+Hcwf5c6sWixN
 UsGX2oJH37P/dM1aM4pGs0xjylmthAWiAdo3aB0nNzg9OWiVB2gZ4U9TjOtYT6rAuQ7tvLHLUb3
 SJEIxljMXVbT8Wr6VXT0Q5no8vtkiTZ5Iv2Q2DEtJbAXHbjiR8wL1oTLVjj13BFLAhqK2uzKBuw
 92F1MxMeR+GNPnW3hJt17Id2/lb44owjwt6vRIpZFufWmvOhOBqC9JtzQtnToEd6nXQvGQkYGWo
 TfzjYkZfF93uc858ELQqba6F3a1Dw+w5wn5QpJXRKBFp3Y1niVVlgWWg4h4NjZQao0RfioApQTg
 R4sBnW9d6beGgBXrrTWGcC/abXx9EULMaJXzr4ExGEu9c0N1p2rY3TVlHoxI8q+6XBeEqGGGl1z
 Sl01nn41LKAq9mjJOwzkGJtyJEU3Qd9i7A1ccQL96H9OSGk/jH3msTW1lVORpiNXb4MMUlk92BK
 rjTmmnX97Qmb2pCUZxSrS3G1D8hik5Tfs9ZyCdcF9XLaloUKNXXD956e1Oyti3jJit4g==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Populate the GPIO node in the device tree for SpacemiT K1 SoC.
Each of 32 pins will act as one bank and map pins to pinctrl controller.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi |  3 +++
 arch/riscv/boot/dts/spacemit/k1.dtsi         | 15 +++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index a8eac5517f8578d60cb45214589ccb45ac376b9a..283663647a86ff137917ced8bfe79a129c86342a 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -7,6 +7,9 @@
 
 #define K1_PADCONF(pin, func) (((pin) << 16) | (func))
 
+/* Map GPIO pin to each bank's <index, offset> */
+#define K1_GPIO(x)	(x / 32) (x % 32)
+
 &pinctrl {
 	uart0_2_cfg: uart0-2-cfg {
 		uart0-2-pins {
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index c670ebf8fa12917aa6493fcd89fdd1409529538b..ff86a02c25f2e0818a48ed56c75e911d8612f6d1 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -404,6 +404,21 @@ uart9: serial@d4017800 {
 			status = "disabled";
 		};
 
+		gpio: gpio@d4019000 {
+			compatible = "spacemit,k1-gpio";
+			reg = <0x0 0xd4019000 0x0 0x100>;
+			gpio-controller;
+			#gpio-cells = <3>;
+			interrupts = <58>;
+			interrupt-parent = <&plic>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			gpio-ranges = <&pinctrl 0 0 0 32>,
+				      <&pinctrl 1 0 32 32>,
+				      <&pinctrl 2 0 64 32>,
+				      <&pinctrl 3 0 96 32>;
+		};
+
 		pinctrl: pinctrl@d401e000 {
 			compatible = "spacemit,k1-pinctrl";
 			reg = <0x0 0xd401e000 0x0 0x400>;

-- 
2.48.1


