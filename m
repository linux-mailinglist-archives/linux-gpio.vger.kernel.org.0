Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF1E305AFC
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 13:16:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237490AbhA0MPh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jan 2021 07:15:37 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:13689 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237029AbhA0LrQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2021 06:47:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1611748036; x=1643284036;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=uM+xJHPgTwuMfFjiAnXVlVaU9KWxMusj4b8wMrvAtgA=;
  b=rvNihr3jcCE9D4Qb9Vad20v7l++behkLGHzJw99d3Sqcv9lVm/LBPpSZ
   fx7X4U9dN7QlR5N01njo8wiyG4tvBOyLqy1ggN4yWxSwjs+ceqMTJFabZ
   qmkKLJ7lQthzZqJXqeMEPpBvxpWBo+VF5pOJF1ri0BqBmvrBlB8oCAryD
   IsMgbYRMoXkoktHR4bikf+3w0ucR8AsQlPrIou4/5shAV8t1Q5KZrNfmE
   vqPNx7WfsiyAa3Aoi2/n70nonlmw+Nl4OP/tjoXDZRQjGPoI/FIrgkXAm
   LjJdYyYUJ+llOE+YYx/IXpqo8Xa00iLudVt1OwM+yDYEVsQQDtguzAfug
   Q==;
IronPort-SDR: QB9rrILRGVcNc6fqOnnHKYVy3kP5A4ITdd3RZwVaZCd8L2jDQfke9QoceDIrYMQSU8aQFdhJbe
 CqFU1qBpTYrrNaiaWoRerAovfy6pbT4fxWkBs3JWWk6O6qv7kGscLuQ4mRfN4zmrfYP+QArHF/
 uLYkYWoeSkhrJW+Krk5lHCXN7wcORxnLWzbMACP1EE5Rfim0+wEcTEf4NjbkQSRTiu3AQHb7qp
 Su3a5C920PeZzKwhmNfSpy4xgFPRmqCpPOHtN4sY+W8Nq3baV5/3lN3T5/v0wbx63IIdDgx99t
 RJo=
X-IronPort-AV: E=Sophos;i="5.79,379,1602572400"; 
   d="scan'208";a="106961806"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jan 2021 04:46:00 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 27 Jan 2021 04:45:59 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Wed, 27 Jan 2021 04:45:55 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <ludovic.desroches@microchip.com>
CC:     <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v2 1/3] dt-bindings: pinctrl: at91-pio4: add slew-rate
Date:   Wed, 27 Jan 2021 13:45:43 +0200
Message-ID: <1611747945-29960-2-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611747945-29960-1-git-send-email-claudiu.beznea@microchip.com>
References: <1611747945-29960-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document slew-rate DT binding for SAMA7G5.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>
---
 .../devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt       | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt
index 265015bc0603..e2b861ce16d8 100644
--- a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt
@@ -35,9 +35,11 @@ ioset settings. Use the macros from boot/dts/<soc>-pinfunc.h file to get the
 right representation of the pin.
 
 Optional properties:
-- GENERIC_PINCONFIG: generic pinconfig options to use, bias-disable,
-bias-pull-down, bias-pull-up, drive-open-drain, input-schmitt-enable,
-input-debounce, output-low, output-high.
+- GENERIC_PINCONFIG: generic pinconfig options to use:
+	- bias-disable, bias-pull-down, bias-pull-up, drive-open-drain,
+	  input-schmitt-enable, input-debounce, output-low, output-high.
+	- for microchip,sama7g5-pinctrl only:
+		- slew-rate: 0 - disabled, 1 - enabled (default)
 - atmel,drive-strength: 0 or 1 for low drive, 2 for medium drive and 3 for
 high drive. The default value is low drive.
 
-- 
2.7.4

