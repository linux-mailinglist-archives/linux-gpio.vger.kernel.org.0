Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 471002C3FD5
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Nov 2020 13:22:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728306AbgKYMUa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Nov 2020 07:20:30 -0500
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:64633 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727661AbgKYMUa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Nov 2020 07:20:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1606306829; x=1637842829;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=la+zR68Z2qgsSCWfX3ZjMl6N8D1EgMq70rPj15IUVuw=;
  b=uN0Cj4Rz9i8o94FudY56Y11olUjTHPu0P4EYsNK+nJPoYx/G4+IqKdjZ
   WnxDl6mIWnb5dnfo/K68uz5zJo9wYxiklHGt2JX9bacHrsC0QkKfub4i8
   L4c4/ye9QOatGwoNQMSiyYo9N7iv3XrsGut0JBjfBglC0J9r5ldOhtZaR
   04+olgMtKwmNlhNFtJVsPxfHP0R+W+ATJoSHI0x/lN868zwO9yLiNDVAA
   1Ij5A5fVlaNUZXGWdP/4STorCc3UF8RLyLM/vcBYkrqFKDXS/8nATjEAn
   E/zHxkbWCxmRKyNO5QlNL2Fgef2XvhuWEJTvwAHJk6fJa3fqWZMD8CLzf
   Q==;
IronPort-SDR: rHQmA/K0p7euYiTN3POg2mbiZNs0X3mRppQFArVNJr1EXkFLqzNiNCZQJDczX3p8bRmV3P1Erp
 Hs9RCmYkIgJ0/D7Yqf1HjCUTxMGB3e4iMAILHLYiByZ67lmr5c2X5GV7BH08uaSkihwiLNGrPo
 oA+1NBSjEPecpRH1Rk5D/QS9bAI3UoJ9zx0XehzQypCN3AC7tD62SF3LjFa+jwH493pNSjDCI4
 OVrIf78+0PzBipljDpa5ga54v8dFRg4WANyZ+R8oVf+NQvmOkxuQaZVIQLFUz9B2ynDl5p45M2
 9k8=
X-IronPort-AV: E=Sophos;i="5.78,368,1599548400"; 
   d="scan'208";a="104998394"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Nov 2020 05:20:29 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 25 Nov 2020 05:20:29 -0700
Received: from soft-dev10.microsemi.net (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Wed, 25 Nov 2020 05:20:27 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Randy Dunlap <rdunlap@infradead.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH -next] pinctrl: pinctrl-microchip-sgpio: Add OF config dependency
Date:   Wed, 25 Nov 2020 13:20:14 +0100
Message-ID: <20201125122014.11237-1-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pinctrl-microchip-sgpio driver needs OF support, so add that to
Kconfig.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
---
 drivers/pinctrl/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 9b8ed7516355..94e49da49f5c 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -376,11 +376,13 @@ config PINCTRL_OCELOT
 
 config PINCTRL_MICROCHIP_SGPIO
 	bool "Pinctrl driver for Microsemi/Microchip Serial GPIO"
+	depends on OF
 	depends on HAS_IOMEM
 	select GPIOLIB
 	select GENERIC_PINCONF
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
+	select OF_GPIO
 	help
 	  Support for the serial GPIO interface used on Microsemi and
 	  Microchip SoC's. By using a serial interface, the SIO
-- 
2.25.1

