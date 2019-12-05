Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 802A7113A28
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2019 04:01:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728800AbfLEDBi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 22:01:38 -0500
Received: from mga17.intel.com ([192.55.52.151]:38152 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728321AbfLEDBi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 4 Dec 2019 22:01:38 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Dec 2019 19:01:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,279,1571727600"; 
   d="scan'208";a="223484568"
Received: from sgsxdev001.isng.intel.com (HELO localhost) ([10.226.88.11])
  by orsmga002.jf.intel.com with ESMTP; 04 Dec 2019 19:01:35 -0800
From:   Rahul Tanwar <rahul.tanwar@linux.intel.com>
To:     linus.walleij@linaro.org
Cc:     rdunlap@infradead.org, sfr@canb.auug.org.au,
        linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Rahul Tanwar <rahul.tanwar@linux.intel.com>
Subject: [PATCH 1/1] pinctrl: Modify Kconfig to fix linker error
Date:   Thu,  5 Dec 2019 11:01:31 +0800
Message-Id: <ba937f271d1a2173828a2325990d62cb36d61595.1575514110.git.rahul.tanwar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1575514110.git.rahul.tanwar@linux.intel.com>
References: <cover.1575514110.git.rahul.tanwar@linux.intel.com>
In-Reply-To: <cover.1575514110.git.rahul.tanwar@linux.intel.com>
References: <cover.1575514110.git.rahul.tanwar@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix below linker error

    ld: drivers/pinctrl/pinctrl-equilibrium.o: in function
    `pinconf_generic_dt_node_to_map_all':
    pinctrl-equilibrium.c:(.text+0xb): undefined reference
    to `pinconf_generic_dt_node_to_map'

Caused by below commit

    1948d5c51dba ("pinctrl: Add pinmux & GPIO controller driver for a new SoC")

by adding 'depends on OF' in Kconfig driver entry.

Reported-by: Randy Dunlap <rdunlap@infradead.org>>
Signed-off-by: Rahul Tanwar <rahul.tanwar@linux.intel.com>
---
 drivers/pinctrl/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 3bfbf2ff6e2b..ba0cad4bd072 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -422,6 +422,7 @@ config PINCTRL_TB10X
 
 config PINCTRL_EQUILIBRIUM
 	tristate "Generic pinctrl and GPIO driver for Intel Lightning Mountain SoC"
+	depends on OF
 	select PINMUX
 	select PINCONF
 	select GPIOLIB
-- 
2.11.0

