Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 422343AC3D2
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jun 2021 08:25:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230335AbhFRG1t (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Jun 2021 02:27:49 -0400
Received: from lucky1.263xmail.com ([211.157.147.131]:58034 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230243AbhFRG1s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Jun 2021 02:27:48 -0400
Received: from localhost (unknown [192.168.167.16])
        by lucky1.263xmail.com (Postfix) with ESMTP id BE4B7BA75E;
        Fri, 18 Jun 2021 14:24:53 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P16485T139919018157824S1623997492865409_;
        Fri, 18 Jun 2021 14:24:54 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <2986a4e5241ffa4a8b29372f12dade97>
X-RL-SENDER: jay.xu@rock-chips.com
X-SENDER: xjq@rock-chips.com
X-LOGIN-NAME: jay.xu@rock-chips.com
X-FST-TO: heiko@sntech.de
X-RCPT-COUNT: 7
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     heiko@sntech.de, linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        robh+dt@kernel.org, kever.yang@rock-chips.com,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH v6 0/9] gpio-rockchip driver
Date:   Fri, 18 Jun 2021 14:24:40 +0800
Message-Id: <20210618062449.1067106-1-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Separate gpio driver from pinctrl driver, and support gpio v2 controller.

Jianqun Xu (8):
  pinctrl/rockchip: always enable clock for gpio controller
  pinctrl/rockchip: separate struct rockchip_pin_bank to a head file
  pinctrl/rockchip: add pinctrl device to gpio bank struct
  gpio/rockchip: add driver for rockchip gpio
  gpio/rockchip: use struct rockchip_gpio_regs for gpio controller
  gpio/rockchip: support next version gpio controller
  gpio/rockchip: drop irq_gc_lock/irq_gc_unlock for irq set type
  pinctrl/rockchip: drop the gpio related codes

Liang Chen (1):
  dt-bindings: gpio: change items restriction of clock for
    rockchip,gpio-bank

 .../bindings/gpio/rockchip,gpio-bank.yaml     |   5 +-
 drivers/gpio/Kconfig                          |   8 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-rockchip.c                  | 766 +++++++++++++++
 drivers/pinctrl/pinctrl-rockchip.c            | 911 +-----------------
 drivers/pinctrl/pinctrl-rockchip.h            | 287 ++++++
 6 files changed, 1085 insertions(+), 893 deletions(-)
 create mode 100644 drivers/gpio/gpio-rockchip.c
 create mode 100644 drivers/pinctrl/pinctrl-rockchip.h

-- 
v6:
 - new gpio-driver first and then drop gpio from pinctrl
 - reorder patches
 - cherry-pick gpio dt-binding from chenliang

v5:
 - change to devel branch

2.25.1



