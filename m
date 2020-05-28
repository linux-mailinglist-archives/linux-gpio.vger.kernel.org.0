Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 316551E54D4
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2020 05:59:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727088AbgE1D6w (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 May 2020 23:58:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727065AbgE1D6v (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 May 2020 23:58:51 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A791CC08C5C1;
        Wed, 27 May 2020 20:58:51 -0700 (PDT)
Received: from apollo.fritz.box (unknown [IPv6:2a02:810c:c200:2e91:6257:18ff:fec4:ca34])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 3BCC322FB3;
        Thu, 28 May 2020 05:58:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1590638328;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=+u8MPYyDbcYv6Fo7V2HtH4lLlTB3DxELMaeS5MGUiiY=;
        b=EPZ4yD7toYFs8BVoOdBNPpoiXQaLSgPG2arBFC3LaZzXluEIpLIibpTQ+f+zdK+3W4qjO4
        qZDavCGC7/c2sbb3lK2BLQO/5NhmFA0AEVmzl1JXRo248XOdzTrETPLS/tRnk/uqZL+kEg
        wJ6w1kVg4Vx/QpYXDNEHL9ZtIt+fztE=
From:   Michael Walle <michael@walle.cc>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Brown <broonie@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@intel.com>,
        Michael Walle <michael@walle.cc>
Subject: [PATCH v5 0/2] gpio: generic regmap implementation
Date:   Thu, 28 May 2020 05:58:39 +0200
Message-Id: <20200528035841.16800-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Changes since v4:
 - add comment about can_sleep
 - fix config->label typo
 - add config->names property

Changes since v3:
 - set reg_dat_base, that was actually broken
 - fix typo
 - fix swapped reg_in_dir/reg_out_dir documentation
 - use "goto err" in error path in gpio_regmap_register()

Changes since v2:
 See changelog in the former patch series.

Michael Walle (2):
  gpiolib: Introduce gpiochip_irqchip_add_domain()
  gpio: add a reusable generic gpio_chip using regmap

 drivers/gpio/Kconfig        |   4 +
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-regmap.c  | 352 ++++++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib.c      |  20 ++
 include/linux/gpio-regmap.h |  70 +++++++
 include/linux/gpio/driver.h |   3 +
 6 files changed, 450 insertions(+)
 create mode 100644 drivers/gpio/gpio-regmap.c
 create mode 100644 include/linux/gpio-regmap.h

-- 
2.20.1

