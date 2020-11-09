Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C30002ABCF2
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 14:42:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733161AbgKINlq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 08:41:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732868AbgKINlp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Nov 2020 08:41:45 -0500
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D1A2C0613CF;
        Mon,  9 Nov 2020 05:41:45 -0800 (PST)
Received: by mail-qk1-x744.google.com with SMTP id q22so581663qkq.6;
        Mon, 09 Nov 2020 05:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6suTyo4TXlaNokCXSHMT1l0mhWwQ6HTAA/EgSaVZH8k=;
        b=HxXrRMJMDA3c0CXRKUCj5J6ueLRDZHlb5EsKxs0hvHoqjciEx8fJRXKM8QJo20cbj5
         zhEe5qS9PbAk9ph8fVZO+h0zb3tzpAaq6BtHcT6CpxG7tHZCuyw9zifJGf6YezGwiYB3
         LJVmGTthjqgG/4yxS1DXPlOqd+Nlu3MR+3XrOvzthf0du8maGbpc25AFFblD8hSIEt65
         zZB0QRiYeUmZIaFprd2ovYaasK+9QFhgJPOj/IeS/vw/eGupQs8OWXfX/6v1p4JMPHlG
         cxxrn4/tqgWhBpOuN6P2/12oD9pSjmGfLQRkBgNwpqrW57As9nyi2h1Xt4uc/D80kGes
         aKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6suTyo4TXlaNokCXSHMT1l0mhWwQ6HTAA/EgSaVZH8k=;
        b=cIiV7ya7rPxHrqmx89Qy8fIwAQbRkujKPAk0qV061Wx+C9nIDPN/P4WftGVsn4Cv9X
         2TrPXs0ctKzeRROVaDUQqZZxrNUy2KZxg5vMI68XDQR9L0PJLESmudyap72mjx5LlY3C
         AtTB71ToOdU3MCiGLJdfoEmX1XjAdjc5N0TWbf8xix3zbds/y1e6b93b5EAWCLmis+TK
         uMdE7oaljFWowM+R98TyYO6/sWOXPaSTPadiZSGCsEZP+7FYBdXKFz/9k1vb4Dm9nW1s
         iRowF0gnQzv8RdCFUB99EBz/kH0mpu8CqlbFBlbNf1Bb+Ve8ZZBEMDDMlAMXGiAtkMfO
         lpAw==
X-Gm-Message-State: AOAM53106giz8QLWZymAsRy0NHc9bcMpAZO21J9wfTxe+HEHJvcVbB3t
        uP53a6XuBjyAI6zUlk32oHQ=
X-Google-Smtp-Source: ABdhPJyI5eMgEbZkAVel5Tv5l3zwCXrtrLf2cCo7PxplIsv2Zw4jKq/hneWxBtta0zpYtrGfDXTfiA==
X-Received: by 2002:a05:620a:10a3:: with SMTP id h3mr2820364qkk.459.1604929304530;
        Mon, 09 Nov 2020 05:41:44 -0800 (PST)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
        by smtp.gmail.com with ESMTPSA id l125sm6214424qkc.111.2020.11.09.05.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 05:41:43 -0800 (PST)
Date:   Mon, 9 Nov 2020 08:41:28 -0500
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
Message-ID: <20201109134128.GA5596@shinobu>
References: <cover.1603055402.git.syednwaris@gmail.com>
 <15a044d3ba23f00c31fd09437bdd3e5924bb91cd.1603055402.git.syednwaris@gmail.com>
 <CAK8P3a3f=fuq24QwNee3QgoMcSK5rcvLRpdTOWBZ9NJ4d-4bvA@mail.gmail.com>
 <20201101150033.GA68138@shinobu>
 <CAK8P3a0y7mh=ZDPefgpawY97gpYv79UXFLBzoGfu3ex2up2aDQ@mail.gmail.com>
 <20201109123411.GA19869@syed>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="k+w/mQv8wyuph6w0"
Content-Disposition: inline
In-Reply-To: <20201109123411.GA19869@syed>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 09, 2020 at 06:04:11PM +0530, Syed Nayyar Waris wrote:
> On Sun, Nov 01, 2020 at 09:08:29PM +0100, Arnd Bergmann wrote:
> > On Sun, Nov 1, 2020 at 4:00 PM William Breathitt Gray
> > <vilhelm.gray@gmail.com> wrote:
> > >
> > > On Thu, Oct 29, 2020 at 11:44:47PM +0100, Arnd Bergmann wrote:
> > > > On Sun, Oct 18, 2020 at 11:44 PM Syed Nayyar Waris <syednwaris@gmai=
l.com> wrote:
> > > > >
> > > > > This patch reimplements the xgpio_set_multiple() function in
> > > > > drivers/gpio/gpio-xilinx.c to use the new generic functions:
> > > > > bitmap_get_value() and bitmap_set_value(). The code is now simpler
> > > > > to read and understand. Moreover, instead of looping for each bit
> > > > > in xgpio_set_multiple() function, now we can check each channel at
> > > > > a time and save cycles.
> > > >
> > > > This now causes -Wtype-limits warnings in linux-next with gcc-10:
> > >
> > > Hi Arnd,
> > >
> > > What version of gcc-10 are you running? I'm having trouble generating
> > > these warnings so I suspect I'm using a different version than you.
> >=20
> > I originally saw it with the binaries from
> > https://mirrors.edge.kernel.org/pub/tools/crosstool/, but I have
> > also been able to reproduce it with a minimal test case on the
> > binaries from godbolt.org, see https://godbolt.org/z/Wq8q4n
> >=20
> > > Let me first verify that I understand the problem correctly. The issue
> > > is the possibility of a stack smash in bitmap_set_value() when the va=
lue
> > > of start + nbits is larger than the length of the map bitmap memory
> > > region. This is because index (or index + 1) could be outside the ran=
ge
> > > of the bitmap memory region passed in as map. Is my understanding
> > > correct here?
> >=20
> > Yes, that seems to be the case here.
> >=20
> > > In xgpio_set_multiple(), the variables width[0] and width[1] serve as
> > > possible start and nbits values for the bitmap_set_value() calls.
> > > Because width[0] and width[1] are unsigned int variables, GCC conside=
rs
> > > the possibility that the value of width[0]/width[1] might exceed the
> > > length of the bitmap memory region named old and thus result in a sta=
ck
> > > smash.
> > >
> > > I don't know if invalid width values are actually possible for the
> > > Xilinx gpio device, but let's err on the side of safety and assume th=
is
> > > is actually a possibility. We should verify that the combined value of
> > > gpio_width[0] + gpio_width[1] does not exceed 64 bits; we can add a
> > > check for this in xgpio_probe() when we grab the gpio_width values.
> > >
> > > However, we're still left with the GCC warnings because GCC is not sm=
art
> > > enough to know that we've already checked the boundary and width[0] a=
nd
> > > width[1] are valid values. I suspect we can avoid this warning is we
> > > refactor bitmap_set_value() to increment map seperately and then set =
it:
> >=20
> > As I understand it, part of the problem is that gcc sees the possible
> > range as being constrained by the operations on 'start' and 'nbits',
> > in particular the shift in BIT_WORD() that put an upper bound on
> > the index, but then it sees that the upper bound is higher than the
> > upper bound of the array, i.e. element zero.
> >=20
> > I added a check
> >=20
> >       if (start >=3D 64 || start + size >=3D 64) return;
> >=20
> > in the godbolt.org testcase, which does help limit the start
> > index appropriately, but it is not sufficient to let the compiler
> > see that the 'if (space >=3D nbits) ' condition is guaranteed to
> > be true for all values here.
> >=20
> > > static inline void bitmap_set_value(unsigned long *map,
> > >                                     unsigned long value,
> > >                                     unsigned long start, unsigned lon=
g nbits)
> > > {
> > >         const unsigned long offset =3D start % BITS_PER_LONG;
> > >         const unsigned long ceiling =3D round_up(start + 1, BITS_PER_=
LONG);
> > >         const unsigned long space =3D ceiling - start;
> > >
> > >         map +=3D BIT_WORD(start);
> > >         value &=3D GENMASK(nbits - 1, 0);
> > >
> > >         if (space >=3D nbits) {
> > >                 *map &=3D ~(GENMASK(nbits - 1, 0) << offset);
> > >                 *map |=3D value << offset;
> > >         } else {
> > >                 *map &=3D ~BITMAP_FIRST_WORD_MASK(start);
> > >                 *map |=3D value << offset;
> > >                 map++;
> > >                 *map &=3D ~BITMAP_LAST_WORD_MASK(start + nbits);
> > >                 *map |=3D value >> space;
> > >         }
> > > }
> > >
> > > This avoids adding a costly conditional check inside bitmap_set_value=
()
> > > when almost all bitmap_set_value() calls will have static arguments w=
ith
> > > well-defined and obvious boundaries.
> > >
> > > Do you think this would be an acceptable solution to resolve your GCC
> > > warnings?
> >=20
> > Unfortunately, it does not seem to make a difference, as gcc still
> > knows that this compiles to the same result, and it produces the same
> > warning as before (see https://godbolt.org/z/rjx34r)
> >=20
> >          Arnd
>=20
> Hi Arnd,
>=20
> Sharing a different version of bitmap_set_valuei() function. See below.
>=20
> Let me know if the below solution looks good to you and if it resolves
> the above compiler warning.
>=20
>=20
> @@ -1,5 +1,5 @@
>  static inline void bitmap_set_value(unsigned long *map,
> -                                    unsigned long value,
> +                                    unsigned long value, const size_t le=
ngth,
>                                      unsigned long start, unsigned long n=
bits)
>  {
>          const size_t index =3D BIT_WORD(start);
> @@ -7,6 +7,9 @@ static inline void bitmap_set_value(unsigned long *map,
>          const unsigned long ceiling =3D round_up(start + 1, BITS_PER_LON=
G);
>          const unsigned long space =3D ceiling - start;
> =20
> +       if (index >=3D length)
> +               return;
> +
>          value &=3D GENMASK(nbits - 1, 0);
> =20
>          if (space >=3D nbits) {
> @@ -15,6 +18,10 @@ static inline void bitmap_set_value(unsigned long *map,
>          } else {
>                  map[index + 0] &=3D ~BITMAP_FIRST_WORD_MASK(start);
>                  map[index + 0] |=3D value << offset;
> +
> +               if (index + 1 >=3D length)
> +                       return;
> +
>                  map[index + 1] &=3D ~BITMAP_LAST_WORD_MASK(start + nbits=
);
>                  map[index + 1] |=3D value >> space;
>          }

One of my concerns is that we're incurring the latency two additional
conditional checks just to suppress a compiler warning about a case that
wouldn't occur in the actual use of bitmap_set_value(). I'm hoping
there's a way for us to suppress these warnings without adding onto the
latency of this function; given that bitmap_set_value() is intended to
be used in loops, conditionals here could significantly increase latency
in drivers.

I wonder if array_index_nospec() might have the side effect of
suppressing these warnings for us. For example, would this work:

static inline void bitmap_set_value(unsigned long *map,
				    unsigned long value,
				    unsigned long start, unsigned long nbits)
{
	const unsigned long offset =3D start % BITS_PER_LONG;
	const unsigned long ceiling =3D round_up(start + 1, BITS_PER_LONG);
	const unsigned long space =3D ceiling - start;
	size_t index =3D BIT_WORD(start);

	value &=3D GENMASK(nbits - 1, 0);

	if (space >=3D nbits) {
		index =3D array_index_nospec(index, index + 1);

		map[index] &=3D ~(GENMASK(nbits - 1, 0) << offset);
		map[index] |=3D value << offset;
	} else {
		index =3D array_index_nospec(index, index + 2);

		map[index + 0] &=3D ~BITMAP_FIRST_WORD_MASK(start);
		map[index + 0] |=3D value << offset;
		map[index + 1] &=3D ~BITMAP_LAST_WORD_MASK(start + nbits);
		map[index + 1] |=3D value >> space;
	}
}

Or is this going to produce the same warning because we're not using an
explicit check against the map array size?

William Breathitt Gray

--k+w/mQv8wyuph6w0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl+pRvQACgkQhvpINdm7
VJJpyQ//bhvn/+QqYckOWct6OuWH4FmJK16nBeN5cVHQfhgnIZZ0PplxJ9l7JaLd
7xCphMvKonQXLBzNBdKpRLxIBZEt7qG3Fc3b4VBkEdV1iUGLQ2YddoMbwJdNYpt3
WxaP81/eDq6SJrKqy6+3RB3S/fkfzywYMVLYnXnt1Di6Z7JsRD28vWdMvZC2CdM9
yKxdHkxn/VqjaS6czPlAwlElKG+YvKv2wSyzSoj9dIBNd1WdFH4zLi8DxZPe/jtd
gtCWqpzI80pDLMH+WGyh8vKqfGmccohZ5QYsaNJBbexa473BjZlovrt+Krsdoeho
UvP0Urn5DRRZDyuPQ57VOhNnCbv01g4/+UD/pnh/JvpduXph9O14KvlTkplC8H2f
ibhan9bywAHwoZuup+oWak+hZgPT6+W4GXxwvLhIFRUY+jXsCzs5FcSeqCjlOGcf
pPToEoWGnhKuO/nrgxbIHaDzH7JAa7IYmD7Z9Jzvb5Cv63IeKQj25tf2yBh/AbKD
vSaJftmu0ItxbRrFGFVV15Ju0mYZFZSYJ5Eisa5YWhin8IilFV2G4wR9j86/iVDE
9xrovGSEwpjnLZrfjAyecXwJfr4VbPBocYhq4dwbx0yi8kbDmJcahU9W8r7opfVU
NxmDdy28i/hGCzqkiqhTpST71FZEJvope2elB+T1wTID5LYaHkc=
=wbBm
-----END PGP SIGNATURE-----

--k+w/mQv8wyuph6w0--
