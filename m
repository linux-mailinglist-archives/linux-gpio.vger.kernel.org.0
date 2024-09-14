Return-Path: <linux-gpio+bounces-10120-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBAF979329
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Sep 2024 21:10:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9751C283BB8
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Sep 2024 19:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ED92126F02;
	Sat, 14 Sep 2024 19:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="wiW+uhQE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA487E792;
	Sat, 14 Sep 2024 19:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726341040; cv=none; b=HtWvhEFVt+JY9qnaeHN8fQliOH8JB/llSvfiVGr5iTkZbHGU1QF7wMFMsISqfRjqDEo6cuBuZ5s719LtudyuYtv2uRQ0vs6ClJMcnFzFZiP8B0MNgRPNfqR7oWGT2PE/5C5cociMB+p6r2sOpx8yDoe8eV8KRGUcIKuFzPJapDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726341040; c=relaxed/simple;
	bh=ckocVbJtSYxyHuQUYSuyupwsTpQrnEnzIRLwifKdwnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=RdKlPaxKP7Gix/8iPwRUGX5OOBumK4HIKuLYKxaXq52pOWSue3tQr+n3Daxk0Z9yGnz5oXvsSjdPDJsr6uZBi6AmCFxZia7NXbgMbJ0UG/btjGWiUzyb725DvZPogTfxgM+DmMKfsB2vmAAor7vSq3AcaxW40XKvWRXLhk/ZQXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=wiW+uhQE; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1726341039; x=1757877039;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=ckocVbJtSYxyHuQUYSuyupwsTpQrnEnzIRLwifKdwnA=;
  b=wiW+uhQEegvXxWdFPUwDkb4DAZ1ag1e6XpBDRICLdYdma1qhpbPBeWx2
   XOQ9PnpxHSWAmrLyiTDNlS+Zil2WezFpIumqEEV1K15ceRdteHpNlSgrv
   W34IA+sERR/B2j9NDU67eXSWys9r/EXrL4+INHfTuGt59y7k2py7tstd6
   cyVttw2dGKCMksIoT1wtx9Jme7qePc/KV1COrYES+rbq0WRTQgKJGMyIp
   R8SRi0XHh02qVFoQS+kANF8KQs+nvlnAfdlcDCHe5lRhG1B0r6/gK9mno
   4qOfPowqxJRQYMuELW/4dQJOH0Q+uetu1fxj0lyPUFXxBWtcK3xbyCJR7
   g==;
X-CSE-ConnectionGUID: aORpv4XtRiOtN55YVRgpfg==
X-CSE-MsgGUID: LNFN3AveRI2WmOnAzfLriw==
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="31675564"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Sep 2024 12:10:36 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 14 Sep 2024 12:10:32 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Sat, 14 Sep 2024 12:10:30 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Sat, 14 Sep 2024 21:10:08 +0200
Subject: [PATCH 1/2] dt-bindings: ocelot: document lan969x-pinctrl
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240914-lan969x-pinctrl-v1-1-1b3a4d454b0d@microchip.com>
References: <20240914-lan969x-pinctrl-v1-0-1b3a4d454b0d@microchip.com>
In-Reply-To: <20240914-lan969x-pinctrl-v1-0-1b3a4d454b0d@microchip.com>
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
 .../bindings/pinctrl/mscc,ocelot-pinctrl.yaml      | 32 ++++++++++++++++------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.yaml
index dbb3e1bd58c1..45e9dfc50660 100644
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
@@ -85,6 +95,12 @@ allOf:
           contains:
             enum:
               - microchip,lan966x-pinctrl
+              - microchip,lan9698-pinctrl
+              - microchip,lan9696-pinctrl
+              - microchip,lan9694-pinctrl
+              - microchip,lan9693-pinctrl
+              - microchip,lan9692-pinctrl
+              - microchip,lan9691-pinctrl
               - microchip,sparx5-pinctrl
     then:
       properties:

-- 
2.34.1


