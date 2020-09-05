Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CE5125EB1A
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Sep 2020 23:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728704AbgIEVuK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Sep 2020 17:50:10 -0400
Received: from gloria.sntech.de ([185.11.138.130]:33636 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728589AbgIEVuI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 5 Sep 2020 17:50:08 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1kEg4L-0005Xo-MX; Sat, 05 Sep 2020 23:49:57 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     linus.walleij@linaro.org
Cc:     jay.xu@rock-chips.com, lkp@intel.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, heiko@sntech.de,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Subject: [PATCH] pinctrl: rockchip: depend on OF
Date:   Sat,  5 Sep 2020 23:49:55 +0200
Message-Id: <20200905214955.907950-1-heiko@sntech.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
2.28.0

