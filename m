Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 720553ECC3D
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Aug 2021 03:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231772AbhHPBU0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 15 Aug 2021 21:20:26 -0400
Received: from lucky1.263xmail.com ([211.157.147.133]:45892 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229594AbhHPBU0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 15 Aug 2021 21:20:26 -0400
Received: from localhost (unknown [192.168.167.16])
        by lucky1.263xmail.com (Postfix) with ESMTP id CB635D63BE;
        Mon, 16 Aug 2021 09:19:51 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P26933T140041269528320S1629076790609014_;
        Mon, 16 Aug 2021 09:19:51 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <2bb0cc66aeba7389703dedd80a74259f>
X-RL-SENDER: jay.xu@rock-chips.com
X-SENDER: xjq@rock-chips.com
X-LOGIN-NAME: jay.xu@rock-chips.com
X-FST-TO: linus.walleij@linaro.org
X-RCPT-COUNT: 9
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     linus.walleij@linaro.org, heiko@sntech.de
Cc:     bgolaszewski@baylibre.com, robh+dt@kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH v8 0/9] gpio-rockchip driver
Date:   Mon, 16 Aug 2021 09:19:39 +0800
Message-Id: <20210816011948.1118959-1-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Separate gpio driver from pinctrl driver, and support gpio v2 controller.

Jianqun Xu (9):
  pinctrl/rockchip: always enable clock for gpio controller
  pinctrl/rockchip: separate struct rockchip_pin_bank to a head file
  pinctrl/rockchip: add pinctrl device to gpio bank struct
  dt-bindings: gpio: change items restriction of clock for
    rockchip,gpio-bank
  gpio/rockchip: add driver for rockchip gpio
  gpio/rockchip: use struct rockchip_gpio_regs for gpio controller
  gpio/rockchip: support next version gpio controller
  gpio/rockchip: drop irq_gc_lock/irq_gc_unlock for irq set type
  pinctrl/rockchip: drop the gpio related codes

 .../bindings/gpio/rockchip,gpio-bank.yaml     |   5 +-
 drivers/gpio/Kconfig                          |   8 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-rockchip.c                  | 771 +++++++++++++++
 drivers/pinctrl/pinctrl-rockchip.c            | 909 +-----------------
 drivers/pinctrl/pinctrl-rockchip.h            | 287 ++++++
 6 files changed, 1089 insertions(+), 892 deletions(-)
 create mode 100644 drivers/gpio/gpio-rockchip.c
 create mode 100644 drivers/pinctrl/pinctrl-rockchip.h

--
v8:
 - fix rockchip,gpio-bank.yaml about clocks and clock-names
 - fix commit author of rockchip,gpio-bank.yaml patch to me

v7:
 - include <linux/gpio/driver.h> instead of <linux/gpio.h>
 - use gpio align id instead of gpio-name

v6:
 - new gpio-driver first and then drop gpio from pinctrl
 - reorder patches
 - cherry-pick gpio dt-binding from chenliang

v5:
 - change to devel branch

2.25.1



