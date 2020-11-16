Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D37B2B5403
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Nov 2020 22:59:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729811AbgKPV7P (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Nov 2020 16:59:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728531AbgKPV7P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Nov 2020 16:59:15 -0500
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D4BCC0613CF
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2020 13:59:15 -0800 (PST)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 39006806A8;
        Tue, 17 Nov 2020 10:59:06 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1605563946;
        bh=8KWdMd8qaxPKtziTolyHFsm/ErZmO9Vb61jZx+cWi2A=;
        h=From:To:Cc:Subject:Date;
        b=fcB1Zq6DCpncjQzJ6xeU3LC0ynE9o7QBjXRszneE13cVtdTf14nNPEZ5XzLtJ2gvN
         2agVxS7+B1/PmOPwVYlocH8nSSKR6slvJ8j6NGXOc03Itq6ICuLWOKGXWBgJtLTnD4
         MCq86dSw2zBZUd3SgLuF57IYMYCX+1WB1CS45hoLM6fE/rLkt1G6kVtZGv+jAQHuYv
         29vaSQpk6g5dHHWHJLiMwP3TVEeqTWDEDu4lLIayHuNHiPFrk4z5Bzt+AFfPvNFUt4
         1vHlcPTE8IiGrudW2lRnoMoD9Mo2FGY+70Cy5Ujnt9gubgsZ1aSWX5exvwALPC7Ecb
         2JMaRoJ1h8sjA==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5fb2f6290000>; Tue, 17 Nov 2020 10:59:05 +1300
Received: from markto-dl.ws.atlnz.lc (markto-dl.ws.atlnz.lc [10.33.23.25])
        by smtp (Postfix) with ESMTP id D448C13ED56;
        Tue, 17 Nov 2020 10:59:05 +1300 (NZDT)
Received: by markto-dl.ws.atlnz.lc (Postfix, from userid 1155)
        id 0B57D340FC5; Tue, 17 Nov 2020 10:59:06 +1300 (NZDT)
From:   Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
To:     rjui@broadcom.com, sbranden@broadcom.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
Subject: [PATCH] pinctrl: bcm: pinctrl-iproc-gpio: Fix setting GPIO as output
Date:   Tue, 17 Nov 2020 10:58:42 +1300
Message-Id: <20201116215842.29488-1-mark.tomlinson@alliedtelesis.co.nz>
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

Fixes: b64333ce769c ("pinctrl: cygnus: add gpio/pinconf driver")
Signed-off-by: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
---
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/b=
cm/pinctrl-iproc-gpio.c
index e2bd2dce6bb4..cadcf5eb0466 100644
--- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
@@ -348,8 +348,8 @@ static int iproc_gpio_direction_output(struct gpio_ch=
ip *gc, unsigned gpio,
 	unsigned long flags;
=20
 	raw_spin_lock_irqsave(&chip->lock, flags);
-	iproc_set_bit(chip, IPROC_GPIO_OUT_EN_OFFSET, gpio, true);
 	iproc_set_bit(chip, IPROC_GPIO_DATA_OUT_OFFSET, gpio, !!(val));
+	iproc_set_bit(chip, IPROC_GPIO_OUT_EN_OFFSET, gpio, true);
 	raw_spin_unlock_irqrestore(&chip->lock, flags);
=20
 	dev_dbg(chip->dev, "gpio:%u set output, value:%d\n", gpio, val);
--=20
2.29.2

