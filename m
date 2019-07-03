Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0DC55EF51
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2019 00:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727466AbfGCW6I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Jul 2019 18:58:08 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:51319 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727465AbfGCW6H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jul 2019 18:58:07 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id C3B778365A;
        Thu,  4 Jul 2019 10:57:59 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1562194679;
        bh=zkMdtZW4vQA978drfavpg1IOdIEDu9n4dQ1oCPCuWEE=;
        h=From:To:Cc:Subject:Date;
        b=IrxbBjvLiCMyptdWyERLYKH7WQ5PEqN5weLHCHYAY1oUkWs/3wAawAu5eJFgJWh+4
         /vAkuQifONTT4m+KAcuAEyXeaSczivXF0z1N7luY048rhBq+spqvsu6QkSH0T1rjJi
         4CdXzA85tFQx9xm6Ct4VFR0AMSGshud9F2vCHME3uLwHKvfvlw8SYPNhM6I3qCS7w4
         QYoc8lvCI14OfZ3CVRyxe3p+ULhyrltzPvrOgOowYa+sT18ZaqQ5FhT0G7gPM9kg9k
         9Rz8Ci9uooGdRiIZdrlLhuk+KIoSDH8eba2HI/v4WS5PNeZ4qmI92QkuCyCNRnJbTm
         mEoEroSqE5Krg==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5d1d32f80000>; Thu, 04 Jul 2019 10:58:00 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
        by smtp (Postfix) with ESMTP id 266C913EEA1;
        Thu,  4 Jul 2019 10:58:01 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 81D301E0BBE; Thu,  4 Jul 2019 10:57:59 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        ricardo.ribalda@gmail.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH] gpiolib: Preserve desc->flags when setting state
Date:   Thu,  4 Jul 2019 10:57:56 +1200
Message-Id: <20190703225756.8058-1-chris.packham@alliedtelesis.co.nz>
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
 drivers/gpio/gpiolib.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e013d417a936..cc651e3dea54 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1393,11 +1393,11 @@ int gpiochip_add_data_with_key(struct gpio_chip *=
chip, void *data,
 		struct gpio_desc *desc =3D &gdev->descs[i];
=20
 		if (chip->get_direction && gpiochip_line_is_valid(chip, i))
-			desc->flags =3D !chip->get_direction(chip, i) ?
-					(1 << FLAG_IS_OUT) : 0;
+			if (!chip->get_direction(chip, i))
+				set_bit(FLAG_IS_OUT, &desc->flags);
 		else
-			desc->flags =3D !chip->direction_input ?
-					(1 << FLAG_IS_OUT) : 0;
+			if (!chip->direction_input)
+				set_bit(FLAG_IS_OUT, &desc->flags);
 	}
=20
 	acpi_gpiochip_add(chip);
--=20
2.22.0

