Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D641E71DC6
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2019 19:33:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732740AbfGWRdt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jul 2019 13:33:49 -0400
Received: from mx2.suse.de ([195.135.220.15]:40896 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2391099AbfGWRdr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Jul 2019 13:33:47 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 70E97AC8F;
        Tue, 23 Jul 2019 17:33:45 +0000 (UTC)
Message-ID: <5f9b11f54c66fd0487837f7e58af3adf7f86635f.camel@suse.de>
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
Date:   Tue, 23 Jul 2019 19:33:43 +0200
In-Reply-To: <b15509d6-bc2e-3d06-0eea-943e6e456d62@gmx.net>
References: <1563774880-8061-1-git-send-email-wahrenst@gmx.net>
         <96113adb5fcab9c2f4bb5fa82b84ff5f9c07fd07.camel@suse.de>
         <bc650090-db86-ccac-01dc-23f08ad7b19b@gmx.net>
         <20190723093442.GA27239@lst.de>
         <04c5eaa03f3a124dbbce6186e11e19acc4539cc8.camel@suse.de>
         <b15509d6-bc2e-3d06-0eea-943e6e456d62@gmx.net>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-Cs8KT2iJYDGL89Fz+Mxk"
User-Agent: Evolution 3.32.3 
MIME-Version: 1.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--=-Cs8KT2iJYDGL89Fz+Mxk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-07-23 at 18:26 +0200, Stefan Wahren wrote:
> Hi Nicolas,
>=20
> thanks for your work, but i'm a little bit sceptical about these
> changes. So here some thoughts.
>=20
> Am 23.07.19 um 15:32 schrieb Nicolas Saenz Julienne:
> > On Tue, 2019-07-23 at 11:34 +0200, Christoph Hellwig wrote:
> > > On Mon, Jul 22, 2019 at 08:10:17PM +0200, Stefan Wahren wrote:
> > > > i rebased this series also and got this only on the RPi 4.
> > > >=20
> > > > After reverting the following:
> > > >=20
> > > > 79a986721de dma-mapping: remove dma_max_pfn
> > > > 7559d612dff0 mmc: core: let the dma map ops handle bouncing
> > > >=20
> > > > This crash disappear, but wifi seems to be still broken.
> > > >=20
> > > > Would be nice, if you can investigate further.
> > > That means dma addressing on this system doesn't just work for some
> > > memory, and the mmc bounce buffering was papering over that just for
> > > mmc.  Do you have highmem on this system?
> > >=20
> > > You might want to try this series, which has been submitted upstream:
> > >=20
> > >=20
http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/arm-swiotlb
> > Hi Christoph,
> > I tried your series on top of Stefan's, it has no effect. I guess it's =
no
> > surprise as with mult_v7_defconfig, you get SWIOTLB=3Dn & LPAE=3Dn.
> >=20
> > FYI DMA addressing constraints for RPi4 are the following: devices can =
only
> > access the first GB of ram even though the board might have up to 4GB o=
f
> > ram.
> > The DMA addresses are aliased with a 0xc0000000 offset. So 0x00000000 p=
hys
> > is
> > aliased to 0xc0000000 in DMA. This is the same as for an RFC you commen=
ted
> > last
> > week trying to fix similar issues for arm64.
> >=20
> > You state in "arm: use swiotlb for bounce buffer on LPAE configs" that =
"The
> > DMA
> > API requires that 32-bit DMA masks are always supported". If I understa=
nd it
> > correctly this device breaks that assumption. Which implies we need a b=
ounce
> > buffer system in place for any straming DMA user.
> >=20
> > It seems we're unable to use dma-direct/swiotlb, so I enabled arm's
> > dmabounce
> > on all devices hooked into RPi's limited interconnect, which fixes this
> > issue.
> Does it fix the wifi issue too?

Well it works as long as I revert this: 901bb98918 ("nl80211: require and
validate vendor command policy"). Which has nothing to do with DMA anyways.

Was this the issue you where seeing?

[    4.969679] WARNING: CPU: 2 PID: 21 at net/wireless/core.c:868 wiphy_reg=
ister+0x8e8/0xbdc [cfg80211]
[...]
[    4.969974] ieee80211 phy0: brcmf_cfg80211_attach: Could not register wi=
phy device (-22)

> > Any thoughts on this?
> >=20
> > diff --git a/arch/arm/mach-bcm/Kconfig b/arch/arm/mach-bcm/Kconfig
> > index 5e5f1fabc3d4..3db8deed83a6 100644
> > --- a/arch/arm/mach-bcm/Kconfig
> > +++ b/arch/arm/mach-bcm/Kconfig
> > @@ -168,6 +168,7 @@ config ARCH_BCM2835
> >         select PINCTRL
> >         select PINCTRL_BCM2835
> >         select MFD_CORE
> > +       select DMABOUNCE
> >         help
> >           This enables support for the Broadcom BCM2835 and BCM2836 SoC=
s.
> >           This SoC is used in the Raspberry Pi and Roku 2 devices.
> > diff --git a/arch/arm/mach-bcm/board_bcm2835.c b/arch/arm/mach-
> > bcm/board_bcm2835.c
> > index c09cf25596af..be788849c4bb 100644
> > --- a/arch/arm/mach-bcm/board_bcm2835.c
> > +++ b/arch/arm/mach-bcm/board_bcm2835.c
> > @@ -3,6 +3,8 @@
> >   * Copyright (C) 2010 Broadcom
> >   */
> >=20
> > +#include <linux/device.h>
> > +#include <linux/dma-mapping.h>
> >  #include <linux/init.h>
> >  #include <linux/irqchip.h>
> >  #include <linux/of_address.h>
> > @@ -24,8 +26,37 @@ static const char * const bcm2835_compat[] =3D {
> >         NULL
> >  };
> >=20
> > +static int bcm2835_needs_bounce(struct device *dev, dma_addr_t dma_add=
r,
> > size_t size)
> > +{
> > +       /*
> > +        * The accepted dma addresses are [0xc0000000, 0xffffffff] whic=
h map
> > to
> > +        * ram's [0x00000000, 0x3fffffff].
> > +        */
> > +       return dma_addr < 3ULL * SZ_1G;
> > +}
> > +
> > +/*
> > + * Setup DMA mask to 1GB on devices hanging from soc interconnect
> > + */
> > +static int bcm2835_platform_notify(struct device *dev)
> > +{
> > +       if (dev->parent && !strcmp("soc", dev_name(dev->parent))) {
> > +               dev->dma_mask =3D &dev->coherent_dma_mask;
> > +               dev->coherent_dma_mask =3D DMA_BIT_MASK(30); /* 1GB */
> Shouldn't this come from the device tree?

Yes, actually I could use the 'dma-ranges' parsing code I suggested on the
arm64 RFC. The same goes with 'dma_zone_size =3D SZ_1G', it ideally should =
be
calculated based on the device-tree.

The way I see it I'm not sure it's worth the effort, in arm64 we have no ch=
oice
as there are no board files. But here we seem to be the only ones with this
specific DMA addressing constraint, so fixing it in arm/common doesn't seem
like it's going to benefit anyone else. Let's see how the arm arch maintain=
ers
react though.

There is one catch though. I missed it earlier as I was excited to see the
board boot, but some devices are failing to set their DMA masks:

[    1.989576] dwc2 fe980000.usb: can't set coherent DMA mask: -5

It seems that other users of dmabounce also implement their own
dma_supported(). I have to look into it.

> > +               dmabounce_register_dev(dev, 2048, 4096,
> > bcm2835_needs_bounce);
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +void __init bcm2835_init_early(void)
> > +{
> > +       platform_notify =3D bcm2835_platform_notify;
> > +}
> > +
> >  DT_MACHINE_START(BCM2835, "BCM2835")
> >         .dma_zone_size  =3D SZ_1G,
> >         .dt_compat =3D bcm2835_compat,
> >         .smp =3D smp_ops(bcm2836_smp_ops),
> > +       .init_early =3D bcm2835_init_early,
>=20
> The sum of all these changes make me think, that we should start a new
> board for BCM2711 instead of extending BCM2835.
>=20

I agree, I did it locally but merged it into the current board file to make=
 the
patch smaller.

> Best regards
> Stefan Wahren
>=20
> >  MACHINE_END
> >=20
> >  Regards,
> >  Nicolas
> >=20


--=-Cs8KT2iJYDGL89Fz+Mxk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl03RPcACgkQlfZmHno8
x/6TsQgAiRtH8ll8Nfzu6CsfDqqL5Kv2oxcVc5gEytt111MCiGPlRk0nZhl7rmwT
Ms+Qja29Ko53mWMZY5UQKg6WuZCHEHCIW0VW3rHIgwwQ3f55UyfgNg1jBcWWrxyC
JKRPV3bBiMqy753EmTp1sq0YUsgbK5I/RLCM89xZYh2Uokk2N3Ye0jXo9qUnmCdM
v7X8WYRUweiUWwL7syrjo3cZUXzlYT7tAz7wv+QESZ00WhxkU5hbhQs0abE92OKJ
2N/WV6cv+fgPPP1HMKCmI99/hz7kffD3o7DX1Ro0bje62y5DT2uAd2RpPL+Tr8M5
4f6Va9HevBWVV3KQ+MhOAL2Ts1LKvg==
=QgMC
-----END PGP SIGNATURE-----

--=-Cs8KT2iJYDGL89Fz+Mxk--

