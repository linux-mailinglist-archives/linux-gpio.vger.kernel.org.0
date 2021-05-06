Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4BAD3757F6
	for <lists+linux-gpio@lfdr.de>; Thu,  6 May 2021 17:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235231AbhEFPzM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 May 2021 11:55:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:33372 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235136AbhEFPzL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 6 May 2021 11:55:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C6B55610A0;
        Thu,  6 May 2021 15:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620316452;
        bh=3cDNvuD9KU1PpzpUQmY9KlttPCy/ZUYq/znJ1YRrs7s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uZBGfJvrZwdAAGt3rnHXrQWzCrcdkBZT0JRJZrSkWeS7qwPCRf+meTV7trBvdmeh7
         mLEwC4LndCFSiqO67bjR3QIbommxma/nXXWj+u5JyugK4VBg5QCIIHuQmikvRdPsKR
         CsfvYkbovQDDa19ucwU4vuh5dnPgTEH6hI63u04udKsPXFugggwKJSUAjWG6tkcdGn
         HCz/4riZTEdumAs0rpTOCu28+u/O0RUzDYvabs6Sc6+hynUsr+pMkukj+JqEAdt+Up
         c2F+vqmZ0nXK5Te0BcGeMq73NdIwAlJc8gUCAGi66Phkt503luWGaWtZatj5lkGegn
         7tvOJBVBVNVYQ==
Date:   Thu, 6 May 2021 16:53:35 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Michael Walle <michael@walle.cc>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/2] regmap: add regmap_might_sleep()
Message-ID: <20210506155335.GC3377@sirena.org.uk>
References: <20210430130645.31562-1-michael@walle.cc>
 <20210430151908.GC5981@sirena.org.uk>
 <df27a6508e9edcd8b56058ac4834fd56@walle.cc>
 <20210430172603.GE5981@sirena.org.uk>
 <128a6d51af1b7c9ed24a5848347c66b9@walle.cc>
 <20210506124342.GC4642@sirena.org.uk>
 <5921b32058d00a1bffda82b72286db09@walle.cc>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QRj9sO5tAVLaXnSD"
Content-Disposition: inline
In-Reply-To: <5921b32058d00a1bffda82b72286db09@walle.cc>
X-Cookie: Is this really happening?
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--QRj9sO5tAVLaXnSD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 06, 2021 at 03:35:26PM +0200, Michael Walle wrote:
> Am 2021-05-06 14:43, schrieb Mark Brown:

> > Surely it's just a case of the device that's creating the gpio regmap
> > setting a flag when it instantiates it?  It's just one more thing that
> > the parent knows about the device.  This doesn't seem insurmountable.

> No its not. It just seemed like it is way easier to just ask the regmap.

I'd rather cause a small amount of hoop jumping for one or two users
than open up an API that feels like it's going to encourage dodgy usage,
there's already enough problems with things like regulator_get_optional()
and this feels like it's going down similar roads.

--QRj9sO5tAVLaXnSD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCUEP4ACgkQJNaLcl1U
h9A1Swf8C0PxLVkatS4C5F0XnBrEZICyePH1nDUAKWLrCPB1AHvxbvV6zjtjpi9v
ooZtjHPHPuHyvqwKe7VCVk8RFeAvKAAbnCScqLM4mz/DfVrdd05rkEw2f8kkw+eE
eT3zQVe7ghB5oJcaZwR5ngGK6zI/ErnDGFAynhNoQeX7uEDUDgqasuvsm75KvsSp
89uF38y35FBpiEF0EPt9zPR/FUZPy79fBZ+7Ug/OJO5MlvwHf4Kc49hlhp4A07hx
afwUV3BfbRU5/m3iV8FFsnzkczN1SGcKlQw7rESbjMPqV4UCYvqTNzrif0/SWuVe
kA2O66f8RjLZjKp5Ke02e8UZitFMjg==
=+iA1
-----END PGP SIGNATURE-----

--QRj9sO5tAVLaXnSD--
