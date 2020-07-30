Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93DC823337E
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jul 2020 15:55:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729152AbgG3Nzw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jul 2020 09:55:52 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:56392 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728440AbgG3Nzw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jul 2020 09:55:52 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id B97C8803202F;
        Thu, 30 Jul 2020 13:55:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id bdRglwaZNYp3; Thu, 30 Jul 2020 16:55:41 +0300 (MSK)
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
Subject: [PATCH v2 00/10] gpio: dwapb: Refactor GPIO resources initialization
Date:   Thu, 30 Jul 2020 16:55:26 +0300
Message-ID: <20200730135536.19747-1-Sergey.Semin@baikalelectronics.ru>
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

Some additional cleanups like replacing a number of GPIOs literal with a
corresponding macro and grouping the IRQ handlers up in a single place of
the driver are also introduced in this patchset.

Link: https://lore.kernel.org/linux-gpio/20200723013858.10766-1-Sergey.Semin@baikalelectronics.ru/
Changelog v2:
- Replace gc->to_irq() with irq_find_mapping() method.
- Refactor dwapb_irq_set_type() method to directly set IRQ flow handler
  instead of using a temporary variable.
- Initialize GPIOlib IRQ-chip settings before calling request_irq()
  method.
- Add a notice regarding regression of commit 6a2f4b7dadd5 ("gpio:
  dwapb: use a second irq chip").
- Move the acpi_gpiochip_{request,free}_interrupts() methods invocation
  removal to a dedicated patch.
- Move GPIO-chip to_irq callback removal to a dedicated patch.
- Add a patch which replaces a max number of GPIO literals with a macro.
- Introduce dwapb_convert_irqs() method to convert the sparse parental
  IRQs array into an array of linearly distributed IRQs correctly
  perceived by GPIO-lib.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Serge Semin (10):
  dt-bindings: gpio: dwapb: Add ngpios property support
  gpio: dwapb: Add ngpios DT-property support
  gpio: dwapb: Move MFD-specific IRQ handler
  gpio: dwapb: Add max GPIOs macro
  gpio: dwapb: Convert driver to using the GPIO-lib-based IRQ-chip
  gpio: dwapb: Discard GPIO-to-IRQ mapping function
  gpio: dwapb: Discard ACPI GPIO-chip IRQs request
  gpio: dwapb: Get reset control by means of resource managed interface
  gpio: dwapb: Get clocks by means of resource managed interface
  gpio: dwapb: Use resource managed GPIO-chip add data method

 .../bindings/gpio/snps,dw-apb-gpio.yaml       |   6 +
 drivers/gpio/Kconfig                          |   2 +-
 drivers/gpio/gpio-dwapb.c                     | 340 +++++++++---------
 include/linux/platform_data/gpio-dwapb.h      |   4 +-
 4 files changed, 178 insertions(+), 174 deletions(-)

-- 
2.27.0

