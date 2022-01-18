Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BB56491FAB
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jan 2022 08:03:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244555AbiARHCy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jan 2022 02:02:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244517AbiARHCy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jan 2022 02:02:54 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECA0FC061574
        for <linux-gpio@vger.kernel.org>; Mon, 17 Jan 2022 23:02:53 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1n9iVw-0007yI-V0; Tue, 18 Jan 2022 08:02:45 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1n9iVa-00AxLX-QO; Tue, 18 Jan 2022 08:02:22 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1n9iVZ-0004a8-PE; Tue, 18 Jan 2022 08:02:21 +0100
Date:   Tue, 18 Jan 2022 08:02:20 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2 4/4] pinctrl: add one more "const" for generic
 function groups
Message-ID: <20220118070220.5bfgubz4mx2l33jd@pengutronix.de>
References: <20211216162206.8027-1-zajec5@gmail.com>
 <20211216162206.8027-4-zajec5@gmail.com>
 <Yd2jcfXqqKHK/NaG@archlinux-ax161>
 <24a1e92e-51ab-ded5-1a43-682950af1fe9@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="c3ab6tibtaohhpd3"
Content-Disposition: inline
In-Reply-To: <24a1e92e-51ab-ded5-1a43-682950af1fe9@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--c3ab6tibtaohhpd3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 11, 2022 at 05:51:44PM +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
> On 11.01.2022 16:34, Nathan Chancellor wrote:
> > On Thu, Dec 16, 2021 at 05:22:06PM +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
> > > From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> > >=20
> > > Generic code doesn't modify those strings and .get_function_groups
> > > callback has that extra "const" as well. This allows more flexibility=
 in
> > > GENERIC_PINMUX_FUNCTIONS users.
> > >=20
> > > Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> > > ---
> > >   drivers/pinctrl/pinmux.c | 2 +-
> > >   drivers/pinctrl/pinmux.h | 4 ++--
> > >   2 files changed, 3 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
> > > index 6cdbd9ccf2f0..f94d43b082d9 100644
> > > --- a/drivers/pinctrl/pinmux.c
> > > +++ b/drivers/pinctrl/pinmux.c
> > > @@ -875,7 +875,7 @@ EXPORT_SYMBOL_GPL(pinmux_generic_get_function);
> > >    */
> > >   int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
> > >   				const char *name,
> > > -				const char **groups,
> > > +				const char * const *groups,
> > >   				const unsigned int num_groups,
> > >   				void *data)
> > >   {
> > > diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
> > > index 78c3a31be882..72fcf03eaa43 100644
> > > --- a/drivers/pinctrl/pinmux.h
> > > +++ b/drivers/pinctrl/pinmux.h
> > > @@ -129,7 +129,7 @@ static inline void pinmux_init_device_debugfs(str=
uct dentry *devroot,
> > >    */
> > >   struct function_desc {
> > >   	const char *name;
> > > -	const char **group_names;
> > > +	const char * const *group_names;
> > >   	int num_group_names;
> > >   	void *data;
> > >   };
> > > @@ -150,7 +150,7 @@ struct function_desc *pinmux_generic_get_function=
(struct pinctrl_dev *pctldev,
> > >   int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
> > >   				const char *name,
> > > -				const char **groups,
> > > +				const char * const *groups,
> > >   				unsigned const num_groups,
> > >   				void *data);
> > > --=20
> > > 2.31.1
> > >=20
> > >=20
> >=20
> > I have not seen this reported yet, even though it has been broken for a
> > couple of weeks now. I see the following error in -next:
> >=20
> > $ make -skj"$(nproc)" ARCH=3Darm64 CROSS_COMPILE=3Daarch64-linux-gnu- a=
llmodconfig drivers/pinctrl/pinctrl-thunderbay.o
> > drivers/pinctrl/pinctrl-thunderbay.c: In function =E2=80=98thunderbay_a=
dd_functions=E2=80=99:
> > drivers/pinctrl/pinctrl-thunderbay.c:815:29: error: assignment discards=
 =E2=80=98const=E2=80=99 qualifier from pointer target type [-Werror=3Ddisc=
arded-qualifiers]
> >    815 |                         grp =3D func->group_names;
> >        |                             ^
> > cc1: all warnings being treated as errors
> >=20
> > Looks like something like the third patch of the series is needed for
> > the Thunderbay driver, which it appears was in development at the same
> > time as this series.
>=20
> Correct, this driver didn't exist in Linus's tree when I developed my cha=
nges.

I stumbled above this issue, too. For the record, this patch fixes the
build issue:

diff --git a/drivers/pinctrl/pinctrl-thunderbay.c b/drivers/pinctrl/pinctrl=
-thunderbay.c
index b5b47f4dd774..a6a9a0cca6bf 100644
--- a/drivers/pinctrl/pinctrl-thunderbay.c
+++ b/drivers/pinctrl/pinctrl-thunderbay.c
@@ -812,7 +812,7 @@ static int thunderbay_add_functions(struct thunderbay_p=
inctrl *tpc, struct funct
 				}
 			}
=20
-			grp =3D func->group_names;
+			grp =3D (void *)func->group_names;
 			while (*grp)
 				grp++;
=20
(however it's probably not safe for runtime).

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--c3ab6tibtaohhpd3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmHmZfgACgkQwfwUeK3K
7Ak3Ogf/bPBGQyuuBJpaAXC9o+1WUtaSOcMnCE5wDP7Kgn6U2KzMIPVbUPQuSmTL
sUTcXB4eQWpN/Dctucd7DeiM0JevzKP1GjkFQdrkz2nDaFXJZfFrbVojrd+Lt8cf
rEPtQ4tZxKUxnlg+tYZWDh9t5aNxovK5kjltCAd0hbTdXqbHRM0IPvy3WVWKxuXM
znlEy9RLPNQgAAIP/6hHmX8+ex5h07sB8HchK/7V9kvtCLN7QKzVu4r+ad+j7R15
hqal537G/Y8KWgBSkmZuaYk5GuugGXAGWWfBCo3TVKstzFrhSuCwJViP1/F9W3Oj
q8cWHc5QZXNq20kwLYjyN+/nYD6rIg==
=J6Jh
-----END PGP SIGNATURE-----

--c3ab6tibtaohhpd3--
