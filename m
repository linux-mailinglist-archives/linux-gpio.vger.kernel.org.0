Return-Path: <linux-gpio+bounces-9302-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D2C96322B
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 22:42:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43853288227
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 20:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 401591B140E;
	Wed, 28 Aug 2024 20:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q/SdfvIn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2E71AC897;
	Wed, 28 Aug 2024 20:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724877516; cv=none; b=om0dmakYBPKBpXa3UpQbvvhsjxxcZoNqV/lnJBu+17v48/tR51WEkVGhMgH7mioqGkWLGanPxmL6OSd5BMn/3prcqGVwG104kq85TNS4gQ4sx23dxT8mJ2T0/veJb2Y0/OdNb4ILizL4Y9xZ16fdz4UhXlccFoD9xgG2VhCLjOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724877516; c=relaxed/simple;
	bh=Bx8hxWTKVypUPqtZ+VIPGoE2ts04iM2rO9yLbeGyXYU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g3l502LfgQqe9Zxf7AFhP4R598KC2V7UzCXk7QvLyYyyWcg5qbezLRmzCYNt3+J+YWI0oAdb3yYl22QJMlN2Zp2NIJnqAgMb+DligWi+BzokuoDN2ze+DQqCZL0w9YdyMmz1Rr+Cc7fq8QJJCwLJbVgh8AuwwkAp/cVgt9Hi3aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q/SdfvIn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SJLuZc023318;
	Wed, 28 Aug 2024 20:38:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w8hoCOhKkgzfK7q/ss/qHTr9vRVdbzXEqHpqQTtW/PY=; b=Q/SdfvInL5tOjsjY
	Qwdwir6as57J7en6YWeawLTRWdRMytJuN1qgoLHRxjh/XTTW18XMVU6Y/1Oknl9h
	5CMacze/kSu+crc8KO5Wphj5M+W6HPKfs+t2yRiGuoNH4G6L4DxhAIFAEyy1tyFD
	L9CtTzB/fnG8mhRQV3CYIdUubh3FI6Z6sO1ndvZ1jLlrxFkvcVrwHaxdGBIgBIdn
	G8JnrNX0+wXiq8xQkjsA36Ky45jZaJ+ejalN+8S6+jUV0eYRvTv5F4AeR7oBGnDH
	A4qLzW5Mfe/orYKWQNU7019BLExca/6NZBsLIuII7TIwFoCHl0Ij6d907bFeRSTC
	JHH1ew==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41a612gx8f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 20:38:16 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47SKcEmR015619
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 20:38:14 GMT
Received: from hu-nkela-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 28 Aug 2024 13:38:11 -0700
From: Nikunj Kela <quic_nkela@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <rafael@kernel.org>,
        <viresh.kumar@linaro.org>, <herbert@gondor.apana.org.au>,
        <davem@davemloft.net>, <sudeep.holla@arm.com>, <andi.shyti@kernel.org>,
        <tglx@linutronix.de>, <will@kernel.org>, <joro@8bytes.org>,
        <jassisinghbrar@gmail.com>, <lee@kernel.org>,
        <linus.walleij@linaro.org>, <amitk@kernel.org>,
        <thara.gopinath@gmail.com>, <broonie@kernel.org>,
        <wim@linux-watchdog.org>, <linux@roeck-us.net>
CC: <robin.murphy@arm.com>, <cristian.marussi@arm.com>, <rui.zhang@intel.com>,
        <lukasz.luba@arm.com>, <vkoul@kernel.org>, <quic_gurus@quicinc.com>,
        <agross@kernel.org>, <bartosz.golaszewski@linaro.org>,
        <quic_rjendra@quicinc.com>, <robimarko@gmail.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <linux-crypto@vger.kernel.org>, <arm-scmi@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
        <iommu@lists.linux.dev>, <linux-gpio@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_psodagud@quicinc.com>, <quic_tsoni@quicinc.com>,
        <quic_shazhuss@quicinc.com>, Nikunj Kela <quic_nkela@quicinc.com>,
        "Praveen
 Talari" <quic_ptalari@quicinc.com>
Subject: [PATCH 18/22] dt-bindings: spi: document support for SA8255p
Date: Wed, 28 Aug 2024 13:37:17 -0700
Message-ID: <20240828203721.2751904-19-quic_nkela@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240828203721.2751904-1-quic_nkela@quicinc.com>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 43mMTIY4WO_42AvOsyn3B4EIXiOCrdeG
X-Proofpoint-ORIG-GUID: 43mMTIY4WO_42AvOsyn3B4EIXiOCrdeG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_08,2024-08-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 phishscore=0 spamscore=0 mlxlogscore=999 adultscore=0 impostorscore=0
 mlxscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280149

Add compatible representing spi support on SA8255p.

Clocks and interconnects are being configured in firmware VM
on SA8255p platform, therefore making them optional.

CC: Praveen Talari <quic_ptalari@quicinc.com>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
---
 .../bindings/spi/qcom,spi-geni-qcom.yaml      | 64 +++++++++++++++----
 1 file changed, 53 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
index 2e20ca313ec1..74ea7c4f2451 100644
--- a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
+++ b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
@@ -25,10 +25,41 @@ description:
 
 allOf:
   - $ref: /schemas/spi/spi-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sa8255p-geni-spi
+    then:
+      required:
+        - power-domains
+        - power-domain-names
+      properties:
+        power-domains:
+          minItems: 2
+          maxItems: 2
+    else:
+      required:
+        - clocks
+        - clock-names
+      properties:
+        power-domains:
+          maxItems: 1
+        interconnects:
+          minItems: 2
+          maxItems: 3
+        interconnect-names:
+          minItems: 2
+          items:
+            - const: qup-core
+            - const: qup-config
+            - const: qup-memory
 
 properties:
   compatible:
-    const: qcom,geni-spi
+    enum:
+      - qcom,geni-spi
+      - qcom,sa8255p-geni-spi
 
   clocks:
     maxItems: 1
@@ -45,15 +76,10 @@ properties:
       - const: rx
 
   interconnects:
-    minItems: 2
-    maxItems: 3
+    description: phandles of interconnect bw provider
 
   interconnect-names:
-    minItems: 2
-    items:
-      - const: qup-core
-      - const: qup-config
-      - const: qup-memory
+    description: names of interconnects
 
   interrupts:
     maxItems: 1
@@ -61,15 +87,18 @@ properties:
   operating-points-v2: true
 
   power-domains:
-    maxItems: 1
+    $ref: "/schemas/power/power-domain.yaml#/properties/power-domains"
+
+  power-domain-names:
+    items:
+      - const: power
+      - const: perf
 
   reg:
     maxItems: 1
 
 required:
   - compatible
-  - clocks
-  - clock-names
   - interrupts
   - reg
 
@@ -116,3 +145,16 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
     };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    spi@888000 {
+        compatible = "qcom,sa8255p-geni-spi";
+        reg = <0x888000 0x4000>;
+        interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        power-domains = <&scmi10_pd 16>, <&scmi10_dvfs 16>;
+        power-domain-names = "power", "perf";
+    };
-- 
2.34.1


