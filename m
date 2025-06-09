Return-Path: <linux-gpio+bounces-21108-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A10AD16BC
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jun 2025 04:13:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2345167FE8
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jun 2025 02:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F18419ABD8;
	Mon,  9 Jun 2025 02:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LPohAdal"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4556214A4E0;
	Mon,  9 Jun 2025 02:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749435200; cv=none; b=L0zuNQieauc4HZaRsH2PUxG92jWb6T1AaYcn7WdBbiECss/3CAEAYL6rf7pf0I+6TIwz5DgmUVkZBF8moPj2XMkHIyou2rM9h4qfz394xx+dmjg5ZdPRLnP9kKggCT2uVMHOj4L0KWNfGMZ++d94cNwBr1Y1rMiRk2/vFXmy2fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749435200; c=relaxed/simple;
	bh=0rpEzz/v1CfVYba26K16aMDV31aQNWIxOKlLp+nm/uY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E9i4LclvAf1hnEjxlPLIL3gati6x6olKaIe6x7bzDr10a+tTU93pf+zZpGZHnMPXQ2wuLvNtVxbm9ML5XGsXDVCqZalspEW8svy1/HTXDsVYOrYhXu7eurzSOpnx+hCFc7wexcp3ESTAYh7DsftxhpIaCjyVkBB6Le4H5gNNofg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LPohAdal; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE222C4CEF4;
	Mon,  9 Jun 2025 02:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749435199;
	bh=0rpEzz/v1CfVYba26K16aMDV31aQNWIxOKlLp+nm/uY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LPohAdalPaGBwMWUFw22h+DlSHi8kQVN5Wk/KWdR+7tKUKP++9ebspkQ2ekU+Jm6T
	 LAMIGzcsn+EcF7lEE6skIMrLzhatJmsmZMChuwVvUYe8r6LlNlAxMup5cBW/PwsRTU
	 K08faOvKGTNO2bhpMdsCiqJxyhsrKVMc33P9ylsKBlfGo/V2o6a+QusL8/xZ7kOkcG
	 uWZXPQoy7+FrhlSFSCFjxZSgz+rzj8lJcTR0GDi+8GNvSvOA5bQLregkElj4x1DINe
	 //uFqtAxYmuaIHrtBsYpFcvZ7JOjSCxubCXYVBQXqNJrAuA7SRXqOVonc5Yj/NQYVv
	 7Fv9sMDZp/pLQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1606C61CE7;
	Mon,  9 Jun 2025 02:13:19 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sun, 08 Jun 2025 21:13:15 -0500
Subject: [PATCH v2 3/3] arm64: tegra: Add Tegra186 pin controllers
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250608-tegra186-pinctrl-v2-3-502d41f3eedd@gmail.com>
References: <20250608-tegra186-pinctrl-v2-0-502d41f3eedd@gmail.com>
In-Reply-To: <20250608-tegra186-pinctrl-v2-0-502d41f3eedd@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749435198; l=1340;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=1JAwIG9i/gx1bp4uk2zCtsxyPH2y6m8LXFiEHc/zVnU=;
 b=Fb4k7zdnYSXGic/5FkRBWBZQfZRDhktanmDvTe8y9oceFS5gvfM9V152csEoqB1bcrrE/zgGP
 X4cl6Un/Nq7DaCGe53Y95p0i7t1QNGLEvF75UZt5RolfRpZMIXbyQlj
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
index 5778c93af3e6e72f5f14a9fcee1e7abf80d2d2c5..66fdcec17073a0954b3bf600588324e4c047d0bf 100644
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
@@ -1274,10 +1280,16 @@ gpio_aon: gpio@c2f0000 {
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
2.49.0



