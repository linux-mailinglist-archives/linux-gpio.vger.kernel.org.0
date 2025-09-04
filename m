Return-Path: <linux-gpio+bounces-25552-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C04B42EE9
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 03:36:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E90477C3A05
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 01:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C66811D416C;
	Thu,  4 Sep 2025 01:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="kDMRmnAG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C0C45C14;
	Thu,  4 Sep 2025 01:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756949764; cv=none; b=krrST8ldnDPaXCz+sOGJWq5/nsEk4TLIrrGoBvQy4elD3Kz96Qj9v4IO7pPrsPj3q56vsL/wRYL14HiL0+AEUA/oTGJuuXzWjRJqmZ8ppQuQIyzKcfko0mKjg84zTynl9QHREKw8LFtkLzIW4t6259vz5JkCEfzRFwwaFr+ilSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756949764; c=relaxed/simple;
	bh=a8o4b3tMejy/+MT4DEmKQJ23MursAw7b6fZuTyxH8Sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ryhfyTVrCDpSii3WOyEMDL1pqbAshEcNXjqGF0W71yhtQqhPSH8pPbScn8hAQNAKbbFnBpZvqH8lIFI4jwKz7ETH40HeA6tyHjKYVJt83g+wlKZv7MvILCdZaT1FJJcrquHuxciP3S9pqrZLCc2QmLL27DQKBjqXyGdTtMi2BTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=kDMRmnAG; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0269220B30;
	Thu,  4 Sep 2025 03:36:02 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S-0FPCjmDf_B; Thu,  4 Sep 2025 03:36:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1756949761; bh=a8o4b3tMejy/+MT4DEmKQJ23MursAw7b6fZuTyxH8Sc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kDMRmnAGHv02R7Isy7sEK8dDSWQVyXWqL1DD5NFFOccd0GvmT5n55IFYB0RlP5KOf
	 Praz21F4R4+0NAmC+/7s/dSu51ryn++mfaJjHMASv6c1NRz1btMylP/UpLsMislDF9
	 8zsFnrDnWmpis3J7IFxj7yBGfIYjxqYeaCOyN7928J+cdzBe00f2RJCugPEUTrANxU
	 OYNtrD9japlcblgGKlBtR76sC23/s39u9uwxB5siAd635rGFh2zEdlkFcwiWADO/nL
	 33cDiHrWvcU+QG3pFVr+8XZcpgAgVTsWZgBGGWC+QA3tOMkqOTbqKLgpOdZIXKgmI6
	 i5c27r0AaztAA==
From: Yao Zi <ziyao@disroot.org>
To: Yinbo Zhu <zhuyinbo@loongson.cn>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH v3 3/3] LoongArch: dts: Add GPIO controller for Loongson-2K0300
Date: Thu,  4 Sep 2025 01:34:38 +0000
Message-ID: <20250904013438.2405-4-ziyao@disroot.org>
In-Reply-To: <20250904013438.2405-1-ziyao@disroot.org>
References: <20250904013438.2405-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe Loongson-2K0300's GPIO controller in devicetree.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 arch/loongarch/boot/dts/loongson-2k0300.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/loongarch/boot/dts/loongson-2k0300.dtsi b/arch/loongarch/boot/dts/loongson-2k0300.dtsi
index 835d3c63537b..60a055b05c44 100644
--- a/arch/loongarch/boot/dts/loongson-2k0300.dtsi
+++ b/arch/loongarch/boot/dts/loongson-2k0300.dtsi
@@ -240,6 +240,26 @@ uart9: serial@16102400 {
 			status = "disabled";
 		};
 
+		gpio: gpio@16104000 {
+			compatible = "loongson,ls2k0300-gpio";
+			reg = <0x0 0x16104000 0x0 0x4000>;
+			interrupt-parent = <&liointc1>;
+			interrupts = <21 IRQ_TYPE_LEVEL_HIGH>,
+				     <22 IRQ_TYPE_LEVEL_HIGH>,
+				     <23 IRQ_TYPE_LEVEL_HIGH>,
+				     <24 IRQ_TYPE_LEVEL_HIGH>,
+				     <25 IRQ_TYPE_LEVEL_HIGH>,
+				     <26 IRQ_TYPE_LEVEL_HIGH>,
+				     <27 IRQ_TYPE_LEVEL_HIGH>;
+			ngpios = <106>;
+			gpio-controller;
+			gpio-ranges = <&pinctrl 0 0 106>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			resets = <&rst RST_GPIO>;
+		};
+
 		isa@16400000 {
 			compatible = "isa";
 			#address-cells = <2>;
-- 
2.50.1


