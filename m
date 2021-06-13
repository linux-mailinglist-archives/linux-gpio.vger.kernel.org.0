Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95DA93A573B
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Jun 2021 11:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231190AbhFMJW0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Jun 2021 05:22:26 -0400
Received: from mout.gmx.net ([212.227.17.20]:45219 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230255AbhFMJWZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 13 Jun 2021 05:22:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1623576015;
        bh=4aeYiabSX0nj7F62pRc9fqIhD9O/lda/PM4X2/aALEE=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=bxtIl+Jwm8MDim7+aGMLnj9IuHOdm6ToFc0kfoVdM1kEI29zH509VhMB0nJ5S4One
         27eG51HJZIs9OZu1s2SN0fmBL4GCsXVEfVE4LVRhRZCDpIPxzeO9OBJnYUHW0FBUtM
         EZwggSXzXUHpyfCq+N/iX1D23jSqak9jU+FL+C5o=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.247]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MwfWU-1l8W0517BS-00y8wI; Sun, 13
 Jun 2021 11:20:15 +0200
Date:   Sun, 13 Jun 2021 11:20:12 +0200
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Joel Stanley <joel@jms.id.au>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>
Subject: Re: [PATCH 1/8] dt-bindings: arm/npcm: Add binding for global
 control registers (GCR)
Message-ID: <YMXNzHv3Fvr+X/XY@latitude>
References: <20210602120329.2444672-1-j.neuschaefer@gmx.net>
 <20210602120329.2444672-2-j.neuschaefer@gmx.net>
 <CACRpkdaC8jzzE=9TSs-eRy3j3fk3=k_xhgjPXw7DW=rK=Csx0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8X9q+WG9BCh5yl+O"
Content-Disposition: inline
In-Reply-To: <CACRpkdaC8jzzE=9TSs-eRy3j3fk3=k_xhgjPXw7DW=rK=Csx0g@mail.gmail.com>
X-Provags-ID: V03:K1:gKrhXXiECnwjKoe6Mb7YC+Nz/AqQK7EUnsB+yuLGUoAFaX2oU89
 bERQOcRQudZ0FrVyunZiyldjS/NBYv583TKA7hkR6cPAllbhZaqjPqtsKPGsopoBZxrtdDv
 6C+BOLGAyG4k1Wq/a6OuB19E0jhWqMvBlFLTJE93Rq0jNRZnYaWAKAAenlPYj2Fx/oZR3CS
 qMF6Iw3RdvwOxuANQVcvQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hmIBtzr6924=:4izV/eysmc+dyImPz1M5hZ
 6mE0WuB+pNcgf+DB7uNBKIJCDFaK7xwcl07K2Zkl6zke+1rU1R3DD8n18Xo7do9MDz1X3EmwU
 Jxb2kdZRd5XYOxgBi96eFM9sfzrdEov7uJ1T+TIUXHXHpfOcWPpO1vS2tQ2C1gObkUHUhiI25
 wVdI1KkluSka50dV3dpAVgbR/Y6rl+N9OtaWLhQAfE542v1el3irqXkw39N89McY8iYHGc7cS
 kYf5mq/s+x3xsCXQTv3om4vyifTxWsQJ3HXPynK/k9NwqBFqbHqx077q6MwQJ51sxfCdvR5Md
 +z6HiM/plcv5dmgQOOKYh+o5VCdMCMWX7l3Ve/ylJTeBjIN+mCq7V3N5sJQ86wwABJf7sGuEC
 dL+cg07ziMeqOVMcSbBiwjr70f7bXyXrEk3q8HgDNrdDnzGelvq5DFJYXRkiSsFXLSiN83rXk
 DduNDCTSRaQEMi1jlqQtyu7Im3yEjkQKpGIyPAisMPSvJctyxp3mt8UIo2UADSSvAMljBP518
 PcHfKnaY+EqHOAsTXvn59CrG+7rAsFKgV1CICMgkgd4tdZr6PyMgvl2odUBQhNwcNx2uGZKoc
 rdPoxuuVeW7uCbj4NL6OD2oMl+q7tUIAh9cP+Wg4Esx1tHLAnSdgH70YTQYJ3Raqlv0LybTPK
 FCGpR4bVS78icgEK9rbVW3n7zsxaUIiL4sUlVVaeaJbfRnXvl8WO8JH500kjOIqtlg5nm0qJ3
 x3OyzbwuqTouSVodz4mZoJIKoMYu6XAHS0O+LDFzxOHPLu6/O3Da7XsaXVEUxRD/9sQ5XDroB
 cRMjgb03rHPKfP0L8JYRjot1I5JWQDjBR8Fj2V9U+HurA1Duls9wpMi6VaTnY6iNDoYFGp2rw
 cAgnZurZAqFdso12csuhfcbK/7Jz89nikSqqkT27WPcmRaAkuchXYE/6dHDjlCwgYMtTBYiVG
 CFLPxkunAcfM5EymUvApCtSMXX3uD5b1nRobZBQy5vKY3aCOIxYBNPtFBhhgRHQcT0NCgXMhd
 RsUd+fdHUcAlOhgGyYZ2AbZ87+OzwIOCGYnjSEctdPjzCX66w2o5Hat6Bxb3Mj1ed11DQDSve
 R80fYBFY0+1vxiBBeCOwLI8xmqVqAF4DD/yzC+8PX/5lLdxnjC0rJ9IBQ==
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--8X9q+WG9BCh5yl+O
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 04, 2021 at 10:00:18AM +0200, Linus Walleij wrote:
> On Wed, Jun 2, 2021 at 2:04 PM Jonathan Neusch=C3=A4fer
> <j.neuschaefer@gmx.net> wrote:
>=20
> > A nuvoton,*-gcr node is present in nuvoton-common-npcm7xx.dtsi and will
> > be added to nuvoton-wpcm450.dtsi. It is necessary for the NPCM7xx and
> > WPCM450 pinctrl drivers, and may later be used to retrieve SoC model and
> > version information.
> >
> > This patch adds a binding to describe this node.
> >
> > Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
>=20
> (...)
>=20
> > +    gcr: gcr@800000 {
> > +      compatible =3D "nuvoton,npcm750-gcr", "syscon", "simple-mfd";
> > +      reg =3D <0x800000 0x1000>;
> > +    };
>=20
> gcr looks a bit idiomatic, isn't
>=20
> syscon:  syscon@... better?

I think I'll go with syscon@..., because it's the right generic name,
but gcr for the label, matching current usage.

> Nitpicky though and looks good to me either way:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks!


Jonathan Neusch=C3=A4fer

--8X9q+WG9BCh5yl+O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmDFzaEACgkQCDBEmo7z
X9tLtw//VMgWu2B/K3UESUNI1pfH+CK6F7TOG0Yq4L1wJKPrWvwZ67SkjbITSMNb
GmkRx16/lrWhOT99XX0/ZxgKxQyEXj1FSJfOM9bs8XhmlLNvVtjdL1TkLEDTX5ll
ZnR4tymLwStGv9pCvmcGKLFYui3vb0PQ/SiieXzK4xryMvTrxUtvA5amNgf2Vulv
LTu0QK+G4qFE17tlH0m885njuM6XEdMFHDXhye/uKWY41/7Il0h4mM2WGi/bUZAP
1AnRx+m8uDkz9ckl2fTrnJowwSJHB2Ql22JvRX/hjMNZsqyvlNZPEIMrLHIpXLaR
KePUhrtN7PpKYBStaHRvtgcx1xTOVDTRri9OWzjjuXSBYVq5yVp/kYruyGTmCO8G
UQcUhZskqj2jXIa04OFjc84o2rBl2+Yj2OIxJvpx2UY2aVkZE3b1YVVRPZiyijZ4
XR3odEmCMna6F6ew6NbGZi5UV9RhCqFcI+AKh7LtI5KbydUw7sWLjq5FV4yYXzsG
/V/gBCt/i/nRuMjJp5QQtMRc38v16hgAdyHNj1nrIf73VodraYelzanIUnE4MJkv
c4VcIbDufvnGXvKyLvoCWB6cYvBOQNtsVAfXuFluieV46cYLgVTZiwtNjkw0igwv
Jp7lODEYkyPb5c1v3cAdJin5rv1FZlV2C38aBuHloZLfN6qK910=
=aXV9
-----END PGP SIGNATURE-----

--8X9q+WG9BCh5yl+O--
