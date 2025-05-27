Return-Path: <linux-gpio+bounces-20585-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73939AC4CDC
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 13:13:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7FDB16D862
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 11:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 407EB25F784;
	Tue, 27 May 2025 11:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Pw88wv4u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72020259C94;
	Tue, 27 May 2025 11:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748344371; cv=none; b=lc6vkYneMaHZFfDE0sYSfMnDToTv6YvW3jccYuwXGADPweDcxNskWjVlwnRerb4BbVqWmLoY8tykj8xGs38gkCRNbPCKH/KBD3zFZE7kcZdYbMx09PC2TOUfqjEkFZ24fWpDzYm59cJ5Va6gt1PAU4BzcAG9XzBHDGITLuGpCI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748344371; c=relaxed/simple;
	bh=u01uX+C9OJo6A/tpDFNEza61D7DlsMOb32+WAw+U6Y4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cxmLW5g/CuUgVz/pqAf6T0ILzdg2BiV/i3w4aKJq80I4nZHxadnDcsnLuhS8zfN9+c1VG6gs4/j2hqWTMwuFE63mItbsLvINlNVvqqdPieSJYFfUuz+V2Svci+3IYdWj7r5r1lSvj+ebS51IAQ3P5HC9opWKUn2mNZ9vKaQneGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Pw88wv4u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R9YxPH002206;
	Tue, 27 May 2025 11:12:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TiG0UDs5olv
	NGJghN2HAZtrkVDbHrHUhl0R5eWHDi+U=; b=Pw88wv4u7zQE3s5UiNnnQQMLemo
	OZCjIrX/cmw1OdHTcltI7P8fVAhI9GnJ/aF3mNSUku/RJyLecU5o3fgVEO/f/EB+
	pcmLrUX5RlDXmPumKb0ipwhHh4XZgGl8eR+xWdODWrnilEMSCwj3FUI9ethEEwgX
	C91b5mlXyXN9kJe9ym+5Zn93A91GJ1ZnapE5PDw79V/CbJyuYSdcCMfJT/tUhbLK
	bd0UAmw9hoYjC4ahmvPARDfnyNaLUnyDjUju6g8AYgki5doV60VHjuQ2yYSvM7OX
	7F16aC/ocySU10lPw4fySdBU3bjG3ufSA5EQ7Hz5jCukpn4I6Mf0FF3XdwA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavkr97r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 11:12:43 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54RBCe0k028132;
	Tue, 27 May 2025 11:12:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 46u76kscbv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 11:12:40 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54RBCde6028109;
	Tue, 27 May 2025 11:12:39 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 54RBCdcH028099
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 11:12:39 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 88E365C0; Tue, 27 May 2025 16:42:38 +0530 (+0530)
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
Subject: [PATCH v4 2/8] ASoC: dt-bindings: qcom: Manage clock settings for ADSP solution
Date: Tue, 27 May 2025 16:42:21 +0530
Message-Id: <20250527111227.2318021-3-quic_pkumpatl@quicinc.com>
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
X-Proofpoint-GUID: XL5nBZAywErLBmhUhVdygMw_BmfSUf94
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA5MiBTYWx0ZWRfX2NxWF1d8IxfP
 7d3t1vkEKSKKfOPW/QpEXEUYZS+wlAyZpUSrTfn8EAdKxVrv1FXxZOV+MWvOjkIzoX6+ezXocd2
 JR6v909cM3hwAR5fcBkaBXjW5p3+GpepE/xbUkyskknIAoGZUgV4ZhRrknpJcd8/mJqmr+516rO
 OehUd22oOUJLbCoyEtQiarccdv+NE6VxX7mnuee7/EyH0ksibB5Qs/idX0V8OmvK+P4rLnpdDGg
 OTo6umUjaUheV10bYcCakHQ4noHWg8uKrbAjwNTHz7homjc0sbjkif+F0INpMZGTA0Ukfc8+Xt+
 Ex5SFTYAuO/Ubax6yzOIpwML1B0Tu1bTuvvorhfbWwemRPjGmh3eUGLueaCJIth1TSh8d9QgaSn
 io9JwVtxGogcXIKs/kvajzx2aGIS3HIKBvHj6Pl8sQz4J4yC0L5Pfw7itA3eLTfm7yXz22Xq
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=68359e2b cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=jSEmt4Z-02OmPLV3Mw0A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: XL5nBZAywErLBmhUhVdygMw_BmfSUf94
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270092

From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>

Manage clock settings for ADSP solution and document the clock properties
on sc7280 lpass pincontrol node which is required for ADSP based
solution.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
---
 .../qcom,sc7280-lpass-lpi-pinctrl.yaml        | 10 ++++++++
 .../bindings/sound/qcom,lpass-va-macro.yaml   | 12 +++++++---
 .../bindings/sound/qcom,lpass-wsa-macro.yaml  | 24 ++++++++++++++++---
 3 files changed, 40 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
index 08801cc4e476..b1270124bfe3 100644
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
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index f41deaa6f4df..92b97c214060 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -78,10 +78,16 @@ allOf:
     then:
       properties:
         clocks:
-          maxItems: 1
+          minItems: 1
+          maxItems: 3
         clock-names:
-          items:
-            - const: mclk
+          oneOf:
+            - items:   # for ADSP based platforms
+                - const: mclk
+                - const: macro
+                - const: dcodec
+            - items:   # for ADSP bypass based platforms
+                - const: mclk
 
   - if:
       properties:
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
index 9082e363c709..6a999ed484e7 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
@@ -35,11 +35,11 @@ properties:
     const: 0
 
   clocks:
-    minItems: 4
+    minItems: 3
     maxItems: 6
 
   clock-names:
-    minItems: 4
+    minItems: 3
     maxItems: 6
 
   clock-output-names:
@@ -59,12 +59,30 @@ required:
 
 allOf:
   - $ref: dai-common.yaml#
-
   - if:
       properties:
         compatible:
           enum:
             - qcom,sc7280-lpass-wsa-macro
+    then:
+      properties:
+        clock-names:
+          oneOf:
+            - items:   # for ADSP based platforms
+                - const: mclk
+                - const: npl
+                - const: macro
+                - const: dcodec
+                - const: fsgen
+            - items:   # for ADSP bypass based platforms
+                - const: mclk
+                - const: npl
+                - const: fsgen
+
+  - if:
+      properties:
+        compatible:
+          enum:
             - qcom,sm8250-lpass-wsa-macro
             - qcom,sm8450-lpass-wsa-macro
             - qcom,sc8280xp-lpass-wsa-macro
-- 
2.34.1


