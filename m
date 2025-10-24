Return-Path: <linux-gpio+bounces-27576-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 35354C04AE5
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Oct 2025 09:21:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id ADB8C35BFFB
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Oct 2025 07:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 305122D248E;
	Fri, 24 Oct 2025 07:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Hh/LIHH9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEFC2D0C83
	for <linux-gpio@vger.kernel.org>; Fri, 24 Oct 2025 07:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761290259; cv=none; b=VoUJt3YQX0JH7QqcY8Gwu01txmxeceLQhHhCXrnWfikB4cM/D+1Ky3E3TiwCDBvKygvo3Z9PGf78cgKlmsFcqqjWgwtKLLwyZw4PCLwWLcfiqW35QJ/AITnso6xCH/hnMrEvZJvnZ6MjmdSY1PsPFF6dWa7Nc//QLTa3vK2TJP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761290259; c=relaxed/simple;
	bh=h6tvnK0ig57jTEdAxnPvo8iEQOCIPVB7NO7ABROSJlE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SoclV+byKLCsEelUQoc+wniyiTR7Nl+dwDCpk2FXOtWL5rtO0WX4UErv2IAm2oGx4OIl2FtTZhXF63kErhPyjO/43h8rf1Z6hTsUsPkfKlG6JR9QJeL7sPCZOvdTnP5NoByAD766q2ad/2vyoMimC4FEjDtgOTNgNfg10uOMeAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Hh/LIHH9; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-57a292a3a4bso2203257e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 24 Oct 2025 00:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761290256; x=1761895056; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50RoFCtoYdtNhCcZXh1N26BbF9N2TRDC7n9nR8KK4ck=;
        b=Hh/LIHH9EWP9SMo1Wz5KepCOsj7UOc1jBMW/MX6ohDd4KTQmQ17vieVR1zojgB00jV
         leZ+sb2JWjQFdJJmM37l2QezEFlulxaqMmBR2GSYsSsp0p693NgdZDJXXm2ehejLOKye
         b2bInW90ScSf4wTuC3I2s5/uUwW++tX3mHiiFo3oPdIfSMU0WxzkLxm43ynRWlPDxl+e
         Fiz2NuoghtjzM9Z+X9p7mkDU6Z1ig0auZFNWMIjHHDmA2YlorVgaghfazAQfnkSd36dQ
         F2tHDJsAeofrFad3Km5PEDWF1X+kDkTmxnSUySyupWSrMUOxBGRxwqGJUSdfiygmWBwr
         de6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761290256; x=1761895056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=50RoFCtoYdtNhCcZXh1N26BbF9N2TRDC7n9nR8KK4ck=;
        b=wnmSGj5jTnX8cZWiGM3r49etSdVjRzOHlGeagMr1yWbk69kaka8TANl3TUIo8WPp8Q
         jEk0hbNFPcWZWfX1TaFZA4fSWV0DvmQ5dCGixUDztJOCq66ELTUJIkA1M+RzuY6HkvAN
         hhWSozRbpFI7e+kLeR7etO1haR6VLULcwV45j5NTPUHUosgpL4fsyvhaFdlUdBbWSDyi
         JjZb5VF27iRCpELN9utSNh7dqkL1e+13RfByvA82T9zOye/3dBt9EoP6s9RCgKLVUTXK
         vV2v6PLJTQM21mhCH+QHB2IJmArdwiBmqRkke5NPzm5Z9HxGQb2FdNKBrQHEUITSVmmK
         tDKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMjtXfsD5r005PrHdovBJeSnpWgfymJUxgE9hGCmMCGyjOpeTD0wQr1rYwlsBTvvUzVhk27XtdqaKd@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj/vfOdNAqVUrBCXc9ooQnXrNnE6mIjYpdPXEcpRrTISNGOZdU
	RhcLUi4kHatWUSWH1ibTyZmpzKKs34KyXR4wV8MZmIgnZiitfJ7lJjnRxzs9IiEOb+bWGel3jYx
	2LG8DMalB1jUWbjIeivJoVOaQmH62QxV9W+9rAy/NWg==
X-Gm-Gg: ASbGncuaBW/JaTEf7Dcs3JP7omdMtTKXVadoRV0yofwYyiOYIb7sQdxRib1QzwIB7rf
	i3/ff2QRfWKuoBwgr0fkmFzyMtQDAPEJXr1DTqh4/MwAKFdWd6ECmbDcfzIQTV+IdgAzrF5Dla5
	WUljA3VAMSeHWIbfE1jwvT+TOUaZ+bJZDFhc/CNUHvy0wI84WbN9LCt8vN/8j7tTvkgHOdQe+xD
	EzoFyKDCkpuqxOzDdcb6RzBHWb7B52wkliJ7pdAO3npsFXY0p9SKozwJCFpBrb/CwU+ByWPM0qs
	VdLTKuR6PkSnkt4=
X-Google-Smtp-Source: AGHT+IE8neVFu8ZIN5sSXL6tieYxgR9sJA/fT6BQfIeVNgFTWlxgxkEp21AyvSf43DhGoh14lH1c87nKZ36hn82BpM4=
X-Received: by 2002:a05:6512:3c89:b0:592:f727:3209 with SMTP id
 2adb3069b0e04-592f72732cbmr1678539e87.37.1761290256485; Fri, 24 Oct 2025
 00:17:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022-reset-gpios-swnodes-v2-0-69088530291b@linaro.org>
 <20251022-reset-gpios-swnodes-v2-4-69088530291b@linaro.org> <aPkmDWJEKrjlMPnD@smile.fi.intel.com>
In-Reply-To: <aPkmDWJEKrjlMPnD@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 24 Oct 2025 09:17:25 +0200
X-Gm-Features: AS18NWChfhu5HfalO-BdlmyskcwYb0ZO_M2N7vcsZ7y2nHqTFlEjipwk5PGstwk
Message-ID: <CAMRc=MeNNGXy6aAanLnbWFYJiK65dvm_HyjCDS1=LZ4RiA4GAA@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] gpio: swnode: don't use the swnode's name as the
 key for GPIO lookup
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 8:44=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Oct 22, 2025 at 03:41:03PM +0200, Bartosz Golaszewski wrote:
> >
> > Looking up a GPIO controller by label that is the name of the software
> > node is wonky at best - the GPIO controller driver is free to set
> > a different label than the name of its firmware node. We're already bei=
ng
> > passed a firmware node handle attached to the GPIO device to
> > swnode_get_gpio_device() so use it instead for a more precise lookup.
>
> ...
>
> >  static struct gpio_device *swnode_get_gpio_device(struct fwnode_handle=
 *fwnode)
> >  {
> > +     struct gpio_device *gdev __free(gpio_device_put) =3D
> > +                                     gpio_device_find_by_fwnode(fwnode=
);
> > +     if (!gdev)
> > +             return ERR_PTR(-EPROBE_DEFER);
> >
> >       /*
> >        * Check for a special node that identifies undefined GPIOs, this=
 is
> >        * primarily used as a key for internal chip selects in SPI bindi=
ngs.
> >        */
> >       if (IS_ENABLED(CONFIG_GPIO_SWNODE_UNDEFINED) &&
> > +         !strcmp(fwnode_get_name(fwnode), GPIOLIB_SWNODE_UNDEFINED_NAM=
E))
> >               return ERR_PTR(-ENOENT);
>
> Now we might get EPROBE_DEREF for the cases when previously it was ENOENT=
.
> Why is this not a problem? (I haven't found the answer neither in the com=
ment
> above, nor in the commit message)
>

Yeah, maybe it should only change the last part from looking up by
label to looking up by fwnode and leave the previous checks in place.

Bart

