Return-Path: <linux-gpio+bounces-9264-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CABC396261F
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 13:32:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89733282756
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 11:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AC6B17798F;
	Wed, 28 Aug 2024 11:31:33 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7C1176AA0;
	Wed, 28 Aug 2024 11:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724844693; cv=none; b=OruG990dxM26Ed14NYa8wiWgTFDLjk2yX95FPTItIMmLnSftf44MNlZwHamupjHaTShPECCHaISbvzmtadGH8ThZCh9OITh1LM38yNisTLwV9Wp8dGOXvRvdU7MkD7kkNU7EiFiA0iDDZb46QOs3QAktUW6pwHOPnvGFH5lk2TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724844693; c=relaxed/simple;
	bh=gWmuyPDq21pf5ffpnoMsUraKHy3KBjlrnMFcvKOQvaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CiQs/WADXQmLUq9RBu1H7cGEGP1fSQLboRpH1sN0m93sH+uNesmON4z9c42UoOL0Qn8vVB+U9uEpxGdKablm2H0XR2VhDL47cqNOkTHoN5KGJUKA59Rw2AwTjb1zA8eH5JhHL5kt1oCJ2+zD8wIO1JlEYZdrbT0mho6hRqHMxJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 28 Aug 2024 11:30:26 +0000
Subject: [PATCH v3 4/4] riscv: dts: spacemit: add pinctrl property to uart0
 in BPI-F3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240828-02-k1-pinctrl-v3-4-1fed6a22be98@gentoo.org>
References: <20240828-02-k1-pinctrl-v3-0-1fed6a22be98@gentoo.org>
In-Reply-To: <20240828-02-k1-pinctrl-v3-0-1fed6a22be98@gentoo.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=866; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=gWmuyPDq21pf5ffpnoMsUraKHy3KBjlrnMFcvKOQvaI=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmzwp+dNwsze5x6kE2drkUS3CYIhx7W9r0YYHWh
 qujNIb5U1aJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZs8Kfl8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277RHED/9AUoLSvz1XUzdUzJ
 TV5XF6y+RiHjT6Ve92uIaXPUOjhjDSbVWmi9v3hi5ZmDpB760wH7S+5x6BuwUg42fQk+VwbHX43
 OpklJnMTWxGH9oplyUxy4i/mT/5cXqm3GSzmNDCuvmswryhiuN9Hq4R44Xy8In+k8gzE6uX5UCS
 /Wk/YyHNYDcnj92fdaivdsh6nQKDPVHY+CUzL96B3m63YzRW3C58p/jwu1Sv43GKBM6LF3fd8E9
 sJTkBomP6EwPh1Jq8ieynq1crp52uDB72L1jCMuifwoO8ECiTvTviWHW/KHxdsw6AsjVly4zOJp
 ET7e8JVyb42WtAHYrRsBPcirMbvw3BT0ZE6Bfeb8/Jx4PwsPD+jbFfR3QvzeGWpZKiLHixvBKVq
 W2kz0gDPQTOtt+GUtdwJEyOZdlgBEshiq2dvAe3wMIFj82D0u99WLr9O4PYBdtWmCTc+Wfmu3f+
 erZ8B8oOuxX1RcpIBXYjjiCMN4+JELm6d5EbQ7/vq4b4SE7AvAzDu88zMAzi6auUHt6RNh6xyBs
 4EdCdSIVcMyMpSSes5kdppXVN10P6XnjEjkH4YOdl72DD16Ue8UwzrPeBE3kzJG/jmOXuTNXAl1
 w7Tsj8GrVgWveJjhvnK4Z9UYf+kvk0xOeJYzDF8r+LETWCe2JkYrrUPmTNcFVgZXuoDQ==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Before pinctrl driver implemented, the uart0 controller reply on
bootloader for setting correct pin mux and configurations.

Now, let's add pinctrl property to uart0 of Bananapi-F3 board.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 023274189b492..bc88d4de25a62 100644
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

-- 
2.45.2


