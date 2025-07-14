Return-Path: <linux-gpio+bounces-23235-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 579BCB04865
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 22:28:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 968814A6753
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 20:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04C6223958A;
	Mon, 14 Jul 2025 20:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RfoNmqK2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1411F418B;
	Mon, 14 Jul 2025 20:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752524884; cv=none; b=Raqc1JdXI5YtKKfIYJSU5leEmS2d0D1D+8DPm/0lWDSfl8LBAw3ZxM7uP4O4M35+ZbbGXAM2ceRRxWCGNdz/83XrkGXYZLdMqu6qyDktmiSY3KvidY6lcdRYhaF/g9p97wOgEOFPhD7Uk8W7kyqyDjJXqDgRC88C6UdFYNX1Or0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752524884; c=relaxed/simple;
	bh=pg0q2Uz+KVqdVzNHcWzg3oqPkOFOX6hRcT3riQ1YZBg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k0qsEKxBIhQeThQ2NRODKD9HmczHd3Wr4QeSq2vD+hvAa7SWSWShBrnzY5Ph3dbmlhlCSsUJAD5QQkJ57UvsLU5Bh6czVp2uWso2FGYQizF8fAS9dm2FqvxYQ6lkG23clbKnM7KE9tm6KIA9pjW1TBQcHBPOwTHlbc6kLd+CXi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RfoNmqK2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14A6AC4CEED;
	Mon, 14 Jul 2025 20:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752524884;
	bh=pg0q2Uz+KVqdVzNHcWzg3oqPkOFOX6hRcT3riQ1YZBg=;
	h=From:To:Cc:Subject:Date:From;
	b=RfoNmqK2bFbqeY5vNuOasn3TSud/LAp7NXbM0RNeoPU3Lm5ocYMPShSBZ6jfcUDZY
	 iczOyWtdKs9VktSUsp1oOy5yhJxtGtJUDFb4YqrMXGwcv/7lifHldemKOzewej1JBh
	 okYzRm9RK/t1yATwNKXJ2n58IMY83POlunid48kTIxSVgJgfrFWPdVwv3AD5ZxjuBv
	 OpmvLW1tIoy7ptWYxqaQZ4cHAoA0FgM4IhZ9z5tq5RuUr46e6Wqfw6i8qh3jpCLKhY
	 FwKmct7H34QJxE4XeF5xm+2UfpDAWbvGzGXJoU698WhTFIDdCLzrEShL1ZufWqaMJx
	 wBRyXilmMp5gQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Guinot <simon.guinot@sequanux.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: gpio: Convert lacie,netxbig-gpio-ext to DT schema
Date: Mon, 14 Jul 2025 15:28:00 -0500
Message-ID: <20250714202801.3010442-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Lacie NetxBig GPIO binding to DT schema format. It's a
straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/gpio/lacie,netxbig-gpio-ext.yaml | 60 +++++++++++++++++++
 .../bindings/gpio/netxbig-gpio-ext.txt        | 22 -------
 2 files changed, 60 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/lacie,netxbig-gpio-ext.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/netxbig-gpio-ext.txt

diff --git a/Documentation/devicetree/bindings/gpio/lacie,netxbig-gpio-ext.yaml b/Documentation/devicetree/bindings/gpio/lacie,netxbig-gpio-ext.yaml
new file mode 100644
index 000000000000..42021ee14125
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/lacie,netxbig-gpio-ext.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/lacie,netxbig-gpio-ext.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NetxBig GPIO extension bus
+
+maintainers:
+  - Simon Guinot <simon.guinot@sequanux.org>
+
+description: >
+  GPIO extension bus found on some LaCie/Seagate boards
+  (Example: 2Big/5Big Network v2, 2Big NAS).
+
+properties:
+  compatible:
+    items:
+      - const: lacie,netxbig-gpio-ext
+
+  addr-gpios:
+    description: GPIOs representing the address register (LSB->MSB).
+    items:
+      - description: bit 0 (LSB)
+      - description: bit 1
+      - description: bit 2 (MSB)
+
+  data-gpios:
+    description: GPIOs representing the data register (LSB->MSB).
+    items:
+      - description: bit 0 (LSB)
+      - description: bit 1
+      - description: bit 2 (MSB)
+
+  enable-gpio:
+    description: Latches the new configuration (address, data) on raising edge.
+    maxItems: 1
+
+required:
+  - compatible
+  - addr-gpios
+  - data-gpios
+  - enable-gpio
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    gpio {
+        compatible = "lacie,netxbig-gpio-ext";
+        addr-gpios = <&gpio1 15 GPIO_ACTIVE_HIGH
+                      &gpio1 16 GPIO_ACTIVE_HIGH
+                      &gpio1 17 GPIO_ACTIVE_HIGH>;
+        data-gpios = <&gpio1 12 GPIO_ACTIVE_HIGH
+                      &gpio1 13 GPIO_ACTIVE_HIGH
+                      &gpio1 14 GPIO_ACTIVE_HIGH>;
+        enable-gpio = <&gpio0 29 GPIO_ACTIVE_HIGH>;
+    };
diff --git a/Documentation/devicetree/bindings/gpio/netxbig-gpio-ext.txt b/Documentation/devicetree/bindings/gpio/netxbig-gpio-ext.txt
deleted file mode 100644
index 50ec2e690701..000000000000
--- a/Documentation/devicetree/bindings/gpio/netxbig-gpio-ext.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Binding for the GPIO extension bus found on some LaCie/Seagate boards
-(Example: 2Big/5Big Network v2, 2Big NAS).
-
-Required properties:
-- compatible: "lacie,netxbig-gpio-ext".
-- addr-gpios: GPIOs representing the address register (LSB -> MSB).
-- data-gpios: GPIOs representing the data register (LSB -> MSB).
-- enable-gpio: latches the new configuration (address, data) on raising edge.
-
-Example:
-
-netxbig_gpio_ext: netxbig-gpio-ext {
-	compatible = "lacie,netxbig-gpio-ext";
-
-	addr-gpios = <&gpio1 15 GPIO_ACTIVE_HIGH
-		      &gpio1 16 GPIO_ACTIVE_HIGH
-		      &gpio1 17 GPIO_ACTIVE_HIGH>;
-	data-gpios = <&gpio1 12 GPIO_ACTIVE_HIGH
-		      &gpio1 13 GPIO_ACTIVE_HIGH
-		      &gpio1 14 GPIO_ACTIVE_HIGH>;
-	enable-gpio = <&gpio0 29 GPIO_ACTIVE_HIGH>;
-};
-- 
2.47.2


