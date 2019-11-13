Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C310CFAC61
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 09:55:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbfKMIyE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 03:54:04 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:52943 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726086AbfKMIyE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Nov 2019 03:54:04 -0500
X-Originating-IP: 93.34.114.233
Received: from uno.localdomain (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 30C766000E;
        Wed, 13 Nov 2019 08:53:57 +0000 (UTC)
Date:   Wed, 13 Nov 2019 09:55:58 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] pinctrl: rza1: remove unnecerssary static inline
 function
Message-ID: <20191113085558.l6rde7xug3paoojf@uno.localdomain>
References: <20191112141748.GA22061@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bwknto7takkwphs5"
Content-Disposition: inline
In-Reply-To: <20191112141748.GA22061@localhost.localdomain>
User-Agent: NeoMutt/20180716
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--bwknto7takkwphs5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Matti,

On Tue, Nov 12, 2019 at 04:17:48PM +0200, Matti Vaittinen wrote:
> Having static inline oneliner does not benefit too much when it is
> only called from another oneliner function. Remove some of the
> 'onion'. This simplifies also the coming usage of the gpiolib
> defines. We can do conversion from chip bits to gpiolib direction
> defines as last step in the get_direction callback. Drivers can
> use chip specific values in driver internal functions and do
> conversion only once.

I assume your: "[PATCH 2/2] pinctrl: Use new GPIO_LINE_DIRECTION"
supersedes this one, am I right ?

Thanks
  j

>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>  drivers/pinctrl/pinctrl-rza1.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-rza1.c b/drivers/pinctrl/pinctrl-rza1.c
> index 017fc6b3e27e..215db220d795 100644
> --- a/drivers/pinctrl/pinctrl-rza1.c
> +++ b/drivers/pinctrl/pinctrl-rza1.c
> @@ -617,12 +617,6 @@ static void rza1_pin_reset(struct rza1_port *port, unsigned int pin)
>  	spin_unlock_irqrestore(&port->lock, irqflags);
>  }
>
> -static inline int rza1_pin_get_direction(struct rza1_port *port,
> -					 unsigned int pin)
> -{
> -	return !!rza1_get_bit(port, RZA1_PM_REG, pin);
> -}
> -
>  /**
>   * rza1_pin_set_direction() - set I/O direction on a pin in port mode
>   *
> @@ -783,7 +777,7 @@ static int rza1_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
>  {
>  	struct rza1_port *port = gpiochip_get_data(chip);
>
> -	return rza1_pin_get_direction(port, gpio);
> +	return !!rza1_get_bit(port, RZA1_PM_REG, gpio);
>  }
>
>  static int rza1_gpio_direction_input(struct gpio_chip *chip,
>
> base-commit: 70d97e099bb426ecb3ad4bf31e88dbf2ef4b2e4c
> --
> 2.21.0
>
>
> --
> Matti Vaittinen, Linux device drivers
> ROHM Semiconductors, Finland SWDC
> Kiviharjunlenkki 1E
> 90220 OULU
> FINLAND
>
> ~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
> Simon says - in Latin please.
> ~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
> Thanks to Simon Glass for the translation =]

--bwknto7takkwphs5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl3LxR4ACgkQcjQGjxah
Vjzu3A//VcmxB+zLrhFkIPEXStslWNxWBzlOPrVt1zEIGbpxgVBin7IaP30h4gml
GrPxtZom3KkKbzbIYlS5syNycjxUT3NjYs2Yur4DBnAhvkoxrFLfprhjjX0fL170
18RZJoH74NJYsjiDzbRRJQfN6JSNVgJ0XFCyLmQKhBA5K7UC4BT2hSvsLzzQ0neJ
jXhtQ+VKayIDQ/lUArvoABE7V6wX+F4app7eZ+xkSPq1ptUByob6mr9wV7WMONNh
qBd+U/+nV8ywD3qUWwDt//77FGZYbXM/mdKf3moYnvD8BYTaIA0l4MRoYuAh0bKg
SLimFdCoBznxP4syuhiil5aDYhY21fK3XymjbBnoKHw3SlmJn2488eOdiDy1ErCy
dT258CLPbO6YyI1aNxyZyIlWhWlavkM5/FvS4R+IUIJzJiT177gSWD2uTX0i8kd4
3GIF63YcoUaJjNDGMRMla4tbDOgee3mdssRWDEynQlmYu3AV6krBF0tkRU8JaIaE
l0kSRUPo6bxWsH+HFhNrXMGP3JSrfU26cR7t+V9intAxWaGmteXZV2ph1CjeMW8e
gsa0GSGjvm5aEganXEi1pXoHD+5Fg34/6UHY7XYYQXkaFl7f92Cmkoc4EomfWkAR
kpwLSvI76WXbaP6bKEH7FqWAyUcHEIzrBMqIWYBKx90aHEWiRAs=
=SZJk
-----END PGP SIGNATURE-----

--bwknto7takkwphs5--
