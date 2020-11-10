Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C9842ADD3B
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 18:43:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730497AbgKJRnc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 12:43:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726428AbgKJRnc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 12:43:32 -0500
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0729CC0613CF;
        Tue, 10 Nov 2020 09:43:32 -0800 (PST)
Received: by mail-qt1-x841.google.com with SMTP id i12so9166315qtj.0;
        Tue, 10 Nov 2020 09:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DKkPU+8hqJwckrB66qB9FLVQlvNA5eR+TbpWXqlMT4I=;
        b=iFSVLGMVyBy4qKxQeFHL+M7wlTMsuNJM1upYnG91TFB8htl2Zih8wZKxR+JvJwAzuH
         JXLoqa8hgDBz5pEF71R30ICrxocy5etvcED+WcT480rL2XoHW+p0isEc2bDuYdmH8ZSC
         uCsFUsZO2lF1SRsZ7urH8zemaY0v7vAaxY+DU8jupxcP0sxMR2YW9sdxwAfFfQPWwGEF
         Dk/owg/zyX7xH7CPdVfVevxC7KpWTeOzjsBpSoQK0KIi3bGGXPGlX7Dt9rESy9UmkgGv
         mqDS6mCBkf1pUvgfALdABgihsGF0sRsZOsNIucVrppXhoZ2538Oixf2tRRM6d4rDl2yI
         RUvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DKkPU+8hqJwckrB66qB9FLVQlvNA5eR+TbpWXqlMT4I=;
        b=hague3Wh6Qp2dxdVDxpsE1qUlWMmIFs4zQuUQAdEYg/KTv0OtdiQgrZJHdIiE9ogE5
         AIaOq4ln8sf4NpqP805qwfeLZ4c5WB3hsTDp7s+sQecAeaCc3yhbAgj2ZRgxem3AXf+A
         VuUyyy4RFQZE+DU/kzp3kd0tncjEu+uh99XvXuGMTj7BMHt3JiHzkEieYAUp0+8uFhN+
         8OirY90RKargbjXBpjcAoSSieD27q9ucGQ9JtOKbbtiAfS733vxF9Oo9APTUImUHwkPd
         iUyWChiwzQ0ieBVcCtoU1C2zITARTmic5CfxVf7ImjVbUvuTjikc+qFDjORsq40X49pJ
         pJ/g==
X-Gm-Message-State: AOAM5316NbUxfUwCflVwhaHrRUHuAR0Bsw7tp3uc5ZlsqGrheQrutMHn
        hwssAJw71WEhDZcV5u+DNlzfZ13gLe10WA==
X-Google-Smtp-Source: ABdhPJx8fmOkO1d0v3o7izwEVdKHZLmUW17kkIhYIu7BLwqcnnBiAzFBRTCnR7QpXD9MuZSEhAvKAA==
X-Received: by 2002:ac8:d48:: with SMTP id r8mr19197194qti.69.1605030211198;
        Tue, 10 Nov 2020 09:43:31 -0800 (PST)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
        by smtp.gmail.com with ESMTPSA id o14sm8694953qto.16.2020.11.10.09.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 09:43:30 -0800 (PST)
Date:   Tue, 10 Nov 2020 12:43:16 -0500
From:   William Breathitt Gray <vilhelm.gray@gmail.com>
To:     Syed Nayyar Waris <syednwaris@gmail.com>
Cc:     Michal Simek <michal.simek@xilinx.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v12 4/4] gpio: xilinx: Utilize generic bitmap_get_value
 and _set_value
Message-ID: <20201110174316.GA12192@shinobu>
References: <20201109123411.GA19869@syed>
 <20201109134128.GA5596@shinobu>
 <CAK8P3a2FMkMc0K+hu0pnqC8wEMeapKPkZXaBm+HFYYPTes5NHA@mail.gmail.com>
 <20201109164529.GA28710@syed.domain.name>
 <20201109171140.GA14045@shinobu>
 <20201109172220.GI4077@smile.fi.intel.com>
 <20201109173107.GA14643@shinobu>
 <fe1cfe4c-e4d7-f9fb-1218-7a1d48e6f68a@xilinx.com>
 <20201110123538.GA3193@shinobu>
 <CACG_h5p84sKjDnK5xYRNjGnRzwsbjZ-76P-cC13LKx=7x=4KqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline
In-Reply-To: <CACG_h5p84sKjDnK5xYRNjGnRzwsbjZ-76P-cC13LKx=7x=4KqQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2020 at 10:52:42PM +0530, Syed Nayyar Waris wrote:
> On Tue, Nov 10, 2020 at 6:05 PM William Breathitt Gray
> <vilhelm.gray@gmail.com> wrote:
> >
> > On Tue, Nov 10, 2020 at 11:02:43AM +0100, Michal Simek wrote:
> > >
> > >
> > > On 09. 11. 20 18:31, William Breathitt Gray wrote:
> > > > On Mon, Nov 09, 2020 at 07:22:20PM +0200, Andy Shevchenko wrote:
> > > >> On Mon, Nov 09, 2020 at 12:11:40PM -0500, William Breathitt Gray w=
rote:
> > > >>> On Mon, Nov 09, 2020 at 10:15:29PM +0530, Syed Nayyar Waris wrote:
> > > >>>> On Mon, Nov 09, 2020 at 03:41:53PM +0100, Arnd Bergmann wrote:
> > > >>
> > > >> ...
> > > >>
> > > >>>>  static inline void bitmap_set_value(unsigned long *map,
> > > >>>> -                                    unsigned long value,
> > > >>>> +                                    unsigned long value, const =
size_t length,
> > > >>>>                                      unsigned long start, unsign=
ed long nbits)
> > > >>>>  {
> > > >>>>          const size_t index =3D BIT_WORD(start);
> > > >>>> @@ -15,6 +15,10 @@ static inline void bitmap_set_value(unsigned =
long *map,
> > > >>>>          } else {
> > > >>>>                  map[index + 0] &=3D ~BITMAP_FIRST_WORD_MASK(sta=
rt);
> > > >>>>                  map[index + 0] |=3D value << offset;
> > > >>>> +
> > > >>>> +               if (index + 1 >=3D length)
> > > >>>> +                       __builtin_unreachable();
> > > >>>> +
> > > >>>>                  map[index + 1] &=3D ~BITMAP_LAST_WORD_MASK(star=
t + nbits);
> > > >>>>                  map[index + 1] |=3D value >> space;
> > > >>>>          }
> > > >>>
> > > >>> Hi Syed,
> > > >>>
> > > >>> Let's rename 'length' to 'nbits' as Arnd suggested, and rename 'n=
bits'
> > > >>> to value_width.
> > > >>
> > > >> length here is in longs. I guess this is the point of entire patch.
> > > >
> > > > Ah yes, this should become 'const unsigned long nbits' and represen=
t the
> > > > length of the bitmap in bits and not longs.
>=20
> Hi William, Andy and All,
>=20
> Thank You for reviewing. I was looking into the review comments and I
> have a question on the above.
>=20
> Actually, in bitmap_set_value(), the intended comparison is to be made
> between 'index + 1' and 'length' (which is now renamed as 'nbits').
> That is, the comparison would look-like as follows:
> if (index + 1 >=3D nbits)
>=20
> The 'index' is getting populated with BIT_WORD(start).
> The 'index' variable in above is the actual index of the bitmap array,
> while in previous mail it is suggested to use 'nbits' which represent
> the length of the bitmap in bits and not longs.
>=20
> Isn't it comparing two different things? index of array (not the
> bit-wise-length) on left hand side and nbits (bit-wise-length) on
> right hand side?
>=20
> Have I misunderstood something? If yes, request to clarify.
>=20
> Or do I have to first divide 'nbits' by BITS_PER_LONG and then compare
> it with 'index + 1'? Something like this?
>=20
> Regards
> Syed Nayyar Waris

The array elements of the bitmap memory region are abstracted away for
the covenience of the users of the bitmap_* functions; the driver
authors are able to treat their bitmaps as just a set of contiguous bits
and not worry about where the division between array elements happen.

So to match the interface of the other bitmap_* functions, you should
take in nbits and figure out the actual array length by dividing by
BITS_PER_LONG inside bitmap_set_value(). Then you can use your
conditional check (index + 1 >=3D length) like you have been doing so far.

William Breathitt Gray

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl+q0SkACgkQhvpINdm7
VJKhMRAAricUh4JzphV3n0FFvtd+6BR3bMIY06bgAWbzFhvOBj4P78ZZCZTabPS4
ba11PaSdWz4ZHIiOihh+22uiEdIKYGz0cnYE1ZmvDg62HGqkwbpIQX3ei5wR37aQ
R2LG0yCryexwxpKwPfiJ5hlSx9MBhaGOi9ptSRQM+OD0WYqyn+YDcXDhnBA6NEXa
yDpqEkoA0w5BOuBHIxb4aUeKx58bz2n2mRCTi68QtMg5e8n6sww5gAQV1Vxg56IZ
qY0BoE7JwReQI54fo/TuiIgR145pvYoTFsBO5VnTmXd/E4AN+9k4TBZMinVv3saj
2qH0Az6xs9LEhpD1acgLh8v3EjM8uFzUcRUDaKRZU4BUiXMBdB8CQpHqqWoQUiDS
8nV4jaZE34dFwHRbB13Bl67FztviugMyul8Hv1oPdbOeaY3CSuy7Up8j5kI0YcVJ
tl+Ev9Df2GPkLzV+Am9XP62GN5lZ3DnCLdpYRs+VIK3cdzgNLD4rMF3rIjHeFEHV
jWdpF/SqlX9+6rWYpxFmUXaafBUVWB3E/ExDXgATeiEeQC1jmVVVHZ43JBSrQi81
CsaQtRs0fpxuyT1HhG/y6yFMzooZAkrvCAsbiS7yCyYm1AAvsSUjybkdTsklzVUo
+s3CiEe7Wz40kn/BJHIWUy0fiwWgdKCROw8C8bzEdKEUco60EB8=
=lx3m
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--
