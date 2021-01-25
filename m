Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF6C53023A2
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Jan 2021 11:25:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727372AbhAYKYt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Jan 2021 05:24:49 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:63942 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727483AbhAYKWY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Jan 2021 05:22:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1611570144; x=1643106144;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=Jaf5ap+iRlOkRyLK7k0c5JvNu7KlWsQcAxQtQYo01tc=;
  b=aGJd+h8+0Owe0neCTCaabz+DqXWI4Ucb7djpKxWdQPVltjeztuil/anu
   rwPIeZfGFjIYLfPxUkYY0Fz/TSayNvYHzUJ5wjjSm49Dw1PEsFJf4VOY8
   JXvEGqJYPDLqyoTLd5SACz151TLklHSCWfSwot23Plx8E3OZR0DeG6EJV
   wEGqks6OwcR0AsRCH6iJzF5bELjg2IIJYJFdeMfUTHVlY2gqVppjtyI2j
   W5Ntsu54bg3UWgV5Ym2+wHWkZJxgCh0X2zUHymvq7ZUnV+90Sf6sce/UR
   TgyTMk/JsV7OdKI1/DJVDqoBZ42qn64rs83lYorEZQ95c0Tu2n6/7uVPf
   Q==;
IronPort-SDR: auLMmQbeDPZdalqB8hS/UqSVzeM4BRKpKA7JIztoIeE5szefrpMWTYy6fhnnOVnieEAkNyMHmx
 EtJhqrj92HMS6eV77nMpNNvQCM3LAykk2XUtRCrF54+xI7cZuQ6AMCg84G5Da2x9SLBB7oVHNX
 lb7kk12CK+U0dcasoQmuXWyEc6dpqipjN16+MjWQsvdg6REE+lCoO2HovSZdNT4OVui55xjVQa
 fBGUFr3dWDG7vXY/vvo9ig4IPuIEp2gZsUaOH65ROGcNXkaEpiKq1dLgHy67ZWAIHdclni0A2l
 jzg=
X-IronPort-AV: E=Sophos;i="5.79,373,1602572400"; 
   d="scan'208";a="107162032"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Jan 2021 03:19:26 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 25 Jan 2021 03:19:26 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Mon, 25 Jan 2021 03:19:21 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <ludovic.desroches@microchip.com>
CC:     <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH 1/3] dt-bindings: pinctrl: at91-pio4: add slew-rate
Date:   Mon, 25 Jan 2021 12:19:12 +0200
Message-ID: <1611569954-23279-2-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611569954-23279-1-git-send-email-claudiu.beznea@microchip.com>
References: <1611569954-23279-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document slew-rate DT binding for SAMA7G5.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
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

