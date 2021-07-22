Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 229583D248A
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jul 2021 15:26:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232076AbhGVMpv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Jul 2021 08:45:51 -0400
Received: from foss.arm.com ([217.140.110.172]:53226 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231925AbhGVMpv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 22 Jul 2021 08:45:51 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B645113E;
        Thu, 22 Jul 2021 06:26:26 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A2A53F694;
        Thu, 22 Jul 2021 06:26:24 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     Jernej Skrabec <jernej.skrabec@gmail.com>,
        Icenowy Zheng <icenowy@aosc.io>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [PATCH] pinctrl: sunxi: Don't underestimate number of functions
Date:   Thu, 22 Jul 2021 14:25:48 +0100
Message-Id: <20210722132548.22121-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When we are building all the various pinctrl structures for the
Allwinner pinctrl devices, we do some estimation about the maximum
number of distinct function (names) that we will need.

So far we take the number of pins as an upper bound, even though we
can actually have up to four special functions per pin. This wasn't a
problem until now, since we indeed have typically far more pins than
functions, and most pins share common functions.

However the H616 "-r" pin controller has only two pins, but four
functions, so we run over the end of the array when we are looking for
a matching function name in sunxi_pinctrl_add_function - there is no
NULL sentinel left that would terminate the loop:

[    8.200648] Unable to handle kernel paging request at virtual address fffdff7efbefaff5
[    8.209179] Mem abort info:
....
[    8.368456] Call trace:
[    8.370925]  __pi_strcmp+0x90/0xf0
[    8.374559]  sun50i_h616_r_pinctrl_probe+0x1c/0x28
[    8.379557]  platform_probe+0x68/0xd8

Do an actual worst case allocation (4 functions per pin, three common
functions and the sentinel) for the initial array allocation. This is
now heavily overestimating the number of functions in the common case,
but we will reallocate this array later with the actual number of
functions, so it's only temporarily.

Fixes: 561c1cf17c46 ("pinctrl: sunxi: Add support for the Allwinner H616-R pin controller")
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index dc8d39ae045b..9c7679c06dca 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -1219,10 +1219,12 @@ static int sunxi_pinctrl_build_state(struct platform_device *pdev)
 	}
 
 	/*
-	 * We suppose that we won't have any more functions than pins,
-	 * we'll reallocate that later anyway
+	 * Find an upper bound for the maximum number of functions: in
+	 * the worst case we have gpio_in, gpio_out, irq and up to four
+	 * special functions per pin, plus one entry for the sentinel.
+	 * We'll reallocate that later anyway.
 	 */
-	pctl->functions = kcalloc(pctl->ngroups,
+	pctl->functions = kcalloc(4 * pctl->ngroups + 4,
 				  sizeof(*pctl->functions),
 				  GFP_KERNEL);
 	if (!pctl->functions)
-- 
2.17.6

