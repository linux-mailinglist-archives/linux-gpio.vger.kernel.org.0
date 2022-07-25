Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BCF257FD96
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Jul 2022 12:35:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233824AbiGYKfH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Jul 2022 06:35:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232971AbiGYKfF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Jul 2022 06:35:05 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D71E41835A
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jul 2022 03:35:03 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 3905883E13;
        Mon, 25 Jul 2022 12:35:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1658745301;
        bh=Ghvhy6t0g4uvYYQwtUc1L/ONI3jPCNBQWx8N/Ln+9Qg=;
        h=From:To:Cc:Subject:Date:From;
        b=WCquqeLo2UbIpjxU2nq8R5ki0gBov8HdWSNbPRUecHyQJ7MOXk+QZM/gX5dczYOlK
         JviAGj38rXWGjUBdIztnwEorxEJ3qt//UHIJDvSqPwruANKoHDm9xXrPduojGB4ZRX
         SO8yBfZ1fy+1CtHAibqkb41mqKVlKNGke+8uMU4sT+MYHED12GBHWDn5khXYtAxIED
         G6/5IhRbmEamg+j4FJskkVNtkDkBO+7QsS34khtOQ9Kae45mLXtRjzI9Ao526zAIs5
         ke9iJvCnO5TMUps0QwGHcXV6dDTU4u8LAih4R6KRfqFPGCms35OmN09QKfoDq6YNUX
         Ci+Ok3ckc7iWw==
From:   Marek Vasut <marex@denx.de>
To:     linux-gpio@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH v5 0/2] gpio: mxc: Locking and direction input fix
Date:   Mon, 25 Jul 2022 12:34:43 +0200
Message-Id: <20220725103445.88674-1-marex@denx.de>
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

The irqchip callbacks in gpio-mxc perform register read-modify-write operations
without locking, which may lead to a race condition. Add the missing locking.

In case the GPIO is used as IRQ, make sure it is configured as input.

Marek Vasut (2):
  gpio: mxc: Protect GPIO irqchip RMW with bgpio spinlock
  gpio: mxc: Always set GPIOs used as interrupt source to INPUT mode

 drivers/gpio/gpio-mxc.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Loic Poulain <loic.poulain@linaro.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>

-- 
2.35.1

