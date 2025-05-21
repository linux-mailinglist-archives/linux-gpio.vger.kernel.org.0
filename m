Return-Path: <linux-gpio+bounces-20410-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 927F4ABEF66
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 11:19:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 969037A3861
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 09:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBE3523D2B5;
	Wed, 21 May 2025 09:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Je5N8+Ng"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E3123C4FD
	for <linux-gpio@vger.kernel.org>; Wed, 21 May 2025 09:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747819106; cv=none; b=CH62ZRhnnfMfbPpxFnePnOUbYIetrWY6mKkgb9wHMNEuSn0/OHGw8k//Yqv+lXTSm9naQsU2ToJ2oVzEqXnQm0b/yDWIZ0dgFNR4tdxQ2f7SD3pX09+JU+mfVgfe77N/Ti0ovgAPBXuZWuDfkjzND4aLmLqOKAO4nBtAZWJ6uMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747819106; c=relaxed/simple;
	bh=HewxpEYpR5GNCjf04Hd3McmlBZHPuJFxEKqhZ+fKriE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eZnqSha7CnUB7+c9wuFhEn9dCsckkcjcFH5wWK3HnXDyGBrI2lXJ5da2AOOwa2wpH557AejuB9R33CkFcev817WfoQngCNiWgUQHqxriQP8HsvoYmI8jEIvbFDlU1uHvwzVYVmLqHEM5rGF7NpoWM6QmGDki2uOEaFynLBV+EQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Je5N8+Ng; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso7753807e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 21 May 2025 02:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747819103; x=1748423903; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FvkmdFWyBssVcwajkrZfdeuKU1GPiaiNMewQKj515yk=;
        b=Je5N8+NgbrxmhCqdqXBxME4OIJ42e0Hj5ou0k3eYWR6WjqPrjLEt+yK32ifFpQ78Ly
         jlSF9OCcCfMY5bLo42LpdPLL+0dfZ1B0Q9iy0abc3e28XnxEBtj6q0QnvGjTOVYD9PIX
         unz5v3himiib6xvKinik1Lk3kXorWR9lBMQnbR9Tdy5osqwzn720BGdro6wAKH2eeLhJ
         n8gtPEOVlkJPzRx/gJSJ+hpm0HF+uC6SBM5RSNO/f1KruCKrKb8hi+yrzyZvBxvHVsAt
         6Ys4ldefRjQC0rrYoPpnwWbKZeF8rxQtkHmwcVfg8iPvjkWRNM+dmkAgAkxWoDAo2EeJ
         vo4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747819103; x=1748423903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FvkmdFWyBssVcwajkrZfdeuKU1GPiaiNMewQKj515yk=;
        b=v5rRbt6VL3xYf4WQX5kdrNLPWvcTql0LkVoYjtO/xdII3zDUsyCSuvxNzdcv2PZRLO
         dYrfiWXV86M+WUUo393/RxbAOzCp80EakZX6xGxUEfDlXbWMahnHL2XYR4QdnHmwXGqL
         8RwoDhMAKOjkEwlmtM+51ex10eKleqiQSgoRHVgdE5tIzUa5STigwb5A/KipM+xMq8dq
         x2pkUB8vJXFR39ozVYF1unjY4141dsI1WpOGRe+0lhwbXTr0EOJfJgE+khfk2w6lKFJG
         Fy0qArShmIikITOVDEljOtZsx/02QmX0D3FTxFsBd42RWs0+LH2M/494P+lgUEmYVOXG
         U0Kw==
X-Gm-Message-State: AOJu0YztCL1WU48UkgeeMO28DaoCIwjjXMbQUjLGGMaehkbsdC6QIUst
	eGI6crPQZuitABA6jl3zUuswmkPlOoxUcybCOGmQulrtdwcPu80XJMoS2H13bI/Td7S1dYDYO+T
	maYcB53Nosftl3L6FvifkPE2lYcZUnhWUHhUaJKpLeQ==
X-Gm-Gg: ASbGnctTd6Y0zt/z8xpSywcBF2wHd2Um8n4gZkWmLs24Fs/NNSemx3qSH776hQqbqHE
	4/H8BzUSlnA104KfhxjylFOtzr2ylzFw3G69xrNhs7zhUbGeabHQuzB8sHxeZnGrnecwqcvhhcP
	h3CgROlsn9Au6EFfg7Pv86SqVMATwVe46XbekbqC6PjuLQvzOBcvlIMI4T19OZY1vj
X-Google-Smtp-Source: AGHT+IGEFB4lmQ0ZQYkOeKOlulaB536kbnBmBQU57GwcD6/CewPMwz4f/ft4eM3QQH00sO2ArkMfKo3hMCv0CKxNLQI=
X-Received: by 2002:a05:6512:ba6:b0:545:2335:6597 with SMTP id
 2adb3069b0e04-550e72479afmr6646314e87.50.1747819102695; Wed, 21 May 2025
 02:18:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aCzbya_FW7hg1Wkr@black.fi.intel.com> <CAMRc=McMOH_S8Kf1TPV3Z0QYPz+cfS9hxZh++fNvMc_U+TssLQ@mail.gmail.com>
 <aC2W84mKGzgbRsL9@smile.fi.intel.com> <aC2Y-4wSILoS-Rol@smile.fi.intel.com>
In-Reply-To: <aC2Y-4wSILoS-Rol@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 21 May 2025 11:18:11 +0200
X-Gm-Features: AX0GCFtynzjYxg_S0lO7xKTRwsbGRWTIZJF3CTGqRGPoNetbdN8SAZk5eB44HQ4
Message-ID: <CAMRc=McwUF-668OYqctaahRQFPOTpXqnCZKE3R5zKsoWWEyU+w@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 6.16-1
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux GPIO <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 11:12=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, May 21, 2025 at 12:03:47PM +0300, Andy Shevchenko wrote:
> > On Wed, May 21, 2025 at 10:44:16AM +0200, Bartosz Golaszewski wrote:
> > > On Tue, May 20, 2025 at 9:45=E2=80=AFPM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
>
> ...
>
> > > > Bartosz Golaszewski (2):
> > > >       gpio: graniterapids: use new line value setter callbacks
> > > >       gpio: ich: use new line value setter callbacks
> > >
> > > These have been in my gpio/for-next branch for a long time and the
> > > ones in your PR have different commit hashes. Please remove them. I
> > > don't see any notification about you having picked those up neither i=
n
> > > my inbox.
> >
> > Really? I though I commented a few weeks ago that I prefer to take them
> > when Stephen complained on dups. After that there were no dups noticed.
> > Since you haven't answered to that email, I (rightfully) assumed you ar=
e
> > okay with the proposed course of actions.
>
> FWIW, check your mailbox:
> https://lore.kernel.org/linux-gpio/Z_OUr5xvoXh-sFne@smile.fi.intel.com/
> https://lore.kernel.org/linux-gpio/Z_OS4nx2E12yjL7_@smile.fi.intel.com/
> https://lore.kernel.org/linux-gpio/Z__xUsSeYNQAvnNp@smile.fi.intel.com/
> https://lore.kernel.org/linux-next/aAEkrx0P5LFj1r6a@smile.fi.intel.com/
>
> Note the last one, you didn't respond. So?

I really don't have them. Neither of the three. Probably gmail spam
filter borked? Anyway, would you mind removing them from your PR?

Bartosz

