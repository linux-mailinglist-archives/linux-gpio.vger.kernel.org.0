Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41DA434E32E
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Mar 2021 10:33:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231508AbhC3IdE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Mar 2021 04:33:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231511AbhC3Ic6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Mar 2021 04:32:58 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96B41C061762;
        Tue, 30 Mar 2021 01:32:57 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id v4so15325034wrp.13;
        Tue, 30 Mar 2021 01:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ab+TCkydtH+tYtbFjC0Gk4G/1CHDXmMcZaDxCNSx3+M=;
        b=SafZ5eEsbY70iFtlqxXZa58vTR/+NvL+Nf9K9PxnVfgInKDPCkZR36BEiNID/OZP9W
         sc7HCBwcJLjC1tamX+2zYoJx2f0Qdj60uAEq/sklW8Uiva9V8v1pThtwfbaIPxpe9DLy
         bL61RW7COC+NvHDHkPgCRc4xCgyuqqbWKNSjVemW/gdpMxz2Lnhy6JLZiJxQm9m38WOA
         O5q77dnzdUhtPFv0R4cuJkNhGZA66FixxFt27jQdEDhCJVv/Ib9ILAO/BjGYlkUhi4Nq
         dpWNNdNg7R42W7fzron2ShDd30XTHfoW/eHt+gMR1mSJoo13XkEqsou0ngU7CNwcYgiB
         inLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ab+TCkydtH+tYtbFjC0Gk4G/1CHDXmMcZaDxCNSx3+M=;
        b=L555E+BIN42oEgXfzCj7zouCZlVs/BWSrrD0j5dx6kg977+sn/jqbZ76+wKkcpQPOi
         K6x3VHsvFO+CDJtG3k7Ih7kIL261e4fitygGu/VkRHmmmaqFdGUEb2doLiGvxRjr6WAu
         VTsb9Zt1fl6BwT6EAAb6qcCa6CsFUr/KQu5XDePEGsnf5C4lceVySLwk9QsFKjEQ+JBP
         a/OlKh9u6tS2DOtYNbkd0+gZOpv9rQVS6BBBScv4pBJS7CEsWOFJkdeEch2mLiUhoGmF
         tIrIgeZbh7CR5Bxdm+0aflCK/Q7Lxbgx9XK51EduoGPqVb06ucc9R44ah4x6CNqfSYG+
         ESqg==
X-Gm-Message-State: AOAM532mHgsA/dmWbv9TfwmewQaNFiS5A1BTAfCgRyShMKjiMsDcrP1h
        lXP1fLiP/Rcs+RHF1HycqFs=
X-Google-Smtp-Source: ABdhPJzx0Gr4USoUjxnh3dPlspVL89OYegdD5GoHzw2ugBjU9R+v4x+ApjGgfzeTUAp1HAKQhQYWOw==
X-Received: by 2002:a5d:6152:: with SMTP id y18mr32874295wrt.255.1617093176335;
        Tue, 30 Mar 2021 01:32:56 -0700 (PDT)
Received: from skynet.lan (176.red-79-148-190.dynamicip.rima-tde.net. [79.148.190.176])
        by smtp.gmail.com with ESMTPSA id t14sm34013690wru.64.2021.03.30.01.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 01:32:55 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     sfr@canb.auug.org.au, Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: bcm: bcm6362: fix warning
Date:   Tue, 30 Mar 2021 10:32:54 +0200
Message-Id: <20210330083254.15817-1-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The current implementation of bcm6362_set_gpio() produces the following
warning on x86_64:
drivers/pinctrl/bcm/pinctrl-bcm6362.c: In function 'bcm6362_set_gpio':
drivers/pinctrl/bcm/pinctrl-bcm6362.c:503:8: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  503 |        (uint32_t) desc->drv_data, 0);
      |        ^

Modify the code to make it similar to bcm63268_set_gpio() in order to fix the
warning.

Fixes: 705791e23ecd ("pinctrl: add a pincontrol driver for BCM6362")
Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 drivers/pinctrl/bcm/pinctrl-bcm6362.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm6362.c b/drivers/pinctrl/bcm/pinctrl-bcm6362.c
index eb7ec80353e9..6b5a1dfc2367 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm6362.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm6362.c
@@ -496,11 +496,12 @@ static int bcm6362_pinctrl_get_groups(struct pinctrl_dev *pctldev,
 static void bcm6362_set_gpio(struct bcm63xx_pinctrl *pc, unsigned pin)
 {
 	const struct pinctrl_pin_desc *desc = &bcm6362_pins[pin];
+	unsigned int basemode = (unsigned long) desc->drv_data;
 	unsigned int mask = bcm63xx_bank_pin(pin);
 
-	if (desc->drv_data)
-		regmap_update_bits(pc->regs, BCM6362_BASEMODE_REG,
-				   (uint32_t) desc->drv_data, 0);
+	if (basemode)
+		regmap_update_bits(pc->regs, BCM6362_BASEMODE_REG, basemode,
+				   0);
 
 	if (pin < BCM63XX_BANK_GPIOS) {
 		/* base mode 0 => gpio 1 => mux function */
-- 
2.20.1

