Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8213C49205A
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jan 2022 08:32:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232854AbiARHbu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jan 2022 02:31:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbiARHbt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jan 2022 02:31:49 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 445AEC061574
        for <linux-gpio@vger.kernel.org>; Mon, 17 Jan 2022 23:31:49 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1n9ixy-0002tR-JI; Tue, 18 Jan 2022 08:31:42 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1n9ixv-00Axko-9h; Tue, 18 Jan 2022 08:31:38 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1n9ixt-0006FN-Ut; Tue, 18 Jan 2022 08:31:37 +0100
Date:   Tue, 18 Jan 2022 08:31:36 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Stefan Agner <stefan@agner.ch>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-gpio@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Fabio Estevam <festevam@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V2 4/4] pinctrl: add one more "const" for generic
 function groups
Message-ID: <20220118073136.wbb4ktivhqaqry4m@pengutronix.de>
References: <20211216162206.8027-1-zajec5@gmail.com>
 <20211216162206.8027-4-zajec5@gmail.com>
 <Yd2jcfXqqKHK/NaG@archlinux-ax161>
 <24a1e92e-51ab-ded5-1a43-682950af1fe9@gmail.com>
 <20220118070220.5bfgubz4mx2l33jd@pengutronix.de>
 <7cbe1015-a942-4887-7762-7c1dce243958@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cjsjiwuxzixw3igt"
Content-Disposition: inline
In-Reply-To: <7cbe1015-a942-4887-7762-7c1dce243958@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--cjsjiwuxzixw3igt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 18, 2022 at 08:21:55AM +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
> On 18.01.2022 08:02, Uwe Kleine-K=C3=B6nig wrote:
> > On Tue, Jan 11, 2022 at 05:51:44PM +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
> > > On 11.01.2022 16:34, Nathan Chancellor wrote:
> > > > On Thu, Dec 16, 2021 at 05:22:06PM +0100, Rafa=C5=82 Mi=C5=82ecki w=
rote:
> > > > > From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> > > > >=20
> > > > > Generic code doesn't modify those strings and .get_function_groups
> > > > > callback has that extra "const" as well. This allows more flexibi=
lity in
> > > > > GENERIC_PINMUX_FUNCTIONS users.
> > > > >=20
> > > > > Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> > > > > ---
> > > > >    drivers/pinctrl/pinmux.c | 2 +-
> > > > >    drivers/pinctrl/pinmux.h | 4 ++--
> > > > >    2 files changed, 3 insertions(+), 3 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
> > > > > index 6cdbd9ccf2f0..f94d43b082d9 100644
> > > > > --- a/drivers/pinctrl/pinmux.c
> > > > > +++ b/drivers/pinctrl/pinmux.c
> > > > > @@ -875,7 +875,7 @@ EXPORT_SYMBOL_GPL(pinmux_generic_get_function=
);
> > > > >     */
> > > > >    int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
> > > > >    				const char *name,
> > > > > -				const char **groups,
> > > > > +				const char * const *groups,
> > > > >    				const unsigned int num_groups,
> > > > >    				void *data)
> > > > >    {
> > > > > diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
> > > > > index 78c3a31be882..72fcf03eaa43 100644
> > > > > --- a/drivers/pinctrl/pinmux.h
> > > > > +++ b/drivers/pinctrl/pinmux.h
> > > > > @@ -129,7 +129,7 @@ static inline void pinmux_init_device_debugfs=
(struct dentry *devroot,
> > > > >     */
> > > > >    struct function_desc {
> > > > >    	const char *name;
> > > > > -	const char **group_names;
> > > > > +	const char * const *group_names;
> > > > >    	int num_group_names;
> > > > >    	void *data;
> > > > >    };
> > > > > @@ -150,7 +150,7 @@ struct function_desc *pinmux_generic_get_func=
tion(struct pinctrl_dev *pctldev,
> > > > >    int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
> > > > >    				const char *name,
> > > > > -				const char **groups,
> > > > > +				const char * const *groups,
> > > > >    				unsigned const num_groups,
> > > > >    				void *data);
> > > > > --=20
> > > > > 2.31.1
> > > > >=20
> > > > >=20
> > > >=20
> > > > I have not seen this reported yet, even though it has been broken f=
or a
> > > > couple of weeks now. I see the following error in -next:
> > > >=20
> > > > $ make -skj"$(nproc)" ARCH=3Darm64 CROSS_COMPILE=3Daarch64-linux-gn=
u- allmodconfig drivers/pinctrl/pinctrl-thunderbay.o
> > > > drivers/pinctrl/pinctrl-thunderbay.c: In function =E2=80=98thunderb=
ay_add_functions=E2=80=99:
> > > > drivers/pinctrl/pinctrl-thunderbay.c:815:29: error: assignment disc=
ards =E2=80=98const=E2=80=99 qualifier from pointer target type [-Werror=3D=
discarded-qualifiers]
> > > >     815 |                         grp =3D func->group_names;
> > > >         |                             ^
> > > > cc1: all warnings being treated as errors
> > > >=20
> > > > Looks like something like the third patch of the series is needed f=
or
> > > > the Thunderbay driver, which it appears was in development at the s=
ame
> > > > time as this series.
> > >=20
> > > Correct, this driver didn't exist in Linus's tree when I developed my=
 changes.
> >=20
> > I stumbled above this issue, too. For the record, this patch fixes the
> > build issue:
>=20
> [PATCH 5.17 1/2] pinctrl: thunderbay: comment process of building functio=
ns a bit
> [PATCH 5.17 2/2] pinctrl: thunderbay: rework loops looking for groups nam=
es
> https://patchwork.ozlabs.org/project/linux-gpio/list/?series=3D280568
>=20
> Patches already queued in the:
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/=
log/?h=3Dfixes

Ah great. I hope this makes it into Linus Torvald's tree before -rc1 is
tagged. Having allmodconfig build broken in release candidates is really
annoying.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--cjsjiwuxzixw3igt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmHmbNUACgkQwfwUeK3K
7AnNUAgAgHzz/SgfR7j2eiD1Ic6kE0q813qaEon2wZzziAruRMw0+1ozxP3R+/1Y
kvhnHM2qe9edHqYTPLrsAz22A93vljcgtdFGiTkDRFCh3tkgRjNzpwNs88DkUiUv
9WuD1Z9WKHfWHO+tcpnSaVSEzAC7hzME4sVfzDJsOsCVIUIlPADOfPn9A6Dwl91z
+Cdo4prK5AD2bWsSLt0io1KhsXY1+OCZzsc77V7fdazjiJ/IA70Qg3brYWFu9CIL
MNoVZRfhBnTUqiL0ZZ9BRWOWrRp0ViJZZOhDRxH5lHvYWeFGU51f/tyatBoh+SNN
7aaUG9JXKB7myQLkm34DM6HWobEulg==
=EKGD
-----END PGP SIGNATURE-----

--cjsjiwuxzixw3igt--
