Return-Path: <linux-gpio+bounces-14225-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B01B29FC2FE
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Dec 2024 01:34:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5A3216552E
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Dec 2024 00:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA2933BBF2;
	Wed, 25 Dec 2024 00:33:36 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D133D2FB;
	Wed, 25 Dec 2024 00:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735086816; cv=none; b=ChV/n7qg86xDIngufRssMcCO1jfeyHYKiBVBZ2Ho+mRQPbTEM7UIv7KBBtszZeGuf/2pkb5GqQmtnvngdvIr/MsZQbNJeQwNztlbipefXOgn22KRkuBQ+mRj7CqLLWJNHu7q2wvBaVZCeMiDyU+Po/2Pr/Mezf5Su4K6+zviIdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735086816; c=relaxed/simple;
	bh=AySrMTveJUwwqh3zG/JqbY/pPxQJ1p6ycMJxkwoG/gA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RBrNmNfkX5TbJNVJ0s3oib8AopODVGI8t/dVEtRZ0ThXHq1Y+m25tmGg98eX+BC2grECusoX+xGkGLeYuFgFcMaW6Woc/XVijY4etFj0gCQ3KyDItyL5DXLu5fIrlbDtcsInSW1BKGtQxZA41q4AYFqwH26DvfLz5eLTeochc8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 25 Dec 2024 08:32:41 +0800
Subject: [PATCH v3 3/3] riscv: dts: spacemit: add gpio support for K1 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241225-03-k1-gpio-v3-3-27bb7b441d62@gentoo.org>
References: <20241225-03-k1-gpio-v3-0-27bb7b441d62@gentoo.org>
In-Reply-To: <20241225-03-k1-gpio-v3-0-27bb7b441d62@gentoo.org>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1055; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=AySrMTveJUwwqh3zG/JqbY/pPxQJ1p6ycMJxkwoG/gA=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBna1LEBQFMqC3ZhScCywepFcpG6RzRKU+OFbTPM
 fSiW6ix5aSJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ2tSxF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277dt4D/9kr6A3nhOojcBbd3
 7Wf+9AjNtpQvQ7IQQ4qVBzyhfB1WpmQlGFc9Y3T6yYhGaC2qS6gUTPFvLIdg8pxzyP2iP7PT3D2
 K9L1FG/77l+7Z2N5JpIoGiAPL/NVAB1Jju7VN00hhi/SwDMfkqJRtZRoEm011rFEw8l4UKltg8u
 MNyMd3424Y3zft2JDoN/pvglijSIvnAjc0rIJ9t+We9Y/47ODaCuXDs0+YsM7qcTVbxzlhBXUZN
 kDYDG4Fnor6Xs//n4yA4bH2TQU2sUa6hMDgzqUEvGl08c6ZTPRNFt9KzIiIiI4IWA88Cey/gNSt
 Yt1bfx/elDL1W/VMn+WhfHXRsKfhWR1o7GjEurYUssSNqEk3Le8m8veduO3bBSxz0FD/gBi/VWp
 tjb61DAj2oo85xLEpvoRL0iH02eKRqNV9Ghu8iwH3yWRt3kOfzZ/DJDGpKxpFApQxdvKQkDlfmK
 JMBJygesalq0BHcxn/Qfg2bh6ISQk/D5rgaZYCNBwXcNdhvHPx6gq4XOmXzjjQbknB/HQ0RZLoC
 OLtnlQxmmWvE2DuMVDQ4/VpEnBjsgaa7/IEYY4SRzWcz9+OEQEPnQm1aVQvV0oDkstmeqXAn6R2
 qTZzxSNNVpiGXO2PEnM8B7LBCWxD+AVM60WQbHUwwgHKMedsqna2PA0u/w8TtC+TLMQw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Populate the GPIO node in the device tree for K1 SoC.
Also, map all 128 pins as GPIO to the pinctrl controller.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index a2d5f7d4a942af26b3ba991928f23b2d9943366a..bdd25584d67c9a9e41f8d8227fe84a1bdeed7b41 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -416,6 +416,18 @@ uart9: serial@d4017800 {
 			status = "disabled";
 		};
 
+		gpio: gpio@d4019000 {
+			compatible = "spacemit,k1-gpio";
+			reg = <0x0 0xd4019000 0x0 0x800>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupts = <58>;
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
2.47.1


