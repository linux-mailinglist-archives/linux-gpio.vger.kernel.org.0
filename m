Return-Path: <linux-gpio+bounces-10227-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFF997B3B3
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 19:38:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92BE91C23A55
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 17:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1DDB188A2C;
	Tue, 17 Sep 2024 17:38:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C045188A2D;
	Tue, 17 Sep 2024 17:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726594703; cv=none; b=kW6QX9HiNEskPA6FtIGhr2MDizoXuEmOkSAYhk7xtmrFA/Xg6raYHnejdloDANIk48uN/CmSZaItMhOt+qQub6Wrw16QeWGmTPv0UJIS0kO24/BGQdOqvyA837+5pczRAi8ROAx0ziNdWumO7gcdspOgJg7BpqP3xIIjJvF2Fko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726594703; c=relaxed/simple;
	bh=sqB9aMC/ObBXDLH/mNVaHikBrcObR7AKKGuB0rd2Ai4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pAJPlesZhuVMLt2D+5v8q0ZJW5qAZyd62S5qpKgUDLb03jr7qFgOJJpIO20xyLatSX3XyGSTH3NqbjpYfv/ulVtYiwaITngtgX4J7oxHCDguP7pEf30PgIdUWIB8gs1oS2+t3EXjobQy1B9rVB7vop7/31nKqD6dGi9aur2gDi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.10,235,1719846000"; 
   d="scan'208";a="218976902"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 18 Sep 2024 02:33:12 +0900
Received: from mulinux.example.org (unknown [10.226.92.130])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6DC4C4002963;
	Wed, 18 Sep 2024 02:33:08 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Marc Zyngier <maz@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH 1/6] dt-bindings: pinctrl: renesas: rzg2l-pinctrl: Add interrupt-parent
Date: Tue, 17 Sep 2024 18:32:44 +0100
Message-Id: <20240917173249.158920-2-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240917173249.158920-1-fabrizio.castro.jz@renesas.com>
References: <20240917173249.158920-1-fabrizio.castro.jz@renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All the platforms from the renesas,rzg2l-pinctrl.yaml binding
actually require the interrupt-parent property. Add it.

Fixes: 35c37efd1273 ("dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Document the properties to handle GPIO IRQ")
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
 .../devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
index 56d90c8e1fa3..10f724e87ae7 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
@@ -51,6 +51,8 @@ properties:
 
   interrupt-controller: true
 
+  interrupt-parent: true
+
   '#interrupt-cells':
     const: 2
     description:
@@ -155,6 +157,7 @@ required:
   - '#gpio-cells'
   - gpio-ranges
   - interrupt-controller
+  - interrupt-parent
   - '#interrupt-cells'
   - clocks
   - power-domains
@@ -174,6 +177,7 @@ examples:
             gpio-ranges = <&pinctrl 0 0 392>;
             interrupt-controller;
             #interrupt-cells = <2>;
+            interrupt-parent = <&irqc>;
             clocks = <&cpg CPG_MOD R9A07G044_GPIO_HCLK>;
             resets = <&cpg R9A07G044_GPIO_RSTN>,
                      <&cpg R9A07G044_GPIO_PORT_RESETN>,
-- 
2.34.1


