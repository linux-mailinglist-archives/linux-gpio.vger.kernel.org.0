Return-Path: <linux-gpio+bounces-6154-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E1B8BD139
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 17:11:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FC06285840
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 15:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 227D515623D;
	Mon,  6 May 2024 15:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tkJxPXQ7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0591553A1;
	Mon,  6 May 2024 15:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715008215; cv=none; b=G6OdAicANh6mwJXKKpOAMRba3VioAGbuCXsppMcJJLy73vbsRYaoz+YLGiebvYkqdsNaZPyeFkXPXEvElx6AQL0B6i0BEQlcKoadxqrLBizPm8yottO+3/OOZl3Rb6qpmEaO7UrMrhItj8X3q5kfLCyNlU+dGrWoMeiZDj8rVBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715008215; c=relaxed/simple;
	bh=1Ss/oHL8DEJVMJndnNCdr7e+QS596xFOusjHOLUImeU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dsocq93Xpimm9pwbXbcv+leFFamDuW+L0HSkT3Ff54xUWjk+4jBGCFf5ATE3I19z4BKyg9wYPJLBIOXh3ywAlUZ8OpMpT6wT2KM204UZxRfggBln1Bg92KBHOzP7u3dpZne8d7rXDl7rQu9TtzfLL5VEuzofzPBhz817HgFboXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tkJxPXQ7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47245C4DDE6;
	Mon,  6 May 2024 15:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715008215;
	bh=1Ss/oHL8DEJVMJndnNCdr7e+QS596xFOusjHOLUImeU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tkJxPXQ7t7k2y/coMRTsM8D8WGEMYlVFz4H5Lb6MAqLUuiDDKdSghPYvEer6IndfJ
	 egGqcsFqyKcIO8kwWpoBwYK2NM65lqJcVEQRIBwSQI8bjySwdiVH49+ROEW6YiXGYa
	 tBBQeIttkzFmQQkAT5+FkqOonOfHXC+YZFtxXSv6xRIHx4XY1UvYMcW5o1RDe5yHZX
	 WAlsRh7V8W00zQxyJzuxRcvfmzws+gnILPwsXrEBg+z7QU20L888i8jZblMDKEh2ng
	 rxhxyVixM7PJCK0b9rQS+mvWC/yz5zZ8CLu0e0+dnUHAmMy6TE8ON/O6c3S0VxcPVT
	 Zo9MgFOGj44VQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1s3zyq-000000006Cg-3uHl;
	Mon, 06 May 2024 17:10:16 +0200
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
	Satya Priya <quic_c_skakit@quicinc.com>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 13/13] arm64: dts: qcom: sc8280xp-x13s: enable pm8008 camera pmic
Date: Mon,  6 May 2024 17:08:30 +0200
Message-ID: <20240506150830.23709-14-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240506150830.23709-1-johan+linaro@kernel.org>
References: <20240506150830.23709-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the PM8008 PMIC which is used to power the camera sensors.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 123 ++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 98c1b75513be..78d85e722ab1 100644
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
+		vdd_l1_l2-supply = <&vreg_s11b>;
+		vdd_l3_l4-supply = <&vreg_bob>;
+		vdd_l5-supply = <&vreg_bob>;
+		vdd_l6-supply = <&vreg_bob>;
+		vdd_l7-supply = <&vreg_bob>;
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
2.43.2


