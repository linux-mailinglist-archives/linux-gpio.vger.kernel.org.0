Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB679115D73
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Dec 2019 17:20:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbfLGQUZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 7 Dec 2019 11:20:25 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:60588 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726414AbfLGQUY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 7 Dec 2019 11:20:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
        :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
        Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=cSv31xYM0bCVNruTSezrpDI781XDCgNT5GTDsN9nVoI=; b=kEiomYVia1aTzhEexPiGbCOs6z
        ddNox3h40dKuvL3qeVsiAegx7y5agi6iGYO//sw7ARZuVykEWIsPaxbzPOEu9sxNch31Q/BUdAUEo
        DRXp/suHwk8AjY306YifVdbkCWkpmPXcTERhFssIIQoJ8aftt+SNbxz8uo2e9ZKtFkyoegkxqDslw
        hOKy4aUc5uxKzoHQGmviwJGxa8dEJqCUS/9AyPJ7w8+PryWppzxY/Gzy+1PuNYGrwNfjAShO/WdvC
        CwKQ6dRayWkXLMpxoN/OqbFpv8Z1+2fJypaqS86Eg3adTuTwY2Ck4UvQ+TF8HE5YDsaTECvJ9yqc7
        GgJbXO2w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([2001:4d48:ad52:3201:222:68ff:fe15:37dd]:59786 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1idcoc-0007lk-NZ; Sat, 07 Dec 2019 16:20:18 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1idcoc-0004ni-4f; Sat, 07 Dec 2019 16:20:18 +0000
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org
Subject: [PATCH] gpiolib: fix up emulated open drain outputs
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1idcoc-0004ni-4f@rmk-PC.armlinux.org.uk>
Date:   Sat, 07 Dec 2019 16:20:18 +0000
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

gpiolib has a corner case with open drain outputs that are emulated.
When such outputs are outputting a logic 1, emulation will set the
hardware to input mode, which will cause gpiod_get_direction() to
report that it is in input mode. This is different from the behaviour
with a true open-drain output.

Unify the semantics here.

Suggested-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/gpio/gpiolib.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 32c2048deb8c..70c60aac41cc 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -220,6 +220,14 @@ int gpiod_get_direction(struct gpio_desc *desc)
 	chip = gpiod_to_chip(desc);
 	offset = gpio_chip_hwgpio(desc);
 
+	/*
+	 * Open drain emulation using input mode may incorrectly report
+	 * input here, fix that up.
+	 */
+	if (test_bit(FLAG_OPEN_DRAIN, &desc->flags) &&
+	    test_bit(FLAG_IS_OUT, &desc->flags))
+		return 0;
+
 	if (!chip->get_direction)
 		return -ENOTSUPP;
 
-- 
2.20.1

