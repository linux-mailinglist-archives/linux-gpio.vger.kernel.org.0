Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A03E84696AC
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Dec 2021 14:17:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244222AbhLFNVZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Dec 2021 08:21:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244147AbhLFNVZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Dec 2021 08:21:25 -0500
X-Greylist: delayed 63 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 06 Dec 2021 05:17:56 PST
Received: from lb1-smtp-cloud8.xs4all.net (lb1-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::1b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65E24C061746
        for <linux-gpio@vger.kernel.org>; Mon,  6 Dec 2021 05:17:56 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id uDrMmpEGIQyExuDrQm2JUs; Mon, 06 Dec 2021 14:16:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1638796612; bh=oV6pUxmDfQZVnRFtoqv7bTj5cHVbNctl9dJmP0k3vyc=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=fPvie2pkQur+nDeSqNUl4aZAjt8ZJrtHRcyXwY0qI2S8dMdMdTMa5q+HyA0frJPMj
         qYTfLgtwcbhfRJRTF9aZ3QzQZOkYenOm6uFkRFtboAgTLAewPg6PBB6l6PwsfzS/6X
         XSpQgL4gd/SlwTS56cQUEqzp9Z3IINb3G+5SIzx+tSQiBwYjU2DlvL8zSBsiv99slP
         ifJaWOkaaGd2ZgHgdkI2wgg3+4zOdGF3zEWms2repFtAFSPYBc5CknQIoJf90vx55Y
         YWaTA9OhpBGc5ejy3aMT2Jp3NYUusXciTiBzgwJXObkiaa90QOCGzmkMVmPZkIbEuy
         96ra7b8w5mxpQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCH 2/3] pinctrl-bcm2835: don't call pinctrl_gpio_direction()
Date:   Mon,  6 Dec 2021 14:16:47 +0100
Message-Id: <20211206131648.1521868-3-hverkuil-cisco@xs4all.nl>
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
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index 2abcc6ce4eba..2f51fc3b24eb 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -313,7 +313,10 @@ static inline void bcm2835_pinctrl_fsel_set(
 
 static int bcm2835_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 {
-	return pinctrl_gpio_direction_input(chip->base + offset);
+	struct bcm2835_pinctrl *pc = gpiochip_get_data(chip);
+
+	bcm2835_pinctrl_fsel_set(pc, offset, BCM2835_FSEL_GPIO_IN);
+	return 0;
 }
 
 static int bcm2835_gpio_get(struct gpio_chip *chip, unsigned offset)
@@ -348,8 +351,11 @@ static void bcm2835_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 static int bcm2835_gpio_direction_output(struct gpio_chip *chip,
 		unsigned offset, int value)
 {
-	bcm2835_gpio_set(chip, offset, value);
-	return pinctrl_gpio_direction_output(chip->base + offset);
+	struct bcm2835_pinctrl *pc = gpiochip_get_data(chip);
+
+	bcm2835_gpio_set_bit(pc, value ? GPSET0 : GPCLR0, offset);
+	bcm2835_pinctrl_fsel_set(pc, offset, BCM2835_FSEL_GPIO_OUT);
+	return 0;
 }
 
 static const struct gpio_chip bcm2835_gpio_chip = {
-- 
2.33.0

