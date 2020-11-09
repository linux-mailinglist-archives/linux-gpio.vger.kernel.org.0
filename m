Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63F992ABF9A
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 16:18:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732055AbgKIPSj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 10:18:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732012AbgKIPSj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Nov 2020 10:18:39 -0500
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEDE8C0613CF;
        Mon,  9 Nov 2020 07:18:38 -0800 (PST)
Received: by mail-qk1-x744.google.com with SMTP id l2so8217655qkf.0;
        Mon, 09 Nov 2020 07:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3MYXodmecWZKh3hnN0UwkaFHuQclsPCPWCZgVmSDMpw=;
        b=DYrxrO9/UoJuKkWMvtKQYcNQllSECGb4KlJzU71aarmgwKXk1c6NDXusk5aDdyENyH
         WsTVAnvsNTk65h1MxHoeIYdrgflGHJPINdB9JwupZreNxgqFIa20u1FK2+O4/iRsm33w
         BRi3VqiSl+nJchu4/nggtXYCwYQRINIac4JvMAIfY29VTjhBgkst5CJhDkElU/eg3V40
         VdnS9cfVkFugmtYJwZAHF56c1/9zWT9G55h0EblQda5Dyi8lYc2zna3R88ih7D8VuXd3
         wMBTdhTWsBoWSu1IyvEd4ryz/U6luGcTIzW2uY1sh5A1OGHFRcY1P75GD63JrSRIgJyh
         evCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3MYXodmecWZKh3hnN0UwkaFHuQclsPCPWCZgVmSDMpw=;
        b=cHK6xcC99K2h1LLEnYLXJZyhguvSIEZy5VIKsPd+i9mXw1gfNOdTtSxH7N0kVdHCzc
         yDnoSAG8NgzXLiQ6l9ZnO/3373RXE861mDTxxOx6wJe9M8bsj0pkKbXwO3gaadCc0xaj
         PH9tDWfk3hlN8tKDUtFceK/B9mfQSozHsqW+Q0k80XA91mRhQNdAX4dVml2Bs2/cKdpv
         x4dLv7Y6FD4jAnaZgVQdR8StkRkUu2H2V2lNpBnPdXX6FgPmrOwG3t7H7LnZIlGJRCZf
         C9IfXeoSTOq8VsEKjIc8BZlB1wX5GDeDCDeyzb8qwUpjC/Yp9H3cFSIwEMveJwvt7Pw9
         5D3Q==
X-Gm-Message-State: AOAM532ehHYPv56QYqrB07uI+c41TaaBQ/W9qQNG0JoDFUHYYnCIU5Up
        G2jN8je4wldn8IsmpT5Tbutetx1Y0fUwow3H
X-Google-Smtp-Source: ABdhPJwvCKNg9ze8t3JWgfAxxjmpmhmIBijci3jMoWZGhK4c1hV1PVumE99D+dPn7hHRqSELCkIXSg==
X-Received: by 2002:a37:951:: with SMTP id 78mr486077qkj.47.1604935117758;
        Mon, 09 Nov 2020 07:18:37 -0800 (PST)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
        by smtp.gmail.com with ESMTPSA id 205sm807652qki.50.2020.11.09.07.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 07:18:36 -0800 (PST)
Date:   Mon, 9 Nov 2020 10:18:21 -0500
From:   William Breathitt Gray <vilhelm.gray@gmail.com>
To:     Syed Nayyar Waris <syednwaris@gmail.com>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v12 4/4] gpio: xilinx: Utilize generic bitmap_get_value
 and _set_value
Message-ID: <20201109151750.GA10650@shinobu>
References: <cover.1603055402.git.syednwaris@gmail.com>
 <15a044d3ba23f00c31fd09437bdd3e5924bb91cd.1603055402.git.syednwaris@gmail.com>
 <CAK8P3a3f=fuq24QwNee3QgoMcSK5rcvLRpdTOWBZ9NJ4d-4bvA@mail.gmail.com>
 <20201101150033.GA68138@shinobu>
 <CAK8P3a0y7mh=ZDPefgpawY97gpYv79UXFLBzoGfu3ex2up2aDQ@mail.gmail.com>
 <20201109123411.GA19869@syed>
 <20201109134128.GA5596@shinobu>
 <20201109143845.GA8636@shinobu>
 <CACG_h5pkCizF2WOzU7Fb9TdCMbQxE1JoQZ=JPrBACTEwEb03OA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZmUaFz6apKcXQszQ"
Content-Disposition: inline
In-Reply-To: <CACG_h5pkCizF2WOzU7Fb9TdCMbQxE1JoQZ=JPrBACTEwEb03OA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--ZmUaFz6apKcXQszQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 09, 2020 at 08:18:51PM +0530, Syed Nayyar Waris wrote:
> On Mon, Nov 9, 2020 at 8:09 PM William Breathitt Gray
> <vilhelm.gray@gmail.com> wrote:
> >
> > On Mon, Nov 09, 2020 at 08:41:28AM -0500, William Breathitt Gray wrote:
> > > On Mon, Nov 09, 2020 at 06:04:11PM +0530, Syed Nayyar Waris wrote:
> > > > On Sun, Nov 01, 2020 at 09:08:29PM +0100, Arnd Bergmann wrote:
> > > > > On Sun, Nov 1, 2020 at 4:00 PM William Breathitt Gray
> > > > > <vilhelm.gray@gmail.com> wrote:
> > > > > >
> > > > > > On Thu, Oct 29, 2020 at 11:44:47PM +0100, Arnd Bergmann wrote:
> > > > > > > On Sun, Oct 18, 2020 at 11:44 PM Syed Nayyar Waris <syednwari=
s@gmail.com> wrote:
> > > > > > > >
> > > > > > > > This patch reimplements the xgpio_set_multiple() function in
> > > > > > > > drivers/gpio/gpio-xilinx.c to use the new generic functions:
> > > > > > > > bitmap_get_value() and bitmap_set_value(). The code is now =
simpler
> > > > > > > > to read and understand. Moreover, instead of looping for ea=
ch bit
> > > > > > > > in xgpio_set_multiple() function, now we can check each cha=
nnel at
> > > > > > > > a time and save cycles.
> > > > > > >
> > > > > > > This now causes -Wtype-limits warnings in linux-next with gcc=
-10:
> > > > > >
> > > > > > Hi Arnd,
> > > > > >
> > > > > > What version of gcc-10 are you running? I'm having trouble gene=
rating
> > > > > > these warnings so I suspect I'm using a different version than =
you.
> > > > >
> > > > > I originally saw it with the binaries from
> > > > > https://mirrors.edge.kernel.org/pub/tools/crosstool/, but I have
> > > > > also been able to reproduce it with a minimal test case on the
> > > > > binaries from godbolt.org, see https://godbolt.org/z/Wq8q4n
> > > > >
> > > > > > Let me first verify that I understand the problem correctly. Th=
e issue
> > > > > > is the possibility of a stack smash in bitmap_set_value() when =
the value
> > > > > > of start + nbits is larger than the length of the map bitmap me=
mory
> > > > > > region. This is because index (or index + 1) could be outside t=
he range
> > > > > > of the bitmap memory region passed in as map. Is my understandi=
ng
> > > > > > correct here?
> > > > >
> > > > > Yes, that seems to be the case here.
> > > > >
> > > > > > In xgpio_set_multiple(), the variables width[0] and width[1] se=
rve as
> > > > > > possible start and nbits values for the bitmap_set_value() call=
s.
> > > > > > Because width[0] and width[1] are unsigned int variables, GCC c=
onsiders
> > > > > > the possibility that the value of width[0]/width[1] might excee=
d the
> > > > > > length of the bitmap memory region named old and thus result in=
 a stack
> > > > > > smash.
> > > > > >
> > > > > > I don't know if invalid width values are actually possible for =
the
> > > > > > Xilinx gpio device, but let's err on the side of safety and ass=
ume this
> > > > > > is actually a possibility. We should verify that the combined v=
alue of
> > > > > > gpio_width[0] + gpio_width[1] does not exceed 64 bits; we can a=
dd a
> > > > > > check for this in xgpio_probe() when we grab the gpio_width val=
ues.
> > > > > >
> > > > > > However, we're still left with the GCC warnings because GCC is =
not smart
> > > > > > enough to know that we've already checked the boundary and widt=
h[0] and
> > > > > > width[1] are valid values. I suspect we can avoid this warning =
is we
> > > > > > refactor bitmap_set_value() to increment map seperately and the=
n set it:
> > > > >
> > > > > As I understand it, part of the problem is that gcc sees the poss=
ible
> > > > > range as being constrained by the operations on 'start' and 'nbit=
s',
> > > > > in particular the shift in BIT_WORD() that put an upper bound on
> > > > > the index, but then it sees that the upper bound is higher than t=
he
> > > > > upper bound of the array, i.e. element zero.
> > > > >
> > > > > I added a check
> > > > >
> > > > >       if (start >=3D 64 || start + size >=3D 64) return;
> > > > >
> > > > > in the godbolt.org testcase, which does help limit the start
> > > > > index appropriately, but it is not sufficient to let the compiler
> > > > > see that the 'if (space >=3D nbits) ' condition is guaranteed to
> > > > > be true for all values here.
> > > > >
> > > > > > static inline void bitmap_set_value(unsigned long *map,
> > > > > >                                     unsigned long value,
> > > > > >                                     unsigned long start, unsign=
ed long nbits)
> > > > > > {
> > > > > >         const unsigned long offset =3D start % BITS_PER_LONG;
> > > > > >         const unsigned long ceiling =3D round_up(start + 1, BIT=
S_PER_LONG);
> > > > > >         const unsigned long space =3D ceiling - start;
> > > > > >
> > > > > >         map +=3D BIT_WORD(start);
> > > > > >         value &=3D GENMASK(nbits - 1, 0);
> > > > > >
> > > > > >         if (space >=3D nbits) {
> > > > > >                 *map &=3D ~(GENMASK(nbits - 1, 0) << offset);
> > > > > >                 *map |=3D value << offset;
> > > > > >         } else {
> > > > > >                 *map &=3D ~BITMAP_FIRST_WORD_MASK(start);
> > > > > >                 *map |=3D value << offset;
> > > > > >                 map++;
> > > > > >                 *map &=3D ~BITMAP_LAST_WORD_MASK(start + nbits);
> > > > > >                 *map |=3D value >> space;
> > > > > >         }
> > > > > > }
> > > > > >
> > > > > > This avoids adding a costly conditional check inside bitmap_set=
_value()
> > > > > > when almost all bitmap_set_value() calls will have static argum=
ents with
> > > > > > well-defined and obvious boundaries.
> > > > > >
> > > > > > Do you think this would be an acceptable solution to resolve yo=
ur GCC
> > > > > > warnings?
> > > > >
> > > > > Unfortunately, it does not seem to make a difference, as gcc still
> > > > > knows that this compiles to the same result, and it produces the =
same
> > > > > warning as before (see https://godbolt.org/z/rjx34r)
> > > > >
> > > > >          Arnd
> > > >
> > > > Hi Arnd,
> > > >
> > > > Sharing a different version of bitmap_set_valuei() function. See be=
low.
> > > >
> > > > Let me know if the below solution looks good to you and if it resol=
ves
> > > > the above compiler warning.
> > > >
> > > >
> > > > @@ -1,5 +1,5 @@
> > > >  static inline void bitmap_set_value(unsigned long *map,
> > > > -                                    unsigned long value,
> > > > +                                    unsigned long value, const siz=
e_t length,
> > > >                                      unsigned long start, unsigned =
long nbits)
> > > >  {
> > > >          const size_t index =3D BIT_WORD(start);
> > > > @@ -7,6 +7,9 @@ static inline void bitmap_set_value(unsigned long *=
map,
> > > >          const unsigned long ceiling =3D round_up(start + 1, BITS_P=
ER_LONG);
> > > >          const unsigned long space =3D ceiling - start;
> > > >
> > > > +       if (index >=3D length)
> > > > +               return;
> > > > +
> > > >          value &=3D GENMASK(nbits - 1, 0);
> > > >
> > > >          if (space >=3D nbits) {
> > > > @@ -15,6 +18,10 @@ static inline void bitmap_set_value(unsigned lon=
g *map,
> > > >          } else {
> > > >                  map[index + 0] &=3D ~BITMAP_FIRST_WORD_MASK(start);
> > > >                  map[index + 0] |=3D value << offset;
> > > > +
> > > > +               if (index + 1 >=3D length)
> > > > +                       return;
> > > > +
> > > >                  map[index + 1] &=3D ~BITMAP_LAST_WORD_MASK(start +=
 nbits);
> > > >                  map[index + 1] |=3D value >> space;
> > > >          }
> > >
> > > One of my concerns is that we're incurring the latency two additional
> > > conditional checks just to suppress a compiler warning about a case t=
hat
> > > wouldn't occur in the actual use of bitmap_set_value(). I'm hoping
> > > there's a way for us to suppress these warnings without adding onto t=
he
> > > latency of this function; given that bitmap_set_value() is intended to
> > > be used in loops, conditionals here could significantly increase late=
ncy
> > > in drivers.
> > >
> > > I wonder if array_index_nospec() might have the side effect of
> > > suppressing these warnings for us. For example, would this work:
> > >
> > > static inline void bitmap_set_value(unsigned long *map,
> > >                                   unsigned long value,
> > >                                   unsigned long start, unsigned long =
nbits)
> > > {
> > >       const unsigned long offset =3D start % BITS_PER_LONG;
> > >       const unsigned long ceiling =3D round_up(start + 1, BITS_PER_LO=
NG);
> > >       const unsigned long space =3D ceiling - start;
> > >       size_t index =3D BIT_WORD(start);
> > >
> > >       value &=3D GENMASK(nbits - 1, 0);
> > >
> > >       if (space >=3D nbits) {
> > >               index =3D array_index_nospec(index, index + 1);
> > >
> > >               map[index] &=3D ~(GENMASK(nbits - 1, 0) << offset);
> > >               map[index] |=3D value << offset;
> > >       } else {
> > >               index =3D array_index_nospec(index, index + 2);
> > >
> > >               map[index + 0] &=3D ~BITMAP_FIRST_WORD_MASK(start);
> > >               map[index + 0] |=3D value << offset;
> > >               map[index + 1] &=3D ~BITMAP_LAST_WORD_MASK(start + nbit=
s);
> > >               map[index + 1] |=3D value >> space;
> > >       }
> > > }
> > >
> > > Or is this going to produce the same warning because we're not using =
an
> > > explicit check against the map array size?
> > >
> > > William Breathitt Gray
> >
> > After testing my suggestion, it looks like the warnings are still
> > present. :-(
> >
> > Something else I've also considered is perhaps using the GCC built-in
> > function __builtin_unreachable() instead of returning. So in Syed's code
> > we would have the following instead:
> >
> > if (index + 1 >=3D length)
> >         __builtin_unreachable();
> >
> > This might allow GCC to optimize better and avoid the conditional check
> > all together, thus avoiding latency while also hinting enough context to
> > the compiler to suppress the warnings.
> >
> > William Breathitt Gray
>=20
> I also thought of another optimization. Arnd, William, let me know
> what you think about it.
>=20
> Since exceeding the array limit is a rather rare event, we can use the
> gcc extension: 'unlikely'  for the boundary checks.
> We can use it at the two places where 'index' and 'index + 1' is being
> checked against the boundary limit.
>=20
> It might help optimize the code. Wouldn't it?
>=20
> Syed Nayyar Waris

We probably don't need unlikely() because __builtin_unreachable() should
suffice to inform GCC that this condition will never occur -- in other
words, GCC will compile optimized code to avoid the conditional
entirely.

By the way, I think we only need the (index + 1 >=3D length) check; the
first index conditional check is not needed and does not affect the
warnings at all, so we might as well get rid of it.

William Breathitt Gray

--ZmUaFz6apKcXQszQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl+pXb0ACgkQhvpINdm7
VJK52BAA1LRe5gfEIbNcTX8SfZtO2HsJwZac1ScEahNCPJBsTSMn8qc+V7T+H1+T
/JVpzEthfOvcF2X4kc4+4IB4ykOWQPf1RQpvYIRB93aWVFdW+RuynkiyVU9j01op
+9Mjr3WqnRZnLSQetuR0hoxYWvwlRAOJAGtN2pYiKsO4LKrBOe3iwmq+AR1ln37a
YqhzCHMFcRaEp9TQBgICfYypjtjG/APl3AALurL4KRjH9AT3kZH1Rm9nk2HLPltH
bdjtgGj/KzpOGMDIoTqeNeXkZQBecQEmARaiVJt4XLHFoEQGRvr7kpvtbr6MZzNS
LYN5xefmuykJRXDFqEVH7MfW84+0hbgmYSLjCI0vZsalRcOvQLxkffGCtQYSHXkR
O64heM2GrAJJ6/zQOhOc0qtOh7CQbvPhomEjKJu76BVqIJVfy6o7RHAmRlEnZk5G
Z15MyIVda2UvQnDJqvdMUW7TK8AD35UlYYEGCbnx0GO1kDC0dzBiuhX3QrS9ilYj
SSUTohzgcoW1bN9CaY7QYgUPft9SgjAr5A58KPH3ySytm9TZrbFzkRUnC17zye/g
QBOta1psUuAPiS5FN6UxoKCKaFyjgghphwbj+PjEf8J5u/M32Il/XYxSNGy6Iq+d
KVUi9/4Kq0S32eW+eN+vVABNdYKvGhWCNLhyKWDTnMm0poXq4V8=
=FtNx
-----END PGP SIGNATURE-----

--ZmUaFz6apKcXQszQ--
