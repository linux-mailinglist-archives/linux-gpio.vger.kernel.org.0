Return-Path: <linux-gpio+bounces-23535-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A9758B0B77F
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Jul 2025 19:52:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F33267AA817
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Jul 2025 17:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E31A5220F59;
	Sun, 20 Jul 2025 17:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="omsfr4Ew"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3B574C08;
	Sun, 20 Jul 2025 17:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753033925; cv=none; b=itibNVEsdf96FQ1f71OOLD8YjrdeGSMABiqT83i58hXFJJHmOECMs4wry1rezkWAyd7XxSmH2b1mrxbBeWneUI3YqhwywA0Qxb6ZpY3PMWBJ56C+W4BlkpvPNMnx+02JQgDMtHXgZu73T03+P+ebLGqsWp4ek0e3JcnmdWWSbDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753033925; c=relaxed/simple;
	bh=5V5FukWutqy5q8btDXGs/VZ9KO6Wq+n/jZt3asgpjfI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=te3kX/Cldz6nQ6StYOGk0vvmdZ44+HWpJEkQmn0dodSlACTCz/cfKKwV+cT1aS/9MkEEMXeItr6iyVmROxvjx1IsdAFI2c8Ax4mnNVRTfnLAx1dNHOUzz4zprF99YG5MkKO3e5y0qGuBCceo2T+zUnKv8bL2Wpt8QOYODGb6V+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=omsfr4Ew; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56KHH3IO021653;
	Sun, 20 Jul 2025 17:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=O4izwkU5brV
	wxDtYbX8mFBFQjnyHl0QdjF5QKKCxvfs=; b=omsfr4EwY7RnAX+2XVxcx6In25o
	vLsKLo1B960ul9IK7cKt/z1vjsQ74tDSwGcw6/pQCDJn58Oo8rttnus3BPiL48sK
	RMeZ0mI2bqmufkJtGmVeMRFCyC9eQleN9RBiQ3D4g1qOPbQrKDJEWzvCBoWTkqXt
	gvKM5KhUfiy7RsmDG9dUf/20NGCL1XSENIUHXiN3Fgbo1JbD9PyP4i1srBrrPB9S
	jXsNiBTNXvkqY1uqMMeukFhuMFQhQSeAIJ9WauXR0LJxAK+WABZ2TN33fUldDvSs
	xKVjOnghzpj1/2Sb8OfyQ3vaeKGfzhn/4olyWpIH2qiABw3ZcZ5trG2DMew==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047q2jna-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Jul 2025 17:51:58 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 56KHptuT013286;
	Sun, 20 Jul 2025 17:51:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4804ek9d4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Jul 2025 17:51:55 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56KHpsgR013263;
	Sun, 20 Jul 2025 17:51:54 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 56KHpsFs013262
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Jul 2025 17:51:54 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 117825CB; Sun, 20 Jul 2025 23:02:18 +0530 (+0530)
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
Subject: [PATCH v7 2/9] dt-bindings: pinctrl: qcom,sc7280-lpass-lpi-pinctrl: Document the clock property
Date: Sun, 20 Jul 2025 23:02:08 +0530
Message-Id: <20250720173215.3075576-3-quic_pkumpatl@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250720173215.3075576-1-quic_pkumpatl@quicinc.com>
References: <20250720173215.3075576-1-quic_pkumpatl@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDE3MSBTYWx0ZWRfX52HlZTUOn+Zm
 fDhyBL9Me8+GxRUQwtTQKZnpr/3ScTMS7y2gruR3YwtvkI+vmSPy7VsdQ6WFHmH4CHfhVrk2AJo
 bFbBliWuVzJPL6WH+kANsAQjKrtxiua7sl27+AhtwOyJ2Mv18tSVqJCCPF3BFF7+xHwXbu4ajDp
 CcOGCfZQO4Jw6EoJE3Po9C5xiykAdJj7cW/551YsgaoZPkmkS1Hc4roTZVs9mQ3Qdpq1XHnGrdf
 CCsB07LyFgPJoF3z+Q4rhgXdg7c4XgPUX1PoCEOSYuYMbTthm4hFthrXaaivYrHzj2hNQDG8XPw
 /5q9Z0xrFrkLiJqbzXJL0mzFv74P8Tl2vW6v1QDK9RLsLCiDsC+HZP+FaRgCs0ZCAUifLKSYcor
 49NNJ4nWo94iVrECO7TxXnEJVPDJXc9ocPrADHPxFtTSnfyyI7mMwNfvwxxUhBDq8QMiNUMy
X-Proofpoint-ORIG-GUID: 6yBuV_dkfdQR2P-V_f2_ZwdIs6zeE1k2
X-Proofpoint-GUID: 6yBuV_dkfdQR2P-V_f2_ZwdIs6zeE1k2
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=687d2cbf cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=pSc1PWz_11YsA2FjbjAA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-20_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507200171

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Document the clock property in sc7280 LPASS LPI pinctrl node.
Clock settings required for Audioreach solution.

The existing SC7280 platform only supports non-ADSP audio solutions.
To enable audio functionality on ADSP with the AudioReach solution.
additional core and audio hardware clocks must be configured.
Without these clocks, the ADSP will crash.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
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


