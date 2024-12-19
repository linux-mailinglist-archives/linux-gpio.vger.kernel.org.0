Return-Path: <linux-gpio+bounces-13998-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F819F7546
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 08:20:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57C0A18916B3
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 07:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F164217F20;
	Thu, 19 Dec 2024 07:18:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAC6217734;
	Thu, 19 Dec 2024 07:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734592732; cv=none; b=Cv8V6TSK0ZptlYNa8Vn7xMcCb+12+V9zqLkvY897ca5GXPY3hd6qjqlMVmoTuQc5Bm64TzRLvlhatC7jrZ7u39FRl1Q3OzWGn1x7SJut4pfR6TkqFat+kKG/BZEiXbe+pEvlwghq5tRMo80lMvv1ivpIoe+/5oOkL3s4wJXDiWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734592732; c=relaxed/simple;
	bh=8k9ZtiUx47mbBAMnpFiZwSbwpeenY/eKCaJy4BYVKmc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HBz7LrLbVzgNC3FcRaclq85Z9EaXR+yw4xupG9Zw4ZhBVk+TQFbwOexdjdvUSNZbpkCqKr1sw4LUlqP0+G0cm8weQFKJWIchTwkIcIGBmj+/5dCzFSnqQkUhys4z46U/yySOHH1MJpAC/ljtNWjYFz1cA5GhgyZIZfEjiqsWE0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Yixun Lan <dlan@gentoo.org>
Date: Thu, 19 Dec 2024 15:17:45 +0800
Subject: [PATCH v2 3/3] riscv: dts: spacemit: add gpio support for K1 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-03-k1-gpio-v2-3-28444fd221cd@gentoo.org>
References: <20241219-03-k1-gpio-v2-0-28444fd221cd@gentoo.org>
In-Reply-To: <20241219-03-k1-gpio-v2-0-28444fd221cd@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: Yangyu Chen <cyy@cyyself.name>, Jisheng Zhang <jszhang@kernel.org>, 
 Jesse Taube <mr.bossman075@gmail.com>, 
 Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
 Meng Zhang <zhangmeng.kevin@spacemit.com>, 
 Meng Zhang <kevin.z.m@hotmail.com>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1091; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=8k9ZtiUx47mbBAMnpFiZwSbwpeenY/eKCaJy4BYVKmc=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnY8i4EceF6Gs079MvZbYKcN5sLCLXXWwNziHU3
 JPXJwbDXYWJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ2PIuF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277YI1D/oDKcjA3apmQ3Anjp
 ebtiMVXd64vaS6P1BS3Q93YZQzYikbuHKCCMrEfkyYgIVSIOYO+NO0KgJ3xkL37q7rkVYnzr/7w
 LvqaAfI+e0l8jUE0D65ya0BAPkOGYIpEoEdWns2ynXFhqkiJlWpb3NBekZ/YtRoUc6ccugmDIPS
 XcShp7Qq4/2l75obrkplYCCHVAPobVgaTkN99Fexith6JvQXsQrsrt8gqdgZbGtniX32Mo0gt4K
 qF19x2ZyRTR7wDaO5QUTHStvF0coZkJGMlc602IOxGoqZpWRLLN0SlE416NEhBrCu5PCmsBzI20
 VCCg9ozkr57OjpAKUXxttM2Kvm8/5+Ow8uVOcKTcMSgLPnrlpvrR2JVVlFDzcHEoDNKjLZ7YRIt
 9qsAFFB3bV6j5KkKOeT3nI77LECaVyfxVvJJV45BahbGlFpXOVp2+1hP2o0GD4tM35uWIkenuHZ
 7Q5O10OkOwxGf1tReMa9Ak/IwXQBPvIfHnz/2oY8Mru3UqT2B8VJuJxwo8t2QdDe/df/MSdQqHO
 RxgQCmbXkC6dbmAjjemvF8hqhljFUn/HNyu9Ej6B0FVnngSjUha6cKSf55+mMY+1ZsKoUnauJOZ
 fD943wJIGjp2xNjofyZWLTJ1FERgkQJptObUz3rbeuaffN6tipVryT9xhUe7nZCiu/Kg==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Populate the GPIO node in the device tree for K1 SoC.
Also, map all 128 pins as GPIO to the pinctrl controller.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index a2d5f7d4a942af26b3ba991928f23b2d9943366a..648b459597a4d0ecb6a29881dac76bd4cd749c8c 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -416,6 +416,19 @@ uart9: serial@d4017800 {
 			status = "disabled";
 		};
 
+		gpio: gpio@d4019000 {
+			compatible = "spacemit,k1-gpio";
+			reg = <0x0 0xd4019000 0x0 0x800>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupts = <58>;
+			interrupt-names = "gpio_mux";
+			interrupt-parent = <&plic>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			gpio-ranges = <&pinctrl 0 0 128>;
+		};
+
 		pinctrl: pinctrl@d401e000 {
 			compatible = "spacemit,k1-pinctrl";
 			reg = <0x0 0xd401e000 0x0 0x400>;

-- 
2.47.0


