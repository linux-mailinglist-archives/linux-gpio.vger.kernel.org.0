Return-Path: <linux-gpio+bounces-11288-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1958899C39F
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 10:41:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B8DE2B269B7
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 08:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C7C14F126;
	Mon, 14 Oct 2024 08:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BH1wREiB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D7214B07A
	for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2024 08:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728895294; cv=none; b=oX1S1/UzoUko51MPCILEBhVigEfri9RUq4AGoTqeOm83OhYvn70CgEWfM06BubD2Otn8tgSaPCNnNDecOEQ5lApdHMoWX6PBSf6q+4tUmtn55/DiPWthMeb+YMaZCUrhYTmSOKXig34d/guGjOszvP6muJJX4XlxjlvVOBO9qi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728895294; c=relaxed/simple;
	bh=9NtSWsa8AOPc9f/f2FUflXBAxHKqc2tUuUxTuXp2ak8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H21RzCJQFMB2tZJzaaK9CXr+XQOZcKefJICwxemRog/4GvowQH9i96mmTZ2TC3imU6hv9xeIoNCeGYU8X261KAAL6okQf3kXL6CikMvjk1Sr8URfW6pdoG5POxq0lDu31BuJRdkcdGTHEB0UgenaICYmF67ylU6oxpNmshozDdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=BH1wREiB; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5398ec2f3c3so4711165e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2024 01:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728895291; x=1729500091; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hnbH1E9KCYAbTBfLOd6pUNJu2FQNFznGGWSpn2EtQmY=;
        b=BH1wREiB6fU23hC2S8liS/OrtQcDIFPMu0Tb8DOiD50jINOStf4yq2XqaInvhxAJLW
         jlvx42KeC2rbI8pRoBT7hlpMfSJcX8d7nAtRSAniL/kLVtWwj6fE4Db8ATLye0BNoNg/
         OQIysWC3crDDmnLeZrmy2KZkEcigEAEpnipzZRfqr2pY/JfSEz5VmPa/C1C5ldkrff+9
         PJgBAchdSeRwSXMOMtNRh3Iw1rBd129RK3zk40UuVZ0auUFDvzce2xTiswFnv2BlMcL1
         l9BeLxZG2RO/LGs4osjH9k4VSXr/pfZzapxqkfAN3eulvMI1PP+jz2/GUYVliS1r536g
         fNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728895291; x=1729500091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hnbH1E9KCYAbTBfLOd6pUNJu2FQNFznGGWSpn2EtQmY=;
        b=FMkCdZamKfkZ1lf5ks40/X8gnRkoI2VJ3aISzT0ZVxLJg2KfNvdDnrs/hLiHi/t5sV
         mdIEncHMqkn6Nss6PA6gBI5oBoWum2AKdmkUFB/MW4l8zuXTLEfEcMtjdCNHtBPQ4LCU
         S2rGwzKNaS2X9lalcSl4VMer9BrnKpw8hBLNLHBN2i1qMoBPf0KC2FzS+XOhgD44tYSh
         2L1ACMxRdT49kA5S0eFC4sQv8+5fcDU4CgZLtq/n7BnyQGj/Kv1h6SHy/7sucVaCCSY1
         psmNdK+H/TCJmqXHrSYZLpdxQKeWKRTr35XJfI90Rj/4OYZaLK0e7xM9A1EACr9Q3G6S
         y7tQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBGRYpzOcvBYwASId+C/O65EkaY8A/XipnGF5wjUrKLh7GUWbPi6YLZQjBIS8GsYlRDhrC9GpDwph3@vger.kernel.org
X-Gm-Message-State: AOJu0YyECE4Oc0os/3PlibesJmGVUg7S7oA37goipvVmbfzkEbZQ3qhD
	ix44cC5+kNc+q+MqBNVI5B5QU73t09Hl6x7+xMT/nwA4+JpQl77oM5dSlFGqv8TwZZ0+jTj81J7
	e5V/pE06jUXuAMhcHO2xu6HCVEu0MJnszhfeVPw==
X-Google-Smtp-Source: AGHT+IGDMPs+WuwkujboB8aBC0A0XweIGUJhfYmFBdbfdvYshC83WCgFobxuGCAkekocA75xpr6he/xZIebirsvZOrU=
X-Received: by 2002:ac2:4e07:0:b0:539:88f7:d3c4 with SMTP id
 2adb3069b0e04-539e5514af3mr2130101e87.29.1728895291043; Mon, 14 Oct 2024
 01:41:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241010-gpio-notify-in-kernel-events-v2-0-b560411f7c59@linaro.org>
 <20241010-gpio-notify-in-kernel-events-v2-2-b560411f7c59@linaro.org>
 <20241014015817.GA20620@rigel> <CAMRc=MewhPi3O6qM7E699gpwcegNiAsizioDjREn7cOM1xHevA@mail.gmail.com>
 <20241014083230.GA76995@rigel>
In-Reply-To: <20241014083230.GA76995@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 14 Oct 2024 10:41:20 +0200
Message-ID: <CAMRc=Mdq6ACsxW95+rinRYh-HAxtbWsT7KxDq1M+H4C8Q8zJ5A@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] gpio: cdev: prepare gpio_desc_to_lineinfo() for
 being called from atomic
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 10:32=E2=80=AFAM Kent Gibson <warthog618@gmail.com>=
 wrote:
>
> On Mon, Oct 14, 2024 at 09:45:19AM +0200, Bartosz Golaszewski wrote:
> > On Mon, Oct 14, 2024 at 3:58=E2=80=AFAM Kent Gibson <warthog618@gmail.c=
om> wrote:
> > >
> > > On Thu, Oct 10, 2024 at 11:10:23AM +0200, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > In order to prepare gpio_desc_to_lineinfo() to being called from at=
omic
> > > > context, add a new argument - bool atomic - which, if set, indicate=
s
> > > > that no sleeping functions must be called (currently: only
> > > > pinctrl_gpio_can_use_line()).
> > > >
> > > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > ---
> > > >       unsigned long dflags;
> > > >       const char *label;
> > > > @@ -2402,9 +2402,13 @@ static void gpio_desc_to_lineinfo(struct gpi=
o_desc *desc,
> > > >           test_bit(FLAG_USED_AS_IRQ, &dflags) ||
> > > >           test_bit(FLAG_EXPORT, &dflags) ||
> > > >           test_bit(FLAG_SYSFS, &dflags) ||
> > > > -         !gpiochip_line_is_valid(guard.gc, info->offset) ||
> > > > -         !pinctrl_gpio_can_use_line(guard.gc, info->offset))
> > > > +         !gpiochip_line_is_valid(guard.gc, info->offset))
> > > >               info->flags |=3D GPIO_V2_LINE_FLAG_USED;
> > > > +
> > > > +     if (!atomic) {
> > > > +             if (!pinctrl_gpio_can_use_line(guard.gc, info->offset=
))
> > > > +                     info->flags |=3D GPIO_V2_LINE_FLAG_USED;
> > > > +     }
> > > >
> > >
> > > Should be else if.
> > >
> >
> > If we're not atomic, let's call pinctrl_gpio_can_use_line() and update
> > the flag accordingly. If we're in atomic, just don't do it. In any
> > case do the rest. Looks good to me, am I missing something?
> >
>
> Previously the preceding if short circuits and doesn't perform the
> pinctl check if ANY of the preceding checks are true.
> The pinctrl check should be in an else-if to get the same behaviour.
>
> I am refering to the if (!atomic), btw, not the if in its body.
> (that is why my comment is placed after the closing bracket)
>

Ok, got it.

Bartosz

