Return-Path: <linux-gpio+bounces-21575-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8899EAD9C5D
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Jun 2025 13:12:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7EAB3BA570
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Jun 2025 11:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2D2A24676E;
	Sat, 14 Jun 2025 11:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="X3IwR654"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7742AE96
	for <linux-gpio@vger.kernel.org>; Sat, 14 Jun 2025 11:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749899544; cv=none; b=jTLZbGu1dxLqApQjG+59dpC/sHWZdKf420AVcsGgdcrT4TPF4RnV5fddkiXfBQ8zQAcMz+db+oXJ5dEDXunhFtIy9o8dSQj2MM9Z4hqmYs91p3ly5RTDwnxQClWIlFrniYbZh8H6wpF1ZqnD8nXhzR3EZlB9p1a7HRkUF8KvzVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749899544; c=relaxed/simple;
	bh=7g34gRKmKF6Radhp8EdcC+pcyTeTp8tTJuFMxntJ3bQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fti1ML/JYEejPIkA+Kad+0IiiKqP3QPjbIIJ9H7GUSarYYHOmkUE9iyKtDAok6e0GLRL9zCgMzWlqW34fwTUqG9Uq1UwHMcavT+ttRnzzN+5NIJhGusO17b510KzHeJSfAHDvNKnVAcI65HY2gXqpk14gENil3fgY/+bxBy83rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=X3IwR654; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1749899540; x=1750504340; i=wahrenst@gmx.net;
	bh=0oxGuemdIuK3NUwV1UDNAEN0iAI8g66lvnNqCN2Kthg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=X3IwR654iHbRoBjNQbtXFouz1XJeWSsEU43WT1cWwYSkNL4R5+RcTqtP2LDQGxb+
	 wclWEQRd2H/Ze6OxJjzHK9ItENxlUm9LXAYC41DtshDB74xxLIpTUP0nHdYQB9Kbk
	 0ErGo+qG6KrFys6EgvM9H5Ol++ETSeyphtGLcutoVkZOEPXNnMI7x8kjOZxEMCP3m
	 CDOMZSMvdk4r4hwrwDnYT83KwUq8dwgR/ckBnJfM9YVdv8kM5meeYPlKisCQvs2u8
	 xwBBwLgS3dBBEDE35jjhalbYDWMahNx/HBTYsLhp8cTVe0NKhYlfxrg5oUIUK/G6o
	 6E7YuVaVQD9hJT7xDg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([91.41.216.208]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MkYXm-1v5oi20H5q-00bxUu; Sat, 14
 Jun 2025 13:12:20 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	kernel-list@raspberrypi.com,
	linux-gpio@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH] gpio: raspberrypi-exp: use new GPIO line value setter callbacks
Date: Sat, 14 Jun 2025 13:12:16 +0200
Message-Id: <20250614111216.93677-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QcOoQ1ODeG9NQSpJQCOzzkRLXKhf29hZqygjiXcyQKUpg+s7CHU
 /6fL7iNxK+FfTYrxtX5dFNyBSiC9sXoBsJMRk7MxSHvVUVgormSsCmIU5RG2XOhZJlYM8Zr
 Zp2m4D71snikiNcXmiGaMY6NBBO68ISgYuPaxpBR4g6on6+zQPw5tL4WAyO7zomObQCuJb4
 JsnDaZ/qc6VdRRWrlXgaQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:70Up9Xrztbo=;38hKEtspog7angch4NpSH4yk28I
 k8EJUviLKVNMfSFmZVBB3PS+UfHsfBCibC3ZcC+HmxlnmPPf6VPZEdzoQW2GuNbsmC4zb25ma
 c5c4np0vuFeWkDjHvoD3qmV8PxpfsYzdsRJaRjT2LQD/CGB3HEKRj57wlumqXN+I8qKWwksHh
 69o4NLdeflQ/u8mjomw5L0koaz2UkLDS0WIfnlYNV28dHOSKOaZmbA7eH9jMhg0UDjI4FQch8
 kNazERuc0JMWd6SDxlRkpHQ2D4QbAwyT/YEJ2udKPAhMjHdbCjM0AQDtfCYqDeDOhsTr9/3In
 YNyUDVNIPigkrE2CYmfhB+ez2GAX1VWGKG93xpFAppN8z4v24/c9O9xxEwrSU68/iAjo035gw
 +PKcqONztA0JVpGOq/KoV4eakpXFdtV1Hd+/S9+bMa7tH6Hocc32gQww5YlJw+YOiELALzNIG
 KrFa59Rih2Edm+xKgUMEPo+M2cvfBWxN/8lP+Oo8kVYEiLr5Kpy6A9McT4l/bU2nRZTeGzubP
 0Ur/t/hk5/+UuV8dPwW8NVhdVGoD9Wm1qKQXfd4LrWZSQrFjU98ZYxC2bTeIW3nyrFIADP3bE
 KogGCP0yEK6zJycwhFjWM1rpGe9GZT4PGc9N1cZ+vJZ7WlIeR2WjjlGLteAugY2tKX+dYSYKB
 ji2Cq7609ME/XsmAza7VWKnHdiGtKaFTq2uC9aK4ckNec22peelkFaAJj4zwM5ijHzeBdUU8a
 dumr5tdxbF6jckbP0cpcDi89utrggn4KjA1OZ0S8VzPEI2QpEl+sAbrwXjeMtQvQKsKAc1Q5d
 undCM5UhdTt/JD2s5K52LDusoBpIubvgKh5nRgMX6RWUfOeZrwmYa3zbM0O8qKfnALqGDmIrL
 W1G8JvYseZq0xpifTfHFP0LlJO11RF8UxJCqsjgc7O4cHWB5u7aLmaMSj4f/vXIJrN/Zvl/p9
 QhQXlD5A6GxQL8/v8wHbeS0V/i1+zEIRYWDtQ2hEM81kRZBqj0qjv8oiJK38Ut607b0mb290z
 V2Ug4qqxRe61NrWPWOYlBhnnM4ymI0y3Iwm3moShsbwcDzCT4lXNSrKqCWmBBavnF7L7Q/iAR
 xHl5tdpc6WVxnON986+2vQPE5+VR2BAFVmxk2UQsJNG4Yb0014PZpwkz+ZMjOOly07XVY41R7
 yxvxXd+5XYJ6OmffmK0QsCNqCvcLRrkpj2GcMDrPw10Z/AxWVkSwVdS7tqt79+aaAMc4LVVEK
 WzQj+/Fc0kipslgz4V0kMhX5NvLNcf3kPeRUxZQ2oNytS860gorN9EbahT3Q87VWtw7bd1TU3
 UKi0bb9Exu6kg6doS/VfempPGYQ9L8hrupcX0cVoKO+cxXt+23bCFTPeP6YSsOtBdGxWkqM3W
 2WXpMmSsNiLk8diZ3uDMW6a+9EElaXdiZa4l0nwS1lN5BpDGEIhpZ87os6QD2fGNGMEDK8hOO
 sQySHJPnPUsYK1uRjzt/YCHM6+93BLqa3fnAJzhDU4cxY0JFAap4C+JkUbwTZybWfAps2pV6f
 hcxiXGrcIyy6yX2Q/iRT+sdWUVHevvOhDUbBCWWpb4puvO9PaI78L73crRFwca96uVXYe/g/7
 5qqoinufAxjMeHewePzhw1jPBfEV9+q/+EhPb43ovlSextdvEkiLLENUelv03f3qdXYYtdarI
 HjQtHCh6UekcHOtC7qwKRUcnk1+RjLXX4VU6NEjaQkHRr0smGsTYMHtil5uAk1K3LjYq+JaSs
 giHYhZWgzY/O8MxYhv6Xh2WLVZMLI/2pl2adq6vLWM8okJVf5rR7O1eAMj5M3EaErFujXr7qO
 2N0STbmo6LcMZeJ833VJ4xEVLg6hFchYGMmvBaY1uH3N2vrvBqCTs0ZkxtRmILn1IHpiZabDg
 ZTq52QxwdY6w3afd/x2RdejEavcRqG+ySAg8aW1TuQfbT8rHddbqRDBl99IOSOJNuzXa0KrRA
 YVWDErN8SpTo89LKtykQcznWhfbEbwUqkOx49TtBMNg/c4SANg8am6Czart15FT4THE5hMe6d
 w7jXJUIQ4ncSj6ZY3U9cisFHOkuQNYKbGLEV7YYQPogQ3o1gNKyFl6F25xtcprsMiXItKFFBJ
 KpzIuIlDQzwrK9CmS75UzyE4LpH8HyLJZZ3ycjbxYPBOkxZ/2xha7UWaxBCtAz9LsPi0Y57hW
 acYzDqQHSMZxWNshEN/ZXsJc96R1YikjeuJF0lPh0nGEGQLvpkUzpwB7ybjvya03D5YNlOr2d
 qlMG/ZWUY56Fy+Fgzl0maW2QKFK/W/PH4tKTxOwI/oEYePQGtDGDRTtupQoI7asXDBwB5d7GB
 BsqeOUvVSgnRNcwAedipxdrS6DWiMwEXz+8NSRJNRj4T4YCIS4jyvzS92DYNeFtpQinlPpqtF
 0ETstEF2YsHtxFc4QxvKhvTsbUyQfrRLuhuUCR4j39RAq7W9ZjRNY4ZcbTZ8J6R0PwsTW+98a
 T3I38eSJnXrsflxM0jrPePkvIhrBvJhmIlLGIL8pMfG82mJ2+EGbdLR7Df8e14hI1qmuVhYCm
 Dl0ZV7BpnYjSoYxewDbPpCZHD0hQOKurpNAIsFS5PcRol7INlftfJ5GdIO1gPBtHgUoM2pKLq
 Z/sw2rvCSqYYMudamU+D+BCZ8BPSStgNwYIqHhtUuy5JjwvufL7KL+jD5t8P9DCSZxOCYIprQ
 vq2cwQ61MxuylilJAOMNKKvgEbQ1bwa9Ze4N5gsCpkyHqg4aizC1fSb1aczWL8TyDm2yHDE4O
 GfKshtSNasavEcsGvAy8GCZgxI/bBKf60DrZEAAymDksPHT6FT3oXOYojlscXkWK7e6n9HZUc
 fyLVl0s/KY0lCctz0+wQcoIEZRIZOug61150DTq7QgI76bPJMoRNBrAw6cnOKZl2VytdIwOQs
 uwoh5bFszEMMkf7zvqfyLYHlGU0d67+hl2sTCjeBHAW8QKHFojiNYYKMYtnBShFrAp1nT89ss
 cR5k9bZQMjApo27LVi1ZfbJGZ5JudWrDBgLHbxeZhqDNWjOC/jhSvfuUiR+6+Xr35iTIsQbwB
 UNeBYb1igVocLGef7yGqzbKMR2MYe2LH3Zn6SUe1A3zlEiGLGx/7dXFPmil9DBr4LQu+4KJbu
 wAWs08OgEiVW+T29C9SrAcBU12fHstJ93t7KLHwbcYwCW0vtlpV2bITEYqAF3jB2X0pW7PIwu
 Jqq+auU6K8UUCfZIrPmaQS33lF4TJPWnjtCOlVPDoKrNema28eJXxTeS81YhqKsDcOdXF+oxe
 rsFwrdUzOIJ2M/TX

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/gpio/gpio-raspberrypi-exp.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-raspberrypi-exp.c b/drivers/gpio/gpio-raspb=
errypi-exp.c
index 9d1b95e429f1..b4b607515a04 100644
=2D-- a/drivers/gpio/gpio-raspberrypi-exp.c
+++ b/drivers/gpio/gpio-raspberrypi-exp.c
@@ -175,7 +175,7 @@ static int rpi_exp_gpio_get(struct gpio_chip *gc, unsi=
gned int off)
 	return !!get.state;
 }
=20
-static void rpi_exp_gpio_set(struct gpio_chip *gc, unsigned int off, int =
val)
+static int rpi_exp_gpio_set(struct gpio_chip *gc, unsigned int off, int v=
al)
 {
 	struct rpi_exp_gpio *gpio;
 	struct gpio_get_set_state set;
@@ -188,10 +188,14 @@ static void rpi_exp_gpio_set(struct gpio_chip *gc, u=
nsigned int off, int val)
=20
 	ret =3D rpi_firmware_property(gpio->fw, RPI_FIRMWARE_SET_GPIO_STATE,
 					 &set, sizeof(set));
-	if (ret || set.gpio !=3D 0)
+	if (ret || set.gpio !=3D 0) {
 		dev_err(gc->parent,
 			"Failed to set GPIO %u state (%d %x)\n", off, ret,
 			set.gpio);
+		return ret ? ret : -EIO;
+	}
+
+	return 0;
 }
=20
 static int rpi_exp_gpio_probe(struct platform_device *pdev)
@@ -228,7 +232,7 @@ static int rpi_exp_gpio_probe(struct platform_device *=
pdev)
 	rpi_gpio->gc.direction_output =3D rpi_exp_gpio_dir_out;
 	rpi_gpio->gc.get_direction =3D rpi_exp_gpio_get_direction;
 	rpi_gpio->gc.get =3D rpi_exp_gpio_get;
-	rpi_gpio->gc.set =3D rpi_exp_gpio_set;
+	rpi_gpio->gc.set_rv =3D rpi_exp_gpio_set;
 	rpi_gpio->gc.can_sleep =3D true;
=20
 	return devm_gpiochip_add_data(dev, &rpi_gpio->gc, rpi_gpio);
=2D-=20
2.34.1


