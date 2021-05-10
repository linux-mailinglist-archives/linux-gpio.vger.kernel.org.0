Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F46F377C4F
	for <lists+linux-gpio@lfdr.de>; Mon, 10 May 2021 08:36:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbhEJGha (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 May 2021 02:37:30 -0400
Received: from lucky1.263xmail.com ([211.157.147.133]:57780 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229863AbhEJGh3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 May 2021 02:37:29 -0400
Received: from localhost (unknown [192.168.167.235])
        by lucky1.263xmail.com (Postfix) with ESMTP id 2513FCD444;
        Mon, 10 May 2021 14:36:05 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P2750T140649254856448S1620628564034882_;
        Mon, 10 May 2021 14:36:05 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <f8fb39bda157b2de25c6824f9dc7fe96>
X-RL-SENDER: jay.xu@rock-chips.com
X-SENDER: xjq@rock-chips.com
X-LOGIN-NAME: jay.xu@rock-chips.com
X-FST-TO: heiko@sntech.de
X-RCPT-COUNT: 7
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     heiko@sntech.de, linus.walleij@linaro.org, robh+dt@kernel.org
Cc:     linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH v4 0/7] gpio-rockchip driver
Date:   Mon, 10 May 2021 14:35:55 +0800
Message-Id: <20210510063602.505829-1-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Separate gpio driver from pinctrl driver, and support v2 controller.

Jianqun Xu (7):
  pinctrl/rockchip: separate struct rockchip_pin_bank to a head file
  pinctrl/pinctrl-rockchip.h: add pinctrl device to gpio bank struct
  gpio: separate gpio driver from pinctrl-rockchip driver
  gpio/rockchip: use struct rockchip_gpio_regs for gpio controller
  gpio/rockchip: support next version gpio controller
  gpio/rockchip: always enable clock for gpio controller
  gpio/rockchip: drop irq_gc_lock/irq_gc_unlock for irq set type

 drivers/gpio/Kconfig               |   8 +
 drivers/gpio/Makefile              |   1 +
 drivers/gpio/gpio-rockchip.c       | 758 ++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-rockchip.c | 910 +----------------------------
 drivers/pinctrl/pinctrl-rockchip.h | 287 +++++++++
 5 files changed, 1073 insertions(+), 891 deletions(-)
 create mode 100644 drivers/gpio/gpio-rockchip.c
 create mode 100644 drivers/pinctrl/pinctrl-rockchip.h

-- 
v5:
 - change to devel branch

2.25.1



