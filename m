Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF0B828CCF
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2019 00:00:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388358AbfEWWA7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 May 2019 18:00:59 -0400
Received: from merlin.infradead.org ([205.233.59.134]:42228 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387616AbfEWWA6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 May 2019 18:00:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=q0ChSwIgjWmAlSA3WLmbkrMunJ+EzRmHj6nCPrtyT6A=; b=3VKjo/+zSV+G+nl3AlhMIVepW+
        +cr9FiVKt7O00ECmmRJS5LXWb0qORktCXK3waGV0LpMbofvOiuTA7MkuUYVSwD94A7jIZHFMXR6/A
        XciZW1qUoziZiVS+z/AEeO01pbjki3pb7H26BySZ1MtEYvuloC6fUW68pqymnw7daEeZx2xEL75Tr
        /RNM9zuLSIXG2It+JD6kbuSGirnKOIJ/wltfLd58y2whO96hqpcGSpqik/CoVx/nqCoIdGjbeuXq+
        iA7lbSg0+Q2+45LGHRTw+hUL72iCNYmmaD++ipo51ilZ0vtVDv13lm8HHVQ/VvwarPw1xhJBuIi2N
        0L1oD0cw==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hTvlV-0005vn-6z; Thu, 23 May 2019 22:00:45 +0000
To:     LKML <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc:     kbuild test robot <lkp@intel.com>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] gpio: fix gpio-adp5588 build errors
Message-ID: <8054bec0-ea24-8590-738b-bae58c0be3b4@infradead.org>
Date:   Thu, 23 May 2019 15:00:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

The gpio-adp5588 driver uses interfaces that are provided by
GPIOLIB_IRQCHIP, so select that symbol in its Kconfig entry.

Fixes these build errors:

../drivers/gpio/gpio-adp5588.c: In function ‘adp5588_irq_handler’:
../drivers/gpio/gpio-adp5588.c:266:26: error: ‘struct gpio_chip’ has no member named ‘irq’
            dev->gpio_chip.irq.domain, gpio));
                          ^
../drivers/gpio/gpio-adp5588.c: In function ‘adp5588_irq_setup’:
../drivers/gpio/gpio-adp5588.c:298:2: error: implicit declaration of function ‘gpiochip_irqchip_add_nested’ [-Werror=implicit-function-declaration]
  ret = gpiochip_irqchip_add_nested(&dev->gpio_chip,
  ^
../drivers/gpio/gpio-adp5588.c:307:2: error: implicit declaration of function ‘gpiochip_set_nested_irqchip’ [-Werror=implicit-function-declaration]
  gpiochip_set_nested_irqchip(&dev->gpio_chip,
  ^

Fixes: 459773ae8dbb ("gpio: adp5588-gpio: support interrupt controller")

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Michael Hennerich <michael.hennerich@analog.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-gpio@vger.kernel.org
---
 drivers/gpio/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- lnx-52-rc1.orig/drivers/gpio/Kconfig
+++ lnx-52-rc1/drivers/gpio/Kconfig
@@ -822,6 +822,7 @@ config GPIO_ADP5588
 config GPIO_ADP5588_IRQ
 	bool "Interrupt controller support for ADP5588"
 	depends on GPIO_ADP5588=y
+	select GPIOLIB_IRQCHIP
 	help
 	  Say yes here to enable the adp5588 to be used as an interrupt
 	  controller. It requires the driver to be built in the kernel.


