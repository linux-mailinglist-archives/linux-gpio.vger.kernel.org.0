Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE81E2A1ED9
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Nov 2020 16:00:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726730AbgKAPAy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 1 Nov 2020 10:00:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726458AbgKAPAy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 1 Nov 2020 10:00:54 -0500
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C880EC0617A6;
        Sun,  1 Nov 2020 07:00:53 -0800 (PST)
Received: by mail-qk1-x743.google.com with SMTP id x20so9371879qkn.1;
        Sun, 01 Nov 2020 07:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=b4nU2ptCkmP86QnZPWal726t+pg4pGhqWLMU1nytF/A=;
        b=rV6TqHjDTjhCkkx80iGKbfmPKYBFQKG09o9c8oK4TQaTKBWTLqMa/rksRh81F6Mb2k
         T0ezUv0Lx3UJQoyAlxXwQtUJTN6BFagZXMV05ObjclmrcgqluDOqV8W4mvdKlK46WKwy
         FFHREWP6W21CQjwgjjTpL9GazujB5i0RhLbRQOvNikUctIlo9CcfOds9Huk+TJi/YiF5
         O3TCJqpXDdfvKAngbmA9DoDslXCZLGOHLBaXKbeNqlGGZUf3V3M8GWEXcdgt0OOTpFgF
         Sa/Sqyuen6mKgjJ4k0FiQ72gkXP1G5KEzRSWCYsWmiUZZOt9gMZ/pEdEuQw27AFTjbT7
         3urw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b4nU2ptCkmP86QnZPWal726t+pg4pGhqWLMU1nytF/A=;
        b=W5dj2dIUJsW949LBGCULH5jawnvn6qMR7CfuD+hqZ0Fl7HUpMNYgVdOapbe5DNxE0w
         rJzux33rvD3Gcfz32CR5m7/mNWZJz9fb3NnerMR5cFuw7/U7F6qtm+BzNzxPoaqxdkld
         cRi2mXgoEMDQmsy+QZFm7tssNZFnl1RmgT8czQuc5YnA/haFgrYL4OL4DTQM9SvNFc1u
         PSHUQBcZlDmC9U29xRi41Adfy/AjzPbDIMssynNPtYmuPWLvFSsWKS578Z8XhtNR2+GK
         Eud73FYjbEShtqYBTQA4V+odAHKzCK8fdIYEM7nV1SDiY4cbo5KD3duplOvm12xpbnEF
         SCgg==
X-Gm-Message-State: AOAM531MtDbqKL5TjOvlBSwGO3rAEsfopZ6NelzTdWg4D6XmCwzQvyY8
        w6QoHVk+dlS1dWQbKSfFsNo=
X-Google-Smtp-Source: ABdhPJzS1QDaqEfdVNwkvlSTnNVg+nyjfQLFsrmz1oDPeduOHNx3+rs+vL2wNUoLuTjdTHgIR1lUOQ==
X-Received: by 2002:a37:4ccf:: with SMTP id z198mr11480950qka.348.1604242852347;
        Sun, 01 Nov 2020 07:00:52 -0800 (PST)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
        by smtp.gmail.com with ESMTPSA id f1sm6029259qto.18.2020.11.01.07.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2020 07:00:51 -0800 (PST)
Date:   Sun, 1 Nov 2020 10:00:33 -0500
From:   William Breathitt Gray <vilhelm.gray@gmail.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Syed Nayyar Waris <syednwaris@gmail.com>,
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
Message-ID: <20201101150033.GA68138@shinobu>
References: <cover.1603055402.git.syednwaris@gmail.com>
 <15a044d3ba23f00c31fd09437bdd3e5924bb91cd.1603055402.git.syednwaris@gmail.com>
 <CAK8P3a3f=fuq24QwNee3QgoMcSK5rcvLRpdTOWBZ9NJ4d-4bvA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline
In-Reply-To: <CAK8P3a3f=fuq24QwNee3QgoMcSK5rcvLRpdTOWBZ9NJ4d-4bvA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2020 at 11:44:47PM +0100, Arnd Bergmann wrote:
> On Sun, Oct 18, 2020 at 11:44 PM Syed Nayyar Waris <syednwaris@gmail.com>=
 wrote:
> >
> > This patch reimplements the xgpio_set_multiple() function in
> > drivers/gpio/gpio-xilinx.c to use the new generic functions:
> > bitmap_get_value() and bitmap_set_value(). The code is now simpler
> > to read and understand. Moreover, instead of looping for each bit
> > in xgpio_set_multiple() function, now we can check each channel at
> > a time and save cycles.
>=20
> This now causes -Wtype-limits warnings in linux-next with gcc-10:

Hi Arnd,

What version of gcc-10 are you running? I'm having trouble generating
these warnings so I suspect I'm using a different version than you.

Regardless I can see your concern about the code, and I think I have a
solution.

>=20
> > +       u32 *const state =3D chip->gpio_state;
> > +       unsigned int *const width =3D chip->gpio_width;
> > +
> > +       DECLARE_BITMAP(old, 64);
> > +       DECLARE_BITMAP(new, 64);
> > +       DECLARE_BITMAP(changed, 64);
> > +
> > +       spin_lock_irqsave(&chip->gpio_lock[0], flags);
> > +       spin_lock(&chip->gpio_lock[1]);
> > +
> > +       bitmap_set_value(old, state[0], 0, width[0]);
> > +       bitmap_set_value(old, state[1], width[0], width[1]);
>=20
> In file included from ../include/linux/cpumask.h:12,
>                  from ../arch/x86/include/asm/cpumask.h:5,
>                  from ../arch/x86/include/asm/msr.h:11,
>                  from ../arch/x86/include/asm/processor.h:22,
>                  from ../arch/x86/include/asm/timex.h:5,
>                  from ../include/linux/timex.h:65,
>                  from ../include/linux/time32.h:13,
>                  from ../include/linux/time.h:73,
>                  from ../include/linux/stat.h:19,
>                  from ../include/linux/module.h:13,
>                  from ../drivers/gpio/gpio-xilinx.c:11:
> ../include/linux/bitmap.h:639:18: warning: array subscript [1,
> 67108864] is outside array bounds of 'long unsigned int[1]'
> [-Warray-bounds]
>   639 |   map[index + 1] |=3D value >> space;
>       |   ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
> In file included from ../include/linux/kasan-checks.h:5,
>                  from ../include/asm-generic/rwonce.h:26,
>                  from ./arch/x86/include/generated/asm/rwonce.h:1,
>                  from ../include/linux/compiler.h:246,
>                  from ../include/linux/build_bug.h:5,
>                  from ../include/linux/bits.h:22,
>                  from ../include/linux/bitops.h:6,
>                  from ../drivers/gpio/gpio-xilinx.c:8:
> ../drivers/gpio/gpio-xilinx.c:144:17: note: while referencing 'old'
>   144 |  DECLARE_BITMAP(old, 64);
>       |                 ^~~
> ../include/linux/types.h:11:16: note: in definition of macro 'DECLARE_BIT=
MAP'
>    11 |  unsigned long name[BITS_TO_LONGS(bits)]
>       |                ^~~~
> In file included from ../include/linux/cpumask.h:12,
>                  from ../arch/x86/include/asm/cpumask.h:5,
>                  from ../arch/x86/include/asm/msr.h:11,
>                  from ../arch/x86/include/asm/processor.h:22,
>                  from ../arch/x86/include/asm/timex.h:5,
>                  from ../include/linux/timex.h:65,
>                  from ../include/linux/time32.h:13,
>                  from ../include/linux/time.h:73,
>                  from ../include/linux/stat.h:19,
>                  from ../include/linux/module.h:13,
>                  from ../drivers/gpio/gpio-xilinx.c:11:
>=20
> The compiler clearly tries to do range-checking here and notices
> that the index into the fixed-length array on the stack is not correctly
> bounded. It seems this would happen whenever width[0] + width[1]
> is larger than 64.
>=20
> I have just submitted patches for all other -Wtype-limits warnings
> and would like to enable this option by default. Can you try to find
> a way to make this code safer? I would expect that you need a
> variant of bitmap_set_value() that takes an explicit ceiling here,
> and checks the stand and nbits values against that.
>=20
>        Arnd

Let me first verify that I understand the problem correctly. The issue
is the possibility of a stack smash in bitmap_set_value() when the value
of start + nbits is larger than the length of the map bitmap memory
region. This is because index (or index + 1) could be outside the range
of the bitmap memory region passed in as map. Is my understanding
correct here?

In xgpio_set_multiple(), the variables width[0] and width[1] serve as
possible start and nbits values for the bitmap_set_value() calls.
Because width[0] and width[1] are unsigned int variables, GCC considers
the possibility that the value of width[0]/width[1] might exceed the
length of the bitmap memory region named old and thus result in a stack
smash.

I don't know if invalid width values are actually possible for the
Xilinx gpio device, but let's err on the side of safety and assume this
is actually a possibility. We should verify that the combined value of
gpio_width[0] + gpio_width[1] does not exceed 64 bits; we can add a
check for this in xgpio_probe() when we grab the gpio_width values.

However, we're still left with the GCC warnings because GCC is not smart
enough to know that we've already checked the boundary and width[0] and
width[1] are valid values. I suspect we can avoid this warning is we
refactor bitmap_set_value() to increment map seperately and then set it:

static inline void bitmap_set_value(unsigned long *map,
				    unsigned long value,
				    unsigned long start, unsigned long nbits)
{
	const unsigned long offset =3D start % BITS_PER_LONG;
	const unsigned long ceiling =3D round_up(start + 1, BITS_PER_LONG);
	const unsigned long space =3D ceiling - start;

	map +=3D BIT_WORD(start);
	value &=3D GENMASK(nbits - 1, 0);

	if (space >=3D nbits) {
		*map &=3D ~(GENMASK(nbits - 1, 0) << offset);
		*map |=3D value << offset;
	} else {
		*map &=3D ~BITMAP_FIRST_WORD_MASK(start);
		*map |=3D value << offset;
		map++;
		*map &=3D ~BITMAP_LAST_WORD_MASK(start + nbits);
		*map |=3D value >> space;
	}
}

This avoids adding a costly conditional check inside bitmap_set_value()
when almost all bitmap_set_value() calls will have static arguments with
well-defined and obvious boundaries.

Do you think this would be an acceptable solution to resolve your GCC
warnings?

Sincerely,

William Breathitt Gray

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl+ezYcACgkQhvpINdm7
VJKmPxAApWxF+K5dr7TywSmNmPJxv2Lk8pyWwosorrzcPhhJA2E2cc4byIUTStu1
57rgsfCWmL3d19tQBJZpiSTeLN4mM2opM2SkIZcKyA0giDgTHogpqA4MGWpLKPNe
qroipHFC/gB8qUyb2/RA+N+oycAY/pS2GY/YsvtUQnwvTADPdwV7YJprzdAYISTl
DU4kWveqNspIvHIwDGmL+ncqgiop3wxirv8Koqxxj/VeVpgUwaCy2MzhgG971uGl
C8qh7oMOXNe1PBMx8+33C/G1GRSwzAZIZHu0v2EEUky0WtUq0A0YZ/rVRUBOpLRe
9HzEEk2LMh1CoC3fmlu9yky+0PgvoHKKWIDI0yX0FW7ttpD/P/05u1/LCxHx5EjE
E6qZVyfHAYdMTZMT2I0gT8yJn7dci+XZv2uf923lm4BLvS6pNWAK5l0RrdT9PZCE
08KFLbPPt2RCCpwZViqPo+g2OUxrjEgbgz7wX+mdzoPSJpn/e/Bxcy+zOxTc7YK9
UrDStTDVxCRyE43/gX9TkkUg9NU3cwKgJpX6EaINEh15YMvu4Fk/7515WvtzYqfY
rArtnDPkSH0dbbs6Dowm5EFiKFYXQ9J83vHTOhsX82KJT2RLy6QFzUDErl6ux+Z5
7o5oKEOUx8nPAU4NurVit0v/SKFHTWo11H6lYAyHzLwDNYeRNME=
=oKZS
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
