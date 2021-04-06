Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 698EE35517E
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Apr 2021 13:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232493AbhDFLEz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Apr 2021 07:04:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:47652 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231650AbhDFLEz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 6 Apr 2021 07:04:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 150BD613C7;
        Tue,  6 Apr 2021 11:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617707087;
        bh=j0qsL8ZhRgxgUfLEkGnISsjLMn2+Fbcco5QjwWwQSXE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GqTZLOyW2VyULQBFS9BxNlyfxWpXdw88hZPxg9c3afs1QPqMNdzh+rKGKGbOl3XrZ
         IGnpMhOUwyH69P3KyQUiFTEwzFBS+J2ar+dsE2EHZHNaTRYZFFh9JwhMzcQMLtGUoY
         n3Fan8Qr1ny5jI9TrPTqZ8A+88ItN46XTRnYYtyG+Jiuk5tJLmyPmnzXKBn1KEVO7b
         0ShlhvnTuJWlsDaQhC2Nvnu1FHcu17N0mpv1NB9Oj8VQsJVg2y4X4BTXrnZfv6B8V0
         WmzZ0CD8ZwcHD+sG54Uhl17vZrYBMkQhInQIR8NDEm/7MIdHxcFdJqxtSa27n4t/4e
         QXF/qwteOCeXg==
Date:   Tue, 6 Apr 2021 12:04:31 +0100
From:   Mark Brown <broonie@kernel.org>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH v5 00/19] Support ROHM BD71815 PMIC
Message-ID: <20210406110430.GB6443@sirena.org.uk>
References: <cover.1617020713.git.matti.vaittinen@fi.rohmeurope.com>
 <303b164aaa3d36cf8c9d03ee9b3863635be4073d.camel@fi.rohmeurope.com>
 <20210402191950.GK5402@sirena.org.uk>
 <e0b83eee4417e4e267b15a8c22bbc7f70df919e9.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cmJC7u66zC7hs+87"
Content-Disposition: inline
In-Reply-To: <e0b83eee4417e4e267b15a8c22bbc7f70df919e9.camel@fi.rohmeurope.com>
X-Cookie: BARBARA STANWYCK makes me nervous!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--cmJC7u66zC7hs+87
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 05, 2021 at 05:23:41AM +0000, Vaittinen, Matti wrote:
> On Fri, 2021-04-02 at 20:19 +0100, Mark Brown wrote:

> > Matti Vaittinen (2):
> >       regulator: helpers: Export helper voltage listing
> >       regulator: Add regmap helper for ramp-delay setting

> If I understand this correctly, the idea is that Lee could pull these
> changes to his tree? So, I will drop these two patches from the series
> when I resend it. Helpers are needed for the regulator part of the
> series to apply. Lee, Mark, please let me know if I misunderstood.

Yes.

--cmJC7u66zC7hs+87
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBsQD4ACgkQJNaLcl1U
h9AFswf9Hokgv/qlc9tx7qtUsLTFz/Bqr7r6bGw937a0dA9PyYBNsN1ZDH/ZaU6k
TgoMBbFwnyVsL82XwHsLOrGih0+XaeYNkKXm5/I+qd86ryl1My8CLkAt6iXQqWY/
3rP8/gueg4zqniWchALAYejIhz910A69Qsz7XOwVWj0XKoUpyiZpq7NUtF2ueNyH
4I0p/K57R/NeYmfn0FFwsQgpik9stmtrqXpOEhAGay7e4TDDiDuG9qagMEMPCDDr
r/FPpCgWodDPB/INLfYcUygjA9b/7yrgm4JaDy9d3H9UlxsNbIZIPDt5lgqcwcia
3M1X7F8fSG//t5VsyflAsJg/ToeT0g==
=+Bcj
-----END PGP SIGNATURE-----

--cmJC7u66zC7hs+87--
