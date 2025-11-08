Return-Path: <linux-gpio+bounces-28263-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC67C43235
	for <lists+linux-gpio@lfdr.de>; Sat, 08 Nov 2025 18:43:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A27B3188D84D
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Nov 2025 17:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 912A0272803;
	Sat,  8 Nov 2025 17:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="NNPp2+f5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A0526FA77;
	Sat,  8 Nov 2025 17:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762623790; cv=none; b=BUV/EezobJSGgq7UUcM8eVGx1+M5z9iIRjIVmo/KcglMc5IckzBqxm+euEbsqslP7hUPyeiRqWtb4su5+zmVWUWZcEFXOiMSpyzqhd8RxKb4ZCOmWm8brf6VTCIh4RBYzNoTR7f3nrQBMHcGiwg2k93L8RcXb4EF+1rC4XIE+Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762623790; c=relaxed/simple;
	bh=wSNBqUooK+OTHs5WmueOP+TSGIuU25eRU+kJR8kmOhw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=crhtv5X3tkTMUX8aUebEqlJFGtWh4FOj7AgyU0pQwdHVzNqjFvWTF7+nskYWP3twArBqGpoxyF/L1npL4NhTwGFbeeRDAHTD4ujwW1hVn5sD1Hfup7foZU6lAxGxEP6dRDxQ8xQDDt64snEna8j3uCyY6QWH7b0ccjlGPMdSTp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=NNPp2+f5; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A8CMdLR3114133;
	Sat, 8 Nov 2025 12:42:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=t9gcC
	2maFD8pRLEdBQLNy+zbbAcSaeGZ2ADrQ2C1GV0=; b=NNPp2+f5ShOMeIj2AR+sr
	MO+1PBLWiD8NNpdH/n+CSb0JX0xjHDQ8xpjpwXjRKfqr+tX4ywtcCpfX1OkxEqw+
	NcjfIYaISR7vikpk0KynYOZ6jl2LX91gPl2gZ9JTUzy/sm2f9SQtlWjE2Q8DykGI
	ynVuXEccubc0aumL6+rJL8oDYmuVtXTff2i/OcEUL2yWr9XA2qs6UG/YbpX5v3CN
	noGg2vJPp2x5jBfJ/mJw2dB0H1MJeFsk1tpmbAFYn8CPos5lrMMeUoZIZkrISaNr
	BYRgQnYGsTUFVSX7aLK+JR/59ao1f9Qkc53U265wsVCrbnMADV/MqMH/mkpJ0NHD
	Q==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4a9xtx29kb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Nov 2025 12:42:52 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 5A8HgpRP030777
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 8 Nov 2025 12:42:51 -0500
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Sat, 8 Nov 2025 12:42:51 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Sat, 8 Nov 2025 12:42:51 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Sat, 8 Nov 2025 12:42:51 -0500
Received: from Ubuntu.ad.analog.com ([10.32.15.145])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 5A8HgarE028532;
	Sat, 8 Nov 2025 12:42:47 -0500
From: Antoniu Miclaus <antoniu.miclaus@analog.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski
	<brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Antoniu Miclaus <antoniu.miclaus@analog.com>
Subject: [PATCH v2 1/2] dt-bindings: gpio: adg1712: add adg1712 support
Date: Sat, 8 Nov 2025 17:40:28 +0000
Message-ID: <20251108174055.3665-2-antoniu.miclaus@analog.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251108174055.3665-1-antoniu.miclaus@analog.com>
References: <20251108174055.3665-1-antoniu.miclaus@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: up0sQhsK5ATwet5h0p1XnxqnlY2rxG0f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDE0MyBTYWx0ZWRfX7QkU9Mnic1cE
 QtOSvLaElwy6YvayLYYI23OeITffcBej1rBrXhigbYrIdR9TtmK2eUWOsLw99BTBG5J6a+/Y8z2
 eNhbr6Eoikj62bpOyncTUbYAgKXOE7yOD8L4YN/AZYRYcX2PPJSW28rEvQI5eKzUFiMb9mbAj1S
 Yf2/lOBsgWvndslcQ5KOfXV3LIFcXIE2gjqDm47BWNiNJCCTCEWzShCSR/e+GaCstyrqto7zilf
 Eqb6OnNjlHvFZsv0vWUU+fVT3UzlFoF7/nbyoGiflGRtASdgNMDAi+ieodm78pNE80/6i11Q575
 qkzxHrSzvzaCDfG1SPdMR3kY7QwzjLEkYDzib2MXZIkllF+vjxGia+jnhQuDoiFxWcLlkRUJvXn
 v4QdEjCJC+2oF4wN03/4nKzKsH4iXQ==
X-Authority-Analysis: v=2.4 cv=Ao/jHe9P c=1 sm=1 tr=0 ts=690f811d cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=gAnH3GRIAAAA:8
 a=rKaqALp09OgZ7UrXzpoA:9 a=sptkURWiP4Gy88Gu7hUp:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: up0sQhsK5ATwet5h0p1XnxqnlY2rxG0f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511080143

Add devicetree bindings for adg1712 SPST quad switch.

Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
---
Changes in v2:
- Replace individual GPIO properties (switch1-gpios, switch2-gpios, etc.)
  with a single GPIO array property (switch-gpios)
- Update required properties list accordingly
- Simplify device tree example to use array notation
---
 .../devicetree/bindings/gpio/adi,adg1712.yaml | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/adi,adg1712.yaml

diff --git a/Documentation/devicetree/bindings/gpio/adi,adg1712.yaml b/Documentation/devicetree/bindings/gpio/adi,adg1712.yaml
new file mode 100644
index 000000000000..d6000a788d6e
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/adi,adg1712.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/adi,adg1712.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices ADG1712 quad SPST switch GPIO controller
+
+maintainers:
+  - Antoniu Miclaus <antoniu.miclaus@analog.com>
+
+description: |
+  Bindings for Analog Devices ADG1712 quad single-pole, single-throw (SPST)
+  switch controlled by GPIOs. The device features four independent switches,
+  each controlled by a dedicated GPIO input pin.
+
+  Each GPIO line exposed by this controller corresponds to one of the four
+  switches (SW1-SW4) on the ADG1712. Setting a GPIO line high enables the
+  corresponding switch, while setting it low disables the switch.
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
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+    description: |
+      The first cell is the GPIO number (0-3 corresponding to SW1-SW4).
+      The second cell specifies GPIO flags.
+
+required:
+  - compatible
+  - switch-gpios
+  - gpio-controller
+  - "#gpio-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    adg1712: gpio-expander {
+        compatible = "adi,adg1712";
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        switch-gpios = <&gpio 10 GPIO_ACTIVE_HIGH>,
+                       <&gpio 11 GPIO_ACTIVE_HIGH>,
+                       <&gpio 12 GPIO_ACTIVE_HIGH>,
+                       <&gpio 13 GPIO_ACTIVE_HIGH>;
+    };
+...
-- 
2.43.0


