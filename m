Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C84982230BD
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 03:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726166AbgGQBtT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 21:49:19 -0400
Received: from lucky1.263xmail.com ([211.157.147.130]:38798 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726322AbgGQBtT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 21:49:19 -0400
Received: from localhost (unknown [192.168.167.13])
        by lucky1.263xmail.com (Postfix) with ESMTP id B5E5CCA8A3;
        Fri, 17 Jul 2020 09:49:12 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P17843T139819799787264S1594950550837667_;
        Fri, 17 Jul 2020 09:49:12 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <7adf7b4f5507eeb3cdc7f0c4ffd94f42>
X-RL-SENDER: jay.xu@rock-chips.com
X-SENDER: xjq@rock-chips.com
X-LOGIN-NAME: jay.xu@rock-chips.com
X-FST-TO: heiko@sntech.de
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     heiko@sntech.de, linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, kever.yang@rock-chips.com,
        david.wu@rock-chips.com, Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH 00/13] pinctrl: rockchip: prepare work for split driver
Date:   Fri, 17 Jul 2020 09:48:55 +0800
Message-Id: <20200717014908.13914-1-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This serial patchs include 12 codingstyle patches and 1 bug fix (enable
gpio pclk for rockchip_gpio_to_irq).

Also it's prepare for split driver work.

Jianqun Xu (13):
  pinctrl: rockchip: add nr_pins to rockchip_pin_ctrl
  pinctrl: rockchip: modify rockchip_pin_ctrl to const struct
  pinctrl: rockchip: make driver be tristate module
  pinctrl: rockchip: enable gpio pclk for rockchip_gpio_to_irq
  pinctrl: rockchip: create irq mapping in gpio_to_irq
  pinctrl: rockchip: do codingstyle
  pinctrl: rockchip: do codingstyle
  pinctrl: rockchip: do codingstyle
  pinctrl: rockchip: do codingstyle
  pinctrl: rockchip: do codingstyle
  pinctrl: rockchip: do codingstyle
  pinctrl: rockchip: define common codes without special chip name
  pinctrl: rockchip: do codingstyle by adding mux route definitions

 drivers/pinctrl/Kconfig            |   2 +-
 drivers/pinctrl/pinctrl-rockchip.c | 933 ++++++++---------------------
 2 files changed, 261 insertions(+), 674 deletions(-)

-- 
2.17.1



