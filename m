Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D58234696AD
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Dec 2021 14:17:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244229AbhLFNV0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Dec 2021 08:21:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244226AbhLFNVZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Dec 2021 08:21:25 -0500
Received: from lb1-smtp-cloud8.xs4all.net (lb1-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::1b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 790DDC061359
        for <linux-gpio@vger.kernel.org>; Mon,  6 Dec 2021 05:17:56 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id uDrMmpEGIQyExuDrQm2JV9; Mon, 06 Dec 2021 14:16:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1638796612; bh=wDlxuOjkqosGn4T9TGH4LNfOHmXo2nv8CM7lQwvVcFs=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=B/5fp0F6Mx83yVfGBbeqxPJYwR1eI2cdFzmislaR1BVzfjhFIIGFfvuxcPRpy8G6j
         cPJ3ukngVU3ljkigWct9RBJQR+av5UVpqTQ38i259Z3wY7DUvLJaUVfCR37OVCEXoc
         EI/rfgRxm4U7PYHa9sdPRP8W03zNOb2+j8mWwcp3gMZhWKoV0T//feb8HKsji9h/5S
         Pkvzz26eOYucr55/X15nQUYjAVxeIk3uWpd/+k4R2IhghS6GtoyDgQlyRv1SzE+XJ/
         TcNcX1EP8OYDwu08KzFwZzA18wClnPLlwcG9xPYcA/d+SZ3RvQJfq+uErxm5+x2ytj
         KC0DkDq9JJkgg==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCH 3/3] pinctrl-sunxi: don't call pinctrl_gpio_direction()
Date:   Mon,  6 Dec 2021 14:16:48 +0100
Message-Id: <20211206131648.1521868-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211206131648.1521868-1-hverkuil-cisco@xs4all.nl>
References: <20211206131648.1521868-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfMwDLfFiqeI9ZBG8k00Zh1pVxeZYv9W9Z2t8TxADXtQeRpTcehdp6ErpGbZ0A8B3RfuoZqXgdXnGq3Xu9iwfzUNCBFydTXahIwMUoMO+eMxiabFHWDIO
 9uAukYZ/5TnMFt1gJkOJCx4T68xP72XQh076re8VRmzzHP7XI5ACOjdTsylu+McBnpbRcn66hBaoMBvAaI0b4Zaqhev+z9oWR6Vzusl60bRw2mheVX0Y0WK8
 gPgXbFmoD6YvZDLgBZmE1mjDJgDsDpGn+vq8TNSRQ8O7IKdlbxVSw7BGsoNbCivGnfUydVkwDe0TxYRzArRqqW8yBEgoaIbwyT5zfhjvBfe8OMO7Vej53Lz7
 Kcu4gPPVBPdm7sCsj8tBkD+IYQXy6A==
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Set the direction directly without calling pinctrl_gpio_direction().
This avoids the mutex_lock() calls in that function, which would
invalid the can_sleep = false.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 862c84efb718..80d6750c74a6 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -835,7 +835,9 @@ static const struct pinmux_ops sunxi_pmx_ops = {
 static int sunxi_pinctrl_gpio_direction_input(struct gpio_chip *chip,
 					unsigned offset)
 {
-	return pinctrl_gpio_direction_input(chip->base + offset);
+	struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);
+
+	return sunxi_pmx_gpio_set_direction(pctl->pctl_dev, NULL, offset, true);
 }
 
 static int sunxi_pinctrl_gpio_get(struct gpio_chip *chip, unsigned offset)
@@ -885,8 +887,10 @@ static void sunxi_pinctrl_gpio_set(struct gpio_chip *chip,
 static int sunxi_pinctrl_gpio_direction_output(struct gpio_chip *chip,
 					unsigned offset, int value)
 {
+	struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);
+
 	sunxi_pinctrl_gpio_set(chip, offset, value);
-	return pinctrl_gpio_direction_output(chip->base + offset);
+	return sunxi_pmx_gpio_set_direction(pctl->pctl_dev, NULL, offset, false);
 }
 
 static int sunxi_pinctrl_gpio_of_xlate(struct gpio_chip *gc,
-- 
2.33.0

