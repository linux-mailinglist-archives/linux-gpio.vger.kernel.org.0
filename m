Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFF9854F5A1
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jun 2022 12:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380514AbiFQKix (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jun 2022 06:38:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380990AbiFQKiw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jun 2022 06:38:52 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EB4CD70
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jun 2022 03:38:51 -0700 (PDT)
Received: from localhost.localdomain ([37.4.249.155]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M277h-1o0DQX3f69-002XjF; Fri, 17 Jun 2022 12:38:33 +0200
From:   Stefan Wahren <stefan.wahren@i2se.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>
Cc:     linux-imx@nxp.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH] gpio: mxs: Fix header comment
Date:   Fri, 17 Jun 2022 12:38:09 +0200
Message-Id: <20220617103809.4162-1-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:rVPLdXCnkRWeIdd1AEecW8O4rwXjNmjNVs7BMQSrU2aqBx4JXOq
 Z9TfJPx7GF8LpSBRxVw1Nt5znFNiSRgIlgGOixjpQ/QZwpoSU74kOE5KNpK63EQgLv5LFNs
 joN3gaTIfub9GLlz2uvlh6dAsBseKBnKE8DDp0w8X6pyO0Shpt1SRvMLFaM7sG6HIDidMcF
 eD0hoSRuQbZagmNITYDwA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ePBrc2fYO1Q=:1bGkXPHV9nVEUUj5HnDPkO
 Jjpdwsuh+Jhf4EXRjinD+XkJ7zYiqDTKV8tnKnMkmlld4HinPy/XzfSzGzy9WWAMSuHdwmpQO
 Eer6uWCgj4uxop8pJVIZBywMEFR5ep8RIHuLkKhJ2Tb5bQsrr+OEFnx5+wzXER0hGIRuP4PNN
 pK3jhBnIDHemTmJ95JenadyjLn0hWMxxsrP2wEZbq9vj9G2f5X3DOPwHjxswCO8++1rTdx66e
 Smhm7yCjKvKx24BwPsBrD/LTbc7EhITozO+Jprk7bKcAXTVyHz4hPzDQDp9FMKhzNvXrW1Rod
 uwAM9jmXQxwVceurvYGU79ArYg58YbV7f6v5plEvipBKIprOdlwq1IEq6WZeu8/wa5+vEUz29
 n/gHKvfngcJNJrFeATadRJi/9vSInQdy+p1sicDcUFfbkW1mSaeHRyZ1xWmzmpIn8G5wJumHU
 1ASYUH/tG0Dx4HPLbsoSXG5sZ002yPe+IApALYCs80JjUhFmNFm/s4xgFAA46LyoxScF/Nwlq
 P6lUEFCmoGQMa/yvuOP69rQXAqAFWIhDxesYZv/QEuZCcPmIgwUDk3CCDPBeZL+ZdA4N7e/ld
 ireVY9LNHoXTuF7W7ZzQFq5PmDli59++dDqc60GwibR09NK7sWJM3ht4DLieNLvxNKSZzhvXV
 d8EQanvA0es3Am7nw184bEv8SnJAPl1it58yR5B9/6Gkh8fH42NNfnUhWXPW8VtawII076J9R
 j16y0AN1z+UYZt5rs01Zl8yYusGezuC3tVEnKGl01tNthTwwlkqXzKWlvpM=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This driver is about MXS GPIO support. MXC is a different platform.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/gpio/gpio-mxs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mxs.c b/drivers/gpio/gpio-mxs.c
index c5166cd47c9c..7f59e5d936c2 100644
--- a/drivers/gpio/gpio-mxs.c
+++ b/drivers/gpio/gpio-mxs.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 //
-// MXC GPIO support. (c) 2008 Daniel Mack <daniel@caiaq.de>
+// MXS GPIO support. (c) 2008 Daniel Mack <daniel@caiaq.de>
 // Copyright 2008 Juergen Beisert, kernel@pengutronix.de
 //
 // Based on code from Freescale,
-- 
2.25.1

