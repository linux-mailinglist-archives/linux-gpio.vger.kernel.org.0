Return-Path: <linux-gpio+bounces-18190-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1ADA79DE1
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Apr 2025 10:20:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E52E1890CCE
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Apr 2025 08:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B1BF24169D;
	Thu,  3 Apr 2025 08:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sjFk2UQm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8081EF092
	for <linux-gpio@vger.kernel.org>; Thu,  3 Apr 2025 08:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743668423; cv=none; b=JWy0euHe4Lz2ogfDQ7gfj2gscXo3s5Mr45lvsOPVAWGkDOVkb9qtprLv8QW55TKY6/r91Fb5/nwoW67u3gdTQcJ/IcnKuiymS6iG0hn/6nALxVKRN/BJuEtyeCITGoqLOgzMueitrCWCKtvKPPOZ8pQid7Um8HPUXCO1xVbhNLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743668423; c=relaxed/simple;
	bh=WtU0K9gXSVbwK3uZYqz27sU+ErkGzv8fI/hhbeLAXNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IDjeulhnICowoU1Ri/hS4U1k+C3PnonOFC0GYutSAoxrwdoRxHwRhD6eCfTrzo5O1UKfV7xROz1+5dFquFhun8P9RFhXNUYOJzftCNP6tg+UfzQ43E+DVjB+JTPE2ho9XUNewhqekfIKGczTLkZM/avSKTfbokY/o0vwhePYIu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sjFk2UQm; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30bfd4d4c63so5672781fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 03 Apr 2025 01:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743668419; x=1744273219; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WtU0K9gXSVbwK3uZYqz27sU+ErkGzv8fI/hhbeLAXNQ=;
        b=sjFk2UQm3sgHfZVvdEeaf/nukjD0yUq0jTEvp+A5dofQrW+JtlCqDBtbIhFYHNJwLi
         gM0jEbJ8jHh1vhUAehztMc8SswKnQxpXmyondA+TMEiZa2+fMSxScttccZNiAc2dz23Z
         zXcOBzZdJ71OD2X8wYwocaqHi1iwyqj7nLFh7FaefkWQKNnUqSnX65LA1A0/1rZtFUGv
         VVH4nkq9yaSQcbJLaBjVRpGsBYqRndgj+/1xvBW9sTuhMvJD/xxPbyznN4j+YiCEviug
         Dnj1Bty49P+Lep6D22R2rM4rAQK1J+TieZN18xOY7K4dDtKPCpdLvnJQ4E6EqxYLZngs
         Z/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743668419; x=1744273219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WtU0K9gXSVbwK3uZYqz27sU+ErkGzv8fI/hhbeLAXNQ=;
        b=wMcHFuMCC+s+l9d3XmKvvpVJipuUjB0+VCOFs47HR5i8HBdQqRcSdij/IYNvuwb/cE
         BQkc+7iCtFf37t0zMWztwtdPwx5k3/cbUofNqssT/RXjRp0ssdF6ro7eVgotkO9Opzu7
         e33GV9RBozjHIRFynlAs3JsfxYQXeW+VoiI6nrObVs0HljGfh0I2iVS5RSLB7P8UmWFL
         LoAXvPUTcVc5L9QSSCQMCDS8B4pCFG80PhVuztcCEHoTFJ2hYaue8DXjJpS1YA1hk+lU
         y1z98lQVuwqy60C0DOcJyAqKuJ5PJ/Bm8CYmB0wDp/qY2+tH/50SwfsoQkV6AQQ6LekM
         x9QA==
X-Forwarded-Encrypted: i=1; AJvYcCVZ7gkmeljjrRxr7DSfIotSz0pjuEr8Q1XKirqDXV6qSIAhg57il5x8eV9D1jHwKv+c4hki4Udqagqi@vger.kernel.org
X-Gm-Message-State: AOJu0YzyRdDPfFWitJwtFQl14VygjxyayhjMH+YDZSxRTL4VCTjlwoHI
	luLPAobYrQNGNLD8QKA3SobVmcXZuwqoXIAZRP5pd9aEba7Rd/9QEUs2/57gv8lJg4ZpAhzc3ob
	41MrqtbefvD9VjEkp0dm7q4qC2nOYStLz3/eT2Q==
X-Gm-Gg: ASbGncsM3cWBItFsf7Gd4YLVINt6/H5ZYX6ncxoRQrvcHaQXWUhVHn/DhwYtbvEX97/
	k4n+l4kEpnJ38KJ6XLDiIdZ8fM7LlHJrKl3rmQMHdRvHH0h5tS1shyD3mr5KmqZeDEnpZHoBs6P
	dovaCKKmeBGUGc1BCOkcXoJnIEV4wJnUrqHkKICLC1g5pY7qWANOXRk5TL
X-Google-Smtp-Source: AGHT+IFXDWgpi7fgc4MQ2tsjz70/KKFNjkKho3c6vYNifn3mFK6XrakHKOLgdFy1aXwb0t30Ek/o/iYmKSzDnTaDwjk=
X-Received: by 2002:a2e:9a09:0:b0:30b:963e:9b1a with SMTP id
 38308e7fff4ca-30f02b974edmr5446951fa.23.1743668419465; Thu, 03 Apr 2025
 01:20:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402152000.1572764-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=MfzRVy85NR_eSQc3ZX_OmgCRUKuBdd6TqCu=Adwh9drrA@mail.gmail.com> <Z-5BHzTEed607Afz@smile.fi.intel.com>
In-Reply-To: <Z-5BHzTEed607Afz@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 3 Apr 2025 10:20:08 +0200
X-Gm-Features: AQ5f1Jr6MvHtO5d24SGEw18trMjEWdMN20_xEgQSTjeferZCCT3H-6FHaxyvrZ0
Message-ID: <CAMRc=Mc12B-b-w6bJeOgwFvzbmaqzL+uT7vJssVYN4tMu3YpaQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Make gpiod_put() error pointer aware
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 10:04=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Apr 03, 2025 at 08:58:09AM +0200, Bartosz Golaszewski wrote:
> > On Wed, Apr 2, 2025 at 5:20=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > When non-optional GPIO is requested and failed, the variable that hol=
ds
> > > the (invalid) descriptor can contain an error pointer. However, gpiod=
_put()
> > > ignores that fact and tries to cleanup never requested descriptor.
> > > Make sure gpiod_put() ignores that as well.
> > >
> > > While at it, do the same for the gpiod_put_array().
> > >
> > > Note, it arguable needs to be present in the stubs as those are usual=
ly
> > > called when CONFIG_GPIOLIB=3Dn and GPIOs are requested using gpiod_ge=
t_optional()
> > > or similar APIs.
>
> > I'm not a fan of this. Silently ignoring NULL makes sense in the
> > context of _optional() calls where we want to do nothing on GPIOs that
> > aren't there.
>
> > But this encourages people to get sloppy and just ignore
> > error pointers returned from gpiod_get()?
>
> From where did you come to this conclusion, please? We have many subsyste=
ms
> that ignore invalid resource on the release stage, starting from platform
> device driver core.
>

The fact that many people do something does not mean it's correct.
Many other subsystem scream loudly when that happens, so I would be ok
with adding a big WARN_ON(IS_ERR(desc)).

> > Also: all other calls error out on IS_ERR(desc) so why would we make it=
 an
> > exception?
>
> Because it's _release_ stage that participates in the cleaning up of
> the allocated resources in error paths. It's a common approach in
> the kernel. I would rather ask what makes GPIOLIB so special about it?
>

Just because it's the release stage, does not mean you shouldn't care
about the correctness of the consumer code. Passing an IS_ERR(descr)
to any of the GPIO APIs can happen if the user ignores an error
returned by gpiod_get(). That's not alright.

Bart

