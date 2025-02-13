Return-Path: <linux-gpio+bounces-15910-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AB8A34010
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 14:17:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88E213AA58B
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 13:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80176227E95;
	Thu, 13 Feb 2025 13:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="HurjaDLO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9512923F420;
	Thu, 13 Feb 2025 13:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739452644; cv=none; b=dL/6/aafgPywdCCpox8Z/t2CoSTnsR29aEbvC1QbtKsraR4oe8ke0rwuo7W+1gke7JgMtMFjWgwirdEZCveEoEZPw4Kc6P/D+jSb3xTF/fAWWyM3Bjcm8ytOtCgcmBXnSmd+iJ1YF7I80jq5ez/EgwtC0p2qQTxL1MCwOhh7+ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739452644; c=relaxed/simple;
	bh=edNZ+E0LjV+T3cJA6cB3gdhXc7r0uMWu0+orl2QOV20=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=IMSUpt2N3uI/iMvNc95FvSd6Cmo3ky9vUOtKcA4X0KrJpjSoelm3jXG4ca67x2P4KMr0OxNYDKR04lDD+5Cyic7gvLenFPeCpRipN1l4bTJQ2Vc77xlk24U5yOYWb6xTiEVV3VlW7tOIQG5vCNDxMnzRHSCurM91VtfMiMOl7OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=HurjaDLO; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DCfSE2021274;
	Thu, 13 Feb 2025 08:17:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=ovQpS
	loz9rChCDvjfyyVMQa3xIxq8rpIOOCji7wgU3A=; b=HurjaDLOLkGtgMBDFIhwQ
	z+bYOsoGxbrv7tWYAzLzo6LKtSl74AKPPjvMX/CcW+qw+xcFUigLpd2b8bm5ZtkI
	2DQK+VzUFUYnO+ijPOyl7LJRqiYH+PRjPqpzoeXI9P4yM1wFp5Gs1x37CskYi/+s
	JWRqCsSjSr73ja8Qx0Kh5RxOI4vh+0P1cOodYG4EuBCK9+17AovUZnkZMi/MDy04
	MLAtFyx2Wg0HNRQ7LajR3h3uciVqdHjXbMyqFcU11grJrf7CnK/PoC5aOwNoMWIR
	Ulgp/Gp0xKQjDHRTIBn/Hso6ZJGBJbUOiCWpbt2jVN+oEbpdEn5TGbOnkdPgNYYt
	w==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 44s2dq3uaf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 08:17:07 -0500 (EST)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 51DDH613019719
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Feb 2025 08:17:06 -0500
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Thu, 13 Feb 2025 08:17:06 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Thu, 13 Feb 2025 08:17:05 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Thu, 13 Feb 2025 08:17:05 -0500
Received: from [127.0.1.1] (KPALLER2-L03.ad.analog.com [10.116.18.50])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 51DDGm8X026310;
	Thu, 13 Feb 2025 08:17:00 -0500
From: Kim Seer Paller <kimseer.paller@analog.com>
Date: Thu, 13 Feb 2025 21:15:09 +0800
Subject: [PATCH v2 1/2] dt-bindings: gpio: add adg1414
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250213-for_upstream-v2-1-ec4eff3b3cd5@analog.com>
References: <20250213-for_upstream-v2-0-ec4eff3b3cd5@analog.com>
In-Reply-To: <20250213-for_upstream-v2-0-ec4eff3b3cd5@analog.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski
	<brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Kim Seer Paller <kimseer.paller@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739452608; l=2947;
 i=kimseer.paller@analog.com; s=20250213; h=from:subject:message-id;
 bh=edNZ+E0LjV+T3cJA6cB3gdhXc7r0uMWu0+orl2QOV20=;
 b=AJYZ4Wo7ybEBAZO3cqoWNvzTBRXmmYqiuGiSHsyzjiCR4EvuW6xYm/hGmzfHRCSZgXo3Grxf5
 J6tFYEJRzZdBqMIw4fNIn6Xag2bGYRyws4oKFKr2n5fZMREEBIvf4jX
X-Developer-Key: i=kimseer.paller@analog.com; a=ed25519;
 pk=SPXIwGLg4GFKUNfuAavY+YhSDsx+Q+NwGLceiKwm8Ac=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: lkON6daIQZjNJs1Zawso92Vv22_6XUaD
X-Authority-Analysis: v=2.4 cv=Ntcrc9dJ c=1 sm=1 tr=0 ts=67adf0d3 cx=c_pps a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=gEfo2CItAAAA:8 a=gAnH3GRIAAAA:8 a=iox4zFpeAAAA:8 a=VwQbUJbxAAAA:8
 a=oRDIW74zlatnnfyD9XgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=oVHKYsEdi7-vN-J5QA_j:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-GUID: lkON6daIQZjNJs1Zawso92Vv22_6XUaD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_06,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 clxscore=1011 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502130102

The ADG1414 is a 9.5 Ω RON ±15 V/+12 V/±5 V iCMOS Serially-Controlled
Octal SPST Switches.

Signed-off-by: Kim Seer Paller <kimseer.paller@analog.com>
---
 .../devicetree/bindings/gpio/adi,adg1414-gpio.yaml | 68 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 ++
 2 files changed, 74 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/adi,adg1414-gpio.yaml b/Documentation/devicetree/bindings/gpio/adi,adg1414-gpio.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..2c91175d3c7e0a030a894953abfad003ace23744
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/adi,adg1414-gpio.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/adi,adg1414-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ADG1414 Serially-Controlled Octal SPST Switches
+
+maintainers:
+  - Kim Seer Paller <kimseer.paller@analog.com>
+
+description:
+  The ADG1414 is a 9.5 Ω RON ±15 V/+12 V/±5 V iCMOS serially-controlled
+  octal SPST switches.
+
+properties:
+  compatible:
+    enum:
+      - adi,adg14140-gpio
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  spi-cpha: true
+
+  reset-gpios:
+    description: RESET/Logic Power Supply Input (VL). When the RESET/VL pin is
+      low, all switches are off and the appropriate registers are cleared to 0.
+    maxItems: 1
+
+  '#daisy-chained-devices':
+    description: The number of daisy-chained devices.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 1
+    minimum: 1
+    maximum: 4
+
+required:
+  - compatible
+  - reg
+  - spi-cpha
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        gpio@0 {
+            compatible = "adi,adg14140-gpio";
+            reg = <0>;
+            spi-max-frequency = <1000000>;
+            spi-cpha;
+            reset-gpios = <&gpio 17 GPIO_ACTIVE_HIGH>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 25c86f47353de25c88291cc7fd6c4e9bfb12d5c4..66d92be0f57daa9eabb48d7e53b6b2bea0c40863 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -498,6 +498,12 @@ W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/net/ieee802154/adf7242.txt
 F:	drivers/net/ieee802154/adf7242.c
 
+ADG1414 SPST Switch Driver
+M:	Kim Seer Paller <kimseer.paller@analog.com>
+S:	Supported
+W:	https://ez.analog.com/linux-software-drivers
+F:	Documentation/devicetree/bindings/gpio/gpio-adg1414.yaml
+
 ADM1025 HARDWARE MONITOR DRIVER
 M:	Jean Delvare <jdelvare@suse.com>
 L:	linux-hwmon@vger.kernel.org

-- 
2.34.1


