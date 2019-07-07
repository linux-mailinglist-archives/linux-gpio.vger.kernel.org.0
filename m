Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F50861772
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Jul 2019 22:36:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727429AbfGGUgH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 7 Jul 2019 16:36:07 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:55976 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727456AbfGGUgH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 7 Jul 2019 16:36:07 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 268038364E;
        Mon,  8 Jul 2019 08:36:05 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1562531765;
        bh=ip95pvT/MENdDX9ljvlE3O/xZmTn56E0COWj53gsn+U=;
        h=From:To:Cc:Subject:Date;
        b=vVAhNuVCRdWDOZTWZcT6OCfk4jWNCpkS4GAx1eXBhZkLwWCX5dleIRbQCxoZa2hC1
         9aapr1ARjFDsDXa3FPJHowJ0eOpaYqECy9VX7NkUPurjR4IUYoTYb05iu72WYzdCyP
         vtHlhE7vrvZCLH7gfsgqtW8s4BJXFNu3grq20PeUO9gEWY1gmmzxqw1ECToo5ZxDD+
         VcJAe0aeBBqIb+kMZGkJUuYnJkxxaG/mPRwzBxr9Usp2cvaTQFKuiRBqVLBMNRSNv9
         4B5OQuQb8Om3VAtXg84b7eso1simIQX0AJ7d1FO5LK1ZmHDzFb+dhdjxoZUrbTDkW3
         zUXUYtets/FRg==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5d2257af0000>; Mon, 08 Jul 2019 08:36:03 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
        by smtp (Postfix) with ESMTP id 5370813EECF;
        Mon,  8 Jul 2019 08:36:02 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 9932C1E0BBE; Mon,  8 Jul 2019 08:36:00 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        ricardo.ribalda@gmail.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v3] gpiolib: Preserve desc->flags when setting state
Date:   Mon,  8 Jul 2019 08:35:58 +1200
Message-Id: <20190707203558.10993-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

desc->flags may already have values set by of_gpiochip_add() so make
sure that this isn't undone when setting the initial direction.

Fixes: 3edfb7bd76bd1cba ("gpiolib: Show correct direction from the beginn=
ing")
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v2:
    - add braces to avoid ambiguious else warning
    Changes in v3:
    - clear the direction output in the negative case

 drivers/gpio/gpiolib.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e013d417a936..dbd1180316a0 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1392,12 +1392,17 @@ int gpiochip_add_data_with_key(struct gpio_chip *=
chip, void *data,
 	for (i =3D 0; i < chip->ngpio; i++) {
 		struct gpio_desc *desc =3D &gdev->descs[i];
=20
-		if (chip->get_direction && gpiochip_line_is_valid(chip, i))
-			desc->flags =3D !chip->get_direction(chip, i) ?
-					(1 << FLAG_IS_OUT) : 0;
-		else
-			desc->flags =3D !chip->direction_input ?
-					(1 << FLAG_IS_OUT) : 0;
+		if (chip->get_direction && gpiochip_line_is_valid(chip, i)) {
+			if (!chip->get_direction(chip, i))
+				set_bit(FLAG_IS_OUT, &desc->flags);
+			else
+				clear_bit(FLAG_IS_OUT, &desc->flags);
+		} else {
+			if (!chip->direction_input)
+				set_bit(FLAG_IS_OUT, &desc->flags);
+			else
+				clear_bit(FLAG_IS_OUT, &desc->flags);
+		}
 	}
=20
 	acpi_gpiochip_add(chip);
--=20
2.22.0

