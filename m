Return-Path: <linux-gpio+bounces-26124-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CE0B56B60
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Sep 2025 20:52:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 751713BA457
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Sep 2025 18:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D22E62DA776;
	Sun, 14 Sep 2025 18:52:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from bisque.elm.relay.mailchannels.net (bisque.elm.relay.mailchannels.net [23.83.212.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DC061FCE;
	Sun, 14 Sep 2025 18:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.212.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757875920; cv=pass; b=PbVFnt0RS9hwPryB11hLuzVjwReWv0iAeheBvy2fhlqdLzIERTlBJxr1DGRCtzntRTzyi33vKF3keVzWMJzrbLYWCKgJ1F3LfEXHRPc5tkr28dJI0aKEQ2kfPd+YbWBa0EMcoLmBoEaZLOxsHdurafotSUyuDoPY8RQ3qEsYIn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757875920; c=relaxed/simple;
	bh=sFkPL5D4c1hjteIm6JdYyjczgjR0F7f60gG0jHK0aV4=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=Kcv1IVooyIin4lZICWgh+Azjc8rOCB7DMHRLtVhkAKTdUFo6SH2heCofNVg2//M618QJxzqKK/iCWqrfqg1CIwWQvlPUglMgpYJUJu7KWtl6kuwx4QC8l4gf/9+7eFCFoJsAPz8eF03oQY4Dpswn9iQCsN2uchmh7mSohv/NPWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; arc=pass smtp.client-ip=23.83.212.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id EC79D94164F;
	Sun, 14 Sep 2025 18:34:51 +0000 (UTC)
Received: from uk-fast-smtpout10.hostinger.io (100-107-4-38.trex-nlb.outbound.svc.cluster.local [100.107.4.38])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id E9E109410B0;
	Sun, 14 Sep 2025 18:34:48 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1757874891; a=rsa-sha256;
	cv=none;
	b=TWkZLemTKfu1ng3g6Ixu0QrMia8FmgNzCKDgtOD2Yif2kKmpGNNFw8yUHkB4UfATSMMqFW
	ACVETXsuTifz28wkTiikRTAuqWXtsJiKzjdBmPfP5g9ntiFBdJr+M6E0jxYVFIeh8Bo/hM
	XtA9E5Ezis2Hjq5cd2cXp0sk2H0ggT8m+kqJCWqTOw7rW7BJfx4KXdRs8MWdxqmI1pHHvn
	MWwMZoRTvdcyTRjFCZrGl9YBx8dhmJ7k5i0n7EQcGaadQjP8oPTnKjxkAVU+PeQMpEoA7O
	LHnqiXgFu85QsQ4dqOFO9MGVqm3ig1QoChjDq0WRIHlgwh48RWey8Wd1CibNAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1757874891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ffgbElzgSMrOiH9y0+JGZC9YZyDCWdKMbfQBC82F8DA=;
	b=4icaK5Mwl2NtD/+FBT1eqLjE/oCdfVU2TFePF5QAXBdWq/W7rLW9wv3SxDIilyrfM0Dd97
	vGLbgtYPyGCAWBFeEvzDmyLgN90kdXAcNnfCwqVUY6lgUwj5lYvi0ScC2z1yijFCukheoe
	JS9/cCpicf8uTiuC1J+8fgd4F2W33CFbY3Xz6v0FZ7K1tEWsIthzAXrmQiuv8v4UqyuKtw
	cl6c2SYQmpERoYN2M45jSYFsYD+8H7jGi/deSQGri4fBCMnJRRD9D8+8iU15KANN3LTSWo
	rd0lwr0RuoC2s5IEiJy2kqjEOwye0yvprqKyCwqsokk/jtN/tmfY3J5nPW+Pbw==
ARC-Authentication-Results: i=1;
	rspamd-54bcd779b6-2b7fv;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MC-Copy: stored-urls
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Robust-Whimsical: 5cbb84bd5ed87d49_1757874891679_629862445
X-MC-Loop-Signature: 1757874891679:1387157911
X-MC-Ingress-Time: 1757874891678
Received: from uk-fast-smtpout10.hostinger.io (uk-fast-smtpout10.hostinger.io
 [145.14.155.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.107.4.38 (trex/7.1.3);
	Sun, 14 Sep 2025 18:34:51 +0000
Received: from [172.17.0.2] (unknown [110.138.220.153])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4cPxfC3zYTzFK6mc;
	Sun, 14 Sep 2025 18:34:43 +0000 (UTC)
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH 1/6] ARM: dts: qcom: msm8960: reorder nodes and properties
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-msm8960-reorder-v1-1-84cadcd7c6e3@smankusors.com>
References: <20250915-msm8960-reorder-v1-0-84cadcd7c6e3@smankusors.com>
In-Reply-To: <20250915-msm8960-reorder-v1-0-84cadcd7c6e3@smankusors.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-gpio@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
 Max Shevchenko <wctrl@proton.me>, Rudraksha Gupta <guptarud@gmail.com>, 
 Shinjo Park <peremen@gmail.com>, 
 Antony Kurniawan Soemardi <linux@smankusors.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757874878; l=18367;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=sFkPL5D4c1hjteIm6JdYyjczgjR0F7f60gG0jHK0aV4=;
 b=KN8CCRhDkO8BsLg3Fi/s/5Rel+CQZTlY12HAHCUo+b5S78ATw26fYEtjd4ujldWEMqM2BamGU
 eIX0nq+owIzDi+87jHy3jb2V8qI6BmAOuV2/ShTRatUX03566Zw0GNn
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sun, 14 Sep 2025 18:34:43 +0000 (UTC)
X-CM-Envelope: MS4xfAsJYMF3LQl3SmszHoWbiBNQSY6opIcWkHKXAzzY12o6Yvt9H72PiFjvk0xxEM+8mazt0Ik0ouumz2/PjRK+1u18Gox3CBJIgrAotjVOUxPKZ5P7X3QP 2tcSsM30XyHBmVVio0oWQY0q3PYuTQN/FfsisAzs07LLFzw54aXYUX6MRqzgRw2Ygt3j/kY0lTu4F3kpyopBVu2CZzsn79zLmzOBV7gj5ae0WM2lA5cR7mdN jEhNV13mUtKR1DB9bGdQGBHDjsaLmsR33jLoqxfA5auBwMk2Li96mwOyhikpcVGwIxLHKeq1TTOhbI4+Q8OzkIZKsylXOCiaZptE1DFhpOTiWY6LwrUSGXhL YiBy4sfR3s7HF+SPpseviotvrKKdcnSOrMNDeIFaBRs7TvLjvqGPwcLUh78TNUGoVVjLfY78dWGVeE3l0hLVoolsKpTk5AgTiWJcOy9LJJUScnYe/fate6bH +aI50mNpeRJBDS/M/Yf/4SYU+H9oDcngJ5xaUtIXYRLYrJdWYKr3rlUdgY1ap4jqkUiQ2Hs9Oo8Alz0KIb/ZUgYHb50hC2ukiJKnZxOVNtCt8vznP394zKMU pTH/nmZ+F3mmpeyUIkJhCV9oK/AS+fYvHmFYwi+KK7NRFlD4eYqPDN7mK1A7aP6syhx2ITPfdIqvEQc0IKN7m7QInpcH1lAlnDQUhq6hE2ay6g==
X-CM-Analysis: v=2.4 cv=LvvAyWdc c=1 sm=1 tr=0 ts=68c70ac7 a=3tJJDl7MZm1GcYeSp/W8Jw==:117 a=3tJJDl7MZm1GcYeSp/W8Jw==:17 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8 a=wxLWbCv9AAAA:8 a=h3hH1uk4pShZJK_U8SsA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-AuthUser: linux@smankusors.com

Reorder the nodes in qcom-msm8960.dtsi by unit address and sort
properties, as recommended in the Devicetree style guide. This is a
cosmetic change only, with no functional impact.

Tested-by: Rudraksha Gupta <guptarud@gmail.com>
Tested-by: Shinjo Park <peremen@gmail.com>
Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 524 ++++++++++++++++---------------
 1 file changed, 267 insertions(+), 257 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index 532f16458756101b37954b5db92abec552bbc8db..9a0c87fd6d4752f7ef3d91f480c48efc55a08e74 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -15,6 +15,35 @@ / {
 	compatible = "qcom,msm8960";
 	interrupt-parent = <&intc>;
 
+	clocks {
+		cxo_board: cxo_board {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <19200000>;
+			clock-output-names = "cxo_board";
+		};
+
+		pxo_board: pxo_board {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <27000000>;
+			clock-output-names = "pxo_board";
+		};
+
+		sleep_clk: sleep_clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <32768>;
+			clock-output-names = "sleep_clk";
+		};
+	};
+
+	cpu-pmu {
+		compatible = "qcom,krait-pmu";
+		interrupts = <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
+		qcom,no-pc-write;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -22,9 +51,9 @@ cpus {
 
 		cpu@0 {
 			compatible = "qcom,krait";
+			reg = <0>;
 			enable-method = "qcom,kpss-acc-v1";
 			device_type = "cpu";
-			reg = <0>;
 			next-level-cache = <&l2>;
 			qcom,acc = <&acc0>;
 			qcom,saw = <&saw0>;
@@ -32,9 +61,9 @@ cpu@0 {
 
 		cpu@1 {
 			compatible = "qcom,krait";
+			reg = <1>;
 			enable-method = "qcom,kpss-acc-v1";
 			device_type = "cpu";
-			reg = <1>;
 			next-level-cache = <&l2>;
 			qcom,acc = <&acc1>;
 			qcom,saw = <&saw1>;
@@ -52,111 +81,27 @@ memory@80000000 {
 		reg = <0x80000000 0>;
 	};
 
-	thermal-zones {
-		cpu0-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-			thermal-sensors = <&tsens 0>;
-
-			trips {
-				cpu_alert0: trip0 {
-					temperature = <60000>;
-					hysteresis = <10000>;
-					type = "passive";
-				};
-
-				cpu_crit0: trip1 {
-					temperature = <95000>;
-					hysteresis = <10000>;
-					type = "critical";
-				};
-			};
-		};
-
-		cpu1-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-			thermal-sensors = <&tsens 1>;
-
-			trips {
-				cpu_alert1: trip0 {
-					temperature = <60000>;
-					hysteresis = <10000>;
-					type = "passive";
-				};
-
-				cpu_crit1: trip1 {
-					temperature = <95000>;
-					hysteresis = <10000>;
-					type = "critical";
-				};
-			};
-		};
-	};
-
-	cpu-pmu {
-		compatible = "qcom,krait-pmu";
-		interrupts = <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
-		qcom,no-pc-write;
-	};
-
-	clocks {
-		cxo_board: cxo_board {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <19200000>;
-			clock-output-names = "cxo_board";
-		};
-
-		pxo_board: pxo_board {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <27000000>;
-			clock-output-names = "pxo_board";
-		};
-
-		sleep_clk: sleep_clk {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <32768>;
-			clock-output-names = "sleep_clk";
-		};
-	};
-
-	/* Temporary fixed regulator */
-	vsdcc_fixed: vsdcc-regulator {
-		compatible = "regulator-fixed";
-		regulator-name = "SDCC Power";
-		regulator-min-microvolt = <2700000>;
-		regulator-max-microvolt = <2700000>;
-		regulator-always-on;
-	};
-
 	soc: soc {
+		compatible = "simple-bus";
+		ranges;
 		#address-cells = <1>;
 		#size-cells = <1>;
-		ranges;
-		compatible = "simple-bus";
 
-		intc: interrupt-controller@2000000 {
-			compatible = "qcom,msm-qgic2";
-			interrupt-controller;
-			#interrupt-cells = <3>;
-			reg = <0x02000000 0x1000>,
-			      <0x02002000 0x1000>;
+		rpm: rpm@108000 {
+			compatible = "qcom,rpm-msm8960";
+			reg = <0x108000 0x1000>;
+			qcom,ipc = <&l2cc 0x8 2>;
+
+			interrupts = <GIC_SPI 19 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 21 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 22 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "ack", "err", "wakeup";
 		};
 
-		timer@200a000 {
-			compatible = "qcom,kpss-wdt-msm8960", "qcom,kpss-timer",
-				     "qcom,msm-timer";
-			interrupts = <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>,
-				     <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>,
-				     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>;
-			reg = <0x0200a000 0x100>;
-			clock-frequency = <27000000>;
-			clocks = <&sleep_clk>;
-			clock-names = "sleep";
-			cpu-offset = <0x80000>;
+		ssbi: ssbi@500000 {
+			compatible = "qcom,ssbi";
+			reg = <0x500000 0x1000>;
+			qcom,controller-type = "pmic-arbiter";
 		};
 
 		qfprom: efuse@700000 {
@@ -176,20 +121,20 @@ tsens_backup: backup-calib@414 {
 
 		msmgpio: pinctrl@800000 {
 			compatible = "qcom,msm8960-pinctrl";
+			reg = <0x800000 0x4000>;
 			gpio-controller;
 			gpio-ranges = <&msmgpio 0 0 152>;
 			#gpio-cells = <2>;
 			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			reg = <0x800000 0x4000>;
 		};
 
 		gcc: clock-controller@900000 {
 			compatible = "qcom,gcc-msm8960", "syscon";
+			reg = <0x900000 0x4000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
-			reg = <0x900000 0x4000>;
 			clocks = <&cxo_board>,
 				 <&pxo_board>,
 				 <&lcc PLL4>;
@@ -208,49 +153,25 @@ tsens: thermal-sensor {
 			};
 		};
 
-		lcc: clock-controller@28000000 {
-			compatible = "qcom,lcc-msm8960";
-			reg = <0x28000000 0x1000>;
-			#clock-cells = <1>;
-			#reset-cells = <1>;
-			clocks = <&pxo_board>,
-				 <&gcc PLL4_VOTE>,
-				 <0>,
-				 <0>, <0>,
-				 <0>, <0>,
-				 <0>;
-			clock-names = "pxo",
-				      "pll4_vote",
-				      "mi2s_codec_clk",
-				      "codec_i2s_mic_codec_clk",
-				      "spare_i2s_mic_codec_clk",
-				      "codec_i2s_spkr_codec_clk",
-				      "spare_i2s_spkr_codec_clk",
-				      "pcm_codec_clk";
+		intc: interrupt-controller@2000000 {
+			compatible = "qcom,msm-qgic2";
+			reg = <0x02000000 0x1000>,
+			      <0x02002000 0x1000>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
 		};
 
-		clock-controller@4000000 {
-			compatible = "qcom,mmcc-msm8960";
-			reg = <0x4000000 0x1000>;
-			#clock-cells = <1>;
-			#power-domain-cells = <1>;
-			#reset-cells = <1>;
-			clocks = <&pxo_board>,
-				 <&gcc PLL3>,
-				 <&gcc PLL8_VOTE>,
-				 <0>,
-				 <0>,
-				 <0>,
-				 <0>,
-				 <0>;
-			clock-names = "pxo",
-				      "pll3",
-				      "pll8_vote",
-				      "dsi1pll",
-				      "dsi1pllbyte",
-				      "dsi2pll",
-				      "dsi2pllbyte",
-				      "hdmipll";
+		timer@200a000 {
+			compatible = "qcom,kpss-wdt-msm8960", "qcom,kpss-timer",
+				     "qcom,msm-timer";
+			reg = <0x0200a000 0x100>;
+			interrupts = <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>,
+				     <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>,
+				     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>;
+			clock-frequency = <27000000>;
+			clocks = <&sleep_clk>;
+			clock-names = "sleep";
+			cpu-offset = <0x80000>;
 		};
 
 		l2cc: clock-controller@2011000 {
@@ -261,17 +182,6 @@ l2cc: clock-controller@2011000 {
 			#clock-cells = <0>;
 		};
 
-		rpm: rpm@108000 {
-			compatible = "qcom,rpm-msm8960";
-			reg = <0x108000 0x1000>;
-			qcom,ipc = <&l2cc 0x8 2>;
-
-			interrupts = <GIC_SPI 19 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 21 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 22 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "ack", "err", "wakeup";
-		};
-
 		acc0: clock-controller@2088000 {
 			compatible = "qcom,kpss-acc-v1";
 			reg = <0x02088000 0x1000>, <0x02008000 0x1000>;
@@ -281,15 +191,6 @@ acc0: clock-controller@2088000 {
 			#clock-cells = <0>;
 		};
 
-		acc1: clock-controller@2098000 {
-			compatible = "qcom,kpss-acc-v1";
-			reg = <0x02098000 0x1000>, <0x02008000 0x1000>;
-			clocks = <&gcc PLL8_VOTE>, <&pxo_board>;
-			clock-names = "pll8_vote", "pxo";
-			clock-output-names = "acpu1_aux";
-			#clock-cells = <0>;
-		};
-
 		saw0: power-manager@2089000 {
 			compatible = "qcom,msm8960-saw2-cpu", "qcom,saw2";
 			reg = <0x02089000 0x1000>, <0x02009000 0x1000>;
@@ -300,6 +201,15 @@ saw0_vreg: regulator {
 			};
 		};
 
+		acc1: clock-controller@2098000 {
+			compatible = "qcom,kpss-acc-v1";
+			reg = <0x02098000 0x1000>, <0x02008000 0x1000>;
+			clocks = <&gcc PLL8_VOTE>, <&pxo_board>;
+			clock-names = "pll8_vote", "pxo";
+			clock-output-names = "acpu1_aux";
+			#clock-cells = <0>;
+		};
+
 		saw1: power-manager@2099000 {
 			compatible = "qcom,msm8960-saw2-cpu", "qcom,saw2";
 			reg = <0x02099000 0x1000>, <0x02009000 0x1000>;
@@ -310,72 +220,34 @@ saw1_vreg: regulator {
 			};
 		};
 
-		gsbi5: gsbi@16400000 {
-			compatible = "qcom,gsbi-v1.0.0";
-			cell-index = <5>;
-			reg = <0x16400000 0x100>;
-			clocks = <&gcc GSBI5_H_CLK>;
-			clock-names = "iface";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
-
-			syscon-tcsr = <&tcsr>;
-			status = "disabled";
-
-			gsbi5_serial: serial@16440000 {
-				compatible = "qcom,msm-uartdm-v1.3", "qcom,msm-uartdm";
-				reg = <0x16440000 0x1000>,
-				      <0x16400000 0x1000>;
-				interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GSBI5_UART_CLK>, <&gcc GSBI5_H_CLK>;
-				clock-names = "core", "iface";
-				status = "disabled";
-			};
-		};
-
-		gsbi8: gsbi@1a000000  {
-			compatible = "qcom,gsbi-v1.0.0";
-			cell-index = <8>;
-			reg = <0x1a000000 0x100>;
-			clocks = <&gcc GSBI8_H_CLK>;
-			clock-names = "iface";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
-
-			syscon-tcsr = <&tcsr>;
-			status = "disabled";
-
-			gsbi8_serial: serial@1a040000 {
-				compatible = "qcom,msm-uartdm-v1.3", "qcom,msm-uartdm";
-				reg = <0x1a040000 0x1000>,
-							<0x1a000000 0x1000>;
-				interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GSBI8_UART_CLK>, <&gcc GSBI8_H_CLK>;
-				clock-names = "core", "iface";
-				status = "disabled";
-			};
-		};
-
-		ssbi: ssbi@500000 {
-			compatible = "qcom,ssbi";
-			reg = <0x500000 0x1000>;
-			qcom,controller-type = "pmic-arbiter";
-		};
-
-		rng@1a500000 {
-			compatible = "qcom,prng";
-			reg = <0x1a500000 0x200>;
-			clocks = <&gcc PRNG_CLK>;
-			clock-names = "core";
+		clock-controller@4000000 {
+			compatible = "qcom,mmcc-msm8960";
+			reg = <0x4000000 0x1000>;
+			#clock-cells = <1>;
+			#power-domain-cells = <1>;
+			#reset-cells = <1>;
+			clocks = <&pxo_board>,
+				 <&gcc PLL3>,
+				 <&gcc PLL8_VOTE>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			clock-names = "pxo",
+				      "pll3",
+				      "pll8_vote",
+				      "dsi1pll",
+				      "dsi1pllbyte",
+				      "dsi2pll",
+				      "dsi2pllbyte",
+				      "hdmipll";
 		};
 
 		sdcc3: mmc@12180000 {
 			compatible = "arm,pl18x", "arm,primecell";
-			arm,primecell-periphid = <0x00051180>;
-			status = "disabled";
 			reg = <0x12180000 0x2000>;
+			arm,primecell-periphid = <0x00051180>;
 			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&gcc SDC3_CLK>, <&gcc SDC3_H_CLK>;
 			clock-names = "mclk", "apb_pclk";
@@ -387,6 +259,8 @@ sdcc3: mmc@12180000 {
 			vmmc-supply = <&vsdcc_fixed>;
 			dmas = <&sdcc3bam 2>, <&sdcc3bam 1>;
 			dma-names = "tx", "rx";
+
+			status = "disabled";
 		};
 
 		sdcc3bam: dma-controller@12182000 {
@@ -400,10 +274,9 @@ sdcc3bam: dma-controller@12182000 {
 		};
 
 		sdcc1: mmc@12400000 {
-			status = "disabled";
 			compatible = "arm,pl18x", "arm,primecell";
-			arm,primecell-periphid = <0x00051180>;
 			reg = <0x12400000 0x2000>;
+			arm,primecell-periphid = <0x00051180>;
 			interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&gcc SDC1_CLK>, <&gcc SDC1_H_CLK>;
 			clock-names = "mclk", "apb_pclk";
@@ -415,6 +288,8 @@ sdcc1: mmc@12400000 {
 			vmmc-supply = <&vsdcc_fixed>;
 			dmas = <&sdcc1bam 2>, <&sdcc1bam 1>;
 			dma-names = "tx", "rx";
+
+			status = "disabled";
 		};
 
 		sdcc1bam: dma-controller@12402000 {
@@ -427,36 +302,6 @@ sdcc1bam: dma-controller@12402000 {
 			qcom,ee = <0>;
 		};
 
-		tcsr: syscon@1a400000 {
-			compatible = "qcom,tcsr-msm8960", "syscon";
-			reg = <0x1a400000 0x100>;
-		};
-
-		gsbi1: gsbi@16000000 {
-			compatible = "qcom,gsbi-v1.0.0";
-			cell-index = <1>;
-			reg = <0x16000000 0x100>;
-			clocks = <&gcc GSBI1_H_CLK>;
-			clock-names = "iface";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
-			status = "disabled";
-
-			gsbi1_spi: spi@16080000 {
-				compatible = "qcom,spi-qup-v1.1.1";
-				#address-cells = <1>;
-				#size-cells = <0>;
-				reg = <0x16080000 0x1000>;
-				interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
-				cs-gpios = <&msmgpio 8 0>;
-
-				clocks = <&gcc GSBI1_QUP_CLK>, <&gcc GSBI1_H_CLK>;
-				clock-names = "core", "iface";
-				status = "disabled";
-			};
-		};
-
 		usb1: usb@12500000 {
 			compatible = "qcom,ci-hdrc";
 			reg = <0x12500000 0x200>,
@@ -473,6 +318,7 @@ usb1: usb@12500000 {
 			phys = <&usb_hs1_phy>;
 			phy-names = "usb-phy";
 			#reset-cells = <1>;
+
 			status = "disabled";
 
 			ulpi {
@@ -488,6 +334,32 @@ usb_hs1_phy: phy {
 			};
 		};
 
+		gsbi1: gsbi@16000000 {
+			compatible = "qcom,gsbi-v1.0.0";
+			reg = <0x16000000 0x100>;
+			ranges;
+			cell-index = <1>;
+			clocks = <&gcc GSBI1_H_CLK>;
+			clock-names = "iface";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			status = "disabled";
+
+			gsbi1_spi: spi@16080000 {
+				compatible = "qcom,spi-qup-v1.1.1";
+				reg = <0x16080000 0x1000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+				cs-gpios = <&msmgpio 8 0>;
+				clocks = <&gcc GSBI1_QUP_CLK>, <&gcc GSBI1_H_CLK>;
+				clock-names = "core", "iface";
+
+				status = "disabled";
+			};
+		};
+
 		gsbi3: gsbi@16200000 {
 			compatible = "qcom,gsbi-v1.0.0";
 			reg = <0x16200000 0x100>;
@@ -497,6 +369,7 @@ gsbi3: gsbi@16200000 {
 			clock-names = "iface";
 			#address-cells = <1>;
 			#size-cells = <1>;
+
 			status = "disabled";
 
 			gsbi3_i2c: i2c@16280000 {
@@ -511,9 +384,146 @@ gsbi3_i2c: i2c@16280000 {
 				clock-names = "core", "iface";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
+				status = "disabled";
+			};
+		};
+
+		gsbi5: gsbi@16400000 {
+			compatible = "qcom,gsbi-v1.0.0";
+			reg = <0x16400000 0x100>;
+			ranges;
+			cell-index = <5>;
+			clocks = <&gcc GSBI5_H_CLK>;
+			clock-names = "iface";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			syscon-tcsr = <&tcsr>;
+
+			status = "disabled";
+
+			gsbi5_serial: serial@16440000 {
+				compatible = "qcom,msm-uartdm-v1.3", "qcom,msm-uartdm";
+				reg = <0x16440000 0x1000>,
+				      <0x16400000 0x1000>;
+				interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GSBI5_UART_CLK>, <&gcc GSBI5_H_CLK>;
+				clock-names = "core", "iface";
+
+				status = "disabled";
+			};
+		};
+
+		gsbi8: gsbi@1a000000 {
+			compatible = "qcom,gsbi-v1.0.0";
+			reg = <0x1a000000 0x100>;
+			ranges;
+			cell-index = <8>;
+			clocks = <&gcc GSBI8_H_CLK>;
+			clock-names = "iface";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			syscon-tcsr = <&tcsr>;
+
+			status = "disabled";
+
+			gsbi8_serial: serial@1a040000 {
+				compatible = "qcom,msm-uartdm-v1.3", "qcom,msm-uartdm";
+				reg = <0x1a040000 0x1000>,
+				      <0x1a000000 0x1000>;
+				interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GSBI8_UART_CLK>, <&gcc GSBI8_H_CLK>;
+				clock-names = "core", "iface";
+
 				status = "disabled";
 			};
 		};
+
+		tcsr: syscon@1a400000 {
+			compatible = "qcom,tcsr-msm8960", "syscon";
+			reg = <0x1a400000 0x100>;
+		};
+
+		rng@1a500000 {
+			compatible = "qcom,prng";
+			reg = <0x1a500000 0x200>;
+			clocks = <&gcc PRNG_CLK>;
+			clock-names = "core";
+		};
+
+		lcc: clock-controller@28000000 {
+			compatible = "qcom,lcc-msm8960";
+			reg = <0x28000000 0x1000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			clocks = <&pxo_board>,
+				 <&gcc PLL4_VOTE>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			clock-names = "pxo",
+				      "pll4_vote",
+				      "mi2s_codec_clk",
+				      "codec_i2s_mic_codec_clk",
+				      "spare_i2s_mic_codec_clk",
+				      "codec_i2s_spkr_codec_clk",
+				      "spare_i2s_spkr_codec_clk",
+				      "pcm_codec_clk";
+		};
+	};
+
+	thermal-zones {
+		cpu0-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tsens 0>;
+
+			trips {
+				cpu_alert0: trip0 {
+					temperature = <60000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				cpu_crit0: trip1 {
+					temperature = <95000>;
+					hysteresis = <10000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu1-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tsens 1>;
+
+			trips {
+				cpu_alert1: trip0 {
+					temperature = <60000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				cpu_crit1: trip1 {
+					temperature = <95000>;
+					hysteresis = <10000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
+	/* Temporary fixed regulator */
+	vsdcc_fixed: vsdcc-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "SDCC Power";
+		regulator-min-microvolt = <2700000>;
+		regulator-max-microvolt = <2700000>;
+		regulator-always-on;
 	};
 };
 #include "qcom-msm8960-pins.dtsi"

-- 
2.34.1


