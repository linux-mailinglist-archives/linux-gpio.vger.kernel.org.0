Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E197622A4BD
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jul 2020 03:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387686AbgGWBj3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 21:39:29 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:32928 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387477AbgGWBjI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jul 2020 21:39:08 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 285B28030807;
        Thu, 23 Jul 2020 01:39:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id dr5tWX9rHT3C; Thu, 23 Jul 2020 04:39:05 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Hoan Tran <hoan@os.amperecomputing.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Serge Semin <fancer.lancer@gmail.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Rob Herring <robh+dt@kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/7] gpio: dwapb: Add ngpios DT-property support
Date:   Thu, 23 Jul 2020 04:38:53 +0300
Message-ID: <20200723013858.10766-3-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200723013858.10766-1-Sergey.Semin@baikalelectronics.ru>
References: <20200723013858.10766-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Indeed generic GPIO DT-schema implies that number of GPIOs should be
described by the "ngpios" property located under a GPIO-provider DT node.
In that case it's redundant to have a vendor-specific "snps,nr-gpios"
property describing the same setting. Moreover it might be errors prone.

Since commit 93d2e4322aa7 ("of: platform: Batch fwnode parsing when adding
all top level devices") the fwnode parsing is resumed after the vast
majority of the platform devices are added. Implicitly that commit
activates re-parsing of the whole device tree GPIOs-phandle properties
detected having "-gpio/-gpios" suffixes. Since the vendor-specific number
of GPIOs property is defined with "-gpios" suffix, then of_link_property()
will consider it as a suffix-property with "#gpio-cells" structure, which
obviously it doesn't have. As a result for two DW APB GPIO controllers
we'll have the next errors printed.

OF: /bus@1f059000/gpio@1f044000/gpio-port@0: could not find phandle
OF: /bus@1f059000/gpio@1f045000/gpio-port@0: could not get #gpio-cells for /opp-table
OF: /bus@1f059000/gpio@1f044000/gpio-port@0: could not find phandle
OF: /bus@1f059000/gpio@1f045000/gpio-port@0: could not get #gpio-cells for /opp-table

See the kernel fwnode parsing procedure even tried to resolve the phandle
ID, which it thought was the opp-table DT-node, while in fact it was just
a number "32". What would happen if that magic number actually referred to
a GPIO DT-node with "#gpio-cells" property defined?..

In order to fix the problem let's mark the "snps,nr-gpios" property as
deprecated and add the generic "ngpios" property support with the same
purpose as the deprecated one. That and the errors log above shall
motivate the platform developer to convert the DW APB GPIO DT-nodes to
using the standard number of GPIOs property.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/gpio/gpio-dwapb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 1d8d55bd63aa..ccd80df16062 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -594,7 +594,8 @@ static struct dwapb_platform_data *dwapb_gpio_get_pdata(struct device *dev)
 			return ERR_PTR(-EINVAL);
 		}
 
-		if (fwnode_property_read_u32(fwnode, "snps,nr-gpios", &pp->ngpio)) {
+		if (fwnode_property_read_u32(fwnode, "ngpios", &pp->ngpio) &&
+		    fwnode_property_read_u32(fwnode, "snps,nr-gpios", &pp->ngpio)) {
 			dev_info(dev,
 				 "failed to get number of gpios for port%d\n",
 				 i);
-- 
2.26.2

