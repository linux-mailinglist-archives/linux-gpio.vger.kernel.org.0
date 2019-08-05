Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8035816AC
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 12:16:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728148AbfHEKQU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 06:16:20 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:53999 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727259AbfHEKQU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 06:16:20 -0400
X-Originating-IP: 86.250.200.211
Received: from localhost.localdomain (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 4548D20009;
        Mon,  5 Aug 2019 10:16:17 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     <devicetree@vger.kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Antoine Tenart <antoine.tenart@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Nadav Haklai <nadavh@marvell.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, <linux-arm-kernel@lists.infradead.org>,
        Grzegorz Jaszczyk <jaz@semihalf.com>,
        Marcin Wojtas <mw@semihalf.com>,
        Stefan Chulski <stefanc@marvell.com>,
        Yan Markman <ymarkman@marvell.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 2/3] dt-bindings: cp110: document the new CP115 pinctrl compatible
Date:   Mon,  5 Aug 2019 12:16:06 +0200
Message-Id: <20190805101607.29811-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190805101607.29811-1-miquel.raynal@bootlin.com>
References: <20190805101607.29811-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Grzegorz Jaszczyk <jaz@semihalf.com>

A new compatible is going to be used for Armada CP115 pinctrl block,
document it.

Signed-off-by: Grzegorz Jaszczyk <jaz@semihalf.com>
[<miquel.raynal@bootlin.com>: split the documentation out of the
driver commit]
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../bindings/arm/marvell/cp110-system-controller.txt          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller.txt b/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller.txt
index 4db4119a6d19..f982a8ed9396 100644
--- a/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller.txt
+++ b/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller.txt
@@ -78,8 +78,8 @@ Documentation/devicetree/bindings/pinctrl/marvell,mvebu-pinctrl.txt.
 
 Required properties:
 
-- compatible: "marvell,armada-7k-pinctrl",
-  "marvell,armada-8k-cpm-pinctrl" or "marvell,armada-8k-cps-pinctrl"
+- compatible: "marvell,armada-7k-pinctrl", "marvell,armada-8k-cpm-pinctrl",
+  "marvell,armada-8k-cps-pinctrl" or "marvell,cp115-standalone-pinctrl"
   depending on the specific variant of the SoC being used.
 
 Available mpp pins/groups and functions:
-- 
2.20.1

