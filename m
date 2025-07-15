Return-Path: <linux-gpio+bounces-23311-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F83B065B0
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 20:07:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEB871AA5926
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 18:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C22729DB99;
	Tue, 15 Jul 2025 18:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="By6/trEC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDE429B8F8;
	Tue, 15 Jul 2025 18:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752602836; cv=none; b=s3Xh+hKnJDGpKD1UPBWR/c655dPGQtCDpIMt25phicWIn1C1AfQuTpFGFrYIZK0F8O0Pv3toRfdDKTgrTDX8YQCxImMqkFRUnTP4yAAkEvry6SojU24mq2SsCJFbAKzCddZx4voGNgXamhS9JSKiTWg++TNV2oD2m5cqQEjDhW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752602836; c=relaxed/simple;
	bh=LFjtJtIYQfeOigMfDQrVVWqhmATYJ+CXsjPvNYeS40U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SnLfwgL9F+zRO+CtmljgYgoHtp3vCQjiaii0BXRRgnPORKhAPRQmsa8sKM2mM7TvaWl9cfsbagwgB+Lt3H+IsO8Hb1wwrMaRykyJZ9rSKJi+rTOuE7JjTsGusDmdQWK+cPIMiAFmf/9UgQvTDlfJuzNvi+JgMVqBsjzQx5+s0CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=By6/trEC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDMfC029564;
	Tue, 15 Jul 2025 18:07:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EzpIBOReFk3
	KeoRaeLqcoZk+wik9ibKtPqyK+WpwnHM=; b=By6/trECqbMRNwIytTIKmrc69LQ
	U55pGNmiBj1oKgFLsJcFHBz3COnOL73xln6dQE/yeACpRSV04qLwpbCIbIKnQMdY
	nge+yJM7B2+OLqnSHWKzUhLbOhkuIw8w43ybj+5H1JFyz6DtgdnhPn+MNxYeFxx4
	0cAGGWTH3Bd2yoFahVTMcw4QPmcFfdN04ef5kOhVrHaKY04aawwFgvAxlu4Z/IBR
	1WfLrrGoXY/0j19thuj+xH7Dt0smjgsCINFyYMJpUXncTqV8ThE1pgbMKTqXvOsP
	ppCP7C29yidmk+4/zamCPuq21qkBzzchR0DH62AMovJLRG1vFkXu5Zv8NsQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxb195d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 18:07:09 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 56FI56Uq026635;
	Tue, 15 Jul 2025 18:07:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 47ugskwyww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 18:07:05 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56FI75w8028669;
	Tue, 15 Jul 2025 18:07:05 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 56FI74Zs028666
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 18:07:05 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id BBB7A5CF; Tue, 15 Jul 2025 23:30:52 +0530 (+0530)
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
Subject: [PATCH v6 6/9] arm64: dts: qcom: qcs6490-rb3gen2: Add WSA8830 speakers amplifier
Date: Tue, 15 Jul 2025 23:30:47 +0530
Message-Id: <20250715180050.3920019-7-quic_pkumpatl@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250715180050.3920019-1-quic_pkumpatl@quicinc.com>
References: <20250715180050.3920019-1-quic_pkumpatl@quicinc.com>
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
X-Proofpoint-GUID: eEnXmChlYV5oKPgRicT7i6dBSugUEIHK
X-Proofpoint-ORIG-GUID: eEnXmChlYV5oKPgRicT7i6dBSugUEIHK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE2NiBTYWx0ZWRfXzfB81pAhdl3A
 wTqsq5UCTnKwpo/jtF+AdsCFUXl9opHO3ABrttd884Q1U+ylJKe8ZGrPukWiAvwJwsw/KqHLmMp
 cZDPA/78l1+o8VnQh71lb8xYGsnnveOK/V+BZ6f1rDH9Kmdggeiw2jEXZJz+a9+IcYl2uk1Uwk9
 Mqjrm+jBzomU93UrRzGj1xKB+cVBJYHKqfXxB2psygvyyw1SyD1mF+sWtvi01bofAC9XdYRDRfd
 T+J1rlhwszsaFFaSV7Gi45aGHvtYp1RMyxpQngHFWeQar/KhzZXQpc8vVmaqG7b+lyeQj41PbUv
 /cOQho1cIDX4Wv3opf92FpJa3GfFxjtffTUh7npLoMD8VJClIsF8I2ZRGxn4IXsJHO9wKKdUrfu
 nlC7XLRUSRGB6NwvlN2Ylxq4/Twwxu4rPpn4s5levPZQm3FF2oxAp0iFokAiDSqa4CNoYNY1
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=687698cd cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=hJjRmVYgJ_m-HbgvpU8A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150166

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Add nodes for WSA8830 speakers amplifier on qcs6490-rb3gen2 board.

Enable lpass_wsa and lpass_va macros along with pinctrl settings
for audio.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
---
 .../boot/dts/qcom/qcs6490-audioreach.dtsi     |  6 ++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  | 35 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi          |  6 ++++
 3 files changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
index 6d3a9e171066..078936237e20 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
@@ -58,6 +58,12 @@ &lpass_va_macro {
 	clock-names = "mclk",
 		      "macro",
 		      "dcodec";
+
+	pinctrl-0 = <&lpass_dmic01_clk>, <&lpass_dmic01_data>,
+		    <&lpass_dmic23_clk>, <&lpass_dmic23_data>;
+	pinctrl-names = "default";
+
+	qcom,dmic-sample-rate = <4800000>;
 };
 
 &lpass_wsa_macro {
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 5fbcd48f2e2d..82aa69d715d9 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -19,6 +19,7 @@
 #include "pm7325.dtsi"
 #include "pm8350c.dtsi"
 #include "pmk8350.dtsi"
+#include "qcs6490-audioreach.dtsi"
 
 /delete-node/ &ipa_fw_mem;
 /delete-node/ &rmtfs_mem;
@@ -765,6 +766,14 @@ redriver_usb_con_sbu: endpoint {
 	};
 };
 
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
@@ -1039,6 +1048,32 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&swr2 {
+	status = "okay";
+
+	left_spkr: speaker@0,1 {
+		compatible = "sdw10217020200";
+		reg = <0 1>;
+		reset-gpios = <&tlmm 158 GPIO_ACTIVE_LOW>;
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
+		reset-gpios = <&tlmm 158 GPIO_ACTIVE_LOW>;
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
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index ff5b3568c39d..fff92fd836ab 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2872,21 +2872,27 @@ lpass_tlmm: pinctrl@33c0000 {
 			lpass_dmic01_clk: dmic01-clk-state {
 				pins = "gpio6";
 				function = "dmic1_clk";
+				drive-strength = <8>;
+				bias-disable;
 			};
 
 			lpass_dmic01_data: dmic01-data-state {
 				pins = "gpio7";
 				function = "dmic1_data";
+				bias-pull-down;
 			};
 
 			lpass_dmic23_clk: dmic23-clk-state {
 				pins = "gpio8";
 				function = "dmic2_clk";
+				drive-strength = <8>;
+				bias-disable;
 			};
 
 			lpass_dmic23_data: dmic23-data-state {
 				pins = "gpio9";
 				function = "dmic2_data";
+				bias-pull-down;
 			};
 
 			lpass_rx_swr_clk: rx-swr-clk-state {
-- 
2.34.1


