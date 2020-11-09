Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 846472ABED8
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 15:39:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730474AbgKIOjD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 09:39:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729976AbgKIOjD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Nov 2020 09:39:03 -0500
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62902C0613CF;
        Mon,  9 Nov 2020 06:39:02 -0800 (PST)
Received: by mail-qv1-xf44.google.com with SMTP id b11so4113112qvr.9;
        Mon, 09 Nov 2020 06:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=31xujWu4MTA/dbqXe+y3ET/5R+dp3A0kcbn2zTL5Pxo=;
        b=K9SQgIU8CwVPfN/tbEIN/EI3GEuTrtbM4ZJonIeRM3riwz9jxsQhk1Hlvn8Aue4NOd
         q+Ze/oMa+rELKATFODOlT70gIPFiRTTi/EuY7YUCr5UU5Fw8csRfMLz54GoCuxtk17Qv
         T3ZZB3O7iSQcG75omFxXeo1r2/F8fdYVg04cLQoqbvb+dQ+Ws6/nV80c8a+3+bSM8i+w
         7gV6SsqYvKEARofdaENuizQmhdjhYEtw3IrqcbeXmEqnzvvBRi0c/wa+9PbGi7Isomwv
         X10aisi16wBCST5193wmMb3l4Cu7/VzCs8AkZURqpE0E3xWQa4VdP7FqcaIxugY7/wB8
         N57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=31xujWu4MTA/dbqXe+y3ET/5R+dp3A0kcbn2zTL5Pxo=;
        b=dUuQzwD3q0XLRD8SvYzJ9EXvHhHukpaK8JpTOcP7VzOLaIIcTiIPOqJBGPuMMIN0Ek
         51q+TTlxCGBzBpbPsCNdAOYau4jTjcHH06/h4EI5XyeDK2KI0GPvceOJHuMI/TBppOaF
         sbkEYTGVaNxgYUSfQwk/82St25QHxNB8gL6QpzG5Oe+WDHluWfCXXPyjxGsLdmXhYINE
         BTEpIxHbDdxHiSKkW0g7/Yy2RPuVE1p22MwLv26eKuhamWd7XKCVqDkgdv/k2oC2y7oM
         lmfS2qVPpvt4aRKIreDu3+QE0LlfMYKWaRu3/bax8WkVPBubnJT+G1wUawvUcS6RUCEm
         usKQ==
X-Gm-Message-State: AOAM532ZfGlsUPwVHaqo+lrUaQRIS5A1mK4Kbp22kN6FoN4n02IVjKfw
        +/TPtcQz0pU1NH1GEmDZXNE=
X-Google-Smtp-Source: ABdhPJx5mq8pmTpYL1RXJznOcjIqENswLfHOZSM9RQwuu0hNem/FBb93fCOj4QUJhtcFLVbwAP1CuA==
X-Received: by 2002:a0c:fac6:: with SMTP id p6mr14767275qvo.5.1604932741507;
        Mon, 09 Nov 2020 06:39:01 -0800 (PST)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
        by smtp.gmail.com with ESMTPSA id z16sm6498683qka.18.2020.11.09.06.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 06:39:00 -0800 (PST)
Date:   Mon, 9 Nov 2020 09:38:45 -0500
From:   William Breathitt Gray <vilhelm.gray@gmail.com>
To:     Arnd Bergmann <arnd@kernel.org>,
        Syed Nayyar Waris <syednwaris@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v12 4/4] gpio: xilinx: Utilize generic bitmap_get_value
 and _set_value
Message-ID: <20201109143845.GA8636@shinobu>
References: <cover.1603055402.git.syednwaris@gmail.com>
 <15a044d3ba23f00c31fd09437bdd3e5924bb91cd.1603055402.git.syednwaris@gmail.com>
 <CAK8P3a3f=fuq24QwNee3QgoMcSK5rcvLRpdTOWBZ9NJ4d-4bvA@mail.gmail.com>
 <20201101150033.GA68138@shinobu>
 <CAK8P3a0y7mh=ZDPefgpawY97gpYv79UXFLBzoGfu3ex2up2aDQ@mail.gmail.com>
 <20201109123411.GA19869@syed>
 <20201109134128.GA5596@shinobu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Content-Disposition: inline
In-Reply-To: <20201109134128.GA5596@shinobu>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 09, 2020 at 08:41:28AM -0500, William Breathitt Gray wrote:
> On Mon, Nov 09, 2020 at 06:04:11PM +0530, Syed Nayyar Waris wrote:
> > On Sun, Nov 01, 2020 at 09:08:29PM +0100, Arnd Bergmann wrote:
> > > On Sun, Nov 1, 2020 at 4:00 PM William Breathitt Gray
> > > <vilhelm.gray@gmail.com> wrote:
> > > >
> > > > On Thu, Oct 29, 2020 at 11:44:47PM +0100, Arnd Bergmann wrote:
> > > > > On Sun, Oct 18, 2020 at 11:44 PM Syed Nayyar Waris <syednwaris@gm=
ail.com> wrote:
> > > > > >
> > > > > > This patch reimplements the xgpio_set_multiple() function in
> > > > > > drivers/gpio/gpio-xilinx.c to use the new generic functions:
> > > > > > bitmap_get_value() and bitmap_set_value(). The code is now simp=
ler
> > > > > > to read and understand. Moreover, instead of looping for each b=
it
> > > > > > in xgpio_set_multiple() function, now we can check each channel=
 at
> > > > > > a time and save cycles.
> > > > >
> > > > > This now causes -Wtype-limits warnings in linux-next with gcc-10:
> > > >
> > > > Hi Arnd,
> > > >
> > > > What version of gcc-10 are you running? I'm having trouble generati=
ng
> > > > these warnings so I suspect I'm using a different version than you.
> > >=20
> > > I originally saw it with the binaries from
> > > https://mirrors.edge.kernel.org/pub/tools/crosstool/, but I have
> > > also been able to reproduce it with a minimal test case on the
> > > binaries from godbolt.org, see https://godbolt.org/z/Wq8q4n
> > >=20
> > > > Let me first verify that I understand the problem correctly. The is=
sue
> > > > is the possibility of a stack smash in bitmap_set_value() when the =
value
> > > > of start + nbits is larger than the length of the map bitmap memory
> > > > region. This is because index (or index + 1) could be outside the r=
ange
> > > > of the bitmap memory region passed in as map. Is my understanding
> > > > correct here?
> > >=20
> > > Yes, that seems to be the case here.
> > >=20
> > > > In xgpio_set_multiple(), the variables width[0] and width[1] serve =
as
> > > > possible start and nbits values for the bitmap_set_value() calls.
> > > > Because width[0] and width[1] are unsigned int variables, GCC consi=
ders
> > > > the possibility that the value of width[0]/width[1] might exceed the
> > > > length of the bitmap memory region named old and thus result in a s=
tack
> > > > smash.
> > > >
> > > > I don't know if invalid width values are actually possible for the
> > > > Xilinx gpio device, but let's err on the side of safety and assume =
this
> > > > is actually a possibility. We should verify that the combined value=
 of
> > > > gpio_width[0] + gpio_width[1] does not exceed 64 bits; we can add a
> > > > check for this in xgpio_probe() when we grab the gpio_width values.
> > > >
> > > > However, we're still left with the GCC warnings because GCC is not =
smart
> > > > enough to know that we've already checked the boundary and width[0]=
 and
> > > > width[1] are valid values. I suspect we can avoid this warning is we
> > > > refactor bitmap_set_value() to increment map seperately and then se=
t it:
> > >=20
> > > As I understand it, part of the problem is that gcc sees the possible
> > > range as being constrained by the operations on 'start' and 'nbits',
> > > in particular the shift in BIT_WORD() that put an upper bound on
> > > the index, but then it sees that the upper bound is higher than the
> > > upper bound of the array, i.e. element zero.
> > >=20
> > > I added a check
> > >=20
> > >       if (start >=3D 64 || start + size >=3D 64) return;
> > >=20
> > > in the godbolt.org testcase, which does help limit the start
> > > index appropriately, but it is not sufficient to let the compiler
> > > see that the 'if (space >=3D nbits) ' condition is guaranteed to
> > > be true for all values here.
> > >=20
> > > > static inline void bitmap_set_value(unsigned long *map,
> > > >                                     unsigned long value,
> > > >                                     unsigned long start, unsigned l=
ong nbits)
> > > > {
> > > >         const unsigned long offset =3D start % BITS_PER_LONG;
> > > >         const unsigned long ceiling =3D round_up(start + 1, BITS_PE=
R_LONG);
> > > >         const unsigned long space =3D ceiling - start;
> > > >
> > > >         map +=3D BIT_WORD(start);
> > > >         value &=3D GENMASK(nbits - 1, 0);
> > > >
> > > >         if (space >=3D nbits) {
> > > >                 *map &=3D ~(GENMASK(nbits - 1, 0) << offset);
> > > >                 *map |=3D value << offset;
> > > >         } else {
> > > >                 *map &=3D ~BITMAP_FIRST_WORD_MASK(start);
> > > >                 *map |=3D value << offset;
> > > >                 map++;
> > > >                 *map &=3D ~BITMAP_LAST_WORD_MASK(start + nbits);
> > > >                 *map |=3D value >> space;
> > > >         }
> > > > }
> > > >
> > > > This avoids adding a costly conditional check inside bitmap_set_val=
ue()
> > > > when almost all bitmap_set_value() calls will have static arguments=
 with
> > > > well-defined and obvious boundaries.
> > > >
> > > > Do you think this would be an acceptable solution to resolve your G=
CC
> > > > warnings?
> > >=20
> > > Unfortunately, it does not seem to make a difference, as gcc still
> > > knows that this compiles to the same result, and it produces the same
> > > warning as before (see https://godbolt.org/z/rjx34r)
> > >=20
> > >          Arnd
> >=20
> > Hi Arnd,
> >=20
> > Sharing a different version of bitmap_set_valuei() function. See below.
> >=20
> > Let me know if the below solution looks good to you and if it resolves
> > the above compiler warning.
> >=20
> >=20
> > @@ -1,5 +1,5 @@
> >  static inline void bitmap_set_value(unsigned long *map,
> > -                                    unsigned long value,
> > +                                    unsigned long value, const size_t =
length,
> >                                      unsigned long start, unsigned long=
 nbits)
> >  {
> >          const size_t index =3D BIT_WORD(start);
> > @@ -7,6 +7,9 @@ static inline void bitmap_set_value(unsigned long *map,
> >          const unsigned long ceiling =3D round_up(start + 1, BITS_PER_L=
ONG);
> >          const unsigned long space =3D ceiling - start;
> > =20
> > +       if (index >=3D length)
> > +               return;
> > +
> >          value &=3D GENMASK(nbits - 1, 0);
> > =20
> >          if (space >=3D nbits) {
> > @@ -15,6 +18,10 @@ static inline void bitmap_set_value(unsigned long *m=
ap,
> >          } else {
> >                  map[index + 0] &=3D ~BITMAP_FIRST_WORD_MASK(start);
> >                  map[index + 0] |=3D value << offset;
> > +
> > +               if (index + 1 >=3D length)
> > +                       return;
> > +
> >                  map[index + 1] &=3D ~BITMAP_LAST_WORD_MASK(start + nbi=
ts);
> >                  map[index + 1] |=3D value >> space;
> >          }
>=20
> One of my concerns is that we're incurring the latency two additional
> conditional checks just to suppress a compiler warning about a case that
> wouldn't occur in the actual use of bitmap_set_value(). I'm hoping
> there's a way for us to suppress these warnings without adding onto the
> latency of this function; given that bitmap_set_value() is intended to
> be used in loops, conditionals here could significantly increase latency
> in drivers.
>=20
> I wonder if array_index_nospec() might have the side effect of
> suppressing these warnings for us. For example, would this work:
>=20
> static inline void bitmap_set_value(unsigned long *map,
> 				    unsigned long value,
> 				    unsigned long start, unsigned long nbits)
> {
> 	const unsigned long offset =3D start % BITS_PER_LONG;
> 	const unsigned long ceiling =3D round_up(start + 1, BITS_PER_LONG);
> 	const unsigned long space =3D ceiling - start;
> 	size_t index =3D BIT_WORD(start);
>=20
> 	value &=3D GENMASK(nbits - 1, 0);
>=20
> 	if (space >=3D nbits) {
> 		index =3D array_index_nospec(index, index + 1);
>=20
> 		map[index] &=3D ~(GENMASK(nbits - 1, 0) << offset);
> 		map[index] |=3D value << offset;
> 	} else {
> 		index =3D array_index_nospec(index, index + 2);
>=20
> 		map[index + 0] &=3D ~BITMAP_FIRST_WORD_MASK(start);
> 		map[index + 0] |=3D value << offset;
> 		map[index + 1] &=3D ~BITMAP_LAST_WORD_MASK(start + nbits);
> 		map[index + 1] |=3D value >> space;
> 	}
> }
>=20
> Or is this going to produce the same warning because we're not using an
> explicit check against the map array size?
>=20
> William Breathitt Gray

After testing my suggestion, it looks like the warnings are still
present. :-(

Something else I've also considered is perhaps using the GCC built-in
function __builtin_unreachable() instead of returning. So in Syed's code
we would have the following instead:

if (index + 1 >=3D length)
	__builtin_unreachable();

This might allow GCC to optimize better and avoid the conditional check
all together, thus avoiding latency while also hinting enough context to
the compiler to suppress the warnings.

William Breathitt Gray

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl+pVFUACgkQhvpINdm7
VJJW1BAAk6xJJmtHS69OnMCwCLKFypsREz67ottZekyI0GVuxyVGYk9MhSlxi/P4
+GPwnuLiZU2QR7sg6oi24oOdbw19WjYM5Ogbj4B66fbiBRUVoptGopZ3tkIRSX4b
wh1q2UEPS5fgDkqVpr/8b3QuSkO8QlGs1ypS94wqSGRfMiW+AvE2RRkj2WzyiRPq
KkDGef+sdRD/djGNFOln7mnpDYl4Saa1UEY9OFo+YJkL4BTXSjU5MlNi97xL/ORT
4wFsdKK/hx27anhb3NT8bgwknMrKhtfQrOQESNouaEau9Ggjdv+KFnt8Ykw7tgeV
5bg3U4eKFRpCahF7RpGQJxeA9/bmg2kYDBiy0WPl1IEkwpw91q2PKRexVbzlwvHd
piPYrl+prhzdr9bt00Felr4YstGS4YmgEYe9tzBZR0ubgNDGH5vokaSlBw1kcld+
7k9SdABS2IujnjMy/UYRN2qzkb6QfnqQ9f4gY/Zu2CbEkZb2EuJRGfJabAZ6D2uZ
Z3Hnapj/kmhYUPkJIMmxiYlBG1ZqX5t7o2SXlRRrlNS6LO122+9MASVHqygjiYLi
MNz7nhgJmoMngyQShA9AkQ3xrjtNDEGW5TmvSFMQ2pwWNUyC7a16+IdrZz9Gxpzh
Ts1p6jfHpWP/dUngIWcVxMpX/8AxsIDua5FgLeVSRe/uMvqlMTI=
=1zr1
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--
