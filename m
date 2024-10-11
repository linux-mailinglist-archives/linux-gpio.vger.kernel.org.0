Return-Path: <linux-gpio+bounces-11180-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD8399A33F
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 14:06:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC84F285A91
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 12:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6F4A216450;
	Fri, 11 Oct 2024 12:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hzgS9BN7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85C619923C;
	Fri, 11 Oct 2024 12:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728648353; cv=none; b=sJscaUdzPNuYwbFsBvwJA6jUaIXvEpUu0roznaSkFXVoQWdc5TiGr8ekk+5mPvCdJOJG3WsPjRo6F6yIha92bMnM7gS8CQUb02u1C8tO3DZEmRcmli8a1aID2vSeMLT8yZ0NDdqfDvkD3Ouzuf1FfH8QDzpEaBSLUAoUDjkemYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728648353; c=relaxed/simple;
	bh=STg4k0sYFm5FV8pt2Sru20HCHK6nuJVM79fF4xxf8Nc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VxCPE/tL39x4UTi3zVBwCuy4QkCPA/xKKi1sXwtFzYPpblGVaWn/Sh7+4ABrT9VJRyGmg5rw9Ffi7y6rsOX8cB8I40beGmLeYwZj15IdG2mkXlEvfSTeXWhBxIIjMycETUez//Sm+R6fKUpXFiIyKNMfEg6atFTB0i7xWskv+ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hzgS9BN7; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a9951fba3b4so308739766b.1;
        Fri, 11 Oct 2024 05:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728648350; x=1729253150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15ufGLidV7xTiVLYKe1LISm2ma4BRCQCw+nEybyGtSw=;
        b=hzgS9BN7y5VLBOFqnKOp8XJ63NEDOJqyh2ehcCBckvD0cMtNs5dg5HrsZ8mN11DUkr
         ZGGiGq+OmbGPKEf57tHf/N7R76jemTbg18dfeAqT8MiCThQax7xHM2pg/SWQn3TH/5Ij
         0NmscVtaLckGE6X4MHu/Nkp1I+Lix3KoVMdUcRYXZ1/RtAP8CD6IVjEt1fZcX9aMQ2Q+
         jqPx5xKhaF76z59CHta8xy01d52SjIwyyq5R3uK1vsttzZfqrNdfsazgbOmipg7mqUFx
         yGtG3jUWhi7QKNsOzSNM/TlZ0oUxPAza2y2pWFIBPZdfykGTujMayGn7EntjnBeyGtKE
         68qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728648350; x=1729253150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=15ufGLidV7xTiVLYKe1LISm2ma4BRCQCw+nEybyGtSw=;
        b=SItJoExZD0rPXFWUg3tNfHUXV2wY8unHrTS6vaoVNx3q+wFg6qJDHW/c/7SIBM5oaO
         5yC5sbBgowOUsrQm0w3VrIdjM1nB0UE82cBAsbg3SXE7yjy+gGlws7ORv1jOOZ7fsInh
         OGVt2dOOVQMK4b7tKxLvaOrJct/UuVD5T8Bxh+iCy24VIYhSbpXgwY8AaL8a1cQ2oGOq
         O9JhahQEUI839pSae4pP+nUnbGPv9n43vBCXA2soAug9RJRjLSSBsIb16lxqv+qd4Hmf
         rJ7Y50qMUGmDwsdQhNFrRq9wHtGTmh0LwBgzod12MsH8X/Ugr6lSrxeTOPqGkx9dr3is
         qzKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfKqQRiBJYlSlGopN7V5R68U5uoDQUB9HXnsehaO81cVwM9j2OA1Ic/SHuypSpv2Ur2IjW9MHnwctZEA==@vger.kernel.org, AJvYcCVqxzrYJoq7opGJYxxGUfIGUyAneKuP9E3KC3W9o4KN2FI6qGKQ3B2XI4z3uxjOT8uaBCo9e6vE8uRq@vger.kernel.org, AJvYcCW9sGv0uUjyXnNpA6Tln6mo3iOrkfDoG3+sSe/IleppFxlzWURrDnEOSOEaGLaEg7CANuqOVMG3UaicZ/zp@vger.kernel.org
X-Gm-Message-State: AOJu0YwgxDaDGMRbsRlKxv8KZVSNFj1alaKD+3rZUNqlSpH/T5q31P3t
	FMkUYGUulKNMsv+mPUkfLL49GS+saRguHOCn07H4KJaFgysqgz/f
X-Google-Smtp-Source: AGHT+IGU01REcE+AzBfyT1Sdcj1nLZWea1CrUM9PMpiXxRg88PV/hwQ3aNdUFMouigZi3GHmsTSiww==
X-Received: by 2002:a17:907:f183:b0:a99:4d04:32b0 with SMTP id a640c23a62f3a-a99b95dba6dmr199405066b.31.1728648350015;
        Fri, 11 Oct 2024 05:05:50 -0700 (PDT)
Received: from zenbook.agu.edu.tr ([95.183.227.31])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99b804ea59sm88962366b.151.2024.10.11.05.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 05:05:49 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	Andy Teng <andy.teng@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 1/8] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Pull pinctrl node changes from MT6795 document
Date: Fri, 11 Oct 2024 15:03:46 +0300
Message-ID: <20241011120520.140318-2-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241011120520.140318-1-y.oudjana@protonmail.com>
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yassine Oudjana <y.oudjana@protonmail.com>

mediatek,pinctrl-mt6795.yaml has different node name patterns which match
bindings of other MediaTek pin controllers, ref for pinmux-node.yaml which
has a description of the pinmux property, as well as some additional
descriptions for some pin configuration properties. Pull those changes
into mediatek,mt6779-pinctrl.yaml and adjust the example DTS to match in
preparation to combine the MT6795 document into it.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 38 ++++++++++++++-----
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index 3bbc00df5548d..352a88d7b135e 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -111,12 +111,12 @@ allOf:
         - "#interrupt-cells"
 
 patternProperties:
-  '-[0-9]*$':
+  '-pins$':
     type: object
     additionalProperties: false
 
     patternProperties:
-      '-pins*$':
+      '^pins':
         type: object
         description:
           A pinctrl node should contain at least one subnodes representing the
@@ -124,7 +124,9 @@ patternProperties:
           pins it needs, and how they should be configured, with regard to muxer
           configuration, pullups, drive strength, input enable/disable and input
           schmitt.
-        $ref: /schemas/pinctrl/pincfg-node.yaml
+        allOf:
+          - $ref: pinmux-node.yaml
+          - $ref: pincfg-node.yaml
 
         properties:
           pinmux:
@@ -135,9 +137,25 @@ patternProperties:
 
           bias-disable: true
 
-          bias-pull-up: true
-
-          bias-pull-down: true
+          bias-pull-up:
+            oneOf:
+              - type: boolean
+              - enum: [100, 101, 102, 103]
+                description: Pull up PUPD/R0/R1 type define value.
+            description: |
+              For normal pull up type, it is not necessary to specify R1R0
+              values; When pull up type is PUPD/R0/R1, adding R1R0 defines
+              will set different resistance values.
+
+          bias-pull-down:
+            oneOf:
+              - type: boolean
+              - enum: [100, 101, 102, 103]
+                description: Pull down PUPD/R0/R1 type define value.
+            description: |
+              For normal pull down type, it is not necessary to specify R1R0
+              values; When pull down type is PUPD/R0/R1, adding R1R0 defines
+              will set different resistance values.
 
           input-enable: true
 
@@ -221,8 +239,8 @@ examples:
             #interrupt-cells = <2>;
             interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
 
-            mmc0_pins_default: mmc0-0 {
-                cmd-dat-pins {
+            mmc0_pins_default: mmc0-pins {
+                pins-cmd-dat {
                     pinmux = <PINMUX_GPIO168__FUNC_MSDC0_DAT0>,
                         <PINMUX_GPIO172__FUNC_MSDC0_DAT1>,
                         <PINMUX_GPIO169__FUNC_MSDC0_DAT2>,
@@ -235,11 +253,11 @@ examples:
                     input-enable;
                     mediatek,pull-up-adv = <1>;
                 };
-                clk-pins {
+                pins-clk {
                     pinmux = <PINMUX_GPIO176__FUNC_MSDC0_CLK>;
                     mediatek,pull-down-adv = <2>;
                 };
-                rst-pins {
+                pins-rst {
                     pinmux = <PINMUX_GPIO178__FUNC_MSDC0_RSTB>;
                     mediatek,pull-up-adv = <0>;
                 };
-- 
2.46.2


