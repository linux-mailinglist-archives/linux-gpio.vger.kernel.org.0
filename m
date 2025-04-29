Return-Path: <linux-gpio+bounces-19484-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18681AA397D
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 23:34:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9ACD9A72C2
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 21:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51BB42741B4;
	Tue, 29 Apr 2025 21:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dPAIY7fK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E3226988C;
	Tue, 29 Apr 2025 21:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745962428; cv=none; b=SRD1VvOGR6wD1po35+ulaREc1LHslcUluSzQO11+J7Z3jxZl2D1PgCP4jCMWjFgB9NfrpTh/3l1nCWGkQptHMAEu8xwN5yl0kFeDAVO1PYSlqDzsO18OysNkVuLQ2pDHe0H9u+I6mAFNJNP986J6eyPnVe3CSc8rFV/kE1nVebE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745962428; c=relaxed/simple;
	bh=XLawiZSXPo98FH4XDvhI8c6FZC3Krxw6e6hl73tNG2g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XKdkwixCjw70yaasfPcQ6m3EO3e9ol1zAdfsX/EJa3xhXFTcj61B0BtI4t73ayQPqM2jyrixCkbTez18Mp6+/91NoIJUyUx8RzJtB2a93slcshLqYxK2VE6ISkS6E5gejM9s68CnBHoCt18PlwHOoDsTg0eQxSAFR1DnwMfl1qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dPAIY7fK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 87BCDC4CEEE;
	Tue, 29 Apr 2025 21:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745962427;
	bh=XLawiZSXPo98FH4XDvhI8c6FZC3Krxw6e6hl73tNG2g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dPAIY7fKukFwxqTyPJVm9IizvHsGdiYZ2QkSpkdOP1i5UI1Z4W87FVcweP1l6tL1/
	 fWR63BnL0PC6BZQeHbr0L9wFKDvVYcwZ6eX/k7hK3gGzXYzpnf9FENFu/+VbmzNFHt
	 NetSjEXFT1PMLyEnMYO8FQ+Y+9YVPdaKnUnFn9tkP2yJGL61O2+GU90kdQJEd67OKW
	 b5RNZDQI/l3/E8b7GjTtn+nL80EoOAByq+vBa3LW56kFX161gQFaWY56Sm547NfUHT
	 HLnFX0vbW220t4P6ziT5a9PqPbIlNcCL788leR2ZH6dQgYv3eR2z3GGjlqCarWF8Bb
	 VBTSPRKZH1yhA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E41DC3ABAA;
	Tue, 29 Apr 2025 21:33:47 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Tue, 29 Apr 2025 16:33:33 -0500
Subject: [PATCH 4/4] arm64: tegra: Add Tegra186 pin controllers
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-tegra186-pinctrl-v1-4-722c7c42394e@gmail.com>
References: <20250429-tegra186-pinctrl-v1-0-722c7c42394e@gmail.com>
In-Reply-To: <20250429-tegra186-pinctrl-v1-0-722c7c42394e@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745962426; l=1340;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=nlBNe2tmaWa/9hjMpL12OUQ3+yLCwSi7g9iNZUe7fx0=;
 b=PHL9o8X4kHc29B9os6pRSftB7NaZVGlgAwJuzza09Hgm8RUkBw/gVAFXOneY0Wf464twm7ADu
 t0sq/QfFL05D93yKmq1qEJgHdHTFEg+uajuCZxr7jmIyD4WRkjHsIWK
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

Add the device tree nodes for the MAIN and AON pin controllers found on
the Tegra186 family of SoCs.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 2b3bb5d0af17bd521f87db0484fcbe943dd1a797..576a4d8e0f9dbe4ef43f60b9222c1c03f7440aab 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -36,6 +36,12 @@ gpio: gpio@2200000 {
 		interrupt-controller;
 		#gpio-cells = <2>;
 		gpio-controller;
+		gpio-ranges = <&pinmux 0 0 140>;
+	};
+
+	pinmux: pinmux@2430000 {
+		compatible = "nvidia,tegra186-pinmux";
+		reg = <0x0 0x2430000 0x0 0x15000>;
 	};
 
 	ethernet@2490000 {
@@ -1272,10 +1278,16 @@ gpio_aon: gpio@c2f0000 {
 		interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
 		gpio-controller;
 		#gpio-cells = <2>;
+		gpio-ranges = <&pinmux_aon 0 0 47>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 	};
 
+	pinmux_aon: pinmux@c300000 {
+		compatible = "nvidia,tegra186-pinmux-aon";
+		reg = <0x0 0xc300000 0x0 0x4000>;
+	};
+
 	pwm4: pwm@c340000 {
 		compatible = "nvidia,tegra186-pwm";
 		reg = <0x0 0xc340000 0x0 0x10000>;

-- 
2.48.1



