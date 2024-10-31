Return-Path: <linux-gpio+bounces-12352-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8D09B7713
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 10:07:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1E90B22F69
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 09:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AAC1192B83;
	Thu, 31 Oct 2024 09:07:01 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D681BD9ED;
	Thu, 31 Oct 2024 09:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730365621; cv=none; b=JjYg74qAdacqTSXWvMVVUVUbW2k54T5RclzH9Wc3ENBhyMmhNewXfah5jzmPnmQwRJHNemVakavd+vnZZskVQgejtorqLf7uOj+qPgNQ2AdC/epPvGkMbaHtePh59Ckh+FcaiMouls04lhFmDgevpKLSOqTr/mHQfeHgEsgvk88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730365621; c=relaxed/simple;
	bh=Cb9vYVV4iHorT5/lcXuORujilvhEERcUWScRiPyhrnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p+688Nl1U4Mgjp0tuEdqJhuzTkCMoW0BbEbxDlFpvVqilzBLUJrb5dQhBWGaz7NZgw2Xx8xwPy3a3KNxnGsOwFQGEk4MT04/8rfa16YSJwd6l2k1ukPuFHNSgSm5oEY3AWR1QUjTHbm6BoZWy49q/F/01BMw/wTKUxFR+Qi/sw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e38fa1f82fso5682167b3.1;
        Thu, 31 Oct 2024 02:06:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730365617; x=1730970417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ltTlImt8YnKmakyynr77qn3k5jpeQaB6oPQRonuqgfw=;
        b=ewuFP/DUOAFi1hxU3AehBC0tAup8LojYviarg5vIvqxjmkTm8x/2Uwg8ggSRaCe/2+
         9TjmX/eJbu/g7mL4OzzTtYvEf1OOWYgIbJXyUadPsK7hlAhpZKQu4c36Gn7VgC5qWevi
         +OTBI924O7vjPkCySTMmqUl+7FNohXg5AL9eSYWVYCiW+knOx2WNWS0fMj5z3L0bYLke
         oJU6zIcpt1wespFRtsz71TMNQ6rydrNBL5j1FjhcCVguu2C3pt6MOzWbD85V+fVmf9Mm
         Qg/VdvoNGIHlF1Db4+J9yZpbpLRu3pfECn0pi7uPjXFFR7omyHYlZQrxtkAHW8MySOJC
         5zHg==
X-Forwarded-Encrypted: i=1; AJvYcCURHT2L24UA+6s+QbG5J+eTFiGe+vQIJQn48HDWNsYI6OTxPqAhfZ2SuzGwqUElD76tUhmX+rGoD0OKZw==@vger.kernel.org, AJvYcCW9wLXw5zG+JjzGJ71WRfz6C+hBVUgEAeHUXlzey5JSYPIAyGAjQOsBmDo9+YjeryVItvChtBEQYQEM@vger.kernel.org
X-Gm-Message-State: AOJu0YxUnqrJGKU/4jJqKNiT+KyVHVeC789H/YcBes7Ll51rqxzzgO9t
	6ilN49URFbT9MPPK9pOGdUUITIY5t9Wog4B8NRP6oq9Kh3UTzp17j5n+hS33
X-Google-Smtp-Source: AGHT+IEG71nIRwXL6Hri9WY7xpzXEjO2iEPCWTpKR9bBdFwXJ50GZ+b+m1py0hG2cRJJW4zL5aVULw==
X-Received: by 2002:a05:690c:7005:b0:6e3:f9e:5fe7 with SMTP id 00721157ae682-6e9d8b889f3mr170999627b3.46.1730365617391;
        Thu, 31 Oct 2024 02:06:57 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55ce7324sm1736967b3.146.2024.10.31.02.06.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 02:06:57 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e38fa1f82fso5682067b3.1;
        Thu, 31 Oct 2024 02:06:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVMCBvBko05Pw84dJWDivwpA8lpAwSZiE+bXEko4Mr/vWsy1Nfqkna20FE/PalRoDkLr34x+OdTFnUmbA==@vger.kernel.org, AJvYcCVoVsaWSeE09snZbJ0Gi0WwUWiatHC/I5xJZy4xB2OTUovglj08nKUgECW3sENhsGb5ji7utTJTOnEa@vger.kernel.org
X-Received: by 2002:a05:690c:9a0a:b0:6e3:21a9:d3c9 with SMTP id
 00721157ae682-6e9d8962048mr198534337b3.9.1730365616772; Thu, 31 Oct 2024
 02:06:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <140b0f7522ff2f86a7fad0be88c19111fa6cb5b1.1730282507.git.geert+renesas@glider.be>
 <04040095-27c2-49a1-b956-ac7bbd5f919a@gaisler.com> <CAMRc=MdAq3t7P_+SSCcZC3J02B5RuDQvUZjFXQbi4KViiK=-Pg@mail.gmail.com>
In-Reply-To: <CAMRc=MdAq3t7P_+SSCcZC3J02B5RuDQvUZjFXQbi4KViiK=-Pg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 31 Oct 2024 10:06:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX_OzLc5YzqxObHQrAdZAYrCa8E5Qz4zHR_cqX370KSAw@mail.gmail.com>
Message-ID: <CAMuHMdX_OzLc5YzqxObHQrAdZAYrCa8E5Qz4zHR_cqX370KSAw@mail.gmail.com>
Subject: Re: [PATCH] gpio: GPIO_GRGPIO should depend on OF_GPIO
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andreas Larsson <andreas@gaisler.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

On Wed, Oct 30, 2024 at 5:44=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Wed, Oct 30, 2024 at 4:45=E2=80=AFPM Andreas Larsson <andreas@gaisler.=
com> wrote:
> > On 2024-10-30 11:03, Geert Uytterhoeven wrote:
> > > While the Aeroflex Gaisler GRGPIO driver has no build-time dependency=
 on
> > > gpiolib-of, it supports only DT-based configuration, and is used only=
 on
> > > DT systems.  Hence re-add the dependency on OF_GPIO, to prevent askin=
g
> > > the user about this driver when configuring a kernel without DT suppo=
rt.
> > >
> > > Fixes: bc40668def384256 ("gpio: grgpio: drop Kconfig dependency on OF=
_GPIO")
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > > --- a/drivers/gpio/Kconfig
> > > +++ b/drivers/gpio/Kconfig
> > > @@ -341,6 +341,7 @@ config GPIO_GRANITERAPIDS
> > >
> > >  config GPIO_GRGPIO
> > >       tristate "Aeroflex Gaisler GRGPIO support"
> > > +     depends on OF_GPIO || COMPILE_TEST
> > >       select GPIO_GENERIC
> > >       select IRQ_DOMAIN
> > >       help
> >
> > Or alternatively:
> >
> >         depends on OF || COMPILE_TEST
> >
> > Reviewed-by: Andreas Larsson <andreas@gaisler.com>

> Yes, if anything it should depend on CONFIG_OF but is this really an
> issue if this shows up as an option in Kconfig? It's not a hard no
> from my side and I have heard a similar comment from Torvalds already
> but I really don't get it: do people go through all the make config
> prompts on a daily basis instead of using some base config and doing
> make olddefconfig or menuconfig at worst?

I never use "make olddefconfig" or "make menuconfig".
I always use "make oldconfig".  How else do you find out about new
driver support for the hardware you are interested in?
I also compare the resulting config to what I had before, to catch new
dependencies that suddenly make an option unavailable.

The kernel has 20K Kconfig options. It's nearly impossible to configure
a kernel from scratch. Being able to filter out the thousands of
questions that cannot possibly apply to the hardware you are configuring
your kernel for is a big win. Times the number of people doing this...

Thanks for applying ;-)

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

