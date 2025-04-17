Return-Path: <linux-gpio+bounces-19046-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CD8A92B54
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 21:00:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE27A188FF35
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 18:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE0A2580F6;
	Thu, 17 Apr 2025 18:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3G1WCeSD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B57256C9F
	for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 18:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744916259; cv=none; b=IgzWXUdYE5Q+8lC68/604aBRmEI3Qv7jmyGUj+uut2sDIbeJkWdu64b/x7RGkCVr1v6SlBGbj0NPez7pmoFlCk0wX6OyH9Nn5HUxR6U32+Z+FWT+jSzjgh2n7YA6ugGdRH+PSoi/5zQOtdufR0jamE96Zr5toufXjlRZ3nOWzjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744916259; c=relaxed/simple;
	bh=t7kXMWDKZwfq3mZ55GHgTwyiy8JS88zhCJ5ZzCZBfX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kd9cmZTj7eIUFPG3WeeiaKBbZKgRhZlvthER0+pdZnMC/Tgaz65+CQNUf3ecRF/Uj873iSgVyNURodcmQ1LJW+Isl46gZSmnI8S9zrekZOSBnuGaZLID5m/xvzJgVR3WsVIARzuJlPugMqn9fPk/d2yx52omiS9NXYa15uKZkRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3G1WCeSD; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54af20849adso1167918e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 11:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744916256; x=1745521056; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t7kXMWDKZwfq3mZ55GHgTwyiy8JS88zhCJ5ZzCZBfX0=;
        b=3G1WCeSDT9jUNnIrECM3f4L4pQUSaeKNGDlUJKFhCvOIt06g6Izf5iwq7P186/y/Vk
         6MXf7yVd2hJbGW/ccJi/uGrkozMBaI08G9NVkcfeqx3jI2BiyDyNKJcNta2cRbZR4YzM
         RsqqorMH13dhFLMRjLwlQblQShm+PX2z4IccnqOqOM1+tu6l39XtQToCorhCe36HxdQD
         mP3+rjWJhUtmLfEOPSoGSsxM9IT24V0W78YQppAoteEY51pD4UDJ65jo8UWfXNnJj9m2
         ovmWAYa06npQAWMIfXOEil4x41kJGiIdxKv9yZCQMWNwMRlmUryR1ZTRilqVN54zA9Xu
         Z1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744916256; x=1745521056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t7kXMWDKZwfq3mZ55GHgTwyiy8JS88zhCJ5ZzCZBfX0=;
        b=IQKPRn80s6OG0rNPVmkCcnQMFgE3oFvVrYZycuAj7CgotqOYl+B0KPxJurUKX1Jur5
         51JgQgTWqssQHWQI4QXqdWDJ5y+jw4pkyrGNr50dFJ64sv42o00jY4pNs0/pdUqVDYqa
         s4if/TZqkK6rMSZfgBayLlDT+j0r1MGYuY+AwK0Y7u4dOpdtKBVD07sXiaWwB0xAZqWs
         TF3VncCFbykQ49m0e51Vfra6lYlMk2NHrU/izztJw0V0taNQrcbVCYrYdz5ueuqpWtpL
         UYhkgpB54tuEanZpNvuI3Ov8EDKS3HUg5cD7VVJEdgrb/0TetzrGkMh5Vj9QRYSQgud0
         2P2w==
X-Forwarded-Encrypted: i=1; AJvYcCXOIEpEfFHKYaYN6BXEhg/stM8I2X2CcWGtdB8jcs1L8rMoX8GNsPr99CqqClPyzE2swUb4tKXY8FOV@vger.kernel.org
X-Gm-Message-State: AOJu0Yxia5G42X3/MSPv0FWC8cTe8iC4pe7U75mThkoHUsIUdtkgw1ll
	3tyI97Q+MR+4c9Vy2FXs9TuIIXnemjGx9Bp8UKAJCk3c7z6eT5B2L6eN5nFCvxO/e8EBxKfbnKO
	gFgDF0uCrBH6mVDGnKhwqPuSxsjvBIAAFtE1ZuQ==
X-Gm-Gg: ASbGncvvBepEvK86Q4+pWTrrb1e06Wo5VBUtD8LgruamxzQaLmQn4yFm/ZG34NlK8YU
	MKDmM3F2ROLpJsg2rK1v3Hd79gGDjcLxGyyg1FvEgz+Ut0ZFYCHS0+PR7ojYxhix9S8qgPN397q
	a8CG8OWaFm3V0mPjgvlYs6pUYNEIrYg4TONfc5Y0iNtwNVS+JxKEv902Q=
X-Google-Smtp-Source: AGHT+IETGSl1uxRRGha8frlIqsblK4r0WHTu9TdM47HpMpf5Ho/Nb4xRr21zs0tQQbaFZkPqBaK3ooec8pUWDP2zoKk=
X-Received: by 2002:a05:6512:1151:b0:54b:f99:776c with SMTP id
 2adb3069b0e04-54d6dc055ebmr334374e87.24.1744916255653; Thu, 17 Apr 2025
 11:57:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401-gpio-todo-remove-nonexclusive-v2-0-7c1380797b0d@linaro.org>
 <c8ca3c8a-3201-4dde-9050-69bc2c9152c4@sirena.org.uk> <CAMRc=Mcq9yag6yBswhW0OJ8MKzGBpscwo+UGpfCo2aha93LzXA@mail.gmail.com>
 <846010c0-7dc1-421c-8136-9ae2894c9acd@sirena.org.uk> <CAMRc=Mff0TkeiHbM3TAJLJ2HYU_nnPFUpUjbWsdCnW6O4E=+gQ@mail.gmail.com>
 <c3bb82f9-5a2f-4a14-9726-f3e10bf5d427@sirena.org.uk> <CAMRc=Mc_nXwvj_9w6w8cB3K58AVLHBLCV+MOO1z_6y+uuT86Og@mail.gmail.com>
 <CACRpkdaBNVyXUwErHTtGBnUjh4+6Ojb6fu9M4E7LnRCu_Oovpg@mail.gmail.com>
In-Reply-To: <CACRpkdaBNVyXUwErHTtGBnUjh4+6Ojb6fu9M4E7LnRCu_Oovpg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 17 Apr 2025 20:57:24 +0200
X-Gm-Features: ATxdqUGcQlRT-2l2du6IEq8CPJq-yhYNzC5ncqkeIscW_F55DHxr0702vBChsyI
Message-ID: <CAMRc=McFBAG9Gi3UBfsdoQ=78fL3sTK+ZMToXWGF=KOw6zwPiQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] gpio: deprecate and track the removal of GPIO
 workarounds for regulators
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 11:33=E2=80=AFPM Linus Walleij <linus.walleij@linar=
o.org> wrote:
>
> Hi Bartosz,
>
> this caused me to think about a thing:
>
> On Wed, Apr 2, 2025 at 12:05=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>
> > This is bothering me. This is the abstraction reversal I'm talking
> > about. Should the regulator drivers even be concerned about whether
> > they share resources or not?
> (...)
> > The part where "the higher level users want to understand that there
> > is GPIO sharing going on" does not sound correct.
>
> There are precedents for this type of semantic IRQF_SHARED
> is used whenever two devices share the same IRQ line,
> and that is something the drivers have to specify, i.e. the
> driver has to be aware that it may be sharing the IRQ
> with other devices, and whenever it gets an IRQ it has
> to check "was it for me?" and in case it was, return
> IRQ_HANDLED else IRQ_NONE.
>

First: this flag has existed (as SA_SHIRQ) since before git days and
could be considered legacy. But also: it's a bit of a different story
as sometimes you get an interrupt and need to read a specific register
to check from the status bits whether it concerns you. This never
happens with a GPIO so I don't think it's a good argument for this
specific case.

Bartosz

