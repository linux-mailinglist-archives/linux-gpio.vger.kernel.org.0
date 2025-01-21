Return-Path: <linux-gpio+bounces-14956-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3091EA17654
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 04:39:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1090C3AAD3E
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 03:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 367D318FC74;
	Tue, 21 Jan 2025 03:39:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11C6154C0D;
	Tue, 21 Jan 2025 03:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737430763; cv=none; b=omYWBEg/ZYUI1/X913AFUn5267ayVtmeZrG4ZgERrcDusWfipgts0u+ON4KmT90s0Upb2lB6sBdkiffN/0eUL8o69GzWifbWnJ6ze7ibtaNFtCbzZJIznibdO77/N2ZCWLDq0064yyW8eM0OxCogPhwcdSG2v0LTb3Yp2zsMfrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737430763; c=relaxed/simple;
	bh=c67nuX1SWyYm6oK6igpyLH+agNwjaZ2+WqnfxmmcZIo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KFQuQcz+4HZboAk4PuqQoxZVIxGvJb6HtktQaMG1jnzcvGpcA9bVyDxEWnukyBkhZWooL19eg9852UEvTz3knPNWgXN4vpwHQEnasIxJkgBdWsADz4G2jQDk2Q0afGEB5ZS1MB2VMo82qD9rQmhlEGDfXjO9+izKW3Xx6etNo/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.227.99.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 88661342F94;
	Tue, 21 Jan 2025 03:39:15 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 21 Jan 2025 11:38:13 +0800
Subject: [PATCH v4 3/4] riscv: dts: spacemit: add gpio support for K1 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-03-k1-gpio-v4-3-4641c95c0194@gentoo.org>
References: <20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org>
In-Reply-To: <20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org>
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
 linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2178; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=c67nuX1SWyYm6oK6igpyLH+agNwjaZ2+WqnfxmmcZIo=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnjxbKB8EyJKp9UOI6tEb9R/HxmhGdR8uy59GxR
 v6Lm7DfluqJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ48Wyl8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277dZED/9c7R/PVDkWyDj6rJ
 KksTrPBh5zlX7a5kh5kNWkCAKiwJ3CzuFa2xgzCJtm920UB3qtMEHzBXg/mXuQdB6Xnch91yn1q
 IkeoN/7GXNN2R7ZOISPD5BNhfQjjQl7A66fpQBU8Mnl6oDPFkqxZVaWjHMC6n7R5nDiPcq6c/E7
 fs+qIbkvT+73TODSM8HqNrlnhmingI3mOs9FLyst8fbOQlaDa/CtQ0oFSAPJ9MOR6WcaOkIlBRP
 8377No5UrwS0WrBxeEuatW34FNnNv6Ah5mvDojj2tfITSitmOaHmaOhtCHBs/OOnSxaOGXR4Evm
 B9LJvK1DM4h/2YDQvB3159/M9o7sfX2juD9o0NRjyhKaIz4gaR3wRMlwlv1IxS13IF7vZpwfoN8
 Jgv4gf6Zrswe+uBrj37NBfAcBmGvU4iXlA+xMKeO1eYR4Q1OUTlekZTkhH8hEpoW0OmSgvvkzBS
 p2KZhZbw8WRkapaPhW6/rKsAyzKoFhGPZc9r3l6Y0JfWIE5ZUfNnhy8tkWjYxKkHvkdzMIvn8OV
 +eHAzL2ueePiNEKz2xv1R0RjiHTpLi7I80aUdv6T22uc56c92pGYsqx06drZTY2yPIWOsU5JcXq
 rBC80wG6nm4oA9CHgz8qSf7sJ/TvNl/kWySoqHRG1s4GETwe1R9Vu/KkVceA62Dz45jw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Populate the GPIO node in the device tree for SpacemiT K1 SoC.
Each of 32 pins will act as one port and map to the pinctrl controller.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 55 ++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index c670ebf8fa12917aa6493fcd89fdd1409529538b..005f24b95d9ddae686dda07932d0086379cff219 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -404,6 +404,61 @@ uart9: serial@d4017800 {
 			status = "disabled";
 		};
 
+		gpio: gpio@d4019000 {
+			compatible = "spacemit,k1-gpio";
+			reg = <0x0 0xd4019000 0x0 0x800>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port0: gpio-port@0 {
+				compatible = "spacemit,k1-gpio-port";
+				reg = <0x0>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupts = <58>;
+				interrupt-parent = <&plic>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				gpio-ranges = <&pinctrl 0 0 32>;
+			};
+
+			port1: gpio-port@4 {
+				compatible = "spacemit,k1-gpio-port";
+				reg = <0x4>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupts = <58>;
+				interrupt-parent = <&plic>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				gpio-ranges = <&pinctrl 0 32 32>;
+			};
+
+			port2: gpio-port@8 {
+				compatible = "spacemit,k1-gpio-port";
+				reg = <0x8>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupts = <58>;
+				interrupt-parent = <&plic>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				gpio-ranges = <&pinctrl 0 64 32>;
+			};
+
+			port3: gpio-port@100 {
+				compatible = "spacemit,k1-gpio-port";
+				reg = <0x100>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupts = <58>;
+				interrupt-parent = <&plic>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				gpio-ranges = <&pinctrl 0 96 32>;
+			};
+		};
+
 		pinctrl: pinctrl@d401e000 {
 			compatible = "spacemit,k1-pinctrl";
 			reg = <0x0 0xd401e000 0x0 0x400>;

-- 
2.48.0


