Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A59822F139C
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jan 2021 14:12:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730788AbhAKNLz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jan 2021 08:11:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:59032 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730752AbhAKNLy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 11 Jan 2021 08:11:54 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E240122AAB;
        Mon, 11 Jan 2021 13:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610370673;
        bh=AmODotHhHqE5rQ7jrjw/zpMa0EF2YxLtNlbdQq2dKFY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jPsLXfVKxGo3XvOdA/kWPru4HQo3uHlHD7WTD7Z+jg4EeHklB+xudWVRvumR8ZEjp
         IH1MR0hhEoUQeQCROZC/qInMMcaTVRe39vLogAayU40d8kFEh0Hr0KdmxxiZHciE8i
         Bi+Bvg0z4iUKqYnCcxQrtOE0mairMCBQ3xKaMgTVQQg/kxtVMx5oS28GgyURVl45Ry
         ih7dP2NS4jhasdDwjWmdGYfRc84rctt53Ae9aTrlN3GsatNGHdETOt26lJljgOY0Rg
         xfTX0bdwO3EZqK7i5iS4JI8GqCQIsDfGYFK3iW5wLuh9f8E2VkF0kncAL6/yZzU6gm
         X9FeLFZdmtlWA==
Date:   Mon, 11 Jan 2021 13:10:40 +0000
From:   Mark Brown <broonie@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] pinctrl: Add driver for Awinic AW9523/B I2C GPIO
 Expander
Message-ID: <20210111131040.GA4728@sirena.org.uk>
References: <20210109140204.151340-1-angelogioacchino.delregno@somainline.org>
 <20210109140204.151340-2-angelogioacchino.delregno@somainline.org>
 <CACRpkdbETKnhgR2-T+s3ChY4v-C5ErdPEp2WcMSZHzJ=O-fHig@mail.gmail.com>
 <111b918d-2b43-be81-2dbf-e984750b0ef7@somainline.org>
 <CACRpkdZXgN91jKBDvf=P5_6ObOaacQa2PGL3-jP1gBW__ZyOaA@mail.gmail.com>
 <744125a7-ffb6-a3f5-70cb-2ab48fcf31b8@somainline.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Content-Disposition: inline
In-Reply-To: <744125a7-ffb6-a3f5-70cb-2ab48fcf31b8@somainline.org>
X-Cookie: Too much is not enough.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 10, 2021 at 03:32:47PM +0100, AngeloGioacchino Del Regno wrote:

> Then, the set_bit/clear_bit in aw9523_irq_mask(), aw9523_irq_unmask were
> replaced with calls to regmap_update_bits_async, example:

Why are you trying to use the _async() versions here?  Don't you need
the I/O to complete synchronously, and what would be the benefit of
dealing with the complexity of making things async?  The genirq
framework is definitely going to expect things to be complete before you
return to it...

Note also that this only really does anything for SPI, I2C doesn't offer
an aynchronous API.

> <4>[    1.064060]  regmap_i2c_write+0x1c/0x50

regmap will only use spinlocks if you explictly ask it to do so by
setting fast_io.  You can't use spinlock based locking for your register
cache if your device is attached via I2C, I2C is a very slow bus and I2C
controllers will need to sleep.  I'd be very surprised if there were any
benefit from using a flat cache with such a device frankly, the I/O is
going to be so slow that any performance gain from using a flat cache is
lost in the noise.

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/8TlAACgkQJNaLcl1U
h9By5gf9GtyGBDOfQulWOZeMoyUphHU9j0RN7pN2FPc5guPc3ihmcnQMo0qTp5MD
+Kt5kV85ysVR/vwhrMyGkfKuvh8mAqXxYxSzPruo6Iy23c2YPasuIGqhJEILrfB4
sB5JYtsjDXrWqwaFk3jnhmRljiyG6QIeXoQwc9bGmXsV6lcYkFN/WP/w1zUo9j2t
NfNQ4ao/O1hpRY1+2pgoZ0bjPeo8ck4kow8sDl2KKnNDudJZcTiHLswOQ+rkwrhE
ekktFQknw8BaqGRFpyxJgM822hHKtKROIIE9u+L/wiDp2d5+RDkVCGw7XLzU6Wcm
U3XKnRsGfi2xxnO2VzInFjWfAqv6uQ==
=6nWa
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--
