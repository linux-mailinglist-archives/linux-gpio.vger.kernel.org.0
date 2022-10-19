Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74ACA604792
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Oct 2022 15:41:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231907AbiJSNlt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Oct 2022 09:41:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232896AbiJSNl1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Oct 2022 09:41:27 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EA25111BB4
        for <linux-gpio@vger.kernel.org>; Wed, 19 Oct 2022 06:28:56 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2804:14c:485:4b69:1071:7301:f2d2:b2c6])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: festevam@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 8EEE284E89;
        Wed, 19 Oct 2022 15:23:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1666185799;
        bh=YT3AaXyENUeucY7cLenOgZtzsgSDpwPvvHc9jjw5DRQ=;
        h=From:To:Cc:Subject:Date:From;
        b=eg3UNwmzyAVXyZYtYkbTN5fRL4VADVLpkzBYu6fOCeHPF15XbFOMM6k0cQAsHCAzc
         /y0fokw/lRFZYHqWY04rQ0A0qC9oXMX0lscQqSvoaJ5au3l7e/kRwBcTsub+iTqZZh
         BBKsDNrIdtKGOlKdjYPAcDrfi06ev9fHNU+fSuGed1qTgZJ0Hg4mCSicDnMfzrbLm/
         j+eMmIKRLs+Av+mZDV1glaHZMuoZpfarxnq48JDX8Hv4p0NAv+F78QlbCcp3VwTv7Q
         GLpZxfh9xk3vof8gC/ydTMiSr0sje5qVYLWx8em2fHwCti+x0iqM72Rrh5pykWl5lX
         AyXeUW/OZoTYg==
From:   Fabio Estevam <festevam@denx.de>
To:     linus.walleij@linaro.org
Cc:     ping.bai@nxp.com, linux-gpio@vger.kernel.org,
        naresh.kamboju@linaro.org, andriy.shevchenko@linux.intel.com,
        Fabio Estevam <festevam@denx.de>,
        Linux Kernel Functional Testing <lkft@linaro.org>
Subject: [PATCH] pinctrl: imx1: Include the <linux/seq_file.h> header
Date:   Wed, 19 Oct 2022 10:23:06 -0300
Message-Id: <20221019132306.65244-1-festevam@denx.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

After some recent header cleanup in the pinctrl subsystem, the following
build error is seen:

drivers/pinctrl/freescale/pinctrl-imx1-core.c: In function 'imx1_pin_dbg_show':
drivers/pinctrl/freescale/pinctrl-imx1-core.c:209:2: error: implicit
declaration of function 'seq_printf'; did you mean 'scnprintf'?
[-Werror=implicit-function-declaration]

Explicitly add the <linux/seq_file.h> header to fix it.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/pinctrl/freescale/pinctrl-imx1-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
index 70186448d2f4..1fac1a761d25 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
@@ -20,6 +20,7 @@
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
+#include <linux/seq_file.h>
 #include <linux/slab.h>
 
 #include "../core.h"
-- 
2.25.1

