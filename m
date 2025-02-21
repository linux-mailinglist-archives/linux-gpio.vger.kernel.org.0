Return-Path: <linux-gpio+bounces-16351-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 826A5A3EFBF
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 10:15:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 870A37A8D82
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 09:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EA5A202F99;
	Fri, 21 Feb 2025 09:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iT8H/NJ9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E9F1E9B21;
	Fri, 21 Feb 2025 09:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740129298; cv=none; b=XfBrRdRoZIiP5c7u0HbPsWa8c1D/JTsWTZRXGaYsvo2Z2SGk26tw8ogKjYVAvjGRDiT+l9iGezWaP1Or51EMJ4yAJg+j2b5Xw3Rz1prYxAVRkxLNda3m3KcDEDyrD+ymf6FUbgjV28lT8PMxC/aKCEuPD611nEAULbH0FQWKvzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740129298; c=relaxed/simple;
	bh=FPSnej4gRORvz9fIoO0ZHKVoxlk58vTwK5PRU598Dfk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Uzm1fpBeFmu4MswTMeLXXS/mMpBXtG0DMyxHRso7ftBh4WtNcOiy3syLwQbmc4CORORE1oYVleoUY84P3azMh0VeKwp1gtUIsRFQzS5b5zq8I9ZQ07+XuvzFz46Me2dtiqZTFBdMbFoaVZuRgvhgvchCXzZznDqIZJoQ1MexEGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iT8H/NJ9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4E32C4CEE7;
	Fri, 21 Feb 2025 09:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740129297;
	bh=FPSnej4gRORvz9fIoO0ZHKVoxlk58vTwK5PRU598Dfk=;
	h=From:To:Cc:Subject:Date:From;
	b=iT8H/NJ9b3Nb0+G0ar4ucq4X7ucegkJRj4HYn1Urba6EsbH0WMjy/Ivi1CXS1IoyE
	 /wumnkPZYHrIDSfMbfw3e/AHfFwh3Fk87Tvhg2/CGEkQVqy03Be90x6ObhnxiBbLeF
	 V1qASkjq2K8SqczFy3H1vwxp2iKN6Ax96ikLus0a3LbvDFPo6GRQOtPDzf+OJlo1oJ
	 mYhic2hQlq1YPJOdkpdLySZfeIVeOf3TiTEe3JZC/SPnX+ffz8ufV2K5nEr83sSaT/
	 UTeQJBSbAemajlSfDYgQMWOMyD5J7/8Wb35dYDOJ36RLSNmHdVl0i1Vr/WyFzUXp/0
	 O3RAiCLqSdcKw==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jared McArthur <j-mcarthur@ti.com>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH 1/2] arm64: dts: ti: k3-am62p: fix pinctrl settings
Date: Fri, 21 Feb 2025 10:14:46 +0100
Message-Id: <20250221091447.595199-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It appears that pinctrl-single is misused on this SoC to control both
the mux and the input and output and bias settings. This results in
non-working pinctrl configurations for GPIOs within the device tree.

This is what happens:
 (1) During startup the pinctrl settings are applied according to the
     device tree. I.e. the pin is configured as output and with
     pull-ups enabled.
 (2) During startup a device driver requests a GPIO.
 (3) pinctrl-single is applying the default GPIO setting according to
     the pinctrl-single,gpio-range property.

This would work as expected if the pinctrl-single is only controlling
the function mux, but it also controls the input/output buffer enable,
the pull-up and pull-down settings etc (pinctrl-single,function-mask
covers the entire pad setting instead of just the mux field).

Remove the pinctrl-single,gpio-range property, so that no settings are
applied during a gpio_request() call.

Fixes: d72d73a44c3c ("arm64: dts: ti: k3-am62p: Add gpio-ranges properties")
Signed-off-by: Michael Walle <mwalle@kernel.org>
---

Maybe one could also switch the pinctrl-single to a pinconf-single node
which is able to control all the bias settings and restrict
"pinctrl-single,function-mask" to just the actual function. Not
sure.

 .../boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi     |  8 --------
 arch/arm64/boot/dts/ti/k3-am62p-main.dtsi          | 14 --------------
 2 files changed, 22 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
index b33aff0d65c9..bd6a00d13aea 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
@@ -12,15 +12,7 @@ mcu_pmx0: pinctrl@4084000 {
 		#pinctrl-cells = <1>;
 		pinctrl-single,register-width = <32>;
 		pinctrl-single,function-mask = <0xffffffff>;
-		pinctrl-single,gpio-range =
-			<&mcu_pmx_range 0 21 PIN_GPIO_RANGE_IOPAD>,
-			<&mcu_pmx_range 23 1 PIN_GPIO_RANGE_IOPAD>,
-			<&mcu_pmx_range 32 2 PIN_GPIO_RANGE_IOPAD>;
 		bootph-all;
-
-		mcu_pmx_range: gpio-range {
-			#pinctrl-single,gpio-range-cells = <3>;
-		};
 	};
 
 	mcu_esm: esm@4100000 {
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
index 420c77c8e9e5..0a888392137c 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
@@ -42,20 +42,6 @@ &inta_main_dmss {
 	ti,interrupt-ranges = <5 69 35>;
 };
 
-&main_pmx0 {
-	pinctrl-single,gpio-range =
-		<&main_pmx0_range 0 32 PIN_GPIO_RANGE_IOPAD>,
-		<&main_pmx0_range 33 38 PIN_GPIO_RANGE_IOPAD>,
-		<&main_pmx0_range 72 22 PIN_GPIO_RANGE_IOPAD>,
-		<&main_pmx0_range 137 5 PIN_GPIO_RANGE_IOPAD>,
-		<&main_pmx0_range 143 3 PIN_GPIO_RANGE_IOPAD>,
-		<&main_pmx0_range 149 2 PIN_GPIO_RANGE_IOPAD>;
-
-	main_pmx0_range: gpio-range {
-		#pinctrl-single,gpio-range-cells = <3>;
-	};
-};
-
 &main_gpio0 {
 	gpio-ranges = <&main_pmx0 0 0 32>, <&main_pmx0 32 33 38>,
 			<&main_pmx0 70 72 22>;
-- 
2.39.5


