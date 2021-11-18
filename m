Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5B6B455A65
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Nov 2021 12:31:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344149AbhKRLcx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Nov 2021 06:32:53 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:24688 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343911AbhKRLax (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Nov 2021 06:30:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1637234873; x=1668770873;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=04b27mPPLyKjoz4SJMG30YPIXLNYvBX6qQMCwaZGpg8=;
  b=c6vwZUuXALTq1f7eUaDB6hPuSmVV7HmHxG1Br3tw7IVWlrs+hRsoDdOP
   yyftpuo3JEVnASfc4Ua2kWBhjo2mpR2nL2iyXSFgWYFiygFZxoN2bdpRe
   wH3vXo81Rb41wkGlx7bxV3Ue70GCA4an3ebw04FlB+4kvVnWtf3lu0j2v
   QCDRKN2IAY7fokYbOOUSrKjmDhckxCepG90fkkbSiPRltDxyortQhi8KH
   N97xn2z+lm8ceoL1WEkD//Jnpg6RaiOpYIveXBuLTKdvKPfRyre4yxs43
   qwWlACIApgwm/iRKAa76k3YLjBTm6rDv2qOuihTD7XGWysGqZqSLsS9TP
   Q==;
IronPort-SDR: vz8Y57uqIV1xOsOe/cb4tTnzPHNSf6e5SSjF7GGYHxkte6CYwXHI5owkwFiX5X6WZwzQq+Ssst
 hrw3RJumt2u7E4fAqbh/fQfkNYCUNPwTE+vvet6DMygZgu5KUJkkqJkBiCim3epE5Gdjr/Nl4a
 TLyZAHIFp3TFwpDuPQJEB7odW6+zQ+CjxAhnMzPq8fs8+e0V6qQB3LrmdH1pB4sK74bUE2XYvv
 wD64HBM2RKEa8NjjOptvvGXLeaLeq3tp9uEegu9dUdq8/Oj2pvRJPGsFlTRjGCYEijactHIwk9
 FyDnGNn3kY1req25c3fdnjxI
X-IronPort-AV: E=Sophos;i="5.87,244,1631602800"; 
   d="scan'208";a="136991238"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Nov 2021 04:27:52 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 18 Nov 2021 04:27:51 -0700
Received: from kavya-HP-Compaq-6000-Pro-SFF-PC.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 18 Nov 2021 04:27:48 -0700
From:   Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
To:     <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <quentin.schulz@bootlin.com>, <linus.walleij@linaro.org>,
        <robh+dt@kernel.org>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <UNGLinuxDriver@microchip.com>,
        <Kavyasree.Kotagiri@microchip.com>, <Manohar.Puri@microchip.com>
Subject: [PATCH v4 1/2] dt-bindings: pinctrl: ocelot: add lan966x SoC support
Date:   Thu, 18 Nov 2021 16:55:47 +0530
Message-ID: <20211118112548.14582-2-kavyasree.kotagiri@microchip.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211118112548.14582-1-kavyasree.kotagiri@microchip.com>
References: <20211118112548.14582-1-kavyasree.kotagiri@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add documentation for the compatible designated for lan966x.

Signed-off-by: Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
Acked-by: Rob Herring <robh@kernel.org>
---
v3 -> v4:
- Added Acked-by: Rob Herring 

v2 -> v3:
- No changes.

v1 -> v2:
- Use consistent name lan966x in commit description

 .../devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.txt        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.txt
index db99bd95d423..3bb76487669f 100644
--- a/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.txt
@@ -4,7 +4,8 @@ Microsemi Ocelot pin controller Device Tree Bindings
 Required properties:
  - compatible		: Should be "mscc,ocelot-pinctrl",
 			  "mscc,jaguar2-pinctrl", "microchip,sparx5-pinctrl",
-			  "mscc,luton-pinctrl" or "mscc,serval-pinctrl"
+			  "mscc,luton-pinctrl", "mscc,serval-pinctrl" or
+			  "microchip,lan966x-pinctrl"
  - reg			: Address and length of the register set for the device
  - gpio-controller	: Indicates this device is a GPIO controller
  - #gpio-cells		: Must be 2.
-- 
2.17.1

