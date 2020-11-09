Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40B762AC253
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 18:31:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731249AbgKIRbk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 12:31:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730315AbgKIRbk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Nov 2020 12:31:40 -0500
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6282C0613CF;
        Mon,  9 Nov 2020 09:31:39 -0800 (PST)
Received: by mail-qv1-xf44.google.com with SMTP id z17so751841qvy.11;
        Mon, 09 Nov 2020 09:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HMIHtoNzchBHFVtanLTb2sQZQycOvpPNIxMNPEE2T40=;
        b=HbF0oxxxVzU/7cNLkG4olbhmHWosI7k82XP7XqE4RfN7gzS/IsIQOILqtxuRGND1QL
         mV/wDFH7e8arLGMfae9/asPBZskQ/E6SLmy24Vkxo9yJGTMENXNzz5TQ280s5FCCcDYt
         LOU97Joga1nf2IheV38qi2d2/xMK/qGN+oCdL7PJT171QrYKybUS3leyNjhiOd+linur
         FLcWlRJsFSrk1dNMKnxhVYod9GZcYYQbQ841u8wd5bDVtzbwZ6uVWSin5mQALyXl0eaG
         urOLCtWWn/C56covg5TixPVWEHCElwDKeXieFNRtmKiTStjK+FcUEwwkdYK4h9tdZS1a
         ThRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HMIHtoNzchBHFVtanLTb2sQZQycOvpPNIxMNPEE2T40=;
        b=CDvFQlbOYmbbydYejtrXWOsLMqJVCBXlmYGbl+tVlokxMSSbFBDuRkSAzP4RsYkIGc
         ck4yRR/l2NxFpk3x63LvZVnC+ckdyjWW/ut7WGElhgySxGiBkbzGese1qzlkaNFM2Wdn
         2WmT/zTFWUE573XIRryLrBmrhjc805VQCpQ6l7ecpUAB4oZzYm8Rxss9f4PdPI/TPGpa
         C1gNvJ5oEGFXZu5kGkk9jOpsoXLk/5M7p/qgFgt/NDuTNgLLgb1YCo+xfgPhKd3RQHm+
         LIZfEhUErIHWcPraoK0lWsQrJcfgZHvF3NgCD63zzf8q28d+hxWisYz1LgPYzl2uEoYo
         2zEg==
X-Gm-Message-State: AOAM531RUbjX4pLfXIZuBqPqYakMJi50+hOJshhGcHEMFkZhePmBC4pN
        gP4Oj4Ws09+Zd4ZGD6sHsk0=
X-Google-Smtp-Source: ABdhPJzpOtrBD8nR+/5Tvg1a/rV7ki4++gxJ6sueoUVdKqES9fgDIPRi/UpOTnN6C6LItoAJFcpq7Q==
X-Received: by 2002:a0c:fdcb:: with SMTP id g11mr15613454qvs.58.1604943099203;
        Mon, 09 Nov 2020 09:31:39 -0800 (PST)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
        by smtp.gmail.com with ESMTPSA id j21sm1606865qtp.10.2020.11.09.09.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 09:31:38 -0800 (PST)
Date:   Mon, 9 Nov 2020 12:31:23 -0500
From:   William Breathitt Gray <vilhelm.gray@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Syed Nayyar Waris <syednwaris@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v12 4/4] gpio: xilinx: Utilize generic bitmap_get_value
 and _set_value
Message-ID: <20201109173107.GA14643@shinobu>
References: <15a044d3ba23f00c31fd09437bdd3e5924bb91cd.1603055402.git.syednwaris@gmail.com>
 <CAK8P3a3f=fuq24QwNee3QgoMcSK5rcvLRpdTOWBZ9NJ4d-4bvA@mail.gmail.com>
 <20201101150033.GA68138@shinobu>
 <CAK8P3a0y7mh=ZDPefgpawY97gpYv79UXFLBzoGfu3ex2up2aDQ@mail.gmail.com>
 <20201109123411.GA19869@syed>
 <20201109134128.GA5596@shinobu>
 <CAK8P3a2FMkMc0K+hu0pnqC8wEMeapKPkZXaBm+HFYYPTes5NHA@mail.gmail.com>
 <20201109164529.GA28710@syed.domain.name>
 <20201109171140.GA14045@shinobu>
 <20201109172220.GI4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DBIVS5p969aUjpLe"
Content-Disposition: inline
In-Reply-To: <20201109172220.GI4077@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--DBIVS5p969aUjpLe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 09, 2020 at 07:22:20PM +0200, Andy Shevchenko wrote:
> On Mon, Nov 09, 2020 at 12:11:40PM -0500, William Breathitt Gray wrote:
> > On Mon, Nov 09, 2020 at 10:15:29PM +0530, Syed Nayyar Waris wrote:
> > > On Mon, Nov 09, 2020 at 03:41:53PM +0100, Arnd Bergmann wrote:
>=20
> ...
>=20
> > >  static inline void bitmap_set_value(unsigned long *map,
> > > -                                    unsigned long value,
> > > +                                    unsigned long value, const size_=
t length,
> > >                                      unsigned long start, unsigned lo=
ng nbits)
> > >  {
> > >          const size_t index =3D BIT_WORD(start);
> > > @@ -15,6 +15,10 @@ static inline void bitmap_set_value(unsigned long =
*map,
> > >          } else {
> > >                  map[index + 0] &=3D ~BITMAP_FIRST_WORD_MASK(start);
> > >                  map[index + 0] |=3D value << offset;
> > > +
> > > +               if (index + 1 >=3D length)
> > > +                       __builtin_unreachable();
> > > +
> > >                  map[index + 1] &=3D ~BITMAP_LAST_WORD_MASK(start + n=
bits);
> > >                  map[index + 1] |=3D value >> space;
> > >          }
> >=20
> > Hi Syed,
> >=20
> > Let's rename 'length' to 'nbits' as Arnd suggested, and rename 'nbits'
> > to value_width.
>=20
> length here is in longs. I guess this is the point of entire patch.

Ah yes, this should become 'const unsigned long nbits' and represent the
length of the bitmap in bits and not longs.

> But to me sounds like it would be better to have simply bitmap_set_value6=
4() /
> bitmap_set_value32() with proper optimization done and forget about varia=
dic
> ones for now.

The gpio-xilinx driver can have arbitrary sizes for width[0] and
width[1], so unfortunately that means we don't know the start position
nor the width of the value beforehand.

William Breathitt Gray

--DBIVS5p969aUjpLe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl+pfOsACgkQhvpINdm7
VJLclhAAqT8dGFX1/kzv3HHKcOJ3cZFrWEnRjD4yfx5iEYcagVfpZEd0Ibfx6VTc
Ul87iiN9atP8dKh6yOEEdSwxa1wYuGYSMU5EV2ChgqRUv7HO/bAYG13b1jwoMaks
ArOf0ZZvJ5p2XIHkTQRH+wT++e3C1VXmdYnsI/GgWrYM1NFOhUob4OU5AUrN418n
r2/bZCiVO5iDFNLUWbpEavtyU2XJY4KL/gwyJWtSJMf3mzN39nvaB9ECE/1aEcaM
+iAyOCiP2UExTuDTOtrerCag5H6RfzHlbe+tsWWWhS84bte42cGdpCZG993NyWDc
yGECb+8/+D1zuwfv1VMmOv5yXJPZRPnYjYxBTjztYLX28F364kJxGFAK2Mx8UhtD
1gGebf9UJBFytquR2BV7thvWb672b2Gwkd0a+mvg7AF9X7bmtEBds0W7FUJJKpWx
bYVS7z+2Ip4TxKrfjHvnaVgky4kwwntuz82CT51pRtPJIz/5oHP69vwJHzl2C/nv
JRBUIQTYjG7qiNvXlaG6ENoANMQTO5A17SWfzpyWytBA0sgTlhCfoyzY/VgnxclL
ceJi1bMaspiFQh6mtfg6qR1DXqnvKNmyXQ1L1a/DFLm9lW6vf+qGeSKhMarp4+6M
3fPzbOmqgMCp4uV/Ws1+VoIZtCMyCDDPJLI8wMuF2V0j7d68L14=
=n0p1
-----END PGP SIGNATURE-----

--DBIVS5p969aUjpLe--
