Return-Path: <linux-gpio+bounces-8846-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 667B39580FF
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 10:30:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 981C11C24468
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 08:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C046D18A6D3;
	Tue, 20 Aug 2024 08:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="NNje7Jmi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26292D627
	for <linux-gpio@vger.kernel.org>; Tue, 20 Aug 2024 08:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724142618; cv=none; b=PguP0se/HFyzT83q8Sii1gtvZ6+JqwSv/5+Tg/T8ZsdHv/Mueb1lKvog3CPRDRGcfq7PvA/9XofjdxKJWEP1jjyttNJHM5PMPqWsFaEsyD+jHN1whawELZMvxg8JaxbtPTRSGsYUxbQIJQErMT/jn3Aj0tpDc+0z3wTbbuSbfKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724142618; c=relaxed/simple;
	bh=TRU83+gdLy9W4YUZl8iWPzvI2LOP1Kh2BEShyjf0IqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H0NI5aeiqf4nV02Wta4HeRggHeeYP/We4sAX8093PElXThJbImvjuyxri9pF3supgY2deNuziYdRDmnKz1cQt1TxTbynNHx5LTUXnXw/NDwkCfem+/fPsSLJHZrEkCpAwKr2+NLfhVtJmAz2O4AtFeEzvceqKlC+YyPWrJbxnRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=NNje7Jmi; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e13d5cbc067so2789993276.2
        for <linux-gpio@vger.kernel.org>; Tue, 20 Aug 2024 01:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1724142616; x=1724747416; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZqeWsMIa4G+/Jffk4q0DpUs0TIfN5gPXqtsEPQIEU4=;
        b=NNje7JmioAy08T7lf7tHdSLPMj0Pr3Hamzj2j7aQ4dezc4+MmxFKuUvhqrc3imEhpt
         VzNhPkrTMqWrYWfS4/lf9CJwvQamwhFYel9pBcGsmxvmN4JgP7iQUA4fNKw3+u5HFkHV
         72DzSd/KJn4nCw4hmT4siwUHsYUS2G/sbPAPDhrqoOlRfLtt35DyZLyhTQtSc3TRitUJ
         cc68cYkV3ylzda87ECfsX3FubqYCj3UPOSHy3Sw9ExpIS15mXKdForlGkpN+UFHrzY/j
         J2U10opIApOfrS1oKVxAvYhyEt44+U9E2oWiA/EsxL2QW25H6h1s5F+0Tv3CE+J2+amf
         t0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724142616; x=1724747416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AZqeWsMIa4G+/Jffk4q0DpUs0TIfN5gPXqtsEPQIEU4=;
        b=lmdyWlyBn/6yWAhCmDKe5y0mp+zy4fN8DpzsR/Yl+LkTZ0NiT+ibS6/EsHD4DU9DVq
         vtis71m4I1t/WEwZkQhhKm8Z4sgFKz5nQKuPMEbHAcavQ6woUuEvCe5RzVbAwkK1Jfd4
         Q+pyzOnuimHcHzPk241wgOtPn8wU1TZsSs5Pn6uaaTSBG+yxH7AT8kYYSlwJguPxwwXZ
         vdiRinu5XhtzPT+1sRm82zWC1Bfpc7fyMGsAHZpQBV8bXAGT3Lza+Bb7OxX+FgGPR57I
         m4jpFCoznSeB7OVkdD74VPZy8S2PnnLiV62f8PsfAsKXQIJzVmjOj8wUZ9NqPew64YY3
         bSGw==
X-Forwarded-Encrypted: i=1; AJvYcCWlsbI8tecJAofgwVVkGQar8PD7F+D0PjzEJVlxuwfi5GF+8jc6QWDPL6V3xg+Nr0gBNCXIQzMa/oJH@vger.kernel.org
X-Gm-Message-State: AOJu0YxFqvBsocjI0TC3ZaPz7pL+Nl8IesXMgOyDp0Wu3hMnNrvo1OIM
	AoxjbEgM0u/hytExRE1RDxafv1UaBe+VJH+xKDi+6sRwII7wWm1t75g5gRH7O+WrOONRqydr3GZ
	oGlrAg5W/smJqnRh2twlVPdOhzj7A2l/thPwQhQ==
X-Google-Smtp-Source: AGHT+IG57A46tSVSlUwBGa65sWLT3dWQaLzZIDDHTtIjcr1bc6ll69vw3ONJvZa7AKDIafyzi3kD1Osy0aRv1CnPdGc=
X-Received: by 2002:a05:6902:988:b0:e16:3d01:3fc6 with SMTP id
 3f1490d57ef6-e163d0148b9mr5405653276.21.1724142615533; Tue, 20 Aug 2024
 01:30:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240521152602.1097764-1-patrick.rudolph@9elements.com>
 <20240521152602.1097764-2-patrick.rudolph@9elements.com> <ZrYH8QlXH5Gfvnz_@black.fi.intel.com>
In-Reply-To: <ZrYH8QlXH5Gfvnz_@black.fi.intel.com>
From: Patrick Rudolph <patrick.rudolph@9elements.com>
Date: Tue, 20 Aug 2024 10:30:04 +0200
Message-ID: <CALNFmy38aq915Oj7x4q27OWbiympDU=Vjo=7anTYx7w3E=F2UA@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: cy8c95x0: Use regmap ranges
To: Andy Shevchenko <andy@black.fi.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, naresh.solanki@9elements.com, 
	andy.shevchenko@gmail.com, broonie@kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 9, 2024 at 2:13=E2=80=AFPM Andy Shevchenko <andy@black.fi.intel=
.com> wrote:
>
> On Tue, May 21, 2024 at 05:25:58PM +0200, Patrick Rudolph wrote:
> > Instead of implementing a custom register paging mechanism in
> > the driver use the existing regmap ranges feature.
>
> ...
>
> > +#define MUXED_STRIDE         (CY8C95X0_DRV_HIZ - CY8C95X0_INTMASK)
>
> > +#define CY8C95X0_MUX_REGMAP_TO_OFFSET(x, p) \
> > +     (CY8C95X0_VIRTUAL + (x) - CY8C95X0_INTMASK + (p) * MUXED_STRIDE)
>
> > +static const struct regmap_range_cfg cy8c95x0_ranges[] =3D {
> > +     {
> > +             .range_min =3D CY8C95X0_VIRTUAL,
> > +             .range_max =3D 0,         /* Updated at runtime */
> > +             .selector_reg =3D CY8C95X0_PORTSEL,
> > +             .selector_mask =3D 0x07,
> > +             .selector_shift =3D 0x0,
> > +             .window_start =3D CY8C95X0_INTMASK,
> > +             .window_len =3D MUXED_STRIDE,
>
> Looking at this again, are you sure you have no off-by-one error in
> MUXED_STRIDE value?
You are right. I tried to save some memory here. Will send out a fix.

>
> Also a comment in the regmap core suggests that we may include selector
> in each of the window.
>
> With this, we probably should simply use PORTSEL as window start with a
> fixed window len of 16, having a few more (reserved) registers in the
> dump seems not a big deal to me, but it will be much easier to decipher
> a port number based on (virtual) offset.
>
That's true.

> Besides above, why virtual start is not well aligned? I would expect not
> 0x31, but 0x40 or alike. It might explain some bugs with cache you have
> seen.
>
I didn't find any rules on this, so I used the next free index.

> P.S. It might still be bugs in regmap core, if it is the case, they
> need to be addressed.
>
> > +     }
> >  };
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

