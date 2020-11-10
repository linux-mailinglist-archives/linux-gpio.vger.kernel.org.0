Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 219722AD66B
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 13:35:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730150AbgKJMf4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 07:35:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726900AbgKJMfz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 07:35:55 -0500
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABC50C0613CF;
        Tue, 10 Nov 2020 04:35:55 -0800 (PST)
Received: by mail-qt1-x842.google.com with SMTP id g15so4645334qtq.13;
        Tue, 10 Nov 2020 04:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=60bLFzbvvDvulZgHHBLzky6FOxllzSiEPloCjEA8pOo=;
        b=hF5fRLVFXreI/vBVlZwd3WVd2GWIdaLhN4xkNAnh5Na2ltyYUTpJ7JKX9EZfPAeTIY
         LMu87JVZjdpEyr++y+cz7Mt2uM24qk37umOuc0c0sWWQCXxfRDE7acTDCMOyGqYsIBNp
         VjcfixBnRaRSFhGkn4jpAOTBk010HsZnYvSifyNGa4un9GJEu2e98aqGHJJ24rqrofao
         RnZoSwUPpNB9+BS8PrRAUlRQ3y4EU2eRNHzkIr5yw7m/vxJFl5z3PYmUiO/jsOkkTFD+
         dl1VhAU062OpycQUIjrKVlDcA0cfUwMtRQ/PBeC37XaECr6gg3/9sCG3RQeWREsqYpb8
         +ZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=60bLFzbvvDvulZgHHBLzky6FOxllzSiEPloCjEA8pOo=;
        b=Bhs/AMtCDJuEfSWVUr+25GCDY1fZiKtiTPlX122GZb/nTZgEr/CP4JQCFXj/WykA3j
         NcroRpBa5Q5Yql3wSEKkIA+6mYYdOXbAeveTgUPFkKY4wNFWwyzRcC1uw/JvzPwjbn5m
         XbLxbfaPz9nPFL6YonOWUOt5ml1Tlp2aXw9umfTacYRzCLhEV3T5b3GWMlEsnbC2WACk
         n09uPoZQAthpEYA5xBP2W7wZR7SZjPd9Bl55ugF096exk9j7t/ytikjgCncdDEO8P4Jj
         I3X0rjLE92EjUS/5ZryoLPTFMaBSNBAjiYTaQ2MiYBRWJL1iBaNmZggI7n1/x6QbD7ZJ
         tsLQ==
X-Gm-Message-State: AOAM533PrtycevzgZ6UEre1zaxUG6DfHapBCzXBhYOk9YEZw2+pA0/9m
        QPtDlnLiaAMOOXzVPAljCpXOoBlb7EJVHQ==
X-Google-Smtp-Source: ABdhPJxaW679A5HSdRapxYTFAnw2LNRFRTVmYzW8mwUq6VN/j+tL20nYkl8eh7AzLwt3bxrbi+eKpQ==
X-Received: by 2002:ac8:832:: with SMTP id u47mr17900656qth.376.1605011754845;
        Tue, 10 Nov 2020 04:35:54 -0800 (PST)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
        by smtp.gmail.com with ESMTPSA id a206sm8154425qkb.64.2020.11.10.04.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 04:35:53 -0800 (PST)
Date:   Tue, 10 Nov 2020 07:35:38 -0500
From:   William Breathitt Gray <vilhelm.gray@gmail.com>
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Syed Nayyar Waris <syednwaris@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v12 4/4] gpio: xilinx: Utilize generic bitmap_get_value
 and _set_value
Message-ID: <20201110123538.GA3193@shinobu>
References: <20201101150033.GA68138@shinobu>
 <CAK8P3a0y7mh=ZDPefgpawY97gpYv79UXFLBzoGfu3ex2up2aDQ@mail.gmail.com>
 <20201109123411.GA19869@syed>
 <20201109134128.GA5596@shinobu>
 <CAK8P3a2FMkMc0K+hu0pnqC8wEMeapKPkZXaBm+HFYYPTes5NHA@mail.gmail.com>
 <20201109164529.GA28710@syed.domain.name>
 <20201109171140.GA14045@shinobu>
 <20201109172220.GI4077@smile.fi.intel.com>
 <20201109173107.GA14643@shinobu>
 <fe1cfe4c-e4d7-f9fb-1218-7a1d48e6f68a@xilinx.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Content-Disposition: inline
In-Reply-To: <fe1cfe4c-e4d7-f9fb-1218-7a1d48e6f68a@xilinx.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2020 at 11:02:43AM +0100, Michal Simek wrote:
>=20
>=20
> On 09. 11. 20 18:31, William Breathitt Gray wrote:
> > On Mon, Nov 09, 2020 at 07:22:20PM +0200, Andy Shevchenko wrote:
> >> On Mon, Nov 09, 2020 at 12:11:40PM -0500, William Breathitt Gray wrote:
> >>> On Mon, Nov 09, 2020 at 10:15:29PM +0530, Syed Nayyar Waris wrote:
> >>>> On Mon, Nov 09, 2020 at 03:41:53PM +0100, Arnd Bergmann wrote:
> >>
> >> ...
> >>
> >>>>  static inline void bitmap_set_value(unsigned long *map,
> >>>> -                                    unsigned long value,
> >>>> +                                    unsigned long value, const size=
_t length,
> >>>>                                      unsigned long start, unsigned l=
ong nbits)
> >>>>  {
> >>>>          const size_t index =3D BIT_WORD(start);
> >>>> @@ -15,6 +15,10 @@ static inline void bitmap_set_value(unsigned long=
 *map,
> >>>>          } else {
> >>>>                  map[index + 0] &=3D ~BITMAP_FIRST_WORD_MASK(start);
> >>>>                  map[index + 0] |=3D value << offset;
> >>>> +
> >>>> +               if (index + 1 >=3D length)
> >>>> +                       __builtin_unreachable();
> >>>> +
> >>>>                  map[index + 1] &=3D ~BITMAP_LAST_WORD_MASK(start + =
nbits);
> >>>>                  map[index + 1] |=3D value >> space;
> >>>>          }
> >>>
> >>> Hi Syed,
> >>>
> >>> Let's rename 'length' to 'nbits' as Arnd suggested, and rename 'nbits'
> >>> to value_width.
> >>
> >> length here is in longs. I guess this is the point of entire patch.
> >=20
> > Ah yes, this should become 'const unsigned long nbits' and represent the
> > length of the bitmap in bits and not longs.
> >=20
> >> But to me sounds like it would be better to have simply bitmap_set_val=
ue64() /
> >> bitmap_set_value32() with proper optimization done and forget about va=
riadic
> >> ones for now.
> >=20
> > The gpio-xilinx driver can have arbitrary sizes for width[0] and
> > width[1], so unfortunately that means we don't know the start position
> > nor the width of the value beforehand.
>=20
> Start position should be all the time zero. You can't configure this IP
> to start from bit 2. Width can vary but start is IMHO all the time from
> 0 bit.
>=20
> Thanks,
> Michal

Hi Michal,

I'm referring to the mask creation, not the data bus transfer; see the
implementation of the xgpio_set_multiple() function in linux-next for
reference:
<https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/d=
rivers/gpio/gpio-xilinx.c?h=3Dakpm>.

To generate the old mask we call the following:

	bitmap_set_value(old, state[0], 0, width[0]);
	bitmap_set_value(old, state[1], width[0], width[1]);

Here, width[0] and width[1] can vary, which makes the exact values of
the start and nbits parameters unknown beforehand (although we do know
they are within the bitmap boundary).

Regardless, this is not an issue because we know the bitmap_set_value()
is supposed to be called with valid values. We just need a way to hint
to GCC that this is the case, without increasing the latency of the
function -- which I think is possible if we use __builtin_unreachable()
for the conditional path checking the index against the length of the
bitmap.

William Breathitt Gray

--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl+qiQsACgkQhvpINdm7
VJK9rxAAjpxkczIhzwXaz+E4XRuM/XqMuez8iWkXN5UVvCVejFZ07j6ryXCEfUea
GCIhwymRQewCfGC6thkhclYXJRdlpn2B8/8cwStvpgmlNYL0YNwvw1d1ngaxK3f6
6Xjjl0mdLa41wEj3PooLgCI7gK3gTUqtFQbsOleoTEpJ1ACxTdWqLLC16qnyeK8r
cmp8U6u+Kt8YUK728+ROBWa1DzJtBSZ81f+nFzzpBVTi9i0mOuKdDQea2aX4uSUx
HQ+hqlSYnjYrqY67rqtONM6nTONI/e/ZaN+sHx80NcuBuFOBBUrges+dn4iDJlzX
bGFz5UmomsUz9WJeD8QHMvW7fFjOvUU6ma9n+VhWZPzVNx8p4J/xWEgbZLhGvf88
8lfyBHBk9ToIUF4hsPCBgb2jI+rNRH1a+ux0EzTqu+vzpkrR3goxokt4Cu41CRbg
YzMCMD9rsBpzzuHu+wnyFtQEhlOdw8QwBJVubKKEsdLoirueLUQAdYuNQZVwA6Mh
vFnZgqXfuyNVgVbs8gF9mVn1W0Tu0BIzVQ2prIJQL4ZJTL3P7jCqpZBHBu2AFeXK
cnppEAX6JH0X8YnQCctbkWP6rVtt1dP/0FdPLJ6uD0mKxB4TXCvbN1rzud80st2s
N9FVm09Yc4E24LANBH/SwiigiOIh/3EisQAit81kz74X6P2d2jQ=
=WLlC
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--
