Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CFC518FE20
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2020 20:54:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725877AbgCWTyU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Mar 2020 15:54:20 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:38174 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbgCWTyU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Mar 2020 15:54:20 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 97A9480307CA;
        Mon, 23 Mar 2020 19:54:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id LBgY4mT1fO6X; Mon, 23 Mar 2020 22:54:17 +0300 (MSK)
From:   <Sergey.Semin@baikalelectronics.ru>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/6] gpio: dwapb: Fix reference clocks usage
Date:   Mon, 23 Mar 2020 22:53:55 +0300
Message-ID: <20200323195401.30338-1-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200323180632.14119-1-Sergey.Semin@baikalelectronics.ru>
References: <20200323180632.14119-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Serge Semin <fancer.lancer@gmail.com>

There is no need in any fixes to have the Baikal-T1 SoC DW GPIO controllers
supported by the kernel DW APB GPIO driver. It works for them just fine with
no modifications. But still there is a room for optimizations there.

First of all as it tends to be traditional for all Baikal-T1 SoC related
patchset we replaced the legacy plain text-based dt-binding file with
yaml-based one. Baikal-T1 DW GPIO port A supports a debounce functionality,
but in order to use it the corresponding reference clock must be enabled.
We added support of that clock in the driver and made sure the dt-bindings
had its declaration. In addition seeing both APB and debounce reference
clocks are optional, we replaced the standard devm_clk_get() usage with
the function of optional clocks acquisition.

This patchset is rebased and tested on the mainline Linux kernel 5.6-rc4:
commit 98d54f81e36b ("Linux 5.6-rc4").

Changelog v2:
- Use a shorter summary describing the DT bindings conversion patch.
- Add myself to the MAINTAINERS file as a maintainer of the DW APB GPIO driver.
- Add myself to the maintainers list of the DW APB GPIO driver DT schema.
- Print error instead of info-message if APB/debounce clocks either
  failed to be acquired or couldn't be enabled.
- Rearrange the SoB tags.
- Make sure DT schema defines the lowercase hex numbers in the main dt-node
  name and in the sub-node names.
- Use "allOf:" statement to apply uint32 and "minimum/maximum" limitations
  on the "snps,nr-gpios" property of the DW APB GPIO DT schema.
- Discard "interrupts-extended" property from the DT schema.
- Make sure the sub-nodes have names with either 'gpio-port' or
  'gpio-controller' prefixes.
- Our corporate email server doesn't change Message-Id anymore, so the patchset
  is resubmitted being in the cover-letter-threaded format.

Changelog v3:
- Replace S: with M: section entry in the MAINTAINERS file.
- Cc Andy to all patches he isn't added by the auto "cc-cmd" command.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>
Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Cc: Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>
Cc: Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>
Cc: Vadim Vlasov <V.Vlasov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Hoan Tran <hoan@os.amperecomputing.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
Cc: linux-gpio@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Serge Semin (6):
  dt-bindings: gpio: Convert snps,dw-apb-gpio to DT schema
  dt-bindings: gpio: Add DW GPIO debounce clock property
  dt-bindings: gpio: Add Sergey Semin to DW APB GPIO driver maintainers
  gpio: dwapb: Use optional-clocks interface for APB ref-clock
  gpio: dwapb: Add debounce reference clock support
  MAINTAINERS: Add Segey Semin to maintainers of DW APB GPIO driver

 .../bindings/gpio/snps,dw-apb-gpio.yaml       | 134 ++++++++++++++++++
 .../bindings/gpio/snps-dwapb-gpio.txt         |  65 ---------
 MAINTAINERS                                   |   1 +
 drivers/gpio/gpio-dwapb.c                     |  41 ++++--
 4 files changed, 161 insertions(+), 80 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt

-- 
2.25.1

