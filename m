Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80BF225F1E1
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Sep 2020 04:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbgIGC7m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Sep 2020 22:59:42 -0400
Received: from lucky1.263xmail.com ([211.157.147.131]:55096 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726278AbgIGC7j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Sep 2020 22:59:39 -0400
Received: from localhost (unknown [192.168.167.235])
        by lucky1.263xmail.com (Postfix) with ESMTP id 282A3B3819;
        Mon,  7 Sep 2020 10:59:36 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P22906T140609293825792S1599447567920103_;
        Mon, 07 Sep 2020 10:59:36 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <26e5753d0fff5fad224876fc28c4d989>
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
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Subject: [PATCH 1/5] pinctrl: rockchip: depend on OF
Date:   Mon,  7 Sep 2020 10:59:23 +0800
Message-Id: <20200907025927.9713-2-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200907025927.9713-1-jay.xu@rock-chips.com>
References: <20200831084753.7115-1-jay.xu@rock-chips.com>
 <20200907025927.9713-1-jay.xu@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

The Rockchip pinctrl driver needs to handle information from Devicetree
so only makes sense getting compiled on systems with CONFIG_OF enabled.

This also fixes a problem found by the "kernel-test-robot" when compiling
the driver on test-builds that do not have CONFIG_OF enabled:

  drivers/pinctrl/pinctrl-rockchip.c: In function 'rockchip_pinctrl_parse_groups':
>> drivers/pinctrl/pinctrl-rockchip.c:2881:9: error: implicit declaration of function 'pinconf_generic_parse_dt_config'; did you mean 'pinconf_generic_dump_config'? [-Werror=implicit-function-declaration]
    2881 |   ret = pinconf_generic_parse_dt_config(np_config, NULL,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         pinconf_generic_dump_config
   drivers/pinctrl/pinctrl-rockchip.c: In function 'rockchip_gpiolib_register':
>> drivers/pinctrl/pinctrl-rockchip.c:3473:5: error: 'struct gpio_chip' has no member named 'of_node'
    3473 |   gc->of_node = bank->of_node;

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
---
 drivers/pinctrl/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 8828613c4e0e..4284f39a5c61 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -208,10 +208,12 @@ config PINCTRL_OXNAS
 
 config PINCTRL_ROCKCHIP
 	bool
+	depends on OF
 	select PINMUX
 	select GENERIC_PINCONF
 	select GENERIC_IRQ_CHIP
 	select MFD_SYSCON
+	select OF_GPIO
 
 config PINCTRL_RZA1
 	bool "Renesas RZ/A1 gpio and pinctrl driver"
-- 
2.17.1



