Return-Path: <linux-gpio+bounces-8357-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BB4939FD3
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2024 13:28:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B58171F2285B
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2024 11:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A5D51514D1;
	Tue, 23 Jul 2024 11:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="YZfqZm7Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524E8150984;
	Tue, 23 Jul 2024 11:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721734108; cv=none; b=HyyitoCzTJsojspzhq96AiBeKHSAjHxJbcDRTkCrNP9B4Y8F7eapygQ57vNCqvVDAah5/v5SfYPvG6A+C8jBo8zGAp8EEi6kEYimGQ1xWUDAc9kvNeEY+7X8BBGBvFj/kLQaPe8XrLXM5cj9+NDow93cLwsZDvDwvfOd+UFAHbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721734108; c=relaxed/simple;
	bh=BY9RX9OmhdiwEixbfaIsfq/KameCCnfNFWrW+iwHgQc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rlFG9GmIOGLCST8klsXf9Dylz/5t1xZnbwR9uBQ7exjtrXsdEweYi3iZIKTjHoZ8Aiy3jXhkyPVon+RHLJol7JAkvljHUPpXc+uEm/mlCQJU7/19sR52yTdfIsWsxsZ855gvYVHAdA5PTzJQfgjcxKhqr0bUSboC6UDOA1OPR/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=YZfqZm7Y; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1721734108; x=1753270108;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BY9RX9OmhdiwEixbfaIsfq/KameCCnfNFWrW+iwHgQc=;
  b=YZfqZm7YqfvoHtEFk+NcrHJW58dSBq3veWZaPF0Yufuwr66DAgG9nMEZ
   9qQ8GPF74gMBZDAyigUM0RfD8DQ+k4G/KHklngGKMucuCY+50UKtGvx+2
   RXE/gbGoLXllz3HFAfnnN1BQ4mjsycBdKFIuO3QCAFm5LYwx2i5HFHek6
   KBjE9QYLutccK68w8TVsy96Mp56sk3sC4+mdDKRhruf8nvZhchs+pP0HT
   NxKRf8e6AZq/OARuLKZPZPnT7SXiHl6YbGZLaQqIkJhKi6lSn3i+pbgFb
   vwBf62TRpn/IZ6s3h+BB3FoCYmhErgjyud9IDNe+CR3HP8RZoNr3Zpknx
   A==;
X-CSE-ConnectionGUID: S6DrTYNTSQStcH62wvxgTw==
X-CSE-MsgGUID: jdFJGOP4SlSGNjM3ngZfIA==
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; 
   d="scan'208";a="29574952"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Jul 2024 04:28:19 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jul 2024 04:28:02 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 23 Jul 2024 04:28:00 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-kernel@vger.kernel.org>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Marc Zyngier
	<maz@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>, "Linus
 Walleij" <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	"Rob Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"Thomas Gleixner" <tglx@linutronix.de>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	<linux-riscv@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [RFC v7 1/6] dt-bindings: gpio: fix microchip,mpfs-gpio interrupt descriptions
Date: Tue, 23 Jul 2024 12:27:10 +0100
Message-ID: <20240723-trash-issuing-e2bdd55b764e@wendy>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240723-supervise-drown-d5d3b303e7fd@wendy>
References: <20240723-supervise-drown-d5d3b303e7fd@wendy>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3445; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=BY9RX9OmhdiwEixbfaIsfq/KameCCnfNFWrW+iwHgQc=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGnzJ/cH1BazWMXpyim07n7hOkPoNHPk80lTHsj7HORz/Txn X3pfRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACZydQ8jw5opU+9Y9M4u2LPv/8//zt 80r9z9cjhU3Vbv4iozjXpb8xsM//Qm2gm97fJ0+PxJ7UaT+zEJtsfXr+wySp17hnG/9710TSYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The microchip,mpfs-gpio binding suffered greatly due to being written
with a narrow minded view of the controller, and the interrupt bits
ended up incorrect. It was mistakenly assumed that the interrupt
configuration was set by platform firmware, based on the FPGA
configuration, and that the GPIO DT nodes were the only way to really
communicate interrupt configuration to software.

Instead, the mux should be a device in its own right, and the GPIO
controllers should be connected to it, rather than to the PLIC.
Now that a binding exists for that mux, try to fix the misconceptions
in the GPIO controller binding.

Firstly, it's not possible for this controller to have fewer than 14
GPIOs, and thus 14 interrupts also. There are three controllers, with
14, 24 & 32 GPIOs each.

The example is wacky too - it follows from the incorrect understanding
that the GPIO controllers are connected to the PLIC directly. They are
not however, with a mux sitting in between. Update the example to use
the mux as a parent, and the interrupt numbers at the mux for GPIO2 as
the example - rather than the strange looking, repeated <53>.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/gpio/microchip,mpfs-gpio.yaml    | 28 +++++++++----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
index d61569b3f15b2..eb7dbf1668285 100644
--- a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
@@ -22,7 +22,7 @@ properties:
   interrupts:
     description:
       Interrupt mapping, one per GPIO. Maximum 32 GPIOs.
-    minItems: 1
+    minItems: 14
     maxItems: 32
 
   interrupt-controller: true
@@ -39,9 +39,7 @@ properties:
   ngpios:
     description:
       The number of GPIOs available.
-    minimum: 1
-    maximum: 32
-    default: 32
+    enum: [14, 24, 32]
 
   gpio-controller: true
   gpio-line-names: true
@@ -81,6 +79,7 @@ required:
   - reg
   - "#gpio-cells"
   - gpio-controller
+  - ngpios
   - clocks
 
 additionalProperties: false
@@ -91,18 +90,19 @@ examples:
         compatible = "microchip,mpfs-gpio";
         reg = <0x20122000 0x1000>;
         clocks = <&clkcfg 25>;
-        interrupt-parent = <&plic>;
+        interrupt-parent = <&irqmux>;
         gpio-controller;
         #gpio-cells = <2>;
+        ngpios = <32>;
         interrupt-controller;
-        #interrupt-cells = <1>;
-        interrupts = <53>, <53>, <53>, <53>,
-                     <53>, <53>, <53>, <53>,
-                     <53>, <53>, <53>, <53>,
-                     <53>, <53>, <53>, <53>,
-                     <53>, <53>, <53>, <53>,
-                     <53>, <53>, <53>, <53>,
-                     <53>, <53>, <53>, <53>,
-                     <53>, <53>, <53>, <53>;
+        #interrupt-cells = <2>;
+        interrupts = <64>, <65>, <66>, <67>,
+                     <68>, <69>, <70>, <71>,
+                     <72>, <73>, <74>, <75>,
+                     <76>, <77>, <78>, <79>,
+                     <80>, <81>, <82>, <83>,
+                     <84>, <85>, <86>, <87>,
+                     <88>, <89>, <90>, <91>,
+                     <92>, <93>, <94>, <95>;
     };
 ...
-- 
2.43.2


