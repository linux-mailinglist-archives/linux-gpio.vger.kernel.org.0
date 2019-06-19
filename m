Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8559F4B46C
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jun 2019 10:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731064AbfFSI5d (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Jun 2019 04:57:33 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36417 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730783AbfFSI5d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Jun 2019 04:57:33 -0400
Received: by mail-wr1-f68.google.com with SMTP id n4so2468095wrs.3;
        Wed, 19 Jun 2019 01:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Y4h+Xa4lwzYaamlWTcvoqvwriJhW9ZXsKjY8QP3vMPk=;
        b=ROA09wuWK9x884f2IhQOoE75Z09z5v3ZxL4H7nZwxMP1DJZo209PvkHBI3WI/ElpTE
         ASgI+BJzOWa1HTa46xeUgKDN6I9+8rE+eL6grHQrPHFEPj+j4wU8M0MLLfC5NngtxEbB
         ubN4SfGvLL3qXGFL4teBlIKLrkpZ16AALJ11mNJXUtUYPxmbBa9Dyl9h1cA8Hr3kxIIr
         9pYlVAxoQsElEsilhDTkokNnzcMfCei/fdaV8XWP33u+OD84KGYgKpYjbMS1hAcAQtxR
         4utHyDI3qgEIRW45EYiKkOV2CX/l8zwJZFR6zNz/m3fOWYP86L5hivffDAoZsOPvXT41
         gCtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Y4h+Xa4lwzYaamlWTcvoqvwriJhW9ZXsKjY8QP3vMPk=;
        b=lGKJ94Ry+87YigmSTCclu5zc0xDd9ZIFrlnN4+TcVtITy2bhWZRo+KTVHQ5MlplPB6
         s3F9JhbiLVhDNpOy7fWgDqqAWmkPb7epia+u+wUODyj+4iGxgkAgLtCSHrqzpocgiyO5
         eJeEtgK2kdo7JGCEN1tp8/2TZ2kNeZlI9BQsxcKNxK1sScn/Y/JjzuJ7LnVYAiMEfbq/
         q1zOlhUuo43NH8SXWK0b5DC2JkzIeQ0iCUVeF+a7mfnyX/2kQT6Z1oK6Fq5TWy/ef0VX
         sEXW3wQNDx8pdiZN16wFHJSQTyVjcB5bAQz+QOqfBjnUSlKjiFB0jSmPw9C3buMYkI43
         sFPw==
X-Gm-Message-State: APjAAAVp5t7IiTdpjgP/q4RK0pwKR/ZG++aWKTyStnnooeSwQcVYtX+D
        dkWKSPAcnBkvyawv0Ib2Ps4=
X-Google-Smtp-Source: APXvYqy/cnFRylcBhzCDqYaZh+o3gKyXCm7v9hJq/YKZGeEZjQZ7ipcYX0rKUcSVZsQuZ7DnYDzDJg==
X-Received: by 2002:adf:f84a:: with SMTP id d10mr5132857wrq.319.1560934648397;
        Wed, 19 Jun 2019 01:57:28 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id q12sm13946853wrp.50.2019.06.19.01.57.27
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 19 Jun 2019 01:57:27 -0700 (PDT)
Date:   Wed, 19 Jun 2019 10:57:26 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Stephen Warren <swarren@wwwdotorg.org>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net,
        marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch,
        mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com,
        talho@nvidia.com, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, mperttunen@nvidia.com,
        spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH V3 02/17] pinctrl: tegra: add suspend and resume support
Message-ID: <20190619085726.GN3187@ulmo>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
 <1560843991-24123-3-git-send-email-skomatineni@nvidia.com>
 <7706a287-44b7-3ad6-37ff-47e97172a798@gmail.com>
 <a23ffbae-dd85-c023-7aae-3b81e0b17ebc@gmail.com>
 <fd415362-7479-6f98-c8db-1b7758fd3f1d@wwwdotorg.org>
 <20190619083308.GM3187@ulmo>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="FhKpTYimqQF2+bfE"
Content-Disposition: inline
In-Reply-To: <20190619083308.GM3187@ulmo>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--FhKpTYimqQF2+bfE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2019 at 10:33:08AM +0200, Thierry Reding wrote:
> On Tue, Jun 18, 2019 at 09:41:03AM -0600, Stephen Warren wrote:
> > On 6/18/19 3:30 AM, Dmitry Osipenko wrote:
> > > 18.06.2019 12:22, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > > 18.06.2019 10:46, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=
=82:
> > > > > This patch adds suspend and resume support for Tegra pinctrl driv=
er
> > > > > and registers them to syscore so the pinmux settings are restored
> > > > > before the devices resume.
> > > > >=20
> > > > > Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> > > > > ---
> > > > >   drivers/pinctrl/tegra/pinctrl-tegra.c    | 62 +++++++++++++++++=
+++++++++++++++
> > > > >   drivers/pinctrl/tegra/pinctrl-tegra.h    |  5 +++
> > > > >   drivers/pinctrl/tegra/pinctrl-tegra114.c |  1 +
> > > > >   drivers/pinctrl/tegra/pinctrl-tegra124.c |  1 +
> > > > >   drivers/pinctrl/tegra/pinctrl-tegra20.c  |  1 +
> > > > >   drivers/pinctrl/tegra/pinctrl-tegra210.c | 13 +++++++
> > > > >   drivers/pinctrl/tegra/pinctrl-tegra30.c  |  1 +
> > > > >   7 files changed, 84 insertions(+)
> > > > >=20
> > > > > diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinc=
trl/tegra/pinctrl-tegra.c
> > > > > index 34596b246578..ceced30d8bd1 100644
> > > > > --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
> > > > > +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
> > > > > @@ -20,11 +20,16 @@
> > > > >   #include <linux/pinctrl/pinmux.h>
> > > > >   #include <linux/pinctrl/pinconf.h>
> > > > >   #include <linux/slab.h>
> > > > > +#include <linux/syscore_ops.h>
> > > > >   #include "../core.h"
> > > > >   #include "../pinctrl-utils.h"
> > > > >   #include "pinctrl-tegra.h"
> > > > > +#define EMMC2_PAD_CFGPADCTRL_0			0x1c8
> > > > > +#define EMMC4_PAD_CFGPADCTRL_0			0x1e0
> > > > > +#define EMMC_DPD_PARKING			(0x1fff << 14)
> > > > > +
> > > > >   static inline u32 pmx_readl(struct tegra_pmx *pmx, u32 bank, u3=
2 reg)
> > > > >   {
> > > > >   	return readl(pmx->regs[bank] + reg);
> > > > > @@ -619,6 +624,48 @@ static void tegra_pinctrl_clear_parked_bits(=
struct tegra_pmx *pmx)
> > > > >   			pmx_writel(pmx, val, g->mux_bank, g->mux_reg);
> > > > >   		}
> > > > >   	}
> > > > > +
> > > > > +	if (pmx->soc->has_park_padcfg) {
> > > > > +		val =3D pmx_readl(pmx, 0, EMMC2_PAD_CFGPADCTRL_0);
> > > > > +		val &=3D ~EMMC_DPD_PARKING;
> > > > > +		pmx_writel(pmx, val, 0, EMMC2_PAD_CFGPADCTRL_0);
> > > > > +
> > > > > +		val =3D pmx_readl(pmx, 0, EMMC4_PAD_CFGPADCTRL_0);
> > > > > +		val &=3D ~EMMC_DPD_PARKING;
> > > > > +		pmx_writel(pmx, val, 0, EMMC4_PAD_CFGPADCTRL_0);
> > > > > +	}
> > > > > +}
> > > >=20
> > > > Is there any reason why parked_bit can't be changed to parked_bitma=
sk like I was
> > > > asking in a comment to v2?
> > > >=20
> > > > I suppose that it's more preferable to keep pinctrl-tegra.c platfor=
m-agnostic for
> > > > consistency when possible, hence adding platform specifics here sho=
uld be discouraged.
> > > > And then the parked_bitmask will also result in a proper hardware d=
escription in the code.
> > > >=20
> > >=20
> > > I'm now also vaguely recalling that Stephen Warren had some kind of a=
 "code generator"
> > > for the pinctrl drivers. So I guess all those tables were auto-genera=
ted initially.
> > >=20
> > > Stephen, maybe you could adjust the generator to take into account th=
e bitmask (of
> > > course if that's a part of the generated code) and then re-gen it all=
 for Sowjanya?
> >=20
> > https://github.com/NVIDIA/tegra-pinmux-scripts holds the scripts that
> > generate tegra-pinctrlNNN.c. See  	soc-to-kernel-pinctrl-driver.py. IIR=
C,
> > tegra-pinctrl.c (the core file) isn't auto-generated. Sowjanya is welco=
me to
> > send a patch to that repo if the code needs to be updated.
>=20
> If we want to do that, we may need to start off by bringing the pinmux
> scripts up to date with the latest version of the generated files. There
> have been a number of changes in the meantime that cause the scripts to
> generate a bit of diff with regards to what's currently upstream. Sounds
> like something fairly trivial, though.

Something like the below should do the trick.

Thierry

--- >8 ---
=46rom 9a684d2ad3c0e0c7b4dbda5904db1fda3757072b Mon Sep 17 00:00:00 2001
=46rom: Thierry Reding <treding@nvidia.com>
Date: Wed, 19 Jun 2019 10:50:57 +0200
Subject: [pinmux scripts PATCH] Update kernel driver template

Some changes in recent years have modified the upstream kernel driver in
some ways that make it incompatible with the current template. Update
the template to take into account changes introduced by the following
commits:

	commit e3d2160f12d6aa7a87d9db09d8458b4a3492cd45
	Author: Paul Gortmaker <paul.gortmaker@windriver.com>
	Date:   Mon May 22 16:56:47 2017 -0400

	    pinctrl: tegra: clean up modular vs. non-modular distinctions

	    None of the Kconfigs for any of these drivers are tristate,
	    meaning that they currently are not being built as a module by anyone.

	    Lets remove the modular code that is essentially orphaned, so that
	    when reading the drivers there is no doubt they are builtin-only.  All
	    drivers get similar changes, so they are handled in batch.

	    We remove module.h from code that isn't doing anything modular at
	    all;  if they have __init sections, then replace it with init.h.

	    A couple drivers have module_exit() code that is essentially orphaned,
	    and so we remove that.

	    Quite a few bool drivers (hence non-modular) are converted over to
	    to builtin_platform_driver().

	    Since module_platform_driver() uses the same init level priority as
	    builtin_platform_driver() the init ordering remains unchanged with
	    this commit.

	    Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

	    We also delete the MODULE_LICENSE tag etc. since all that information
	    was (or is now) contained at the top of the file in the comments.

	    Cc: Linus Walleij <linus.walleij@linaro.org>
	    Cc: Stephen Warren <swarren@wwwdotorg.org>
	    Cc: Thierry Reding <thierry.reding@gmail.com>
	    Cc: Alexandre Courbot <gnurou@gmail.com>
	    Cc: Pritesh Raithatha <praithatha@nvidia.com>
	    Cc: Ashwini Ghuge <aghuge@nvidia.com>
	    Cc: linux-gpio@vger.kernel.org
	    Cc: linux-tegra@vger.kernel.org
	    Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
	    Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

	commit 3c94d2d08a032d911bbe34f2edb24cb63a63644a
	Author: Stefan Agner <stefan@agner.ch>
	Date:   Thu Jul 26 17:40:24 2018 +0200

	    pinctrl: tegra: define GPIO compatible node per SoC

	    Tegra 2 uses a different GPIO controller which uses "tegra20-gpio" as
	    compatible string.

	    Make the compatible string the GPIO node is using a SoC specific
	    property. This prevents the kernel from registering the GPIO range
	    twice in case the GPIO range is specified in the device tree.

	    Fixes: 9462510ce31e ("pinctrl: tegra: Only set the gpio range if neede=
d")
	    Signed-off-by: Stefan Agner <stefan@agner.ch>
	    Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

	commit 1e0813ee5599932c856bda64a568895ed7a33d3a
	Author: Dmitry Osipenko <digetx@gmail.com>
	Date:   Thu Aug 2 14:11:43 2018 +0300

	    pinctrl: tegra: Move drivers registration to arch_init level

	    There is a bug in regards to deferred probing within the drivers core
	    that causes GPIO-driver to suspend after its users. The bug appears if
	    GPIO-driver probe is getting deferred, which happens after introducing
	    dependency on PINCTRL-driver for the GPIO-driver by defining "gpio-ran=
ges"
	    property in device-tree. The bug in the drivers core is old (more than=
 4
	    years now) and is well known, unfortunately there is no easy fix for i=
t.
	    The good news is that we can workaround the deferred probe issue by
	    changing GPIO / PINCTRL drivers registration order and hence by moving
	    PINCTRL driver registration to the arch_init level and GPIO to the
	    subsys_init.

	    Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
	    Acked-by: Stefan Agner <stefan@agner.ch>
	    Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Note that the last one is something that we probably should fix
correctly by using device links rather than working around it by playing
init level tricks.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 soc-to-kernel-pinctrl-driver.py | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/soc-to-kernel-pinctrl-driver.py b/soc-to-kernel-pinctrl-driver=
=2Epy
index 65e4c604f1c9..37f34b15db2b 100755
--- a/soc-to-kernel-pinctrl-driver.py
+++ b/soc-to-kernel-pinctrl-driver.py
@@ -41,22 +41,16 @@ if dbg: print(args)
 soc =3D tegra_pmx_soc_parser.load_soc(args.soc)
=20
 print('''\
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Pinctrl data for the NVIDIA %s pinmux
  *
- * Copyright (c) %s, NVIDIA CORPORATION.  All rights reserved.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
+ * Author: %s
  *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License f=
or
- * more details.
+ * Copyright (c) %s, NVIDIA CORPORATION.  All rights reserved.
  */
=20
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
@@ -68,7 +62,7 @@ print('''\
  * Most pins affected by the pinmux can also be GPIOs. Define these first.
  * These must match how the GPIO driver names/numbers its pins.
  */
-''' % (soc.titlename, soc.kernel_copyright_years), end=3D'')
+''' % (soc.titlename, soc.kernel_author, soc.kernel_copyright_years), end=
=3D'')
=20
 # Do not add any more exceptions here; new SoCs should be formatted correc=
tly
 if soc.name =3D=3D 'tegra30':
@@ -615,6 +609,7 @@ print('''\
=20
 static const struct tegra_pinctrl_soc_data %(soc)s_pinctrl =3D {
 	.ngpios =3D NUM_GPIOS,
+	.gpio_compatible =3D "nvidia,%(soc)s-gpio",
 	.pins =3D %(soc)s_pins,
 	.npins =3D ARRAY_SIZE(%(soc)s_pins),
 	.functions =3D %(soc)s_functions,
@@ -635,7 +630,6 @@ static const struct of_device_id %(soc)s_pinctrl_of_mat=
ch[] =3D {
 	{ .compatible =3D "nvidia,%(soc)s-pinmux", },
 	{ },
 };
-MODULE_DEVICE_TABLE(of, %(soc)s_pinctrl_of_match);
=20
 static struct platform_driver %(soc)s_pinctrl_driver =3D {
 	.driver =3D {
@@ -644,9 +638,10 @@ static struct platform_driver %(soc)s_pinctrl_driver =
=3D {
 	},
 	.probe =3D %(soc)s_pinctrl_probe,
 };
-module_platform_driver(%(soc)s_pinctrl_driver);
=20
-MODULE_AUTHOR("%(author)s");
-MODULE_DESCRIPTION("NVIDIA %(usoc)s pinctrl driver");
-MODULE_LICENSE("GPL v2");
+static int __init %(soc)s_pinctrl_init(void)
+{
+	return platform_driver_register(&%(soc)s_pinctrl_driver);
+}
+arch_initcall(%(soc)s_pinctrl_init);
 ''' % socvars, end=3D'')
--=20
2.21.0


--FhKpTYimqQF2+bfE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0J+PMACgkQ3SOs138+
s6F7mA//QYHaEaJxzYynVY4xVthWaA3pDmSdZ0MD6RnUjFQJeGZNrTTimNQIAFif
ERQYS0tFkl1c86OzaXJVGUAQVY/WeqO8NIT9WlMQynBaHLf3iiTcnUelQL+/MoQr
TDQgs+leuo7SRru8xI2gxltthpO8pxxMkJDlcfwNs31sG0d7Ne9tq9FyXDfduYtI
0dOGDFh6iqeqN1XywDM8bmT3dM23llO+q86M9SRJXP0RJrf+j3+uGUX1cyujslR3
FlOuMFT4GEgpegNsaSKrK+XNFzPaeVHB/upGWM/dRqm5FwHY3YjRp6DtpiONRc4/
CnA+Rx+5xiTTngGmE+0AtMx9JWoZkrirFxhMH5s+9ys1wSP/w+9M6mVvqclyqqgI
sobUjvRa7HRSep1yj9egOKPtt6WAiEeD30V1lH/NtFbQjsgcHYNI391dkvlrytop
sL4TPw7PIhFehEDws2Kx8VhtMwJ1OzBvZ3TgxB1MBgXA7rLOAn2xgKXriekNElU9
SPwaIAnP7sOCVehgltly96Yf/6T9Ava+ipQLlUzspq5Q48vIzU9TRFvrSdmBHqo4
HaWGm9aGTiARGTSvJuTmaDvvNloRouYqLy4uMfuUyn4hvFaR2iW0g0OcN532Lxva
qDpiu1JqjdO1ZGiFB/TsMY+VcufZKSDeDxJt4RU0EheUp3IDGG0=
=fdi4
-----END PGP SIGNATURE-----

--FhKpTYimqQF2+bfE--
