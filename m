Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 707FD4453FF
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Nov 2021 14:36:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231379AbhKDNj2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Nov 2021 09:39:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:38980 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231332AbhKDNj1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 4 Nov 2021 09:39:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 06CF4604DC;
        Thu,  4 Nov 2021 13:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636033009;
        bh=LL6MZq3ANzbnT8B6kNDsWFF+dSyrJdaXeAPKgIfe79Y=;
        h=From:To:Cc:Subject:Date:From;
        b=hmaO4gSO5+Y0cYnIoou/71k59ALarjvmPkvhEgE6BmMqsJuhgv49NaA5Clg4llPzZ
         ukjfCTKoWIZVR1ai8okRR/yJWpRxekvZT3ioItVnr5zO3rV47gcMIJY3fg6LBQVdYH
         nnZwSVfLmBMEjGkdSfzQyQBxqqEp+aMx0WOtKc0PPxIJvsAz2jgMRQyVNlldfmfxFL
         IPt+PB+TUW58wMPlzh8TdySZxqZVxE7UcMXbvlrEcNXLuTYt7NTGj+LsGTTgzu9g4X
         XnrgqJoX7SPRO/rVf2ByFM7ADLhwopw59qT44le6K1emh71B15GSSIqYiMybK5/CmI
         X43oeSBrxaDkw==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: tegra194: remove duplicate initializer again
Date:   Thu,  4 Nov 2021 14:36:39 +0100
Message-Id: <20211104133645.1186968-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

An earlier bugfix removed a duplicate field initializer in
a macro, but it seems that this came back with the following
update:

drivers/pinctrl/tegra/pinctrl-tegra194.c:1341:28: error: initialized field overwritten [-Werror=override-init]
 1341 |                 .drv_reg = ((r)),                               \
      |                            ^
drivers/pinctrl/tegra/pinctrl-tegra194.c:1392:41: note: in expansion of macro 'DRV_PINGROUP_ENTRY_Y'
 1392 | #define drive_touch_clk_pcc4            DRV_PINGROUP_ENTRY_Y(0x2004,    12,     5,      20,     5,      -1,     -1,     -1,     -1,     1)
      |                                         ^~~~~~~~~~~~~~~~~~~~
drivers/pinctrl/tegra/pinctrl-tegra194.c:1631:17: note: in expansion of macro 'drive_touch_clk_pcc4'
 1631 |                 drive_##pg_name,                                \
      |                 ^~~~~~
drivers/pinctrl/tegra/pinctrl-tegra194.c:1636:9: note: in expansion of macro 'PINGROUP'
 1636 |         PINGROUP(touch_clk_pcc4,        GP,             TOUCH,          RSVD2,          RSVD3,          0x2000,         1,      Y,      -1,     -1,     6,      8,      -1,     10,     11,     12,     N,      -1,     -1,     N,      "vddio_ao"),
      |         ^~~~~~~~
drivers/pinctrl/tegra/pinctrl-tegra194.c:1341:28: note: (near initialization for 'tegra194_groups[0].drv_reg')
 1341 |                 .drv_reg = ((r)),                               \
      |                            ^
drivers/pinctrl/tegra/pinctrl-tegra194.c:1392:41: note: in expansion of macro 'DRV_PINGROUP_ENTRY_Y'
 1392 | #define drive_touch_clk_pcc4            DRV_PINGROUP_ENTRY_Y(0x2004,    12,     5,      20,     5,      -1,     -1,     -1,     -1,     1)
      |                                         ^~~~~~~~~~~~~~~~~~~~
drivers/pinctrl/tegra/pinctrl-tegra194.c:1631:17: note: in expansion of macro 'drive_touch_clk_pcc4'
 1631 |                 drive_##pg_name,                                \
      |                 ^~~~~~
drivers/pinctrl/tegra/pinctrl-tegra194.c:1636:9: note: in expansion of macro 'PINGROUP'
 1636 |         PINGROUP(touch_clk_pcc4,        GP,             TOUCH,          RSVD2,          RSVD3,          0x2000,         1,      Y,      -1,     -1,     6,      8,      -1,     10,     11,     12,     N,      -1,     -1,     N,      "vddio_ao"),
      |         ^~~~~~~~

Remove it again.

Fixes: 613c0826081b ("pinctrl: tegra: Add pinmux support for Tegra194")
Fixes: 92cadf68e50a ("pinctrl: tegra: pinctrl-tegra194: Do not initialise field twice")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
The two initializers are different, please double-check that I
remove the right one here.
---
 drivers/pinctrl/tegra/pinctrl-tegra194.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra194.c b/drivers/pinctrl/tegra/pinctrl-tegra194.c
index b4fef9185d88..5c1dfcb46749 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra194.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra194.c
@@ -1387,7 +1387,6 @@ static struct tegra_function tegra194_functions[] = {
 		.schmitt_bit = schmitt_b,			\
 		.drvtype_bit = 13,				\
 		.lpdr_bit = e_lpdr,				\
-		.drv_reg = -1,					\
 
 #define drive_touch_clk_pcc4            DRV_PINGROUP_ENTRY_Y(0x2004,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
 #define drive_uart3_rx_pcc6             DRV_PINGROUP_ENTRY_Y(0x200c,	12,	5,	20,	5,	-1,	-1,	-1,	-1,	1)
-- 
2.29.2

