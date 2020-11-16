Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5364D2B552E
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Nov 2020 00:40:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730770AbgKPXiP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Nov 2020 18:38:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729977AbgKPXiO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Nov 2020 18:38:14 -0500
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43973C0613CF
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2020 15:38:14 -0800 (PST)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id BD383806A8;
        Tue, 17 Nov 2020 12:38:08 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1605569888;
        bh=PCTZxln1VKZDYtPBvimsiWg1lsnUSwv12kxkUAuwmrI=;
        h=From:To:Cc:Subject:Date;
        b=sJ+vgHjiIMKVl78mx6OaExKYrZRu0+9ffhe4d7d5hqJc98A0vHtZB1Pw5vqME7+9a
         f8X/bgg6QditR1aHGK+rFJeKxEmSkIkSTtnNOTnQaVd4jrB7UX5n3ESbFD2KYGN/i0
         d3CAp7KiD7YSXdWCWWmF8dw9MAQbdkDXQtJtPUOx5tfRutr6oPYLMtVW1qlxdUw/Kc
         ryj2J05oDRiWJU+Nwnl4czHP6NJY646xJzrih/LsgJsnAOnFoZ66Zn2cQ9fvadj5J8
         WG8AkzGdl8OAS162cSj8vVNxyCugJsS/8UQ12wvhrmVMXen0gfOll0OqBmlHPgudMj
         ecESL+D6tvj3A==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5fb30d5b0000>; Tue, 17 Nov 2020 12:38:07 +1300
Received: from markto-dl.ws.atlnz.lc (markto-dl.ws.atlnz.lc [10.33.23.25])
        by smtp (Postfix) with ESMTP id D572E13ED56;
        Tue, 17 Nov 2020 12:38:03 +1300 (NZDT)
Received: by markto-dl.ws.atlnz.lc (Postfix, from userid 1155)
        id 14032340FC9; Tue, 17 Nov 2020 12:38:04 +1300 (NZDT)
From:   Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
To:     rjui@broadcom.com, sbranden@broadcom.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
Subject: [PATCH] pinctrl: bcm: pinctrl-nsp-gpio: Fix setting GPIO as output
Date:   Tue, 17 Nov 2020 12:37:57 +1300
Message-Id: <20201116233757.15409-1-mark.tomlinson@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When setting a GPIO pin to an output, it is important to set the value
correctly before enabling the output so that a glitch is not seen on the
pin. This glitch may be very short, but can be important if this is a
reset signal.

Fixes: 8bfcbbbcabe0 ("pinctrl: nsp: add gpio-a driver support for Broadco=
m NSP SoC")
Signed-off-by: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
---
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c b/drivers/pinctrl/bcm=
/pinctrl-nsp-gpio.c
index a00a42a61a90..942f04ca4868 100644
--- a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
@@ -289,8 +289,8 @@ static int nsp_gpio_direction_output(struct gpio_chip=
 *gc, unsigned gpio,
 	unsigned long flags;
=20
 	raw_spin_lock_irqsave(&chip->lock, flags);
-	nsp_set_bit(chip, REG, NSP_GPIO_OUT_EN, gpio, true);
 	nsp_set_bit(chip, REG, NSP_GPIO_DATA_OUT, gpio, !!(val));
+	nsp_set_bit(chip, REG, NSP_GPIO_OUT_EN, gpio, true);
 	raw_spin_unlock_irqrestore(&chip->lock, flags);
=20
 	dev_dbg(chip->dev, "gpio:%u set output, value:%d\n", gpio, val);
--=20
2.29.2

