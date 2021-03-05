Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C70A32DE64
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Mar 2021 01:39:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230455AbhCEAjP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 19:39:15 -0500
Received: from lucky1.263xmail.com ([211.157.147.132]:36596 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229465AbhCEAjP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 19:39:15 -0500
Received: from localhost (unknown [192.168.167.224])
        by lucky1.263xmail.com (Postfix) with ESMTP id 18503F2C17;
        Fri,  5 Mar 2021 08:39:11 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P26158T139991629948672S1614904748986290_;
        Fri, 05 Mar 2021 08:39:10 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <bb8288ed45656e582667a741c4fdc546>
X-RL-SENDER: jay.xu@rock-chips.com
X-SENDER: xjq@rock-chips.com
X-LOGIN-NAME: jay.xu@rock-chips.com
X-FST-TO: linus.walleij@linaro.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     linus.walleij@linaro.org, heiko@sntech.de, catalin.marinas@arm.com,
        will@kernel.org
Cc:     linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH 1/2] arm64: remove select PINCTRL_ROCKCHIP from ARCH_ROCKCHIP
Date:   Fri,  5 Mar 2021 08:39:06 +0800
Message-Id: <20210305003907.1692515-2-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210305003907.1692515-1-jay.xu@rock-chips.com>
References: <20210305003907.1692515-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Prepare to make pinctrl driver of rockchip to be module able, this patch
remove the select of PINCTRL_ROCKCHIP from ARCH_ROCKCHIP.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 arch/arm64/Kconfig.platforms | 2 --
 drivers/pinctrl/Kconfig      | 4 ++++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 6eecdef538bd..0371cc02b448 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -227,9 +227,7 @@ config ARCH_RENESAS
 config ARCH_ROCKCHIP
 	bool "Rockchip Platforms"
 	select ARCH_HAS_RESET_CONTROLLER
-	select GPIOLIB
 	select PINCTRL
-	select PINCTRL_ROCKCHIP
 	select PM
 	select ROCKCHIP_TIMER
 	help
diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 03c62e1cb395..bf88aac7bcc6 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -210,11 +210,15 @@ config PINCTRL_OXNAS
 config PINCTRL_ROCKCHIP
 	bool
 	depends on OF
+	select GPIOLIB
 	select PINMUX
 	select GENERIC_PINCONF
 	select GENERIC_IRQ_CHIP
 	select MFD_SYSCON
 	select OF_GPIO
+	default ARCH_ROCKCHIP
+	help
+          This support pinctrl and gpio driver for Rockchip SoCs.
 
 config PINCTRL_SINGLE
 	tristate "One-register-per-pin type device tree based pinctrl driver"
-- 
2.25.1



