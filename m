Return-Path: <linux-gpio+bounces-26123-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E48B56B5C
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Sep 2025 20:44:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B43FC7A28BE
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Sep 2025 18:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFE272DF123;
	Sun, 14 Sep 2025 18:44:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fuchsia.ash.relay.mailchannels.net (fuchsia.ash.relay.mailchannels.net [23.83.222.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1BB25F96B;
	Sun, 14 Sep 2025 18:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.222.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757875483; cv=pass; b=D3BFqmY1GnQP3lo1w5mEc6oe57kXve15BjK6MVKToOg4yLYh2wof9nXAVMV3/71iM35lxxeqi5fS7EenMsLFxb7+W6ytuaOcp+zoXjaIIPRoYqLS0d0ImY1j41RmkalkFBnKj5BPVelB1F9BAdNmQpnG3omZOY5bgjdbyab1dvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757875483; c=relaxed/simple;
	bh=0IRTwaLa+76NWfzN6SuExY5GzqZ8V0uj/h+iwv8wWmI=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=M4CAhEba8kRo9fbJuFsDczv5mt2jB0tnrtFMNlOV6eymZQy8u9LXCVzgtShoou9Oik3GZ8cGDfIOB1eP+u1TMHUhl7e8MgrSy/1JppKRgeizp9c/d1+5PkksZ8J3GSXqImKXWbT+mJWT+YVwlRh8JH831m04Fq2V3RQQb85Rb/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; arc=pass smtp.client-ip=23.83.222.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 1D1593A106E;
	Sun, 14 Sep 2025 18:35:12 +0000 (UTC)
Received: from uk-fast-smtpout10.hostinger.io (100-107-18-161.trex-nlb.outbound.svc.cluster.local [100.107.18.161])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 6AEC83A0E97;
	Sun, 14 Sep 2025 18:35:09 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1757874911; a=rsa-sha256;
	cv=none;
	b=VBIkW9h4xKR+bTMMykF+JCGnXxAi4ywqLOjiNYkvm/WXDyp1Vf5W8E0+tpjPD683Qh2xLG
	SRqi4kN7kmv4jYByUQIieqY2vTVfJJeqRiAlqTz172NcsvPzvVIEw/YSTCOJlXLz0agTS7
	jvsSJJXPS3o0M4gvoIlUBHbvJwoYao9sSJf5XOgDojFX5zk/qQHeXFO+0RvfE3g/1XLn9y
	VaPxX3fFX0ZRjpahGJn4L60HQ+m9zC2NhPh7m/cld61AcFWHhi0LvOJK6/Po0T/nOkUqOe
	qMQ6dUZqPMnpnuhl2zNimlYAL7KKO6qjYL3wZT9YDyfLzLnJPx/7fn9Z3d6NVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1757874911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KffgvRiUbWak6D868/+qudNaw04uqWS4U721gVaheis=;
	b=Jdp5bGbbYlSB7wjQnTvdIrD9EiKVMG3aGnS2y8V2yahib5em6SMfNKjiaTizUNBXWZ22Kj
	WcUfBTxKSX1evvTsTprcLIdDaDVFBPPRELhr5wXTtQfaR7Z+PyJg6RzkQFHbi1Di2rsTjB
	fbeyYaIk42DZL6MFTXCFPbGKoej3Lhrz0lxl1F1R//QBEVBHsfonRKLXUQaBR4nNkW1zue
	1i0QSby2aYn9WTaf5dFce5TcugLunOt5VPbols/zMRpDY/0ScPdZMLBl8dswsQyGyy+3ol
	3Fb0Llv5P40ZHbvlVd8MQrH+wxiGLwc52TxzgW3bTKJV82uCTNszOfmsWGfokQ==
ARC-Authentication-Results: i=1;
	rspamd-54bcd779b6-2b7fv;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MC-Copy: stored-urls
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Grain-Plucky: 4c6556a578df02a1_1757874912018_2022376347
X-MC-Loop-Signature: 1757874912018:279802087
X-MC-Ingress-Time: 1757874912018
Received: from uk-fast-smtpout10.hostinger.io (uk-fast-smtpout10.hostinger.io
 [145.14.155.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.107.18.161 (trex/7.1.3);
	Sun, 14 Sep 2025 18:35:12 +0000
Received: from [172.17.0.2] (unknown [110.138.220.153])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4cPxfc0GPszFK5MY;
	Sun, 14 Sep 2025 18:35:03 +0000 (UTC)
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH 6/6] ARM: dts: qcom: msm8960: rename msmgpio node to tlmm
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-msm8960-reorder-v1-6-84cadcd7c6e3@smankusors.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757874878; l=5151;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=0IRTwaLa+76NWfzN6SuExY5GzqZ8V0uj/h+iwv8wWmI=;
 b=dmWAeYyD74R//du+OKCefSPzHiBCpHc3w7hCjkja3Rq0Oyk1UqmyzI0JT9LUd9pVDo3On0BBA
 LEYWEkStfVTDglVEaznxlXnoGRRWj3B8qa2iCd/u1MPw9NTAfMD/CIR
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sun, 14 Sep 2025 18:35:03 +0000 (UTC)
X-CM-Envelope: MS4xfD/fuOxGe4WCEh0lhc8nxn813RDfs/x+ejMIYhwQHCmL+sH/ngG/VgNNDTHJjpRcHH33P/sr6kpIs5T6r2f0DVynfCrtiESbMxoYGbxUkueVyzNEwmGX 2zVoyvWfxWJpo8Pb6mB9Ld4ZsyUeIEmJdN3q1R4lcAYi2qmcMQVM2c7rx3U8qQccC4MFQj4MFIizcAKlumZ9CMJWiyrPbnYDbDNDlUUGanW/nxScBqsOHqZH s7zze9yfAGTzgUoLeiUAanP11KBq1rQqwKPaPr0TSroWm6L2ujYteiEtAhhRf4VokvEiVev1MywpmNYU+GFhT37aX32foXBCGi0pVFG1pSV4qgRQuUvTrjaT 8ZxgZXAmXbq7HiFKS2cdw76QIY9fC0D8T9RqK7w0Otpu2J69hzg4QRcb+MSzd7ibJGDyZU6Vu56Dv2psn6lFpa4lsgE8W8CcTnZrPcBL2H79GWshONbtQfv0 GJDh3EKwKwi16dDSSQcrai5wbY4dOmdYpxgf7uU5LcrTbmF1kPurdgb3SyRH0EWVC9sFmt33E+9WvD8Atw3B8qsVGFscFagfY0GMzQY0My2JVckfrilSBwGk HxpbSkDfgi18ofRQ7T/OraqmyRi7mKFY4lUAJh58JxJZMRP31K6AsK4er91aOGjJdI99I9Fdw/NZL8JjNOKn5kbVdSL/PqHCqsajrZOCcBq1pQ==
X-CM-Analysis: v=2.4 cv=LvvAyWdc c=1 sm=1 tr=0 ts=68c70adb a=3tJJDl7MZm1GcYeSp/W8Jw==:117 a=3tJJDl7MZm1GcYeSp/W8Jw==:17 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8 a=wxLWbCv9AAAA:8 a=Db0N6nx0JfcAnO-C33IA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-AuthUser: linux@smankusors.com

Rename the GPIO controller node from "msmgpio" to "tlmm" to match the
convention used by other Qualcomm SoCs.

Suggested-by: Shinjo Park <peremen@gmail.com>
Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts                | 10 +++++-----
 arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts | 12 ++++++------
 arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts       |  2 +-
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi                   |  6 +++---
 4 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
index 36f4c997b0b3aa8c9bbbee78906f03dad0a73e7e..1df078d7d89b839b45d9f9c56fee9d4ea9615c6e 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
@@ -19,7 +19,7 @@ chosen {
 	ext_l2: gpio-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "ext_l2";
-		gpio = <&msmgpio 91 0>;
+		gpio = <&tlmm 91 0>;
 		startup-delay-us = <10000>;
 		enable-active-high;
 	};
@@ -38,12 +38,12 @@ &gsbi1_spi {
 	ethernet@0 {
 		compatible = "micrel,ks8851";
 		reg = <0>;
-		interrupt-parent = <&msmgpio>;
+		interrupt-parent = <&tlmm>;
 		interrupts = <90 IRQ_TYPE_LEVEL_LOW>;
 		spi-max-frequency = <5400000>;
 		vdd-supply = <&ext_l2>;
 		vdd-io-supply = <&pm8921_lvs6>;
-		reset-gpios = <&msmgpio 89 0>;
+		reset-gpios = <&tlmm 89 0>;
 	};
 };
 
@@ -56,7 +56,7 @@ &gsbi5_serial {
 	status = "okay";
 };
 
-&msmgpio {
+&tlmm {
 	spi1_default: spi1-default-state {
 		 mosi-pins {
 			pins = "gpio6";
@@ -90,7 +90,7 @@ clk-pins {
 };
 
 &pm8921 {
-	interrupts-extended = <&msmgpio 104 IRQ_TYPE_LEVEL_LOW>;
+	interrupts-extended = <&tlmm 104 IRQ_TYPE_LEVEL_LOW>;
 };
 
 &pm8921_keypad {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
index 49d117ea033a0ef73c134d1225982786fbded2c2..5ee919dce75b31a977e8e1ebd0d02413b20b6270 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
@@ -31,7 +31,7 @@ gpio-keys {
 
 		key-home {
 			label = "Home";
-			gpios = <&msmgpio 40 GPIO_ACTIVE_LOW>;
+			gpios = <&tlmm 40 GPIO_ACTIVE_LOW>;
 			debounce-interval = <5>;
 			linux,code = <KEY_HOMEPAGE>;
 			wakeup-event-action = <EV_ACT_ASSERTED>;
@@ -40,14 +40,14 @@ key-home {
 
 		key-volume-up {
 			label = "Volume Up";
-			gpios = <&msmgpio 50 GPIO_ACTIVE_LOW>;
+			gpios = <&tlmm 50 GPIO_ACTIVE_LOW>;
 			debounce-interval = <5>;
 			linux,code = <KEY_VOLUMEUP>;
 		};
 
 		key-volume-down {
 			label = "Volume Down";
-			gpios = <&msmgpio 81 GPIO_ACTIVE_LOW>;
+			gpios = <&tlmm 81 GPIO_ACTIVE_LOW>;
 			debounce-interval = <5>;
 			linux,code = <KEY_VOLUMEDOWN>;
 		};
@@ -102,7 +102,7 @@ &gsbi3_i2c {
 	touchscreen@4a {
 		compatible = "atmel,maxtouch";
 		reg = <0x4a>;
-		interrupt-parent = <&msmgpio>;
+		interrupt-parent = <&tlmm>;
 		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
 		vdda-supply = <&pm8921_lvs6>;
 		vdd-supply = <&pm8921_l17>;
@@ -111,7 +111,7 @@ touchscreen@4a {
 	};
 };
 
-&msmgpio {
+&tlmm {
 	spi1_default: spi1-default-state {
 		mosi-pins {
 			pins = "gpio6";
@@ -160,7 +160,7 @@ touchscreen: touchscreen-int-state {
 };
 
 &pm8921 {
-	interrupts-extended = <&msmgpio 104 IRQ_TYPE_LEVEL_LOW>;
+	interrupts-extended = <&tlmm 104 IRQ_TYPE_LEVEL_LOW>;
 };
 
 &rpm {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts
index f2f59fc8b9b61e18b0ec4ed1fc2d813585a75f15..591dc837e6003680d5841a6e29b8862996e1e5ca 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts
@@ -54,7 +54,7 @@ &gsbi8_serial {
 };
 
 &pm8921 {
-	interrupts-extended = <&msmgpio 104 IRQ_TYPE_LEVEL_LOW>;
+	interrupts-extended = <&tlmm 104 IRQ_TYPE_LEVEL_LOW>;
 };
 
 &pm8921_gpio {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index 7206a4eaabe36deabaf1ca946c837ff3bd330fdd..f8ea139a32f823bf7962e2e1b63067c1d79cca80 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -119,11 +119,11 @@ tsens_backup: backup-calib@414 {
 			};
 		};
 
-		msmgpio: pinctrl@800000 {
+		tlmm: pinctrl@800000 {
 			compatible = "qcom,msm8960-pinctrl";
 			reg = <0x800000 0x4000>;
 			gpio-controller;
-			gpio-ranges = <&msmgpio 0 0 152>;
+			gpio-ranges = <&tlmm 0 0 152>;
 			#gpio-cells = <2>;
 			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
@@ -525,7 +525,7 @@ gsbi1_spi: spi@16080000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
-				cs-gpios = <&msmgpio 8 0>;
+				cs-gpios = <&tlmm 8 0>;
 				clocks = <&gcc GSBI1_QUP_CLK>, <&gcc GSBI1_H_CLK>;
 				clock-names = "core", "iface";
 

-- 
2.34.1


