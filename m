Return-Path: <linux-gpio+bounces-175-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 154947EC779
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 16:37:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF6631F278DA
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 15:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF73F39FFC;
	Wed, 15 Nov 2023 15:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pBDRktK7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242AF34186
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 15:37:46 +0000 (UTC)
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6AB218B
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 07:37:44 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3b2ea7cca04so4204689b6e.2
        for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 07:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700062664; x=1700667464; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxWKE0RnE67ZCac+DE3wf0+WlhQHwaxB8ToZtgmVZwY=;
        b=pBDRktK76id6NpKj3jlCs/xMSpWkPsLSPwkT+oitTZfn0ctMgfSu3Cj3lbVGNtzSVl
         JnDunYOnaj8kozNVwM9OxPo9AtRtqJaOpXbPsaly16Z9gUGxtgJZ/LivykVi5zgTeVYE
         Eg6okvKXfe4AYLB2Rw391JlzhG2NXJF+xfe+pEVblOydZOfQSlxZsPao3Nz0VK2Lo/zS
         lfBb1NMozCh+QRcsMT0lexpxwe4Zll4na8lEHLIftatwZPm27lE5Ih9xehsv8azYIvoT
         4bD42ibE65tdd/f8ddjIyaGGjAql5tAf81PGYn2KetJnvcDj21wpf0zQANRTSKH6hiZe
         QXuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700062664; x=1700667464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxWKE0RnE67ZCac+DE3wf0+WlhQHwaxB8ToZtgmVZwY=;
        b=vQjEskGR4uxAcT/okYxRajFc6UQHs0+UUQ7gWBQKZr4s3RtZcrwiwfGX3+6vHlEqH8
         XNEaST5U7NRN4pGLQHuwievHKs19pK3/brVqUjgffxijobZbCNrqUmlYzQWvKFXH+D87
         B3nNfoyHV9ajOvAKkMrTI/tglmt57e2JcCeRDZYkjQ7juzcwta4oujm+YMBCBffW35SJ
         JMCOYiUn2Fi/tb4oAM/Ifa6ovHUzJAi7KB3U2zoVWPITGwdv5lTjZZ+Hbx1F124x244F
         jxKdl3Y9OZtt2U4QfhKwmIFgR2dU2d59/W+DncpbzvnWmVvJnh3KY00NV8ajmu9lsGV9
         K+Qw==
X-Gm-Message-State: AOJu0YxWg8Inpql5piJ74qfPEjr/RlQxzyy1UR006CaC2AcCtGDPssIv
	ejheISoTl7Wrgt3pl5SlEpOVmjau1eZSxhWNsH375A==
X-Google-Smtp-Source: AGHT+IGO8zAnm0zIxz1rZhEvNk250XK6A18NgKyait+fesnXkzrYw4HG90ngI8KHEvMDRK2dAwrF7to4ErqNn8RuSQ0=
X-Received: by 2002:a05:6358:590c:b0:168:e69b:538c with SMTP id
 g12-20020a056358590c00b00168e69b538cmr6106636rwf.3.1700062663887; Wed, 15 Nov
 2023 07:37:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYv94gx8+-JMzbmQaue3q3y6QdBmsGUCdD-26X5XavL3Ag@mail.gmail.com>
 <ZAocZRZh4FQRH3lc@smile.fi.intel.com> <CA+G9fYsOttth+k3Ki8LK_ZiayvXa0bAg-DmQAaFHZeEyR=6Lrw@mail.gmail.com>
 <CACRpkdbUYWcFiRh+Y=MOekv2RjSP4sB2t5tVrSsz54Eez6wmVg@mail.gmail.com>
 <ZJHWdcP+PDaNrw07@smile.fi.intel.com> <CA+G9fYvReHr+ofJAW4yfA5EWT6-MRpR2+fOQG24hROjSd+dY0g@mail.gmail.com>
 <ZVQh_nvgqMkd3tN6@surfacebook.localdomain>
In-Reply-To: <ZVQh_nvgqMkd3tN6@surfacebook.localdomain>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 15 Nov 2023 21:07:32 +0530
Message-ID: <CA+G9fYujHuwn_AFDeFHbt0DMx7A63fjLR25aX7pkoMcVmmxbog@mail.gmail.com>
Subject: Re: selftests: gpio: crash on arm64
To: andy.shevchenko@gmail.com
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, 
	Arnd Bergmann <arnd@arndb.de>, Shuah Khan <shuah@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Pengfei Xu <pengfei.xu@intel.com>, yi1.lai@intel.com, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 15 Nov 2023 at 07:12, <andy.shevchenko@gmail.com> wrote:
>
> Tue, Nov 07, 2023 at 07:21:32PM +0530, Naresh Kamboju kirjoitti:
> > On Tue, 20 Jun 2023 at 22:11, Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Tue, Apr 11, 2023 at 10:57:28AM +0200, Linus Walleij wrote:
> > > > On Mon, Apr 10, 2023 at 11:16=E2=80=AFAM Naresh Kamboju
> > > > <naresh.kamboju@linaro.org> wrote:
>
> ...
>
> > > > Add a pr_info() devm_gpio_chip_release() in drivers/gpio/gpiolib-de=
vres.c
> > > > and see if the callback is even called. I think this could be the
> > > > problem: if that isn't cleaned up, there will be dangling reference=
s.
> > >
> > > Side note: Since we have devres tracepoints, your patch seems an over=
kill :-)
> > > Just enable devres tracepoints and filter out by the function name. I=
 believe
> > > that should work.
> >
> > Since I have been tracking open issues on the stable-rc kernel,
> > The reported problem on stable-rc linux.6.3.y has been solved
> > on the stable-rc linux.6.6.y branch.
> >
> > Thanks for fixing this reported issue.
> >
> > Upstream links about this fix and discussion,
>
> I'm a bit lost. Is the [3] fixed? Is the fix the below mentioned commit?

As per my understanding on this,
The reported issue has been fixed with the below commit.

>
> > Commit daecca4b8433
> > gpiolib: Do not alter GPIO chip fwnode member
> >
> > [1] https://lore.kernel.org/linux-gpio/20230703142308.5772-4-andriy.she=
vchenko@linux.intel.com/
> > [2] https://lore.kernel.org/linux-gpio/CAMRc=3DMfFEBSeJ78NO7XeuzAMJ0Kez=
EPAYWsWnFXXaRyQPAf3dA@mail.gmail.com/
> > [3] https://lore.kernel.org/linux-gpio/CA+G9fYv94gx8+-JMzbmQaue3q3y6QdB=
msGUCdD-26X5XavL3Ag@mail.gmail.com/
>
> --
> With Best Regards,
> Andy Shevchenko

- Naresh

