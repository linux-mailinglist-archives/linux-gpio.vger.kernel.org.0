Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96C1A2D4454
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 15:29:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730185AbgLIO3Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 09:29:24 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:47473 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729964AbgLIO3X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 09:29:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1607524163; x=1639060163;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JPDjl84lGyybXsZSCN2fvCdtp/fq4P9uRhBCDvzowAY=;
  b=I0Fliu7Y8/zCaNRLeYBjtUBD7YUpGLeNGlhvyEYxl9DbaQT+fBmPp/47
   GCEi1PWaoE0vENDcv0tmEe//wFVOtb4O4icdiu57Wayl3dce7AUSNlpT/
   ukgAzZVQFsOuEtlbQ90N8wCTDs9t4q+4wPadv8dHKwjY0qql5HmCd/3A/
   DTRR6DBddctQf7gvnmLKCt/UjMSi/ayQ0pTy9AecR3/dh3otqbncNPnkD
   35kwHbtS4AEwaySpclZ8BXWVlqO+AKRZSylVkCsjJ47F/bZRx2ptec0xn
   u1aM9cyphksqfDJuKYodimw4yHoE/oYROsbaPTVSYWfOc9iR1mo9gi2qO
   Q==;
IronPort-SDR: Sz9OElXtAnSvqfP6fpc8xp4U+Cyz7BlaC5/zkdYJsgADEdxgfRSzJsvd4uHMnBKPSCeDSaqrBO
 s64JJfsIgeeJZlW1Mgmh8Th9X34inGJzNG+fwsdTLCEBkJZlq/sA8eIx65KkZJ6NVynFGgV2uU
 GAOWFJMcv/Y3F+JqcXnLeuH8vnPQUt/lpTLln4kkTHPiXftohfPo8shgEWGfbEmeas6FUHbUZT
 u7XooX40jZCgiIm+gg7pttN5rHFrjQ3qPj4cqiZbUoXvu8NipLFVwH8/KZHbfVP41SNq2UyRtr
 oOk=
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; 
   d="scan'208";a="102111868"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Dec 2020 07:28:07 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 9 Dec 2020 07:28:07 -0700
Received: from soft-dev10.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Wed, 9 Dec 2020 07:28:05 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH -next 0/3] pinctrl: pinctrl-microchip-sgpio: Add interrupt controller support
Date:   Wed, 9 Dec 2020 15:27:50 +0100
Message-ID: <20201209142753.683208-1-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds 'interrupt-controller' features for the signals available on
the Microchip SGPIO controller.

Due to hardware limitations this feature is limited to Sparx5 platform
(or later).

Lars Povlsen (3):
  pinctrl: pinctrl-microchip-sgpio: Add irq support (for sparx5)
  dt-bindings: pinctrl: pinctrl-microchip-sgpio: Add irq support
  arm64: dts: sparx5: Add SGPIO irq support

 .../pinctrl/microchip,sparx5-sgpio.yaml       |  16 ++
 arch/arm64/boot/dts/microchip/sparx5.dtsi     |  11 +-
 drivers/pinctrl/pinctrl-microchip-sgpio.c     | 187 +++++++++++++++++-
 3 files changed, 211 insertions(+), 3 deletions(-)

-- 
2.25.1

