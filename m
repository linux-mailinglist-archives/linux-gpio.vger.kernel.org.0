Return-Path: <linux-gpio+bounces-10216-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C4397B056
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 14:46:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90A1A1F214E6
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 12:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BED72173336;
	Tue, 17 Sep 2024 12:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Fobrevby"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50EF16F824;
	Tue, 17 Sep 2024 12:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726577200; cv=none; b=tX7i4+7o6zNHBE0LmwCcJM8aFkNDbN5CviBje4lDMTig5PJuj/A4aPXS8CoG87PKTgymznzSTTrRT/KtIzpbaY54m8KtHrT8GyF8n6uDarICjY4f1+FWRw+quvWEphHDlGlRM0M0ZI700Fja/FZutRfy+irtdUzyC2pxXfeFw9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726577200; c=relaxed/simple;
	bh=QTN588y1NYdQFXMYeg9ryfUMQIb/+IcEPrnA18wx4NM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=MzAHG7ZcrA+i+MBJy0H37yicFuvcbUgh7FqJPJeketf93X911fw/CQRc9DnlvlpcmlvLcvtz6IwRP4t4phbeVWkS6u131grDLVDLSjV5YhCUIVFmP5DBP3ef1COGG9QuuztyG2AgvejfnJHF9OAxOIC1th3NzsTLBIMiLcvROjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Fobrevby; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1726577198; x=1758113198;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=QTN588y1NYdQFXMYeg9ryfUMQIb/+IcEPrnA18wx4NM=;
  b=FobrevbyhLW1Uy5h7wghtb4KxKWVs1fPlux2dg8esJemSnvtwchm3jNk
   v7XfxqM0d2gfJXHvaTOHYentkFMlTyj7RqP6yC4GlN4wvBkuDG2PqdlSy
   dWOk76n5+KzP9i8fjcAl0zwWxVkAWt6ngpyyug3EkuTA4OY2T2vcuhJm9
   X1oyr1yePwSkXoEt4mq0YKyn9VNNJ6gHFEnKp+sGkev1dUEBeBOfSyE17
   ycLP/ItzEAVgBfoDZDGCR/8oyA5UCJPkOX2CgrxIfGsu0eG5jHny+MFrq
   5uNAu9rBBobi6I3wJ0oL9K+KjcxNtUAI7CaiCLn2oWH4S1/B0C02Vat93
   g==;
X-CSE-ConnectionGUID: 6lM18nCBTHyFvjdA14xuaA==
X-CSE-MsgGUID: NzA9ot77QLKAAyEd6+dXXA==
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="199325909"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Sep 2024 05:46:37 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 17 Sep 2024 05:45:57 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 17 Sep 2024 05:45:55 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Tue, 17 Sep 2024 14:45:40 +0200
Subject: [PATCH v2 1/2] dt-bindings: ocelot: document lan969x-pinctrl
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240917-lan969x-pinctrl-v2-1-ea02cbc56831@microchip.com>
References: <20240917-lan969x-pinctrl-v2-0-ea02cbc56831@microchip.com>
In-Reply-To: <20240917-lan969x-pinctrl-v2-0-ea02cbc56831@microchip.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Lars Povlsen
	<lars.povlsen@microchip.com>, Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14-dev

Lan969x is going to reuse the existing Ocelot pinctrl driver - document
that by adding compatible strings for the different SKU's that we
support.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 .../bindings/pinctrl/mscc,ocelot-pinctrl.yaml      | 27 +++++++++++++++-------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.yaml
index dbb3e1bd58c1..31bc30a81752 100644
--- a/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.yaml
@@ -12,14 +12,24 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - microchip,lan966x-pinctrl
-      - microchip,sparx5-pinctrl
-      - mscc,jaguar2-pinctrl
-      - mscc,luton-pinctrl
-      - mscc,ocelot-pinctrl
-      - mscc,serval-pinctrl
-      - mscc,servalt-pinctrl
+    oneOf:
+      - enum:
+          - microchip,lan966x-pinctrl
+          - microchip,lan9691-pinctrl
+          - microchip,sparx5-pinctrl
+          - mscc,jaguar2-pinctrl
+          - mscc,luton-pinctrl
+          - mscc,ocelot-pinctrl
+          - mscc,serval-pinctrl
+          - mscc,servalt-pinctrl
+      - items:
+          - enum:
+              - microchip,lan9698-pinctrl
+              - microchip,lan9696-pinctrl
+              - microchip,lan9694-pinctrl
+              - microchip,lan9693-pinctrl
+              - microchip,lan9692-pinctrl
+          - const: microchip,lan9691-pinctrl
 
   reg:
     items:
@@ -85,6 +95,7 @@ allOf:
           contains:
             enum:
               - microchip,lan966x-pinctrl
+              - microchip,lan9691-pinctrl
               - microchip,sparx5-pinctrl
     then:
       properties:

-- 
2.34.1


