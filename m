Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EDAF23337A
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jul 2020 15:55:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbgG3Nzs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jul 2020 09:55:48 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:56414 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726794AbgG3Nzs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jul 2020 09:55:48 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id CD8E68040A6A;
        Thu, 30 Jul 2020 13:55:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id nLF1USOx9tsy; Thu, 30 Jul 2020 16:55:41 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Hoan Tran <hoan@os.amperecomputing.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 01/10] dt-bindings: gpio: dwapb: Add ngpios property support
Date:   Thu, 30 Jul 2020 16:55:27 +0300
Message-ID: <20200730135536.19747-2-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200730135536.19747-1-Sergey.Semin@baikalelectronics.ru>
References: <20200730135536.19747-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It's redundant to have a vendor-specific property describing a number of
GPIOS while there is a generic one. Let's mark the former one as
deprecated and define the "ngpios" property supported with constraints
of being within [1; 32] range.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/gpio/snps,dw-apb-gpio.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml b/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
index 1240f6289249..b391cc1b4590 100644
--- a/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
@@ -61,8 +61,14 @@ patternProperties:
       '#gpio-cells':
         const: 2
 
+      ngpios:
+        default: 32
+        minimum: 1
+        maximum: 32
+
       snps,nr-gpios:
         description: The number of GPIO pins exported by the port.
+        deprecated: true
         $ref: /schemas/types.yaml#/definitions/uint32
         default: 32
         minimum: 1
-- 
2.27.0

