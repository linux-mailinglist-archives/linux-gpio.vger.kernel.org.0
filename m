Return-Path: <linux-gpio+bounces-9757-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EA196B359
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 09:49:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65F591C21EA4
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 07:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0D20155730;
	Wed,  4 Sep 2024 07:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mjd7U+4L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B461482FE;
	Wed,  4 Sep 2024 07:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725436162; cv=none; b=iNLW/CdTS14bve3gj1OoJKh6l2SBqeTlkL3+MfgXD3GU6Go8sTRgMPj+PgBT1fF/jBdjhj95/OjvuNQckXL8zxYlYLR1CEF5Pa1W3o9T7/NbERX0ELgNn5Kycg4Mb5CippvZM8ef5ccwJ2GWoUb/okojkXHW+AgPTMK6YmTv3k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725436162; c=relaxed/simple;
	bh=vBnrt7Qaa7n2L83QcaZK3itlXmi40WQOPLzdulhYC4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FFvmUiorIryS9X/Hp0VFNa0sh6R4vBXG2WMoZGksTvzQiw2NcDkb4uKSir9b6dU7E1uOO7eVD8lSxv/HhWIpNHaFN0NgEEe3bGmz5IF8e3+4LRrTTVbzigAGl7H4BLR1swpwkByZuWeT2qWFEM5+xLtBdoDeG8T4oJGlNi58LrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mjd7U+4L; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a80eab3945eso598229266b.1;
        Wed, 04 Sep 2024 00:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725436159; x=1726040959; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/39XL9l+mzdE16W2UogoekLmd6wixOzTkIcecD8Jjpg=;
        b=mjd7U+4LM0pmbc3iiz5kIbnvRQv5jTTPBtU+LZuvQrl8LHmlk2fUINiVLUkgVpW+dT
         OztlS16/TRgCARoIl6kdOXVXM3br3oFDlK5Mg7dq9bdvNqbxeOW1HPQffqKwZnviV3vU
         fV8kiNSwwCnVCwmRI7imHgPexRJ7gHe6AWOE2wltB6qrFkYhtefaw13SIkMk7OzxL/if
         hbRK2QAyfb2JtOgiMCiCpFJUI1+W1nw7LWI+0Rq1p6Ih7irkrH+cqt/GD/60sCUl7SLk
         FEyb7kXbSdZ/XdmmdHj0tIEudPzaP0WvKRwdHH7g2DeVbJdFB9WX5K20kJFGdl4E1dUK
         dm8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725436159; x=1726040959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/39XL9l+mzdE16W2UogoekLmd6wixOzTkIcecD8Jjpg=;
        b=uoAYiyJV58Zbv8embS4F55Tf2vmaLE5wE6/ZhD2odLP3ZifBxf+YqArU8K3ioyGbbL
         UiZelNb3F6RagOMW8LeHeinXt0pJEontYc7c7Zsq4J4cMSqEi6xKDsGEbFHSFsWWCHw7
         alm8Hi9eHiXAUHkrBtJ+jLI0ETc2Hy32BDnwuO+6cFHKKGFOvwXyaj3mN2NG9eGenCG3
         1JpgcEvcjV+FBMzVV+TE32LlgdvmKR/1hxlXLWT3NEsIuHsjCuOjw5v/2n9hTgcbHNQj
         hvaxbdqtl4Y7MwvRuk8bUNaoNEUQsLXnlXsQqJ2ec/qXUw06RUE5d09zu/GbJNkq7j8+
         7BuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJR6M5RNow6Hu77cugx/D2TpLlorEouTySM+Eh3l8A4w99XX3qdgEOeMugFUnd7nYsp9j8SHybqt31@vger.kernel.org, AJvYcCV8T/2UtTENM24vCdyfRg/InIO+KjW/LyRREA0foGSsjY5EJU+M60p2uNMl9/qWCzoe4KlpVAAvNeQCBjN5@vger.kernel.org
X-Gm-Message-State: AOJu0YwlXbgoJ4zSwCSVebhTjMI5xked24p1ZNcm+QFt+kzKSc0owzHI
	JlZ+lwJ3R8bIXntEebJNKV/n3/Ciu1JvxWXtTJfD2Dm8dEyOHi5vzrSVwoPlClqwXSKFnBNNdLw
	qNyOI1qBXDByHBQdInVrjjpNYBkY=
X-Google-Smtp-Source: AGHT+IFv/bJ/DrOO368qxMXr2YQ8+NNdcbc+OkEXX/V50RBy8EqS15m/wPJ98ZlyZp5GsOK+7Ax/h64zAzh3kp1Uu3U=
X-Received: by 2002:a17:907:7248:b0:a86:7c6f:7cfa with SMTP id
 a640c23a62f3a-a89a36a2db4mr1104045866b.37.1725436158881; Wed, 04 Sep 2024
 00:49:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240903170752.3564538-1-andriy.shevchenko@linux.intel.com>
 <20240903170752.3564538-2-andriy.shevchenko@linux.intel.com>
 <20240904050551.GB1532424@black.fi.intel.com> <CAHp75Veb+ycdEVdSPVF7vOE3dcSNVUfPXdDcR35OCo3NPYJPCQ@mail.gmail.com>
In-Reply-To: <CAHp75Veb+ycdEVdSPVF7vOE3dcSNVUfPXdDcR35OCo3NPYJPCQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 4 Sep 2024 10:48:42 +0300
Message-ID: <CAHp75VdzNBct2N+DgEW9mDUytnoOronn4biDEifcpJvtq9Wzug@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] pinctrl: intel: Replace ifdeffery by
 pm_sleep_ptr() macro
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 10:47=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Sep 4, 2024 at 8:05=E2=80=AFAM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > On Tue, Sep 03, 2024 at 08:04:49PM +0300, Andy Shevchenko wrote:
> > > Explicit ifdeffery is ugly and theoretically might be not synchronise=
d
> > > with the rest of functions that are assigned via pm_sleep_ptr() macro=
.
> > > Replace ifdeffery by pm_sleep_ptr() macro to improve this.

...

> > Can't we make this a stub when !PM_SLEEP?
> >
> > #ifdef CONFIG_PM_SLEEP
> > static int intel_pinctrl_pm_init(struct intel_pinctrl *pctrl)
> > {
> > ...
> > }
> > #else
> > static inline int intel_pinctrl_pm_init(struct intel_pinctrl *pctrl)
> > {
> >         return 0;
> > }
> > #endif
>
> There is no benefit. It's actually the opposite, i.e. it expands more ifd=
effery.
>
> ...
>
> > > -     ret =3D intel_pinctrl_pm_init(pctrl);
> > > +     ret =3D pm_sleep_ptr(intel_pinctrl_pm_init) ? intel_pinctrl_pm_=
init(pctrl) : 0;
> >
> > Then this still looks like a function call and not like some weird
> > conditional.
>
> I understand that, but the point is to make all PM callbacks use the
> same approach against kernel configuration. Current state of affairs
> is simple inconsistency, but it might, however quite unlikely, lead to
> desynchronization between two pm_sleep_ptr() and ifdeffery approaches.
>
> Approach that I have before this one (and I kinda agree that ternary
> here looks a bit weird) is to typedef the function and do something
> like
>
> pinctrl-intel.h:

> typedef alloc_fn;

Actually typedef is not needed as it may be embedded in the below
inline as it's used only once.

> static inline int ctx_alloc(pctrl, alloc_fn)
> {
>   if (alloc_fn)
>     return alloc_fn(pctrl);
>
>   return 0;
> }
>
> pinctrl-intel.c:
>
>   ret =3D ctx_alloc(pctrl, pm_sleep_ptr(_pm_init))
>   if (ret)
>     return ret;
>
> Altogether it will be ~20+ LoCs in addition to the current codebase.

--=20
With Best Regards,
Andy Shevchenko

