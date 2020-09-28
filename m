Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E01C27AB0F
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 11:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726601AbgI1Jpa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Sep 2020 05:45:30 -0400
Received: from mail1.nippynetworks.com ([91.220.24.129]:57722 "EHLO
        mail1.nippynetworks.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726465AbgI1Jpa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Sep 2020 05:45:30 -0400
Received: from twocubed.nippynetworks.com (office.nippynetworks.com [46.17.61.232])
        by mail1.nippynetworks.com (Postfix) with SMTP id 4C0Hgp2WZjzTgQY;
        Mon, 28 Sep 2020 10:45:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wildgooses.com;
        s=dkim; t=1601286327;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=McOrVPeJ4f/uCV58GsELC0gGRotV+PIxn5H9snSEBGU=;
        b=RU8+Ksrd4FO8zypm2cxER+IsYo7fzwBxr7Vn8EyZxBlUgOnnTI+b9xxr/prtNqRFA9zPOp
        0bh3mQkQg1TFZitD/j/hlaDtUl3LtX7iD6po2sf0WealTftvQx4+Bj+rmG0JAQuPqfcAzv
        VzaRAzQ/Zg751gTUgavgjLHlm4eFvPM=
Received: by twocubed.nippynetworks.com (sSMTP sendmail emulation); Mon, 28 Sep 2020 10:45:24 +0100
From:   Ed Wildgoose <lists@wildgooses.com>
To:     bgolaszewski@baylibre.com
Cc:     fe@dev.tdt.de, Ed Wildgoose <lists@wildgooses.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: gpio-amd-fch: Correct logic of GPIO_LINE_DIRECTION
Date:   Mon, 28 Sep 2020 10:44:52 +0100
Message-Id: <20200928094452.7005-1-lists@wildgooses.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <CAMpxmJV0jwLAn3Xee_3zDiF_DQF-8uy52qxU1WAbr9xiVb0WLQ@mail.gmail.com>
References: <CAMpxmJV0jwLAn3Xee_3zDiF_DQF-8uy52qxU1WAbr9xiVb0WLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The original commit appears to have the logic reversed in
amd_fch_gpio_get_direction. Also confirmed by observing the value of
"direction" in the sys tree.

Signed-off-by: Ed Wildgoose <lists@wildgooses.com>
Fixes: e09d168f13f0 ("gpio: AMD G-Series PCH gpio driver")
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

