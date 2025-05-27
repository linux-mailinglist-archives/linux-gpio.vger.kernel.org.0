Return-Path: <linux-gpio+bounces-20589-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6902CAC4CEB
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 13:14:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1699B3BF7CF
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 11:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 695B5267B00;
	Tue, 27 May 2025 11:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="J5dxX0Hl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0C925B1DC;
	Tue, 27 May 2025 11:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748344372; cv=none; b=J1BJX+Kz/50j6RXO65Wi4HztehUoZ78wr1YyHlm5ud1Ofe/wkYFdmeQxdgeeHw1+KhJ5lT1f7ehsDV3xB5PW0WTLSVyVnHMbC0tD7yoOQowYX9wFFFgAg4Yu1hoGKNx7o7UihMiRNfQeWs8/jzDkGS11wWZMEvw11lnX6YbWo98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748344372; c=relaxed/simple;
	bh=5r2HvjqiZUVGW/xahOQI+543HT0A/atJY7y6zBKeQBI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Si9KxTX1DcYsjhQbv4O/M3vFQb1arvDMqdt4hGIqXe+LL8Jr1vZ6gDKatWMa0TQgxTiOXw78cnjjt+xFCzkxWNqsXJMsXyvvZYg/DSfq+oXfoNwUmUmHTfc5ttUToewXOxLntyl1EYELFsd4BJedZkYWNyVDbxNoSba04HfNt1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=J5dxX0Hl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RA2VCC022637;
	Tue, 27 May 2025 11:12:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cFPWKgVmNhH
	t9vG6tJY5O1LEscQ+A4Qjw6u5Eha/gew=; b=J5dxX0HlYRt0H7gE6WaurFS1zQr
	gG8ZsJEHsWfTWiiIHvoCSaCAZurPUFYBDkV2gdyEcVIa2Cj74d37cA2eH/qE8gcm
	VuAVjW5QkqgV13f8ZXXAiLEDlZVIV6AxGdLdbOlb0ngVyAYEIsN60YtXlY+enPe7
	Qgslo+cGKMMo/+6pmMvwQHdSom9K7HyvWeM4fGmcuP+Y0nUgXXhK1wu7iEMByruL
	AqWBzmdiDj+R3KNFhDA2AqbGgdGht5hsev0lOIvOHXyG2YophIm9ZLbLD4QKsEeg
	opuQHHQ9UW8AQITKYujC7I/KQbfXfuub1wmdmzVOhPsNcxai4vTtS+WakvA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6b5pq22-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 11:12:45 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54RBCfJ7028182;
	Tue, 27 May 2025 11:12:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 46u76ksccb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 11:12:41 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54RBCfOZ028167;
	Tue, 27 May 2025 11:12:41 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 54RBCec0028164
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 11:12:41 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id AEE565CD; Tue, 27 May 2025 16:42:38 +0530 (+0530)
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
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v4 7/8] arm64: dts: qcom: qcm6490-idp: Add WSA8830 speakers and WCD9370 headset codec
Date: Tue, 27 May 2025 16:42:26 +0530
Message-Id: <20250527111227.2318021-8-quic_pkumpatl@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250527111227.2318021-1-quic_pkumpatl@quicinc.com>
References: <20250527111227.2318021-1-quic_pkumpatl@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=ZcodNtVA c=1 sm=1 tr=0 ts=68359e2d cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=ki5966V2wckrMalOmGkA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA5MiBTYWx0ZWRfX7hhptMI1/hiC
 x+zEkWxJ84MGWQK8RiQ31IkApkt+g4bHnHjX2tL3FfKZBjCo9BkxxsTXZGl0aVPJk15tjecJ+JO
 25JzJ1bfWgI10QyBFMlfwpq3vp80A/MT7yCSWieyBln7IqfyIkqBo3Ao2MNHllULpG+dqxKimOx
 fS3EE3u0bw3sgOh+H4QRPslGB7OptHgMN1ZqjHn5RaC6RHEIqexLbBajlEXchopKZHUh52PlFoY
 WFXvGGJA/PbL6Rui/43bWrNXbWVfZsHfovqGbQORlkpNDjJLjBk1ohD3HlMncg0UDpYEKUVK5Of
 E9nUblnsoLdwQWoSAHMTAAJyb8251KLCuiRopEzFH43zjSpFWxhhGRgJuU9WUr4VGuwgY8n5Lid
 OyHLdF65ztJ1ysegsdKGVpKhL24uiKCkwwcEmXD69NO4BocotfXotHPFVrUj8G5t+oUP6lP2
X-Proofpoint-GUID: x0hVfgBpUuCsUNvVOcdpIm3e63Jazqq_
X-Proofpoint-ORIG-GUID: x0hVfgBpUuCsUNvVOcdpIm3e63Jazqq_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 spamscore=0 clxscore=1011 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270092

From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>

Add nodes for WSA8830 speakers and WCD9370 headset codec
on qcm6490-idp board.

Enable lpass macros along with audio support pin controls.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts      | 96 +++++++++++++++++++
 .../boot/dts/qcom/qcs6490-audioreach.dtsi     | 24 +++++
 2 files changed, 120 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 7a155ef6492e..884abbda74fd 100644
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
@@ -716,6 +757,54 @@ &sdhc_2 {
 	cd-gpios = <&tlmm 91 GPIO_ACTIVE_LOW>;
 };
 
+&swr0 {
+	status = "okay";
+
+	wcd937x_rx: codec@0,4 {
+		compatible = "sdw20217010a00";
+		reg = <0 4>;
+		qcom,rx-port-mapping = <1 2 3 4 5>;
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
+		qcom,tx-port-mapping = <1 1 2 3>;
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
@@ -725,6 +814,13 @@ sd_cd: sd-cd-state {
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
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
index 542a39ca72bb..2e75e7706fb4 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
@@ -29,6 +29,30 @@ &lpass_dmic23_data {
 	bias-pull-down;
 };
 
+&lpass_rx_swr_clk {
+	drive-strength = <2>;
+	slew-rate = <1>;
+	bias-disable;
+};
+
+&lpass_rx_swr_data {
+	drive-strength = <2>;
+	slew-rate = <1>;
+	bias-bus-hold;
+};
+
+&lpass_tx_swr_clk {
+	drive-strength = <2>;
+	slew-rate = <1>;
+	bias-disable;
+};
+
+&lpass_tx_swr_data {
+	drive-strength = <2>;
+	slew-rate = <1>;
+	bias-bus-hold;
+};
+
 &lpass_rx_macro {
 	/delete-property/ power-domains;
 	/delete-property/ power-domain-names;
-- 
2.34.1


