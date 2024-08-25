Return-Path: <linux-gpio+bounces-9129-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9D095E38A
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Aug 2024 15:11:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 506DA1F219A3
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Aug 2024 13:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B5BF170A11;
	Sun, 25 Aug 2024 13:10:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB37155320;
	Sun, 25 Aug 2024 13:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724591459; cv=none; b=OjEmmJeZRPPHFUILdtAJ88LWTE5/t4gveaN8ifLGu1Fw2hvX4D9dlfPvoJpMqX+v5i01EMPFdbTpmK49XxXX0ouyekH6JWGej39B+M4kqVfmkrLNup4LzTx5NwTahTxtxJMpom2chMTwR5oFso0Ly/vjiJvMkb1lOqmGzoC959s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724591459; c=relaxed/simple;
	bh=gWmuyPDq21pf5ffpnoMsUraKHy3KBjlrnMFcvKOQvaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f9mBimt49Hmnm+o3HitLItHjzsb/MMT1SSAaZ+dX6TAmaCNvjidTN8ECHX02Em+77+jXWHn2sB1Nk8aZ7kykv1/Vmc0cDIs70WJPgH9fa7zIj+z2OoDC+BCbwdycu0AJYwDuVd2Q2qMe5vc909EdZI9+iA4WRkg6789HgRMQLTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Yixun Lan <dlan@gentoo.org>
Date: Sun, 25 Aug 2024 13:10:05 +0000
Subject: [PATCH v2 4/4] riscv: dts: spacemit: add pinctrl property to uart0
 in BPI-F3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240825-02-k1-pinctrl-v2-4-ddd38a345d12@gentoo.org>
References: <20240825-02-k1-pinctrl-v2-0-ddd38a345d12@gentoo.org>
In-Reply-To: <20240825-02-k1-pinctrl-v2-0-ddd38a345d12@gentoo.org>
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
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmyy1LY7BfomQ4OaNo/voQ9Uklrc1sU+g8YPp7i
 t8Aa4Di2rqJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZsstS18UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277TMgD/4hf3LdOS3W3E1dPh
 5VIydrMUw5A9R0j2+vRxifJAy5ZN+SqDZ55uHUBXL270EUslItPMAaCbs/lamBSlVjPUxCClk6v
 CbsOO57HSArNuFRcnfcQMugpaF1jOSsLlxCdVU7zpCohXrmCKquJZ5UOGkXtuu14EvbgloSS77b
 Rmrs4TtjVyso6keTSrKzX/nYljSyZwBd2N1DxAKSDhmnXqLcZPqsyPwY9EsFmwq5Pzk6PsnU4gu
 fXgLsKYrmnu+Znw6LrnyXh4ckBHwaRbYNj42zBCk0i/H2dle1IwDMFX+/Z3ge+VDautH1FQjUb8
 ZbiZKbsrxGR2opytNN8eAskJpxSiIvERSvidcFmUfaHwr0UN3locGSH7fe08GWGD/yQn3Dj7xXN
 6uHq9ItCxHC3RSK2dE0mzfJY4uEtSIPaBXUgfvCYdAUExHyEJhVZH6jEW6EiCGtmm0wB0oH/JJ+
 1cK5cSIaGgGage1JIhv9RHERZa11SZbpxzl3GJkFBuoDHR3ELyLXSuL/0oK2Q2vtqJsTzi+AXYz
 AVrwwZIWspQVKetlEJRwb4igPRvVT95bHKK8SSbKnekQNmOy5hEuAcLiffSl6iEZGc/eip3F0Cu
 d6N4hCnXaE/7eXskalOq1AKELg3GUiGR5+u8Ap+Zvs8Eqz/0hZrdl69wQAh6E2keG8Kg==
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


