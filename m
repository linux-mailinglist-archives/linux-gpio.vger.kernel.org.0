Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAE102A933C
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 10:47:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727029AbgKFJrm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Nov 2020 04:47:42 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:46914 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726939AbgKFJrl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Nov 2020 04:47:41 -0500
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 3B50B3AAA96
        for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2020 09:31:52 +0000 (UTC)
X-Originating-IP: 91.175.115.186
Received: from localhost (91-175-115-186.subs.proxad.net [91.175.115.186])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 05EF6FF805;
        Fri,  6 Nov 2020 09:31:26 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        <Steen.Hegelund@microchip.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH 2/4] dt-bindings: pinctrl: ocelot: Add Serval SoC support
Date:   Fri,  6 Nov 2020 10:31:16 +0100
Message-Id: <20201106093118.965152-3-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201106093118.965152-1-gregory.clement@bootlin.com>
References: <20201106093118.965152-1-gregory.clement@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the documentation for the Microsemi Serval pinmuxing and gpio
controller.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 .../devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.txt       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.txt
index 58ea2ae57713..db99bd95d423 100644
--- a/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.txt
@@ -3,8 +3,8 @@ Microsemi Ocelot pin controller Device Tree Bindings
 
 Required properties:
  - compatible		: Should be "mscc,ocelot-pinctrl",
-			  "mscc,jaguar2-pinctrl", "microchip,sparx5-pinctrl"
-			  or "mscc,luton-pinctrl"
+			  "mscc,jaguar2-pinctrl", "microchip,sparx5-pinctrl",
+			  "mscc,luton-pinctrl" or "mscc,serval-pinctrl"
  - reg			: Address and length of the register set for the device
  - gpio-controller	: Indicates this device is a GPIO controller
  - #gpio-cells		: Must be 2.
-- 
2.28.0

