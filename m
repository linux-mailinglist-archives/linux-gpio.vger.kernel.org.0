Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B21C41D98B
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Sep 2021 14:17:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350783AbhI3MTC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 08:19:02 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:10230 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1350749AbhI3MTC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 30 Sep 2021 08:19:02 -0400
X-IronPort-AV: E=Sophos;i="5.85,336,1624287600"; 
   d="scan'208";a="95682445"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 30 Sep 2021 21:17:18 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id C1C51437E78F;
        Thu, 30 Sep 2021 21:17:16 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 1/4] dt-bindings: pincfg-node: Add "output-impedance" property
Date:   Thu, 30 Sep 2021 13:16:27 +0100
Message-Id: <20210930121630.17449-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210930121630.17449-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210930121630.17449-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On RZ/G2L SoC for Group-B pins, output impedance can be configured.
This patch documents "output-impedance" property in pincfg-node.yaml so
that other platforms requiring such feature can make use of this property.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
index 71ed0a9def84..cdcb23daeca2 100644
--- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
@@ -114,6 +114,10 @@ properties:
     description: enable output on a pin without actively driving it
       (such as enabling an output buffer)
 
+  output-impedance:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: set the pins output impedance at most X ohm
+
   output-low:
     type: boolean
     description: set the pin to output mode with low level
-- 
2.17.1

