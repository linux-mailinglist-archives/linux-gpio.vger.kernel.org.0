Return-Path: <linux-gpio+bounces-16566-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF8CA44381
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 15:51:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2C5F189A5B0
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 14:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B901426B2A4;
	Tue, 25 Feb 2025 14:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Koyd/4yt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980F226BDBF
	for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 14:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740494624; cv=none; b=dzBzQuTnhySU0unzZOHncQ/TjKqtUB4sLtFdRJUJC4DFbupd0Q+ai5sjB2mzhBBIlUzDg81jmiWS9d1/KtFAB9H4pK7MWE62uy8/0TKDNoRd09nQFNEhGnNrebais3h9JO13faehvddtSWx3ZgxJraPnWchw3SYZA4uEfHcPOX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740494624; c=relaxed/simple;
	bh=gx8NytW0dpyLUO7UQa31/FCFzdjJXf1mhiwX+ZS46cw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qZvHkLWytadalyhnMWOVJ87A44GGrfwGvIaTLjn0OZD6j9PD4YmxnRW4C4W8so2xXIGLn9qbgMHS34n9CHemetRWxuy7uQacZNfjDxF4wnH7Daw+y7Wh5DGsaILYoS7yydNAHNKLFm6aGCwHrtwm81NB+Q+wT65k+LgZ3+KIJ4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Koyd/4yt; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-307325f2436so55851971fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 06:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740494620; x=1741099420; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3kCyyrcTNuv5sP+J6vnk7eUPElleP8xNWbNZ5x97dgc=;
        b=Koyd/4yt66fUuyUBrMk4IYpJPiFvV5IPf8kenDBhtUdb0Sg22Q6DMNWWA+XJAzuFeC
         8NLJeHrOWCHsu8RlDHybmpGVlAwwasuA5xAcK1arkMAQytqpNoSdCM/uUDEnXQ8FukZB
         E77mg9DrKpqsVG4oI0iQ/2F8Vd7kEFJmMuJNChZo2RR1YQz96PXAj3Ud6dKmeRqpyyal
         lz2TCiFWSc5FVzUIoe88+J6HuiaXEtxSLCS93a2ZYlE0MOsiZDTJrcuuTOYbcjtRAy1s
         0JbjdnTR0XtTu2FbtkvxiNUTPtYHjnrIk5IGnS2e/NFefKBq7YPfcnMXvvfW5Qxx8a31
         vyVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740494620; x=1741099420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3kCyyrcTNuv5sP+J6vnk7eUPElleP8xNWbNZ5x97dgc=;
        b=nTJWlm+MbUcj/h+TKZDG+Vk/K1Z9lHi4foutHVUE0w3qHyhjaaJXLGJKXtm409FMLu
         nL2Y/mRYfYhEhjrOilPzrgsDUr4wUGW+SQmc8m0IXIjbC8vRrcbYxG7lQlJ9rINteRY1
         IyrsNXPJcKvK+esStcSY5FLyCMsVc0jxF754MaHKYDzRQluYHHbBFRWAL7F5RZn4GkBM
         IGO4xjai/zL+kK6rDdWsBB4SAMoFD73RH+nmVAtd/LqNQ9Lc/rJL4o68h8cIBTyRwyA5
         m5lbqVQMpHk1P4e8voI+E0G932PchcBqp08KMa4FbaU2asWStab9Bv7c1cmOAu69Jc1e
         PjSg==
X-Forwarded-Encrypted: i=1; AJvYcCX31D1unoZhmNrVghrHofUMTjnblHXAPh9EmZymm0xdCZSnp2MdPYzj5TwBtVxY6Hree5TtBIwE4sBZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyEZdeH/cP5TxLlzZwPNNDrfWZC+Ov/JDRrFGn3N3nylTw9db9k
	82f/mzVUBCUrjeXjAGZGPj0Xn1IqffqOx4BqnMtgZZAeR7TbGStnLaAJDcO9iVx+T0AMF01rnri
	ZT+MMGkuPLpRLGQ4m8kJWPg0Bf4mpbHAs1VpOGw==
X-Gm-Gg: ASbGncvuSeNsp60rcipndXxhBrxkne/ZVQHxYnUjR2B2ve8Oh+1aE5B1H+S7IsTJEdb
	ucOsXjP5jWaWLaMMWs9+vI64nbj7N97tsXjp3BB21TwRlKtTqxTsmzRHkc+T0ikE5QCauaRaOyL
	HxrzhoHWNExioZ/5LmrlyYdkFoh5nKTyTws0LTM/o=
X-Google-Smtp-Source: AGHT+IEkoQjVDUvwk2/o/jVKA4C4ByItsCEdLm/WTH0WQ1Txd20zHHR2uKLz+377e33VXWBhOTKNafhq9yOEHZyIG9E=
X-Received: by 2002:a05:6512:3d11:b0:545:2e76:495c with SMTP id
 2adb3069b0e04-54838ef5a3emr6618248e87.25.1740494620506; Tue, 25 Feb 2025
 06:43:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225-retval-fixes-v1-0-078c4c98517a@linaro.org>
 <20250225-retval-fixes-v1-1-078c4c98517a@linaro.org> <Z73EIu0AqnfPU33k@smile.fi.intel.com>
In-Reply-To: <Z73EIu0AqnfPU33k@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 25 Feb 2025 15:43:29 +0100
X-Gm-Features: AQ5f1JrSmiNkgrLute7D3zjWMT34MZ_ycPnM-jy9WgmyGnQ2GrV0ee5GAOqi_3w
Message-ID: <CAMRc=MdTKCtwrDouTV4YHoWa1F8cenSVEtTXicSUdrmEk3TxCQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpiolib: don't use gpiochip_get_direction() when
 registering a chip
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 2:22=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Feb 25, 2025 at 12:56:23PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > During chip registration we should neither check the return value of
> > gc->get_direction() nor hold the SRCU lock when calling it. The former
> > is because pin controllers may have pins set to alternate functions and
> > return errors from their get_direction() callbacks. That's alright - we
> > should default to the safe INPUT state and not bail-out. The latter is
> > not needed because we haven't registered the chip yet so there's nothin=
g
> > to protect against dynamic removal. In fact: we currently hit a lockdep
> > splat. Revert to calling the gc->get_direction() callback directly not
> > not checking its value.
>
> ...
>
> I think the below code deserves a commit (as a summary of the above commi=
t
> message).
>

Can you rephrase? I'm not getting this one.

Bart

> > +             if (gc->get_direction && gpiochip_line_is_valid(gc, desc_=
index))
> > +                     assign_bit(FLAG_IS_OUT, &desc->flags,
> > +                                !gc->get_direction(gc, desc_index));
> > +             else
> >                       assign_bit(FLAG_IS_OUT,
> >                                  &desc->flags, !gc->direction_input);
>
> Otherwise LGTM,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

