Return-Path: <linux-gpio+bounces-11259-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7385999C1CE
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 09:45:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A573C1C23D8C
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 07:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FCA614B942;
	Mon, 14 Oct 2024 07:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FJDlmUXe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBEA9474
	for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2024 07:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728891934; cv=none; b=ho3XIFUDkWtSCLJfLA5wQ0ywUKLrlZWUlj3Te8y1K3rmUJkDGU5aF5NnEUesssCyFvnHp44aZFQzoh249TtodhcQCJ9sFdnKfHReKyb80KnLP7mMUtkmNC5svIXlb7l93tSEyBxBvi3bULmU9Zj2uIztnDhBjqQdIpouspux0vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728891934; c=relaxed/simple;
	bh=6gyvojCm2IXQQIl/5oD5XY1x6/gG5ZCkK0b5m04Aa1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YzK5tUxnTHcN84plif2OpYpr695623tklfonVFpS1rVSAOSqi4li1W7QWichx2OtgibzGyy7rwnS/rSl6te4ZYgVwIi1pLVXbsi4IXktqNEgYMs20AD+CcJF3RKoAyZNy8lWNdTk77LZ5EwKZJIhxUU+ONU6QFZ5HL/u4wI8kbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FJDlmUXe; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb443746b8so5436271fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2024 00:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728891930; x=1729496730; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UAg31nfJH8ImnccLAcI3kFowtfKReTd3tZlo/lfn8x8=;
        b=FJDlmUXe5tizMRP2uzoo0RDmRDutpR8nC9OV9kZXWgeIoR7aWLFwo+xxbQtcuOpWqa
         wt3cpF566Z1k01H331ZG9FTbMP5s6QxpPBEXp14LibGtNOTaUnglA+Ud8G+pNmV9I0EX
         xq+t72D4G0gX4uE9lEUtjgqI4VBxHn3FfTPHnQC3c3ahzZm1i1JwCVRO5yeP6liUtoi9
         t+JZS+1Qw+FVp2s6BBYIIQlyU3rpklDp0Tz4JOCqP6wTHQNHZRLEZ8q6k6x9+pomQWTS
         Gpj5/WJfG3wceDeDjner4U36a/BxK3aVbqb2l/zT3Xl7F0j1r3txdQlbUNSesHHTocFL
         QK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728891930; x=1729496730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UAg31nfJH8ImnccLAcI3kFowtfKReTd3tZlo/lfn8x8=;
        b=DjyqNrl4McRDN2xWaZ7i69RaRDc2t9B43TNvu+oP9LoUR2t5eZnKRxAdjoC0WNUK2A
         0OD2SaF3bqXnZi9LIR31p0MK32xCRlRCcaroMQ6MJYgOLIk36XcccvdsptKprS787l9p
         I3tzFvYZlm1u2SBrBHtkmLZlYPRllHdHUSmrfVm5RDlcZ98q3gdhGUQI4ZHGy1aflklH
         tlN5BrhE3kEV7pT8VN4nu7dLfePBleJs+serGiccJGm+4ksIxQdDLFS9zyF1TgfCAE4+
         2IM9jtSJoM8epaD/dQaR4wqQSVqkbiwONXrAFR8u56Se4iMA44rAOw141/grj+1tKqnk
         03sw==
X-Forwarded-Encrypted: i=1; AJvYcCX+ra+sR73SdkquNNGnTsGgqXSp53WEBoWzHXZojsJcqSzFlCIjiY+3A9A7H77E2GFTOw+33yHYwjlJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5ejy4UNvQlFz3VC6d0KENH+kNI92kIxxGYRiZZ6nivCo7zfS0
	S1U7dzqB6ukmvSuEgrAiElGvnaKLWCROduCCwdmUHxqEKUTJ3Lr0xiNnsN0QPGIsJ5hGrTN2Gdb
	opknlMbI1/2nyGBIw+zZVD9jFcjQu0tmI+kWKcg==
X-Google-Smtp-Source: AGHT+IHqfbw9C7nF34x2aWxdA78v3qQtTazKDUJuWEHzP5Iw7u8fStGIHS9BcXsRs+AS2mrM/UToBx7wsYzxSzGxYU0=
X-Received: by 2002:ac2:4f0b:0:b0:539:f675:84d7 with SMTP id
 2adb3069b0e04-539f67585e2mr1068883e87.32.1728891930192; Mon, 14 Oct 2024
 00:45:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241010-gpio-notify-in-kernel-events-v2-0-b560411f7c59@linaro.org>
 <20241010-gpio-notify-in-kernel-events-v2-2-b560411f7c59@linaro.org> <20241014015817.GA20620@rigel>
In-Reply-To: <20241014015817.GA20620@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 14 Oct 2024 09:45:19 +0200
Message-ID: <CAMRc=MewhPi3O6qM7E699gpwcegNiAsizioDjREn7cOM1xHevA@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] gpio: cdev: prepare gpio_desc_to_lineinfo() for
 being called from atomic
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 3:58=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Thu, Oct 10, 2024 at 11:10:23AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > In order to prepare gpio_desc_to_lineinfo() to being called from atomic
> > context, add a new argument - bool atomic - which, if set, indicates
> > that no sleeping functions must be called (currently: only
> > pinctrl_gpio_can_use_line()).
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >       unsigned long dflags;
> >       const char *label;
> > @@ -2402,9 +2402,13 @@ static void gpio_desc_to_lineinfo(struct gpio_de=
sc *desc,
> >           test_bit(FLAG_USED_AS_IRQ, &dflags) ||
> >           test_bit(FLAG_EXPORT, &dflags) ||
> >           test_bit(FLAG_SYSFS, &dflags) ||
> > -         !gpiochip_line_is_valid(guard.gc, info->offset) ||
> > -         !pinctrl_gpio_can_use_line(guard.gc, info->offset))
> > +         !gpiochip_line_is_valid(guard.gc, info->offset))
> >               info->flags |=3D GPIO_V2_LINE_FLAG_USED;
> > +
> > +     if (!atomic) {
> > +             if (!pinctrl_gpio_can_use_line(guard.gc, info->offset))
> > +                     info->flags |=3D GPIO_V2_LINE_FLAG_USED;
> > +     }
> >
>
> Should be else if.
>

If we're not atomic, let's call pinctrl_gpio_can_use_line() and update
the flag accordingly. If we're in atomic, just don't do it. In any
case do the rest. Looks good to me, am I missing something?

Bart

>
> >       if (test_bit(FLAG_IS_OUT, &dflags))
> >               info->flags |=3D GPIO_V2_LINE_FLAG_OUTPUT;
> > @@ -2502,7 +2506,7 @@ static int lineinfo_get_v1(struct gpio_chardev_da=
ta *cdev, void __user *ip,
> >                       return -EBUSY;
> >       }
> >

