Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 943092E0980
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Dec 2020 12:24:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbgLVLW6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Dec 2020 06:22:58 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:59808 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726517AbgLVLW6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 22 Dec 2020 06:22:58 -0500
X-IronPort-AV: E=Sophos;i="5.78,438,1599490800"; 
   d="scan'208";a="66595829"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 22 Dec 2020 20:22:26 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id DEEA84008553;
        Tue, 22 Dec 2020 20:22:25 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     marek.vasut+renesas@gmail.com, lee.jones@linaro.org,
        matti.vaittinen@fi.rohmeurope.com, lgirdwood@gmail.com,
        broonie@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com
Cc:     khiem.nguyen.xt@renesas.com, linux-power@fi.rohmeurope.com,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v5 02/12] dt-bindings: mfd: bd9571mwv: Document BD9574MWF
Date:   Tue, 22 Dec 2020 20:22:09 +0900
Message-Id: <1608636139-564-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608636139-564-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1608636139-564-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document other similar specification chip BD9574MWF.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/mfd/bd9571mwv.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/bd9571mwv.txt b/Documentation/devicetree/bindings/mfd/bd9571mwv.txt
index 8c46786..1d6413e 100644
--- a/Documentation/devicetree/bindings/mfd/bd9571mwv.txt
+++ b/Documentation/devicetree/bindings/mfd/bd9571mwv.txt
@@ -1,7 +1,7 @@
-* ROHM BD9571MWV Power Management Integrated Circuit (PMIC) bindings
+* ROHM BD9571MWV/BD9574MWF Power Management Integrated Circuit (PMIC) bindings
 
 Required properties:
- - compatible		: Should be "rohm,bd9571mwv".
+ - compatible		: Should be "rohm,bd9571mwv" or "rohm,bd9574mwf".
  - reg			: I2C slave address.
  - interrupts		: The interrupt line the device is connected to.
  - interrupt-controller	: Marks the device node as an interrupt controller.
-- 
2.7.4

