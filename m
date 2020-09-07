Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B024125F1F4
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Sep 2020 05:06:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726367AbgIGDGG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Sep 2020 23:06:06 -0400
Received: from lucky1.263xmail.com ([211.157.147.130]:51324 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726357AbgIGDGF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Sep 2020 23:06:05 -0400
X-Greylist: delayed 392 seconds by postgrey-1.27 at vger.kernel.org; Sun, 06 Sep 2020 23:06:03 EDT
Received: from localhost (unknown [192.168.167.235])
        by lucky1.263xmail.com (Postfix) with ESMTP id 1ACC8CC432;
        Mon,  7 Sep 2020 10:59:29 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P22906T140609293825792S1599447567920103_;
        Mon, 07 Sep 2020 10:59:29 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <360ede3c9de940abb01fa2c2d5aa674f>
X-RL-SENDER: jay.xu@rock-chips.com
X-SENDER: xjq@rock-chips.com
X-LOGIN-NAME: jay.xu@rock-chips.com
X-FST-TO: linus.walleij@linaro.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     linus.walleij@linaro.org, heiko@sntech.de
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH v2 0/5] rockchip-pinctrl fixes for GKI
Date:   Mon,  7 Sep 2020 10:59:22 +0800
Message-Id: <20200907025927.9713-1-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200831084753.7115-1-jay.xu@rock-chips.com>
References: <20200831084753.7115-1-jay.xu@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

These patches will fix some issues and modify for GKI.

Heiko Stuebner (1):
  pinctrl: rockchip: depend on OF

Jianqun Xu (4):
  pinctrl: rockchip: make driver be tristate module
  pinctrl: rockchip: enable gpio pclk for rockchip_gpio_to_irq
  pinctrl: rockchip: create irq mapping in gpio_to_irq
  pinctrl: rockchip: populate platform device for rockchip gpio

 drivers/pinctrl/Kconfig            |   4 +-
 drivers/pinctrl/pinctrl-rockchip.c | 289 +++++++++++++++++------------
 2 files changed, 175 insertions(+), 118 deletions(-)

-- 
2.17.1



