Return-Path: <linux-gpio+bounces-24697-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C43E5B2ED2F
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 06:49:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A99345E05FB
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 04:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A62CC2D5408;
	Thu, 21 Aug 2025 04:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CHnT6x3g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EF21AF0A7;
	Thu, 21 Aug 2025 04:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755751768; cv=none; b=h4GIhTUHS5noQBOtrdTDjslRHqx/RAJlb5C+s8dTOMMYgdi0MBMsQ7k5CbyCodJMnI5UC/uxxcHSRu3BDDp0LjhrbL2tcgMJwxKq2DyQuRmcaoopNpS35wfOW69yRIv5zkXelwFbdA/oGc/3K38QI+fUulTz9etLG2bAB6CURJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755751768; c=relaxed/simple;
	bh=IBPe3SupDRuXm5rCi2JaHlpX6qzR2orFl2NueNMDhvc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C4I+4TEGt8mwcYdL4SS+qF6OIgSTwiF7OHDGoki835Czd/blo6vnZCWhJQt5rm2Z91iy3xqDskcD0BehM6lewSXhtU7OXfhgiVq/0iUOMKMqICyEDIJNegddJeJ5wlLWablJqK5e+XWeNT7LFNxNrl+VqzQgs4nuhVFr8HrNhRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CHnT6x3g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L3Z6xb021506;
	Thu, 21 Aug 2025 04:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CeAGXxKdk54
	AuXugmpde1JmxpO68027l+RsqYJAvNlI=; b=CHnT6x3gqd6yQw476m8jD42gZJy
	0bsALr3ta3Ogq6jxAQaDhlXGsjr2C7Ikr9yCdRAeIxgGNeRoFXJBWOOKUEJ3h40w
	hJmyTOQU4GUwYuceA/yUEwuzuDDhgMNZmerK0JiPa/E3ZZBSj3PbXvIRr8SHSYLD
	2q1oOelXwPa0gpcqSVy0UGXhJINXtuEMF+dtwHiK/d1C7SMV9kDaEuIUo5gd8UiV
	zc9aCswGL8vlIFQA7mvdl8e/gsbJ1utAtO3o1ShvCDvorkiLaAfCnCyBR399EGCK
	/XmLVJmzEJn7SYD5psdtPZGTa3IMp3CvwP/IKNFG6t1Qf8zWtJPbnNiBp6g==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngtdhuvd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 04:49:21 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57L4nHLf021951;
	Thu, 21 Aug 2025 04:49:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 48jk2m996e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 04:49:17 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57L4nHOD021923;
	Thu, 21 Aug 2025 04:49:17 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 57L4nHe1021916
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 04:49:17 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 6F4585CD; Thu, 21 Aug 2025 10:19:16 +0530 (+0530)
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
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v8 2/9] dt-bindings: pinctrl: qcom,sc7280-lpass-lpi-pinctrl: Document the clock property
Date: Thu, 21 Aug 2025 10:19:07 +0530
Message-Id: <20250821044914.710044-3-quic_pkumpatl@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=LexlKjfi c=1 sm=1 tr=0 ts=68a6a551 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=N2fgTwrcgbKGdZPXpVQA:9 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: wsEH0aTg-2-gb4007sTkklSQIGg_bTEJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNSBTYWx0ZWRfX/Apg98u4Yy7q
 fpUSgHuOyeF/PgJ+jUolp3LcjzU0SMNZg8lsCPloFQPgxLOaArt7VVRpe6kp9eKlWquOhFVoof8
 kn2lj4WHVENVzhkVvO/z8gfS1p9TfkLlcjds9c2kpMUJmhc+LtHXB5GAvGEbgfPFViCfjS8RY2Y
 jy/+PdS/jP4KBUyi9wMJNvyHQWqn99TgycicfKidr9tAf6kvwOiYnjOb88JFFRRovSRi7A1TvrN
 PAtdeUkb3Is2eBrBQ0+f/03z2V6Y/P+YtZoN5tMpgJ03dGMPwnRUqN2jgnFkjAU5J6zvbykwKio
 5VD1L45breyyqa97t5weyotM+PN0n6U9O0JPDNCPcXo6qCymjLUnoxNS1T0Ks15JOUM0SBy7W4z
 7LHufPek1xcOghG1iKBVPT4005ksVA==
X-Proofpoint-ORIG-GUID: wsEH0aTg-2-gb4007sTkklSQIGg_bTEJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200135

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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


