Return-Path: <linux-gpio+bounces-27572-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54401C049B4
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Oct 2025 09:03:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1F4D3AFB5A
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Oct 2025 07:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 333F5273D6D;
	Fri, 24 Oct 2025 07:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ghKtyQUw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E1B15E8B
	for <linux-gpio@vger.kernel.org>; Fri, 24 Oct 2025 07:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761289411; cv=none; b=OqoQbMEItNrJMFNILtnT9kXU8ogqbFaNI1pWQk0kYWuS1FjiXj6SVRGXjouWA8rDizOgUTRgtjh1BR5/x+9mlWUQS1eX00gEC7GfowO986gYGJEfkqvzbWGy1IQ74nnI92IICCwBLCPfe5hjeazSihe1lsqW94Y+JUuXOviv7AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761289411; c=relaxed/simple;
	bh=jwKwKoQ1je32EjVd1IL0UvZ2d8JBijczHCb0ou5rPAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FmncAB79+ozlooCQ/s+I1dRaNZyRHs62utB/hxuGqy4H4Cb+aKzxXbU3Wei/8/1h62ihJrLjjOnMM3jrDiJ4Q7mr+vrtl5Lt69sHk/YXyuuYb2h+USTOal3BG+2hLJGUjt1iNGH2FkXfukq6zJLJIEXsiJ9Jq855RA21QWvr4nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ghKtyQUw; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-591eb980286so1793773e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 24 Oct 2025 00:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761289407; x=1761894207; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOlB0kPMPcikcykh5NXoFKFdbJH0a3Am29BYJ5NIg8A=;
        b=ghKtyQUw2YwzgTn4jwV0MMygeaEH07ARTCZQj7LVrdzklXZFeg5e9a2JesQQ482857
         pZ22jdPOqW5UJHxsyRX+kLLX/8AISxBwxKl/S7d7PD27ufB8YnBMLG46AXPRDLlOVURm
         6cEK6M2D/ZybW7pbGQVGn4UBQ43gWg8aqZDHkRMQa4BGCUcpyO/7wKWojW4CFLlClbtp
         ATiBS8tdQRwc6W7uooz9oYcQsoshDGh5HgfcTjrkWYHwsNAbrKiri6p3NlrxhwqDbfw1
         ux6eK0dkKLOtyjnjuL4HNTsi9nVcq14I3waUo+JadWzCqJEUQ9/GpC8rP4/TFrFM08w+
         LHqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761289407; x=1761894207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jOlB0kPMPcikcykh5NXoFKFdbJH0a3Am29BYJ5NIg8A=;
        b=JkHLKj6DVz5pfT8ABg+I9lIHkydI5CWz55TKzRqYxxybDal1kxoZch0hxnwyrfMcT7
         iXO80P9q7gk02G7DSi/i0f+QlhYNRufxzeyX2SQc67FDKPICcZZO3sh/xqRyeJ9lwNe4
         2pzPorOY3c/34pat4Oz2sFq0cu4s0NZuSnnO6xN03KM3VWvJ3CDGjGNAlhZTZNtj0lcx
         isUf1DBljOEDESrQJFn8IAV8k5jwRqjTHlnrMKlF+AJ1UgEqA90inH6Yv/+UBXpoeR2M
         03Rq1rKskh3qv0sfKg6uJCDIv7CdYwv1N+oWNU05TibUi8bbzm0ULdSJYO0QW/cbhpuu
         f2Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUWwPcFx2Dl930hjNXOQePbqIREwTvQoFAlXYqnQMnMWEYvVyYHDY328wVI5NzhBoxq0KvljKrvvBTf@vger.kernel.org
X-Gm-Message-State: AOJu0YyUu0ngf5/cSDPf468LDmedhLXykss0Ggkm3G0j7qGiDg8VUImT
	IJhUSh7Pn+uvAinwjfPVjnYlEB+EeMFzzlN9DNTmRgeXQvm+gd1gwiARdwv0/9gxiBwLsdyIVQc
	nZq62pAM4IfCQcijJdB2NybvHgiw4+6esTOxgIc14iQ==
X-Gm-Gg: ASbGncuaQ+8nPi7wqETDJw6LuOdcM/P/oTYMAunhuktl+ocUWTBYhilH1JvzfUitj2w
	++guEla5vwRnSKkS/9zVK/c/xv5BTHtLW2LJTnPkVrMD1fisRN75o6CkRDTP+/vDEh2iRLUJ0tj
	KzHvtK0cyeoF3JUvD8HNHoi6eTRVPO2ExKxcI+xMaTclFkh/N6ApEOc2Lpn4X5A3VxQgPWYz0cD
	0HVekq7h6PZx0ioiKGmKxgJf7ymDpbb+M8jM8paM3mOzcBDgqJb/9+TChSblCbI0e8XT9uZiQfQ
	ESyJTceem4TP4bFGXos+ciFI8g==
X-Google-Smtp-Source: AGHT+IGot33eiQ+BcQWl6UG0zv+FNQnQnMAkHHpWuHdoQFvVpdE10kN9LM8Ma75zpPJb50O7ebN6pjI2myaknhddpuQ=
X-Received: by 2002:a05:6512:31c2:b0:591:c6c0:9afb with SMTP id
 2adb3069b0e04-591d8546211mr8882195e87.34.1761289407199; Fri, 24 Oct 2025
 00:03:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-4-d34aa1fbdf06@linaro.org> <aPkcpTWfTb0HOF51@smile.fi.intel.com>
In-Reply-To: <aPkcpTWfTb0HOF51@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 24 Oct 2025 09:03:15 +0200
X-Gm-Features: AS18NWBS-Jd3edts4iMIfdLC_kiOaNMJiYsAVBHOjeSjhFk4sOt2_3x0nM3hP4c
Message-ID: <CAMRc=MduywsSKrN08_4F2xEjZrdnV--_3LZNmxwRHH=_QtceHA@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] gpio: shared-proxy: implement the shared GPIO
 proxy driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 8:04=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Oct 22, 2025 at 03:10:43PM +0200, Bartosz Golaszewski wrote:
> >
> > Add a virtual GPIO proxy driver which arbitrates access to a single
> > shared GPIO by multiple users. It works together with the core shared
> > GPIO support from GPIOLIB and functions by acquiring a reference to a
> > shared GPIO descriptor exposed by gpiolib-shared and making sure that
> > the state of the GPIO stays consistent.
> >
> > In general: if there's only one user at the moment: allow it to do
> > anything as if this was a normal GPIO (in essence: just propagate calls
> > to the underlying real hardware driver). If there are more users: don't
> > allow to change the direction set by the initial user, allow to change
> > configuration options but warn about possible conflicts and finally:
> > treat the output-high value as a reference counted, logical "GPIO
> > enabled" setting, meaning: the GPIO value is set to high when the first
> > user requests it to be high and back to low once the last user stops
> > "voting" for high.
>
> I have two Q:s about the design:
> 1) why can't the value be counted on the struct gpio_desc level?

No, I specifically tried to limit the impact on users not needing this
to a minimum.

> 2) can gpio-aggregator facilities be reused (to some extent)?

I don't see how but if you have a precise idea, let me know.

>
> ...
>
> > +#include <linux/auxiliary_bus.h>
> > +#include <linux/cleanup.h>
> > +#include <linux/device.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/gpio/driver.h>
> > +#include <linux/module.h>
>
> + types.h
>
> > +#include "gpiolib-shared.h"
>
> ...
>
> > +out:
> > +     if (shared_desc->highcnt)
> > +             dev_dbg(proxy->dev,
> > +                     "Voted for value '%s', effective value is 'high',=
 number of votes for 'high': %u\n",
> > +                     value ? "high" : "low", shared_desc->highcnt);
> > +     else
> > +             dev_dbg(proxy->dev, "Voted for value 'low', effective val=
ue is 'low'\n");
>
> You can unify and maybe save a few bytes here and there by doing somethin=
g like
> this:
>
>         const char *tmp; // name is a placeholder
>
>         tmp =3D str_high_low(shared_desc->highcnt);
>         dev_dbg(proxy->dev,
>                 "Voted for value '%s', effective value is '%s', number of=
 votes for '%s': %u\n",
>                 str_high_low(value), tmp, tmp, shared_desc->highcnt);
>

This doesn't make sense, we don't "vote for low". We only vote for
high. It's not: which option gets the most votes, it's: if there's at
least one vote for high, then we go high.

Bart

