Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51FB949C85D
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jan 2022 12:13:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233536AbiAZLNJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jan 2022 06:13:09 -0500
Received: from ewsoutbound.kpnmail.nl ([195.121.94.183]:62258 "EHLO
        ewsoutbound.kpnmail.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233490AbiAZLNI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jan 2022 06:13:08 -0500
X-Greylist: delayed 662 seconds by postgrey-1.27 at vger.kernel.org; Wed, 26 Jan 2022 06:13:08 EST
X-KPN-MessageId: 668bfd3f-7e97-11ec-a7c6-005056992ed3
Received: from smtp.kpnmail.nl (unknown [10.31.155.7])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id 668bfd3f-7e97-11ec-a7c6-005056992ed3;
        Wed, 26 Jan 2022 12:02:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:to:subject:from:mime-version:date:message-id;
        bh=4x3cthZyPSyklwuCW6G09I7Tgeak4a48kh8iaIfkmag=;
        b=JVOe0eic/2Vydr+8GQYeCqHmsh/nILgAxgEg4LQcWhYrA33ECaMTaGSQkrBiYugVVRyLpadNNsNHD
         MbpILyNjUcaMwE5eAEtbVSqWVlzSVwOtPoNLmwzwOefxpE5n4YdEm+xDaQYQp/hHCAEzCCrhmAJ0oa
         9MIBdJzd8lHVGy3PWYbdGutt5N24jsQBQPnZLJqewsCnPUJhB4CNPj4veoXOy00o9JkoCVE9XK9aiP
         YSy2ne8RB8ND5ZyYluPA3+4+VLpgSI0HoJoEKJqNACiPkHmZKALcIGv1BWJqmaM+WwqSRIuRR1YaCI
         6WiJ5KgB8IBOtqqwkbprEWVGR2SRIsw==
X-KPN-VerifiedSender: No
X-CMASSUN: 33|WQ1Kr7QFYOHHRhCBRHmXWYu3tAWZhafWefmF1aAE9OJ8jVimcx1354jXk+WTSiX
 0FcHsVfZPZvHTbT9FYjVSiw==
X-Originating-IP: 80.101.105.217
Received: from [192.168.1.10] (marune.xs4all.nl [80.101.105.217])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id 65701bce-7e97-11ec-8459-005056998788;
        Wed, 26 Jan 2022 12:02:05 +0100 (CET)
Message-ID: <0f536cd8-01db-5d16-2cec-ec6d19409a49@xs4all.nl>
Date:   Wed, 26 Jan 2022 12:02:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH for 5.17] pinctrl-sunxi:
 sunxi_pinctrl_gpio_direction_in/output: use correct offset
To:     linux-media@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Florian Fainelli <f.fainelli@gmail.com>, 5kft <5kft@5kft.org>,
        Corentin Labbe <clabbe.montjoie@gmail.com>
References: <20211206131648.1521868-1-hverkuil-cisco@xs4all.nl>
Content-Language: en-US
In-Reply-To: <20211206131648.1521868-1-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The commit that sets the direction directly without calling
pinctrl_gpio_direction(), forgot to add chip->base to the offset when
calling sunxi_pmx_gpio_set_direction().

This caused failures for various Allwinner boards which have two
GPIO blocks.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reported-by: 5kft <5kft@5kft.org>
Suggested-by: 5kft <5kft@5kft.org>
Reported-by: Corentin Labbe <clabbe.montjoie@gmail.com>
Fixes: 8df89a7cbc63 (pinctrl-sunxi: don't call pinctrl_gpio_direction())
---
Corentin, can you please test this patch to verify that this fixes your
issue on the orangepiPC?
---
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 80d6750c74a6..061323eab8b1 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -837,7 +837,8 @@ static int sunxi_pinctrl_gpio_direction_input(struct gpio_chip *chip,
 {
 	struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);

-	return sunxi_pmx_gpio_set_direction(pctl->pctl_dev, NULL, offset, true);
+	return sunxi_pmx_gpio_set_direction(pctl->pctl_dev, NULL,
+					    chip->base + offset, true);
 }

 static int sunxi_pinctrl_gpio_get(struct gpio_chip *chip, unsigned offset)
@@ -890,7 +891,8 @@ static int sunxi_pinctrl_gpio_direction_output(struct gpio_chip *chip,
 	struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);

 	sunxi_pinctrl_gpio_set(chip, offset, value);
-	return sunxi_pmx_gpio_set_direction(pctl->pctl_dev, NULL, offset, false);
+	return sunxi_pmx_gpio_set_direction(pctl->pctl_dev, NULL,
+					    chip->base + offset, false);
 }

 static int sunxi_pinctrl_gpio_of_xlate(struct gpio_chip *gc,
