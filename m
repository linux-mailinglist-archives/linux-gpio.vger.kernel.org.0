Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7242B71940
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2019 15:32:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390254AbfGWNcQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jul 2019 09:32:16 -0400
Received: from mx2.suse.de ([195.135.220.15]:33496 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725827AbfGWNcQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Jul 2019 09:32:16 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 1E57CAEFC;
        Tue, 23 Jul 2019 13:32:14 +0000 (UTC)
Message-ID: <04c5eaa03f3a124dbbce6186e11e19acc4539cc8.camel@suse.de>
Subject: Re: [PATCH 00/18] ARM: Add minimal Raspberry Pi 4 support
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Christoph Hellwig <hch@lst.de>, Stefan Wahren <wahrenst@gmx.net>
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
Date:   Tue, 23 Jul 2019 15:32:11 +0200
In-Reply-To: <20190723093442.GA27239@lst.de>
References: <1563774880-8061-1-git-send-email-wahrenst@gmx.net>
         <96113adb5fcab9c2f4bb5fa82b84ff5f9c07fd07.camel@suse.de>
         <bc650090-db86-ccac-01dc-23f08ad7b19b@gmx.net>
         <20190723093442.GA27239@lst.de>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-3BnHBRqm9Yrvkdvr/sj8"
User-Agent: Evolution 3.32.3 
MIME-Version: 1.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--=-3BnHBRqm9Yrvkdvr/sj8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-07-23 at 11:34 +0200, Christoph Hellwig wrote:
> On Mon, Jul 22, 2019 at 08:10:17PM +0200, Stefan Wahren wrote:
> > i rebased this series also and got this only on the RPi 4.
> >=20
> > After reverting the following:
> >=20
> > 79a986721de dma-mapping: remove dma_max_pfn
> > 7559d612dff0 mmc: core: let the dma map ops handle bouncing
> >=20
> > This crash disappear, but wifi seems to be still broken.
> >=20
> > Would be nice, if you can investigate further.
>=20
> That means dma addressing on this system doesn't just work for some
> memory, and the mmc bounce buffering was papering over that just for
> mmc.  Do you have highmem on this system?=20
>=20
> You might want to try this series, which has been submitted upstream:
>=20
> http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/arm-swiot=
lb

Hi Christoph,
I tried your series on top of Stefan's, it has no effect. I guess it's no
surprise as with mult_v7_defconfig, you get SWIOTLB=3Dn & LPAE=3Dn.

FYI DMA addressing constraints for RPi4 are the following: devices can only
access the first GB of ram even though the board might have up to 4GB of ra=
m.
The DMA addresses are aliased with a 0xc0000000 offset. So 0x00000000 phys =
is
aliased to 0xc0000000 in DMA. This is the same as for an RFC you commented =
last
week trying to fix similar issues for arm64.

You state in "arm: use swiotlb for bounce buffer on LPAE configs" that "The=
 DMA
API requires that 32-bit DMA masks are always supported". If I understand i=
t
correctly this device breaks that assumption. Which implies we need a bounc=
e
buffer system in place for any straming DMA user.

It seems we're unable to use dma-direct/swiotlb, so I enabled arm's dmaboun=
ce
on all devices hooked into RPi's limited interconnect, which fixes this iss=
ue.
Any thoughts on this?

diff --git a/arch/arm/mach-bcm/Kconfig b/arch/arm/mach-bcm/Kconfig
index 5e5f1fabc3d4..3db8deed83a6 100644
--- a/arch/arm/mach-bcm/Kconfig
+++ b/arch/arm/mach-bcm/Kconfig
@@ -168,6 +168,7 @@ config ARCH_BCM2835
        select PINCTRL
        select PINCTRL_BCM2835
        select MFD_CORE
+       select DMABOUNCE
        help
          This enables support for the Broadcom BCM2835 and BCM2836 SoCs.
          This SoC is used in the Raspberry Pi and Roku 2 devices.
diff --git a/arch/arm/mach-bcm/board_bcm2835.c b/arch/arm/mach-bcm/board_bc=
m2835.c
index c09cf25596af..be788849c4bb 100644
--- a/arch/arm/mach-bcm/board_bcm2835.c
+++ b/arch/arm/mach-bcm/board_bcm2835.c
@@ -3,6 +3,8 @@
  * Copyright (C) 2010 Broadcom
  */
=20
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
 #include <linux/init.h>
 #include <linux/irqchip.h>
 #include <linux/of_address.h>
@@ -24,8 +26,37 @@ static const char * const bcm2835_compat[] =3D {
        NULL
 };
=20
+static int bcm2835_needs_bounce(struct device *dev, dma_addr_t dma_addr, s=
ize_t size)
+{
+       /*
+        * The accepted dma addresses are [0xc0000000, 0xffffffff] which ma=
p to
+        * ram's [0x00000000, 0x3fffffff].
+        */
+       return dma_addr < 3ULL * SZ_1G;
+}
+
+/*
+ * Setup DMA mask to 1GB on devices hanging from soc interconnect
+ */
+static int bcm2835_platform_notify(struct device *dev)
+{
+       if (dev->parent && !strcmp("soc", dev_name(dev->parent))) {
+               dev->dma_mask =3D &dev->coherent_dma_mask;
+               dev->coherent_dma_mask =3D DMA_BIT_MASK(30); /* 1GB */
+               dmabounce_register_dev(dev, 2048, 4096, bcm2835_needs_bounc=
e);
+       }
+
+       return 0;
+}
+
+void __init bcm2835_init_early(void)
+{
+       platform_notify =3D bcm2835_platform_notify;
+}
+
 DT_MACHINE_START(BCM2835, "BCM2835")
        .dma_zone_size  =3D SZ_1G,
        .dt_compat =3D bcm2835_compat,
        .smp =3D smp_ops(bcm2836_smp_ops),
+       .init_early =3D bcm2835_init_early,
 MACHINE_END

 Regards,
 Nicolas


--=-3BnHBRqm9Yrvkdvr/sj8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl03DFsACgkQlfZmHno8
x/7E7wgAg5ZRyyHT+Sv4XB1YCgc3dStZGLkySlCiLAKb9xI4p+UkRQxZrY302Msy
nhA2fjeqEDh/uPimRPi+Zq6B6R+Eq+QLthsYCItdSVDTnlkT4+tMhQzAevLgoTc+
cnrw4mMyvGMxS1XaR71HROZMw2f0Nc6gE9M8UHSIEv6priSerUb6yqEirkyFg1NA
/1UguxmSGM2/RKf1U24bFpZhWHVrX9BXB1fR/9xriMUHNofZJrqgUNabZNzSWxbM
kJjehqaGzMTATGya8Q4rjWNBcdzHr0H7xr+yI3G9tnwsbBruLBFDfZ+lITwSz8wI
C3HoZjs8IJRAclbo8Au1SK2GpvCLJA==
=5u5q
-----END PGP SIGNATURE-----

--=-3BnHBRqm9Yrvkdvr/sj8--

