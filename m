Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1998A5F1FA
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2019 06:21:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725795AbfGDEVy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Jul 2019 00:21:54 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:52345 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbfGDEVy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jul 2019 00:21:54 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id C5764886BF;
        Thu,  4 Jul 2019 16:21:49 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1562214109;
        bh=LZbI48iB2U9z3Rx/jxEmYADjQWAtTa0GOJizL3UwLkE=;
        h=From:To:Cc:Subject:Date;
        b=Ut8+V1V+8ZldssMdIIqBVLhEC1KJUzU3lowUOvPZzgZAE7V3mdlpKtHeZDaGvB8Yv
         +fbcmCee4qE9OabKD2PrCXbfZT3QNTRbU9xXRRJnO8wt6Dthsh2yqCbUDRgIYqRXtx
         C7EHuCsRtpwj+btwKqgWh9b1DqUBsVXo0dWzlz/A0HUwpLkZtfa/pNR8QUFEr9a0Pa
         vQV33diefCtZ+NBJmRA4iYt59/jxTx+ehu+lldeZlRMh3vZZSRW5F/tykCnlOes70/
         CuCAe5c6D8STPJCizxwHfdWQFpnXAtX2TN7kUcT2D4ZNschQkAEHrRUx0It8WeIBDw
         KP4i2nbicvKqw==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5d1d7edd0000>; Thu, 04 Jul 2019 16:21:49 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
        by smtp (Postfix) with ESMTP id 2A3A713EEA1;
        Thu,  4 Jul 2019 16:21:51 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 8D84F1E0BBE; Thu,  4 Jul 2019 16:21:49 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        ricardo.ribalda@gmail.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2] gpiolib: Preserve desc->flags when setting state
Date:   Thu,  4 Jul 2019 16:20:27 +1200
Message-Id: <20190704042027.18966-1-chris.packham@alliedtelesis.co.nz>
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

 drivers/gpio/gpiolib.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e013d417a936..5ac57264171b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1392,12 +1392,13 @@ int gpiochip_add_data_with_key(struct gpio_chip *=
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
+		} else {
+			if (!chip->direction_input)
+				set_bit(FLAG_IS_OUT, &desc->flags);
+		}
 	}
=20
 	acpi_gpiochip_add(chip);
--=20
2.22.0

