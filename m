Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFE328A6D5
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2019 21:06:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbfHLTGw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Aug 2019 15:06:52 -0400
Received: from mout.gmx.net ([212.227.17.22]:54691 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726424AbfHLTGv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 12 Aug 2019 15:06:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1565636806;
        bh=Z6qXqbJmSO631WSP8yuXxyMZ6GT7pKNEnSLSDIc73g4=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=bWgawBASvwq9KrcxhRM7AGU0Low+eiuN7YJrpHdXEk34NWOUOm/lvtgHQkFD2a1QF
         rAIkCElPLk944AoxYNP3TeVP2TNj7qr1CEcnCTMQMG8W7UpwU9X0c6ma7vto1LblVE
         xCPC3CkLX2tmD6soryeQ0hDwcgdc2/EfWEtBCgD0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([78.34.97.158]) by mail.gmx.com (mrgmx102
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0LrZOj-1iQZFj0eDd-013PUv; Mon, 12
 Aug 2019 21:06:46 +0200
Date:   Mon, 12 Aug 2019 21:06:30 +0200
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH] gpio: hlwd: Pass irqchip when adding gpiochip
Message-ID: <20190812190630.GG1966@latitude>
References: <20190809140005.11654-1-linus.walleij@linaro.org>
 <20190810103523.GC1966@latitude>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pyE8wggRBhVBcj8z"
Content-Disposition: inline
In-Reply-To: <20190810103523.GC1966@latitude>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Provags-ID: V03:K1:kQW9baZFs8u26zaNWdgogdP9WrjSm81iWIa5GHNb8Iit9Oac3QD
 p0hrLVtb+UeZLaieXX0Y8YYWc1AZd/qC0o0/b5bXHEElDAwH83+GkHbYdhFzq4u6ajJNnwq
 xhv8XNXLGKs0fiEAC+44MPsuahN7+f9m8C8nQ0+39J4XX7BRkvHCW84p9gofl4nokpMFS91
 wZ9HjruNYMd3lKmh/FXXA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ozDkq7XX5JU=:WS/9N4fH7LUKKLugBBSorE
 z1DKfOmg/Oknqnfkf2WEGexFfWxeoUrgrt8HxTlpPG7RwE0HPtcmXf8AdwhHMOTDoTJU2Zl9U
 +d5aaBsflnBgfole2kxdskOcj2mlzzoBnuzY2jviZLFJbbJ/W1FUNi/m2vMmOWPuvsTVmbBI6
 xVErAuA2bb0WEanwTmqT8n8QPKieCW7mbPev7PJrgjnGudcFswmkdTk0FkuqOtEDWPmQzS2qT
 nu4SBQiIHWzhzv4wjAhgt/lDTc8b+Ruv6YrfE41tOwqP3iJJHfje8l1lnDak0ni5UOYegk+Tx
 xXqv9RijcWKeamyd8fIoXPbWLBTxpZvzbUOnzTiJxZt7SrOnFTfrenxD7xMg3pjusjRbwwWUt
 Q937JZUygQ/EOafBfm4piVfZ66j876B9MUYGTV7b7O26DA6Vkl2LoXWlB2iqFzX7lUsO/XXPg
 9NmHdOFOCCw9vIwWZvl/iVY5b1UCYlAUEwU4aBwnElD5EZoP1iujm8PL5cIFe/AMwuIFqLyws
 l70KEirUloHIxaIYdYWalWFUB4i7Yw9FJEKb/U4FmaPQJxqb7pSdsS6ftvsGr3A4/zoaUWIlL
 13LJS3e4V5WkgnGMKXlLgsf3HGyqT0e6aWf8xOJWirL8sJbtRY7gX7px5RMnJh7SfY7KIWBV5
 F0/AraLJj7B4zc2NowRrAZXtd6gaZ9SunxBO/MNIQhHEuXTcxxEjwCKtwPVwVLW3D+LAWK4FX
 tylnaEgveGmMXNWxmgIhDFn2iHIoILOt1Va8nxOP+GmlGLz892lSJDYrzI5PPDktKSsa0C9kb
 Fa0E/RNQ+Zu0aCTemrY7d3gvkKlIk978SMRqWeNcZRVv0ZcAWlvPWfiAeHvbOTLMzfDDt/uk3
 ZYZ6eeh+cBfwqdKqmqXig8fG2BOFr/iaqZ2LcIBSiZ7dgJa6IiYgfYxEVpYMAMGRFev94qToG
 uaP6t0Nl9J1hW/U8//iKnJVNMlM2BR2Hp5kul/WVSv6El4Ny1UaNq2p7xIfvreqnmAgAu7hoS
 4Bk8l4l+YN8NAurOJjpu/R5biU420CmbgDup5xgWoaqrRc9pLJamI4lTcSaX14/5uKE/wBgPL
 w7fIuMPmKJj//leKta9+Mu+7jvv5/jaaHlUuiuRZdCuza5abEBLgzcAmw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--pyE8wggRBhVBcj8z
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 10, 2019 at 12:35:23PM +0200, Jonathan Neusch=C3=A4fer wrote:
> On Fri, Aug 09, 2019 at 04:00:05PM +0200, Linus Walleij wrote:
> > We need to convert all old gpio irqchips to pass the irqchip
> > setup along when adding the gpio_chip. For more info see
> > drivers/gpio/TODO.
> >=20
> > For chained irqchips this is a pretty straight-forward
> > conversion.
> >=20
> > Cc: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> > Cc: Thierry Reding <treding@nvidia.com>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
>=20
> Unfortunately, there seems to have been an unrelated regression between
> 5.0 and now affecting the Wii, so I can't easily test this patch right
> now. But it looks good (esp. with git show -b).
>=20
> Reviewed-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

Ok, now I also tested it:

Tested-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

--pyE8wggRBhVBcj8z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAl1RuK0ACgkQCDBEmo7z
X9udYQ/+ONy6qU97iP0XghG8s3HkazUo2cw7F+E3QRCBonC+rmkAjIe/+wXaOYSH
ncnAjto9wNXFQSKiIBa5VKR/Zg0rLjxOtnROS14SfCRlvUb6TosFytq9e7qcITji
5n4sqAT7WcB+rXyZ5tEneIv+S5Jc+Zq10kmhNOLCRDd0+8bdJJ5wQZad5gQ+troE
amIRgMYWDHAJoVOrT8npXZKa6DXRuW1n94prm7Hhl7puI5mo7WeLcgzArGEGMCNH
y1L5DlUqHL8KJbbjAo0c6HvtzdrPjoCFmBObR+sSdL91On8Lq7UaEq5wpc6SiEKj
Z0nlpBOUAGeBu6p8YVqUmrG+wdviuGnd4f+hUXZdlZlSa6ZCkxqeB5gpWB1tQf5g
UkRlqV1uSp3YbdKUzDF58B4HdMxKq/n6OfOew7z1vTpwGhu5dMohlo0MSLSS7kL7
N50OuIgEkfES/RE85vxUZ5lA+nyWGKvG5HyifeD8fmwR1bGzkikI6fzQzQrc3rq/
yjeEo1SUhhUJq8hQ9AOemtBIcOARBhMJsqLoUm1EgR9QFVw/PaSJY/JA4Dc2qaJV
Pln05ijunk6I6UuBlZztqID6IwH2A/4DpeZAGvIxHllV934Umn5ecH/a+N/7yrOu
bLFNhePBqs+plLWEMHSYhtBxDOnq6fYRTlTkw4TqYlKuisII5is=
=4EHs
-----END PGP SIGNATURE-----

--pyE8wggRBhVBcj8z--
