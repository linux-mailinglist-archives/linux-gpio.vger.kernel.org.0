Return-Path: <linux-gpio+bounces-1794-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AC781BEC3
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Dec 2023 20:03:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A9D028257F
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Dec 2023 19:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC77B65198;
	Thu, 21 Dec 2023 19:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QHvihfx+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EEE55E74
	for <linux-gpio@vger.kernel.org>; Thu, 21 Dec 2023 19:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3bb7376957eso790372b6e.1
        for <linux-gpio@vger.kernel.org>; Thu, 21 Dec 2023 11:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1703185414; x=1703790214; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S8E3wEmEl8khAD92xQyPHbsm2TZrkNBkE9+5wPLVsBE=;
        b=QHvihfx+QwDN1VHVyh2FgN5NGFqMmiUFu8NzLJ2pFYsIJ4yNpUDYJt6CrbTgrO41bC
         fXOz2st/vEdMJ/jFkpNDqwGdoMYf0tUHG8eC1IipS8dk4eciqtCCObmq042BFfrSss67
         JdBaHTJlQAacsrbitWRKzq1J9QPPr98JsmO5phiEMv4O7F76YET3xeewUWSElJpWvkL7
         GdFoPr0CLULeV7xnx6ftOe/9oU6LR7YZlpQme9CPzE1F8tMATEZ9ldwPY+dTRCkjuUEs
         XC16wp0orNqJWlzKM1APefyWSjcxMKaAxD804gLCKqwl4lmRCrsAQII66qwSgbqrIShP
         ckUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703185414; x=1703790214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S8E3wEmEl8khAD92xQyPHbsm2TZrkNBkE9+5wPLVsBE=;
        b=Dd+F+cydOYp2rvDrk/CataTcEQHnookxNFQgufnOeR3ZlUNdRDT5p6kZZGGy7Zt2TF
         FRk/UA+h53rnbXtKO3QCqkinQFX/09RPOzSAdpfkrAICERqeqIIL4vTnEDu5dp8TCsad
         lHnLPHEwqFkq0VT1OTbG37FrUQ+j2JWlwa+oOR8chgtldyUwCQ/bQNNiFFkfmWtvmYIi
         hAG5a0kp1ph9sImCZ2l9ljYfgpj/t3myIsy68B51LeOnzIaGzCqSkAX9giKG1gBWzCok
         1Xs0MCy9vBPpdAM///CGvNPhJoeQI4iF1C0akroE9oksU/7MnAlXFhlRRULsxgDp+ioS
         g+kw==
X-Gm-Message-State: AOJu0Yzvjdy6RfKl1NFuXKL3iaP9pskcT0tSRTcCz0nSG+XxgUogWVdY
	sUHN08iaLBT6989xIO9PmWuTGvglqd/XriAuNCC+CzB4Ek+9IA==
X-Google-Smtp-Source: AGHT+IFuUzdtc/tkGQt0c3FRS3IbVe0aoSkfgXl1TJRxaMRPjqq/jHMelEvOCi4BP3w9hhEK3aOcn5oXAR+XSJNPoHo=
X-Received: by 2002:a05:6870:648b:b0:1fb:75a:6d4c with SMTP id
 cz11-20020a056870648b00b001fb075a6d4cmr292671oab.115.1703185414671; Thu, 21
 Dec 2023 11:03:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231221184316.24506-1-brgl@bgdev.pl> <20231221184316.24506-3-brgl@bgdev.pl>
In-Reply-To: <20231221184316.24506-3-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 21 Dec 2023 20:03:23 +0100
Message-ID: <CAMRc=Mdz7fVOOcN80YV1hGMqqhDVNM+1Da3BysaZG=9+P1oMAQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpiolib: pin GPIO devices in place during descriptor lookup
To: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 21, 2023 at 7:43=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> There's time between when we locate the relevant descriptor during
> lookup and when we actually take the reference to its parent GPIO
> device where - if the GPIO device in question is removed - we'll end up
> with a dangling pointer to freed memory. Make sure devices cannot be
> removed until we hold a new reference to the device.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpiolib.c | 40 +++++++++++++++++++++++-----------------
>  1 file changed, 23 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 1baeb6778ec6..8a15b8f6b50e 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -4147,27 +4147,33 @@ static struct gpio_desc *gpiod_find_and_request(s=
truct device *consumer,
>         struct gpio_desc *desc;
>         int ret;
>
> -       desc =3D gpiod_find_by_fwnode(fwnode, consumer, con_id, idx, &fla=
gs, &lookupflags);
> -       if (gpiod_not_found(desc) && platform_lookup_allowed) {
> +       scoped_guard(rwsem_read, &gpio_devices_sem) {

I am too sleep deprived to be coding. This doesn't make sense because
if we are held at the write semaphore in gpiodev_release() then it's
already too late as the device is being removed already and we'll
still end up with a dangling pointer.

Should we hold off any reference putting for all GPIO devices when a
descriptor lookup is in progress?

Bart

> +               desc =3D gpiod_find_by_fwnode(fwnode, consumer, con_id, i=
dx,
> +                                           &flags, &lookupflags);
> +               if (gpiod_not_found(desc) && platform_lookup_allowed) {
> +                       /*
> +                        * Either we are not using DT or ACPI, or their l=
ookup
> +                        * did not return a result. In that case, use pla=
tform
> +                        * lookup as a fallback.
> +                        */
> +                       dev_dbg(consumer,
> +                               "using lookup tables for GPIO lookup\n");
> +                       desc =3D gpiod_find(consumer, con_id, idx, &looku=
pflags);
> +               }
> +
> +               if (IS_ERR(desc)) {
> +                       dev_dbg(consumer, "No GPIO consumer %s found\n",
> +                               con_id);
> +                       return desc;
> +               }
> +
>                 /*
> -                * Either we are not using DT or ACPI, or their lookup di=
d not
> -                * return a result. In that case, use platform lookup as =
a
> -                * fallback.
> +                * If a connection label was passed use that, else attemp=
t to
> +                * use the device name as label
>                  */
> -               dev_dbg(consumer, "using lookup tables for GPIO lookup\n"=
);
> -               desc =3D gpiod_find(consumer, con_id, idx, &lookupflags);
> +               ret =3D gpiod_request(desc, label);
>         }
>
> -       if (IS_ERR(desc)) {
> -               dev_dbg(consumer, "No GPIO consumer %s found\n", con_id);
> -               return desc;
> -       }
> -
> -       /*
> -        * If a connection label was passed use that, else attempt to use
> -        * the device name as label
> -        */
> -       ret =3D gpiod_request(desc, label);
>         if (ret) {
>                 if (!(ret =3D=3D -EBUSY && flags & GPIOD_FLAGS_BIT_NONEXC=
LUSIVE))
>                         return ERR_PTR(ret);
> --
> 2.40.1
>

