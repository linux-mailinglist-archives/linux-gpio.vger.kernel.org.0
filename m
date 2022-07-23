Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7403057F149
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Jul 2022 22:12:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231556AbiGWUMC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 23 Jul 2022 16:12:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231489AbiGWUMC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 23 Jul 2022 16:12:02 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12D1E14085
        for <linux-gpio@vger.kernel.org>; Sat, 23 Jul 2022 13:12:01 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 4906683FA2;
        Sat, 23 Jul 2022 22:11:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1658607118;
        bh=7hFzlBJb0SOun8mtA4Ob3g29VamykLnMy8YcUcC5VtM=;
        h=From:To:Cc:Subject:Date:From;
        b=Y0h92xhm5YMpojYBgoxIrJcxqxSWTWWGPpPwiml0JWWX7wiU2XfOyyDb/aU8c5+xy
         0wx/u1oPSxYvsicqdHtxTVJXgTLyCUOqmAAz4895P8CVtftnFxeZFb4dhvvy+nSxko
         gzISUQMO2Bw4hiqUHPZyttFlOh34rv4MQ9D9gqwWnwzDAYI/WsDBvuX4PFREkUpvDe
         lW8PQDdEBnP3rX9/YtKtcovzxOdcCCulTAXM5v5NI8YyUlStbtp0uQ3t/82qKdlR2K
         PHZ3PjAH1fhX7j1OVuPqiK3CSMxPjxCvOSqVdbmUCdn4KRRfzcMP4kgsHSvFxJ5GBe
         bahDNeY59F7Sg==
From:   Marek Vasut <marex@denx.de>
To:     linux-gpio@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Marc Zyngier <maz@kernel.org>
Subject: [PATCH] gpio: mxc: Always set GPIOs used as interrupt source to INPUT mode
Date:   Sat, 23 Jul 2022 22:11:41 +0200
Message-Id: <20220723201141.225812-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
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

Always configure GPIO pins which are used as interrupt source as INPUTs.
In case the default pin configuration is OUTPUT, or the prior stage does
configure the pins as OUTPUT, then Linux will not reconfigure the pin as
INPUT and no interrupts are received.

Always configure interrupt source GPIO pin as input to fix the above case.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Loic Poulain <loic.poulain@linaro.org>
Cc: Marc Zyngier <maz@kernel.org>
---
 drivers/gpio/gpio-mxc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index c871602fc5ba9..d4e8146e38d57 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -204,6 +204,8 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 
 	writel(1 << gpio_idx, port->base + GPIO_ISR);
 
+	writel(1 << gpio_idx, port->base + GPIO_GDIR);
+
 	return 0;
 }
 
-- 
2.35.1

