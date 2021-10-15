Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E36D242F217
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Oct 2021 15:25:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239387AbhJON1W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Oct 2021 09:27:22 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:43908 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239381AbhJON1W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Oct 2021 09:27:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634304317; x=1665840317;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZI+/jkZ9HIZYKKCL9WS4VRlk6uYGVABKF2GuTEy4CUE=;
  b=sKnHnJbR/oNNYjoaoM6DNsHZELE2xAyFcNPvJ9PtE26hi8eGvNU+j+1I
   cJWHoIWZgFHUIv50zPv9rqNHpPl7iRJbGCJ83Vmtn23jybq2geZbhUwJn
   LwhRRrbZ3iCcDK4pZ/paz/yG/5VXFehAieOt506/BjzvW7NjJjg89Iudk
   /+hHE6E/ccDSBNe+OItt2Cuhih3+lJAL9rsJ5xYeRjzblv9QJ1/gYr00J
   TEQXYmc73gbBzKtVl4C0jR7L84QvTxSOdSE9qjF5RDGnJ+zaiE6HVz0P7
   jSnIUhuKTuxx1O+4SBWRqN6udS4y/nvxf5Acnd64MPc/9Ia5Ty13vqiIi
   w==;
IronPort-SDR: qFXocuqBaVCSHxtzsPmpntoZ1+upS3uKNp6Gewag9vl0UxuyAa2jT5uVQDWQPPAn/gcXF1DP2l
 dgoznQOhnIyM6qH4/j4fcV/v7OPDrSrBhoRi3vDxLtLoItkOZ++4vTMSdRJiOXUDzRZHDjAQx6
 sTV3JPuKV/Al9QZe+z9+WDthVnnVYFoTG6IE49McWhmegenOV3wRbjV5iGyQJ+n6dSvo7JLAPp
 hLNYCpGTZB027rxYqVASmRklvA/uWR6B9I3Fa3Ov6ASi0xsrdeey4rPbHiYkJPSLz2XY1u31Bp
 P/O0iI1EIu+eLdHru1kh7TBI
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; 
   d="scan'208";a="139843060"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Oct 2021 06:25:16 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 15 Oct 2021 06:25:14 -0700
Received: from soft-dev3-1.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 15 Oct 2021 06:25:12 -0700
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <lars.povlsen@microchip.com>, <Steen.Hegelund@microchip.com>,
        <UNGLinuxDriver@microchip.com>, <p.zabel@pengutronix.de>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH v4 1/2] dt-bindings: pinctrl: pinctrl-microchip-sgpio: Add reset binding
Date:   Fri, 15 Oct 2021 15:25:25 +0200
Message-ID: <20211015132526.200816-2-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211015132526.200816-1-horatiu.vultur@microchip.com>
References: <20211015132526.200816-1-horatiu.vultur@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This describes the new binding which allows to call a reset driver from
the pinctrl-microchip-sgpio driver.

Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
---
 .../devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml    | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
index 4fe35e650909..b0b7d02a57e0 100644
--- a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
@@ -68,6 +68,9 @@ properties:
       clock, and larger than zero.
     default: 12500000
 
+  resets:
+    maxItems: 1
+
 patternProperties:
   "^gpio@[0-1]$":
     type: object
-- 
2.33.0

