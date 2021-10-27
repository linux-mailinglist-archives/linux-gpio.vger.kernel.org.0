Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E187943CB05
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Oct 2021 15:45:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242253AbhJ0Nro (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Oct 2021 09:47:44 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:39947 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S242235AbhJ0Nrn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 27 Oct 2021 09:47:43 -0400
X-IronPort-AV: E=Sophos;i="5.87,186,1631545200"; 
   d="scan'208";a="98620557"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 27 Oct 2021 22:45:17 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 19E4B4010727;
        Wed, 27 Oct 2021 22:45:14 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/4] dt-bindings: pincfg-node: Add "output-impedance-ohms" property
Date:   Wed, 27 Oct 2021 14:45:06 +0100
Message-Id: <20211027134509.5036-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211027134509.5036-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211027134509.5036-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On RZ/G2L SoC for Group-B pins, output impedance can be configured. This
patch documents "output-impedance-ohms" property in pincfg-node.yaml so
that other platforms requiring such feature can make use of this property.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
RFC->v1
 * Dropped type
 * Renamed output-impedance -> output-impedance-ohms
---
 Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
index 71ed0a9def84..4b22a9e3a447 100644
--- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
@@ -114,6 +114,9 @@ properties:
     description: enable output on a pin without actively driving it
       (such as enabling an output buffer)
 
+  output-impedance-ohms:
+    description: set the output impedance of a pin to at most X ohms
+
   output-low:
     type: boolean
     description: set the pin to output mode with low level
-- 
2.17.1

