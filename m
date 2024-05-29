Return-Path: <linux-gpio+bounces-6882-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B19FC8D3CD3
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 18:35:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E29261C24974
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 16:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0764A1CB31F;
	Wed, 29 May 2024 16:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eM8qB6El"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0A61C9EAD;
	Wed, 29 May 2024 16:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717000236; cv=none; b=FH5TqmmQI3oMb1mbIZ8wh4hxnftENw1FGldUuMnQiWHKBoFg0QVtrTK9vKom+Cu9bXhmfY9EwHZlS37S8jX0NZK0Y6ESwqf41Wzze56lEMy+mL72Z6ELC/aTCu+FTGhK7fMZ//INainSgakpxZ2YjdjTIeV2eJujdT0b8LkmEXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717000236; c=relaxed/simple;
	bh=S6aeLtZ42VmRPSWmwBSU9jwSLOYm/1m5zx2/rVNYkTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GVvHCMPiCubk23qtGhy138xDP4UvM7sbOFNeZi7GNSpXJOL94o9hJYAlMzxq3ynuNY8WnlC8RTzBKoXXcmDQSJf/vKkaNQgnDnaJ6HsyAxMCyWyZ01nXdtok4zPfmlkQ1MvfZNKS8n5nAxx6CpxPswOfzkNx8uCa1DzjQVU3bIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eM8qB6El; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79D25C116B1;
	Wed, 29 May 2024 16:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717000236;
	bh=S6aeLtZ42VmRPSWmwBSU9jwSLOYm/1m5zx2/rVNYkTQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eM8qB6ElvIIDWQkOLsl3ARiA5/b7a62/sr6Zioe7lvAiQImQeuiVPxI2VMN2vPq3e
	 r/o6mGoyOexMHyhkAK+QL1wDPVAKcFh3n1l1QcCGbYLyijE5WNi0k77NaT1W5BmhRf
	 QIr+cI9af7q2zfLrH1w7Vk4NJwILsO519a2Gqk+7lri5LgcFyiY5qq+XHY9qODlFoi
	 Gcf+I0OIF7oYdY0FSnXStwhn9suzle1RsXk6vfFI2nHlrTbMUzlqEGi+x3TfSzZt5X
	 /zpmxTHpmS11juaAgfAdOxIxUGnwpcixO7inolXdxwJZITPoyD/fod8PNCKIniyYPG
	 C1iONtL5R9Llg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sCMCC-000000004jH-1qP2;
	Wed, 29 May 2024 18:30:36 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 14/14] arm64: dts: qcom: sc8280xp-x13s: enable pm8008 camera pmic
Date: Wed, 29 May 2024 18:29:58 +0200
Message-ID: <20240529162958.18081-15-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240529162958.18081-1-johan+linaro@kernel.org>
References: <20240529162958.18081-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the PM8008 PMIC which is used to power the camera sensors.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 123 ++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 98c1b75513be..93a44f803e8d 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -295,6 +295,27 @@ linux,cma {
 	};
 
 	thermal-zones {
+		pm8008-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&pm8008>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
 		skin-temp-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <0>;
@@ -669,6 +690,85 @@ touchscreen@10 {
 	};
 };
 
+&i2c11 {
+	clock-frequency = <400000>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c11_default>;
+
+	status = "okay";
+
+	pm8008: pmic@c {
+		compatible = "qcom,pm8008";
+		reg = <0xc>;
+
+		interrupts-extended = <&tlmm 41 IRQ_TYPE_EDGE_RISING>;
+		reset-gpios = <&tlmm 42 GPIO_ACTIVE_LOW>;
+
+		vdd-l1-l2-supply = <&vreg_s11b>;
+		vdd-l3-l4-supply = <&vreg_bob>;
+		vdd-l5-supply = <&vreg_bob>;
+		vdd-l6-supply = <&vreg_bob>;
+		vdd-l7-supply = <&vreg_bob>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pm8008_default>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-ranges = <&pm8008 0 0 2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		#thermal-sensor-cells = <0>;
+
+		regulators {
+			vreg_l1q: ldo1 {
+				regulator-name = "vreg_l1q";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+			};
+
+			vreg_l2q: ldo2 {
+				regulator-name = "vreg_l2q";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+			};
+
+			vreg_l3q: ldo3 {
+				regulator-name = "vreg_l3q";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+
+			vreg_l4q: ldo4 {
+				regulator-name = "vreg_l4q";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+
+			vreg_l5q: ldo5 {
+				regulator-name = "vreg_l5q";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			vreg_l6q: ldo6 {
+				regulator-name = "vreg_l6q";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			vreg_l7q: ldo7 {
+				regulator-name = "vreg_l7q";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+		};
+	};
+};
+
 &i2c21 {
 	clock-frequency = <400000>;
 
@@ -1367,6 +1467,13 @@ i2c4_default: i2c4-default-state {
 		bias-disable;
 	};
 
+	i2c11_default: i2c11-default-state {
+		pins = "gpio18", "gpio19";
+		function = "qup11";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
 	i2c21_default: i2c21-default-state {
 		pins = "gpio81", "gpio82";
 		function = "qup21";
@@ -1470,6 +1577,22 @@ wake-n-pins {
 		};
 	};
 
+	pm8008_default: pm8008-default-state {
+		int-pins {
+			pins = "gpio41";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		reset-n-pins {
+			pins = "gpio42";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	spkr_1_sd_n_default: spkr-1-sd-n-default-state {
 		perst-n-pins {
 			pins = "gpio178";
-- 
2.44.1


