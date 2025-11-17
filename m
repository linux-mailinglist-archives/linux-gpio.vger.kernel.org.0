Return-Path: <linux-gpio+bounces-28572-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F75C63253
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 10:23:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ECB3E4F1226
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 09:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3AC3324B3B;
	Mon, 17 Nov 2025 09:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="mKQef0tH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E172A3277AF;
	Mon, 17 Nov 2025 09:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763370945; cv=none; b=pmSIdYd+oI/+aYhtbVpxyXiaUHW9/VnhxiykUmYPUJ9fjaqVO4R0Kmxm1x37SEqfylFrkTmRCIDt+ZEGPFXoUAsZ3fdtEEUzuZB5m6PW+lxT2QqsK7W9jKvdWfQttn0019KZE0ePywGfvPS+firvDUfrC/3FYyJNTxWQX6c+0yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763370945; c=relaxed/simple;
	bh=pRif8cJjJus99kraiYqY+3QBfCuNe+AO4hoAekj6QCM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aqPY1Xi7v5aVY/PEdVgMT5wKCOPKRvlsdCa+N6UX0doE5Yo93LCdrCABWRmLKrxVFliPYc/Rz1fFKRN5fMDLE6kpbkzGDd8qV6K9z6Qjhy93YVxJkO/2GnWxEmF/ZJGfFBp5hhgq5hFfCZr/TxsAW++NxSnajQ5r/QASoKtiEQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=mKQef0tH; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH87mdL2052307;
	Mon, 17 Nov 2025 04:15:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=oJdIV
	v7qZnoGY5A/6sq+oenFP9YK0TuC8xW2rktcVsg=; b=mKQef0tH1R4T9GXx7uFhe
	FiZ1yD2CMJX19ECIU9QB/ezJqz8SoygWqBpA31KL4uuIjIkZvV9qHkRNR/6pIdIO
	fJOw/ZSz6p+vX3x8mmZUhSQQPGA4WePP8oHfCSggl5M/SmCOxGRKEd96Y16SzteM
	eqx0DNvJRZCbozPCDCB4ywLhOB/e9Kn0q48zTfHV/ZK2+tomxYHriF87DVWXvpvp
	F+ITjaiXex+KgzBenaV74eUgXiKgpoA6y/P49yAoJb0xQJzFenSmzxnywsWla023
	Gik+T+sKvM9pZeSv5ngjYWSRo45P5ANxZQVQKq+rJeczVtsefKbHH24yjiTBFnIA
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4afehdkgra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Nov 2025 04:15:40 -0500 (EST)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 5AH9FcqR005384
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Nov 2025 04:15:38 -0500
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 17 Nov 2025 04:15:38 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 17 Nov 2025 04:15:38 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Mon, 17 Nov 2025 04:15:38 -0500
Received: from Ubuntu.ad.analog.com ([10.66.6.193])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 5AH9FE4E003532;
	Mon, 17 Nov 2025 04:15:33 -0500
From: Antoniu Miclaus <antoniu.miclaus@analog.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Antoniu Miclaus
	<antoniu.miclaus@analog.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>
Subject: [PATCH v3 1/2] dt-bindings: switch: adg1712: add adg1712 support
Date: Mon, 17 Nov 2025 09:13:22 +0000
Message-ID: <20251117091427.3624-2-antoniu.miclaus@analog.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117091427.3624-1-antoniu.miclaus@analog.com>
References: <20251117091427.3624-1-antoniu.miclaus@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: E42OBifUm7DaBHa4idxuVrDeOTqh7Lam
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA3NyBTYWx0ZWRfX0heSzDKQeEP5
 QgWt+52sT9FfApQhBlhVdMF861pE15+NE4+Jfs1JcyG9jkVa8OowFO9OZQPTtvOp+w5na4Pkf0I
 m7c8pTnmcxF/+Eset9yMHG5FnSCyvTLEUbGrcqhZWEOAnncLeSVraDoiDjMS3EoBzOBNwxKTiNZ
 hozcwj6xDkRKdzyTsACYNazEAdFoE1o0j5KJft+ypAMTQQfYD7/MwnwuBLTIfTphXDV0DQTelYE
 0HjRekkn1lbRAKC5+nSYi9xhKzL+EO5n4DHwpisdh+vRsC1LOK+WeRY8uaVJC1rlhIcv7mB/UtT
 wBxZHLk75V4Sf4xcFzubCuFczgi168MARMrsQpnhHwWue5F05alCjU8N9PSUNRhbPtEWVKjOWD6
 xQssnbxhoco/KMr4KpYtlrDZ4YpRaw==
X-Authority-Analysis: v=2.4 cv=LJ9rgZW9 c=1 sm=1 tr=0 ts=691ae7bc cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=gAnH3GRIAAAA:8
 a=lKotbuvdLVjnqHEpyiAA:9 a=sptkURWiP4Gy88Gu7hUp:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: E42OBifUm7DaBHa4idxuVrDeOTqh7Lam
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511170077

Add devicetree bindings for adg1712 SPST quad switch.

Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
---
Changes in v3:
- Move bindings from gpio/ to switch/ subsystem
- Remove gpio-controller interface
- Add 'switch-states' property for initial configuration
- Update description and example
---
 .../bindings/switch/adi,adg1712.yaml          | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/switch/adi,adg1712.yaml

diff --git a/Documentation/devicetree/bindings/switch/adi,adg1712.yaml b/Documentation/devicetree/bindings/switch/adi,adg1712.yaml
new file mode 100644
index 000000000000..eed142eb5b05
--- /dev/null
+++ b/Documentation/devicetree/bindings/switch/adi,adg1712.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/switch/adi,adg1712.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices ADG1712 quad SPST switch controller
+
+maintainers:
+  - Antoniu Miclaus <antoniu.miclaus@analog.com>
+
+description: |
+  Bindings for Analog Devices ADG1712 quad single-pole, single-throw (SPST)
+  switch controlled by GPIOs. The device features four independent switches,
+  each controlled by a dedicated GPIO input pin.
+
+  The switches are configured at probe time based on device tree properties
+  and cannot be changed from userspace after initialization.
+
+properties:
+  compatible:
+    const: adi,adg1712
+
+  switch-gpios:
+    description: |
+      Array of GPIOs connected to the IN1-IN4 control pins.
+      Index 0 corresponds to IN1 (controls SW1),
+      Index 1 corresponds to IN2 (controls SW2),
+      Index 2 corresponds to IN3 (controls SW3),
+      Index 3 corresponds to IN4 (controls SW4).
+    minItems: 4
+    maxItems: 4
+
+  switch-states:
+    description: |
+      Initial states for the four switches (SW1-SW4).
+      Each element corresponds to the desired state of the respective switch:
+      0 = switch disabled (open), 1 = switch enabled (closed).
+      If not specified, all switches default to disabled (0).
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    items:
+      minimum: 0
+      maximum: 1
+    minItems: 4
+    maxItems: 4
+
+required:
+  - compatible
+  - switch-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    adg1712: switch-controller {
+        compatible = "adi,adg1712";
+
+        switch-gpios = <&gpio 10 GPIO_ACTIVE_HIGH>,
+                       <&gpio 11 GPIO_ACTIVE_HIGH>,
+                       <&gpio 12 GPIO_ACTIVE_HIGH>,
+                       <&gpio 13 GPIO_ACTIVE_HIGH>;
+
+        /* Enable SW1 and SW3, disable SW2 and SW4 */
+        switch-states = <1 0 1 0>;
+    };
+...
-- 
2.43.0


