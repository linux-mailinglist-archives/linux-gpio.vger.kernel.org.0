Return-Path: <linux-gpio+bounces-28604-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F5CC650A0
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 17:07:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 0DFCE289F2
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 16:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B4E62C0F9A;
	Mon, 17 Nov 2025 16:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jeQTizyy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316652C08AC
	for <linux-gpio@vger.kernel.org>; Mon, 17 Nov 2025 16:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763395616; cv=none; b=r3GVKMkWDNpQRWH/N5e+L7t8+OjYBP5lTFjDLfogG33IBbekAVFTiwaD4uYpgGQeeJbbLLLnxL9Fs8k+kLapTnwTYhUqRqTcsu6pWxRAKIDoitndxpzk1X8FNihdyw5OQGK8sMgWw93iXdoJr8nfybLfFUVf86T3PPQH4EOxdQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763395616; c=relaxed/simple;
	bh=izZsVy3Iawv6fyV0jxDR1JaVXJ8J+X05laDZK08GkSc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R4wO6tfidEiR8fCc0Zaruj33/u0GIpwIBAjJ9k0f7jnAxA0kqiY39NTvBrEgnugBJs2RbF3qeGmN4AMaRVactvi/iDwoI+9Mu9x0oIz0k5BvWToYBjpndoR4l6tlSD49f+VIAV2HhICPIRVxDaVa91TiGynQt1MyhnL5Nn47r9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jeQTizyy; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6419e6dab7fso6691075a12.2
        for <linux-gpio@vger.kernel.org>; Mon, 17 Nov 2025 08:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763395613; x=1764000413; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BiBK+vo0XuHL/4HEvmT/p4MV7vaYubfjeUSMDyqAwOY=;
        b=jeQTizyydfeOW+JNuD3n/sb1SgY/gcC2xXz9w4tVyaod9VmrXyacZMjD+Bx6Oc7hXn
         EddFQOPmknlK7ZN7bHLsZIWnKOMPiSphEX6NSRXjRKtvDIkwt6tqWHyGFt5VRGwofkV4
         o9m+F7w0io1SX0G8t1EHHPaA62daKh2Bnxn6Ef6b5ck78CEvJS/OuQB/Um+56n0yn/I2
         9JUnoLyIQ6H/wTFFniHqzNYguZ7vNVpaCSd9bhmv/0/C15AcPzDqZVOEpA1mcn7QS0Kp
         +gc+dGtBkZmZ2quzXKPJSfYnA990ysAJ54RVr54LhbbOCzz0CthdszxF4EUxSpWgm0Dc
         Z83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763395613; x=1764000413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BiBK+vo0XuHL/4HEvmT/p4MV7vaYubfjeUSMDyqAwOY=;
        b=WPwPATauMQ3eOrqpF4QFyODTUxsLUd2Dp/dtK/6l/Cr2rXtjhMxnBmCfY2BjCqXG13
         Sf+IdUTLEM+9J3q43nN/v4IO5WAtG+i3tqLtRAq65pVdjQbqv3yZCa0Z4ltU3bjeHzo8
         nxeDvhz1+JBRHD+PkHT523G7aeudwybnv8Djy0iW/igwS2I3I+tZXjZ72X0LeV7TkJFi
         87mBXF254Z4pcBUTk1+FWgBnYba4IPwoWBn3wKcrYMf0WpkSI6BN7CcqJTnSZV8zro3P
         5sWSb2yK8QKe04wJAMXzPr9rcvSS7kytv/iqc3Fop2WaM0pTIJ/94HIxAYWcbGEAlUJJ
         HgCg==
X-Forwarded-Encrypted: i=1; AJvYcCXX8iAe4afhkaeSQq0a4oIvp23+bQqeAe2T+OfypMIQ6U5BlSsGDkUmeV3VcqbaUuwrczJE0xo5MKo0@vger.kernel.org
X-Gm-Message-State: AOJu0YzVpzib4JoX7CT20kiBiO7kuxEgVVLj6JcDrH1rOv31aT+tQtzh
	wP8IR23kPGfAgX3o0l2GeOP2mCOjgmGfYer47Fy9t39+2frFnW1bhYjVx5cgpXNIAt4FnuCnIVc
	s5cqJO0mkfvotC+rQLgYkFT3IN3NgXsM=
X-Gm-Gg: ASbGncvJTqx7KEGBafB5pxziTtoCxW71PjAUmAsQN3ngmC6ZObH4S7BBcl1Fj8zGKwh
	aLOVaxJt3yiK2iVKyz78FkUgDTz6jeYWnmGSZg+coJOvutbcV5i9qqHOgaYmU4/K2HZhfrmDUE2
	6GoV4grgIuYsJ90hFGsW6U62xq+HMyy+SedVQYEDR5vFJddt4p/vLraI3fMtRrTSWaqRA5qBDsS
	eZBDH51WdoPxFR1biIYKiqitvavIMHikROwTEYvx8wNtlUp75JBivQwYqaxhMmDFb6SmaQjI1YW
	HvurXIH96PxpZ2GAkfykeRgTavSOhtWyi/B4/Y9gTLZ3+eZDHFMW0b5SVYmn8y/Tre2aqR8=
X-Google-Smtp-Source: AGHT+IHNPimzq90uSivto9HulX/4i1v+LvqVn0QyrqmiLHn1nM5ke+0vY3GqKUGCG+LBwOUBL41wcbCzl6y/TYJIhLQ=
X-Received: by 2002:a17:907:7216:b0:b73:7b5d:e781 with SMTP id
 a640c23a62f3a-b737b5de9d2mr1152731866b.48.1763395613180; Mon, 17 Nov 2025
 08:06:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117075826.3332299-1-andriy.shevchenko@linux.intel.com>
 <20251117075826.3332299-2-andriy.shevchenko@linux.intel.com> <20251117112702.GZ2912318@black.igk.intel.com>
In-Reply-To: <20251117112702.GZ2912318@black.igk.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 17 Nov 2025 18:06:16 +0200
X-Gm-Features: AWmQ_bnrWSt11limSr3ikaZjoGLYcm1J78KeUAYbZH6qv7-FOpDBMVRI3NA3FxQ
Message-ID: <CAHp75VcJD5RnVgcCiB3C=BjDGvui_ESBUPXZhDO3NUVcEKF+Lw@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] pinctrl: intel: Refactor intel_gpio_add_pin_ranges()
 to make it shorter
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 1:27=E2=80=AFPM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Mon, Nov 17, 2025 at 08:56:59AM +0100, Andy Shevchenko wrote:

...

> >       struct intel_pinctrl *pctrl =3D gpiochip_get_data(gc);
> > +     struct device *dev =3D pctrl->dev;
>
> I prefer this keeping the reverse christmas tree.

And I prefer the logical split, if possible. putting it in between the
intel_community and intel_paggroup lines seems worse to me than the
proposed case.

> Also it can be const.

True, and it makes things closer to what you want if I leave it on the
same line. Do you agree with my reasoning?

> >       const struct intel_community *community;
> >       const struct intel_padgroup *grp;
> >       int ret;

--=20
With Best Regards,
Andy Shevchenko

