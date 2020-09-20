Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FE012717DF
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Sep 2020 22:41:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbgITUl2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 20 Sep 2020 16:41:28 -0400
Received: from mail1.nippynetworks.com ([91.220.24.129]:57618 "EHLO
        mail1.nippynetworks.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbgITUl2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 20 Sep 2020 16:41:28 -0400
X-Greylist: delayed 473 seconds by postgrey-1.27 at vger.kernel.org; Sun, 20 Sep 2020 16:41:27 EDT
Received: from twocubed.nippynetworks.com (office.nippynetworks.com [46.17.61.232])
        by mail1.nippynetworks.com (Postfix) with SMTP id 4BvfSk0jqQzTh4h;
        Sun, 20 Sep 2020 21:34:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wildgooses.com;
        s=dkim; t=1600634087;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=LAyBX0qF8O0WpeVaree5ak7fYYnWsbIo7zFhzucfzRc=;
        b=JrnCs4YK7QEFEwbpThnS14DIBFk4CCBuRXUouashnjmoAyy9kVCYu4YahZYP/oBOaPgDkv
        mfymcVK/IP97gGteX4ydqRD1sHHeNiHh2hBfkB/C2bxWUqP7GuiBNCnXljd/XNcGGUVHWm
        G6bDGikeu2Mu16TcBIuD5Ze8RgB5DGA=
Received: by twocubed.nippynetworks.com (sSMTP sendmail emulation); Sun, 20 Sep 2020 21:34:42 +0100
From:   Ed Wildgoose <lists@wildgooses.com>
To:     linux-kernel@vger.kernel.org
Cc:     fe@dev.tdt.de, Ed Wildgoose <lists@wildgooses.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: [PATCH] gpio: gpio-amd-fch: Correct logic of GPIO_LINE_DIRECTION
Date:   Sun, 20 Sep 2020 21:34:30 +0100
Message-Id: <20200920203430.25829-1-lists@wildgooses.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The original commit appears to have the logic reversed in
amd_fch_gpio_get_direction. Also confirmed by observing the value of
"direction" in the sys tree.

Signed-off-by: Ed Wildgoose <lists@wildgooses.com>
---
 drivers/gpio/gpio-amd-fch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-amd-fch.c b/drivers/gpio/gpio-amd-fch.c
index 4e44ba4d7..2a21354ed 100644
--- a/drivers/gpio/gpio-amd-fch.c
+++ b/drivers/gpio/gpio-amd-fch.c
@@ -92,7 +92,7 @@ static int amd_fch_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
 	ret = (readl_relaxed(ptr) & AMD_FCH_GPIO_FLAG_DIRECTION);
 	spin_unlock_irqrestore(&priv->lock, flags);
 
-	return ret ? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
+	return ret ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
 }
 
 static void amd_fch_gpio_set(struct gpio_chip *gc,
-- 
2.26.2

