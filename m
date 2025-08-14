Return-Path: <linux-gpio+bounces-24380-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 498A2B26138
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Aug 2025 11:43:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B53539E8158
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Aug 2025 09:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59A3E2EB5C7;
	Thu, 14 Aug 2025 09:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fU3mZIT6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3F42EAB98
	for <linux-gpio@vger.kernel.org>; Thu, 14 Aug 2025 09:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755163981; cv=none; b=NavCd2N/w0BVdOL8jVErz7hhkRivn/0w7hYvoJJPkmWHFLFST2IoPc9DjXr3empJDqgZ463nqKWlNM3TPNNbNveo2/EN5Rdsfj++LBDrQnSuoCdpkOlg6j7ydfcWjFEpR4ES3Vg7A7pxnGfYnOOsq3R8xgIWYc5vWirdoZPDnpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755163981; c=relaxed/simple;
	bh=Ddcf2otYVNARg/taorSZLAtQAtvhMThscR3wOc9nohs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m/JiKybdkCwYCZdnAkrG4Awe03iLGzyCo9BD+gV7B2O/HflXYVJWDbBCKk4AWRzt/OKyRWslhVmGsgPvFngiXnjXzI7eIfXno+3XBpksHATuuZmkQ+fRvpejfOwTO9eaQ0nrxJ3D7NGXUgdTtmDwnPZfvl6tPgN+OdpquxPZZyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fU3mZIT6; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6188b7949f6so1470527a12.3
        for <linux-gpio@vger.kernel.org>; Thu, 14 Aug 2025 02:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755163977; x=1755768777; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/PgWqN4timfjl4cZJRm42vhchyn9UqvfvoLN2gf4TII=;
        b=fU3mZIT6gEwgZDiGnmaheocxclu9gw4fft58ddiZWBISqEEf1hZSUMK2bBmzVFqS3y
         o8L7noQ4rUy5x1mZ6SGh0Yque5vYLKcVI7gvHvPDsdiBBrqQOGqVQlOMWQcAN358uiv+
         yexl7lSVNGWTe3wUFwitSt+MeJGvMQUzn0IRB1zBXpIEh8ZQBAuP3LnQ+Ivv+qE2pkGu
         7XpMbiuDTHBW1pbGKBSFg/0FB4MI2GZuZdIU1rKzcAIMnc/NiR2bd4JccGfaogSsoyRG
         d0qsEhG1DNFdLJZb4CTubErfLgrnNYrC4WbPnogJLll0V43Tu60njrJQk6qcJuRF9J82
         VntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755163977; x=1755768777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/PgWqN4timfjl4cZJRm42vhchyn9UqvfvoLN2gf4TII=;
        b=Zu56S++bVp/hLjJMUKsJzw1LA2kip3uS/+3g16X5LGZmP0NPyI4tYPQrvkF+6O9PoQ
         Zz1WTl/6dizu0mLRbMsSm4+XUYfLTN4dLTmJAtO1JDd4LQXcvtkjUt7L3Jo47C2A0M0g
         2s0KkMf9anf5ZmqesZKOnzdcV7f638LixnLllP1ns8zdMlKJVHlk6oqQ7B8xkYZwECtm
         GtM8GXyjqNb0HuahmJOMPYS+4CNY+E1DoOCDl5s1jkz0Lw/nPav+iY0rhjxZIaMzsTs/
         VGdbC3hSHVGVEwaT0a4SF1ODNFdsMuToRr0zlwggvfVPjE/oYFnOhMuoUechSlP6IGc9
         tMqg==
X-Forwarded-Encrypted: i=1; AJvYcCUNuc1+AfYkjephjh0pGs+cuLPTi8PSGwlmcsTTCG++ohXVmHsdcYm0YyRqlUhpd6qxr+YYzvY+THoN@vger.kernel.org
X-Gm-Message-State: AOJu0YzN3ZWaUjNJbPgwyd3IQS32ub2OOXvVlE5Wpv3uiegePIP04dbW
	3HtMMdU6JAeNe46uhIApDQwsO32eCuErHKhtZzYguqV8/8zHaaAAbS4Jn3wUMOwpGW4PWPFz0xK
	iDrnLybsph7I1iyqAIymufGmghTT2fj1OFQCScr/hxA==
X-Gm-Gg: ASbGncukOPD8Y4VO8vc/B8prJtiSvxv6lEvgj6xRmHDEqcYOooEOF4a6q8lXZeUXFC7
	YeUVaRGWKPfHWBQULeZXiIqbcdbeAc1lKoBupHaSlh1+SK9chdjO5BnsQGKKvVm7IVL0WT603Xv
	O/q6tLk9z70b2dwESZURtVDuzy/b6nqX9gxl0eFcxa7hh60cx2HO7hyhq/moGXh2A0Cq2T1eS/Z
	8Ssw4HW0MpMZ+4eKrsK0G0vx08rqlQxP2ODios=
X-Google-Smtp-Source: AGHT+IFrAVXvmsSi7GbBhU2lB5DsCLyrrz/JBWyYAZLJ3h+X8DtQSjG9apEyelCtFkio9GsKeQdg8qpPOGy++jb/RKw=
X-Received: by 2002:a17:907:7e99:b0:af9:e3d3:a450 with SMTP id
 a640c23a62f3a-afcbe02ae07mr165697966b.6.1755163977510; Thu, 14 Aug 2025
 02:32:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aJwk0yBSCccGCjX3@stanley.mountain> <175506979055.8476.10658684000717777329.b4-ty@linaro.org>
 <CACRpkda_-JBGTTh7pLd+MkoVyCCKDqTZm8t9vaxWMWDE+sGyLw@mail.gmail.com>
In-Reply-To: <CACRpkda_-JBGTTh7pLd+MkoVyCCKDqTZm8t9vaxWMWDE+sGyLw@mail.gmail.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Thu, 14 Aug 2025 11:32:46 +0200
X-Gm-Features: Ac12FXwz2T5b5IuGlaWDfV_45Y7w640Ir8a_Q8gAQw7wKqwa0C0dwbE5i-RKcEo
Message-ID: <CACMJSeue_3A33gQjkN2T0=G14faWs7NaXK9sEy=q877w9f+-AQ@mail.gmail.com>
Subject: Re: [PATCH next] gpio: aggregator: Fix off by one in gpiochip_fwd_desc_add()
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Richard <thomas.richard@bootlin.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 14 Aug 2025 at 10:42, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
>
> On Wed, Aug 13, 2025 at 9:23=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > On Wed, 13 Aug 2025 08:38:27 +0300, Dan Carpenter wrote:
> > > The "> chip->ngpio" comparison here needs to be ">=3D chip->ngpio",
> > > otherwise it leads to an out of bounds access.  The fwd->valid_mask
> > > bitmap only has chip->ngpio bits and the fwd->descs[] array has that
> > > same number of elements.  These values are set in
> > > devm_gpiochip_fwd_alloc().
> > >
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [1/1] gpio: aggregator: Fix off by one in gpiochip_fwd_desc_add()
> >       https://git.kernel.org/brgl/linux/c/148547000cfc1ba8cec0285726833=
3d08724b9cc
>
> Do I need this for the aggregator immutable branch I merged yesterday?
>
> I have only merged that branch to my new development series, if
> you need me to pull in a new version just send a new pull request
> and I will use that instead.
>
> Yours,
> Linus Walleij

No, it's not a build-time dependency and it will end up in next anyway
from my tree.

Bart

