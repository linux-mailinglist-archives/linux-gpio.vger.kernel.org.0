Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97E392BAB7C
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Nov 2020 14:46:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbgKTNpQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Nov 2020 08:45:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbgKTNpQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Nov 2020 08:45:16 -0500
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD333C0613CF;
        Fri, 20 Nov 2020 05:45:15 -0800 (PST)
Received: by mail-qk1-x742.google.com with SMTP id u4so8826817qkk.10;
        Fri, 20 Nov 2020 05:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TVErl+yUYUePGU0nTk/KsCd3ew9UC+hz3+AKG6dMjkk=;
        b=LsShfHWjulzMbu9dHKSkWzY4krsEbpkOtPQLqzo4pU9lRPxJ3vt5cYITZmyBgRLB9H
         k2l3oiJpVegQ9uz1a20ejSvp8B38sAUwYHVZF4uPRJ29Csr+jYYkl2IclCNxfUiUHvEm
         gKcs+J66lPHuSbH6PDwJJWkZT17k/TjcLPrxxfngrUxAvfK3Rz77EnGyV9kfIffvnlyd
         HxkKtYQjqeVaxtsGuAMzDvtneTfYaPUdTKYnoGfw7nsZLXDqWFZrFkdr2TqDzfQzf2Ag
         ZxMx3E42ESs/+3mz6q7lC7cWM6dEE0CUvEUWURLoQMG8DtEFrn9f07k2wjnTrhXnStC1
         g0Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TVErl+yUYUePGU0nTk/KsCd3ew9UC+hz3+AKG6dMjkk=;
        b=DhMT8Toz4PVXPGTJ1LjsTh6aa3ARXwyOf0Zq73iO142A3VCUzXFJoG1MHbu7zxjxLl
         EynVqKgYslbNhnmopNkO6Fmz9sZMFxSI+jfhRllXTrcVroyndwVWghPCxL0nCngxZHDC
         cQEjJXw4HcdhvDg6JB3uXGS+fQLLNmfxteArPZkL5U333724lJETxuFEeJbeED0gUUIY
         t6+v7vgpF3XV4fH/BJzWcheVNs4ngSCb1zCSHozZvTNDHwcyKE93RdMDRGRcoBwoIjTX
         AMjSc94O3yMO6MkUKBDvM3bOOEvEuedDWN3lvjXWQpMt7M0lUzLOzhyiiOMEIxswjr/J
         ue6w==
X-Gm-Message-State: AOAM530sVcm2q7V+yoT2l+J8SeGmBEH8AjKunsObprYPXM0zRl2npe+v
        BdGfE1mueVWDhbuYaV6k/f+pzjgz4hazQw==
X-Google-Smtp-Source: ABdhPJzpmL0Ig5oHLbhkd/aQ+lU/SeiuCubucuADElq/qfxeHgOt9X8nQKvQ6XI17LNfft9zFgdy6A==
X-Received: by 2002:a37:6697:: with SMTP id a145mr16917733qkc.296.1605879914980;
        Fri, 20 Nov 2020 05:45:14 -0800 (PST)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
        by smtp.gmail.com with ESMTPSA id x72sm1989260qkb.90.2020.11.20.05.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 05:45:14 -0800 (PST)
Date:   Fri, 20 Nov 2020 08:45:10 -0500
From:   William Breathitt Gray <vilhelm.gray@gmail.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Syed Nayyar Waris <syednwaris@gmail.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v12 4/4] gpio: xilinx: Utilize generic bitmap_get_value
 and _set_value
Message-ID: <X7fIZrTD6dWB8+xI@shinobu>
References: <20201109171140.GA14045@shinobu>
 <20201109172220.GI4077@smile.fi.intel.com>
 <20201109173107.GA14643@shinobu>
 <fe1cfe4c-e4d7-f9fb-1218-7a1d48e6f68a@xilinx.com>
 <20201110123538.GA3193@shinobu>
 <CACG_h5p84sKjDnK5xYRNjGnRzwsbjZ-76P-cC13LKx=7x=4KqQ@mail.gmail.com>
 <20201110174316.GA12192@shinobu>
 <20201110220004.GA25801@syed>
 <CACG_h5orr+smPGFdHbEDAgYS=RUJYZCvf10KjGkkvS9rkbzQFA@mail.gmail.com>
 <CAK8P3a07ohL40kSgj1EJ-EuQk5HUGyVGXE1acsg50PiKf7j=mA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3ntze8mJ8ASb++Up"
Content-Disposition: inline
In-Reply-To: <CAK8P3a07ohL40kSgj1EJ-EuQk5HUGyVGXE1acsg50PiKf7j=mA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--3ntze8mJ8ASb++Up
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2020 at 02:26:35PM +0100, Arnd Bergmann wrote:
> On Fri, Nov 13, 2020 at 5:52 PM Syed Nayyar Waris <syednwaris@gmail.com> =
wrote:
> > On Wed, Nov 11, 2020 at 3:30 AM Syed Nayyar Waris <syednwaris@gmail.com=
> wrote:
> > > On Tue, Nov 10, 2020 at 12:43:16PM -0500, William Breathitt Gray wrot=
e:
> > > > On Tue, Nov 10, 2020 at 10:52:42PM +0530, Syed Nayyar Waris wrote:
> > > > > On Tue, Nov 10, 2020 at 6:05 PM William Breathitt Gray
> > > > > <vilhelm.gray@gmail.com> wrote:
> > > > > >
> > > > > > On Tue, Nov 10, 2020 at 11:02:43AM +0100, Michal Simek wrote:
> > > > > > >
> > > > > > >
> > > > > > > On 09. 11. 20 18:31, William Breathitt Gray wrote:
> > > > > > > > On Mon, Nov 09, 2020 at 07:22:20PM +0200, Andy Shevchenko w=
rote:
> > > > > > > >> On Mon, Nov 09, 2020 at 12:11:40PM -0500, William Breathit=
t Gray wrote:
> > > > > > > >>> On Mon, Nov 09, 2020 at 10:15:29PM +0530, Syed Nayyar War=
is wrote:
> > > > > > > >>>> On Mon, Nov 09, 2020 at 03:41:53PM +0100, Arnd Bergmann =
wrote:
> > > > > > > >>
> > > > > > > >> ...
> > > > > > > >>
> > > > > > > >>>>  static inline void bitmap_set_value(unsigned long *map,
> > > > > > > >>>> -                                    unsigned long value,
> > > > > > > >>>> +                                    unsigned long value=
, const size_t length,
> > > > > > > >>>>                                      unsigned long start=
, unsigned long nbits)
> > > > > > > >>>>  {
> > > > > > > >>>>          const size_t index =3D BIT_WORD(start);
> > > > > > > >>>> @@ -15,6 +15,10 @@ static inline void bitmap_set_value(u=
nsigned long *map,
> > > > > > > >>>>          } else {
> > > > > > > >>>>                  map[index + 0] &=3D ~BITMAP_FIRST_WORD_=
MASK(start);
> > > > > > > >>>>                  map[index + 0] |=3D value << offset;
> > > > > > > >>>> +
> > > > > > > >>>> +               if (index + 1 >=3D length)
> > > > > > > >>>> +                       __builtin_unreachable();
> > > > > > > >>>> +
> > > > > > > >>>>                  map[index + 1] &=3D ~BITMAP_LAST_WORD_M=
ASK(start + nbits);
> > > > > > > >>>>                  map[index + 1] |=3D value >> space;
> > > > > > > >>>>          }
> > > > > > > >>>
> > > > > > > >>> Hi Syed,
> > > > > > > >>>
> > > > > > > >>> Let's rename 'length' to 'nbits' as Arnd suggested, and r=
ename 'nbits'
> > > > > > > >>> to value_width.
> > > > > > > >>
> > > > > > > >> length here is in longs. I guess this is the point of enti=
re patch.
> > > > > > > >
> > > > > > > > Ah yes, this should become 'const unsigned long nbits' and =
represent the
> > > > > > > > length of the bitmap in bits and not longs.
> > > > >
> > > > > Hi William, Andy and All,
> > > > >
> > > > > Thank You for reviewing. I was looking into the review comments a=
nd I
> > > > > have a question on the above.
> > > > >
> > > > > Actually, in bitmap_set_value(), the intended comparison is to be=
 made
> > > > > between 'index + 1' and 'length' (which is now renamed as 'nbits'=
).
> > > > > That is, the comparison would look-like as follows:
> > > > > if (index + 1 >=3D nbits)
> > > > >
> > > > > The 'index' is getting populated with BIT_WORD(start).
> > > > > The 'index' variable in above is the actual index of the bitmap a=
rray,
> > > > > while in previous mail it is suggested to use 'nbits' which repre=
sent
> > > > > the length of the bitmap in bits and not longs.
> > > > >
> > > > > Isn't it comparing two different things? index of array (not the
> > > > > bit-wise-length) on left hand side and nbits (bit-wise-length) on
> > > > > right hand side?
> > > > >
> > > > > Have I misunderstood something? If yes, request to clarify.
> > > > >
> > > > > Or do I have to first divide 'nbits' by BITS_PER_LONG and then co=
mpare
> > > > > it with 'index + 1'? Something like this?
> > > > >
> > > > > Regards
> > > > > Syed Nayyar Waris
> > > >
> > > > The array elements of the bitmap memory region are abstracted away =
for
> > > > the covenience of the users of the bitmap_* functions; the driver
> > > > authors are able to treat their bitmaps as just a set of contiguous=
 bits
> > > > and not worry about where the division between array elements happe=
n.
> > > >
> > > > So to match the interface of the other bitmap_* functions, you shou=
ld
> > > > take in nbits and figure out the actual array length by dividing by
> > > > BITS_PER_LONG inside bitmap_set_value(). Then you can use your
> > > > conditional check (index + 1 >=3D length) like you have been doing =
so far.
> > > >
> > > > William Breathitt Gray
> > >
> > > Hi Arnd,
> > >
> > > Sharing a new version of bitmap_set_value(). Let me know if it looks
> > > good and whether it suppresses the compiler warning.
> > >
> > > The below patch is created against the v12 version of bitmap_set_valu=
e().
> > >
> > > -static inline void bitmap_set_value(unsigned long *map,
> > > -                                    unsigned long value,
> > > -                                    unsigned long start, unsigned lo=
ng nbits)
> > > +static inline void bitmap_set_value(unsigned long *map, unsigned lon=
g nbits,
> > > +                                   unsigned long value, unsigned lon=
g value_width,
> > > +                                   unsigned long start)
> > >  {
> > > -        const size_t index =3D BIT_WORD(start);
> > > +        const unsigned long index =3D BIT_WORD(start);
> > > +        const unsigned long length =3D BIT_WORD(nbits);
> > >          const unsigned long offset =3D start % BITS_PER_LONG;
> > >          const unsigned long ceiling =3D round_up(start + 1, BITS_PER=
_LONG);
> > >          const unsigned long space =3D ceiling - start;
> > >
> > > -        value &=3D GENMASK(nbits - 1, 0);
> > > +        value &=3D GENMASK(value_width - 1, 0);
> > >
> > > -        if (space >=3D nbits) {
> > > -                map[index] &=3D ~(GENMASK(nbits - 1, 0) << offset);
> > > +        if (space >=3D value_width) {
> > > +                map[index] &=3D ~(GENMASK(value_width - 1, 0) << off=
set);
> > >                  map[index] |=3D value << offset;
> > >          } else {
> > >                  map[index + 0] &=3D ~BITMAP_FIRST_WORD_MASK(start);
> > >                  map[index + 0] |=3D value << offset;
> > > -                map[index + 1] &=3D ~BITMAP_LAST_WORD_MASK(start + n=
bits);
> > > +
> > > +               if (index + 1 >=3D length)
> > > +                       __builtin_unreachable();
> > > +
> > > +                map[index + 1] &=3D ~BITMAP_LAST_WORD_MASK(start + v=
alue_width);
> > >                  map[index + 1] |=3D value >> space;
> > >          }
> > >  }
> > >
> > >
> >
> > Hi Arnd,
> >
> > What do you think of the above solution ( new version of
> > bitmap_set_value() )? Does it look good?
>=20
> Sorry for the late reply and thanks for continuing to look at solutions.
>=20
> I don't really like the idea of having the __builtin_unreachable() in
> there, since that would lead to even worse undefined behavior
> (jumping to a random instruction) than the previous one (writing
> to a random location) when invalid data gets passed.
>=20
> Isn't passing the length of the bitmap sufficient to suppress the
> warning (sorry I did not try myself)? If not, maybe this could
> be a "BUG_ON(index + 1 >=3D length)" instead of the
> __builtin_unreachable(). That way it would at least crash
> in a well-defined way.
>=20
>      Arnd

Hi Arnd,

I don't think we need to worry about incorrect values being passed into
bitmap_set_value(). This condition should never be possible in the code
because the boundaries are required to be correct before the function is
called.

This is the same reason other bitmap_* functions such as bitmap_fill()
don't check the boundaries either: they are expected to be correct
before the function is called; the responsibility is on the caller for
ensuring the boundaries are correct.

Our motivation here is simply to silence the GCC warning messages
because GCC is not aware that the boundaries have already been checked.
As such, we're better off using __builtin_unreachable() here because we
can avoid the latency of the conditional check entirely, whereas
BUG_ON() would still have some amount -- albeit small given the
unlikely() within.

William Breathitt Gray

--3ntze8mJ8ASb++Up
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl+3yFIACgkQhvpINdm7
VJJU3w/7BQIfNrrLiKetqTQuwEYNPKZHal+3sxcz7UKuUWiTJpMyK+93KdeEBGGg
lCNyhWcssRpJS6aj0uLH45m4sb0VHiXBNFHRYMoLjwvZKha7bjiVoGtJ+z38y0Rh
TEeYCbNVNw+UFxpl5qKBQfv9RDlbGCpt67OzYmqK2zLjCI5R1p+8W+FtFqhUh0Zy
CX+4jlXtnkYWTca28pZEkFMmL4iR2yOcnQMQBAkLqJxvSaUH7/+suzi5wqM/Svkk
uHOxi/RqU57V3pKuA1wxWGKquMQLVKZCUVy1+7aFdKA5fA0euUobxPxioyKg1r+z
XaTQ+42frAUQ941JUgUYYxDmYBAdcPIOM/uTXA5QnXsto2Htztdqarc7QX67a88K
Yfq8Fy5XrdW2mi9zNLZH26oYyl1dOkhMCppCwnlUMqnMEvxZifVzZgkuJpXuRUBT
IQffZMix5+mu0xUrJ22f3XIw+EV7Qn9+3uwcIXD6TXdaBpGuF9eVwtxHmM0B+jL7
ssAi9mDkBbbDSA67s5KHNEDd6bMail3hdHpvjvmPOem0YQGwzgyQ3X5d2I31DJ98
3juYPYSWNTPCFpG3W8y//FAcnSeSBFFyV7kuGue+hYNpFuKA2bKUogUAjmEIFQwx
+H0fhdBYTXFw/x2SAIiyT9rBh8dLZ1en5zj9R6hG/f5WE4TsEpk=
=TIH+
-----END PGP SIGNATURE-----

--3ntze8mJ8ASb++Up--
