Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5695348FC5B
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Jan 2022 12:36:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232797AbiAPLgY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Jan 2022 06:36:24 -0500
Received: from mout.gmx.net ([212.227.15.19]:34161 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231831AbiAPLgX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 16 Jan 2022 06:36:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1642332975;
        bh=yArVd2y+QloUVqpHJwdLbTLutZn/N2WuJmw4qOoeKmg=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=c3uy7gJyLFa7qoBdaRx+uRKmmlyHTEjsQdCFnEkixbLsLEnaRuzoGpRKrQis9mdSP
         1v+jAMCH8GQW77LzZDnzlWbkEtxVSXd1+IPHza6tw6+htRChj8ccsxTb55trY1EM7K
         PE3N32zKaKiozWN7X/U3rZW0lKhiGQkXaQfERc1Q=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N3siA-1m9hpn1gDQ-00znul; Sun, 16
 Jan 2022 12:36:15 +0100
Date:   Sun, 16 Jan 2022 12:36:13 +0100
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
        linux-gpio@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Benjamin Fair <benjaminfair@google.com>
Subject: Re: [PATCH v4 0/9] Nuvoton WPCM450 pinctrl and GPIO driver
Message-ID: <YeQDLRBDafzTKXPn@latitude>
References: <20220109173000.1242703-1-j.neuschaefer@gmx.net>
 <CACRpkdY+Jdn_Yr4BpuXssTn=6wjDPm9mMgz3yrjVGw8=UzKbzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="x0DaVw9Jql4z6Lcw"
Content-Disposition: inline
In-Reply-To: <CACRpkdY+Jdn_Yr4BpuXssTn=6wjDPm9mMgz3yrjVGw8=UzKbzQ@mail.gmail.com>
X-Provags-ID: V03:K1:LuUfhoRkTPENopn4o9FlwF6x6Xkhjubdmhu3bJx2oomQHxSdinM
 i3sXRoE/h0iPl5R4fmSJkoiE8QUH7HJa32A2Y5qsoCc59AToumwHl7LAAxI6cx9ewnQavGa
 215AnLYLItrBWLfWRlW62UBj1BI9wbuRNX9yvtAwxyUWu0kOF+pCGBANvtrveeo9KcVwYZ8
 KaHZefaS7qikcgnHoz+9Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5eVjnMbRbkM=:4dP7m+fHr+Fidlr0O6ydFu
 K1WiAAzjSRcBy9CwjdKwRC4bfo0zRag3lYRx4t6tjHAKfc+plgygcNjyvLXLVv7LfXGLeDa7O
 KNdxaih9yRiTlMgGMLngXXbEE3cy8sW+LWqTapbHSGuH9Smhe0KeDJ79ziswJBr6lrK/zrumX
 T/0wbWTulTgVU+S8bI3ua/TZFIsm264mNf9l+oQPgZTj1784Tt+GO6n9PoSIxhJ1gO/R18/Gb
 hZ0oQ4AEGURz+425jDoDqKSC8J8JbIDmZcKtInUuZHsG/vehzqtX6v6XF8GzuzjxSdNBD1Q0l
 nHQ6KoewwInwq5G7ah8lu23IIo7461CLKZfIFMmhf727M6OXvIB42MOJR4h9zJnLeB8qw8bIW
 XIGS0JybRBLQrUbeFQovTvdTvOcaWrYLGD2P3DeCi2esmFKWhQF7hglWuAC20NDdb0R3SH7gs
 imDXK6Q411DnDvkCLkCHkVGVNhBmzLZt1Q/YiRjlz12TxYHIAyDGRIhKbDP5MKPK153BOFkQp
 9Nn0tQTa1WSmr5q2xeoRslQuYc3/s5Y1aK52MFf0JhJr8OxYqsa+sxRUPE5qU3nvDyT8ddWuM
 bNBHbSdhfHPIWZE5UgFO6N3tZzv9OmKgDyefeuHOsrbIZP7TxdCX8ssWVTP7I4N2h4HytS1jR
 7TOvyOQsV5Wq2k3C2yGbO+vK/W3Mcf6Pq03v23Tw56olmFisD14E/BK8OBPGvGvSNHa6YxXND
 gS1WGrw1hka5VAnCUdS4Dw9dYDrMB1n64gep0+w7QKl6LrlV2kM6eVrgbBmc4RTohPbtzPu6I
 WRLJAwdpVQjdV8QEHTak4BZubagu/BQIVSYi2rRzOkwtqQG1nnrsg+C1N2g5Loe1nYnnHd7Jz
 /HeTtT1GKurNSU0pVXpZPLd6bi49E6A8PEaRu/EkyhqDEjtZ8XXFApXPX3Tz2SjwJO4qjV6py
 BlD0/cIwGHRaDuWKOBj69Km1cI7Dt3ZrpZvSMhytUHIwbeHgjUfGRIxriHa/jC2s5vR6dEuA7
 QqYfvvyOIGZmoYi8N+aySJWuBcn1YoLvohMbb6ldTVN1iJeKvlYUxPfgTNoU3Iqr09HsZEZUn
 ZWPYuJg+GiRSXI=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--x0DaVw9Jql4z6Lcw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 16, 2022 at 01:38:32AM +0100, Linus Walleij wrote:
> On Sun, Jan 9, 2022 at 6:34 PM Jonathan Neusch=C3=A4fer
> <j.neuschaefer@gmx.net> wrote:
>=20
> > This is version 4 of the WPCM450 pinctrl/GPIO driver patchset,
> > with some small, (hopefully) final improvements and cleanups
> > (see patches 4 and 5).
>=20
> It looks good to me, but I'd like some confirmation that Andy
> is happy with it.
>=20
> > I'm targetting 5.18, it's now too close to the 5.17 merge window anyway.
>=20
> Could you rebase it on v5.17-rc and resend it once that comes out?
> It would help me a lot to have a known good baseline.

Yes, I'll do it.


Jonathan

--x0DaVw9Jql4z6Lcw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmHkAwsACgkQCDBEmo7z
X9v7gw//VWK/5uOAbkFizkKUkuBbNt6CD43wp/fvucF8QLiJjiF1JkJ1FWEphSSz
yb662d3B9nHjer5T61DdewNsjUlwHTI8km7/i6m1BKeFGF3EoMt+5AOxVtFFZj9C
n9AtbfdGcMbKwwygjuiSid9MVqrQDpfYctWmUdBe6EsVeOT/9CpRvHJo3dQa4n7h
jfmFggzb9eSEHo8wWK9z1vl+d0q43gYMZwOHUws0VwwEPQTM4qiBtECButL8wylY
yilfSAuJfXtqOKJ+xWcE3ThXVOwFDyQRnec2eUqV/QQDgBOofOHKZ2H+KJ2gvQqE
OaXQLPusfZ6RHTgJJDe6nQ8a5HKuz4Ybi6a7bztYb0fBAbBr4SVkYqS4+SmIMdKj
q/7vD+Ms6NoV5tJgm5DZ0761eytpjMKjZw2KIdHhxqVMQMjxTjvfXFW6OATpkR5I
9u6b2syLRKW+G0T5iGdC39MqtsToD5CFL51Q+hMVqvr6yJi/HjJt6K+b4bl7vMtE
4GSuY88LIhro1pQM4BX2CRDGuM9KjA5c+rPWHJNoOZG2DNL9NGBuc7DUD+mpq4ff
cYyu32B0Y1KRzoDlcabufwLE+G2iQh/u14zVuNtDULEeVn/2qQLdZBakkGgDDQp+
XdHiug8AYO1kan5SgEQuKt+cxArqSTInoS04BOkJaw7OGiaM1C4=
=1tHm
-----END PGP SIGNATURE-----

--x0DaVw9Jql4z6Lcw--
