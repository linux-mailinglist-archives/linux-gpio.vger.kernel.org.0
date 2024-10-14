Return-Path: <linux-gpio+bounces-11299-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F70699C5C0
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 11:32:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B03361C225F5
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 09:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DBDA154C0F;
	Mon, 14 Oct 2024 09:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dORX6Fse"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8398A146D65
	for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2024 09:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728898359; cv=none; b=ghItHg1eaRtmkFg1fDMnyoPPhKtwAYdcrneYn+fZx8HRHkiumewkGtbINngEcS5fIA72yd2s6B3+7/ca/PEvCKZHJo5/wim1e1rguHgrOOUbaXyJe+guBUdzMDBUjHkzn4mHnlNuTr8zB5k+YAIOYoU3w46AMicxTeWg8lqPwkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728898359; c=relaxed/simple;
	bh=Keaah5l1gMY79cEpIH5DcFLPpE/5+8Tm2Fy2JXm1Zc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cRoChWl25kpR+35/ddlnpd6TbAsPiaJkWNpMxVZrEZ+ILelZwVncDqbErfsviwsA+NTGBeUV0Wb3tRW3/yKFsFHHsQiZ/8LCxXVKOoUmp8C6IiJHlP+mauVIcz5CCriTNyCd2JU3uqCPIIkT+3xUzH2N7zJhoAVEhuL0yYTP95U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dORX6Fse; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539983beb19so4307239e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2024 02:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728898356; x=1729503156; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lfneKJD9s7n0cg97Ymqk1c8gEskV7vajSDux8+eET10=;
        b=dORX6FseS8h9NrgTjRMSrr9p3O4P9+8ZwLE2agjvE5Ka4j9yZYqNA0NDJ8bnMZonWz
         owFfQ2F1QlL91Ir5SdQLdlNisvX/KDl6XGZa/cQ2bsfWLU/4TySkoRSmYung++QNyvEU
         7sLiLPFwcDPRBmRwenD748KR2+Dm//iPpFlL2o+790+xNX69O1dhr4HZva03BFnm9pD9
         rxtgeh00bKblYzjxh67fRTpNpFJ6F5IGgOXSksVppGY1nkUBTgbrNxexm/fGPn0Tzyec
         XJmVHRWochZmAtoFBBOOmzCg38JqAYpGlMYG7ptx42Cydoi+wOfVjL5n02KePb2KyBRX
         TZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728898356; x=1729503156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lfneKJD9s7n0cg97Ymqk1c8gEskV7vajSDux8+eET10=;
        b=Sooa+xUZ15u3ev/uTCXH9uUYis3VC3Bj2UNl3QIXoenxmSuT++eFl5+EKPR0vR+mYE
         rR3itC/CUWRIWnPYUkPlqzVhOlFdzCR2/6QssHGMIaQVp6MbrGmvxvqy0q7g23YnsA7I
         72V/TQ+zZo+i/W3hwoSfXe+soUNM+2cxtYAV0Fx8dJ9jZhI9K/+M8/aYF0yvVyLIN/OZ
         GyMkxmj2NCaOwZyoYj6MEyimcYu9jcMz6Qp768F1Zu9aGZnkBiIXjO+CJE+zfzFJeNLd
         6njagmc3iz0fZThg5fzUnqd3cWhk0NIy0fzoB12KvBAW4iiRmGaYungWPQ4t05ygg8V6
         slfA==
X-Forwarded-Encrypted: i=1; AJvYcCU4TliEUV2DARTQpxGfCNH+vg0a0zXiJ6XCmfPjMf6TWdVv6XfAgDvV+wN6PPTKcwHzMChxPtKQH94+@vger.kernel.org
X-Gm-Message-State: AOJu0YxjjwSJcnRb3dqbGePepihPe27BScq+jwW0OHspdUKS7nHt9KEA
	WVhLL5CBiLxcACr5cBoYFhTGfCuczNEfG7yQfbT1ic635+BZkwdv2hs7kXICu7nqHZ/fI9SjkGJ
	0dcgE+fLBLTk7YVd/hw+F13EtMvT142+qZIEdCA==
X-Google-Smtp-Source: AGHT+IGu1aLp2QUS44YRhbYBzcW5nnGJeO4uvh3RAPV4KBMUBfnkkM0lJ8FNAJMJ8lPe5CqA316xRMYuygZp+o4WVZA=
X-Received: by 2002:a05:6512:6d2:b0:539:f4c1:71d3 with SMTP id
 2adb3069b0e04-539f4c17406mr1425450e87.29.1728898355652; Mon, 14 Oct 2024
 02:32:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241010-gpio-notify-in-kernel-events-v2-0-b560411f7c59@linaro.org>
 <20241010-gpio-notify-in-kernel-events-v2-5-b560411f7c59@linaro.org>
 <20241014021140.GC20620@rigel> <CAMRc=MeoSnr-z=fmfRoTU-vdL_BAkTAE+0HiBaVUWmFG-bOTPw@mail.gmail.com>
 <20241014092450.GA101913@rigel> <CAMRc=Mdf8CLQDPL8RMyWPyx8362xS3jEBe4zM=JL_dzRgF5wow@mail.gmail.com>
 <20241014092955.GA105498@rigel>
In-Reply-To: <20241014092955.GA105498@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 14 Oct 2024 11:32:24 +0200
Message-ID: <CAMRc=MchnY==2vLFUaOEJSTqaLvimkyNSixNpqbPkNyzSGew9g@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] gpiolib: switch the line state notifier to atomic
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 11:30=E2=80=AFAM Kent Gibson <warthog618@gmail.com>=
 wrote:
>
> On Mon, Oct 14, 2024 at 11:27:05AM +0200, Bartosz Golaszewski wrote:
> > On Mon, Oct 14, 2024 at 11:24=E2=80=AFAM Kent Gibson <warthog618@gmail.=
com> wrote:
> > >
> > > On Mon, Oct 14, 2024 at 09:48:16AM +0200, Bartosz Golaszewski wrote:
> > > > On Mon, Oct 14, 2024 at 4:11=E2=80=AFAM Kent Gibson <warthog618@gma=
il.com> wrote:
> > > > > >
> > > > > > +     /*
> > > > > > +      * This is called from atomic context (with a spinlock ta=
ken by the
> > > > > > +      * atomic notifier chain). Any sleeping calls must be don=
e outside of
> > > > > > +      * this function in process context of the dedicated work=
queue.
> > > > > > +      *
> > > > > > +      * Let's gather as much info as possible from the descrip=
tor and
> > > > > > +      * postpone just the call to pinctrl_gpio_can_use_line() =
until the work
> > > > > > +      * is executed.
> > > > > > +      */
> > > > > > +
> > > > >
> > > > > Should be in patch 4?  You aren't otherwise changing that functio=
n here.
> > > > >
> > > >
> > > > Until this patch, the comment isn't really true, so I figured it ma=
kes
> > > > more sense here.
> > > >
> > >
> > > So the validity of the comment depends on how the function is being c=
alled?
> > > Then perhaps you should reword it as well.
> > >
> >
> > The validity of the comment depends on the type of the notifier used.
> > As long as it's a blocking notifier, it's called with a mutex taken -
> > it's process context. When we switch to the atomic notifier, this
> > function is now called with a spinlock taken, so it's considered
> > atomic.
> >
>
> Indeed - so the comment is brittle.
>

I'm not sure what you're saying. We know it's an atomic notifier, we
assign this callback to the block and register by calling
atomic_notifier_chain_register(). I fail to see why you consider it
"brittle".

Bart

