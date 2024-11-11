Return-Path: <linux-gpio+bounces-12798-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EAC9C35BE
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 01:59:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 153F228255A
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 00:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB7271BC41;
	Mon, 11 Nov 2024 00:58:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31D971F931;
	Mon, 11 Nov 2024 00:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731286690; cv=none; b=HFwOAbdNOrYIM2v6rJPX+aaBJXBdmwusBh5bXisepKD6xLJzD7aUB3QLH7aQ5RIwRgnmXGsLp9tC47jd76J5TnMRsRMr983MQft+LUfKVma8P+FUOXOwnB6IOKql1n8KKjeX6L2OYNGRH34vbVk0AF2UaHUt8JXgkiZRvgZpwXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731286690; c=relaxed/simple;
	bh=CWN0jq8vcuB1Ky6KZS26tUZRFKhqv7hMJXq5ybnrBk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f5uUvp99dkAgOiIuoXY0LAGKrDme8DHKJXpcVZfJbAKG/kXrhkVYteyEiFhu5LmL3jEuFIitZu5d6K2MH66PTHINtlbYF2pn/7QQgZYDNKJJ5NbEfFSmV1I7ZKx3xr7Z3LoRcfhGo0G53mz8luVTKsqaoWCkQhSopUXPW8NImAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9406D13D5;
	Sun, 10 Nov 2024 16:58:38 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C02C3F66E;
	Sun, 10 Nov 2024 16:58:06 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] dt-bindings: pinctrl: add compatible for Allwinner A523/T527
Date: Mon, 11 Nov 2024 00:57:48 +0000
Message-ID: <20241111005750.13071-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241111005750.13071-1-andre.przywara@arm.com>
References: <20241111005750.13071-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A523 contains a pin controller similar to previous SoCs, although
using 10 GPIO banks (PortB-PortK), all of them being IRQ capable.
This introduces a new style of binding, where the pinmux values for each
pin group is stored in the new "allwinner,pinmux" property in the DT
node, instead of requiring every driver to store a mapping between the
function names and the required pinmux.

Add the new name to the list of compatible strings, and required it to
have 10 interrupts described. Also add the new pinmux property.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
index 4502405703145..6fc18e92e1e94 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
@@ -56,6 +56,8 @@ properties:
       - allwinner,sun50i-h6-r-pinctrl
       - allwinner,sun50i-h616-pinctrl
       - allwinner,sun50i-h616-r-pinctrl
+      - allwinner,sun55i-a523-pinctrl
+      - allwinner,sun55i-a523-r-pinctrl
       - allwinner,suniv-f1c100s-pinctrl
       - nextthing,gr8-pinctrl
 
@@ -64,7 +66,7 @@ properties:
 
   interrupts:
     minItems: 1
-    maxItems: 8
+    maxItems: 10
     description:
       One interrupt per external interrupt bank supported on the
       controller, sorted by bank number ascending order.
@@ -119,13 +121,17 @@ patternProperties:
         $ref: /schemas/types.yaml#/definitions/uint32
         enum: [10, 20, 30, 40]
 
+      allwinner,pinmux:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description: pinmux selector for each pin
+
     required:
       - pins
       - function
 
     additionalProperties: false
 
-  "^vcc-p[a-ilm]-supply$":
+  "^vcc-p[a-klm]-supply$":
     description:
       Power supplies for pin banks.
 
@@ -156,6 +162,17 @@ allOf:
         - interrupts
         - interrupt-controller
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - allwinner,sun55i-a523-pinctrl
+
+    then:
+      properties:
+        interrupts:
+          minItems: 10
+
   - if:
       properties:
         compatible:
@@ -166,6 +183,7 @@ allOf:
       properties:
         interrupts:
           minItems: 8
+          maxItems: 8
 
   - if:
       properties:
@@ -244,6 +262,7 @@ allOf:
             - allwinner,sun8i-v3s-pinctrl
             - allwinner,sun9i-a80-r-pinctrl
             - allwinner,sun50i-h6-r-pinctrl
+            - allwinner,sun55i-a523-r-pinctrl
 
     then:
       properties:
-- 
2.46.2


