Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 367D44DD789
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Mar 2022 10:58:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234650AbiCRJ7o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Mar 2022 05:59:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234026AbiCRJ7o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Mar 2022 05:59:44 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBCE621FC46;
        Fri, 18 Mar 2022 02:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1647597497;
        bh=tzB60njyHLs/6P39IxHt148nappSoXRyog+UqAqaohE=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=Ye8eCRHBy6Ze14PxO2h7NLFAe5YTJy+Dosy81OR8P1texxyOTp8LzcSPf3PVD9x7a
         zXo/GLFd/W+akJmj0fifVTAYEvQ/8nn0OebPygL4L4KKqqgETaFwz+hRSFj5Di8H86
         X/jfJNIOoHO7mB1svLaeML88ZuVWqU/ZUY1+GxFY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7iCg-1o9NgB0ZIA-014ogo; Fri, 18
 Mar 2022 10:58:17 +0100
Date:   Fri, 18 Mar 2022 10:58:15 +0100
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] pinctrl: nuvoton: wpcm450: off by one in
 wpcm450_gpio_register()
Message-ID: <YjRXtzaiphcz9V3W@latitude>
References: <20220318071131.GA29472@kili>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8eO5T9XC5TjLSkBl"
Content-Disposition: inline
In-Reply-To: <20220318071131.GA29472@kili>
X-Provags-ID: V03:K1:TxPogLUIoI93kGAxHmjr3NF0gILg5qADE4UQHW0w7nse65uxiZm
 MvUR7deR+NDu34ebaljEfs9h8EtnH5UWvzdmpCqyO5o/yEdaMuRhHU/fexk5YTj5FCY8IZC
 a8/KaKzm9C3Kot0bsJ57zxvndFulv/gtpAyqLui6eHlI2B37n1WfDcFDeDXvCL+ImiLM190
 Xn95Q9seYTq61YZkaUeRw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gfIymdIHCZI=:n6xvcTOO5jNUdSDLxByoFH
 KpVfQ3OZW5TiMyojFxXUowNBtAi/mxDqjMwHKvdsMgZKiZOsSbAVyQPbZM4XtKQMTiBO3xk8D
 zeKZ2Vrz8ciF3rQkiCcmc7FgWy1JFtcERflLF7wDlxxepcNXGbcw6t9ti1df90o+Ko+sltROn
 ktnuIAPftmWsPpWCdy+LKwBMZ9gbP7EjId00xkf9/toWvoYVicfQzXPQi3QA0QhnCplVcIFPs
 DyUlh0VDroNzKp2dhyFE9+HnpqEK7/TtfXWRKQNnrDrgN+7eZA4iE1sGIAUP2s2u2PjwGsjlA
 YXa8cE/6zfkv999G9VV73BHVF2lxm4Mmz+MWwc7AnHTgT7jChzpw0H5a944eU8k/UHvsOgxps
 kneSYFrpXUuR0Y1o0XHtXWb7B1IrVjScaNpYQ5178zpFIdbIWImj2iR3DeEB9UTzHSXk80tOM
 W+68Wzwe2lPrcW2kEQUSjQKDnMhzoEJiqi57tCWy5zirtYkFOO6xt0l+z6fw42XBVTBwLEYjI
 aaqQAkqh9tvn8OjNZVA5FaB2cel3y7Tl+h1EMS9HdC35JjiU4o8sQFcvDhRWHArri7BHvwJ1n
 MH8UTu1jZjqP9YQ2JzbzbeJ9lKh9H29ACSld6aj0qdgK4x0lAP6pWGOGr1YZL+G2AXSrFE8Aw
 XMKZgKm66saANKZwxV9Evo6JLg1qHfrVFTn35Q3u3De3JKjcEKNEyJ9bd2fReLsavaPB/Gvh4
 UY2mEBIfqyxkL+UtwjtsJNCSXdFtxKCprj9tZFGtsMvVkZYGvi4RWhbZuLehSvHrUGwIK+4IL
 D9sMr3gAzJT3y/2KmIqHTLuKQ+CdHjpk245sh3ad2zH4ZmQFE1944fW4d7K9/MRfEpzOgsesJ
 ntnGdSLw3sKMFZxvTh1POzhjqvQPvE3dAW6q/THoAgbGLUEAIgjg7rYM8AJBZnaSKsjkX82ej
 LFWoS7LnLuOzXDm85xTBBHkjBV9l9OxZoZjz5tXd7UzvC9TetyWb4z/gBOAhWsrZPqgRfqnGh
 s+tAnQbUEqGb8rX9hDINhC8wkDE4gVw3f2PVhw04B5krCoU5PhfZuWiNn1FabPDijFIKlvTK6
 TZ4X4SJZ4XFQWk=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--8eO5T9XC5TjLSkBl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 18, 2022 at 10:11:31AM +0300, Dan Carpenter wrote:
> The > WPCM450_NUM_BANKS should be >=3D or it leads to an out of bounds
> access on the next line.

True.

> Fixes: a1d1e0e3d80a ("pinctrl: nuvoton: Add driver for WPCM450")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Reviewed-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>


Thanks,
Jonathan

>  drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/=
nuvoton/pinctrl-wpcm450.c
> index 661aa963e3fc..164d7a6e7b5b 100644
> --- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
> +++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
> @@ -1043,7 +1043,7 @@ static int wpcm450_gpio_register(struct platform_de=
vice *pdev,
>  		gpio =3D &pctrl->gpio_bank[reg];
>  		gpio->pctrl =3D pctrl;
> =20
> -		if (reg > WPCM450_NUM_BANKS)
> +		if (reg >=3D WPCM450_NUM_BANKS)
>  			return dev_err_probe(dev, -EINVAL,
>  					     "GPIO index %d out of range!\n", reg);
> =20
> --=20
> 2.20.1
>=20

--8eO5T9XC5TjLSkBl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmI0V5AACgkQCDBEmo7z
X9so5w//UcM91i41yLrTQBBTkPZIa14bFqkb+qIA1PkPP4Rsp+Zri6oa8bwUOJFg
Fc0cg6NVwOnWdw4xVjfterTGGBF7IqGH/W9PDL3mFDpZTrL21jvpe1OlJUONByRJ
8DrU/zmdx+bwpNaiaGBB9gRoCDk8BU/WpqHlrDlR8Yq9gHnq+z0/DNL+ZobV3IyN
ir3cHQl1FOde51aBe3EzlL8TS3zys0ylrQC85enDeay6MuubfVdMLRp7gy/aO19+
bgtp9hAipGnvGJeHRIRsKISE1qgjN4SwSgpWZSZrcPOFZy2c0h/CHR2OMj1qtTSE
ESMGY/16ZnNUcz7XdvoTKVYxqbZoE9lo6GbPANDoMK50Srsc5VtETDv+4HIw19XE
IkGXVbVjkhTvxIc8Zv89HWgpVIlOhcpok70yo/EbAjFgYfoOtedoK1Wg4bHCvDPL
USyUDjl5fK00I/W7x9mH791TDbcT1w38CbNBHYGApV1QDVffQSY5+aSChQb+WxM1
JQ8B1Va4adt9LDwdLPQMbAha/1YD56rA87pSfYpk6TisV3hZg9FBnBazafBqMs6y
Z8f5l/a0XqCyLT6rHlBR22tsxemgY/AyBnsNGcGTFOwEspuL9N5xQb/1q0ZlwmY9
Jyybwb5XvlfEv2lEiYFCsRWLG2BIJKxqa5iyWI4pD+eRgdP+hiw=
=cq6x
-----END PGP SIGNATURE-----

--8eO5T9XC5TjLSkBl--
