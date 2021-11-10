Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F8B244CCFD
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Nov 2021 23:46:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233813AbhKJWtU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Nov 2021 17:49:20 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:54239 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233745AbhKJWtT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Nov 2021 17:49:19 -0500
X-IronPort-AV: E=Sophos;i="5.87,225,1631545200"; 
   d="scan'208";a="100143062"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 11 Nov 2021 07:46:29 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id CC942413162C;
        Thu, 11 Nov 2021 07:46:27 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 1/6] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Add output-impedance-ohms property
Date:   Wed, 10 Nov 2021 22:46:17 +0000
Message-Id: <20211110224622.16022-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211110224622.16022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211110224622.16022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

RZ/G2L SoC has two groups of pins, Group-A and Group-B. RZ/G2L SoC supports
configuring Output Impedance for Group-B pins (valid values 33/50/66/100).

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v2->v3
* Included RB tag
---
 .../devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
index ef68dabcf4dc..3a66fd214c17 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
@@ -73,6 +73,8 @@ additionalProperties:
         pins: true
         drive-strength:
           enum: [ 2, 4, 8, 12 ]
+        output-impedance-ohms:
+          enum: [ 33, 50, 66, 100 ]
         power-source:
           enum: [ 1800, 2500, 3300 ]
         slew-rate: true
-- 
2.17.1

