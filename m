Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2E851D1377
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2020 14:57:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733210AbgEMM4y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 May 2020 08:56:54 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:6948 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733200AbgEMM4x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 May 2020 08:56:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589374613; x=1620910613;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cITEJ59bnrRIpIir228tQCWYR/7bB39ICzxe18qqo8c=;
  b=iJ0lAY6TD3M99Zc6W7HXLB9xFBb5mSdwBVbGG9lA3GTIIsHtpjaPepbx
   Kz79PsARPHUdvEGFKn2fLzO3ROSSTmpYjl608FlmMKc0zVZjW4N09gPAV
   QZzMX1o4/1vQt5wAL0+fIg7zmCb5QB5G8jJ94pNRLXjpMpUlaN6sWGYi0
   1GahheFsQK/R7Rudb8dce4lWstrhnSMYTYLdlsZkJ/p6/+JbVTS1/Q3RV
   s4jupITG+D7PHYh1wmdnjh7B6boYRgAIzcUeJ/Pj5Cv7pLfblcabkXMY2
   OegWgvh13ZX+XKNiy1ZD6UY9wP0Vc9xbjxMaP6fh3gKZnbUVlCSWTFkxq
   Q==;
IronPort-SDR: QXtlxX7NyirgBub3OISAMGW9qKQT642hpZ1yT3JRhXxIVl8H14pGuLTHjq6CjlWacEjvDqLaMt
 OJmicgPs4QfAyPqiacyrmxjxxxX2LuQAna0XK/69Mw8To41S/EbVBoHnnkh7qfBlujkwjtT81r
 tq3INKPS6L+hywv59717IMTQcVt9Yr7rGBoIS70/dQ46KkIkAvzLPIa75DL0SFM6dkAZrXPx9n
 LWdxB9TO2l94M0ejWWrVx9voNth2G5NDx+EG6VNmLQL00z9Fqsbyxfz0vpJEMHUWhiyLLl6/H7
 7jY=
X-IronPort-AV: E=Sophos;i="5.73,387,1583218800"; 
   d="scan'208";a="75132817"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 May 2020 05:56:52 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 13 May 2020 05:56:55 -0700
Received: from soft-dev15.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Wed, 13 May 2020 05:56:49 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Olof Johansson <olof@lixom.net>,
        "Michael Turquette" <mturquette@baylibre.com>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 07/14] dt-bindings: pinctrl: ocelot: Add Sparx5 SoC support
Date:   Wed, 13 May 2020 14:55:25 +0200
Message-ID: <20200513125532.24585-8-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200513125532.24585-1-lars.povlsen@microchip.com>
References: <20200513125532.24585-1-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds documentation for the "compatible" value designated for Sparx5

Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
---
 .../devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.txt       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.txt
index 32a8a8fa7805d..00912449237bd 100644
--- a/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.txt
@@ -2,8 +2,8 @@ Microsemi Ocelot pin controller Device Tree Bindings
 ----------------------------------------------------

 Required properties:
- - compatible		: Should be "mscc,ocelot-pinctrl" or
-				"mscc,jaguar2-pinctrl"
+ - compatible		: Should be "mscc,ocelot-pinctrl",
+			  "mscc,jaguar2-pinctrl" or "microchip,sparx5-pinctrl"
  - reg			: Address and length of the register set for the device
  - gpio-controller	: Indicates this device is a GPIO controller
  - #gpio-cells		: Must be 2.
--
2.26.2
