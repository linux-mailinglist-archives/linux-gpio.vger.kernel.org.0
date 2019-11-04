Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29979EDB67
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 10:16:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728188AbfKDJQH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 04:16:07 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:33892 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbfKDJQH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 04:16:07 -0500
X-Greylist: delayed 411 seconds by postgrey-1.27 at vger.kernel.org; Mon, 04 Nov 2019 04:16:06 EST
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id A85DF1C06C5; Mon,  4 Nov 2019 10:09:14 +0100 (CET)
Date:   Mon, 4 Nov 2019 10:09:14 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: gpio: support multi-level brightness
Message-ID: <20191104090914.GB12355@duo.ucw.cz>
References: <1570203299-4270-1-git-send-email-akinobu.mita@gmail.com>
 <55a5ab0a-9a34-a7b0-cffe-9dab59f2c0ef@ti.com>
 <CAC5umyhqL7PdHXaiD3cwvpxY=a_wCYh0xbgkbS7Nx2cra-oxVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="hHWLQfXTYDoKhP50"
Content-Disposition: inline
In-Reply-To: <CAC5umyhqL7PdHXaiD3cwvpxY=a_wCYh0xbgkbS7Nx2cra-oxVw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--hHWLQfXTYDoKhP50
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > On 10/4/19 10:34 AM, Akinobu Mita wrote:
> > > Currently, GPIO LED driver allows the GPIO properties to contain one =
GPIO
> > > phandle.  This enables to contain more than one GPIO phandle and the
> > > brightness of the LEDs is proportional to the number of active GPIOs.
> >
> > How would this work with the Multicolor framework?
> >
> > We have not adapted the GPIO LED driver to this yet so with this
> > framework this patch may need to change.
> >
> > https://lore.kernel.org/patchwork/project/lkml/list/?series=3D412400
>=20
> If I understand the multi color framework correctly, I think we can add t=
he
> multi color framework and the multi brightness level support separately
> into the GPIO LED driver.

I'm not convinced we want to support multi-LED framework.

If 3 GPIOs control one physical LED, yes, we want to support that.

If the goal is to create one virtual LED from 4 physical LEDs arranged
side by side... I'd say... deal with the complexity in userland. It is
not critical to do it in kernel.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--hHWLQfXTYDoKhP50
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXb/qugAKCRAw5/Bqldv6
8uCiAJ0c/8VKrUWpWML4kwrpQAMv7Y1oMACggxlri9K1K38fiTorbrhYaMTUDfY=
=D1C0
-----END PGP SIGNATURE-----

--hHWLQfXTYDoKhP50--
