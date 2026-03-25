Return-Path: <linux-gpio+bounces-34110-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBk6LFKQw2mCrgQAu9opvQ
	(envelope-from <linux-gpio+bounces-34110-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 08:35:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4B2320C4A
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 08:35:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0C2173057351
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 07:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693AE371045;
	Wed, 25 Mar 2026 07:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RTUHxj9T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cGzh9ioK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4EE368947
	for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 07:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774424128; cv=none; b=GzUnTj6R+sZkr4QPczE7Sw9ULDPGoLzFhWQxPNW0UHP/rRtZ8O/NC5/1Q/zjcHoIudN/DhXaFyS+FF4E+cPq2xEh5Gikw4GcETUS7w3bXNbA5L19cyQzdCBPxjxVAOt17O85vRzYw5RQKM0KKwB+qRt8qhIpOGLKBhqJ677MJJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774424128; c=relaxed/simple;
	bh=HP+mqyFAMLaG5JbtzUuj2ODbvmGxKbRdJ4aEIhbTJIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CxBZa7smP5QNSVjImcUMiavmcDht5xxE3FMqeBVKbv0CRF7nrMDpou/o6Hvc/OpqZauKAa10EGenda9zP8GCBPKspgJD2xOaHj0ihgcOuIPVWAYSfs2yjSl71ZGIyLyuQYTgstjTe7Q7WinSH0kROTbcbox84RMatEITQD6/dRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RTUHxj9T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cGzh9ioK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P3xQKN919830
	for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 07:35:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mAKP200DhOcqupPIZbMFC27OoXdQJJ21uxtZjP6Qea8=; b=RTUHxj9TEM3fq1Gm
	dCUDS/w480Ft+sasB0NfMrapC8tdBGxzOs8EP3bvtsPXLj6S7WsDqzSz6OaUdchP
	6UgbzCfF77s9WeCF11pZZbyJ3sn8sjkz/IX8Mj0KRTv45DH9t4IsEvVCRJkqfaeT
	IpUG42Zy/FbxSdZY062POVk0w0Br5sYL7P2owgiUiffCnrjOqeTdfpzTewAUdH1A
	KMAYFrHZihFUh3z4y43Q15WLOrN9zqJTYewvZdhY+1eNK/AZBWdYuCe2ysiwBfJ2
	Yezqt2+WLAiolrcKDwYbfHsW7RfZUG0ycILPwCbd4QSoS6Q+4k95xhZ9jaihsgJt
	WoRigQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d489mgpb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 07:35:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35a019abd6aso677925a91.0
        for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 00:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774424125; x=1775028925; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mAKP200DhOcqupPIZbMFC27OoXdQJJ21uxtZjP6Qea8=;
        b=cGzh9ioKmKE70t17+3E3l2THdWFNIVUny6aOtKDqo6a+JX+EI2VwyF4L7Kvr88WgpH
         C6fpyog0KOw84cZoY6T9G99qycfDdDEsqRFo6foXCe+wGL6vpcE2jCnPplWw15NE7n9H
         AvidhFfZz9tkEyTby5eX/6VFS/anniLHAkKraHx2XOdQEH/q8irkKy5IvuR7K65I3nIJ
         bIVjwLPHqh/w6TzYb1NECN0jxi2ZiZW3P1u4UH5JY95Gn4sGxltJq3C0bOr27eAA6bCS
         4VB9ADIQqaTq5nnhdlqU3oa6IeCHNkmNQlN3SyUgaM1QvnmF8Qjeeg5oyWPpEgIWLlLK
         Xu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774424125; x=1775028925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mAKP200DhOcqupPIZbMFC27OoXdQJJ21uxtZjP6Qea8=;
        b=QteJ8GVOuGLt2ktem23EnMBCeCE/Ad6xUIdPdFcPzo/9tTHibB3pEMuuJvDp9fwWs+
         U7Mw17eZaH8oFv1tPohHN7VYDVbmGWCIyyOzCXxBeoVUNTeCt4InXxeONmTqeZJdpf8P
         v4JEwxAJsoTE5gOI8/Ebbky4GDcj+SM4G6pdkMjGuXx89SYOwOtgHvIxgAJ7C4YF5Zda
         /1U5qY3p1Al3/CFIB7WC4hYXOpZKoMZcYO4Jv62tHW/8fyoJ1SM6kOa66a51+W76T6T9
         dvSwsasFvucfXDCpxQb9ukJ1WA9Zb/jE2yRstxqWtk7VN4VjHMrGfuteqsVeI6EiEq8Q
         dH7A==
X-Forwarded-Encrypted: i=1; AJvYcCXPR0N/LAKpGydZh9PegjEjzWu1KKDtuoLWm6vliz1fi/Z4SE3AYT1uNmyKODVOn2ahdrLvsV5nsGJN@vger.kernel.org
X-Gm-Message-State: AOJu0YxnEzexeOe0F2pkZB2W8ED3waXWrsgb/hdbd0YeoJL3ZNwiachD
	PO5iTj/OOUyG4HiNfzyt5D//VZXoBAits+XLAT9f+TQBKhNWNoxL9pSbJmiHZZjblsuUmyflo/R
	0lu2aOonbb7GFpqpoFKnqASaKXEegLVe7Je5bezgh4B3OyyKwLjOqe5XthWB2NPfQ
X-Gm-Gg: ATEYQzwKdqgRO/WFoYa5vJAi8zvX8i2JKEV5EbTufbv7P0n+lDAQM8sO76tGXtnllU9
	wfaBAcNd27dgsnUMnvB7bTYCshasAHdE+RziEucLq497+lwyHJvrQOzE65aqG1d/1b0PUguY91n
	mKx0EEMWL9NLncr0YeHfRtaiRQhno5CQwqbMVPUBUiTbXndb2jYAkhq8frN6YT6hR3nKLDDyZmP
	SjmsJT3qZ3AU/DJWDOuwJemqCV4DEUMG7NRPp4SEO37XVhkiizbisi18EQFR1smIjwSPNu3LS3r
	iWp+7j9XAOSB25b1ByTRCLeQaUOeOBXxeK6y4JKfrTex+r9Wt8UWlQsmaVmu6tbYA9WPeS9hLnd
	Xuza5IYbIIunofbbrKZtgxQOJCsTrBSZwAfNxLnsfhXnP9ZGW8sfFJ7+Sh6pGsveSrkiF8QFdvq
	AEoXcdH3bkUOrSld6HBUGmNz3Q4pul5ZKh/6DEfoi+snO8zCp0rNIyeVhw
X-Received: by 2002:a17:90b:57e3:b0:34a:be93:72ee with SMTP id 98e67ed59e1d1-35c0d1451d7mr2069700a91.8.1774424125377;
        Wed, 25 Mar 2026 00:35:25 -0700 (PDT)
X-Received: by 2002:a17:90b:57e3:b0:34a:be93:72ee with SMTP id 98e67ed59e1d1-35c0d1451d7mr2069678a91.8.1774424124883;
        Wed, 25 Mar 2026 00:35:24 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c03206dcfsm4814629a91.13.2026.03.25.00.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:35:24 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 13:05:15 +0530
Subject: [PATCH v3 1/2] dt-bindings: pinctrl: qcom: add IPQ5210 pinctrl
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-ipq5210_tlmm-v3-1-3a4b9bb6b1fc@oss.qualcomm.com>
References: <20260325-ipq5210_tlmm-v3-0-3a4b9bb6b1fc@oss.qualcomm.com>
In-Reply-To: <20260325-ipq5210_tlmm-v3-0-3a4b9bb6b1fc@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774424117; l=4923;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=HP+mqyFAMLaG5JbtzUuj2ODbvmGxKbRdJ4aEIhbTJIE=;
 b=EwzUnxbmBvnSeBwDViWl0UAsw8hIDfaGVRTUj423GxJnVNYtGP9URKRjHhtXZVAOGDBZoRnZy
 CF11WDKPwezDJIgS8vLu9TKvMWdZlk9HYDjBLmoNzJEtGbv09rklV0j
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA1MyBTYWx0ZWRfX2LjmTE9N/jhq
 r2dLxt8KDLVYhrJS4aiZiAmzoVJPbRxYor+KgGn8V0XKW1mCwYt6JCeu0MjujPjCr5pE35/Kngi
 jK/VMMw7vUyg06gsLQFy4KUiK6icUuhqSRibCC35qxMqBcIhEeor7wgQKegVkD+nB5reCVgOzTG
 56hwO/BUbIQjmAtvW6FQCpsEttzzz/k8hngHsm3YyxNh11dGZf8/MJ7Hae56CzZq8hTj3QuN12+
 G0s/DggDOMWV6JuMpdG8HzFS/Y5T7R0TtKO+WF1+rs1CLyq/5FEM0GGS3hTtB8+W6f7P2K38GNh
 buXQNprxjDWg1XlpogEgEcSWNNEh/K+mA/QS9yz7f40SWO7eux6HPX/fRRVKx2GF/JbKZrm5Fc/
 /ZeYkhJShhxiUitTpxQxhysrvn7pSzGNU0Zte8zh/VOc+EoUWlzn5FreB4/LjlXUh2SVEIxdVjU
 uTro56ozDovr4sqV+OA==
X-Proofpoint-GUID: Y5iKd4YP8E7-zMzqrADJ0Q5hJXh_uGSj
X-Proofpoint-ORIG-GUID: Y5iKd4YP8E7-zMzqrADJ0Q5hJXh_uGSj
X-Authority-Analysis: v=2.4 cv=AKSYvs3t c=1 sm=1 tr=0 ts=69c3903e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=N690yQSzLXC5e7GKbG4A:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250053
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,devicetree.org:url,0.15.66.64:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34110-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4F4B2320C4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add device tree bindings for IPQ5210 TLMM block.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,ipq5210-tlmm.yaml        | 123 +++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq5210-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq5210-tlmm.yaml
new file mode 100644
index 000000000000..12c5e76235a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq5210-tlmm.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,ipq5210-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm IPQ5210 TLMM pin controller
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm IPQ5210 SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,ipq5210-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 27
+
+  gpio-line-names:
+    maxItems: 54
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-ipq5210-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-ipq5210-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-ipq5210-tlmm-state:
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          pattern: "^gpio([0-9]|[1-4][0-9]|5[0-3])$"
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+
+        enum: [ atest_char_start, atest_char_status0, atest_char_status1,
+                atest_char_status2, atest_char_status3, atest_tic_en, audio_pri,
+                audio_pri_mclk_out0, audio_pri_mclk_in0, audio_pri_mclk_out1,
+                audio_pri_mclk_in1, audio_pri_mclk_out2, audio_pri_mclk_in2,
+                audio_pri_mclk_out3, audio_pri_mclk_in3, audio_sec,
+                audio_sec_mclk_out0, audio_sec_mclk_in0, audio_sec_mclk_out1,
+                audio_sec_mclk_in1, audio_sec_mclk_out2, audio_sec_mclk_in2,
+                audio_sec_mclk_out3, audio_sec_mclk_in3, core_voltage_0,
+                cri_trng0, cri_trng1, cri_trng2, cri_trng3, dbg_out_clk, dg_out,
+                gcc_plltest_bypassnl, gcc_plltest_resetn, gcc_tlmm, gpio, led0,
+                led1, led2, mdc_mst, mdc_slv0, mdc_slv1, mdc_slv2, mdio_mst,
+                mdio_slv0, mdio_slv1, mdio_slv2, mux_tod_out, pcie0_clk_req_n,
+                pcie0_wake, pcie1_clk_req_n, pcie1_wake, pll_test,
+                pon_active_led, pon_mux_sel, pon_rx, pon_rx_los, pon_tx,
+                pon_tx_burst, pon_tx_dis, pon_tx_fault, pon_tx_sd, gpn_rx_los,
+                gpn_tx_burst, gpn_tx_dis, gpn_tx_fault, gpn_tx_sd, pps, pwm0,
+                pwm1, pwm2, pwm3, qdss_cti_trig_in_a0, qdss_cti_trig_in_a1,
+                qdss_cti_trig_in_b0, qdss_cti_trig_in_b1, qdss_cti_trig_out_a0,
+                qdss_cti_trig_out_a1, qdss_cti_trig_out_b0,
+                qdss_cti_trig_out_b1, qdss_traceclk_a, qdss_tracectl_a,
+                qdss_tracedata_a, qrng_rosc0, qrng_rosc1, qrng_rosc2,
+                qspi_data, qspi_clk, qspi_cs_n, qup_se0, qup_se1, qup_se2,
+                qup_se3, qup_se4, qup_se5, qup_se5_l1, resout, rx_los0, rx_los1,
+                rx_los2, sdc_clk, sdc_cmd, sdc_data, tsens_max ]
+
+    required:
+      - pins
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    tlmm: pinctrl@1000000 {
+        compatible = "qcom,ipq5210-tlmm";
+        reg = <0x01000000 0x300000>;
+        gpio-controller;
+        #gpio-cells = <0x2>;
+        gpio-ranges = <&tlmm 0 0 54>;
+        interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <0x2>;
+
+        qup-uart1-default-state {
+            pins = "gpio38", "gpio39";
+            function = "qup_se1";
+            drive-strength = <6>;
+            bias-pull-down;
+        };
+    };

-- 
2.34.1


