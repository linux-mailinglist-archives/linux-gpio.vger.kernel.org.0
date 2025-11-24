Return-Path: <linux-gpio+bounces-29030-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E12C813A0
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 16:05:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 817344E150C
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 15:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04201296159;
	Mon, 24 Nov 2025 15:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="by9I3/9R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F078296BA8
	for <linux-gpio@vger.kernel.org>; Mon, 24 Nov 2025 15:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763996743; cv=none; b=sX1gdrd87YliGBnQzqwmSBG26MgnGYAbe861wPWtTqCYxxiCD/vzYywjfRebsYXHnnLlhAvO8DsshgBgdtVK6/vo/atNLeex97sKnNnFbNUAXR46EjteFzDHdvJ1oC1r5RmBiZx/xugj5knCXKjWQUcSzDC0uhQzefaxxtNoBj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763996743; c=relaxed/simple;
	bh=PoLSXyv2cpCoYbZIQThrylYB7NYUdBsOThYAfuP3GX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p002k/kk5G2IAFqF10Fc/zBN9xLNdA5/atfmaB1sgEg0MSvBaFGgB/TFPOS/83XJYFTh88AuYLdEStAto/tPLFGDs+sjdpQlQYaEiynTsJe0EhizUnrgX5T9AZQldCM8sCOrG0SFDWQA5KReDcrCx0HYNqz2P3riVAKbGatBXrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=by9I3/9R; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-63f996d4e1aso4532623d50.0
        for <linux-gpio@vger.kernel.org>; Mon, 24 Nov 2025 07:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763996741; x=1764601541; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aP3c9SMShxEOwyq3nLN0BBLkAiPxhUwRn01NB/RvErU=;
        b=by9I3/9RfPD3+2nqYts0uqjeNTDqcIxm+CMg+kSb5+qPyFOuOmnZ75ISWpjv/ISZ1Q
         B2hliRUNPp0o/QEk/1J6udXd+ob1SEZk8Yq+/ryydOsUqQN5EbvyVZyAh/Mg5W1C5KgP
         Vu2dfVZfKS1gtPNTSdczp24PiuK7Ju0wyK4JaW94N7izxKyH6qdi0kO5NXG3My+m5bKR
         y1T/wjAiXHgJ8T4++Z+6csigOE6G35NVLjUyv35uoeQgEbPgigEEk7tfXJX3Me38ZTPo
         qG+qjF0I/JUthopmpjDHxIUw9jWK+LQfbOF6M/NgGiLbMXwT/1rDrVMibwMjfCrZ/7ql
         ZGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763996741; x=1764601541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aP3c9SMShxEOwyq3nLN0BBLkAiPxhUwRn01NB/RvErU=;
        b=Xz7c5fWoFlCDmHdO2tueo9FyYVOuhtk/cBosiCF8BYTRMCFk5lfNmjEcteD8AGA8al
         QulJHMMZpdZ2EvaCxYG8EP5gZm9XjUc4R+qbN99bal9muGmrmIMwsOZ89RtLI80MsqwG
         7Sbqp+rFSTTxWvPNG6/ZsZVMk6kDeGm98g5A+Bm2NWRCiTwqdr09NMqAzpU8eDpfq7r2
         ER+vlNxPrAN3RM4p4rnd9XUre1oraGl8KC99J9ehltgJH/jI/8/gcix9wZkI9TbZYM2F
         ClA0tay+6dnT0FrP1sePOIQIaUmplf1Ta5nWUXtNTxnOTeUU7HbukN50Rlp9MUfyVbSY
         pSPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSee0xamJENgUAvU2O6HF5NVzx/xlzk8OhbMMqAA6uwD+X7Ha0cB+bVjWlqvuW/EvzmaNoHkGSZisf@vger.kernel.org
X-Gm-Message-State: AOJu0YysiiXxRNZb0OEIy85QbRTS817nAaTdz0fO7wU/n5AbJC5STUtB
	xblrjUKlV4uWCogy0cfVCCShefLUU3rqUwhc/+frPl7UJl64fua2FRZVJWTNtICRDB9OmyQ8uam
	iv9k8HjQK9Cmo/iu3GHlvM+S+Rt4Xxw4=
X-Gm-Gg: ASbGncvZWPDclL8zjRLcjYyHZzD0Ek6cgA23lmarJnj6c1gU9xh7rU0sWvTHmsy4NQb
	IQORdqGys6HB9Z/f7uFv+ztp/jk01aE4E7mFBIGYSmjQ13UTke7fhuBIlciejkX84LJAbU/dHzx
	CaZFmdz9TpCIiB84c+bueoM0v9Cg35Wg2T504bBX/GI6m3I1RKYAqFqNdSKJ9VOj01ldF5zhXzw
	ZkC1k1BN/baVJIQ5ZEn/kAck8W1d3cBOv+ZR733YqgiFnILGjrSCjuOqjwo9RXvOnXGCf2m82O5
	XOz9
X-Google-Smtp-Source: AGHT+IFcExc3fv4iwEnjwdVElQfQ9ZjwdK/2sF8WqvaZYhh0951LGPDi6Qt6Ua7iwje0oVX+jz1IhOPYeDB7if/Vs7I=
X-Received: by 2002:a53:8547:0:b0:63e:17d8:d985 with SMTP id
 956f58d0204a3-64302ac3230mr6411404d50.53.1763996741097; Mon, 24 Nov 2025
 07:05:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124002105.25429-1-jszhang@kernel.org> <20251124002105.25429-3-jszhang@kernel.org>
 <CAOiHx==ttP2T=VLsSE9nLr5Cai_D+Khr6ePJVdOEim8ThWSdmA@mail.gmail.com>
 <CAHp75VcRWODpL2DjAiPm0=bhTJfjs6RdNgtroRbvEW7ong3ALg@mail.gmail.com>
 <CAOiHx==5TkW_-3yoqN_MzhdLKbMFvXRj-pWpuS5ahTM_ccVekw@mail.gmail.com> <aSRwXCfG1RimQZxX@smile.fi.intel.com>
In-Reply-To: <aSRwXCfG1RimQZxX@smile.fi.intel.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Mon, 24 Nov 2025 16:05:29 +0100
X-Gm-Features: AWmQ_blzotQnnPxsn4ZXGglW8dyTnG1bAcKi8OqUcRNMcebAISg0ref3oiKykrg
Message-ID: <CAOiHx==4NSMNVdW163nE-vYf_FtDjS5aHfj5chPr3n6D2Mt9Nw@mail.gmail.com>
Subject: Re: [PATCH v5 02/14] gpio: brcmstb: Use modern PM macros
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Andy Shevchenko <andy@kernel.org>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 3:49=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Nov 24, 2025 at 03:20:00PM +0100, Jonas Gorski wrote:
> > On Mon, Nov 24, 2025 at 2:52=E2=80=AFPM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Mon, Nov 24, 2025 at 2:40=E2=80=AFPM Jonas Gorski <jonas.gorski@gm=
ail.com> wrote:
> > > > On Mon, Nov 24, 2025 at 1:39=E2=80=AFAM Jisheng Zhang <jszhang@kern=
el.org> wrote:
>
> ...
>
> > > > >  static const struct dev_pm_ops brcmstb_gpio_pm_ops =3D {
> > > > > -       .suspend_noirq  =3D brcmstb_gpio_suspend,
> > > > > -       .resume_noirq =3D brcmstb_gpio_resume,
> > > > > +       .suspend_noirq =3D pm_sleep_ptr(brcmstb_gpio_suspend),
> > > > > +       .resume_noirq =3D pm_sleep_ptr(brcmstb_gpio_resume),
> > > > >  };
>
> ...
>
> > > > > -               .pm =3D &brcmstb_gpio_pm_ops,
> > > > > +               .pm =3D pm_sleep_ptr(&brcmstb_gpio_pm_ops),
> > > >
> > > > won't this cause a "brcmstb_gpio_pm_ops is unused" compile warning =
for
> > > > !CONFIG_PM_SLEEP?
> > > >
> > > > You probably need to add a __maybe_unused to brcmstb_gpio_pm_ops
> > > > (which incidentally DEFINE_NOIRQ_DEV_PM_OPS() also doesn't set, but
> > > > all other *_DEV_PM_OPS() macros do).
>
> Do they? I mean the modern ones and not that are deprecated.
>
> > > Shouldn't it be covered by the same trick as pm_sleep_ptr() does for =
functions?
> >
> > pm_sleep_ptr() becomes NULL for !CONFIG_PM_SLEEP, so there is no
> > reference then anymore to brcmstb_gpio_pm_ops. You would need a
> > wrapper for brcmstb_gpio_pm_ops itself to conditionally define it to
> > avoid the warning, or add __maybe_unused to it to silence it.
>
> PTR_IF() magic is exactly to make sure compiler will have a visibility wh=
ile
> dropping a dead code. Did I miss anything?

No, I just was working with old assumptions, so my bad. I faintly
remember that they used to work that way, but maybe I also
misremember. TIL. So disregard my comment.

> > Note how SIMPLE_DEV_PM_OPS() and UNIVERSAL_DEV_PM_OPS() tag the struct
> > with it (for that reason I assume).
>
> Both are deprecated. Not a good orienteer.
> None of the new approach uses __maybe_unused. (See DEFINE_*() macros in p=
m.h.)

Maybe that some were using it was confusing me into thinking it is required=
.

Best regards,
Jonas

