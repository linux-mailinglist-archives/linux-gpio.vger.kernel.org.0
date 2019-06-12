Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3729C41B5A
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2019 06:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730255AbfFLEu6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jun 2019 00:50:58 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:51258 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730248AbfFLEu6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jun 2019 00:50:58 -0400
Received: from nat-ies.mentorg.com ([192.94.31.2] helo=svr-ies-mbx-01.mgc.mentorg.com)
        by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
        id 1havDn-0000fK-NC from Harish_Kandiga@mentor.com ; Tue, 11 Jun 2019 21:50:51 -0700
Received: from hkandiga-VirtualBox.ina-wifi.mentorg.com (137.202.0.90) by
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) with Microsoft SMTP Server
 (TLS) id 15.0.1320.4; Wed, 12 Jun 2019 05:50:47 +0100
From:   Harish Jenny K N <harish_kandiga@mentor.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     <linux-gpio@vger.kernel.org>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Balasubramani Vivekanandan 
        <balasubramani_vivekanandan@mentor.com>
Subject: [PATCH V1 0/2] Add virtual controller for gpio configuration
Date:   Wed, 12 Jun 2019 10:20:32 +0530
Message-ID: <1560315034-29712-1-git-send-email-harish_kandiga@mentor.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The purpose of this patchset is to provide a new virtual
gpio controller to configure the polarity of the gpio pins
used by the userspace. When there is no kernel driver using
the gpio pin, it becomes necessary for the userspace
to configure the polarity of the gpio pin.
This driver enables the userspace to directly use the gpio pin
without worrying about the hardware level polarity configuration.
Polarity configuration will be done by the virtual gpio controller
based on device tree information.

This is created after the discussion in the thread
"gpio: set active-state of GPIO lines using device tree"
https://www.spinics.net/lists/linux-gpio/msg38829.html
to model inverters in the device tree to describe the hardware.

Thanks,
Harish.

Harish Jenny K N (2):
  gpio: inverter: Add virtual controller for gpio configuration
  gpio: inverter: document the inverter bindings

 .../devicetree/bindings/gpio/gpio-inverter.txt     |  30 +++++
 drivers/gpio/Kconfig                               |   9 ++
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-inverter.c                       | 144 +++++++++++++++++++++
 4 files changed, 184 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-inverter.txt
 create mode 100644 drivers/gpio/gpio-inverter.c

--
2.7.4

