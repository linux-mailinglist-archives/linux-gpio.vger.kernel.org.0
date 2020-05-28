Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56F151E6516
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2020 16:59:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403984AbgE1O7k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 May 2020 10:59:40 -0400
Received: from ssl.serverraum.org ([176.9.125.105]:51709 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403956AbgE1O7T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 May 2020 10:59:19 -0400
Received: from apollo.fritz.box (unknown [IPv6:2a02:810c:c200:2e91:6257:18ff:fec4:ca34])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id DA16422F2D;
        Thu, 28 May 2020 16:59:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1590677957;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=tW77hbmrRY90NEi12v0m/ZXytlyCCBmCao0Ek/zkAO4=;
        b=g6eMNQ1Z+3QPBa+3PW3d9gOWQ5HMIjYjELVuE+iq1NepLUj+xlCSy0kK0KEuFmygBU4rY6
        /+5ujibCNapTjI3oCeT8wpZrVI8LwqLdJtOEsKKw/M8FUsjqx2IYeYvvlZI3/Nr/3d1Y3k
        bMBcjrqYSEPUBQ1M3vFRcEOVTB6GB4s=
From:   Michael Walle <michael@walle.cc>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Brown <broonie@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Michael Walle <michael@walle.cc>
Subject: [PATCH v6 0/3] gpio: generic regmap implementation
Date:   Thu, 28 May 2020 16:58:42 +0200
Message-Id: <20200528145845.31436-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series is a split off of the sl28cpld series:
https://lore.kernel.org/linux-gpio/20200423174543.17161-1-michael@walle.cc/

I wasn't sure if I should also include the gpiochip_irqchip_add_domain()
patch here. So feel free to skip it. OTOH if you use interrupts with
gpio-regmap it is quite handy.

For an actual user see the patch 11/16 ("gpio: add support for the sl28cpld
GPIO controller") of the series above.

Changes since v5:
 - add names property
 - addressed Alex' remarks:
   - moved header from i/l/gpio-regmap.h to i/l/gpio/regmap.h
   - fixed kernel doc
   - described rules how to use the register base offsets
   - missing forward declarations
   - style changes
   - return -EOPNOTSUPP, in code path we should never reach
 - added check to have input and output base regs if there is a direction
   register
 - added MAINTAINERS patch

Changes since v4:
 - add comment about can_sleep
 - fix config->label typo
 - add config->names property

Changes since v3:
 - set reg_dat_base, that was actually broken
 - fix typo
 - fix swapped reg_in_dir/reg_out_dir documentation
 - use "goto err" in error path in gpio_regmap_register()

Michael Walle (3):
  gpiolib: Introduce gpiochip_irqchip_add_domain()
  gpio: add a reusable generic gpio_chip using regmap
  MAINTAINERS: Add gpio regmap section

 MAINTAINERS                 |   6 +
 drivers/gpio/Kconfig        |   4 +
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-regmap.c  | 349 ++++++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib.c      |  20 +++
 include/linux/gpio/driver.h |   3 +
 include/linux/gpio/regmap.h |  86 +++++++++
 7 files changed, 469 insertions(+)
 create mode 100644 drivers/gpio/gpio-regmap.c
 create mode 100644 include/linux/gpio/regmap.h

-- 
2.20.1

