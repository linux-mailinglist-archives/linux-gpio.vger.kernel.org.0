Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6E593753FF
	for <lists+linux-gpio@lfdr.de>; Thu,  6 May 2021 14:44:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231673AbhEFMpU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 May 2021 08:45:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:38976 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229777AbhEFMpT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 6 May 2021 08:45:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1BF4B613C2;
        Thu,  6 May 2021 12:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620305058;
        bh=ZYYq1/bAyD5Y4EByZaOxo773L78ziclPTpbCUsIZSSI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NStFqnvNeAnQkiwPNoohMf/Ty3XfhD8Mgij9OP2lBTP5mbS+Bg5375VtBN2UO0Mzs
         Sa6wqW5hMm9WIwGKEHCwYJbIvnc9Fz4Dy0jRl9myii3jPs8FoM3NgEiPwOKVtvQxUf
         mLlrPrXFvxWZ/LN2dVj/oJLjyX79+Yy4yPvyVbd5kk9euc2W4+6KFhpKMSYr3/nNyJ
         UwQr52DkhzlzTRLVWlEmLNt/GfWRO5sUEgDlQz5oOJsbYH1oSNsgyqg0MeLq7Dj0PH
         mLzir5HqyuhGiPO8MbO89sTHxI/26n9MjWag26Cv3TO/Vpse/1FfkblHQdtZDtWg7X
         76QRgtmD6zyNg==
Date:   Thu, 6 May 2021 13:43:42 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Michael Walle <michael@walle.cc>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/2] regmap: add regmap_might_sleep()
Message-ID: <20210506124342.GC4642@sirena.org.uk>
References: <20210430130645.31562-1-michael@walle.cc>
 <20210430151908.GC5981@sirena.org.uk>
 <df27a6508e9edcd8b56058ac4834fd56@walle.cc>
 <20210430172603.GE5981@sirena.org.uk>
 <128a6d51af1b7c9ed24a5848347c66b9@walle.cc>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="uXxzq0nDebZQVNAZ"
Content-Disposition: inline
In-Reply-To: <128a6d51af1b7c9ed24a5848347c66b9@walle.cc>
X-Cookie: If it ain't baroque, don't phiques it.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--uXxzq0nDebZQVNAZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 01, 2021 at 12:10:16AM +0200, Michael Walle wrote:
> Am 2021-04-30 19:26, schrieb Mark Brown:

> > But that's a driver for a specific device AFAICT which looks like it's
> > only got an I2C binding on the MFD so the driver knows that it's for a
> > device that's on a bus that's going to sleep and doesn't need to infer
> > anything?  This looks like the common case I'd expect where there's no
> > variation.

> You are right, at the moment this driver only has an I2C binding. But
> the idea was that this IP block and driver can be reused behind any
> kind of bridge; I2C, SPI or MMIO. Actually, I had the impression

Is this actually a way people are building hardware though?

> that all you need to do to convert it to MMIO is to replace the
> "kontron,sl28cpld" compatible with a "syscon" compatible. But it isn't
> that easy. Anyway, the idea is that you don't need to change anything
> in the gpio-sl28cpld driver, just change the parent. But if we can't
> ask the regmap what type it is, then we'll have to modify the
> gpio-sl28cpld driver and we will have to figure it out by some other
> means.

Well, you don't need to change anything at all - the driver will work
perfectly fine if it's flagging up the GPIOs as potentially sleeping
even if they end up not actually sleeping.

> > If users happen to end up with a map flagged as fast they can work on
> > the whatever driver uses this stuff and not realise they're breaking
> > other users of the same driver that end up with slow I/O.  The whole
> > point of the flag in GPIO is AIUI warnings to help with that case.

> Hm, but as of now, the only thing which makes the gpio-regmap driver
> slow i/o is the regmap itself.

Surely it's just a case of the device that's creating the gpio regmap
setting a flag when it instantiates it?  It's just one more thing that
the parent knows about the device.  This doesn't seem insurmountable.

--uXxzq0nDebZQVNAZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCT5H0ACgkQJNaLcl1U
h9C1jgf/fMsa7iuDhVuCYqM7GgShZSTiST2PU/FnbNwb2PTBPf7hOg631X0qGP4m
eDKkTfJo7fiISjBASO6TWtVUeRu5jEGImhVG6Spr4SdYv5PCry7IcoStNVRO8l2t
BDT4WzkGdCOL8eb2/UGkaeKV97jQygY91QBdduDKgJ/x5E8+9rMbTfnFBf4Rk1Ye
39zJiOtabMrmwvFX5riGzjJ0+NNgjeIT32j1yFl76gvnvKNrk0W858TF9KfgTce3
T3GD1bEpWhpbYIjybPwWxn2fex5Fx0mvYPcMeKSXTwF2RZ1vpnXyEznmla7N4IaO
oBOxXEeXqMr0DTFUe6km+Dth65wY0Q==
=mkkW
-----END PGP SIGNATURE-----

--uXxzq0nDebZQVNAZ--
