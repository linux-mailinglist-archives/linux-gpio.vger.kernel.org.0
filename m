Return-Path: <linux-gpio+bounces-40132-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NZ1AM6KNV2o9WwAAu9opvQ
	(envelope-from <linux-gpio+bounces-40132-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 15:39:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D9875EC86
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 15:39:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=V8q6pHaZ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40132-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40132-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1967308CD5A
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 13:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF2402F28FF;
	Wed, 15 Jul 2026 13:33:01 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287EB2C0F69;
	Wed, 15 Jul 2026 13:33:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784122381; cv=none; b=Gcbeg2hF0D10b9n4onlUzT6bqBcJeVjyTrZBmhET7YTkIXF0WDOCtFZTA/q361fKFlmu/fh6s8Vfx0lakUrvbsJIUB20c/eKvjHxcKYzAXc0nVjxUA9qkxDEVTXKwF/db//TIXHZIQ1+GUBOEqkZV9To5MgfNLu1jWUJT3OSbkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784122381; c=relaxed/simple;
	bh=IxmMHGlk8QYVrm0sRclpevzaV41U2O/Tz4T7FD9aDlg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=InSMlXn9rGp2IWiuuYxTD0R2+MGojHIXgOha/78lZyWnyKf9nKfAzzL2lYX54SA/vt6GUy7dQ2l/SHxwKz1cO7eUPRKCsKjzchzE8xMQijZ50x4ZBQ9YoHv9ueKT3nY/9m3H2Ld5chULZzWl5h/yRJqKn995Y7J0luqruC0+L9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V8q6pHaZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcdiE3599393;
	Wed, 15 Jul 2026 13:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SmT8RyveJfh
	yP/PpXdzjE4NBjTlADskcP+xvISj7b48=; b=V8q6pHaZwTeq+g6BH7St3Swd0Zf
	wyYuOcNj/lBABIW+gdUCfyurPhIDXu+ibb4O7QCQKy26kWrQJYnOqwnA/5EMJEra
	IhJdYeQfzuUkwFoVDxZ4ewETgNEHF/sgAE94DJrzehVy+7KdxHBNg2U//9vGl17d
	gKvStsj7ljW5CUl9RhnXBUIsIii1mi2R9BVMWVRdTrfCCvZ+V3UqL/OzsTXahgjS
	/r0nqv5jWuC8t8REqqxgE7FD+dEGgzNxIJEomveOMeu0JOaWDI/nDtZr/K9bfztC
	3dShmK6W/YapS9N1POhyWXpoWu5crIMtEovYrfQ1LJdcBMKnlZFYWJnnxWQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7q60vb2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 13:32:50 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66FDWkkv030469;
	Wed, 15 Jul 2026 13:32:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fbewk39sa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 13:32:46 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66FDWkY7030438;
	Wed, 15 Jul 2026 13:32:46 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 66FDWjIC030432
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 13:32:46 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id D771863D; Wed, 15 Jul 2026 19:02:44 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: [PATCH v3 3/4] dt-bindings: pinctrl: qcom,hawi-lpass-lpi-pinctrl: Add Hawi LPI pinctrl
Date: Wed, 15 Jul 2026 19:02:42 +0530
Message-Id: <20260715133243.3170821-4-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260715133243.3170821-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260715133243.3170821-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzNCBTYWx0ZWRfX5sGhQPHZt7Pu
 p3uVjk4VyT2NZCbBV/1zVAFfdA1M89Mpw7mVlTBkPygqPXVVr4Mzb/in1xY2mITd392VAbcMIf7
 dO70bP1cNg9g9ufJhuQlx8ZMW+ujxAQ=
X-Proofpoint-ORIG-GUID: waTUtrirLlrIhMKxf9RXCX5r6QXUbOQ8
X-Proofpoint-GUID: waTUtrirLlrIhMKxf9RXCX5r6QXUbOQ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzNCBTYWx0ZWRfXyc+PmUh5E2IV
 nySnb52+nwlVgIfuA4ErZEyIXUlWBKO0fYHNE03zaXwIuEuTWyWRoY3O5TLueSmibPnzhUTZe8e
 HWwA1C7GNjFkKpovDWLsddC6wuXWtEwmiHr83b8czy0E7MDh/yV2tNMzBCJ2IST9npBOUQxhi7q
 3Gq5mSChQ5ZAAwtCtcqLmJ/EBB56hFErncdn6PMpLziU3yIUlbf9VMty8q8vE4mBoMLR2WtSMym
 bm0oUt3V6OLptlOmG61YmWiBOh7M10qzb6NRFc9aET+B8pIwMeIXJNE02C9y6VvgM/zioFnOEm8
 rEmvmnE+sYGmyePfg8UZ4/kwyh2vaxPfL9GA+9XLnYmb/KsMWX0/Ixd66A/DHsaITFLeAbfxIGf
 JHGp0XHgVpWU9KUNfeVf80lYeg9M7XviOGf4fPFMBJ5H4pug1yxoWXTufQsPtjlTEci4v2w7Qzi
 0CjjuJ1n/Ixf9snmbFQ==
X-Authority-Analysis: v=2.4 cv=BajoFLt2 c=1 sm=1 tr=0 ts=6a578c02 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=bT5XQOCXPleopHcqzpYA:9 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150134
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-40132-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:brgl@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:srini@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:prasad.kumpatla@oss.qualcomm.com,m:krzk@kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 72D9875EC86
X-Rspamd-Action: no action

Add bindings for the pin controller in Low Power Audio SubSystem (LPASS)
of Qualcomm Hawi SoC.

The controller has 23 GPIOs (gpio0-gpio22) with functions including
SoundWire, I2S, DMIC, VA I2S, ext_mclk1, slimbus and lpass_lpi_dbg_clk.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 .../pinctrl/qcom,hawi-lpass-lpi-pinctrl.yaml  | 109 ++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,hawi-lpass-lpi-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,hawi-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,hawi-lpass-lpi-pinctrl.yaml
new file mode 100644
index 000000000..af6858175
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,hawi-lpass-lpi-pinctrl.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,hawi-lpass-lpi-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Hawi SoC LPASS LPI TLMM
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
+  - Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in the Low Power Audio SubSystem
+  (LPASS) Low Power Island (LPI) of Qualcomm Hawi SoC.
+
+properties:
+  compatible:
+    const: qcom,hawi-lpass-lpi-pinctrl
+
+  reg:
+    items:
+      - description: LPASS LPI TLMM Control and Status registers
+
+  clocks:
+    items:
+      - description: LPASS LPR(Low Power Resource) voting clock
+      - description: LPASS Audio voting clock
+
+  clock-names:
+    items:
+      - const: lpr
+      - const: audio
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-hawi-lpass-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-hawi-lpass-state"
+        additionalProperties: false
+
+$defs:
+  qcom-hawi-lpass-state:
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: qcom,lpass-lpi-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          pattern: "^gpio([0-9]|1[0-9]|2[0-2])$"
+
+      function:
+        enum: [dmic1_clk, dmic1_data, dmic2_clk, dmic2_data, dmic3_clk,
+               dmic3_data, dmic4_clk, dmic4_data, ext_mclk1_a, ext_mclk1_b,
+               ext_mclk1_c, ext_mclk1_d, ext_mclk1_e, gpio, i2s0_clk,
+               i2s0_data, i2s0_ws, i2s1_clk, i2s1_data, i2s1_ws, i2s2_clk,
+               i2s2_data, i2s2_ws, i2s3_clk, i2s3_data, i2s3_ws,
+               lpass_lpi_dbg_clk, qca_swr_clk, qca_swr_data, slimbus_clk,
+               slimbus_data, swr_rx_clk, swr_rx_data, swr_tx_clk, swr_tx_clk1,
+               swr_tx_data, va_i2s0_clk, va_i2s0_data, va_i2s0_ws,
+               wsa2_swr_clk, wsa2_swr_data, wsa_swr_clk, wsa_swr_data]
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+
+allOf:
+  - $ref: qcom,lpass-lpi-common.yaml#
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+
+    lpass_tlmm: pinctrl@7f60000 {
+        compatible = "qcom,hawi-lpass-lpi-pinctrl";
+        reg = <0x07f60000 0x20000>;
+
+        clocks = <&q6prmcc LPASS_HW_LPR_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+                 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+        clock-names = "lpr", "audio";
+
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&lpass_tlmm 0 0 23>;
+
+        tx-swr-sleep-clk-state {
+            pins = "gpio0";
+            function = "swr_tx_clk";
+            drive-strength = <2>;
+            bias-pull-down;
+        };
+    };
-- 
2.34.1


