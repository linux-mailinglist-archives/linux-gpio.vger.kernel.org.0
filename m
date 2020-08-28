Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFB37255550
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Aug 2020 09:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727971AbgH1Hac (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Aug 2020 03:30:32 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:40396 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726500AbgH1Hac (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 28 Aug 2020 03:30:32 -0400
X-IronPort-AV: E=Sophos;i="5.76,362,1592838000"; 
   d="scan'208";a="55771865"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 28 Aug 2020 16:30:30 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 692C441D8797;
        Fri, 28 Aug 2020 16:30:28 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH v2] dt-bindings: gpio: renesas,rcar-gpio: Add r8a774e1 support
Date:   Fri, 28 Aug 2020 08:30:24 +0100
Message-Id: <20200828073024.32585-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document Renesas RZ/G2H (R8A774E1) GPIO blocks compatibility within the
relevant dt-bindings. R8A774E1 GPIO module is identical to R-Car Gen3
family.

No driver change is needed due to the fallback compatible value
"renesas,rcar-gen3-gpio".

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Rob Herring <robh@kernel.org>
---
Hi All,

This patch is part of series [1] (patch 6/9), rest of the patches have
been acked/queued.

[1] https://lkml.org/lkml/2020/7/13/1275

Cheers,
Prabhakar

v1->v2
* Rebased the patch on 5.9-rc1 (YAML conversion)
* Updated commit description
* Restored acks from Geert and Rob
---
 Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
index 3ad229307bd5..5026662e4508 100644
--- a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
@@ -37,6 +37,7 @@ properties:
               - renesas,gpio-r8a774a1     # RZ/G2M
               - renesas,gpio-r8a774b1     # RZ/G2N
               - renesas,gpio-r8a774c0     # RZ/G2E
+              - renesas,gpio-r8a774e1     # RZ/G2H
               - renesas,gpio-r8a7795      # R-Car H3
               - renesas,gpio-r8a7796      # R-Car M3-W
               - renesas,gpio-r8a77961     # R-Car M3-W+
-- 
2.17.1

