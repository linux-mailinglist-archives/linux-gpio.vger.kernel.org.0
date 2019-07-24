Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FADB72A3E
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jul 2019 10:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726065AbfGXIht (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jul 2019 04:37:49 -0400
Received: from mx2.suse.de ([195.135.220.15]:45484 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726031AbfGXIht (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 24 Jul 2019 04:37:49 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 00FA9AF03;
        Wed, 24 Jul 2019 08:37:47 +0000 (UTC)
Message-ID: <ab7af8537ebcbc7a7bdf04d2c06152ba6821b333.camel@suse.de>
Subject: Re: [PATCH 00/18] ARM: Add minimal Raspberry Pi 4 support
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Chen-Yu Tsai <wens@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Scott Branden <sbranden@broadcom.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Eric Anholt <eric@anholt.net>,
        Matthias Brugger <mbrugger@suse.com>,
        "open list:BROADCOM BCM281XX..." 
        <bcm-kernel-feedback-list@broadcom.com>,
        Stefan Wahren <wahrenst@gmx.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Christoph Hellwig <hch@lst.de>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "moderated list:BROADCOM BCM2835..." 
        <linux-rpi-kernel@lists.infradead.org>
Date:   Wed, 24 Jul 2019 10:37:45 +0200
In-Reply-To: <CAGb2v66-o23CW5iH9Bn1aELymPSiKrA43eJd2q6EZ7iubcogaw@mail.gmail.com>
References: <1563774880-8061-1-git-send-email-wahrenst@gmx.net>
         <96113adb5fcab9c2f4bb5fa82b84ff5f9c07fd07.camel@suse.de>
         <bc650090-db86-ccac-01dc-23f08ad7b19b@gmx.net>
         <20190723093442.GA27239@lst.de>
         <04c5eaa03f3a124dbbce6186e11e19acc4539cc8.camel@suse.de>
         <b15509d6-bc2e-3d06-0eea-943e6e456d62@gmx.net>
         <5f9b11f54c66fd0487837f7e58af3adf7f86635f.camel@suse.de>
         <CAGb2v66-o23CW5iH9Bn1aELymPSiKrA43eJd2q6EZ7iubcogaw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-Rf1Vi16408MDtIxce0fT"
User-Agent: Evolution 3.32.3 
MIME-Version: 1.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--=-Rf1Vi16408MDtIxce0fT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> > > Does it fix the wifi issue too?
> >=20
> > Well it works as long as I revert this: 901bb98918 ("nl80211: require a=
nd
> > validate vendor command policy"). Which has nothing to do with DMA anyw=
ays.
> >=20
> > Was this the issue you where seeing?
> >=20
> > [    4.969679] WARNING: CPU: 2 PID: 21 at net/wireless/core.c:868
> > wiphy_register+0x8e8/0xbdc [cfg80211]
> > [...]
> > [    4.969974] ieee80211 phy0: brcmf_cfg80211_attach: Could not registe=
r
> > wiphy device (-22)
>=20
> We're seeing this on different platforms (allwinner / rockchip / amlogic)
> with Broadcom WiFi chips. So it's unlikely to be related with anything in
> this series.
>=20
> I believe a fix for this has already been queued up:
>=20
>=20
https://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211.git/commit/?=
id=3D91046d6364afde646734c7ead1f649d253c386e9

Thanks for pointing it out, it fixes the issue alright.


--=-Rf1Vi16408MDtIxce0fT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl04GNkACgkQlfZmHno8
x/4D2wgAqq3ax066fAw16mhXFvRvsvt5N2yK9ur2hwqz0YVcIYT9FlKTnuFyrUOY
w1MvuMiaeLz+2xFpt+LVsmP/ygSqwzfzikUGJh/vHIu+mRqYPdbHrIKvLqutyQnF
oXe6qqy8bXRfT50JQRnyH7ysKXks44suhiyTrYpidvmqkFZnasP86QgelISZiuKo
umHPmmEck4luauMqSuQxzaNtbiJhLWzdKAWH3u+iufEHZT5Mbhi0v82jwviF2x+k
lHI6OQpyuuOyVlsbIcAKAuu3qafq8KWaIf13JUmRGdo+dAjpBQ/lsuxeQGH4mHHk
JvMKjYzUiMp4hvcgcoVTNcJ/Zz7zpw==
=vcHF
-----END PGP SIGNATURE-----

--=-Rf1Vi16408MDtIxce0fT--

