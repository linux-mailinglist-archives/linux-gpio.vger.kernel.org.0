Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85F7C305B00
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 13:16:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235905AbhA0MQY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jan 2021 07:16:24 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:43019 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234594AbhA0LrN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2021 06:47:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1611748032; x=1643284032;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=Olp4T24u22Y0c3fRKuJAXAXhENBuhcAibANtr8qFhws=;
  b=gqUtFoWEMj1ih7oTiLgxuqLF7EtSBiBr+Ky73OMPGUvNGe/Gz4r41rG6
   5fBUhmlfqaTwHmxhwDo+QbaouZMMLf1/J33mq2Fd8lVeWmWNKI8e6RxRg
   3+F2WMTIq9LnIOs/1vqw/8GS8tuwOVQ5alTsU0NNP8lhfwR09mLQQLFF9
   mQSjGDlGWGlIjISQwwlmtUikhBG8HStotdZpV02odtn5VxhIGjcxoZ1L5
   NX9DDDgGTqTGguEizSOUiY93at7UWkO8J4gJ0FEj5AxUdPR8JuYc+fk6z
   1psX7LJxdx+FxErKlSNhxYmuBkbTNpUlNUkRyF4evljiuHUeqVetiad4W
   g==;
IronPort-SDR: aAufn5aI9HolWFs2xkUbjEiLblKXOolifr5mER+lfUt+GSBcu5oeCfEc3qDPsT70OG+yxIgN6k
 srXDoslLwvgk2WGiSn0zIqaKA9D+YOLycoylTAas6zQaeCvXoYnUEBlLyF2OQCcoEFRylCLiu/
 /8XnOGbQc7W8YFtiSjPFmHoD9rjt4hnRNe6yWyo4rShVQaTx7P2+FYnOyLPgebpwy7WC3StRim
 ccBHqJzEzu5CQNJ8j6u0kEMYyBV/Yabe0oeN8XYnHZIVP6gc5SAQymzmyMVVCrn8BNoc0SKUon
 QVw=
X-IronPort-AV: E=Sophos;i="5.79,379,1602572400"; 
   d="scan'208";a="112682919"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jan 2021 04:45:55 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 27 Jan 2021 04:45:55 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Wed, 27 Jan 2021 04:45:50 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <ludovic.desroches@microchip.com>
CC:     <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v2 0/3] pinctrl: at91-pio4: add support for slew-rate
Date:   Wed, 27 Jan 2021 13:45:42 +0200
Message-ID: <1611747945-29960-1-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

This series adds support for slew rate on SAMA7G5. Along with this
patch 3/3 fixes some checkpatch.pl warnings.

Thank you,
Claudiu Beznea

Changes in v2:
- s/sr/slew_rate_support/g in patch 2/3
- collected tags

Claudiu Beznea (3):
  dt-bindings: pinctrl: at91-pio4: add slew-rate
  pinctrl: at91-pio4: add support for slew-rate
  pinctrl: at91-pio4: fix "Prefer 'unsigned int' to bare use of    
    'unsigned'"

 .../bindings/pinctrl/atmel,at91-pio4-pinctrl.txt   |   8 +-
 drivers/pinctrl/pinctrl-at91-pio4.c                | 137 +++++++++++++--------
 2 files changed, 89 insertions(+), 56 deletions(-)

-- 
2.7.4

