Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05C94ED68D
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 01:18:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728468AbfKDAS1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 3 Nov 2019 19:18:27 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:43395 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728459AbfKDAS0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 3 Nov 2019 19:18:26 -0500
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id CD48C891A9;
        Mon,  4 Nov 2019 13:18:22 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1572826702;
        bh=Ww5LQFHvbo1fwdgP1bkCVCNF1HEAuKW3lV2I1m2dQwE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=uLNjZDL9Q4LJ7STNSwyA9ewHBZvwq80xe3ly/mU2sXD2NLQlsWv85cDVNdk0Ezv9I
         YtQC/28PkfNB8iR06X067h0iVWhGvlYWmSh/BxbhJojfIwFuYUZQ4rGBydZa9PxLBf
         mju8AV8yKCavZhmTu2AlyHujzl4W6cCF5QQKrqy3SxXzzoB/YZYL/rD96z0o2P6qam
         Au58QP6hbvNr2+AcDZnqZYLiA0ZaIXlwxS97djAMr26qhyzr80PAgXfniKUy+DAnA+
         Jl0HVdWBQFG07eQXdZGQA1hpIg8kUAZph5oNLWpmw7NZT/CL+vEcy+Qtoe2Vam8fUa
         nOftw1uzS39nw==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5dbf6e4a0002>; Mon, 04 Nov 2019 13:18:21 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 6864B13EF97;
        Mon,  4 Nov 2019 13:18:18 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 927DD28005D; Mon,  4 Nov 2019 13:18:19 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     linus.walleij@linaro.org, rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v3 2/2] pinctrl: bcm: nsp: implement get_direction
Date:   Mon,  4 Nov 2019 13:18:19 +1300
Message-Id: <20191104001819.2300-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191104001819.2300-1-chris.packham@alliedtelesis.co.nz>
References: <20191104001819.2300-1-chris.packham@alliedtelesis.co.nz>
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
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
---

Notes:
    Changes in v3:
    - add revew from Florian
    Changes in v2:
    - New

 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c b/drivers/pinctrl/bcm=
/pinctrl-nsp-gpio.c
index 45ae29b22548..bed0124388c0 100644
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

