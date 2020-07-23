Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E77522A4C5
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jul 2020 03:40:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387462AbgGWBji (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 21:39:38 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:32902 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387460AbgGWBjH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jul 2020 21:39:07 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 866BA803202F;
        Thu, 23 Jul 2020 01:39:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 7NZcB0gu1dAP; Thu, 23 Jul 2020 04:39:04 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Hoan Tran <hoan@os.amperecomputing.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Rob Herring <robh+dt@kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/7] gpio: dwapb: Refactor GPIO resources initialization
Date:   Thu, 23 Jul 2020 04:38:51 +0300
Message-ID: <20200723013858.10766-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series is about the DW APB GPIO device initialization procedure
cleaning up. First of all it has been discovered that having a
vendor-specific "snps,nr-gpios" property isn't only redundant but also
might be dangerous (see the commit log for details). Instead we suggest to
use the generic "ngpios" property to define a number of GPIOs each DW APB
GPIO controller port supports. Secondly seeing a tendency of the other
GPIO drivers getting converted to using the GPIO-lib-based IRQ-chip
interface this series provides a patch, which replaces the DW APB GPIO
driver Generic IRQ-chip implementation with the GPIO-lib IRQ-chip one.
Finally the DW APB GPIO device probe procedure is simplified by
converting the code to be using the device managed resources for the
reference clocks initialization, reset control assertion/de-assertion
and GPIO-chip registration.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Serge Semin (7):
  dt-bindings: gpio: dwapb: Add ngpios property support
  gpio: dwapb: Add ngpios DT-property support
  gpio: dwapb: Move MFD-specific IRQ handler
  gpio: dwapb: Convert driver to using the GPIO-lib-based IRQ-chip
  gpio: dwapb: Get reset control by means of resource managed interface
  gpio: dwapb: Get clocks by means of resource managed interface
  gpio: dwapb: Use resource managed GPIO-chip add data method

 .../bindings/gpio/snps,dw-apb-gpio.yaml       |   6 +
 drivers/gpio/Kconfig                          |   2 +-
 drivers/gpio/gpio-dwapb.c                     | 324 +++++++++---------
 3 files changed, 161 insertions(+), 171 deletions(-)

-- 
2.26.2

