Return-Path: <linux-gpio+bounces-16130-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2671FA38395
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 13:59:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4C96172F2C
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 12:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4C6021C192;
	Mon, 17 Feb 2025 12:58:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC1121B909;
	Mon, 17 Feb 2025 12:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739797132; cv=none; b=a10ucZITjZlHXBNYPoXxQ/SThEJhIdl3uq2dusjpyJqNkF7ELpq5rKxKjOyLA2fneZDifZIKtulI/Ry+QLDtzbhfaXtJM3vuLlv8gCpqrK2TyZYD45N7QDGv/1m5t5sfQZ/RKiVCgSnpXyVUaH/MI0WSeXbRRLCXQftH9Ab2AYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739797132; c=relaxed/simple;
	bh=WVBz+R9XhlQhdzku9JAMTki0K5OuMCV+ma1IEixq6JY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qa/IliDZO5ciI8CPckLeW/Pu49gbGX+SX+flCvpLgZfhZqS4xUCR1BsdOrQ4fN2U1JA/f0/B6F6lhUclzea9zbqNGWpiV41nss60YpiundxnLbBSuMtvQzzu0/+zVa0hWH5pX3Tl3KUPhCRhye4cb9ikCDtr3DIwS9g2NamIJiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [180.172.76.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 844CF343083;
	Mon, 17 Feb 2025 12:58:44 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Mon, 17 Feb 2025 20:57:47 +0800
Subject: [PATCH v5 4/5] riscv: dts: spacemit: add gpio support for K1 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-03-k1-gpio-v5-4-2863ec3e7b67@gentoo.org>
References: <20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org>
In-Reply-To: <20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1785; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=WVBz+R9XhlQhdzku9JAMTki0K5OuMCV+ma1IEixq6JY=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnszJjEkNRYJm+jpFpDKfHlEE5r9b/y639sXg/R
 rB574NORAWJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ7MyY18UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277eF5D/wL0sPxLR1LrXWnQ3
 4myIo8WzuuteNyHsN7ZkVyzl74Bpe+3nFfUhPrHscL21GlIoj3g7PzUtKU60jBAI3tOrgtVETT3
 D8o2SXsZuMJrUh94Cs6lirwR5QBlkGwwsGSDFr9XoGuMB6p13Kfjx9sm4NPP3BUHD39SIDWRMnG
 4VxxLqKZXn4Fd54HWrl7Rddpm686YWmsnWu3/V8gtn848DSRMZokApH9GlGnMsFmYzFU/GfTSE/
 a5jrfo3dxPTc2b1iYGQ8R0YB345qR0uV/m1mO3ykPwFAHG+g/VkVhIcoY6KttqK5VnXDC7dtvwr
 2X0aYDHHUEUtl1D7nIMq4ALvksnVWilyRKpfsx5QHdZ9PgzOv/q+Psr951hkMhAQkpq/fTt63Pr
 LUj6J18JuW/d87JcBG3RBhnZmBwnEz5Y2fxVIBF7UkZnAJMfrc3iHX/yF/6IXofFI9QI5bmRau6
 AsY0QMPRosDaID9/IGWpYFHCK6F1RFr2rueM+P8JINbrWo/R5ifRi1Q7BHA9eaGxAhl1wKcyJ/i
 yBh/pQhiCGfn9Ry4+yBhY8g9wth3zDSDXDqnM09glVHoF16kVo7PwFgUwCfueqJhB13qI9UQIoc
 ZshpzZwNNN4fxTDZ+vTR0e3bXjLPTqOVvksbGTXs3SQth6h/8itYMFEzpS90LRDTMdjw==
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
index c670ebf8fa12917aa6493fcd89fdd1409529538b..d65ff76ead8cbe303412954c8abafbefecf8081e 100644
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
+			gpio-ranges = <&pinctrl 0 0 32>,
+				      <&pinctrl 0 32 32>,
+				      <&pinctrl 0 64 32>,
+				      <&pinctrl 0 96 32>;
+		};
+
 		pinctrl: pinctrl@d401e000 {
 			compatible = "spacemit,k1-pinctrl";
 			reg = <0x0 0xd401e000 0x0 0x400>;

-- 
2.48.1


