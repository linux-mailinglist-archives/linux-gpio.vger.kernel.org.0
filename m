Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D615D2C7BA1
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Nov 2020 23:14:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727897AbgK2WMj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 29 Nov 2020 17:12:39 -0500
Received: from mout.gmx.net ([212.227.15.18]:59911 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725950AbgK2WMj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 29 Nov 2020 17:12:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1606687859;
        bh=iXkhSMriV5maLLXF4ec2emP2gdExku4QakTNWEWxKUk=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=XDpBE+Ncm04FRwJ8vuODrGgKLku41S/SLjyJKexDsg8yKXkkz1nq4E0r8hWZmkYVa
         sBpJNwquAuFevwavdDte9KcxOQtU30m39ANkaqQ28WzThFVrCaEZIdi6bBGkog4oqh
         NxDUHpDDQvRiIFnkufGLiPnZYponASPII+rH28Ns=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.162]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MdNcA-1kARCk3xVg-00ZPKJ; Sun, 29
 Nov 2020 23:10:59 +0100
Date:   Sun, 29 Nov 2020 23:10:50 +0100
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org, mst@redhat.com,
        virtualization@lists.linux-foundation.org,
        bgolaszewski@baylibre.com, linux-riscv@lists.infradead.org,
        jasowang@redhat.com
Subject: Re: [PATCH] drivers: gpio: add virtio-gpio guest driver
Message-ID: <20201129221050.GH456020@latitude>
References: <20201127183003.2849-1-info@metux.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rV8arf8D5Dod9UkK"
Content-Disposition: inline
In-Reply-To: <20201127183003.2849-1-info@metux.net>
X-Provags-ID: V03:K1:3k7JLc2Hawk0Hil86ZD/XR/DnpRxdu29H+22sf1XPZsO3A3cFlf
 SxQ/j3JYOOj5W/6OrAzXx2V3O076zc9+NrzDyDM8AZ8wqGocU5aewHzEQInNuo92+4UlsDD
 B+dmWGwciIxLEEEY8/RzK2w4ZvuG/ZUrlNEM1WfjP/lYlfRxEUuSgC0+llkx1LTYcu8lE+t
 5QoHc123fP+9CRYN/+MfQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:PPw4bc4Tusg=:mupDuzXAshUvS65GdN+8BR
 /rLiFI9/5Z0tUqMq/dJViG9x/bF6MH+06xhtAoJa4XdVbdXG9tF0yqZT2SrwnWJdWJc0O2V1y
 /8orh1WzXNoHT4PDDB6CxJr5GN/b9oPnZxkL15TSkf5daQMQuWAhJxE+URDXtXg7nRXI6yg9Y
 OHO9ZYljwUriW6RjUL97GZi3dfGfFTZ8LLNNqfy4MZiCC6eed4zuXrSMRa0Wmu3lLZ9Qozhcr
 KlO/RYtp7kbxVsi2EBOxH0qDUytd1D4dbAILaedAkTzDzEz+IpJ7q50RPYzhJti03COA1W7Vz
 H+FtdxZMc7y6Zf6sGh1m614l3EMkplr9YWk4fPWjNM/SgO7x0BEWzdg1ShVOM1uw9dBeaXZor
 HAIhZ8O1zZ52a0Y9dsuZkDLUwc4ijHvM+zvdtNCyMcxz8MFHbMz2sDfNw6voWfYJYE3oskXS9
 j+jB22Xgo+tFP2Goi23ChJgRfVkrpjo6OruoCK9JVA11U9YvcWkYQ3r/t0Xaod5Jlt22SOkRS
 +GTlzhdh6mgjtkXssxIYHDfFcn0+nIcmfJRXr+8SYreTE5WlMpasDD2bwINEp2rjWpYwYAuKt
 vU15CgqAhGOUGIl3saac33BVUO6+cZG9QIAoA5FCKsbdrCrJn5ue/PrMh9fcCzhUsuyDS4agE
 5w27uuRB/sM6SaHV0nk0L0PlheUy+BU5IZuhmB4OlEhluox3EGWNXTxWkSreqkGidHG8uj0cT
 J6uRwXLBB6ahsp/+cWSb9xQ16VzOeBv/23hmvrlbFvMPiV8UgvnvwTS0DjEUcN8+/h+5tlcpy
 E60TDZ70kJKQCg/v1fJCS0aVHce6fgkz6h7atHTyw9of9lFauyayNnkf8vt28V8znk0nTVxJT
 SwhCuFdz7xvXV2yUt3fA==
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--rV8arf8D5Dod9UkK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 27, 2020 at 07:30:03PM +0100, Enrico Weigelt, metux IT consult =
wrote:
> Introducing new gpio driver for virtual GPIO devices via virtio.
>=20
> The driver allows routing gpio control into VM guests, eg. brigding
> virtual gpios to specific host gpios, or attaching simulators for
> automatic application testing.
>=20
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>

is there a spec of the virtio-gpio protocol available? If so, linking it
in the commit message and/or driver/Kconfig would be nice.


Best regards,
Jonathan Neusch=C3=A4fer

--rV8arf8D5Dod9UkK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAl/EHGIACgkQCDBEmo7z
X9vgjQ/7BGdfYQq78KeC7gpheGKolr7itYaIjyPeiwVUbLBnd98RdTr2u5bLTMJL
bcE7IrgMjDos6NW2AvHqwS/n2McBo07w3mW2u0CcWPNn2T31cgjvMRPacVpm6SXk
jYQ2Y9Yu/12fBWd6Bqp/GZH7brS00onhkkdjwpLJ85Kmj4T3BtPDVdteSgNyNQ+9
q0T06QDzgstQCOUN8Rizjfmm/kP62VyV1H8fGeFIbqWyChIeNy3CpA1y1cNH2YOx
8Qfot8iwWzAWjSHsYVZk5Nkf+4kV4/qVRNbVPvAhPBfge7zGJfwEmAmReEND4N4d
6TOeEmEPDNLPHv3TynOtUWgGVB4RFblVh2PDqynP5cEvF+m7zhv2ZN14hJL8R146
mPCU2pfEldzCloaiYEquriAXG+fTc7872OI7eF3oSzF+UyEs0HuZpsYZS17TVbhi
cNT1JZ2unfZmcFOM5Xp1J+VrJ1zYGHp+9EPTX8Cp6DEDG+HL5zxv5Vaa7tjrmmIN
7krg65s3g61Jo839BQQlJtb8P5BLU+RLDQYpiBS3X2YR3iCqCH4r3UWQyiRl3tcn
Sa6qNES5SHMhTXWS8FFCelolQei7XVJ19aqN1mtz+zSS85I5U1kxbVOuMTFLgzu3
K34XZBYz5Gj7Glv1uIF48IifPI5UVo1wlUy3roHIGBh36W4+fv0=
=SCq+
-----END PGP SIGNATURE-----

--rV8arf8D5Dod9UkK--
