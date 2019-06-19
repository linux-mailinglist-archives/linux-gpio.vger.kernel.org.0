Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C877C4B8FC
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jun 2019 14:45:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731875AbfFSMp7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Jun 2019 08:45:59 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:58116 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727244AbfFSMp6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Jun 2019 08:45:58 -0400
Received: from nat-ies.mentorg.com ([192.94.31.2] helo=svr-ies-mbx-01.mgc.mentorg.com)
        by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
        id 1hdZyM-0004XT-9V from Harish_Kandiga@mentor.com ; Wed, 19 Jun 2019 05:45:54 -0700
Received: from hkandiga-VirtualBox.ina-wifi.mentorg.com (137.202.0.90) by
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) with Microsoft SMTP Server
 (TLS) id 15.0.1320.4; Wed, 19 Jun 2019 13:45:49 +0100
From:   Harish Jenny K N <harish_kandiga@mentor.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     <linux-gpio@vger.kernel.org>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Balasubramani Vivekanandan 
        <balasubramani_vivekanandan@mentor.com>
Subject: [PATCH V3 0/2] Add Inverter controller for gpio configuration
Date:   Wed, 19 Jun 2019 18:15:42 +0530
Message-ID: <1560948344-6543-1-git-send-email-harish_kandiga@mentor.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The purpose of this patchset is to provide a new inverter
gpio controller to configure the polarity of the gpio pins.
This driver enables the consumers to directly use the gpio pin
without worrying about the hardware level polarity configuration.
Polarity configuration will be done by the inverter gpio controller
based on device tree information.

This is created after the discussion in the thread
"gpio: set active-state of GPIO lines using device tree"
https://www.spinics.net/lists/linux-gpio/msg38829.html
to model inverters in the device tree to describe the hardware.

Thanks,
Harish.

---

Changes in V3:
- Addressed review findings from Linus Walleij
to not use GPIO_ACTIVE_LOW.

Changes in V2:
- Addressed review findings from Linus Walleij, Phil Reid,
  Geert Uytterhoeven and Enrico Weigelt
- Implement can_sleep changes
- Changes not included
  Wrap some functions like .set_multiple/.get_multiple/.set_config.
 Reason: Not completely certain of the necessity in this driver
especially given gpio_chip_set_multiple and gpio_chip_get_multiple
functions in gpiolib handles when the callbacks are not set.
Also not sure of using gpiochip_generic_config as a callback function
or with some other implementation.

  Please let me know if they need to be implemented.

Harish Jenny K N (2):
  gpio: inverter: Add Inverter controller for gpio configuration
  gpio: inverter: document the inverter bindings

 .../devicetree/bindings/gpio/gpio-inverter.txt     |  29 +++++
 drivers/gpio/Kconfig                               |   9 ++
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-inverter.c                       | 130 +++++++++++++++++++++
 4 files changed, 169 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-inverter.txt
 create mode 100644 drivers/gpio/gpio-inverter.c

--
2.7.4

