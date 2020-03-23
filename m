Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5869318FE29
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2020 20:54:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbgCWTya (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Mar 2020 15:54:30 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:38258 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbgCWTya (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Mar 2020 15:54:30 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 542F880307C2;
        Mon, 23 Mar 2020 19:54:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id x_qnOKUP9ntz; Mon, 23 Mar 2020 22:54:27 +0300 (MSK)
From:   <Sergey.Semin@baikalelectronics.ru>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rob Herring <robh@kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 3/6] dt-bindings: gpio: Add Sergey Semin to DW APB GPIO driver maintainers
Date:   Mon, 23 Mar 2020 22:53:58 +0300
Message-ID: <20200323195401.30338-4-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200323195401.30338-1-Sergey.Semin@baikalelectronics.ru>
References: <20200323180632.14119-1-Sergey.Semin@baikalelectronics.ru>
 <20200323195401.30338-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Serge Semin <Sergey.Semin@baikalelectronics.ru>

Seeing Hoan has been silent for a long time Linus suggested to me
to be also maintaining the driver. This patch adds myself to the list
of maintainers in the DT schema of the driver.

Suggested-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Hoan Tran <hoan@os.amperecomputing.com>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml b/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
index 58a8df367623..04a3c51e1dc1 100644
--- a/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
@@ -13,6 +13,7 @@ description: |
 
 maintainers:
   - Hoan Tran <hoan@os.amperecomputing.com>
+  - Serge Semin <fancer.lancer@gmail.com>
 
 properties:
   $nodename:
-- 
2.25.1

