Return-Path: <linux-gpio+bounces-796-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB6A7FF897
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 18:43:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7874D28175B
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 17:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EAB858133;
	Thu, 30 Nov 2023 17:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="D7MmWi9W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33742131
	for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 09:42:49 -0800 (PST)
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-4b28acfd3c5so347570e0c.2
        for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 09:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701366168; x=1701970968; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HqziEWQ8hcVSIREtlgxXVkhZ6XD2q21JqLi48D18QSE=;
        b=D7MmWi9WlXiqr2Ohii+aWqE3Czvgx6C2YApyxPHPAjsZQJdSGD0CB5EjfVdeF4qOTr
         3GkexUjC2xt8l+ZPSRhkYxhQE2/FDbzDZUMR27BH03/Tj1vb4uk7Vxg8blGQaOeeBnxz
         2vyAQ1YN6vAP0sOrtWVIf/zjHYAIqM8eFlH/Ajovrz/z58VfdL702KvQmnRW9z/xMo2Q
         U7dW4Mr+7nde011eIHsmaJaJfXbacvESSQo4X7XqHbTDSLMfMDstJeCRhhBCOTbsHW+K
         awR6G+6NXYUrGQrV1to6q+3loJVGpD2etwo2hfatv7/fx5mxUInPox6NGR/gToUo1z08
         gZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701366168; x=1701970968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HqziEWQ8hcVSIREtlgxXVkhZ6XD2q21JqLi48D18QSE=;
        b=JEzEPkZGfgjs6Oq7nrPkBzkb+1hZYN0yIkygE/waUQrvklgSrjrTJXjOMhwnFxxHYj
         xehG0t9VIQiOtMbdHkP6qKKDrVN7v2VbouKqFtgm8cZEGq2dRs7Lnl7nrbU0McA0/kqQ
         igZc4qQ9Tryqe1KJT4hbUfpWMzYCvqA4tCb2Dp3dXB2WNnjkVL+kZtefRBhg0/Yssw9h
         H0UZ1/f8ChEISpc1xagltrvY5WqQPKtVPtXJ1fTTjWPKLfdsgrQsrz6ZN0BAoIBvsqSG
         byVAdzUcank5RDYGQ1Due8KEkvxSACO0+4o1gfraxkRT2/vRZ4XSQKddsZ/YobFkykkA
         1sRg==
X-Gm-Message-State: AOJu0Yy4rYBGJc6IlG8g91TNKYFIGiHkrKlHyztt6Csycnat50SvAcdX
	AAvbe5T9+2ZeyYq3ZermsG+RkSVveGy2WT3wPYko8w==
X-Google-Smtp-Source: AGHT+IG76s8PlXysbg/bGFFqcSBsEzLMyndFmxdYHz6VSVcOSJUOzOgaHvsILnhDYlzQt408pJ3KgSNZDoNn761blcg=
X-Received: by 2002:a1f:c405:0:b0:4ac:b0a6:4c16 with SMTP id
 u5-20020a1fc405000000b004acb0a64c16mr13397943vkf.10.1701366168281; Thu, 30
 Nov 2023 09:42:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231130134630.18198-1-brgl@bgdev.pl> <20231130134630.18198-10-brgl@bgdev.pl>
 <ZWi6_WnOQZB0vgPL@smile.fi.intel.com>
In-Reply-To: <ZWi6_WnOQZB0vgPL@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 30 Nov 2023 18:42:37 +0100
Message-ID: <CAMRc=MfC9sxgvaigtP5=MMZwbzaSkUukfH61QBf+r_eTJh5fJA@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] gpiolib: use gpiochip_dup_line_label() in
 for_each helpers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 5:40=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Nov 30, 2023 at 02:46:29PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Rework for_each_requested_gpio_in_range() to use the new helper to
> > retrieve a dynamically allocated copy of the descriptor label and free
> > it at the end of each iteration. We need to leverage the CLASS()'
> > destructor to make sure that the label is freed even when breaking out
> > of the loop.
>
> ...
>
> >  const char *gpiochip_is_requested(struct gpio_chip *gc, unsigned int o=
ffset);
> >  char *gpiochip_dup_line_label(struct gpio_chip *gc, unsigned int offse=
t);
> >
> > +
>
> One blank line is enough.
>
> > +struct _gpiochip_for_each_data {
> > +     const char **label;
> > +     int *i;
>
> Why is this a signed?
>

Some users use signed, others use unsigned. It doesn't matter as we
can't overflow it with the limit on the lines we have.

Bart

> > +};
>
> ...
>
> > +DEFINE_CLASS(_gpiochip_for_each_data,
> > +          struct _gpiochip_for_each_data,
> > +          if (*_T.label) kfree(*_T.label),
> > +          ({ struct _gpiochip_for_each_data _data =3D { label, i };
> > +             *_data.i =3D 0;
> > +             _data; }),
>
> To me indentation of ({}) is quite weird. Where is this style being used
> instead of more readable
>

There are no guidelines for this type of C abuse AFAIK. The macro may
be ugly but at least it hides the details from users which look nice
instead.

Bart

>         ({
>            ...
>         })
>
> ?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

