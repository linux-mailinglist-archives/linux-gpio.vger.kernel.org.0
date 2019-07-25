Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5669C74902
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jul 2019 10:22:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389453AbfGYIWp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Jul 2019 04:22:45 -0400
Received: from mx2.suse.de ([195.135.220.15]:57634 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389405AbfGYIWp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 25 Jul 2019 04:22:45 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 298C1AEBB;
        Thu, 25 Jul 2019 08:22:43 +0000 (UTC)
Message-ID: <c642de0a85d67f7f758735f1bba083156cca0ddb.camel@suse.de>
Subject: Re: [PATCH 00/18] ARM: Add minimal Raspberry Pi 4 support
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Stefan Wahren <wahrenst@gmx.net>, Christoph Hellwig <hch@lst.de>
Cc:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Matthias Brugger <mbrugger@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-mmc@vger.kernel.org
Date:   Thu, 25 Jul 2019 10:22:40 +0200
In-Reply-To: <5f9b11f54c66fd0487837f7e58af3adf7f86635f.camel@suse.de>
References: <1563774880-8061-1-git-send-email-wahrenst@gmx.net>
         <96113adb5fcab9c2f4bb5fa82b84ff5f9c07fd07.camel@suse.de>
         <bc650090-db86-ccac-01dc-23f08ad7b19b@gmx.net>
         <20190723093442.GA27239@lst.de>
         <04c5eaa03f3a124dbbce6186e11e19acc4539cc8.camel@suse.de>
         <b15509d6-bc2e-3d06-0eea-943e6e456d62@gmx.net>
         <5f9b11f54c66fd0487837f7e58af3adf7f86635f.camel@suse.de>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-8InTQBfoOc1ySS/i6FEl"
User-Agent: Evolution 3.32.3 
MIME-Version: 1.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--=-8InTQBfoOc1ySS/i6FEl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> > > Any thoughts on this?
> > >=20
> > > diff --git a/arch/arm/mach-bcm/Kconfig b/arch/arm/mach-bcm/Kconfig
> > > index 5e5f1fabc3d4..3db8deed83a6 100644
> > > --- a/arch/arm/mach-bcm/Kconfig
> > > +++ b/arch/arm/mach-bcm/Kconfig
> > > @@ -168,6 +168,7 @@ config ARCH_BCM2835
> > >         select PINCTRL
> > >         select PINCTRL_BCM2835
> > >         select MFD_CORE
> > > +       select DMABOUNCE
> > >         help
> > >           This enables support for the Broadcom BCM2835 and BCM2836 S=
oCs.
> > >           This SoC is used in the Raspberry Pi and Roku 2 devices.
> > > diff --git a/arch/arm/mach-bcm/board_bcm2835.c b/arch/arm/mach-
> > > bcm/board_bcm2835.c
> > > index c09cf25596af..be788849c4bb 100644
> > > --- a/arch/arm/mach-bcm/board_bcm2835.c
> > > +++ b/arch/arm/mach-bcm/board_bcm2835.c
> > > @@ -3,6 +3,8 @@
> > >   * Copyright (C) 2010 Broadcom
> > >   */
> > >=20
> > > +#include <linux/device.h>
> > > +#include <linux/dma-mapping.h>
> > >  #include <linux/init.h>
> > >  #include <linux/irqchip.h>
> > >  #include <linux/of_address.h>
> > > @@ -24,8 +26,37 @@ static const char * const bcm2835_compat[] =3D {
> > >         NULL
> > >  };
> > >=20
> > > +static int bcm2835_needs_bounce(struct device *dev, dma_addr_t dma_a=
ddr,
> > > size_t size)
> > > +{
> > > +       /*
> > > +        * The accepted dma addresses are [0xc0000000, 0xffffffff] wh=
ich
> > > map
> > > to
> > > +        * ram's [0x00000000, 0x3fffffff].
> > > +        */
> > > +       return dma_addr < 3ULL * SZ_1G;
> > > +}
> > > +
> > > +/*
> > > + * Setup DMA mask to 1GB on devices hanging from soc interconnect
> > > + */
> > > +static int bcm2835_platform_notify(struct device *dev)
> > > +{
> > > +       if (dev->parent && !strcmp("soc", dev_name(dev->parent))) {
> > > +               dev->dma_mask =3D &dev->coherent_dma_mask;
> > > +               dev->coherent_dma_mask =3D DMA_BIT_MASK(30); /* 1GB *=
/
> > Shouldn't this come from the device tree?
>=20
> Yes, actually I could use the 'dma-ranges' parsing code I suggested on th=
e
> arm64 RFC. The same goes with 'dma_zone_size =3D SZ_1G', it ideally shoul=
d be
> calculated based on the device-tree.
>=20
> The way I see it I'm not sure it's worth the effort, in arm64 we have no
> choice
> as there are no board files. But here we seem to be the only ones with th=
is
> specific DMA addressing constraint, so fixing it in arm/common doesn't se=
em
> like it's going to benefit anyone else. Let's see how the arm arch mainta=
iners
> react though.
>=20
> There is one catch though. I missed it earlier as I was excited to see th=
e
> board boot, but some devices are failing to set their DMA masks:
>=20
> [    1.989576] dwc2 fe980000.usb: can't set coherent DMA mask: -5
>=20
> It seems that other users of dmabounce also implement their own
> dma_supported(). I have to look into it.

Sadly it seems there are some limitations in dmabounce I didn't take into
account earlier. Among other things it can't deal with HighMem out of the b=
ox
and even when trying to adapt it to our needs, fails to do so as it allocat=
es
using GFP_ATOMIC, which rules out using the CMA when allocating coherent
memory. Sorry for the noise, I got carried away too soon.

I did a dirty hack hooking up dma-direct/swiotlb to the board. It seems to =
be
working fine after some tweaks in arm's dma_capable(). That said I want to =
test
it further before sending anything ;).


--=-8InTQBfoOc1ySS/i6FEl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl05ZtAACgkQlfZmHno8
x/4sMQf/ZAzeFhITCsBHt32BMCs3X9IHK01sUngs4oVByFZjr5FRMfQfl7A26MmS
CAKL75YSodrfg21VS9puQvCjc1GuUdLNUthQQRyuooKNlolfiuzdCJzou+yD5kRD
KQ2pJsQzI04EUjt07khiKylkoBUpyQ5o1r2keTvAD9PKdViEQ4agwYLgpwNHMDSX
sg2AuPyAz4G3S+fwWYT4ak8E0aAid54vFNphWDWWiGsxRr0OBxOM1qhnAMTf/h7D
guArWPqOvouhR24Vg8AZASs6hbGVG7MWlDyTEUoIosFR/r4leqo8tkPfL3JpURz0
srLbRNNQ906sAncY7wGYDqzXBWmADQ==
=jo2+
-----END PGP SIGNATURE-----

--=-8InTQBfoOc1ySS/i6FEl--

