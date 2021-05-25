Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B58C38FB99
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 09:23:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231575AbhEYHY4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 03:24:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:59586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229963AbhEYHYz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 25 May 2021 03:24:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B9BFD61419;
        Tue, 25 May 2021 07:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621927406;
        bh=y4ikNb/ViSQgZNMZnW1LhEQXIkR+0dv/bn5f46qxtgs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Shfx5v7WOZtj2KfgKITq76KYV90j9vFvz60XpbnHc8vLS/SC+dhPQkd9VOpNexCVH
         u6QeKE1tcDUXOadTq0auNkCrzdcBb0tOVMG06X2Rrym8qGNja92nZ5mrG2GbhoAzUy
         V51cDYwfARz4XKpqpYvQscUnOCXkFg8l+qGTkKExEdYF9paXdZHKLTv3u+TheWUQ4C
         b61gH4M9UWesOGOGIF3b2TTc5c9k4kYIjPAvn4R5Ddn8FSt/cJNocsqV6XnJ2Ig2EM
         F1wOhoVZteFTjiHRIN+tZLXVFJxxfv/YBUdMiqWDwzsszU9XCwrN0JSoT14JaPEl/z
         KZWxUMnpXvwCA==
Date:   Tue, 25 May 2021 09:23:23 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 07/12] pinctrl: renesas: r8a7790: Add bias pinconf support
Message-ID: <YKyl63x7lIWaG57x@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
References: <cover.1619785375.git.geert+renesas@glider.be>
 <dde6e0b36a4e4494039a3466df208b5ec5c594ee.1619785375.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="RHDWKFLuLHEbLYX4"
Content-Disposition: inline
In-Reply-To: <dde6e0b36a4e4494039a3466df208b5ec5c594ee.1619785375.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--RHDWKFLuLHEbLYX4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 30, 2021 at 02:31:06PM +0200, Geert Uytterhoeven wrote:
> Implement support for pull-up (most pins) and pull-down (ASEBRK#/ACK)
> handling for R-Car H2 and RZ/G1H SoCs, using the common R-Car bias
> handling.
>=20
> Note that on RZ/G1H, the "ASEBRK#/ACK" pin is called "ACK", but the code
> doesn't handle that naming difference.  Hence users should use the R-Car
> naming in DTS files.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Works fine with the SW-keys (SW2) on my Lager using the additional DTS
update you sent, too:

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--RHDWKFLuLHEbLYX4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCspesACgkQFA3kzBSg
KbaPrBAAqMyUb+Snr3LDSxp2WhngtasqM5OGxNoUth8ZPHm5zrb0pEPdSaSX9Pop
g/pl1vohypLAyHYWivPX4q4lRIvS8Q9a5J/Y8EUOoD7JlPYHAqKDTr321FUOctqV
UmjduxHeRlzuYEVfin+PYJkHcQigpTHani0WgqnnGP41FbPp8I8dOeZo094BWkzL
vbYK7b6Vk1tJQHSL61/IKOk9ZQGCpbL0qqjJgTk0pEyPPZEaZavCUccofXiO2TbY
11Y+Dzh/rOxnxiMN+VcaVTKjSsSC/tYcpSuaoL0598jugA28FcjCIOe+543pB0M/
TeAUVV0oXztDlyJElrk9oWOPmzdiwureYHvyLWbuMptkh/Jr+dXWMjMfHcE4/j+Z
SGLAb9rwB2Gno8063FT1Je87+VVTJPIP+2Pt3YrT0YKewS7SgrgQYWgmGAnpRADH
hjoVwJdWOikbhqMowQUqTlUSaPZzMttXaOqHt0sRIeHo3sodMAhQejvdpWygsIb1
rsO7PINj7Yo/J5F9pLP2n7kmJonRrSmxnAWbCwCp5EbhRYc+DNP08//sZ8xAOjiD
1Lwx3F7UNvzodl/PQAO/M2jszmHb95RqC1/OKfTMWY6MnhESZhYcn1yx2KwcOfUT
6p72V8vd/AY0lOlfToxHZ2P57QeNPBDlGHkQFgWR8ru0Y+IXraE=
=q7Rz
-----END PGP SIGNATURE-----

--RHDWKFLuLHEbLYX4--
