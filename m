Return-Path: <linux-gpio+bounces-18725-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE8CA86940
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Apr 2025 01:35:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A1F97AA90C
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Apr 2025 23:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F16F2BF3CB;
	Fri, 11 Apr 2025 23:32:40 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51B32BF3C2;
	Fri, 11 Apr 2025 23:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744414360; cv=none; b=ZbhV0rEKBPnFjaF6wBhsU9MERWlBGmXtf3lYJSuNyUAyR8PUtFThRDy/3AkIbaguA3TenxjMew2KA+xkt00RxwDvl9qjxWD3P4SSu2ta3sY2sX5ACZ7NfYxXMmTvAP/G1L2E4jkitTi9mcxV9eVCRQvaq4v0Jns8ZU4PUC/hDVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744414360; c=relaxed/simple;
	bh=YrlYG0PuIhX+fM4QE2J+VecM1LCm6wkTyVul/SahGUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FkuIknSpXiJnYwgxPfV+r5L6UpZnHxJmSz1kywistC4gOe2pN7T3KvCNqKiAlp4HIv8eBwC/8SlgC2innzXsk54nvu8ZEwqn3lBc7EgaQG+Zt1P6r3YF5sleyL7dyE/oQasnGJe8m63MAsNrefuIQrFvOi50JkwEtzk0Ut0nOAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 34AE73432D5;
	Fri, 11 Apr 2025 23:32:31 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sat, 12 Apr 2025 07:31:31 +0800
Subject: [PATCH v8 4/5] riscv: dts: spacemit: add gpio support for K1 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250412-03-k1-gpio-v8-4-1c6862d272ec@gentoo.org>
References: <20250412-03-k1-gpio-v8-0-1c6862d272ec@gentoo.org>
In-Reply-To: <20250412-03-k1-gpio-v8-0-1c6862d272ec@gentoo.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alex Elder <elder@riscstar.com>, Yangyu Chen <cyy@cyyself.name>, 
 Jisheng Zhang <jszhang@kernel.org>, Jesse Taube <mr.bossman075@gmail.com>, 
 Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1793; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=YrlYG0PuIhX+fM4QE2J+VecM1LCm6wkTyVul/SahGUw=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBn+aZuc6Btsz8hWNLUclrAWt/vtKUFU9gDludtq
 lprgt5hbNeJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ/mmbl8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277dTSD/4tMEKx7GOf1vg9zz
 3MwpLQbUebhEVKxHuCpia83gNOTyNRUqHgnkSIfo6KrRMvIac1rcdd6e0kH36ivp33chnXeULhq
 g2yM2bybYNAlKBUegggSwITZSQ7O/I2mP1Bj8nlJzF66TvxEwrYN3pSeDNr9TX2HGPp9QV0CmbF
 /Mj4y302f7CGzDkup4CKL2CPZpigk9GZ/An4pcAUBT6u+XDSREQNHNKpnGyoVaK0MoCtPQgBC4k
 XfpLWKv4m7Ffl+fcB5derFJEEtCUhgtAYpJ+5qa9qUuwI9RFwwCiMP5xbW0wit7YMTpUIz6FX6C
 6WKSUI2+yWtFhYWtwITSq+dlLYDB6OFvVTUF1/fwEPQM2cC62UcmUtTxLzrFpFuSYf4Vz6BWzzA
 13Y4R+jJph+fZi3NRBvrFZ9AnQdkMTD9f9F7G0fj8y8djyhFy9xzI8K0kWX69PJ42u3DNYsKtlG
 6iDaVBwAJvQfZxEpM/+deZ0YsOS1Wdo9iux3b8TlBKimtkZvhr477YESXo0MbIoJqq0ds8oYKye
 EYYMfZjyF/san6oPnnPRMYioYmva9dkR+SgabXG+kHqra1QXrgFGe9lyWX85epGZViqg88S3bMI
 8ESy3j/hdsgO6V5TCB3RWt7KGMt3Qs57QlYlYqQYAIoI+1BcOai8G0kWK5rC7jrEYvwg==
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
2.49.0


