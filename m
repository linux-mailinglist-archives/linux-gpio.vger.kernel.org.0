Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3694888AD1
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Aug 2019 12:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725884AbfHJKfl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Aug 2019 06:35:41 -0400
Received: from mout.gmx.net ([212.227.15.18]:51459 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725497AbfHJKfl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 10 Aug 2019 06:35:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1565433335;
        bh=Qwz9cwXiLX9NP8x0F1UleAr72SwbnQ2lE1Rc4ZXWLgI=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=g8r6eZxM5x2OjTNjTlXy44KiZC3MAoDBJ6wIy/AiVJw592yeBzgr9l1obETigFxh/
         EBP1C5Q/9+Qhor9gUHpX73ctUCZb9GSu4WWoAhlDrllHQq7hwCqwRqvmlD9NGzmm/Z
         Bfciv+h65finv+AdrsRhzJMvgyMKpnp0ZQ+bL0Zo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([109.90.233.87]) by mail.gmx.com (mrgmx001
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0Lx8vJ-1iPD0344Ov-016cON; Sat, 10
 Aug 2019 12:35:35 +0200
Date:   Sat, 10 Aug 2019 12:35:23 +0200
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH] gpio: hlwd: Pass irqchip when adding gpiochip
Message-ID: <20190810103523.GC1966@latitude>
References: <20190809140005.11654-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XMCwj5IQnwKtuyBG"
Content-Disposition: inline
In-Reply-To: <20190809140005.11654-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Provags-ID: V03:K1:Uj45cNtKf+sIWuub11sp3K9JmUffi50GftZXepobJz/unOYtuBM
 ClxtGla22LgoKzrh7+jTpure0yxKNacJLphWt8zLoCcHWugeHhfai/CAm6AaZzjKMY/LRtz
 oE/RWHOn/bC9EoeE+Je5MfRu0vgXPYdTHqwR5T0g25cHsY4w7KYvvFrp7LWZRUUCer/xzaG
 eFFunmhynKXJ4GBPZgAfA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:CngFCRjGBdM=:AsHolo3EvbudHD8TPblTov
 NGHm/zAPPjP9zhNomLTAVjJiigxY4hnU8l2KnZixDU6CzdV53OJ7ThQU4VKIfDlZd95GPC67B
 AJipSB4tymoj7nFZlwSd9EQtbADHo2bTXU/lAckjRBbD/4+/agiTMzT+W3MRUF9tnIReMo6Zq
 AQ+tKHog0kxQ87tbhtmGiqEk40TvAM8FMIGpXBTStULAFHEYjap54HUE+bvoO4l60RnSHsrSX
 bHJAzDeRSV7OHiALNtBECwKTP8dNtgIIRmlQXjuLdZwvRuVBUJSz/jA9ORDb5fq8ftfSyNVAA
 5QwwAPsBWtvGC8TXspPJuv9sQ4YpgVlSTmvZac2LvVPAuGBK46DjBVnUUL8+GnTvPdxW1dHsu
 Wo4F1JFB7LrzBmvQsU1/UiiDcmI8CklmYX+YKF3OcJzXU9idLZodl/1SsZNg49brw++aFxvwl
 2YVVLH49d+A91/3Sj1/JXX4P0sgNTxVaSwa2iAiWBImZ3iK8FH9qDkSCDIx5SHSIW7GvW8JSg
 GvHwripdMbbKf9aBwcZvTVYexzQf8GqSyoUhTz6/CP+AlSzJr4CKM3cwSK6/hpMlb0EpGDQZY
 ZHGOnlgvM8X5ER0Fr2gON7WxguLeP2rLnS1L7x4jd2jVvgYY0FkXEXexY8OaKQfp3YSruCu6r
 YwX1VrDXfHKpFVjHT1B19nBonlQSsXZEC3pILjJNFppvaG421pVOYb4cStaNdxdUj8in6XnKj
 YrMfJMBm4F3w92RISnwjwmfe0ld7ihfBZeopzSWe2yhn0W3b4s0YLlT+QKN3ItzkYQQ6yBLWI
 vZChJH93F3q1HUG5cGrOgYoGwqUijFRlibD9yuC+Tof451MM09HNNaDcxxmyv/RSJjmjXXA7p
 26TeOL6g6WMKLinyVAEsKBRb8eepOaB17dRF1K0cvvUx3BF/3TCxLr1UfsbtWWhFWlt/8O8EC
 BlJ+kVSY+ra1Q6dU00NJAkiEbJCJHhy53Q4tw7bvQ6UoTxVztIA3z0Qw4jjUe+vy0xLZe8rmv
 rT+V1+xVOBAW5/Yw+IjMJDlBcf69OeTeVq+mT+qrmr0WKkL6yJvmTYXhNbwdHoRo82dijdFXF
 iIs2TcZCGn3rUqmJf6rR5IDDUSg1OiqT5xbgLLe7uF/XkWJJQ8XaqxaSA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--XMCwj5IQnwKtuyBG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 09, 2019 at 04:00:05PM +0200, Linus Walleij wrote:
> We need to convert all old gpio irqchips to pass the irqchip
> setup along when adding the gpio_chip. For more info see
> drivers/gpio/TODO.
>=20
> For chained irqchips this is a pretty straight-forward
> conversion.
>=20
> Cc: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> Cc: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Unfortunately, there seems to have been an unrelated regression between
5.0 and now affecting the Wii, so I can't easily test this patch right
now. But it looks good (esp. with git show -b).

Reviewed-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

--XMCwj5IQnwKtuyBG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAl1OneMACgkQCDBEmo7z
X9tUJw//dV5uJf37rziXdqjQ0jqrFDmH4Vm3uM6w8r0m2NUOQTlqOB3ZZpxhANgB
Ha6z/7nDhMKRQaZNmcYSWKOcFKShgRdcQKoZ5M74HSyFCFRw6tv3lOTfitRGc4JN
TAvQ4VFGWM0mAyzm6knBw3HWtUdTK63h77rH20FTquqJGYIIfa1wKSNsQ0dmqeV/
1BSi29yYYIpJcUR2sxDmNJNBsfFtf38YdRD/bmeKSZAu81Xb39HgbAoGlpH8m9lN
Ocxlep/DaY0q2OaGBLBBoMazTlQRO2s/aQ2zAN+Ph4FLPEABgj3XWLJuynf4Uu/b
EpZ4TTahqqOUIYa8WheAkFnQDCU5qPW1GD/FRu7QtmNtGyBbaESqQRXMCbR5GRMd
JgqJ2F42gy/LfFN281mmmqTRLv6ku87H177gn0lzvdma0o0f5LiPwFtI5RBHXIRL
J3qrxn57mdaGkXRXmdPeM8gwqbdP42gQrzaxZNxp/bH+PoSE4u/gMfaC8+5ph9WC
DqHvbEH2x1HbZ7jiAtwIq/kGug6t3+0VbkNZOKetQb1i8nOS/8LPRvxQgVXwepkA
KUA6zRVNzLgQtNTWNK1T6Uvv9FaIBGHdxYDIcO2HFvXhb5w8mVQpfyYHMVB9JC+D
Cv2Vu8JDzsn1TQLdh4L+aYM/2ZUtKiT5WpZHKBUC1DazkGuW9mI=
=lqiS
-----END PGP SIGNATURE-----

--XMCwj5IQnwKtuyBG--
