Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B55E519281E
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2020 13:22:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbgCYMWG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Mar 2020 08:22:06 -0400
Received: from vm1.sequanux.org ([188.165.36.56]:55009 "EHLO vm1.sequanux.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727046AbgCYMWG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 25 Mar 2020 08:22:06 -0400
X-Greylist: delayed 598 seconds by postgrey-1.27 at vger.kernel.org; Wed, 25 Mar 2020 08:22:06 EDT
Received: from localhost (localhost.localdomain [127.0.0.1])
        by vm1.sequanux.org (Postfix) with ESMTP id 62D7B1081EC;
        Wed, 25 Mar 2020 13:12:07 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at vm1.sequanux.org
Received: from vm1.sequanux.org ([127.0.0.1])
        by localhost (vm1.sequanux.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 1hVqBn0fh4OE; Wed, 25 Mar 2020 13:12:05 +0100 (CET)
Received: from localhost (softwrestling.org [188.165.144.248])
        by vm1.sequanux.org (Postfix) with ESMTPSA id 5EEA8108133;
        Wed, 25 Mar 2020 13:12:05 +0100 (CET)
Date:   Wed, 25 Mar 2020 13:12:05 +0100
From:   Simon Guinot <simon.guinot@sequanux.org>
To:     Nick Bowler <nbowler@draconx.ca>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: Fix gpio-f7188x module name in Kconfig help text.
Message-ID: <20200325121205.GT21102@kw.sim.vm.gnt>
References: <20200325005707.5891-1-nbowler@draconx.ca>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UEYxRAcbr7cS1UOX"
Content-Disposition: inline
In-Reply-To: <20200325005707.5891-1-nbowler@draconx.ca>
User-Agent: Mutt/1.6.0 (2016-04-01)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--UEYxRAcbr7cS1UOX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2020 at 08:57:07PM -0400, Nick Bowler wrote:
> The Kconfig help text for the gpio-f7188x driver says that if you
> compile the driver as a module, the module will be called f7188x-gpio.
> This is a lie: the module is called gpio-f7188x.

And what about just a mistake ? :)

Acked-by: Simon Guinot <simon.guinot@sequanux.org>

>=20
> Change the help text to be consistent with reality.
>=20
> Signed-off-by: Nick Bowler <nbowler@draconx.ca>
> ---
>  drivers/gpio/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index b8013cf90064..8cf91a9fbd18 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -755,7 +755,7 @@ config GPIO_F7188X
>  	  chips F71869, F71869A, F71882FG, F71889F and F81866.
> =20
>  	  To compile this driver as a module, choose M here: the module will
> -	  be called f7188x-gpio.
> +	  be called gpio-f7188x.
> =20
>  config GPIO_GPIO_MM
>  	tristate "Diamond Systems GPIO-MM GPIO support"
> --=20
> 2.24.1

--UEYxRAcbr7cS1UOX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEXW8DgovlR3VS5hA0zyg/RDPmszoFAl57SpQACgkQzyg/RDPm
szq0dhAA2ihNwvtRWWIsdol4+p0cNGJCknIZv8lw/Jjm0GNbqo9nsRHuG5zFSowu
G+u8NTUVKMqymYOn7jIDWqQH7Yc+xlGrKwJqRTCg+xvZhS1Pa4k+ocxn2m5hIFbv
XR37R9Nn6gAQ6vvn1J5aIfaRLa953KkQ4fbmiExP0umTOAqj+AjHK6Tj0b4QtyD7
3XPjgnKHWRNKkGFq5dLr67dRrLKx71WA1SUxBND/rRrty1rFnJhFXU8MfAiBZUpm
X6WUtZQYx++OhHKBV9VPv0/psjbdIrUu9u1CMjL0dF1Ge20OQZuRRVzDPDYpFXOk
IOypuEUSbwfLKA+fAgYYjIpsQMeEyudgXafnxNodbGPZyLi56Lv+jINErqsyS6OL
b/rUCJQM4KSxdQLlvkVELTPnyO0aRCcDfSKap59YraLHF1yrbreQKi5e3RzTahmA
eXsZ32mUMjTao7yJs1fzyWXxIrZcH2jczuy84f3eOgVekdWbUoqdRcOzuXp9ym5I
XaNtr9ZdzpF4nsh1AimrVEKQSsZ7lya8O85a3R0OCkod6C4EpPYq9JGaMFZ2zNRz
9opISQWXoE9USG1U1y0IaayWzGPD6YT0sM9rlZG/KQYc1AAMBL4xqO9rtUeWQxPY
ZUfsSaSffU98oUlJVhypXFvQK9yCaiiKIy4jCjB/+gEja64ft58=
=Qx7s
-----END PGP SIGNATURE-----

--UEYxRAcbr7cS1UOX--
