Return-Path: <linux-gpio+bounces-24704-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D4BB2ED56
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 06:54:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD5EE5A46FB
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 04:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6BCD2BE655;
	Thu, 21 Aug 2025 04:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bDfpVeyR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3504277020;
	Thu, 21 Aug 2025 04:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755751780; cv=none; b=KHXSjRUarNEptYsvfbwsfhfTd3Bu1V0JkT0yHMbYv3UzyP+Ew9WgMFRewHuF9NBoU86eyU/zdimnwybXV0Kl/1oq7rzhjMYq7fqeXrTMaxNjt22/Y1NHeKlwuYISb2obJPxcJq5q9H3LzVpqO1nUSQG+pBBq48YiLHcFZAFjSQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755751780; c=relaxed/simple;
	bh=A0VkVzS3dyJrDVDgZoHOJ9Agbacw6rtZFs1B4dWwLB4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XHYY1lt0ftpqQiIs+ctXQtIsbNxexpUqWN0hg5pHkuU6eOCglghE98yQkEXybR/nu2Qh23XDMLor00wxAcXupNAd90zFx2mW1q7fdvdyZ/7jxU5WF5ec7IoGnxbCOtJ6oQ+dYmHzTiV5htnM7+K6wrQ95AbqRnBgDONNlzTJPgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bDfpVeyR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KHiF7t008766;
	Thu, 21 Aug 2025 04:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ohm/HG+03Im
	6ygCn76mkqDNbCPSvANVMXXJLSTFyc5M=; b=bDfpVeyRe6lhyocfuKb93aAJ1Ry
	Rl2igdZzxd8fnlOJIy1/h2JGV+pII1TfRFp+y6kgbq/ssuQkVAgvyTFR33C2V2Wz
	ai3PZBX8FUYOFNN/5xjXRV51Xu1r5/VRuyHzJqJt3AFUSqB0E223UqQFhppqfpfR
	nMC4ySuBpj0vhBmhOewmLps4OPZ/ATNnv46K/5PxZi0y02ivsrDEzgOUDIswcsmT
	aifEQ5pvYZVG1ea+qhN4NKDXzHIpZH9gwZ2rIZsszykAXXjkzgFBqGHZwXjjS7dL
	I3w9KOlo9zsemH7F0W2+109Bk8f16mSiyYNypbgGii5xhdEpviLLeHfucEA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52a42gw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 04:49:22 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57L4nIan021971;
	Thu, 21 Aug 2025 04:49:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 48jk2m997b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 04:49:19 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57L4nJIb022000;
	Thu, 21 Aug 2025 04:49:19 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 57L4nIsx021969
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 04:49:19 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 8B3BD5D5; Thu, 21 Aug 2025 10:19:16 +0530 (+0530)
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        quic_pkumpatl@quicinc.com, kernel@oss.qualcomm.com,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH v8 8/9] arm64: dts: qcom: qcm6490-idp: Add WSA8830 speakers and WCD9370 headset codec
Date: Thu, 21 Aug 2025 10:19:13 +0530
Message-Id: <20250821044914.710044-9-quic_pkumpatl@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250821044914.710044-1-quic_pkumpatl@quicinc.com>
References: <20250821044914.710044-1-quic_pkumpatl@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=feD0C0QF c=1 sm=1 tr=0 ts=68a6a552 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=U1-NlgUr8jZUk8VuFV4A:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: ehe97abSG0Aifyc_hi0Rcip8_tvydUf6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX3uojDaTIgahB
 RvEN7Bdcpj+kJqQ+w27HVB3WorgUyXep4Bf2ievhTxJGXCf4szI5u4Yzu+ovZG7IVE5wqVHFZ+B
 2nwCxEDk/vuN9P/XJ8vt1KEUe0jh1srrp5QEqug/uDxZxCmql4KGIe8LSKiza9WpEZN2LK0dqFX
 srNR3Dwr32RFDrS3wqCQ1yVNbcch1vINLNzEgY+bXRW0ghT5zNBxK4J06DHzVL9tOdx+eRdS3jB
 fA2ofbpkkdXaYuG6qChX1TiCmM8Fk6ydbH7nRgbJaE+PWDOlQmt05zuKBxyTmAXioQjS+4+2nLX
 htK03WYRLpPiEnR+jteS4oDZSdIEb2nPtiPo9FM+mcVezpwv5/GbsxVy6E5SHS1i6TOFNT+9H8g
 ncw2Ur0LCLwxOAj3MiwNTNk4TU50Kw==
X-Proofpoint-GUID: ehe97abSG0Aifyc_hi0Rcip8_tvydUf6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Add nodes for WSA8830 speakers and WCD9370 headset codec
on qcm6490-idp board.

Enable lpass macros along with audio support pin controls.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 123 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi     |  12 +++
 2 files changed, 135 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 8ed6e28b0c29..379ee346a33a 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -18,6 +18,7 @@
 #include "pm7325.dtsi"
 #include "pm8350c.dtsi"
 #include "pmk8350.dtsi"
+#include "qcs6490-audioreach.dtsi"
 
 /delete-node/ &ipa_fw_mem;
 /delete-node/ &rmtfs_mem;
@@ -169,6 +170,30 @@ vph_pwr: vph-pwr-regulator {
 		regulator-min-microvolt = <3700000>;
 		regulator-max-microvolt = <3700000>;
 	};
+
+	wcd9370: audio-codec-0 {
+		compatible = "qcom,wcd9370-codec";
+
+		pinctrl-0 = <&wcd_default>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&tlmm 83 GPIO_ACTIVE_HIGH>;
+
+		vdd-buck-supply = <&vreg_l17b_1p7>;
+		vdd-rxtx-supply = <&vreg_l18b_1p8>;
+		vdd-px-supply = <&vreg_l18b_1p8>;
+		vdd-mic-bias-supply = <&vreg_bob_3p296>;
+
+		qcom,micbias1-microvolt = <1800000>;
+		qcom,micbias2-microvolt = <1800000>;
+		qcom,micbias3-microvolt = <1800000>;
+		qcom,micbias4-microvolt = <1800000>;
+
+		qcom,rx-device = <&wcd937x_rx>;
+		qcom,tx-device = <&wcd937x_tx>;
+
+		#sound-dai-cells = <1>;
+	};
 };
 
 &apps_rsc {
@@ -536,6 +561,22 @@ &gpu_zap_shader {
 	firmware-name = "qcom/qcm6490/a660_zap.mbn";
 };
 
+&lpass_rx_macro {
+	status = "okay";
+};
+
+&lpass_tx_macro {
+	status = "okay";
+};
+
+&lpass_va_macro {
+	status = "okay";
+};
+
+&lpass_wsa_macro {
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };
@@ -716,6 +757,81 @@ &sdhc_2 {
 	cd-gpios = <&tlmm 91 GPIO_ACTIVE_LOW>;
 };
 
+&swr0 {
+	status = "okay";
+
+	wcd937x_rx: codec@0,4 {
+		compatible = "sdw20217010a00";
+		reg = <0 4>;
+
+		/*
+		 * WCD9370 RX Port 1 (HPH_L/R)       <==>    SWR1 Port 1 (HPH_L/R)
+		 * WCD9370 RX Port 2 (CLSH)          <==>    SWR1 Port 2 (CLSH)
+		 * WCD9370 RX Port 3 (COMP_L/R)      <==>    SWR1 Port 3 (COMP_L/R)
+		 * WCD9370 RX Port 4 (LO)            <==>    SWR1 Port 4 (LO)
+		 * WCD9370 RX Port 5 (DSD_L/R)       <==>    SWR1 Port 5 (DSD)
+		 */
+		qcom,rx-port-mapping = <1 2 3 4 5>;
+
+		/*
+		 * Static channels mapping between slave and master rx port channels.
+		 * In the order of slave port channels, which is
+		 * hph_l, hph_r, clsh, comp_l, comp_r, lo, dsd_r, dsd_l.
+		 */
+		qcom,rx-channel-mapping = /bits/ 8 <1 2 1 1 2 1 1 2>;
+	};
+};
+
+&swr1 {
+	status = "okay";
+
+	wcd937x_tx: codec@0,3 {
+		compatible = "sdw20217010a00";
+		reg = <0 3>;
+
+		/*
+		 * WCD9370 TX Port 1 (ADC1)               <=> SWR2 Port 2
+		 * WCD9370 TX Port 2 (ADC2, 3)            <=> SWR2 Port 2
+		 * WCD9370 TX Port 3 (DMIC0,1,2,3 & MBHC) <=> SWR2 Port 3
+		 * WCD9370 TX Port 4 (DMIC4,5,6,7)        <=> SWR2 Port 4
+		 */
+		qcom,tx-port-mapping = <1 1 2 3>;
+
+		/*
+		 * Static channel mapping between slave and master tx port channels.
+		 * In the order of slave port channels which is adc1, adc2, adc3,
+		 * mic0, dmic1, mbhc, dmic2, dmic3, dmci4, dmic5, dmic6, dmic7.
+		 */
+		qcom,tx-channel-mapping = /bits/ 8 <1 2 1 1 2 3 3 4 1 2 3 4>;
+	};
+};
+
+&swr2 {
+	status = "okay";
+
+	left_spkr: speaker@0,1 {
+		compatible = "sdw10217020200";
+		reg = <0 1>;
+		powerdown-gpios = <&tlmm 63 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrLeft";
+		#thermal-sensor-cells = <0>;
+		vdd-supply = <&vreg_l18b_1p8>;
+		qcom,port-mapping = <1 2 3 7>;
+	};
+
+	right_spkr: speaker@0,2 {
+		compatible = "sdw10217020200";
+		reg = <0 2>;
+		powerdown-gpios = <&tlmm 62 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrRight";
+		#thermal-sensor-cells = <0>;
+		vdd-supply = <&vreg_l18b_1p8>;
+		qcom,port-mapping = <4 5 6 8>;
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <32 2>, /* ADSP */
 			       <48 4>; /* NFC */
@@ -725,6 +841,13 @@ sd_cd: sd-cd-state {
 		function = "gpio";
 		bias-pull-up;
 	};
+
+	wcd_default: wcd-reset-n-active-state {
+		pins = "gpio83";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
 };
 
 &uart5 {
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index d472de18296b..1b942e15377d 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3029,21 +3029,33 @@ lpass_dmic23_data: dmic23-data-state {
 			lpass_rx_swr_clk: rx-swr-clk-state {
 				pins = "gpio3";
 				function = "swr_rx_clk";
+				drive-strength = <2>;
+				slew-rate = <1>;
+				bias-disable;
 			};
 
 			lpass_rx_swr_data: rx-swr-data-state {
 				pins = "gpio4", "gpio5";
 				function = "swr_rx_data";
+				drive-strength = <2>;
+				slew-rate = <1>;
+				bias-bus-hold;
 			};
 
 			lpass_tx_swr_clk: tx-swr-clk-state {
 				pins = "gpio0";
 				function = "swr_tx_clk";
+				drive-strength = <2>;
+				slew-rate = <1>;
+				bias-disable;
 			};
 
 			lpass_tx_swr_data: tx-swr-data-state {
 				pins = "gpio1", "gpio2", "gpio14";
 				function = "swr_tx_data";
+				drive-strength = <2>;
+				slew-rate = <1>;
+				bias-bus-hold;
 			};
 
 			lpass_wsa_swr_clk: wsa-swr-clk-state {
-- 
2.34.1


