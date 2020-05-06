Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 431341C7AB7
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2020 21:52:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729425AbgEFTwO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 May 2020 15:52:14 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:7384 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725799AbgEFTwM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 May 2020 15:52:12 -0400
X-IronPort-AV: E=Sophos;i="5.73,360,1583161200"; 
   d="scan'208";a="46218045"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 07 May 2020 04:52:11 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id C9141400495A;
        Thu,  7 May 2020 04:52:07 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 5/9] dt-bindings: serial: renesas,scifb: Document r8a7742 bindings
Date:   Wed,  6 May 2020 20:51:31 +0100
Message-Id: <1588794695-27852-6-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588794695-27852-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1588794695-27852-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

RZ/G1H (R8A7742) SoC also has the R-Car gen2 compatible SCIFB ports,
so document the SoC specific bindings.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
* No change
---

 Documentation/devicetree/bindings/serial/renesas,scifb.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/renesas,scifb.yaml b/Documentation/devicetree/bindings/serial/renesas,scifb.yaml
index 57205cb1dcd4..b083970c16a9 100644
--- a/Documentation/devicetree/bindings/serial/renesas,scifb.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,scifb.yaml
@@ -24,6 +24,7 @@ properties:
 
       - items:
           - enum:
+              - renesas,scifb-r8a7742      # RZ/G1H
               - renesas,scifb-r8a7743      # RZ/G1M
               - renesas,scifb-r8a7744      # RZ/G1N
               - renesas,scifb-r8a7745      # RZ/G1E
-- 
2.17.1

