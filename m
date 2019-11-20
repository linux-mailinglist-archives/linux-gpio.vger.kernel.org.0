Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29CA2103B90
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2019 14:34:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730719AbfKTNeZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Nov 2019 08:34:25 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:48994 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728770AbfKTNeZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Nov 2019 08:34:25 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAKDYFTI098277;
        Wed, 20 Nov 2019 07:34:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574256855;
        bh=BHgE80y+QiXClHuEFFAfxoULNZYosGfeXTB4VtPq3hA=;
        h=From:To:CC:Subject:Date;
        b=zG3d5rF9H2YIb7o2LtdlgG74qNNaeG9fYuAVKTUBx2+qzVF2RZL+Yd+5sBNb0AOtA
         LKCe0W9aHqCZh/Ab24IBXc4PJ8rGNlVDyDH6Ik+BQmq+4XV1uEVt9Rie1s6rodwnZG
         QFn1aeoRPp01Fn/7cuQ7qb2DSetotq8YfmKycamQ=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAKDYFVg099411;
        Wed, 20 Nov 2019 07:34:15 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 20
 Nov 2019 07:34:12 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 20 Nov 2019 07:34:12 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAKDY9Ei096098;
        Wed, 20 Nov 2019 07:34:10 -0600
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <robh+dt@kernel.org>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <m.szyprowski@samsung.com>, <broonie@kernel.org>,
        <mripard@kernel.org>, <p.zabel@pengutronix.de>,
        <devicetree@vger.kernel.org>
Subject: [RFC 0/2] gpiolib: Initial, basic support for shared GPIO lines
Date:   Wed, 20 Nov 2019 15:34:07 +0200
Message-ID: <20191120133409.9217-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

The initial support can replace all use of GPIOD_FLAGS_BIT_NONEXCLUSIVE if the
shared GPIO is configured to follow pass through 'strategy' for the shared GPIO
pin.

I have only implemented DT support.

With the shared gpio support one can choose between three different strategy for
managing the shared gpio:
refcounted low: Keep the line low as long as there is at least one low
		request is registered
refcounted high: Keep the line high as long as there is at least one high
		request is registered
pass through: all requests are allowed to go through without refcounting.

Few shortcomings as of now:
- can not handle different GPIO_ACTIVE_ on the user side, both the root GPIO
  (which is shared) and clients must have the same GPIO_ACTIVE_ mode.
  We are using common gpio_desc.
  Like with GPIOD_FLAGS_BIT_NONEXCLUSIVE
- refcounting counts _all_ 1/0 requests coming from the users of the shared
  GPIO. This could cause issues if clients are using the gpiod API in unbalanced
  way.
  We would need to have separate tracking for each of the clients and agregate
  the level they are asking for at any moment. Basically a new gpio-chip on top
  of the real gpio pin can solve this.

Regards,
Peter
---
Peter Ujfalusi (2):
  dt-bindings: gpio: Document shared GPIO line usage
  gpiolib: Support for (output only) shared GPIO line

 .../devicetree/bindings/gpio/gpio.txt         |  66 +++++++++
 drivers/gpio/gpiolib-of.c                     |  28 +++-
 drivers/gpio/gpiolib.c                        | 132 ++++++++++++++++--
 drivers/gpio/gpiolib.h                        |  10 ++
 4 files changed, 223 insertions(+), 13 deletions(-)

-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

