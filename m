Return-Path: <linux-gpio+bounces-20583-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66323AC4CD8
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 13:13:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 089CD17D9E4
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 11:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0333225D1EF;
	Tue, 27 May 2025 11:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="S5d8nE/2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3071F258CF0;
	Tue, 27 May 2025 11:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748344370; cv=none; b=N3YYpR2yUp+1uODgbqZoEKaQaIiIENwxjv+AvyRyNhqfJljNJqXhitvIiUDbHPmNa34KxnBnKDpzRhUtazoJyieuxTc5I032ohrAK+t8m7AqCm7nPXypq/WRVRJ1+jNh6Kahn4MIFyAYXha+GQ+VTBfd0mY6srb+3WgIYA33m2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748344370; c=relaxed/simple;
	bh=JqbXp/muyf9e41DxRebenJaD5Vf8NFffo5uRxn4/L1I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eRFqTKxJiOswu0/kxw/XefTXFWgz7KBEsV4AuaYBbT5CNG3BQaUUD0Oq2n20n+R238DEGJlJmdQp75289o+ekT19Ufa2t/K2MQKo4sVeubx4lpYaILST/NZWiTSWhTvTmF1a+8xJFiVXOKZeI1kSxL3nLfg4xBDnFJ0E8ep1s40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=S5d8nE/2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R9YxPG002206;
	Tue, 27 May 2025 11:12:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Tkd+HkT0UPu
	G0gngYP0A12gsjHGBm+byOYeO87P7ouw=; b=S5d8nE/2kC+WlcjZvKn5d79lXbj
	V1LCAjBV5PHEqV9BsZL2w4qm7fLPEWdFYaMqkX/o1ybWoRdcqi6z/ONc30gvA3ZH
	B9onrG7c4fg8JnFmndigvWUbR7eK3t8FZnX8SUvPwb9d3WqcZejIHA0md1+J7t8k
	xCRbmQC2pbX9WT5jsqSxN+pV9++sqz24NwLYQTOpQxHRB8qaORI7+P7DfFEggF6j
	o/qI+VGt6TNgAUS6P8Ggom7UxOrsMB+WnjomIAA4Vw36WhI2mfNQri+eg6XR7Bej
	DwMscV0VDQX2WGSxC2gxqwKpOH194aF2n52GDDydoeIaoFhOxuyOv+25Kcg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavkr97q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 11:12:43 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54RBCeI1028137;
	Tue, 27 May 2025 11:12:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 46u76kscbt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 11:12:40 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54RBCdJo028107;
	Tue, 27 May 2025 11:12:39 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 54RBCdYF028101
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 11:12:39 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 9ABB25C9; Tue, 27 May 2025 16:42:38 +0530 (+0530)
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
Subject: [PATCH v4 3/8] arm64: dts: qcom: sc7280: Add WSA SoundWire and LPASS support
Date: Tue, 27 May 2025 16:42:22 +0530
Message-Id: <20250527111227.2318021-4-quic_pkumpatl@quicinc.com>
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
X-Proofpoint-GUID: OaWYoxW_CuJsPwHVnAA2PI3Qytfc95KM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA5MiBTYWx0ZWRfX2UBve+iGd2mY
 alOrDhORxC7yfo6g+7qTrlH5av1B18AISm2s0An2Vne4NJaQRm3uDnuYWG33k3d2PL9799BqXOI
 rW1nijok74JA1mff99c040GyEH7SpRiXiu3w+f50XrQ/7jbizhhNkTCBurDzmCPmtqVNDN4yXRY
 NKY1Mzv6WFnCwl77ucnRkoHDW3K8yueFAk2wuhriQM9vkMzxc/ARuhpkNpTYjBNgKzYb0D9081E
 ltLedWloA/H1/qSnxdIi46c+dRD6QRIkQzA6u57ycfi5rL8Vj1XSU5/yo2NW8gcTkAd/VeJ0PPc
 thMQwoPhLgQJYGlHxwvPT9MmtwpXAJ/C0OikgrHeuc8/zRmn6bg8qxMaB7QqoATgvWiwst5b3g8
 u8NlMFINp3Pe5p+8mw/LIBd2p5d9WZUpclR5uN5zwdFlpGq7S3S1YWrRmd/XhzerZ5l0IC+s
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=68359e2b cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=Hk-fo3U6da086cNuBgYA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: OaWYoxW_CuJsPwHVnAA2PI3Qytfc95KM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270092

From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>

Add WSA LPASS macro Codec along with SoundWire controller.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 76 ++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 708df3f08984..d7460d67f35f 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2636,6 +2636,66 @@ swr1: soundwire@3230000 {
 			status = "disabled";
 		};
 
+		lpass_wsa_macro: codec@3240000 {
+			compatible = "qcom,sc7280-lpass-wsa-macro";
+			reg = <0x0 0x03240000 0x0 0x1000>;
+
+			clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>,
+				 <&lpass_aon LPASS_AON_CC_TX_MCLK_2X_CLK>,
+				 <&lpass_va_macro>;
+			clock-names = "mclk",
+				      "npl",
+				      "fsgen";
+
+			pinctrl-0 = <&lpass_wsa_swr_clk>, <&lpass_wsa_swr_data>;
+			pinctrl-names = "default";
+
+			power-domains = <&lpass_hm LPASS_CORE_CC_LPASS_CORE_HM_GDSC>,
+					<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
+			power-domain-names = "macro", "dcodec";
+
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
+
+		swr2: soundwire@3250000 {
+			compatible = "qcom,soundwire-v1.6.0";
+			reg = <0x0 0x03250000 0x0 0x2000>;
+
+			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&lpass_wsa_macro>;
+			clock-names = "iface";
+
+			resets = <&lpass_audiocc LPASS_AUDIO_SWR_WSA_CGCR>;
+			reset-names = "swr_audio_cgcr";
+
+			qcom,din-ports = <2>;
+			qcom,dout-ports = <6>;
+
+			qcom,ports-sinterval-low = /bits/ 8 <0x07 0x1f 0x3f 0x07
+								0x1f 0x3f 0x0f 0x0f>;
+			qcom,ports-offset1 = /bits/ 8 <0x01 0x02 0x0c 0x06 0x12 0x0d 0x07 0x0a>;
+			qcom,ports-offset2 = /bits/ 8 <0xff 0x00 0x1f 0xff 0x00 0x1f 0x00 0x00>;
+			qcom,ports-hstart = /bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-hstop = /bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-word-length = /bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-block-pack-mode = /bits/ 8 <0xff 0xff 0x01 0xff 0xff 0x01
+							       0xff 0xff>;
+			qcom,ports-block-group-count = /bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff
+								0xff 0xff>;
+			qcom,ports-lane-control = /bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff
+							    0xff 0xff>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
+
 		lpass_audiocc: clock-controller@3300000 {
 			compatible = "qcom,sc7280-lpassaudiocc";
 			reg = <0 0x03300000 0 0x30000>,
@@ -2839,6 +2899,22 @@ lpass_tx_swr_data: tx-swr-data-state {
 				pins = "gpio1", "gpio2", "gpio14";
 				function = "swr_tx_data";
 			};
+
+			lpass_wsa_swr_clk: wsa-swr-clk-state {
+				pins = "gpio10";
+				function = "wsa_swr_clk";
+				drive-strength = <2>;
+				slew-rate = <1>;
+				bias-disable;
+			};
+
+			lpass_wsa_swr_data: wsa-swr-data-state {
+				pins = "gpio11";
+				function = "wsa_swr_data";
+				drive-strength = <2>;
+				slew-rate = <1>;
+				bias-bus-hold;
+			};
 		};
 
 		gpu: gpu@3d00000 {
-- 
2.34.1


