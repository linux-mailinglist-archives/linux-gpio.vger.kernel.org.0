Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4603B4E2B
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2019 14:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728523AbfIQMmu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Sep 2019 08:42:50 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:4080 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728500AbfIQMmu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 17 Sep 2019 08:42:50 -0400
X-IronPort-AV: E=Sophos;i="5.64,516,1559487600"; 
   d="scan'208";a="26793614"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 17 Sep 2019 21:42:49 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id A8C4F423501E;
        Tue, 17 Sep 2019 21:42:46 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 7/8] dt-bindings: pinctrl: sh-pfc: Document r8a774b1 PFC support
Date:   Tue, 17 Sep 2019 13:35:35 +0100
Message-Id: <1568723736-14714-8-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568723736-14714-1-git-send-email-biju.das@bp.renesas.com>
References: <1568723736-14714-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document PFC support for the R8A774B1 SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt
index 3902efa..c1b9eb4 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt
@@ -18,6 +18,7 @@ Required Properties:
     - "renesas,pfc-r8a7745": for R8A7745 (RZ/G1E) compatible pin-controller.
     - "renesas,pfc-r8a77470": for R8A77470 (RZ/G1C) compatible pin-controller.
     - "renesas,pfc-r8a774a1": for R8A774A1 (RZ/G2M) compatible pin-controller.
+    - "renesas,pfc-r8a774b1": for R8A774B1 (RZ/G2N) compatible pin-controller.
     - "renesas,pfc-r8a774c0": for R8A774C0 (RZ/G2E) compatible pin-controller.
     - "renesas,pfc-r8a7778": for R8A7778 (R-Car M1) compatible pin-controller.
     - "renesas,pfc-r8a7779": for R8A7779 (R-Car H1) compatible pin-controller.
-- 
2.7.4

