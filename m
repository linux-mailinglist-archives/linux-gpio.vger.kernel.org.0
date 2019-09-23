Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88A75BB534
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2019 15:28:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406722AbfIWN2D (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Sep 2019 09:28:03 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:51793 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2405044AbfIWN2C (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 23 Sep 2019 09:28:02 -0400
X-IronPort-AV: E=Sophos;i="5.64,539,1559487600"; 
   d="scan'208";a="27038481"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 23 Sep 2019 22:28:00 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id E84CC420E103;
        Mon, 23 Sep 2019 22:27:57 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] dt-bindings: gpio: rcar: Add DT binding for r8a774b1
Date:   Mon, 23 Sep 2019 14:27:48 +0100
Message-Id: <1569245268-61920-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document Renesas' RZ/G2N (R8A774B1) GPIO blocks compatibility within the
relevant dt-bindings.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
index f3f2c46..41e5fed 100644
--- a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
+++ b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
@@ -8,6 +8,7 @@ Required Properties:
     - "renesas,gpio-r8a7745": for R8A7745 (RZ/G1E) compatible GPIO controller.
     - "renesas,gpio-r8a77470": for R8A77470 (RZ/G1C) compatible GPIO controller.
     - "renesas,gpio-r8a774a1": for R8A774A1 (RZ/G2M) compatible GPIO controller.
+    - "renesas,gpio-r8a774b1": for R8A774B1 (RZ/G2N) compatible GPIO controller.
     - "renesas,gpio-r8a774c0": for R8A774C0 (RZ/G2E) compatible GPIO controller.
     - "renesas,gpio-r8a7778": for R8A7778 (R-Car M1) compatible GPIO controller.
     - "renesas,gpio-r8a7779": for R8A7779 (R-Car H1) compatible GPIO controller.
-- 
2.7.4

