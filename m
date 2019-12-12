Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEAE911C9B8
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 10:42:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728578AbfLLJmc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 04:42:32 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:57627 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728465AbfLLJmb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Dec 2019 04:42:31 -0500
X-Originating-IP: 93.34.114.233
Received: from uno.localdomain (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 939E420006;
        Thu, 12 Dec 2019 09:42:27 +0000 (UTC)
Date:   Thu, 12 Dec 2019 10:44:36 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] pinctrl: rza1: reduce printed messages
Message-ID: <20191212094436.r5zergjlduobjq7n@uno.localdomain>
References: <20191211160638.31853-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4l7cagjh5kgyubuu"
Content-Disposition: inline
In-Reply-To: <20191211160638.31853-1-chris.brandt@renesas.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--4l7cagjh5kgyubuu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Chris,

On Wed, Dec 11, 2019 at 11:06:38AM -0500, Chris Brandt wrote:
> Since this message is printed for each port, it creates a lot of output
> during boot and would serve better only during debugging.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Seems fair

> ---
>  drivers/pinctrl/pinctrl-rza1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/pinctrl-rza1.c b/drivers/pinctrl/pinctrl-rza1.c
> index 017fc6b3e27e..86e5bf59bde5 100644
> --- a/drivers/pinctrl/pinctrl-rza1.c
> +++ b/drivers/pinctrl/pinctrl-rza1.c
> @@ -1235,7 +1235,7 @@ static int rza1_parse_gpiochip(struct rza1_pinctrl *rza1_pctl,
>
>  	pinctrl_add_gpio_range(rza1_pctl->pctl, range);
>
> -	dev_info(rza1_pctl->dev, "Parsed gpiochip %s with %d pins\n",
> +	dev_dbg(rza1_pctl->dev, "Parsed gpiochip %s with %d pins\n",
>  		 chip->label, chip->ngpio);

Please align this line to the open ( ... Sorry to bother for such
minor thing.

There are other dev_info which might show up frequently, I'm
looking at line 1054 in example. I think it's fine as they show the
actually enabled groups...

Anway, minor alignement issue apart
Acked-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
   j
>
>  	return 0;
> --
> 2.23.0
>

--4l7cagjh5kgyubuu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl3yDAMACgkQcjQGjxah
VjxDpA//X1R1THIIeYa63NuMnCE/aCvRX4VGXYF4EkLek51yXJRwr/AuQd4IEiwL
kubHdhGNR9iI4eAUJ4Hplgtl6LHpUKWvrysW5GnzucgtCyT4xV78Hnz8CEq2vPiA
Z6BkD+/jHEI8MOeq3FwRAtUGKlugP90+HZgZ6kVsoR8EGxLaspd6c3qyvEsPNm3u
vTJw4q7SJpj0/e9GP61lvfhmpln6I9CFc9TWcIo6qt3PceeqkgCZplCDVpy5lofb
tC64/O55xshXQGEDGHs4Jc0t4gDt3KCDKxeCGjhf2Wl0/wSefpcegY/x8mV5xn1y
8zZfeI8Swj2JteUbcBcbPJ0nJYnDCk2cq9FARuGIC0JrdSJeR8IcYULx21fQC7CC
FI0lx5Mgdgw784qwX58A7oRdxuerp8QOxlftbdoO43upmMKNYX8WDTYLiD7luvO3
ysPv+WumC8OD/ZxR8wnubDFLXL/az9dO5mmm8g21ZFievL4d8v8uWmZpTNyYzsmE
OiETISgMNQgISuv4nIXAxkUeUVnkWTOGKpZChK8RT5LCvCbyI6U6blW2Opkb/tAr
SIHGPkDyy4xAu6sZlQq7QZoF2ea7t0ht4A4oQy3kz8rLQqOCg4RQjeCYHqLzJ+w2
KND7fY4rLdzRbOhcXzfgxff9aCACQgypSLatI5BvM4dG3WvJnoU=
=NYrg
-----END PGP SIGNATURE-----

--4l7cagjh5kgyubuu--
