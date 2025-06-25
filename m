Return-Path: <linux-gpio+bounces-22132-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB00AE7A26
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 10:30:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3EC01BC70CE
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 08:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E585926E704;
	Wed, 25 Jun 2025 08:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gkkrioUd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8F326CE19;
	Wed, 25 Jun 2025 08:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750840194; cv=none; b=YfmVmMIK6edqdsXsts9XVnjN+1qs7AV05p6VjAnxnGKWGtax7kl5YQDYzv0eNK0Jpoh9D+WYjFpdH5ljCYuJkAZTWB/DFlYbowry1ZP+I2IPlC/zv17RX2KizP4c4aQc7Scf7UpPDM24xpfWQO7eXd1c9HWt+i4dd1ys/TMQ/oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750840194; c=relaxed/simple;
	bh=ijpRhTR6PWSYGjtcpfFwHc9HNsapCeDCM6utC5+wTMs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H1StXd6L2uyGHOk3VypweWS/7spsZMXxzaWH6Rc8uJguTnnpLdTTj8daNPXXrmhFtUbgKoaCqwZ2qY8LW4wD/Sm3yTRI9zkFHdSdsOOddrcfAbHF8q0epeYyibhFaw/lVMKsX92NlRFVJ6OsVMdtn6eXk8C2PvOZ1SVH+mXjA/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gkkrioUd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P5s9G9013999;
	Wed, 25 Jun 2025 08:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iS2iFGHEVUv
	q0kO7teYWF6ZjfXEcbA5nKVDMLZZgyLE=; b=gkkrioUdo4OT64JZKrUzPjBhsY6
	3jHU7udPosrsR7N5wwrUFJnS8E315DTJumtz36jvzvZ8ZZJBtKQ02+xFNVNkX0r4
	9MaKXqEOxY2FDA6C5u4mR/AYC73sXO1S1y8en8+8g6+agowPJ1m6BorCvgRkJGeX
	abJ8M/HUhnr8ooxwyrcwcf/yvvjiXwUKL44CgqORLsPwUKIz+bAPGzYb/p7bFePN
	zL79OyhLapdWFprLeaF3yNDMs6PsjZpQvlvgHrruJPA2F7eT1X+hLxvWqpyjAzyf
	770Fq7D9/2yziUWA+lfzq7twhnUjXhtG+yyC2vlTr5h0vILTDp/1KoHTUmw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5r635-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 08:29:46 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 55P8Th3R032599;
	Wed, 25 Jun 2025 08:29:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 47dntm2epj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 08:29:43 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55P8ThBg032573;
	Wed, 25 Jun 2025 08:29:43 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 55P8TgHS032567
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 08:29:43 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id A29C55C8; Wed, 25 Jun 2025 13:59:41 +0530 (+0530)
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
Subject: [PATCH v5 2/9] dt-bindings: pinctrl: qcom,sc7280-lpass-lpi-pinctrl: Document the clock property
Date: Wed, 25 Jun 2025 13:59:20 +0530
Message-Id: <20250625082927.31038-3-quic_pkumpatl@quicinc.com>
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
X-Proofpoint-GUID: v-QLNJ8DlcSwmOe-rQHQ5baVVo0uIw_6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA2MiBTYWx0ZWRfX1hujUY/YB/AV
 /ZDeYKppK64Pg7Yx36WuQ2JFycGx5Zr4LJNk/PfesYGNSKP4uUP5Ely3VB8rnXncLPXwM15DtIw
 aCbO6KMyVXFmeymVFUK/IbP2DSP7T/C7Dx/a2AY3ihR2/+qZxXuezY8LQMGwb+z98x0xp4NJRQc
 RR0vz4Wxyd0HLW35SnscehF7lKCoHne7muf/5Qzv9LUgmgQq2vxiWrTAjHIiE5H1NHrLIR0DKRE
 OoBAWGB/0xc+nmWWnuBpO63iKSLBWPpdFR+ocjkSckNiSlbanNEQ4GbznBsE4prI3dMJXHyDuaf
 lMfE/695pHj/+ykm+vnCUj3Nm1RMOdnR29Xau3XVu0damcZXDdWp9nrd378ccGHQZcEuCgnJDUk
 R1GdHpLwGBqCmECOjoBnKb6Z11MkrsI3co5z1rtpSxyZR9aKTPUkdp81nmi0jWX4bPrne6Ay
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685bb37b cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=0APC2i8stGO4cs4CAB4A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: v-QLNJ8DlcSwmOe-rQHQ5baVVo0uIw_6
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

Document the clock property for sc7280-lpass-lpi-pinctrl driver.
Clock settings required for Audioreach solution.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
---
 .../pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml   | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
index 08801cc4e476..bc7b8dda8837 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
@@ -20,6 +20,16 @@ properties:
   reg:
     maxItems: 2
 
+  clocks:
+    items:
+      - description: LPASS Core voting clock
+      - description: LPASS Audio voting clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: audio
+
 patternProperties:
   "-state$":
     oneOf:
@@ -70,10 +80,16 @@ unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/sound/qcom,q6afe.h>
     lpass_tlmm: pinctrl@33c0000 {
         compatible = "qcom,sc7280-lpass-lpi-pinctrl";
         reg = <0x33c0000 0x20000>,
               <0x3550000 0x10000>;
+
+        clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+                 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+        clock-names = "core", "audio";
+
         gpio-controller;
         #gpio-cells = <2>;
         gpio-ranges = <&lpass_tlmm 0 0 15>;
-- 
2.34.1


