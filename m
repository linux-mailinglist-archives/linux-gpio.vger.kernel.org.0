Return-Path: <linux-gpio+bounces-22130-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBB4AE7A20
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 10:30:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3CD217D44E
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 08:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EB6226E153;
	Wed, 25 Jun 2025 08:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lBF3ROC2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402F326C3B1;
	Wed, 25 Jun 2025 08:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750840194; cv=none; b=fdgID0h2AlwN5+HGjIDw2N9Aaq1iCfHnLpK6gWwlOSrhKkJgKcHNs28s2kYv/4J4ZfDtXmLp05hk5Mopxwoheg9bfy8AVDRoUuEoq74CoGE1k1kEVPS0kY0dtPb2QbZGRebTcJI7CF/5zuuCkKkMVvRwnv8Umygk6N2j6aDhZKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750840194; c=relaxed/simple;
	bh=tjMfjjhMK2EhI6k5PFNjW2A2d2cPajyVyeYGjf4ZzjI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gXia/EMvkTrwBlGVXREMOpWSw5LnwDb/xxi6KQ2Ur43LXZFyJmCpM+r+1255lZ2UiGM3riurKREMfyG7h6awfVVltV66wQWv1+xmZXhP2gWowwIEeI6OMQb1Uz32gjQHpqfgLFPdSC5qeuMumUbHD46Si17CeOwxKeWTFfft8zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lBF3ROC2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P50KLW014954;
	Wed, 25 Jun 2025 08:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pjtQED1TE3A
	Uodkcv926+lcViqBoX78hKIEpRe2FRu8=; b=lBF3ROC2fmAOeIBQltQJB9fz7kt
	4fXEpCwS1s+EJWVzYjr0T4UV2lgIzB1FAlcvlbb9IoFzvAplSvcfBbhSAzfEaSbC
	enHE5fPiWOLWgaMqbgGs5WEY0xrpGVvxdbbSketmj0kanpPWacZzOtac6nkwm4iL
	vdztebigxsidx9vxMSI6x1dwU3QFRrAKsgzJ0dNSgAzMHFmLo9W9Ua8O5FXPgoLV
	5sGyy8vDIZMqOrS1FT6Eqo6oZgjUhEp+OcrbKYJqKkAdyXbSs5/u70D6gXIrwXsT
	QBK9GLm5sS/LWPSh6MUNB7B0IXEUd7/cUeXGal31x7VNHyWatfyJq6aJYQQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rpycag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 08:29:47 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 55P8TiQ8032637;
	Wed, 25 Jun 2025 08:29:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 47dntm2eq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 08:29:44 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55P8Thpk032572;
	Wed, 25 Jun 2025 08:29:44 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 55P8Ti2n032617
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 08:29:44 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id BAC115CE; Wed, 25 Jun 2025 13:59:41 +0530 (+0530)
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
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 7/9] arm64: dts: qcom: qcs6490-rb3gen2: Add sound card
Date: Wed, 25 Jun 2025 13:59:25 +0530
Message-Id: <20250625082927.31038-8-quic_pkumpatl@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685bb37b cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=kdNIUUk3XZBdUdgeTlAA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA2MiBTYWx0ZWRfX0a/QsWnjKZlW
 EE/rqlj9x/PPvsLAlmQJZqLYQarLGhkL8JZoxR0iO6LFD/ipMgMTyBbWXs73NY6nRuzZFYmcQWo
 RxNBUXR/tr/V2DURS0b/uYwMj1SM8W8zHq+nsjcxtog9FvMi4D30Te9iX14LqQi5bx5twqS0pim
 sdVQ2sHZKo29VLOXuiBNVvbQ/npiqiaxUAfVHlvFijIrP/rR/cm+EuDx7sd6sY7NB/eKf9JEwIU
 L46eaIhjAQUltxLKTRb4vPt/b7nCxSaA/qjHNmKjYjfUxFoR+hjjuQUmymgWES/83AofSIcbTio
 +6nj+teTHUcveHSfoiiL5AUH9xH5lBFs4hxEArSk1K2tg3+8RYYGQLw7OGFT+V/PiA+An60zt7U
 QTelE9oXeXQPl3iNE0AmQSfHA/oAxX3VaWPTvzQNuJ0xJvBidBR7rZVvvyqIWmXkfi5ozDAO
X-Proofpoint-ORIG-GUID: WItY0-rXFbKWRFfPZg9IZZqc6ykLVTje
X-Proofpoint-GUID: WItY0-rXFbKWRFfPZg9IZZqc6ykLVTje
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=946 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250062

From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>

Add the sound card node with tested playback over WSA8835 speakers
and digital on-board mics.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 45 ++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 82aa69d715d9..4ec3501eecdc 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -1048,6 +1048,51 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&sound {
+	compatible = "qcom,qcs6490-rb3gen2-sndcard";
+	model = "qcs6490-rb3gen2-snd-card";
+
+	audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
+			"SpkrRight IN", "WSA_SPK2 OUT",
+			"VA DMIC0", "vdd-micb",
+			"VA DMIC1", "vdd-micb",
+			"VA DMIC2", "vdd-micb",
+			"VA DMIC3", "vdd-micb";
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
 &swr2 {
 	status = "okay";
 
-- 
2.34.1


