Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B602FEBBD2
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2019 02:56:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728250AbfKAB42 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 31 Oct 2019 21:56:28 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:41768 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727515AbfKAB42 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Oct 2019 21:56:28 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 1FF3F891A9;
        Fri,  1 Nov 2019 14:56:26 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1572573386;
        bh=9M1MGBTQ7mnEWOluZ5FLAkbw1oDfFqicXGB0I8+p50k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=27rQn54iHxSt0Td8lwLW5LxO/HUUmhKkLjLFCCQXcwMzi9ScY1yDp7FdgT8VfGAdh
         lW5JWr+hdQ54BzmnXtCICc+8TG3PBRRVZyaKLFUg5GMIzHSaAqMan5iMW4xFLU1BvZ
         arcIwgtSKvuJrGeoHJkiwJ1Iq4uS1dKtvah3yYioqiXpNOTIDRsNuLx+1doiy0fzz0
         CSPzzzZnfPDIQsVxBQ5f5Qvbkc0RU8tAR7jivYFwut/W9ah49tXoNvtWC+EtWuhn+Q
         EbGBUIINhEXuc2Zx1vMl2psqb7MSil6ZuszBnXq14jIj/lHhyvalPSqYTyBr4NS7KV
         sJkHWvWG5OlsA==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5dbb90ca0000>; Fri, 01 Nov 2019 14:56:26 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 89B7F13EED4;
        Fri,  1 Nov 2019 14:56:25 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id EAC1A28005D; Fri,  1 Nov 2019 14:56:25 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     linus.walleij@linaro.org, rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 2/2] pinctrl: bcm: nsp: implement get_direction
Date:   Fri,  1 Nov 2019 14:56:21 +1300
Message-Id: <20191101015621.12451-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191101015621.12451-1-chris.packham@alliedtelesis.co.nz>
References: <20191101015621.12451-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The get_direction api is strongly recommended to be implemented. In fact
if it is not implemented gpio-hogs will not get the correct direction.
Add an implementation of get_direction for the nsp-gpio driver.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v2:
    - New

 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c b/drivers/pinctrl/bcm=
/pinctrl-nsp-gpio.c
index cf77c6fe9f9c..a38b82bff87b 100644
--- a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
@@ -297,6 +297,19 @@ static int nsp_gpio_direction_output(struct gpio_chi=
p *gc, unsigned gpio,
 	return 0;
 }
=20
+static int nsp_gpio_get_direction(struct gpio_chip *gc, unsigned gpio)
+{
+	struct nsp_gpio *chip =3D gpiochip_get_data(gc);
+	unsigned long flags;
+	int val;
+
+	raw_spin_lock_irqsave(&chip->lock, flags);
+	val =3D nsp_get_bit(chip, REG, NSP_GPIO_OUT_EN, gpio);
+	raw_spin_unlock_irqrestore(&chip->lock, flags);
+
+	return !val;
+}
+
 static void nsp_gpio_set(struct gpio_chip *gc, unsigned gpio, int val)
 {
 	struct nsp_gpio *chip =3D gpiochip_get_data(gc);
@@ -641,6 +654,7 @@ static int nsp_gpio_probe(struct platform_device *pde=
v)
 	gc->free =3D gpiochip_generic_free;
 	gc->direction_input =3D nsp_gpio_direction_input;
 	gc->direction_output =3D nsp_gpio_direction_output;
+	gc->get_direction =3D nsp_gpio_get_direction;
 	gc->set =3D nsp_gpio_set;
 	gc->get =3D nsp_gpio_get;
=20
--=20
2.23.0

