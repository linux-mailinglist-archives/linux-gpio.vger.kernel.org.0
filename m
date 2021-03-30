Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A81434E580
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Mar 2021 12:33:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231621AbhC3Kco (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Mar 2021 06:32:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231220AbhC3Kc2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Mar 2021 06:32:28 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3883AC061574;
        Tue, 30 Mar 2021 03:32:28 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id k128so8085904wmk.4;
        Tue, 30 Mar 2021 03:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wG9Tv+sZw7JZg3oKUGs5WBTRAb2kiz3YDEa15xfTHkk=;
        b=Pt5O6GDhNFbK+rZn/grFaQ8WMAUSNHtVSCBlKvaCuEDypGHmbAToButWLY3qpYthHQ
         kAPP6Z1bSrJfGmErn8qI9MZ707QAPwMVpPWfQKhqVdccIKV7XWlalgfREaquqLjSeQCc
         5ubIj39UTHuVtFSY96am/wyHqSrTkcISjlRonSwzAI7lPN7M9I5UGjjfOw+HlPB+pjbC
         4Bb/guoAdc/SuyXHkj5DGUOUcriZDptGWllg4cGYdn3Wl9cmFODYJmD1FAApLRxtr/5n
         xKd3sg/tC/SAs4J5MXi0lppFo8lJb7Sl0ecuw7xCB0trHjbfstZjycP78ZsJPYNSOVfy
         hbSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wG9Tv+sZw7JZg3oKUGs5WBTRAb2kiz3YDEa15xfTHkk=;
        b=R1Tu1y4bSRPGnBxW5miSAwSLeucogGMb9M+vTbZ2fLzNrWldKyNjXYRnPPfMTWdAno
         MNrtsnAhcD9NuNk8liM6z2cSuByjdN1nUBk+skxWT5Vyhl3d4jGekCRL6D9nKTo7BY7M
         VGHlDsdY1JWhQYBqNkXJbYDMQFAsvILDdDk+Ad6SDyfLJyfKHNZqYP99ch0VtwSBVwrP
         P7lGdqiIVCkX5ZBJPCSY5MzDOJlzMSlQCdJLTRpPMo11pWT5fvSleR8MOcc8wWaFRqIh
         mxL1M77kMazSbGQGbHs3kkNfy78JNg8Lv8kn7pOgA5Jw3iD4R94wDCWwBWvw/ibd6dDH
         vwyQ==
X-Gm-Message-State: AOAM532Xl2qDMN60QOc/fTlrq0/RhY0OAVZzBTuaOTPzVDnUX5p06l1n
        PoPYB/rZwbACDTDOo8RtzQybbs41SJghjw==
X-Google-Smtp-Source: ABdhPJyTY1ofh5OgSo5ShcDZFAeYAOCv6BMMWj/kycT0+wF9yLBL9jfJ1GppUZE6Uizsbr4xW36R8g==
X-Received: by 2002:a7b:cf2f:: with SMTP id m15mr3293421wmg.177.1617100346933;
        Tue, 30 Mar 2021 03:32:26 -0700 (PDT)
Received: from skynet.lan (176.red-79-148-190.dynamicip.rima-tde.net. [79.148.190.176])
        by smtp.gmail.com with ESMTPSA id o2sm2853818wme.19.2021.03.30.03.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 03:32:26 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     sfr@canb.auug.org.au, Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] pinctrl: bcm: bcm6362: fix warning
Date:   Tue, 30 Mar 2021 12:32:25 +0200
Message-Id: <20210330103225.3949-1-noltari@gmail.com>
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

Modify the code to make it similar to bcm63268_set_gpio() in order to fix
the warning.

Fixes: 705791e23ecd ("pinctrl: add a pincontrol driver for BCM6362")
Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 drivers/pinctrl/bcm/pinctrl-bcm6362.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm6362.c b/drivers/pinctrl/bcm/pinctrl-bcm6362.c
index eb7ec80353e9..40ef495b6301 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm6362.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm6362.c
@@ -496,11 +496,11 @@ static int bcm6362_pinctrl_get_groups(struct pinctrl_dev *pctldev,
 static void bcm6362_set_gpio(struct bcm63xx_pinctrl *pc, unsigned pin)
 {
 	const struct pinctrl_pin_desc *desc = &bcm6362_pins[pin];
+	unsigned int basemode = (uintptr_t)desc->drv_data;
 	unsigned int mask = bcm63xx_bank_pin(pin);
 
-	if (desc->drv_data)
-		regmap_update_bits(pc->regs, BCM6362_BASEMODE_REG,
-				   (uint32_t) desc->drv_data, 0);
+	if (basemode)
+		regmap_update_bits(pc->regs, BCM6362_BASEMODE_REG, basemode, 0);
 
 	if (pin < BCM63XX_BANK_GPIOS) {
 		/* base mode 0 => gpio 1 => mux function */
-- 
2.20.1

