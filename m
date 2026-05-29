Return-Path: <linux-gpio+bounces-37651-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKJFInTmGGruoggAu9opvQ
	(envelope-from <linux-gpio+bounces-37651-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 03:05:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5FE5FBCF4
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 03:05:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A1FB730078A0
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 01:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E36F355F3A;
	Fri, 29 May 2026 01:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BY8/Sy7Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i1j63/JO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE3917D2
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 01:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780016750; cv=none; b=jJNF2owAUbBMznEjx/TKV0c815FoULlI7QYXas54ZxH4tfoFaj6yTtd64/FA/JC2ZqUlnKiqh78kFPJrtzV4O2Hz0HQy+F+ppV/eARJr1L2v2zg3LposvCMc2bGuhJHwT2qYu5lNN+TYNefmfLQgyaFjAskG6bm4JPPqj+XrhDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780016750; c=relaxed/simple;
	bh=lXy4t/t9OCmAgFepSL86P9vwWEgmZ7kUmPb0JJyweV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aV7R6pOeYe0BhtMN4R2NZ+wq3ooZOzvdboFa4ZNwzHQX3VLPSe8dquDYGUr5y7YkSG6DQahkE3TJoSy63b3ZarjvYal5kiqoFFN23BdEogMvDOkY26d/fVR6K2bikNpkAO7194h8KplKXbwZzkKSFji8QPk18iPanZXf1o1d9Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BY8/Sy7Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i1j63/JO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SKkvPl1932335
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 01:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u1PyjGjvKsU44wuqA0Tto9I3prCpdK/S5nLQhgommlI=; b=BY8/Sy7YEVtBa8O+
	G1Qi7JpGGF9vxDTfK+oC+9hpCUJqtYV7rH9iKoIAO+HdXmyiPlwLUcGShpa+BbrN
	sx2BDujI++nRJDvyBorIp+1rayp1Jnnc7iztWLfkztSQwYD7ZoyuUP2SXoeO0nfK
	wv8qIcYOgwfD0/EVnUL9889TppeY5+Rhrc2sqK2kLkmYhfzQ5NlwpxgAhzaFzguy
	l9H2uoLN/dQ4l7PtB/f5FyTMq+wpz2pZCcCy4Kcfqgu5IC/n6KeEb1VGJBv4SoW5
	S2ihaOSprCxpEVGy1+ZtfDKeGKMZUmFTlyGiEXLZIsY3XNhPyvUfP6YmyH7NBBLk
	kMN5vg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eesxa9w7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 01:05:46 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304dd917645so1023372eec.1
        for <linux-gpio@vger.kernel.org>; Thu, 28 May 2026 18:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780016746; x=1780621546; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u1PyjGjvKsU44wuqA0Tto9I3prCpdK/S5nLQhgommlI=;
        b=i1j63/JOQTXMh+ENzMnCwfY/fFnvl/JY+3US9r4g6wXJBS+/gBwAKN1ZRWDKISKtLI
         drv/NzbhXVDFp6U/FFxSUhgEKCySV1aoB6KOP7F2xkDB97+0BMcq5XGppk9sogCWl31A
         XnX7RILAD5o5g7l37uTkzFDzsnBnNmedWByQpVZfkbxrAj/jm8sBxzQZp5sv/a4UUbDh
         jkiFzFFx8lXP9nXiLfTeA8CjzsrzEGVR0nxXZohMgNMK2mtqm8hTFuIBHJQPZW5PgicG
         vwd9xACvXZgsNyrKo0y9s4JxHyAnIhFlm2PUaoiuvy1hZUf9bR13M5Jcirb/f+lcQME7
         ylIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780016746; x=1780621546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u1PyjGjvKsU44wuqA0Tto9I3prCpdK/S5nLQhgommlI=;
        b=F5m5Zt8lD/6szTtlrttiXGV9CtMfz+LtHqdAXUBYoQP+FT5b2LCa3F7MvNgQQc9ce7
         K6cNtdoxJNiYCgn2xSO9rPyD9BVkpL/SpMn7X/61rfoSjd+wGgl6BOZeUZ1E11khTyps
         vGD401Ttw2ohoORHZ1aTODzVwCMLFDix64gytWHzw57XLW2w0yoQzT0+4MDxZww6V7Q7
         6GtCQ7gEYsP4DMHokD6Ow7JyHbnw5Ac4xwCaMrtYsMWo9qJVHbj2x7O8Fw45DyXSGdw6
         H8Q+Tukhu5gkYSzZfhiEg1vDEqjkJ8FDRtJARqGPu5Pmy6ofHaLbUuP3FfZ9JyRstBmc
         5Gbg==
X-Forwarded-Encrypted: i=1; AFNElJ/23DClVYbOA2rQZkYjmSeJxW3ujjRaP6KUidBuSL07tkVZxAicBLWbdbuD2ez/Ux9xmsnmAWnW6BZx@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7etL/+FqvFEdIvr1V1P1b1CZUX2MqR2LhUHQhGKOgq3obF1ZQ
	+WbM17y5rpsE3Y2rgmmcYdYlvTeFqN7b0sTT9sLgBlssiCSFnLbB1f5Fvw2zzcA3KO1e65tG6Zl
	+4/umbprju32dkJ+h3kWVn9ptFKP+P/syur8HnVFcuh1kvxux2BvFaIQmsOSrsyHh
X-Gm-Gg: Acq92OGUjUV/36AQLJ2MQSsoSwiaDzmyH0KgcW6gKa5P9Sq6kKWGKRXdz9UlAHGYZc6
	AZEM9uitV7T6FZszTWDfkaS3BPS9JZWRMX95oRjRx8VPlryuHeeDgvuEBGRgPMEvLL8yzDjj6rQ
	qTilrA3PormA5iLMrslYIuCKClzVViqXqgkxQQREWYaLn+LV75d5VFc/hXcZes8ny4KKQs6nc2Y
	8/4HZzYOGGMK5XCmcILv/VIpkB9OLPQLoZ9gDUdh03rPdESkDlMQa8RT6fbg1NxLrAIol9QFpgb
	HqcrRMYlXP7RDwCwm+4mIyWo2oFY+8v9XBwDImq+sGv5ljo6q5M25mhEruEm3SkTIrloVzu/v05
	KQ3gKyhkG4wYsn1MnKXBQICw+9GEEz4tPx0k5/kLMjfA8PRiDNdBBBysjW1heFss/Urdg7leqhB
	Sp3h3qMDaW
X-Received: by 2002:a05:7300:a484:b0:2d0:239a:23cb with SMTP id 5a478bee46e88-304eb0d866dmr475136eec.16.1780016746072;
        Thu, 28 May 2026 18:05:46 -0700 (PDT)
X-Received: by 2002:a05:7300:a484:b0:2d0:239a:23cb with SMTP id 5a478bee46e88-304eb0d866dmr475101eec.16.1780016745528;
        Thu, 28 May 2026 18:05:45 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed2c3121sm179812eec.5.2026.05.28.18.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 18:05:44 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Thu, 28 May 2026 18:05:36 -0700
Subject: [PATCH v2 2/4] dt-bindings: pinctrl: qcom,pmic-gpio: Add
 level-shifter function
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-pinctrl-level-shifter-v2-2-3a6a025392bf@oss.qualcomm.com>
References: <20260528-pinctrl-level-shifter-v2-0-3a6a025392bf@oss.qualcomm.com>
In-Reply-To: <20260528-pinctrl-level-shifter-v2-0-3a6a025392bf@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780016741; l=4665;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=lXy4t/t9OCmAgFepSL86P9vwWEgmZ7kUmPb0JJyweV0=;
 b=VmA/SAjy7f4I991yfIMjzvCQdrqCb0zwssphblgXNFImVZft9fr4KM4C4Bbnw1S2jJoli3KNF
 T0DrFWOqOKVBJ/uIBeGaYuTzgbuN0oW3YihDJQP7kPejTVAD2TDoV4m
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-GUID: sUU55wt5CvB9ByVMbTCppw4h31LpLBnu
X-Proofpoint-ORIG-GUID: sUU55wt5CvB9ByVMbTCppw4h31LpLBnu
X-Authority-Analysis: v=2.4 cv=ZdIt8MVA c=1 sm=1 tr=0 ts=6a18e66a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=oPYuZtxd-o3nixQqOr8A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDAwNyBTYWx0ZWRfXy2evG5CYRxWd
 MsB7Rq9OVs17Mawxkr+MnW/bPy5lO9DTIDXUROK1bVzB3NcsyEvkUXKJQ/eXAqayo2gt3/xmN5O
 aUM6KS87khi0Xwf8NMZlBpZrnpGG5JBMnJS7qwksNotnApQC4D4ubmLtNkLE6oQlI4XTzG+yTsF
 /ydBJn5gBCO/uaboCF0i8qtPAd32e2xM9JJ/sNtZ5iHGVMfrxZfw2Cu+lpT2Nz0/EzRbX4/bdZE
 IlQXJ8D/cwZexs3lqI8LLBf8SIUIqcnkavCNR06MX4xIdd3m+5jRMYmkdd4gOKBu9yxR67snTJ0
 ToL2l385m4ABthu95kN+YYtOQ7v56/QvjOJ4xT7ErdW1fC6+V9wjNLn84M5sI+6hjc35ROdH0Wl
 EKdmLyH9lo8HkP73frOgONYjYGC7EO04qmC87oqnGCSvlFzxcmh0BLRNeanxxnt/0lOVe4O5IFN
 O8ViuNJsO+i2XBayeqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290007
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-37651-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6A5FE5FBCF4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the "level-shifter" function and add the required DT properties to
allow RPMh firmware to control the level-shifter. Introduce a custom
pinconf parameter "qcom,1p2v-1p8v-ls-en" for enabling or disabling the
level-shifter function.

Additionally, add the "groups" property with the allowed group names
that can be used to control the level-shifter function on pmh0101.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,pmic-gpio.yaml           | 66 +++++++++++++++++++++-
 include/dt-bindings/pinctrl/qcom,pmic-gpio.h       |  1 +
 2 files changed, 64 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index b8109e6c2a10..19dc61ddff2d 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -119,6 +119,21 @@ properties:
       The first cell will be used to define gpio number and the
       second denotes the flags for this gpio
 
+  qcom,rpmh:
+    description:
+      Phandle to the RPMh controller device. Required for PMICs when the
+      bidirectional level shifters is used (e.g., pmh0101), to enable
+      communication with RPMh firmware for level shifter control.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  qcom,pmic-id:
+    description:
+      The ID of the PMIC which supports bidirectional level shifter function.
+      It is used as the RPMh resource name suffix to request control of the
+      level shifter to the RPMh firmware.
+    $ref: /schemas/types.yaml#/definitions/string
+    pattern: "^[A-N]_E[0-3]+$"
+
 additionalProperties: false
 
 required:
@@ -330,6 +345,22 @@ allOf:
           contains:
             enum:
               - qcom,pmh0101-gpio
+    then:
+      properties:
+        gpio-line-names:
+          minItems: 18
+          maxItems: 18
+        gpio-reserved-ranges:
+          minItems: 1
+          maxItems: 9
+        qcom,rpmh: true
+        qcom,pmic-id: true
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
               - qcom,pmih0108-gpio
     then:
       properties:
@@ -523,6 +554,19 @@ $defs:
         items:
           pattern: '^gpio([0-9]+)$'
 
+      groups:
+        $ref: /schemas/types.yaml#/definitions/string-array
+        description:
+          List of GPIO groups to apply properties to. Only valid for
+          function "level-shifter" on pmh0101. Valid groups are
+          gpio11, gpio12; gpio13, gpio14; gpio15, gpio16; gpio17, gpio18.
+        items:
+          enum:
+            - gpio11, gpio12
+            - gpio13, gpio14
+            - gpio15, gpio16
+            - gpio17, gpio18
+
       function:
         items:
           - enum:
@@ -536,6 +580,7 @@ $defs:
               - dtest4
               - func3  # supported by LV/MV GPIO subtypes
               - func4  # supported by LV/MV GPIO subtypes
+              - level-shifter  # supported only by pmh0101
 
       bias-disable: true
       bias-pull-down: true
@@ -592,9 +637,24 @@ $defs:
           configured as digital input.
         enum: [1, 2, 3, 4]
 
-    required:
-      - pins
-      - function
+      qcom,1p2v-1p8v-ls-en:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Enable or disable the bidirectional 1.2V/1.8V level shifter
+          associated with the specified GPIO group. When set to 1, an RPMh
+          vote is sent to AOP to enable the level shifter. When set to 0,
+          the vote is withdrawn. Only valid when function is "level-shifter"
+          and groups is a level-shifter GPIO pair (e.g., "gpio11, gpio12"
+          on pmh0101).
+        enum: [0, 1]
+
+    oneOf:
+      - required:
+          - pins
+          - function
+      - required:
+          - groups
+          - function
 
     additionalProperties: false
 
diff --git a/include/dt-bindings/pinctrl/qcom,pmic-gpio.h b/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
index e5df5ce45a0f..b0824d5eb056 100644
--- a/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
+++ b/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
@@ -105,6 +105,7 @@
 #define PMIC_GPIO_FUNC_DTEST2		"dtest2"
 #define PMIC_GPIO_FUNC_DTEST3		"dtest3"
 #define PMIC_GPIO_FUNC_DTEST4		"dtest4"
+#define PMIC_GPIO_FUNC_LEVEL_SHIFTER	"level-shifter"
 
 #define PM8038_GPIO1_2_LPG_DRV		PMIC_GPIO_FUNC_FUNC1
 #define PM8038_GPIO3_5V_BOOST_EN	PMIC_GPIO_FUNC_FUNC1

-- 
2.43.0


