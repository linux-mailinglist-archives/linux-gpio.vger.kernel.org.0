Return-Path: <linux-gpio+bounces-9736-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6CB96AD4F
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 02:28:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FDD01C23D9F
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 00:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D86262581;
	Wed,  4 Sep 2024 00:28:06 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2F1B66C;
	Wed,  4 Sep 2024 00:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725409686; cv=none; b=XP4XNsGnuIAtazMt1aTX2BvpYv5WAzIpLAA7trAAJzTWlgRG2KMtkyhOe8tgA4G2dGjXhlPe7yXiVpRRpKs+e7ljOO/9/ITesUBlVcF51Kpt6Ntr87u4pMqygXz6tIaRDkfw4gIMWDfe3MvvonOPeBGoVTZ2udcS3ldE0B6sYXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725409686; c=relaxed/simple;
	bh=gy4hAKBYfvoYkNXZdcCiPvChAhmVEjnxfrdfroixmG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J2lZuJ/aTJesz2uqFxkZY8M5vgMBbbblDQEgzncZanMd9nEjM3U3fTy1raaLn6zTut+yB398N/UL0ux5fQKayS6/JqiZn25h0iD/KL8SLispGDIBuEzKGMx82bxTZOLskOFj/pVT6MhbylS2HlyRVyub6mOvXUscTucMOEI0Vy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 04 Sep 2024 00:27:25 +0000
Subject: [PATCH 3/3] riscv: dts: spacemit: add gpio support for K1 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240904-03-k1-gpio-v1-3-6072ebeecae0@gentoo.org>
References: <20240904-03-k1-gpio-v1-0-6072ebeecae0@gentoo.org>
In-Reply-To: <20240904-03-k1-gpio-v1-0-6072ebeecae0@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Yangyu Chen <cyy@cyyself.name>, Jisheng Zhang <jszhang@kernel.org>, 
 Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
 Meng Zhang <zhangmeng.kevin@spacemit.com>, 
 Meng Zhang <kevin.z.m@hotmail.com>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=gy4hAKBYfvoYkNXZdcCiPvChAhmVEjnxfrdfroixmG0=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBm16mAzKQqhIRAHRj8x0eR0whqAE38Cg8Ov60Dg
 DzdoEyXVd2JApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZtepgF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277apQEACJgGBpAHyaenJ7eF
 T7/Q8syncOfzBxoTm7WYnlaM23Wup3C4/KD2+u0c7pRKkNgQp+K3OdqRUiO1C8pb72qQIEFHgv+
 zH2HKGcPstHabN3mw442MeRuuqla6vyX/GtS/UvBY/u4fErG7eCCbW7tWHcWgYXXCxWGHKqHbUK
 LSymTQg2IOLLIayOtuwwBqmHVk1yE12B9D91+Gn6sNZU+XCCrWX8tfsl5aS1xTSvvxENQoRO8fN
 WsUM7M/7aNXXrYMa3QASsQlgjY7ygyrjmBrtjlw2l5czaCtnQbp4ZJCpzM8bt8M+HnM3OVFr+yF
 A5c50uwUhCcy/y68IZJ9ttLVMrAEFEjLgOk0LbcP/PhMkLTg3+958cZSFIlkF/szBS7Cp95oCge
 Vr5cF6wHtezAte9s/h1BnfXj7AFpVc357t4c9OENS748G44D1U1fFuak6U0vuBVc+/2DFRlkF73
 Z0xfk+LFOkU8fzQo2yr/++kh/C8Azro0ztPI41XQHr2ebAET70n3jd0QbY5A1drZkjOFYqKj6RN
 lzOW//tphdlNAv+XNwZ4AnC/flVSb4EsR1wfUJDXfFLwsh/dddvwhGfCgnQjleX2ogYFIlhalu5
 UuaKZQ6Ly89+3cQ1nnan5hjkprBN7ONfRNp7ZpdAeVZ2WzE91p2j0EDHgeZWsg/2MjuA==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Populate the GPIO node in the device tree for K1 SoC.
Also, map all 128 pins as GPIO to the pinctrl controller.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index a2d5f7d4a942a..648b459597a4d 100644
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
2.45.2


