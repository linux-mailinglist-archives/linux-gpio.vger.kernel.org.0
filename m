Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 306D810C4B7
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Nov 2019 09:08:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727408AbfK1IIn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Nov 2019 03:08:43 -0500
Received: from mga09.intel.com ([134.134.136.24]:39725 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727378AbfK1IIn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 28 Nov 2019 03:08:43 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Nov 2019 00:08:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,252,1571727600"; 
   d="scan'208";a="221249719"
Received: from sgsxdev001.isng.intel.com (HELO localhost) ([10.226.88.11])
  by orsmga002.jf.intel.com with ESMTP; 28 Nov 2019 00:08:40 -0800
From:   Rahul Tanwar <rahul.tanwar@linux.intel.com>
To:     linus.walleij@linaro.org
Cc:     torvalds@linux-foundation.org, sfr@canb.auug.org.au,
        andriy.shevchenko@intel.com, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-next@vger.kernel.org,
        Rahul Tanwar <rahul.tanwar@linux.intel.com>
Subject: [PATCH 1/1] pinctrl: Fix warning by adding missing MODULE_LICENSE
Date:   Thu, 28 Nov 2019 16:08:32 +0800
Message-Id: <20191128080832.13529-2-rahul.tanwar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191128080832.13529-1-rahul.tanwar@linux.intel.com>
References: <20191128080832.13529-1-rahul.tanwar@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix below build warning

   WARNING: modpost: missing MODULE_LICENSE() in
   drivers/pinctrl/pinctrl-equilibrium.o

Introduced by commit

   1948d5c51dba ("pinctrl: Add pinmux & GPIO controller driver for a new SoC")

by adding missing MODULE_LICENSE.

Signed-off-by: Rahul Tanwar <rahul.tanwar@linux.intel.com>
---
 drivers/pinctrl/pinctrl-equilibrium.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctrl-equilibrium.c
index 36c9072c5ece..067271b7d35a 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.c
+++ b/drivers/pinctrl/pinctrl-equilibrium.c
@@ -942,3 +942,4 @@ module_platform_driver(eqbr_pinctrl_driver);
 
 MODULE_AUTHOR("Zhu Yixin <yixin.zhu@intel.com>, Rahul Tanwar <rahul.tanwar@intel.com>");
 MODULE_DESCRIPTION("Pinctrl Driver for LGM SoC (Equilibrium)");
+MODULE_LICENSE("GPL v2");
-- 
2.11.0

