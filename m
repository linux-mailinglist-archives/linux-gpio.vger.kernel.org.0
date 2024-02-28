Return-Path: <linux-gpio+bounces-3902-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C48186BA12
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Feb 2024 22:37:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3CDE8B294C9
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Feb 2024 21:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1DC05380F;
	Wed, 28 Feb 2024 21:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dCCV8CGF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657A27003E
	for <linux-gpio@vger.kernel.org>; Wed, 28 Feb 2024 21:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709156257; cv=none; b=km2XrBRhbs9dPTyLLS+1KtZF7GXOUSXL+uKqwsqc25vkuyFEugUjOAVpbexSSz1SpQdacogdce+RMA3C1L75Vidyt8w+eq3SX82yCiHv1aV6/g1ZDBgHHYfHQA5UrwqUxRZRkprNVTCItQhaI3PBDaG4HRCfT/K+Yx7416OloJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709156257; c=relaxed/simple;
	bh=7MtaPH4mmZq/nGRB+yz9PCBbXAr4P3Ky9sNTUu/ul50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=otN52gbZ1KBHMfUcw5OSSTYkJiVsxP4mtPfKRGGS/50aZyPrVU5IvrooM8r7KWYGn1z39DkA8ndVrT2QHyyBdifUjav5RZyexdAo2H8CjC6rLG8GDNm+9MIiUD+YeskZAkbMdT1rW31SLVyNwp3gk2i8W2rGIGsXa6KwjUnmHbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dCCV8CGF; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4703e4d53b6so117524137.1
        for <linux-gpio@vger.kernel.org>; Wed, 28 Feb 2024 13:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1709156255; x=1709761055; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I4qG/E7ig3urgZzazatHSTWk740qedvnHhyssGrklwE=;
        b=dCCV8CGFkXtb6F7nr1PUFaMS1R3clHImGe1jfTsDCX1g5NPRTGDnTzEeyNgdzuqJs2
         /6XwhhPaX4JjmXEildJ9wqojm+0AUOgbbMDK7Qvj9jO3ICw1vQfN2n81JKjzX+OepjRK
         F0dGO2zd2zl4wo0iBu7iZ16tETy90AI6rtoNoHPfhQ17vKzC1a/lhS1iH7tZz23HJ5xP
         XVbVCUQGxYnGDUWIS2u6AGRQepw51CiIsCgxWlZDk922U6jcV6b0jn5LOUjwbO7DrSWV
         +pURVYNeDhEP/OOAgy0ckTFpzFuGaI0nU35vlhVS/zAyEqWWLCW9NiZzaT7rneAqWcLK
         mYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709156255; x=1709761055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I4qG/E7ig3urgZzazatHSTWk740qedvnHhyssGrklwE=;
        b=i1kez7V9My+pdkCWRI+vYIcOXyRbmpwUlufHx6LLLkTpHzHvvpipG9vK4wr0VUoDdH
         tJ4jb77DpW0VnIADpmeEqpiUTLCGsQVseP3sgsnBejwvxO/yg4ES4YiaVUsg1k52XlRs
         NQOmdyQK+sl9APnos8Yazsjl6Ucx+x71JRLTyuqa8D9he28uepX5tCK87GIOjKtFgDnM
         fclRVV/uf8qMk8S5YBRxLVzaretyba0Dh5UQz6hf1mHxbvuHBrarizu27HyHnEoOjd8t
         fAg/G/OCwnu+lsgoRBH7bxu9VqTSzyrZKJoQ4gxOH8sNaJH5oeHc5lsPw1BVABoGylYO
         rv3w==
X-Forwarded-Encrypted: i=1; AJvYcCXk0AOriSH1vqCfQ5cdplpbDWozM7dUrDTHHPh5h+hg8Hr7ByjusIYN0s0iySzsVj2LrObDLH4PGDh2sLt8B8pNwDGrB4QGqeU57Q==
X-Gm-Message-State: AOJu0YxO2iGKotvbPfox5wFbSy4/XQ0A7mCrqqlzlrt6SPEMODnwaB1R
	MDs7LfKlhim4zSL5AUWqaz0yXNl+rQcK04ok0NPTzSIb+j7T5KrpuuGm21HRGqthiLlpDwXbCqB
	nDR9iR69wkITYWwWM2jKCMpDluWvqDnBgS/PiUA==
X-Google-Smtp-Source: AGHT+IGq+lHEgVzWoso5P1DGLN7doXiaFOo7RFZl+mOvfNuP7w1nVXfOoqkOmZ008ts9c9Z306x1EbAyL3+iorZ4ops=
X-Received: by 2002:a05:6102:21c6:b0:470:4088:fdc0 with SMTP id
 r6-20020a05610221c600b004704088fdc0mr329127vsg.2.1709156255343; Wed, 28 Feb
 2024 13:37:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240223065254.3795204-1-swboyd@chromium.org> <Zd-CJHkCHpuIEnWh@smile.fi.intel.com>
 <CAMRc=Mdapd2jTACGqm-ujZrAunRmNeJ8_3+bpsN4ieCre52yrg@mail.gmail.com> <Zd-nI9XoYW3hrPXx@smile.fi.intel.com>
In-Reply-To: <Zd-nI9XoYW3hrPXx@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 28 Feb 2024 22:37:24 +0100
Message-ID: <CAMRc=Meh4LCqdfuVhp89Xb=QVWt13a-Ynp+8PPvNEyykvUsnug@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: Pass consumer device through to core in devm_fwnode_gpiod_get_index()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Stephen Boyd <swboyd@chromium.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	linux-gpio@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 10:35=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Feb 28, 2024 at 10:28:07PM +0100, Bartosz Golaszewski wrote:
> > On Wed, Feb 28, 2024 at 7:57=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > > On Thu, Feb 22, 2024 at 10:52:53PM -0800, Stephen Boyd wrote:
> > > > This devm API takes a consumer device as an argument to setup the d=
evm
> > > > action, but throws it away when calling further into gpiolib. This =
leads
> > > > to odd debug messages like this:
> > > >
> > > >  (NULL device *): using DT '/gpio-keys/switch-pen-insert' for '(nul=
l)' GPIO lookup
> > > >
> > > > Let's pass the consumer device down, by directly calling what
> > > > fwnode_gpiod_get_index() calls but pass the device used for devm. T=
his
> > > > changes the message to look like this instead:
> > > >
> > > >  gpio-keys gpio-keys: using DT '/gpio-keys/switch-pen-insert' for '=
(null)' GPIO lookup
> > > >
> > > > Note that callers of fwnode_gpiod_get_index() will still see the NU=
LL
> > > > device pointer debug message, but there's not much we can do about =
that
> > > > because the API doesn't take a struct device.
> > >
> > > Have you seen this?
> > > https://lore.kernel.org/r/20231019173457.2445119-1-andriy.shevchenko@=
linux.intel.com
> >
> > Clearly yes as I queued the first one in that series. The rest did not
> > make its way upstream for whatever reason. What is your point? You
> > want to respin it?
>
> It was a reply to Stephen. :-)
>

Ah, fair enough.

Bart

