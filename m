Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72DC62AC1E3
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 18:11:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730467AbgKIRL5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 12:11:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729432AbgKIRL5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Nov 2020 12:11:57 -0500
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12BAAC0613CF;
        Mon,  9 Nov 2020 09:11:57 -0800 (PST)
Received: by mail-qk1-x744.google.com with SMTP id d28so3505470qka.11;
        Mon, 09 Nov 2020 09:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jemYJ6c567MDm2TimN7FFD6ow5VgmaYL33gvP4f0b4A=;
        b=TjU+/c1N6d4B9oD89/JF4NOz89XUenVS4+hDi5vHyQhiTNhfD8ISptXq025NNRELjQ
         cZO8cc4A1ESMxwEPhrkWEx6C6yT/Ld5jU6CKsWYYkIe45dxZxAlZWCIkMzExG5qJPr+l
         1iNnVWD5vgUbayq0JsyA9kOGYWg/v9naFTYzbJ7dPEXaopuf8cN6fB7vojS8YiZTfLp8
         mvz8m7Vyuu4/xuET8aT6Dc8oqz6gK0BPrGcUAYB2fq2HlhSgyA6HfQXA4xm5e/rqBf8H
         N4xn3asZ97gE7LCyR1oBQNJy5489Q+fIdzdNbWG06aDttXPE45VtHd4Wh7UoYUi2dPts
         Ai5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jemYJ6c567MDm2TimN7FFD6ow5VgmaYL33gvP4f0b4A=;
        b=GXZ0qq6r+jnhWVNbPO1xObJVOjwc5frfZ1Ur4f/Q5AhCYcuspVmVgom8Jqs29p27bZ
         MRtfw6e/LNjj/8CcpQ3Y+gIOhe8nCXx84Q2LfVp9G75209g27fyaPKBjEZOcZ8T8+kkH
         7rwpB1L/budAVShqfTU9gClhqf5ebV9YevBVuqs/kVMLxHO4xE0QUDJZMGf4jKcv38M7
         cD7dmzZIusiVD0eWoljXfgifozejUbR+pYduQu8IzD9XgXhqyMdomuseH9m3sieRPGv3
         gBIfIc5MIeGZSHOp2VuC5LrmgYfHAKIEXOrX+SUJ2vXAvFco14zJ7FGUpNC351jJ2A1V
         ehrQ==
X-Gm-Message-State: AOAM530InEdwB0rOmNwCxWwcIhj+haa+XS1EhJ2Z/62IkM2nWDXX8ndq
        6J2VJT1d05wj5OPTqoYinnQ=
X-Google-Smtp-Source: ABdhPJxughf8rmNrRiOSBmr+3ei5BiDxcYpXyFFompc+fdahWGIGjKj2CZf5Hw3zmJMXIxb419kUCw==
X-Received: by 2002:a37:4f51:: with SMTP id d78mr14568557qkb.445.1604941916201;
        Mon, 09 Nov 2020 09:11:56 -0800 (PST)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
        by smtp.gmail.com with ESMTPSA id j25sm6193040qtk.79.2020.11.09.09.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 09:11:55 -0800 (PST)
Date:   Mon, 9 Nov 2020 12:11:40 -0500
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
Message-ID: <20201109171140.GA14045@shinobu>
References: <cover.1603055402.git.syednwaris@gmail.com>
 <15a044d3ba23f00c31fd09437bdd3e5924bb91cd.1603055402.git.syednwaris@gmail.com>
 <CAK8P3a3f=fuq24QwNee3QgoMcSK5rcvLRpdTOWBZ9NJ4d-4bvA@mail.gmail.com>
 <20201101150033.GA68138@shinobu>
 <CAK8P3a0y7mh=ZDPefgpawY97gpYv79UXFLBzoGfu3ex2up2aDQ@mail.gmail.com>
 <20201109123411.GA19869@syed>
 <20201109134128.GA5596@shinobu>
 <CAK8P3a2FMkMc0K+hu0pnqC8wEMeapKPkZXaBm+HFYYPTes5NHA@mail.gmail.com>
 <20201109164529.GA28710@syed.domain.name>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="CE+1k2dSO48ffgeK"
Content-Disposition: inline
In-Reply-To: <20201109164529.GA28710@syed.domain.name>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 09, 2020 at 10:15:29PM +0530, Syed Nayyar Waris wrote:
> On Mon, Nov 09, 2020 at 03:41:53PM +0100, Arnd Bergmann wrote:
> > On Mon, Nov 9, 2020 at 2:41 PM William Breathitt Gray
> > <vilhelm.gray@gmail.com> wrote:
> > > On Mon, Nov 09, 2020 at 06:04:11PM +0530, Syed Nayyar Waris wrote:
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
> >=20
> > At least for this caller, the size check would be a compile-time
> > constant that can be eliminated.
> >=20
> > > I wonder if array_index_nospec() might have the side effect of
> > > suppressing these warnings for us. For example, would this work:
> > >
> > > static inline void bitmap_set_value(unsigned long *map,
> > >                                     unsigned long value,
> > >                                     unsigned long start, unsigned lon=
g nbits)
> > > {
> > >         const unsigned long offset =3D start % BITS_PER_LONG;
> > >         const unsigned long ceiling =3D round_up(start + 1, BITS_PER_=
LONG);
> > >         const unsigned long space =3D ceiling - start;
> > >         size_t index =3D BIT_WORD(start);
> > >
> > >         value &=3D GENMASK(nbits - 1, 0);
> > >
> > >         if (space >=3D nbits) {
> > >                 index =3D array_index_nospec(index, index + 1);
> > >
> > >                 map[index] &=3D ~(GENMASK(nbits - 1, 0) << offset);
> > >                 map[index] |=3D value << offset;
> > >         } else {
> > >                 index =3D array_index_nospec(index, index + 2);
> > >
> > >                 map[index + 0] &=3D ~BITMAP_FIRST_WORD_MASK(start);
> > >                 map[index + 0] |=3D value << offset;
> > >                 map[index + 1] &=3D ~BITMAP_LAST_WORD_MASK(start + nb=
its);
> > >                 map[index + 1] |=3D value >> space;
> > >         }
> > > }
> > >
> > > Or is this going to produce the same warning because we're not using =
an
> > > explicit check against the map array size?
> >=20
> > https://godbolt.org/z/fxnsG9
> >=20
> > It still warns about the 'map[index + 1]' access: from all I can tell,
> > gcc mainly complains because it cannot rule out that 'space < nbits',
> > and then it knows the size of 'DECLARE_BITMAP(old, 64)' and finds
> > that if 'index + 0' is correct, then 'index + 1' overflows that array.
> >=20
> >       Arnd
>=20
> Hi Arnd,
>=20
> As suggested by William, sharing another solution to suppress the=20
> compiler warning. Please let me know your views on the below fix. Thanks.
>=20
> If its alright, I shall submit a (new) v13 patchset soon. Let me know.
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
> @@ -15,6 +15,10 @@ static inline void bitmap_set_value(unsigned long *map,
>          } else {
>                  map[index + 0] &=3D ~BITMAP_FIRST_WORD_MASK(start);
>                  map[index + 0] |=3D value << offset;
> +
> +               if (index + 1 >=3D length)
> +                       __builtin_unreachable();
> +
>                  map[index + 1] &=3D ~BITMAP_LAST_WORD_MASK(start + nbits=
);
>                  map[index + 1] |=3D value >> space;
>          }

Hi Syed,

Let's rename 'length' to 'nbits' as Arnd suggested, and rename 'nbits'
to value_width.

William Breathitt Gray

--CE+1k2dSO48ffgeK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl+peEIACgkQhvpINdm7
VJKuwRAAv3CriLlQm8FH9ceCU6mjo550MQi3VOeLqk9As6Rya4KvxJh5RdPVcT3Y
c8AvYbKjncicuUKBZu5t5VV3HOSPsbj3CoFS7IZW829XDbx64uTVkCu4YEDm4N22
Ad5cX5BeXaT9SesC3+OkY+cIrHrN5E80WrMnvKXmw4QY6S+35EmraKTxH8KQ5ew9
GpUWOLpwcx+I7Wls3/GZdwA8EHOa1K1wX/r2EFJ9DAUfdfTWuQFlVUIUWoyPxRYd
BMFSvFJDtMiW+wS1KWImzuCmuiEoeqAq9k5Vw10eFFFyLqmF3tzudM5dXnTi+FV2
0BBRXoTHEocLgTahLBRGtv/NW7FlmVlMps94Pz8IKJYX0XtlP+plzqWU0FngF4xN
3KrKt27qUPGGWKWN7y9wVjNg06BT0ZfdVl4KLTZD43wp2Qs48G9i+ulnSyYGI9UY
5p0n8spoSjHPlepBp81sNMNAAmJPAM1S0o9cAYKRtCujNuBpQDY6fMyDumSYw4KK
HNylvAIIjZCP3O9qgb1053L+i6bB40m40hKud0A99mICLFD/cD5vujclTVmB7YGm
yjgIzAGVVXGjEqMW5QJh0gppuaQC6j8S97dXXZ19bOE50U5Iei9yHLt6x1sVwHTH
kerChebZOZsbEEO2rs/0Zvv7QIBfSxm/0bltRsRFhbMhHrMgQnE=
=/fUf
-----END PGP SIGNATURE-----

--CE+1k2dSO48ffgeK--
