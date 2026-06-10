Return-Path: <linux-gpio+bounces-38277-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vUJEE6mMKWr6ZAMAu9opvQ
	(envelope-from <linux-gpio+bounces-38277-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 18:11:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DFACB66B37F
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 18:11:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=f3p0SQig;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38277-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38277-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 20BB731C5334
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 15:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B697B43D4F7;
	Wed, 10 Jun 2026 15:57:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E02142EEDE;
	Wed, 10 Jun 2026 15:57:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781107045; cv=none; b=q1LQY8+dwy9NYlKqD9FksbW7ylvzh+qdfwLMJLDN75BM0X/xmFdvhwwbP5FoVvRVA78xq24BLYMdF8v2WnOzIfsWuqeXAXxWCmF6quI0W+M3tb12PZGRV7ZSnYs9v7SBqPod5chyXUp7X6eJEQP+SLxSP6SzMdM5yGiC3UXlisk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781107045; c=relaxed/simple;
	bh=t9oJmJBJVsIP0sUUPQgxoo/5w0pv3Mq2ON9FQ0MAR8g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DPUBpz9DKvcSZCIkXPlLyDWHYf+c/XC43bLfA/EXda25CCIl9Yhi8H1apaCaQA2/G+xhHgHDDoMjzm0Hg/J6t4CTpvoMlIDdF47GXlLKWQruGrfk0BaoM0wIKDBNAFH/uugLzjc8h7jVPicOMvfY64e5cp1NnYW41s67sXWq0TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f3p0SQig; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBiNX1138112;
	Wed, 10 Jun 2026 15:57:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EAjpRv0kDo0
	dw5vZ7ohEH/UXliZVzukHPMLySalifT4=; b=f3p0SQig728g120R0JT5+W9M3ap
	d9ISDyoXtahfn5NmFPsE093pgLHf/0lRO1XJdIF6ZFhFR0iRpx4JU47z45IlcWEe
	gWWRKP8PGwCBNga3Gyrva652fHm6Z6/C5QvC79l6uBHdnE1IW2MkZVB2H/p5FUGE
	iWriuZ/JxayQ5TUeJfF+9XkukAP8/CE59lXZI/ZSMFQ3Y5CD+wdGm1uBypO9H2xJ
	credvB4sLjn3/eq8kLGEWTDPq/bjSXbmWuu35H41+J2zOxcrqM5u2v7nWG1XxuHr
	kUPpylYdpyOKCvIL96dwPgn+35URNW/3eSiX/lowkbRz8eydM/N5dKYPoPQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwr2kc6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 15:57:15 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65AFvB0k017571;
	Wed, 10 Jun 2026 15:57:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4emcmk7k8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 15:57:11 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65AFvBcp017556;
	Wed, 10 Jun 2026 15:57:11 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 65AFvBD5017552
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 15:57:11 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 41B27635; Wed, 10 Jun 2026 21:27:10 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: sound: add qcom,wsa885x-i2c
Date: Wed, 10 Jun 2026 21:27:07 +0530
Message-Id: <20260610155708.151067-2-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610155708.151067-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260610155708.151067-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=Gu1yPE1C c=1 sm=1 tr=0 ts=6a29895b cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=WDgy_6-4JtBfxwNMeU8A:9 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDE1MSBTYWx0ZWRfXwSyLAlJfRkHq
 uu3gTPEk9nHtbtN+IjcTJ3/nz6nUcTsy7qfjbrVdWlXukqA/Qi72xJbiBYWEnJLdw1ztCGR42Cf
 bmGOjDbFMewdjBPu8qFJNb/xBWSa1lRX+DYuy67cx8UQU/JNYT19c2AvBz9nsbpWy3jJYm0knlu
 LfBIuD3LJXdc8aVabGSNb41EvQgMLwbEdg9ChvkkgdD2jtFgC0GhLYC8o8Nf6TdvP28emmiqUVX
 PbYEaELgH+ldKQ9TJNGQFkOCBC5uIJF92RxkOY+Gft6c2JUYrFAXnUhFOgW5ZRkBHfF52V9dP8v
 hKHoI1BYxh4ry15rNy6IvR1p7F9XCtsq2a/QI0vcBJjNN9CXU+14hpZAKbGqZovjm8GNhLKWbpF
 AETIUxQGIdhyZKONTHu5aVeTKBC4WDKZNZhlgYrt1bEBWPJ2XWQ26kq9QXVYRITA7Ux7mtNElCk
 2v+ns7Fp8UP0PAvBUKQ==
X-Proofpoint-ORIG-GUID: Mi1_cdGY5q8BqaH3P7BQb9v2cUImtu3r
X-Proofpoint-GUID: Mi1_cdGY5q8BqaH3P7BQb9v2cUImtu3r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1011 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100151
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38277-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linusw@kernel.org,m:brgl@kernel.org,m:prasad.kumpatla@oss.qualcomm.com,m:srinivas.kandagatla@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,devicetree.org:url];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DFACB66B37F

Document the Qualcomm WSA885X I2C smart amplifier binding.

Describe the required supplies, powerdown and interrupt GPIOs, the
optional battery configuration, and the optional init-table property
used to program the device during codec initialization.

This matches the driver programming model and documents the DT data
needed to use the codec on platforms with Audio IF playback.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 .../bindings/sound/qcom,wsa885x-i2c.yaml      | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa885x-i2c.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa885x-i2c.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa885x-i2c.yaml
new file mode 100644
index 000000000..1069f470d
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa885x-i2c.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,wsa885x-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm WSA885x I2C smart speaker amplifier
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
+  - Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
+
+description: |
+  WSA885x is a Qualcomm Aqstic smart speaker amplifier with an I2C control
+  interface and a digital audio interface exposed through ASoC DAI callbacks.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,wsa885x-i2c
+
+  reg:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 0
+
+  powerdown-gpios:
+    description: GPIO controlling the SD_N powerdown pin.
+    maxItems: 1
+
+  interrupt-gpios:
+    description: GPIO used for the codec interrupt output.
+    maxItems: 1
+
+  vdd-1p8-supply: true
+
+  vdd-io-supply: true
+
+  qcom,battery-config:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Speaker battery configuration, 1 for 1S and 2 for 2S.
+    default: 1
+    enum: [1, 2]
+
+  qcom,wsa885x-init-table:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 2
+    maxItems: 256
+    description: |
+      Sequence of register/value pairs applied during codec hardware
+      initialization. Entries are encoded as alternating register address and
+      register value cells. The number of entries must be even (register/value
+      pairs); maxItems is 256 (128 pairs).
+
+required:
+  - compatible
+  - reg
+  - '#sound-dai-cells'
+  - powerdown-gpios
+  - interrupt-gpios
+  - vdd-1p8-supply
+  - vdd-io-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        speaker@c {
+            compatible = "qcom,wsa885x-i2c";
+            reg = <0x0c>;
+            #sound-dai-cells = <0>;
+            powerdown-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
+            interrupt-gpios = <&tlmm 77 GPIO_ACTIVE_LOW>;
+            vdd-1p8-supply = <&vreg_l2g_1p8>;
+            vdd-io-supply = <&vreg_l1g_1p2>;
+            qcom,battery-config = <1>;
+            qcom,wsa885x-init-table = <0x8606 0x24 0x8626 0x24>;
+        };
+    };
+...
-- 
2.34.1


