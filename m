Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F31A23DBF48
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 21:57:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231163AbhG3T5N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 15:57:13 -0400
Received: from www.zeus03.de ([194.117.254.33]:56430 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230483AbhG3T5N (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 30 Jul 2021 15:57:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=dFgkfs7h5HCGabqrXi3Y912hwcPp
        W6d1p3avVbd5EtE=; b=I7AryB0/6JUP7ze9vrSOtvEIrmz50OjmSviqecywNpKK
        XXKWynOkf18Zsi7g9jrNY4wlF49uIbs5h8T5yRyYN8uQfXi3ZNA+5FJkU+UQ87jX
        ebWzjGoAo+Ece9jqtUkoizY8bFnQpGjm1+w75GAHawWARzquoOpOCd+1L37WbdA=
Received: (qmail 3099733 invoked from network); 30 Jul 2021 21:57:06 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Jul 2021 21:57:06 +0200
X-UD-Smtp-Session: l3s3148p1@qm26n1zIoKYgAwDPXwtrAFZwfe2Gefyo
Date:   Fri, 30 Jul 2021 21:57:04 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: Re: [RFC PATCH v2 1/1] misc: add sloppy logic analyzer using polling
Message-ID: <YQRZkFApESOIMRmv@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
References: <20210519132528.4394-1-wsa+renesas@sang-engineering.com>
 <20210519132528.4394-2-wsa+renesas@sang-engineering.com>
 <YKUlbsWhT45l5Zm0@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="d/nvodR47AXtcLzp"
Content-Disposition: inline
In-Reply-To: <YKUlbsWhT45l5Zm0@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--d/nvodR47AXtcLzp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andy,

finally I found some time to get back to this one. For anyhting I didn't
comment on, it means I am okay with your suggestion. Thanks for the
review!

> 'For ACPI one may use PRP0001 approach with the following ASL excerpt exa=
mple::
>=20
>     Device (GSLA) {
>         Name (_HID, "PRP0001")
>         Name (_DDN, "GPIO sloppy logic analyzer")
>         Name (_CRS, ResourceTemplate () {
>             GpioIo(Exclusive, PullNone, 0, 0, IoRestrictionNone,
>                 "\\_SB.PCI0.GPIO", 0, ResourceConsumer, , ) { 13 }
>             PinConfig(Exclusive, 0x07, 0, "\\_SB.PCI0.GPIO", 0, ResourceC=
onsumer, ) { 7 }
>             GpioIo(Exclusive, PullNone, 0, 0, IoRestrictionNone,
>                 "\\_SB.PCI0.GPIO", 0, ResourceConsumer, , ) { 12 }
>             PinConfig(Exclusive, 0x07, 0, "\\_SB.PCI0.GPIO", 0, ResourceC=
onsumer, ) { 6 }
>         })
>=20
>         Name (_DSD, Package () {
>             ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
>             Package () {
>                 Package () { "compatible", Package () { "gpio-sloppy-logi=
c-analyzer" } },
>                 Package () {
>                     "probe-gpios", Package () {
>                         ^GSLA, 0, 0, 0,
>                         ^GSLA, 1, 0, 0,
>                     },
>                 Package () {
>                     "probe-names", Package () {
>                         "SCL",
>                         "SDA",
>                     },
>             }
>         })
>=20
> Note, that pin configuration uses pin numbering space, while GPIO resourc=
es
> are in GPIO numbering space, which may be different in ACPI. In other wor=
ds,
> there is no guarantee that GPIO and pins are mapped 1:1, that's why there=
 are
> two different pairs in the example, i.e. {13,12} GPIO vs. {7,6} pin.
>=20
> Yet pin configuration support in Linux kernel is subject to implement.'

Have you tested this snippet? I am totally open to add ACPI but it
should be tested, of course. Is there any on-going effort to add ACPI
pin config?

> > + * Copyright (C) Wolfram Sang <wsa@sang-engineering.com>
> > + * Copyright (C) Renesas Electronics Corporation
>=20
> No years?

After reading this*, I agreed they are not really needed.

* https://www.linuxfoundation.org/blog/copyright-notices-in-open-source-sof=
tware-projects/


> > +#define GPIO_LA_MAX_PROBES 8
> > +#define GPIO_LA_NUM_TESTS 1024
>=20
> I prefer TAB indentation of the values for better reading, but it's up to=
 you.

I don't ;)

> > +	struct debugfs_blob_wrapper meta;
> > +	unsigned long gpio_acq_delay;
> > +	struct device *dev;
>=20
> > +	unsigned int trig_len;
>=20
> On 64-bit arch you may save 4 bytes by moving this to be together with u32
> member above.

I don't want to save bytes here. I sorted the struct for cachelines,
important members first.

> > +static struct dentry *gpio_la_poll_debug_dir;
>=20
> I have seen the idea of looking up the debugfs entry. That said, do we ac=
tually
> need this global variable?

I don't understand the first sentence. And we still need it to clean up?


> > +		/* '10' is length of 'probe00=3D\n\0' */
> > +		add_len =3D strlen(gpio_names[i]) + 10;
> > +		meta =3D devm_krealloc(dev, meta, meta_len + add_len, GFP_KERNEL);
>=20
> First of all, this realloc() pattern *) is bad. While it's tricky and has=
 side
> effects (i.e. it has no leaks) better not to use it to avoid confusion.
>=20
> *) foo =3D realloc(foo, ...); is 101 mistake.

Because generally you lose the old pointer on error. But we don't here
because we are using managed devices.

However, I see that all kernel users of devm_krealloc() are using a
seperate variable and then update the old one. I can do this, too.

> But second, all your use is based on:
>  - all strings are of equal lengths

They are not. The gpio names come from the user via DT or ACPI and can
have an arbitrary length.

> > +	[ ! -d $CPUSETDIR ] && mkdir $CPUSETDIR
>=20
> [ -d ... ] || ...

Will think about it. I think the former is a tad more readable.

> > +			# Check if we could parse something and the channel number fits
> > +			[ $chan !=3D $c -a $chan -le $MAX_CHANS ] 2> /dev/null || { echo "S=
yntax error: $c" && exit 1; }
>=20
> Why 2>/dev/null ?

I forgot, have to recheck.

> > +[ $SAMPLEFREQ -eq 0 ] &&
>=20
>  echo "Invalid sample frequency" && exit 1
>=20
> This kind of stuff deserves an exit function, like

I'll think about it!

All the best,

   Wolfram


--d/nvodR47AXtcLzp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmEEWYwACgkQFA3kzBSg
KbbE7A/7BTvFJM39BOOKYzyCALRnQLBaSnka5lMQnDbBkD8O4XnH8E2q5K16VR8C
ZHga188t5yYYYY3TYaLlepqEVOswWZF795MczPBjyhprqVaMb3UWsYu7Q/Nzptar
DO0sQ2yfUOVGZJHn8lfA9IBaC9MxxkGlzM27NEikB4CzTmi/NKIL4KxtYxNThSm4
0Kc8dyGygDrcj9uD5o88vO0TmiqgTJRagrtzWlH08QLqd5QkBWWxP1BHqcbILbPF
UmZiFF/+pcGMyfGKbaku/LeRfJl7MauVc44rM0p4VCkHCxDX1VnpKy67a2oVmXZj
vgm/XFgI70GagSnxNKXvubtRwexSROVnHKKDOE3+EnjdPja2q6zVKse9qCy1qYcv
XaTSwYRQqTFYKBqFWsm74p49d8eTCQrUsjNofj+kszAbU+AaVG7/hO1EFybx+sby
KTXFRB3h2W7HkQOoIDgSmsiksPGbJQknikC7Hz0fm0uA7gKukbtw4HTCBt9C/4lH
1LiL+DmxSsnVr1yyVPFjS+lOB8+fSJn1MvRArywgidLlfTxyMQ/xFQJ16g5R05ez
Juj2KpnP3ZmJY4PXh2G2rUasN84y34dYA0t7ot6FYvaTU/EIvl4YiBT1jQXczfD/
+5CX4WlEZHQwb6D/iUYemp+LscBZB0Z6eCtVXXbP+Jzt4ao+F7g=
=B0F4
-----END PGP SIGNATURE-----

--d/nvodR47AXtcLzp--
