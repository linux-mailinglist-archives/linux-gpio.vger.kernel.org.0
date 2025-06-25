Return-Path: <linux-gpio+bounces-22133-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F639AE7A2A
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 10:30:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C96F51BC7153
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 08:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B0A926E71D;
	Wed, 25 Jun 2025 08:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eZSQDx54"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA3826CE39;
	Wed, 25 Jun 2025 08:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750840195; cv=none; b=FCTtP69XaKp9scrzXjiqhvZ3cCUgFr+8+KBPxsPullDkLTb+Bq1sLq1P5IpYr9420fFJsXZKveN/QH4osmb61FBxvChbnP4Z0SiPp0r7OnlHegJ7HVPv/0d2MG1MsM5cdWmz7VluRItf8VFm/ZRmDk5ucZ03wNNSgqFGcWMAdk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750840195; c=relaxed/simple;
	bh=Pn0IAq+EW3ZPpfC2bBtXNhslVya1++GpwORTqaNMocw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rN1YrVkFfBve6KEI4dRCWc79p4aA7hzWtzxG51C2Bo6Szu8Aw4Cp5dNUjC1itdBnAQziu6zHcWQN+m125pMtYIos7ot3BIm+IsgFjmGBzibE83fX/6qvIfcQFByW1jLE83M2XuZHIQOs3wCxrRHGxnSRthWfUsT3e2fQhW6N9Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eZSQDx54; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P3iWDM014481;
	Wed, 25 Jun 2025 08:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Dal1OWBcSXu
	ztEXKmLQhnv0TMe5eFbyOMUlSVoNQl1E=; b=eZSQDx54bIUwqyQN0WjukPDazGJ
	ja9A18CV5nJBIz7I2G6pWxMs0MmkV4WC0TCkLbQZNmdzKtJwAjy5she8mdyCkApG
	3VIEefccmshTFNkqloDtY9bxjNhBdYo9zcqZ57L5NRwvXSEl59BXVQlAz9kwK6uj
	wfsChJLw0Tv4Z1vT8C9xW37DFYZmPQPli1yBV6BmW/DqhrNjZBwVnFG2GXSG7cFZ
	fHRc4EebDtgVAfzEvIFXFN/r9x2hhDqmxO2T/29LOm/jBnOQFH6sJYrYBBE63c10
	oQnmnZjG59LhD0D3N66opaUBKYF011OWT8TsW366GRlDZPVI87BT9c0tSnA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5r636-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 08:29:47 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 55P8ThPr032600;
	Wed, 25 Jun 2025 08:29:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 47dntm2eq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 08:29:44 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55P8ThBi032573;
	Wed, 25 Jun 2025 08:29:44 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 55P8TiU4032615
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 08:29:44 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id C3C505D0; Wed, 25 Jun 2025 13:59:41 +0530 (+0530)
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
Subject: [PATCH v5 9/9] arm64: dts: qcom: qcm6490-idp: Add sound card
Date: Wed, 25 Jun 2025 13:59:27 +0530
Message-Id: <20250625082927.31038-10-quic_pkumpatl@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250625082927.31038-1-quic_pkumpatl@quicinc.com>
References: <20250625082927.31038-1-quic_pkumpatl@quicinc.com>
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
X-Proofpoint-GUID: 35IMiFKRx-ag7QkZqdXt2xLPEYv0eCmB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA2MiBTYWx0ZWRfX0+wg984PgDP+
 owJDQLskVF2NFEg//gJj65pCU5HtjXvbhZj5qevxzlnJ3Da6Ir/6cGSRboOq53dklK0nQbQLYtd
 aLCWM1Jfy34ekYu5tX+1z+LTid7yBGu1AwRRF4ZKjdF+A+1/ay8+640KcmkL5J//qHOf32hdNRM
 JoAjFHDv+v4N4HbJMEai2PwYs+ZG//lisdVgyGaUnl9/zFMgT1fUgsrrf8dgz3MCcUw87ucqeFn
 yWbZPyWMsTNTfUDUkYmjfwtRq7h0qurlbHOOEP/sYYIWcirLen+LXowwrdiQo0rwp5ORO4oCv+h
 1Gw74+oCpKk8sMN3K+VqtrBKb7NCNDfKHWyjOBnBuArHP3EOILmB49tf734g1cuUIWKUrJEIRJh
 uTYKg+m3QmzoVPgugE6qz49JavIhHZqxAhO5pSOxI5voKSwYLUwvalw4aNgx+lSNsNOvHR9o
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685bb37c cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=h_l79siUWkRGThfnGhIA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 35IMiFKRx-ag7QkZqdXt2xLPEYv0eCmB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250062

From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>

Add the sound card node with tested playback over WSA8835 speakers,
digital on-board mics along with wcd9370 headset playabck and record.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 84 ++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 468f5f9c0779..acc338e9b60a 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -757,6 +757,90 @@ &sdhc_2 {
 	cd-gpios = <&tlmm 91 GPIO_ACTIVE_LOW>;
 };
 
+&sound {
+	compatible = "qcom,qcm6490-idp-sndcard";
+	model = "qcm6490-idp-snd-card";
+
+	audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
+			"SpkrRight IN", "WSA_SPK2 OUT",
+			"IN1_HPHL", "HPHL_OUT",
+			"IN2_HPHR", "HPHR_OUT",
+			"AMIC2", "MIC BIAS2",
+			"TX DMIC0", "MIC BIAS1",
+			"TX DMIC1", "MIC BIAS2",
+			"TX DMIC2", "MIC BIAS3",
+			"TX SWR_ADC1", "ADC2_OUTPUT",
+			"VA DMIC0", "VA MIC BIAS3",
+			"VA DMIC1", "VA MIC BIAS3",
+			"VA DMIC2", "VA MIC BIAS1",
+			"VA DMIC3", "VA MIC BIAS1";
+
+	wsa-dai-link {
+		link-name = "WSA Playback";
+
+		codec {
+			sound-dai = <&left_spkr>, <&right_spkr>,
+				    <&swr2 0>, <&lpass_wsa_macro 0>;
+		};
+
+		cpu {
+			sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
+
+	wcd-playback-dai-link {
+		link-name = "WCD Playback";
+
+		codec {
+			sound-dai = <&wcd9370 0>, <&swr0 0>, <&lpass_rx_macro 0>;
+		};
+
+		cpu {
+			sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
+
+	wcd-capture-dai-link {
+		link-name = "WCD Capture";
+
+		codec {
+			sound-dai = <&wcd9370 1>, <&swr1 0>, <&lpass_tx_macro 0>;
+		};
+
+		cpu {
+			sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
+
+	va-dai-link {
+		link-name = "VA Capture";
+
+		codec {
+			sound-dai = <&lpass_va_macro 0>;
+		};
+
+		cpu {
+			sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
+};
+
 &swr0 {
 	status = "okay";
 
-- 
2.34.1


