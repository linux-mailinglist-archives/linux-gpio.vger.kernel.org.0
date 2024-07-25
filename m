Return-Path: <linux-gpio+bounces-8381-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 017B393C1A7
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jul 2024 14:18:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FED61F24CA9
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jul 2024 12:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0FF019AA77;
	Thu, 25 Jul 2024 12:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="sDAixSBV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2001719AA7B;
	Thu, 25 Jul 2024 12:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721909810; cv=none; b=MLFOurMLoRuwRDCJKz9CueMx+cI++JcC8u4Myy+2oZyu1YmzgtK/q2thpgJUQEBbBrkl5txJXmXNzsDTXRRhW5miHHMF9K/qSLVXyfJA78zka4IlTdZUIlyW0Z56pwD9cgG3XIaExCmjagJmT3EZA8IfVTWCrXLcgVy0w9qCJaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721909810; c=relaxed/simple;
	bh=/iFlJVgVNMjAyvZbdlWZH31ro/rYnKrZRjv+0TbNhEY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=upZ+euUH4JGvtUvWEJYyyUSO2/mIldIV7sGcGoCHXqZBijCbsyFtIKFigKkE8WlRXmgu+f3HXfl+6oXpx0etQa9jxx53fRIM83u5ncsbbH/KquydoE5uoOPXMbT9+nRjXBGcIBb20hD7yYTgaD5NxQIAfyHZUoVXbEuQpw+olPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=sDAixSBV; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1721909809; x=1753445809;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/iFlJVgVNMjAyvZbdlWZH31ro/rYnKrZRjv+0TbNhEY=;
  b=sDAixSBV2qDnC+1ttQdxI9DGNcEzklIk1z1HJ/A5zL9TQTSobJCCWRud
   MolYGZOFuI7Yf8mVHSlb7bVJYQvblM04uAUUXrRmLzs+VbxgaXmQ8mWkG
   BiCgzJnvannXjCHXVnxcegJmd6D9maxu3DoiXGMj1Zpum5BwhmR/aszmZ
   i8st8oce+ia6hTqKmFiIPXLo97Xo+IaU11EwA3VaiR9kFEPz2WnNYDIkQ
   sgy6HRAO5T7yPJX2wsB2yzAWjaCL+uanjAj1eGnBBb321WFot0ZdBbewl
   adI5TJsJDxPbVG+e5RsEt7ysG0ybgD49JlkiB3S3YiwIVEDTJ5iZDLRhJ
   g==;
X-CSE-ConnectionGUID: 73d5wsqqRUGsXcUpyIWy1Q==
X-CSE-MsgGUID: 6l13QotSQ0m9lhZr3PAqtA==
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="260575367"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Jul 2024 05:16:46 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jul 2024 05:16:28 -0700
Received: from ph-emdalo.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 25 Jul 2024 05:16:26 -0700
From: <pierre-henry.moussay@microchip.com>
To: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>
CC: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	<linux-riscv@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 05/17] dt-bindings: gpio: mpfs-gpio: Add PIC64GX GPIO compatibility
Date: Thu, 25 Jul 2024 13:15:57 +0100
Message-ID: <20240725121609.13101-6-pierre-henry.moussay@microchip.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
References: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

PIC64GX GPIO is compatible with mpfs-gpio driver

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
---
 .../bindings/gpio/microchip,mpfs-gpio.yaml       | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
index d61569b3f15b..fdce88374a91 100644
--- a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
@@ -11,10 +11,14 @@ maintainers:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - microchip,mpfs-gpio
-          - microchip,coregpio-rtl-v3
+    oneOf:
+      - items:
+          - const: microchip,pic64gx-gpio
+          - const: microchip,mpfs-gpio
+      - items:
+          - enum:
+              - microchip,mpfs-gpio
+              - microchip,coregpio-rtl-v3
 
   reg:
     maxItems: 1
@@ -69,7 +73,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: microchip,mpfs-gpio
+            enum:
+              - microchip,mpfs-gpio
+              - microchip,pic64gx-gpio
     then:
       required:
         - interrupts
-- 
2.30.2


