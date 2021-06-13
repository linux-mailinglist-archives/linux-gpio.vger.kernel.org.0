Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56E9E3A5846
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Jun 2021 14:22:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231794AbhFMMYg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Jun 2021 08:24:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231733AbhFMMYf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Jun 2021 08:24:35 -0400
X-Greylist: delayed 977 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 13 Jun 2021 05:22:34 PDT
Received: from mxout013.mail.hostpoint.ch (mxout013.mail.hostpoint.ch [IPv6:2a00:d70:0:e::313])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2BB2C061574
        for <linux-gpio@vger.kernel.org>; Sun, 13 Jun 2021 05:22:34 -0700 (PDT)
Received: from [10.0.2.44] (helo=asmtp014.mail.hostpoint.ch)
        by mxout013.mail.hostpoint.ch with esmtp (Exim 4.94.2 (FreeBSD))
        (envelope-from <code@reto-schneider.ch>)
        id 1lsOsZ-000NTd-TG; Sun, 13 Jun 2021 14:06:15 +0200
Received: from [2a02:168:6182:1:d747:8127:5b7a:4266] (helo=eleanor.home.reto-schneider.ch)
        by asmtp014.mail.hostpoint.ch with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2 (FreeBSD))
        (envelope-from <code@reto-schneider.ch>)
        id 1lsOsZ-000AA3-RV; Sun, 13 Jun 2021 14:06:15 +0200
X-Authenticated-Sender-Id: reto-schneider@reto-schneider.ch
From:   Reto Schneider <code@reto-schneider.ch>
To:     linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc:     Stefan Roese <sr@denx.de>,
        Reto Schneider <reto.schneider@husqvarnagroup.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1] gpio: mt7621: Assign base field in gpio_chip
Date:   Sun, 13 Jun 2021 14:06:08 +0200
Message-Id: <20210613120608.1527394-1-code@reto-schneider.ch>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Reto Schneider <reto.schneider@husqvarnagroup.com>

This is needed for gpiochip_sysfs_register() to properly export
/sys/class/gpio/gpiochip{0,32,64}.

Without this fix, the field base in gpio_device remains at its
initialization value, which is -1. This causes
gpiochip_add_data_with_key() to call gpiochip_find_base(), which in turn
dynamically determines the base to be at ARCH_NR_GPIOS - 32/64/96,
resulting in gpiochip{480,448,416}.

Detected/fixed/tested on a MediaTek MT7688 based GARDENA smart gateway.

Signed-off-by: Reto Schneider <reto.schneider@husqvarnagroup.com>

---

 drivers/gpio/gpio-mt7621.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index 82fb20dca53a..403d64cd65a6 100644
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -234,6 +234,7 @@ mediatek_gpio_bank_probe(struct device *dev,
 		return ret;
 	}
 
+	rg->chip.base = rg->bank * MTK_BANK_WIDTH;
 	rg->chip.of_gpio_n_cells = 2;
 	rg->chip.of_xlate = mediatek_gpio_xlate;
 	rg->chip.label = devm_kasprintf(dev, GFP_KERNEL, "%s-bank%d",
-- 
2.30.2

