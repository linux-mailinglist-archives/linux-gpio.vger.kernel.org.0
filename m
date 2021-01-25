Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5887530499A
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jan 2021 21:11:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729734AbhAZFZx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 00:25:53 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:58926 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727482AbhAYKV6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Jan 2021 05:21:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1611570117; x=1643106117;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=/xTjRJ1bLejdTjp9C85JvYhy0rTQE1UU6MDdrOu0ods=;
  b=Ed0uFo8i2VmGQzGzqvI9OGQKOP9FNGMV30vYk5poThAIIRn6P2sfGRCT
   x8ONMGYaOpyambfLYc9jYrsNzbaebUxbHo7cHdxJsn+Dj54XElSen2LM7
   9+PfV88uSvXNDeMe3rrKnjneUxEjAWu1pZw3cfz/+GBXRZgfT1Jav6U3v
   W5RGAFSMB/IzZt5Eq+hFwzh8StvgeQdcKusCB/qpnybz+DwV/qjfI2N+l
   D9roTA2jVcASn2KvQLjH7IaOH7RgNYkpth57c2j9vh1H4/KbsI6fOBqDL
   uxDkP2Ob7ubSD+DnXr0PJkmHw5v0PbNyfDVlmqSPbH/9CYAYMONdNw+6A
   Q==;
IronPort-SDR: bSW5M+nbxfHJQTZwv7VPZ1q13WaLHZ1/dgk7MKAOXMYMcHgHTYoyofdau2R6w/uLbcBqvlYq6c
 7cngtAmHbbqcJKVlPDEdhKaP9GaMCB22xATbuthvsGPVKWT3UqU0lFPr6rcsSabT1qt3QjGWCc
 tgiJ4K9ZPLCWVi2lCYvcHEDjT0iPNUJ6vhnVINKqXeRQzJWZCbH75UxbUlzm7lrWs3Rd9tSzpi
 D0OU0HX0/HE2QnzVBpyC5ze1bDpnndwU6WDjXyqwCxqUtV1yKeAagYA9n97yij0bZcKj0fC3ar
 NKA=
X-IronPort-AV: E=Sophos;i="5.79,373,1602572400"; 
   d="scan'208";a="41611477"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Jan 2021 03:19:21 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 25 Jan 2021 03:19:21 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Mon, 25 Jan 2021 03:19:16 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <ludovic.desroches@microchip.com>
CC:     <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH 0/3] pinctrl: at91-pio4: add support for slew-rate
Date:   Mon, 25 Jan 2021 12:19:11 +0200
Message-ID: <1611569954-23279-1-git-send-email-claudiu.beznea@microchip.com>
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

