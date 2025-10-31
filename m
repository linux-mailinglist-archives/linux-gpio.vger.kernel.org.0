Return-Path: <linux-gpio+bounces-27909-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5EFC2620D
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 17:33:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F59B586E25
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 16:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE2892FF15A;
	Fri, 31 Oct 2025 16:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="KNRt1KIA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E462EC561;
	Fri, 31 Oct 2025 16:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761926913; cv=none; b=nvDxK5FnO/lnZg5RZLludcYY/Q+40AzifywIOcrlT2UVbT4CymfEa+UZj6zfkmAsIrj+n2ec30oViWz4Q8IeJIBGDfscUHqWkwb1KGOEn+l40kZMg7I+qjus0ugAfjXsox5S93rHei903QDKsWBwrMHoaDkltX97GVSCJaxxGbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761926913; c=relaxed/simple;
	bh=y6F2b7L2tv5nqkeaMAGUfbcwqzJ1r7ylQH8ay4e86Ms=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HYlDw5kWds5dOUs6xAM3eDJO4B2kdpZrgEmuFN6D9l5WVf43H4D8opaE85rAib+RVmnJ+LvfJJKz2rLhNSJOPPB4irtHIyWedDn4/j6xkbbojZBI1PCji6F723k0HZ9MMM5+fg+UUxAdUuQgyyWOGzGphNJU/IOrjAbFVkWs8yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=KNRt1KIA; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59VEYlOR1109199;
	Fri, 31 Oct 2025 12:08:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=jVJpO
	EmypMJRWpVs94UdffvowskP1OAVcxOIdjWKuzM=; b=KNRt1KIALVQlyia5AwqPE
	eZJX1Kw50oEDUys6LOusc+jkfUsUv3EjveZS/isGQ1bIT+EfYm+QEcPGlLDSOb88
	CE09WO+fNLKhoSr/3qHQraWzoUHeI9Brl3lwJWAkwPl5Wmm8BxnAchAtzMOGgG36
	50f+HclLfa9fsH3+EfqZiZ4Xp+u2mQsl2ajYGSb3v43Edy5GjjoQSsn9WPt0lFpI
	fuA+lAQk/VhKRbuVKcU9RpllFy44DaOZ0xsQLkd/buB/giRIpqT3ktTn0n+G9YeP
	j0pOTKML2Mz/p6XiIhVER7ZP5BIZELqfThu24mZSaL0fmRY2FfAuK7dLCtXUd1ay
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4a4p8atwej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Oct 2025 12:08:28 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 59VG8RrG064684
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 31 Oct 2025 12:08:27 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Fri, 31 Oct
 2025 12:08:27 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Fri, 31 Oct 2025 12:08:27 -0400
Received: from Ubuntu.ad.analog.com ([10.32.15.145])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 59VG89ra006955;
	Fri, 31 Oct 2025 12:08:20 -0400
From: Antoniu Miclaus <antoniu.miclaus@analog.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski
	<brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Antoniu Miclaus <antoniu.miclaus@analog.com>
Subject: [PATCH 1/2] dt-bindings: gpio: adg1712: add adg1712 support
Date: Fri, 31 Oct 2025 16:07:04 +0000
Message-ID: <20251031160710.13343-2-antoniu.miclaus@analog.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031160710.13343-1-antoniu.miclaus@analog.com>
References: <20251031160710.13343-1-antoniu.miclaus@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=R4QO2NRX c=1 sm=1 tr=0 ts=6904defc cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=gAnH3GRIAAAA:8
 a=rKaqALp09OgZ7UrXzpoA:9 a=sptkURWiP4Gy88Gu7hUp:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: azpzu1qmw0oJzce2RbeCzSNJdvVylfk-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDE0NSBTYWx0ZWRfXxfRunGP0i8P8
 19vfbxUsq5g17H5B363WmSHqi16rilElMR0aK7MHagA1OyWyy6lzC+M0k1Dk9a1z9+Ck9KQ20f9
 ArKeJfui0Qgd2NGo7CGW/Fx/DVSy8I0Fn75tRNr80FVZmi2uucAPHdusm+W0+1vMk1VxpWWrFZA
 C8vW3O+Yq7tZr3bVva9M812EYeHU6/IFZXyM3WJkvrYxlKQMI0VKuwgAUHngVTFuB/Ns7Y5SIIb
 MvNPBjrycEpncRh6B4i5y/0lTGT3+LI3DdCRHfvxayXUVZxfhyBRGgolilCbiCq7NzRZSwBGbt1
 aeeZXpgFZnlWkp5fP5RheNoI3P/iN5TUeBxUx7LXmNk43h1ElBfN6BjLXzk3/UVNpf8ph0ymRca
 cl1bfch9QMyHciS7w4NRUbEWSXxzKw==
X-Proofpoint-GUID: azpzu1qmw0oJzce2RbeCzSNJdvVylfk-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_05,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 clxscore=1011 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310145

Add devicetree bindings for adg1712 SPST quad switch.

Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
---
 .../devicetree/bindings/gpio/adi,adg1712.yaml | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/adi,adg1712.yaml

diff --git a/Documentation/devicetree/bindings/gpio/adi,adg1712.yaml b/Documentation/devicetree/bindings/gpio/adi,adg1712.yaml
new file mode 100644
index 000000000000..2c26d2a7def8
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/adi,adg1712.yaml
@@ -0,0 +1,75 @@
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
+  switch1-gpios:
+    description: GPIO connected to the IN1 control pin (controls SW1)
+    maxItems: 1
+
+  switch2-gpios:
+    description: GPIO connected to the IN2 control pin (controls SW2)
+    maxItems: 1
+
+  switch3-gpios:
+    description: GPIO connected to the IN3 control pin (controls SW3)
+    maxItems: 1
+
+  switch4-gpios:
+    description: GPIO connected to the IN4 control pin (controls SW4)
+    maxItems: 1
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
+  - switch1-gpios
+  - switch2-gpios
+  - switch3-gpios
+  - switch4-gpios
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
+        switch1-gpios = <&gpio 10 GPIO_ACTIVE_HIGH>;
+        switch2-gpios = <&gpio 11 GPIO_ACTIVE_HIGH>;
+        switch3-gpios = <&gpio 12 GPIO_ACTIVE_HIGH>;
+        switch4-gpios = <&gpio 13 GPIO_ACTIVE_HIGH>;
+    };
+
+...
\ No newline at end of file
-- 
2.43.0


