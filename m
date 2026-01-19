Return-Path: <linux-gpio+bounces-30738-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F36EAD3AEAB
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 16:16:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9180B3008154
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 15:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A811235F8CE;
	Mon, 19 Jan 2026 15:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="ZNlyYa1v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E6E37F74E;
	Mon, 19 Jan 2026 15:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768835197; cv=none; b=FoldHQS+1QYhC0iY6uqJhr9wqi7kaq+x7T/n/xk9eMk8Q2E0E2n+//aEWPBj9/wefG/6eRbGjMlNaGf5wS4ko2GWrANseTH1pr+Tl2QjueyEOfK1oR8U+As6ZpdNWnbkctSHYw+yFLJy3tHnNt/4emGPPGOOd6p3AO2IyCkavcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768835197; c=relaxed/simple;
	bh=pasjO94/OvVqP2mPiNV/u3WQQo2v2cEH6cEjcMrCy14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=uqxLYeZ8H1kXsetiSjGUD72LYxyTJ2947O8a73pQ7OHMZAj4fyHQxLfb+QNyBUCAshpcHThbbHVmnsB4tnRq48q1DQx22p8ciacu3XVCmYfdiDoS9vFUwQtzKBlA5ERgcAh6mbTciVpXE9m9oskvov2DpJPyYnrH956hXDYEZP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=ZNlyYa1v; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768835195; x=1800371195;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=pasjO94/OvVqP2mPiNV/u3WQQo2v2cEH6cEjcMrCy14=;
  b=ZNlyYa1vodH89XrPMgluofUbOboDANdjLTjRlODmqOgQ2Rf8zjmsG81O
   jSQcwi+Clrj6Rh1v6HFE8pYZ+r151touLyRBwQSw6pWjnvKO1emdLfB7x
   i/zoZDOibPZK62vJTOvXhi9QhoJ+/cdmkHY4vgOhVidkNxVEhga5p+6cw
   9mkYrVgrywI+AOSNOes4VEf3yILxc4nBEyS4DPVkc0JxTtEbmPECOuqg7
   /IUaZUSgsVaiw1xJk/3jr9VOfSAfrAnOvgfoEJtzJrwnpgkYVW2jUCbjd
   704wai5pE+SP1biBEj96TwgXrn4u6iKCOO6JjQyAR67I/imaW0kKyi4Yw
   g==;
X-CSE-ConnectionGUID: a45eXAL0QQeJgaK8l1tQlQ==
X-CSE-MsgGUID: NdcRYvZHRk6Xu3z84wF1iQ==
X-IronPort-AV: E=Sophos;i="6.21,238,1763449200"; 
   d="scan'208";a="219391019"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Jan 2026 08:06:34 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 19 Jan 2026 08:06:30 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 19 Jan 2026 08:06:27 -0700
From: =?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
Date: Mon, 19 Jan 2026 16:06:09 +0100
Subject: [PATCH 1/3] dt-bindings: pinctrl: ocelot: Add LAN9645x SoC support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260119-pinctrl_ocelot_extend_support_for_lan9645x-v1-1-1228155ed0ee@microchip.com>
References: <20260119-pinctrl_ocelot_extend_support_for_lan9645x-v1-0-1228155ed0ee@microchip.com>
In-Reply-To: <20260119-pinctrl_ocelot_extend_support_for_lan9645x-v1-0-1228155ed0ee@microchip.com>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Lars Povlsen
	<lars.povlsen@microchip.com>, Bartosz Golaszewski <brgl@kernel.org>, "Steen
 Hegelund" <Steen.Hegelund@microchip.com>, Daniel Machon
	<daniel.machon@microchip.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, =?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
X-Mailer: b4 0.15-dev

Add documentation for the compatibles designated for the following SKUs
in the LAN9645x family:

lan96455f
lan96457f
lan96459f

with fallback a compatible for the smallest 5-ported SKUs lan96455f.

Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
Signed-off-by: Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>
---
 Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.yaml
index 31bc30a81752..930955caacd1 100644
--- a/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.yaml
@@ -14,6 +14,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - microchip,lan96455f-pinctrl
           - microchip,lan966x-pinctrl
           - microchip,lan9691-pinctrl
           - microchip,sparx5-pinctrl
@@ -30,6 +31,11 @@ properties:
               - microchip,lan9693-pinctrl
               - microchip,lan9692-pinctrl
           - const: microchip,lan9691-pinctrl
+      - items:
+          - enum:
+              - microchip,lan96457f-pinctrl
+              - microchip,lan96459f-pinctrl
+          - const: microchip,lan96455f-pinctrl
 
   reg:
     items:

-- 
2.34.1


