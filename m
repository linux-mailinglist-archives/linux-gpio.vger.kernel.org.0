Return-Path: <linux-gpio+bounces-209-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 164AA7EE477
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Nov 2023 16:34:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 427D51C20997
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Nov 2023 15:34:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D38734565;
	Thu, 16 Nov 2023 15:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TWBX3+dF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87E7519B
	for <linux-gpio@vger.kernel.org>; Thu, 16 Nov 2023 07:34:30 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9e62f903e88so127636966b.2
        for <linux-gpio@vger.kernel.org>; Thu, 16 Nov 2023 07:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700148869; x=1700753669; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVNPAkisoMvkTyEW/8SK0tYA7Rxlmav3LfVvFoFHM20=;
        b=TWBX3+dFKB6YDGnBNNRGVJsl1S5ajnnZVcPODjnz5+0EnYsMt0l12mH9Pr+eRfXaS0
         HJOSnoNEtSNYX5hMHEd6Hkg/3DuV0C8srrxjzV/FTQgS5Dz/y2RubeGZukn0i1cBTFws
         Gt1j26x+Jy21AAXtTqPE19RbWB9zCwjO9kwV45o69i09K2cIWi6/v2/DZw5Iz8CctgRK
         1jkYg5QkuLlBQwplsYv4TMV7eXGY/i1Dmk11zB3bOUAcp/P4m7gpw5OLbHzmgXw6EbQN
         pb6P8b8pa3XWwdaApSx5oqk0UUmXGaVPLiu9+2NKkpZmo8VuR6kG8I9aJaRgzfASmL4q
         zmPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700148869; x=1700753669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PVNPAkisoMvkTyEW/8SK0tYA7Rxlmav3LfVvFoFHM20=;
        b=fIQQra0k8jYJ+nIJovajvticmnIBqHz4M8k2xQ7Nf+maxmqfAat2lSPQWG8GpA3CJ4
         MARf6PowtfqeUAxCmDaJ+0g7vsdXWXlWrql7Px/XriGm04CjbsPGNmFqnHw+OT2hIJ9W
         CbwyMxs9LLiYlExs+opNFI9+wSW7rWf/87k/m0VvAb1C88gTP15caYzsw7SI11y4cRA4
         UO7/0LynQRT0ZEW737P7t1JBpdapASuUw+lyprnGDOWXzRFXQUSohDTzTXRl8tZSX6bO
         HiQLtqaFFyWR9+4S4IxqRqp2brdTPvk6Hl1sKM9yXdZlVlKeTct6WkcBlH6utQckM35N
         adwg==
X-Gm-Message-State: AOJu0YwMf2N2e0RL9Lhl5tXfT4Ol2qBQckpY9z7OP6m/Wnp96Rn9zOV3
	alpTeVGYiLAzQm5oaIAdSslgbeX9wRZjfEKA/h8IzUeFweyDFTjxuQME2w==
X-Google-Smtp-Source: AGHT+IGU8LjTyWo7/9a7JJdcmY7OssfjuZLP7hCvG5OsrxE9r6+CaW//NaZNOOaBBhBG0Oezv/75uldG2UfPdUmoR4M=
X-Received: by 2002:a17:906:2348:b0:9d0:51d4:4d87 with SMTP id
 m8-20020a170906234800b009d051d44d87mr12024787eja.62.1700148868828; Thu, 16
 Nov 2023 07:34:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231110102054.1393570-1-joychakr@google.com> <CACRpkdZ9RHcHh4o5g62ywK0eQHpLZuGUF0Ud6jogk9Sfqe4krA@mail.gmail.com>
 <ZVQkLqDB3KtOlIpK@surfacebook.localdomain>
In-Reply-To: <ZVQkLqDB3KtOlIpK@surfacebook.localdomain>
From: Joy Chakraborty <joychakr@google.com>
Date: Thu, 16 Nov 2023 21:04:15 +0530
Message-ID: <CAOSNQF3QeFd857RCJE8wfJ=__-K7Bi4vfMeTVP-+O+LJ7y9SmQ@mail.gmail.com>
Subject: Re: [RFC PATCH] PM: runtime: Apply pinctrl settings if defined
To: andy.shevchenko@gmail.com
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	manugautam@google.com, aniketmaurya@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 15, 2023 at 7:21=E2=80=AFAM <andy.shevchenko@gmail.com> wrote:
>
> Tue, Nov 14, 2023 at 02:01:48PM +0100, Linus Walleij kirjoitti:
> > On Fri, Nov 10, 2023 at 11:21=E2=80=AFAM Joy Chakraborty <joychakr@goog=
le.com> wrote:
> >
> > > Apply pinctrl state from  runtime framework device state transtion.
> > >
> > > Pinctrl states if defined in DT are bookmarked in device structures
> > > but they need to be explicitly applied from device driver callbacks
> > > which is boiler plate code and also not present in many drivers.
> > >
> > > If there is a specific order of setting pinctrl state with other driv=
er
> > > actions then the device driver can choose to do it from its pm callba=
cks,
> > > in such a case this call will be a no-op from the pinctrl core framew=
ork
> > > since the desired pinctrl state would already be set.
> > >
> > > We could also add a Kconfig knob to enable/disable this, but I do not
> > > see a need to.
>
> Besides questionable code style (inline functions in the C file)...

Sure, I can change that.

>
> > It has a certain beauty to it does it not!
> >
> > The reason it wasn't done like this from the start was, if I recall cor=
rectly,
> > that in some cases a device needs to do the pin control state switching
> > in a special sequence with other operations, that can not be reordered,
> > i.e.:
> >
> > 1. The pin control state change is not context-free.
> >
> > 2. The order of events, i.e. context, does not necessarily match the
> >      order that Linux subsystems happen to do things.
> >
> > When looking through the kernel tree I don't see that people use
> > the sleep state and idle state much, so we could very well go
> > with this, and then expect people that need special-casing to name
> > their states differently.
> >
> > What do people thing about that?
>
> ...I think the patch is incomplete(?) due to misterious ways of PM runtim=
e
> calls. For example, in some cases we force runtime PM during system suspe=
nd
> which may have an undesired effect of the switching pin control states
> (hence glitches or some real issues with the hardware, up to hanging the
> system). Some pins may be critical to work with and shuffling their state=
s
> in an unappropriate time can lead to a disaster.
>
> So, I would consider this change okay if and only if it will have a detai=
led
> research for all existing users to prove there will be no changes in the =
whole
> set of possible scenarious (of system sleep / resume, runtime, runtime wi=
th a
> custom ->prepare callback and so on).
>

I tried to place the calls to set the pinctrl states after driver/user
callback  based on my understanding of runtime code so that existing
users do get a chance to set the state with any special sequence that
needs to be performed post which doing another call to set the state
would be ignored in the pinctrl framework.

But this only would be possible with the assumption that even in any
special sequences executed by users they set nothing but "default"
state in runtime_resume, "idle" state in runtime_idle and "'sleep"
state in their runtime suspend callbacks.
And like Andy mentions about "->prepare callback", if there are
drivers that are setting pinctrl state "default", "sleep" or "idle"
from any callback but
...
int (*runtime_suspend)(struct device *dev);
int (*runtime_resume)(struct device *dev);
int (*runtime_idle)(struct device *dev);
...
it could indeed be a problem.
I'll dig into users of pinctrl_select_sleep/default/idle and see if
there are such cases or if it could be done in some other way.

Thanks
Joy

> --
> With Best Regards,
> Andy Shevchenko
>
>

