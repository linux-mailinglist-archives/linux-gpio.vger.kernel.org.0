Return-Path: <linux-gpio+bounces-16598-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7951DA451A7
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 01:42:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CDDF179D1F
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 00:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AA341552FD;
	Wed, 26 Feb 2025 00:42:33 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1045014900F;
	Wed, 26 Feb 2025 00:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740530553; cv=none; b=V+VfBxeeal1ge381+OFfADvM8nL89ZU61w/YDIxcOSMZqQJ8qQa2zgQU/A4F0jtcafs+At6MNRMi8dQRxUOKVmsJYs7KWy5VwxUVemmgOsCCmJ9we0DYLMItNn/RToTOhJHhV2Ysdycjp5OTGOJcZMtF49AZFiVp4kIA4aPXG30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740530553; c=relaxed/simple;
	bh=wtQfZAe5q6h9LIhqpr/DAcv/omJD+9pnXTTCbG9Weq4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o4PsZa/pr9JRusRPNGCjh93ZvoBHhXvOVuyWKHI4+BqhwDoleXfe+Z9B8jmhBssaQ/OfUvd5zYDpYWj/D4xsvZEA/edYWVNsOGHnobX+QS6IpMoS/lgImeSkPHoTLKSvXwtKfksQW3V8Dbh8eLqOgx9OCO0Ia3lxXGDhirwJPOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 6CBD634328D;
	Wed, 26 Feb 2025 00:42:25 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 26 Feb 2025 08:41:19 +0800
Subject: [PATCH v7 3/4] riscv: dts: spacemit: add gpio support for K1 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-03-k1-gpio-v7-3-be489c4a609b@gentoo.org>
References: <20250226-03-k1-gpio-v7-0-be489c4a609b@gentoo.org>
In-Reply-To: <20250226-03-k1-gpio-v7-0-be489c4a609b@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
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
 h=from:subject:message-id; bh=wtQfZAe5q6h9LIhqpr/DAcv/omJD+9pnXTTCbG9Weq4=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnvmNWpIvhLttfG+OcyZDHMaFSCVhiEqUJ37eqg
 FoqOuZbbueJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ75jVl8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277QodEACfHfF/cioRYR1L2V
 xxhQBNB1YbZ8Ew32kU/vUM7EIXQPNlOK7cWyLp3DWMTMeyfVVG27EkllUyUJAumYAj8v8VBLfV+
 jkl8MmiDMIFkc4JuhAiGiv5D9+jHayg3ULM3C0hIzPrnLsz78oED/XsjZ/xNq6YLTDDdsiFd4hO
 Lxv4ngPUJXE3UQTyJTwIQV9RR/EOV4Aal/AgQsFPrWMHYH9n9V48MF5/Z6fznPHVCbdSTp5cHBu
 Y6/rP1LGlaD+vLOqCpn5d5lCdWXBIF1cqYdkooVYATId0S7ypaL27tNrSv5hH5QL9t/fpjZAfk/
 YL7Po2frOW7NxOzP6mlcaORBRUuHPYlkp9HwJQ4Bz9rs934T2mG26MJ3Mifs0EdgKKOg/q0yI0C
 5scq6w2gLDkPb6lcruzF5e3Yw6oxw4/5dGHLZ5j8NYGPTrhpkChuS+lnLQYy+U5HU12aFtwfpeS
 b4DvQd93xIsb24cNw8MNM/ONrsM5JTRNORYxvzIHu5T2MoNvOwLq1fQ7pCD0vzjmjUnIFxSex/0
 3xIemiAv0G7ikiz2yqeGNK0o0oz9jp6b3xYV94QNwiO9auaY8aRdDliU6WxCfZqxIbupU9S4H0c
 RDLF+IzZt/HuJleXojA3O67zIf1zkOpIfvnpZ2DgtHA8CRiTNrTcdnVtG66GwnJNNi3g==
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


