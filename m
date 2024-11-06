Return-Path: <linux-gpio+bounces-12620-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F06459BE3B2
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 11:09:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8232A1F234A5
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 10:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 876601DB546;
	Wed,  6 Nov 2024 10:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="V5Ysh5dT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7611DCB2C
	for <linux-gpio@vger.kernel.org>; Wed,  6 Nov 2024 10:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730887737; cv=none; b=Bh1P0PW6rr1nknzP5vXF3NAFMJa7Kr3wNjLmrKzna1S64O/XjmgJ8ej/XL8Wph8wdyU7gAhBIJGK1exQ9ad27doxgPJ97T3LEe9N6jcLw4FEENnJwCAtQ160W3KptrhvhAAp0su0RmGwjkRIRfdKKu9tPehRaJNypqX2l5MysRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730887737; c=relaxed/simple;
	bh=va/DILIUevm8NNWXKhwyztN+R+Y+3LeC7lUxWXKJVmQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AnJRepMv07LUtRCkEq/RKobXOzbaxiFk5Yad5Kt4FK9mWEJk/AlaRfciOFG2J5G86klLe+yG/wi835R8T0vosEcTqbJoGEbLSb8bvxE7Ko1UJb8A7cAydrPzGqL1lzmphJcpq3ed59HvHl8eEG+M5Ist9X3J8M/HfZbN+kzdOLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=V5Ysh5dT; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1730887719; x=1731146919;
	bh=dEoDbeevWJIwX1JnG6y9+8lc/XLJscWHnsFUwOMj8fE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=V5Ysh5dThHm+t9+k4S/JuVHI0itg/nnhexwL4GlqVNQDnL6UXlYCHL1GDtmkS/oN+
	 +wc/222sJTeCYyKRQPrlBdRRVmoRqE/7yLziZ7u7Q7tTtCQIxMifYXSwi+ZAed31Am
	 ATHm8EqSoBLeSyquyM/j4dHypxZzrF+ouZpsJGDOxlS3pJJE0LKlrwbBVihaJon/6R
	 lFNl/MGRtaOFSWuQiiE4efPxzPdfnqML+Ikx0l8lqqlzeGxr8KjaaW9BBscwdD8zkP
	 lp0skUKfxJLwV+FBXBc8vgw5g/BHl4+8qmKAC86/tqWfzv2qpZumc8kI4qhoq5I1Hd
	 VjbRh0vpyhYtA==
Date: Wed, 06 Nov 2024 10:08:33 +0000
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Teng <andy.teng@mediatek.com>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, Yassine Oudjana <yassine.oudjana@gmail.com>, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 1/7] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Pull pinctrl node changes from MT6795 document
Message-ID: <20241106100741.173825-2-y.oudjana@protonmail.com>
In-Reply-To: <20241106100741.173825-1-y.oudjana@protonmail.com>
References: <20241106100741.173825-1-y.oudjana@protonmail.com>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: 824e0214d7b2a6f87eb8c72b1622141a20f40769
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

mediatek,pinctrl-mt6795.yaml has different node name patterns which match
bindings of other MediaTek pin controllers, ref for pinmux-node.yaml which
has a description of the pinmux property, as well as some additional
descriptions for some pin configuration properties. Pull those changes
into mediatek,mt6779-pinctrl.yaml and adjust the example DTS to match in
preparation to combine the MT6795 document into it.

The only DT that currently gets affected by these changes is mt6797.dtsi.
It is modified to match the new bindings in a following patch.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabor=
a.com>
---
 .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 38 ++++++++++++++-----
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctr=
l.yaml
index 3bbc00df5548d..352a88d7b135e 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yam=
l
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yam=
l
@@ -111,12 +111,12 @@ allOf:
         - "#interrupt-cells"
=20
 patternProperties:
-  '-[0-9]*$':
+  '-pins$':
     type: object
     additionalProperties: false
=20
     patternProperties:
-      '-pins*$':
+      '^pins':
         type: object
         description:
           A pinctrl node should contain at least one subnodes representing=
 the
@@ -124,7 +124,9 @@ patternProperties:
           pins it needs, and how they should be configured, with regard to=
 muxer
           configuration, pullups, drive strength, input enable/disable and=
 input
           schmitt.
-        $ref: /schemas/pinctrl/pincfg-node.yaml
+        allOf:
+          - $ref: pinmux-node.yaml
+          - $ref: pincfg-node.yaml
=20
         properties:
           pinmux:
@@ -135,9 +137,25 @@ patternProperties:
=20
           bias-disable: true
=20
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
+              For normal pull down type, it is not necessary to specify R1=
R0
+              values; When pull down type is PUPD/R0/R1, adding R1R0 defin=
es
+              will set different resistance values.
=20
           input-enable: true
=20
@@ -221,8 +239,8 @@ examples:
             #interrupt-cells =3D <2>;
             interrupts =3D <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
=20
-            mmc0_pins_default: mmc0-0 {
-                cmd-dat-pins {
+            mmc0_pins_default: mmc0-pins {
+                pins-cmd-dat {
                     pinmux =3D <PINMUX_GPIO168__FUNC_MSDC0_DAT0>,
                         <PINMUX_GPIO172__FUNC_MSDC0_DAT1>,
                         <PINMUX_GPIO169__FUNC_MSDC0_DAT2>,
@@ -235,11 +253,11 @@ examples:
                     input-enable;
                     mediatek,pull-up-adv =3D <1>;
                 };
-                clk-pins {
+                pins-clk {
                     pinmux =3D <PINMUX_GPIO176__FUNC_MSDC0_CLK>;
                     mediatek,pull-down-adv =3D <2>;
                 };
-                rst-pins {
+                pins-rst {
                     pinmux =3D <PINMUX_GPIO178__FUNC_MSDC0_RSTB>;
                     mediatek,pull-up-adv =3D <0>;
                 };
--=20
2.47.0



