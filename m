Return-Path: <linux-gpio+bounces-19748-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1A4AAE492
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 17:24:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 746571C2190C
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 15:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5250228A414;
	Wed,  7 May 2025 15:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbLDeWdL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7685C289358;
	Wed,  7 May 2025 15:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746631490; cv=none; b=p1trb4gfc69VgW6F6Ool6UzVyxFXiILuT4lh5jqj5TC0iKtgX9SeKBcwvbNpnKuNGuaeeXO0KPak+UjWL58SLOX+fV6gmMK7BuESwwDR067EY1kZxuYe3Gc1afwo5oq5jjKGHa1C2dVl1v9x/nULhfvEaziCAn38MVEs+HVN9yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746631490; c=relaxed/simple;
	bh=qlUKMUPRHRDxzF0c5YLpw/5NZAb2ZuLEL2hMf+1LwoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gnginmYDgD+CffyOElxdc8LYvvlLPVlMrOAm+LUShokM2sOBQTHEsN0jrnQ82jojRo/LbwevcCvqlMJE966r0gWoLisGISwOFrDd51MiFo/kW35MLSJddKmwTE8cXKH8HHroNN6f7fbBgcGY7KtX/MrqzREwxEXmGqG5WY3ouBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZbLDeWdL; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ace94273f0dso588232566b.3;
        Wed, 07 May 2025 08:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746631487; x=1747236287; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BjTfpMyCbC7ZGV4L2K6+VXP1MZQ6g2K6pUzf1ty2wFI=;
        b=ZbLDeWdLsfZwuhSKk4IFix3W8dwwyKnxbqWxoXgGq575EgAGhKmSD6iJealwfEReUX
         s+CR9p1oBS8MIpImVd5SW/16OhljaJLLb2tyllNwIcsLVQpH1z81Da3US9o7B852b41k
         uOQG6gAC+FHNtTxCWQ44lI7bFxhWNA3xZ5ZS5LiIV2eLr1nlGqcvf25Ono7PRHjE4YLN
         9kTKdVk9GASDjDrZ119XMd1gAzLEDsWmXeJrbmysN8gs8df+qPzjLu36qQ2mxsJXmMqH
         d6ZDp2NDBkx/cnXtYJG0O3kTzRh8OHGLOon9PERp2bb00IHxCw/fwI1ZJF3Mp07Fh8RQ
         sCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746631487; x=1747236287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BjTfpMyCbC7ZGV4L2K6+VXP1MZQ6g2K6pUzf1ty2wFI=;
        b=Ip3E+Sm1GD+QQpFTQ4A6M8Vg1YmWy6sMDCe4e22Cr/58IZosYiP67ekJLFNPP5VT0A
         Q90uvwppgZEHqZELeFPVtbe87+p+ri3qAzo8pvGNDyd+UBUzUqx+YNMpid4Qutlql8ps
         Ib4MX7I1T3RetxnsbSxuDiRKjjSPa0YGIFSLCmPgVQAdEUAgUrsZBT4GSTLqic0vXNE+
         K0WXDEXc0CyUI4lh7Zov5RCw3vZ8cHaF69D98YdE++k97vK8JODaEJE1KdVLJT8dXnXB
         2iPv45bJIN/MnIcnQfzAbbHU4hCYIUU8hkeghkWgbqFjuO2rQn70Fwopev1JP5HkfQ6G
         S8XQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwVA7s106e/v/Zso6T7CSwj0u+qQtfThuSBFwMZN8Kv6qZM6zqwnKWYYNdzobNBcf2hFblmsKb6t5mzfAbYcfp@vger.kernel.org, AJvYcCWpk8fuA+1xEuy6JamXsgx21mWe+0lhr6kAMTjM28TbXwWzddSoaL7HMI5TFMDp/pYJkvOkzsCrYt2KtXsi@vger.kernel.org, AJvYcCX3ahSFpBXunza6VvQCmEgigci8sGVJA2I5HX35r2O7cdQR9MtrahYo1Tmck9xBdhB1njh+Eq50Ou04@vger.kernel.org
X-Gm-Message-State: AOJu0YytTXQq4vYuwjTn44Kl/9zSeG3pI7BL54ETe10mg/7r6D7MhrEF
	TH8e4TM7WF1Pud6vC55tmstb+6tZ1m0DviVChCyZTG/B5+jeBHfdw63tYQzhxyFjkjbkxYOEg/J
	2vzYi4UKV8V2cCfsGxym150uQYMg=
X-Gm-Gg: ASbGncsM9nyI+VVeoehAxv6XDCk3gZDgUDpoTkOUCB2eXqj6kvqdNWk13daNkAINHFE
	KvJf42ZDFJ/gzsx5HSMxR/NPTBwtRoZay2h6qh3jB3KnAD+frxdxV9jGXe2oUG9FcpzAGzcXyst
	u3XzmygrN8lnwaHtruikZJ9/dJ
X-Google-Smtp-Source: AGHT+IGf4kNQ2ncZC4SUR4quAuwY6hnOh9zLUjX8zJpF7Yi4yNcuTOZ/fYV1gITbWIC3a61oDCyp5FWBztrK84CqGRI=
X-Received: by 2002:a17:907:2d23:b0:ac7:4d45:f13e with SMTP id
 a640c23a62f3a-ad1e8bc3151mr407094666b.13.1746631486406; Wed, 07 May 2025
 08:24:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
 <20250506-aaeon-up-board-pinctrl-support-v5-9-3906529757d2@bootlin.com>
 <CAHp75Vdg2LE885+qjpYLkQrdNqaahJc3=Ki7op=6jJUJfJM+sw@mail.gmail.com>
 <c3b9c494-599e-4d99-8645-589c1c0c106c@bootlin.com> <CAHp75VcKsq5_+uwwVKeq8++H+Rw1giH-TKUErsFmdKPiu5kY+A@mail.gmail.com>
 <2f02284d-2922-4bc3-ab2a-8848023019b7@bootlin.com>
In-Reply-To: <2f02284d-2922-4bc3-ab2a-8848023019b7@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 7 May 2025 18:24:10 +0300
X-Gm-Features: ATxdqUE389k0N8BcUEdTuflLxWVNjLT-z5iYHSfkAHl7belQvCoIPA9_iMIzhd4
Message-ID: <CAHp75VdZuqP_ga_i1=kERQbscu55GFShPK_AhYF1jigoBz8wpg@mail.gmail.com>
Subject: Re: [PATCH v5 09/12] gpio: aggregator: handle runtime registration of
 gpio_desc in gpiochip_fwd
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 4:54=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
> On 5/7/25 15:24, Andy Shevchenko wrote:
> > On Wed, May 7, 2025 at 1:10=E2=80=AFPM Thomas Richard
> > <thomas.richard@bootlin.com> wrote:
> >> On 5/7/25 08:34, Andy Shevchenko wrote:
> >>> On Tue, May 6, 2025 at 6:21=E2=80=AFPM Thomas Richard
> >>> <thomas.richard@bootlin.com> wrote:

...

> >>>> +       /*
> >>>> +        * get_direction() is called during gpiochip registration, r=
eturn input
> >>>> +        * direction if there is no descriptor for the line.
> >>>> +        */
> >>>> +       if (!test_bit(offset, fwd->valid_mask))
> >>>> +               return GPIO_LINE_DIRECTION_IN;
> >>>
> >>> Can you remind me why we choose a valid return for invalid line? From
> >>> a pure code perspective this should return an error.
> >>
> >> I reproduced gpiolib behavior. During gpiochip registration, we get th=
e
> >> direction of all lines. In the case the line is not valid, it is marke=
d
> >> as input if direction_input operation exists, otherwise it is marked a=
s
> >> output. [1]
> >>
> >> But in fact we could return an error and the core will mark the line a=
s
> >> input. Maybe ENODEV ?
> >
> > I am fine with this error code, but do we have similar cases already
> > in the kernel? Do they use the same or different error code(s)?
>
> I dumped all get_direction() operations in drivers/gpio and
> drivers/pinctrl and returned values are:
> - GPIO_LINE_DIRECTION_OUT and GPIO_LINE_DIRECTION_IN (make sense).
> - -EINVAL (for example [1]).
> - -EBADE in gpiochip_get_direction() [2].
> - regmap_read() return code.
>
> But from my point of view -EINVAL and -EBADE do not match our case.

Hmm... I believe we need a GPIO maintainer to have a look at this.

--=20
With Best Regards,
Andy Shevchenko

