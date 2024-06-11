Return-Path: <linux-gpio+bounces-7362-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B08903E48
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 16:01:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80DBA1C25C75
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 14:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38B0617D8B2;
	Tue, 11 Jun 2024 14:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="H1evq0Dq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44361176ABA;
	Tue, 11 Jun 2024 14:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718114444; cv=none; b=ghcsUAI0Ki/tTzQPvyUTQkRe9WSMeKfMDHUmlBhkYeyivhSQQnpr9dpWa8PSd/gtK49esLrbIBio3BFRC/RtgNW4IMyv0cDJsrbe6ANxS7qqMm+8YWBRyoW3qUpLyksbirBz3aS01CNzG3WdMYfpV0S+w0kMRSPsiDSez4UQcPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718114444; c=relaxed/simple;
	bh=Nn4o4q+BV9qqo5+3JXOfWLj3V0S/VMi7dVbqAdD7kd0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TkINHqSrjKcX/XxBH02DwpBy0BzZE053MuDdHg/3x2dIIKE53psgNUaokCoE37nyJ95/Tdsu7MlHFyY3/0+pxZhXU/fuu9i0bsvkS5mGJVOG0MP1n6y7LCXgo8sJ4TrORQGVOXpJ9xlnEcqVd4u2W3+sY+75Z9Q4DV0CzTDF1o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=H1evq0Dq; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45BE0aVY077223;
	Tue, 11 Jun 2024 09:00:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718114436;
	bh=UksPvX2iT5jFoUevaSSujIFfKusReYrJlUO5ZImZzJE=;
	h=From:To:CC:Subject:Date;
	b=H1evq0Dq7+r1lVU+TBUsSZjRTmrtz/7ql5n8LTuhfc1+wJg2fvZ/qHiyYHjfVZtIt
	 sMrC2Kfz2395Weq+epIIQtiGNT5L2i448dffVg8VghhWO4thcybUMoPCrGtlQ5eAOm
	 CL28OAs1Y8bgTaxRSp7vIth/7Gviqp18CTyE2QYU=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45BE0aIl055885
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Jun 2024 09:00:36 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 11
 Jun 2024 09:00:35 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 11 Jun 2024 09:00:35 -0500
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45BE0Zc9102178;
	Tue, 11 Jun 2024 09:00:35 -0500
From: Andrew Davis <afd@ti.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski
	<brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH] dt-bindings: gpio: lsi,zevio-gpio: convert to YAML
Date: Tue, 11 Jun 2024 09:00:34 -0500
Message-ID: <20240611140034.24685-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Convert Zevio GPIO controller bindings to DT schema.

Changes during conversion:
 - Add used but undocumented interrupts property

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../devicetree/bindings/gpio/gpio-zevio.txt   | 16 -------
 .../bindings/gpio/lsi,zevio-gpio.yaml         | 46 +++++++++++++++++++
 2 files changed, 46 insertions(+), 16 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-zevio.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/lsi,zevio-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-zevio.txt b/Documentation/devicetree/bindings/gpio/gpio-zevio.txt
deleted file mode 100644
index a37bd9ae27307..0000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-zevio.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-Zevio GPIO controller
-
-Required properties:
-- compatible: Should be "lsi,zevio-gpio"
-- reg: Address and length of the register set for the device
-- #gpio-cells: Should be two. The first cell is the pin number and the
-  second cell is used to specify optional parameters (currently unused).
-- gpio-controller: Marks the device node as a GPIO controller.
-
-Example:
-	gpio: gpio@90000000 {
-		compatible = "lsi,zevio-gpio";
-		reg = <0x90000000 0x1000>;
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
diff --git a/Documentation/devicetree/bindings/gpio/lsi,zevio-gpio.yaml b/Documentation/devicetree/bindings/gpio/lsi,zevio-gpio.yaml
new file mode 100644
index 0000000000000..542b5f9a495d9
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/lsi,zevio-gpio.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/lsi,zevio-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Zevio GPIO controller
+
+maintainers:
+  - Andrew Davis <afd@ti.com>
+
+properties:
+  compatible:
+    const: lsi,zevio-gpio
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    description: The first cell is the pin number and the second cell is used
+      to specify optional parameters (currently unused).
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - gpio-controller
+  - "#gpio-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio: gpio@90000000 {
+        compatible = "lsi,zevio-gpio";
+        reg = <0x90000000 0x1000>;
+        interrupts = <7>;
+        gpio-controller;
+        #gpio-cells = <2>;
+    };
-- 
2.39.2


