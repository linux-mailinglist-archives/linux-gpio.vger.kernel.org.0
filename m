Return-Path: <linux-gpio+bounces-7423-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B21906AEB
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 13:23:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B1C91C243BF
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 11:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1978B143C49;
	Thu, 13 Jun 2024 11:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FQgCtM44"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4629114388D
	for <linux-gpio@vger.kernel.org>; Thu, 13 Jun 2024 11:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718277792; cv=none; b=l+1jT48MyBJY/kzcZa0WxeLpiyUXiuUkM3uslfcT9XKxVoStx60U0E14iHkFVSgk/xWq6PH8Pf1uOkDmAlLhIGSediedN1y549FD11IKsV9/1KaR5MhDD+8/fagJmm36yZ0UUjXrnM68VS4DkBqFC8wOxUfnLt6n7L/+vtYW5bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718277792; c=relaxed/simple;
	bh=jaoFXH8LP9UDt/CXkteKVcrj10H6yKq54b94OsUOCO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=isF2OOoHDyddaNgk7hL9bNb0vsKalKevLlA/m4usQkZENrG0BxnkcymXKxLpdv14kxDvXVFsr7YZ+2Q7vjGtFoz+PXYJVW9hraMHwftIWSAnRjVAv8rRJzSFAvkA8g5gdMGxZwS13cCryvJKibmIxXuzE+x09wuVeWOk0OZ29kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FQgCtM44; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52bbdb15dd5so1149161e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 13 Jun 2024 04:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718277789; x=1718882589; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m7TJj5Nsr7e2H/YfmZt25uBxrUAbjXLqqwNfw8vmDpc=;
        b=FQgCtM44bXSTZHJrbNNJkSk+4Rr7/rofonrSgMvCtadOg3gPzDFd11roXcEB3QJOGL
         gfByedx/+patPvYFa8FGIaYsTXMSyxUBMzsHR9lfEd4tWEMFiw1xlsFxlM9oo3tKndig
         tPCi2qSqymVcNDoRycEFab7uxY+sjQzH1A+K6rN5sdX7OebH/rOLH/JeL8TsO4GWkWtQ
         jMUYwNkotuQTnzLV15d8e8bgI4Msl0UooEegthC2Pz6XUHk3kAAoihpsX0lL0Lpcg3KH
         Y7IIfPb/9pnKP2kmNw9T5VQWoDqJGt6b0AkMT42jzNErOiG9d5BgjRT26PZENhIbdmju
         ZHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718277789; x=1718882589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m7TJj5Nsr7e2H/YfmZt25uBxrUAbjXLqqwNfw8vmDpc=;
        b=fO6I2EVIKRKY+iRjP1yDcaNNMev+lfq7OZWFeSv9MpmLDh3zrqZ7YnnAPff3bysIv8
         +bYKPViwfM8m3GoB/MTn7TBgnDvv8rm3fHsrW3weIYndBNTojlZ0sBJPUVlK0LDSg7Pi
         9ASZ1Cr91fiJAaqXqvePNlO6WvXyrp7wtj3Uj9BbNbFEvjUSFtK6ue1VQExI3IPO03uI
         jCYmX5Cc7ZafF8Z9zSCXGQNgGp+oglHypBbh/tH5J/lsSjuxgZGjuxPdYgzNcaRkbdUT
         S1ui5k+6ldXy93E+qt8DmBMrZreOxght+r+wqXI9uWSkYcG7n6QBHeZh1yb5mkcPd2k8
         sLiw==
X-Forwarded-Encrypted: i=1; AJvYcCUwp9Vw8bnZnbpuLSXiB3+Sc7h0yPF9QuGjP67V07dm6/CKJHrGV9jlvM0eU7P6DjD73Y7W6XkxTnEQmI3QhJL+uHe3/xwAoWjxTQ==
X-Gm-Message-State: AOJu0Yz2H0dV/FxtWw+rLT2U1ToKTU+S4cT57IkfJc4U6j0HPx3n97hl
	LETOatxi2qnxS2bs7bhAtqLUY0ABNXsKhHhPaFQwmmuIJ5tMteTZC+77SBrYsDH5YxoG6CiVuhy
	eVXM6zGBB4ZLK+j4/u9t6oTay4LuwXgAxGFD1EjubSSISxT2j
X-Google-Smtp-Source: AGHT+IFPDV78gV0K/eJed+tkoetTYYLieCZMNDQ/WjGy309Fv/VnP5xP+XDLXlZufMhg5+VZIixjQH3KFqvBu7sAJfY=
X-Received: by 2002:a05:6512:acb:b0:52c:8a37:6d06 with SMTP id
 2adb3069b0e04-52c9a3b9b71mr3354441e87.10.1718277789443; Thu, 13 Jun 2024
 04:23:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240613092830.15761-1-brgl@bgdev.pl> <20240613092830.15761-3-brgl@bgdev.pl>
 <2024061356-uptake-ideology-e57b@gregkh>
In-Reply-To: <2024061356-uptake-ideology-e57b@gregkh>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Jun 2024 13:22:58 +0200
Message-ID: <CAMRc=MfjQdFR_8ALGibxQnr5tzoHykCBpkBxjH78c5HuD43rBg@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] misc: gpio-virtuser: new virtual testing driver
 for the GPIO API
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jonathan Corbet <corbet@lwn.net>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 12:02=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Jun 13, 2024 at 11:28:30AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > The GPIO subsystem used to have a serious problem with undefined behavi=
or
> > and use-after-free bugs on hot-unplug of GPIO chips. This can be
> > considered a corner-case by some as most GPIO controllers are enabled
> > early in the boot process and live until the system goes down but most
> > GPIO drivers do allow unbind over sysfs, many are loadable modules that
> > can be (force) unloaded and there are also GPIO devices that can be
> > dynamically detached, for instance CP2112 which is a USB GPIO expender.
> >
> > Bugs can be triggered both from user-space as well as by in-kernel user=
s.
> > We have the means of testing it from user-space via the character devic=
e
> > but the issues manifest themselves differently in the kernel.
> >
> > This is a proposition of adding a new virtual driver - a configurable
> > GPIO consumer that can be configured over configfs (similarly to
> > gpio-sim) or described on the device-tree.
> >
> > This driver is aimed as a helper in spotting any regressions in
> > hot-unplug handling in GPIOLIB.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  .../admin-guide/gpio/gpio-virtuser.rst        |  176 ++
> >  Documentation/admin-guide/gpio/index.rst      |    1 +
>
> sysfs documentation needs to go in Documentation/ABI/ not in a random
> .rst file where the tools that check this will not catch it.
>

This is a testing driver, not representing real hardware. Do we hold
such modules to the same standard?

> >  MAINTAINERS                                   |    8 +
> >  drivers/misc/Kconfig                          |    8 +
> >  drivers/misc/Makefile                         |    1 +
> >  drivers/misc/gpio-virtuser.c                  | 1790 +++++++++++++++++
>
> Why not put this in drivers/gpio/?  Why misc?
>

Because it's quite... well "misc". It's not a GPIO chip provider
(drivers/gpio/ is for GPIO providers), it's only a GPIO consumer. It
also has an interface that doesn't fit any particular subsystem.

> > +Both attributes allow to read and set arrays of GPIO values. User must=
 pass
> > +exactly the number of values that the array contains in the form of a =
string
> > +containing zeroes and ones representing inactive and active GPIO state=
s
> > +respectively. In this example: ``echo 11 > values``.
>
> sysfs is "one value per file", so why are there multiple values here?
>
> If you want to just use this for testing, and want to put whatever you
> want in the files, just use debugfs, that's what it is there for, not
> sysfs.
>

Debugfs doesn't allow me to attach attributes to a particular device
which is what I want here.

Bart

> > +config GPIO_VIRTUSER
> > +     tristate "GPIO Virtual User Testing Module"
> > +     select CONFIGFS_FS
> > +     select IRQ_WORK
> > +     help
> > +       This enables the configurable, configfs-based virtual GPIO cons=
umer
> > +       testing driver.
> > +
>
> module name?
>
> And you need more documentation here, I have no idea what this means
> when it shows up in a Kconfig help entry :(
>
> thanks,
>
> greg k-h

