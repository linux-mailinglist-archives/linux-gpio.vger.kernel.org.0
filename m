Return-Path: <linux-gpio+bounces-39-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D377E923F
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Nov 2023 20:25:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39BBDB2080B
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Nov 2023 19:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D62BF171AB;
	Sun, 12 Nov 2023 19:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="Bc0Yp2uc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1647A14294
	for <linux-gpio@vger.kernel.org>; Sun, 12 Nov 2023 19:25:04 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECB0C1BEC
	for <linux-gpio@vger.kernel.org>; Sun, 12 Nov 2023 11:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1699817087; x=1700421887; i=wahrenst@gmx.net;
	bh=bMwh/GFKRT3KTYXS4ogxMoKSBce3E3EizqgjsmyVGNo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=Bc0Yp2ucDMCvu3UVX4a9kVIhMigs9A8Qk5hEu2O4Wyuthy73WSoEDRVF25ZjhXzZ
	 VY2ofeACT63ln+OncVfMTlWWlL/3mu5kNswyS+rwflSad1PYzTVsyj/v7KYF2b1dn
	 zShyYJjxJm3x/elA9WNQU2Bu2T4pi7xARsFEWOLcO9xkUrpy2fiCR0uNtGJLjTncc
	 LCV2rYCEMif5w0QFWRco8J0yF+e7VVTE/s5N4iR7EWUP3m/b7XhJDRkpRfuufIaxl
	 16QCU2e130vkTsXC/FB8aq3/QQEVgNeslVTE7OhqDbE9/j+cJozEOIZNYz+LuIRwM
	 1QWrK2/qwfv/PnpmOg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MrhUE-1rh4WZ1SYG-00nlWV; Sun, 12
 Nov 2023 20:24:47 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH] gpio: mxc: implement get_direction callback
Date: Sun, 12 Nov 2023 20:24:28 +0100
Message-Id: <20231112192428.6832-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KzRnWXJMJ12GpvyVuE2dGb4oXfJEh130Wf+tZWSeMo8ZDj7upbR
 P3kd3ii/ZjhU0PJ3MJkQW5SfJm7rv4NpDTOtXxv7GEw7b6V6kQLCruDfyi3bZLgBROUoCyA
 pc00o+gJApEYi29/lua3cBVQTnM01eDUZlAstT5J+NU6JNF3ynVnzENHXQEhDGhPK17hOcO
 h2C9QSNeC3hBhAb6tQCtw==
UI-OutboundReport: notjunk:1;M01:P0:Vcvolnz6xUc=;4cthngjXRuFqjp6J40v9u1TZjvp
 Uc9QtDGZzwQ347TEt3R4VCKPrL13EJbFRbh0YPoaA3c1ww4ujntoj2TkiSeIjqXDJcTSVgRAL
 B57pYP6y4FljNYyeS2ZfoffwYPSypUfcCxci87d1UDw5iV+EGL3n7+44k4lBxLXXy12ZrcRMV
 XxlLgqHAROe2LOFfYByc+7JO6OeSwwCb28zWUOvzrov/s9TL7DvzmcvVr+8AQ8pUWs18+lqoB
 wk8SmmKezzo+kvSBk33chK1bm+3m5rUWpp/YY0A9saWnaB1T9aLE9/uq9T4xdTftYjTtijxHt
 n0MKf/YKyoKI8fS2Gm3GtwwFJBVqKVWz9u9YqwqfzTqCf6/AXZGe3pcJB6eKBc/3y3y91yqTh
 4IFWUx8qs65ECIar7Dxl57+HW8oKLBIXmM7FFAEctu8E9VdGPDkSLw24NeTv0fi8y5i2v0aoG
 L2fu2xFp324zNgl5xl6wauyY3hsUMOBoQ8nihARVKhdzt9pNOqdZwB5/v4iMq1YwdwLTVpXxk
 izNqVaWk5tESxagAIJbatyBdq3dpZkYHqJ3fJIQXbIM5FEj0OiOIKyvb1tzTOi3b+8txIefyt
 QnCsB0hfHipmOkIYGb9HJ6b/4qJ8EwaII7b/JzwSOj3zJ3PGiBK3AX4i2qlAWifpLFSOQxE0q
 FfOhC/URwg1c1Y2Hl4XiGqpxugquvUIfllZaFpZ4GGmVUHLWWft07FQOvUS5kCJMS9ict8qEx
 Mu10KuOcRatX8dTXSg+BaD8E9l3XXBTzEKWWEzeu49GmG1P2pvJcgh6+NkWbzdNkzR+3eyMzw
 9STcLwHfaVRa0HA3YvZn3HlIzMmxAa/j6sfmgNsTmlESbe9Rvqdd7q+RYkPMTWvoiVS5NqIkX
 A2m00XAxEiU2lvpbzDY8Fsgx/r0Jx28cS5F0MuzqKmCt5wDDjYZFQkFF62auD4FA85hQB2qCT
 AJOwqQYStQR45REJ8r0FidTANNc=

gpiolib's gpiod_get_direction() function returns an erro if
.get_direction callback is not defined.

The patch implements the callback for IMX platform which is useful
for debugging and also the kernel docs about struct gpio_chip
recommends it.

Inspired by drivers/gpio/gpio-mxs.c

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/gpio/gpio-mxc.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 4cb455b2bdee..ad8a4c73d47b 100644
=2D-- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -418,6 +418,18 @@ static void mxc_update_irq_chained_handler(struct mxc=
_gpio_port *port, bool enab
 	}
 }

+static int mxc_gpio_get_direction(struct gpio_chip *gc, unsigned int offs=
et)
+{
+	struct mxc_gpio_port *port =3D gpiochip_get_data(gc);
+	u32 dir;
+
+	dir =3D readl(port->base + GPIO_GDIR);
+	if (dir & BIT(offset))
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
+}
+
 static int mxc_gpio_probe(struct platform_device *pdev)
 {
 	struct device_node *np =3D pdev->dev.of_node;
@@ -490,6 +502,7 @@ static int mxc_gpio_probe(struct platform_device *pdev=
)
 	port->gc.request =3D mxc_gpio_request;
 	port->gc.free =3D mxc_gpio_free;
 	port->gc.to_irq =3D mxc_gpio_to_irq;
+	port->gc.get_direction =3D mxc_gpio_get_direction;
 	port->gc.base =3D (pdev->id < 0) ? of_alias_get_id(np, "gpio") * 32 :
 					     pdev->id * 32;

=2D-
2.34.1


