Return-Path: <linux-gpio+bounces-23312-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD3EB065B2
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 20:07:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 784BA7B582A
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 18:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C7BF29E0E7;
	Tue, 15 Jul 2025 18:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NMY0YS8C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2202425A331;
	Tue, 15 Jul 2025 18:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752602836; cv=none; b=VUwarhZyvLK2MHPga2huAFYPt7y9Sw23rbARVC6YVtU4fgzKejV5mjYdF+djDIBrNY7weF/dg/jMJFcwHzICR2Qhw4WjfpcCAFcOL9aN07mbRDN6WYTNMJciYfZ4ASdGfcO/W9G30lDCnjk6iZvmFmAN7wISrMlVHpQCidykQiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752602836; c=relaxed/simple;
	bh=PX+psShCa0JhAJumdi9Xtm3VB6Ptcfw5WZ33DOMny4c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Sic9VgdAkit40mMT71HbIXTFhJkxutc6mtxLgmwmhCWczF+ELy3Fkzlf/f5dPI/AZFR2fBBN4qwYm3UnyFwQV3S4KBudTPGKLpEhli6ZfKTFkXpvB0hyikKRlxoUxVAHm661By0STmtXDEhJggXcMaa2lXSj7bY3fvMM2FMxEVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NMY0YS8C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDXAI018425;
	Tue, 15 Jul 2025 18:07:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1oHGbCDJ0rf
	iZ3Iq7h44Y7cGVbLwmNMvYnJZkqSlRig=; b=NMY0YS8CK6LO7a/zymZQ9TjrxBu
	/eJevw6KD+9sY5OyJS6yiDsAo2Xx/X6af8HcgalpIWqT2JSRJSOSxassp45A+ICH
	2HCJs7jbj4IbuE/ML9qcTlTtpuS3F4fWM2sCDS86u2n6rJfm3WgaZBiI1dbdyG/V
	ojRS9jDscOq+MAoeDP17Ttt49e4K/z0kJ4rtuCy7qC+ukdaE7i9e/e3m9HLfv37s
	lHPJPq1anAB4ZkNOISq4IDPpSCumrIGRoNt4UmPGhNPTOFnpl4Yx9uR+1PCOyQ4t
	3Gv+rHPoM337VnbFeIZIhH8E6SfI9wWfQSQKB2ZA//I1CRiXs9iAyGcVVlg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug381bh8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 18:07:09 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 56FI75Jn028696;
	Tue, 15 Jul 2025 18:07:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 47ugskwyxd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 18:07:06 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56FI76OE028713;
	Tue, 15 Jul 2025 18:07:06 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 56FI762m028710
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 18:07:06 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id A854D5CA; Tue, 15 Jul 2025 23:30:52 +0530 (+0530)
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
Subject: [PATCH v6 2/9] dt-bindings: pinctrl: qcom,sc7280-lpass-lpi-pinctrl: Document the clock property
Date: Tue, 15 Jul 2025 23:30:43 +0530
Message-Id: <20250715180050.3920019-3-quic_pkumpatl@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE2NiBTYWx0ZWRfX6AKm0QI+cBdl
 KWg4U6O9t0C/MVvkOBRimIHL4C6EmyhlAHCVP9Xi6FuH2CuJSAeA/cdK3odViiwlemVO3g83b20
 KE0GSVOAqOssfksji19b7TBjKpjptpnKit96v+vtNj67YxtqPgOV3A3WXOAEGJ2QVumtcmWS5Tq
 zhPnyO+3KhpZ4Y/Z3i0QMfXJlDgpnrJNoKOLLazpaqOgNusNQMj8pHdKdsuIgnsz03qKiLYRnzz
 jJ7GZ95wapUj+ChD0PyBwhdjMLx2N4Fm1u1AbHpeyHWq1n76FdeLcXWYYm4uVooeo5cB1ZiURWm
 wr1/gyeRLa9qYm0EvvFmVBkcejT8UjyppF4L1yg7mUV+7f8gc+53BMBcK329N+mVybQ1NhpNQG0
 5vguheWVVy7oJTfZoWA9ZFcctEuil0DVMuiHZEP6CTqFDKzmAPKO+AjZXiabavqdmZpG39JL
X-Proofpoint-GUID: pHg6-BJTJz7HBTqz_iM6BWyRyRSki_z5
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=687698ce cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=pSc1PWz_11YsA2FjbjAA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: pHg6-BJTJz7HBTqz_iM6BWyRyRSki_z5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150166

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Document the clock property in sc7280 LPASS LPI pinctrl node.
Clock settings required for Audioreach solution, ensuring
proper initialization and synchronization of the LPASS LPI
hardware.

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


