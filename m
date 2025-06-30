Return-Path: <linux-gpio+bounces-22397-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7C3AED79C
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 10:41:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 746F7189841A
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 08:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4054A242D73;
	Mon, 30 Jun 2025 08:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="V9/WyvAD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D172E403
	for <linux-gpio@vger.kernel.org>; Mon, 30 Jun 2025 08:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751272900; cv=none; b=X4qnE/PKmMnjBs3t2R3gVo4KOgWd8GrueJC0hT94yq01D9bHSS1kAiu0czeQVfeAdtyGadukQ16wAje+3WTxQjN6BfXZTLUz1IGhOwqrIYjMYjbVIG7TjRvzsxhtJ9Ws9S0JC9SA6NZihYEdtcqhSEOSOcjUwlYI4Ji5Shs4NAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751272900; c=relaxed/simple;
	bh=0nsH/jPFimKcYRT+Dej7GBk0eLvCw6VGTXNdgPojo80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dxBym5NgZeLfm6FNytWXZaQHXfAMqIWYFUhM6I9F5TO8MqbiFx+MyA7YwtJkc1E9SsyaQAl2q0ex9xfL6fr+fvK3EmS/uK69utdJOtIEOzaf5w08Fppi1m25tB3FhVSB/sEZJSpOazkNtFuVFzGda3Ei1uK1JjHmw2scS+eFWfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=V9/WyvAD; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54b10594812so2087870e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jun 2025 01:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751272896; x=1751877696; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qRm2HAodZH8jnTL2iZ/znuEcvyS0+/KEjlCARzXweYs=;
        b=V9/WyvADYD9xu8d/4sh6bFB4I4oQOPpNu97lDgC+xv7V5R9Yzb6ilzCeybCT0CM5Un
         po/OtU1nLFflymRCoJTfNtJqdMWTsUvEzpFor7gGcre9/wzsdUbp2mLGHZFJB/DxvFDw
         tztMbjwMDO5Xw3izF/Ydez0rzGAReNewf1CVHReoWjbTYo9LKKZIJ/edsIGG69k4hnvj
         8/H+XzJ4K6OnMzVIr4C6XswJs8yAnB+p7UKEms9aTdQYEwyY2RJcCpfUn0l1rdeydxMK
         5kNABesZcprZe7pBygauvqLEBKIqkpfuJsFTLnonhrpmBEAaovCUZcB4KwEs7ziI0vM6
         DaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751272896; x=1751877696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qRm2HAodZH8jnTL2iZ/znuEcvyS0+/KEjlCARzXweYs=;
        b=CheaJG7yIgR0RokUz3p6jfhhv8LznCwTPViefgWPGFoJGs04SMx/9XFzaNIkKklAyO
         4CIPojHwG4Ru79tAr9VKji6ja8XwGY0Ng5jUtdg3j+fV2Re7Y3Nq2Owqv/HEhRkVhdq9
         1A6Ya4pIDW4dB3wzL/v+H4vb3DY7mpvdpIG5DUGtUee7cNC47NmgBFHsxw6NXjzsDDo8
         gzBZIxMemMpcFL1/WWIyrzf5mvsMTDYWZfufVWRVaH3/Z1qL4FOiHIMMHrWdQE93toB/
         234jdEPne/yAV0C+LJLy6pdBiv+eIoxHoQy69WEDsgy1frCa+Qf61vvSruoxjUR1uHv4
         TL5g==
X-Forwarded-Encrypted: i=1; AJvYcCUm/eEPYGEBzVhhgI3mrUJZOBo5xZOkDNVkVYEjoJtA0BfQybuc14T6Nx5ekG5k7QlPNIk0XgiHoimp@vger.kernel.org
X-Gm-Message-State: AOJu0YxfZjpzSYHlY4ZlOSaULm0QH46yQXdPhQXvJz6v7iEZ4ilAR83D
	PkxIfagkmQnXuIS8s/ZNIH2/T9Yfr/w9MB4tZbTbIIYwFau68P2aAWxhTrfs9IjVlhlLP4L6q8e
	i7lGWESEebZ+KJUs+t/+AuKn7qTNPo+LtuNY/ulg1DQ==
X-Gm-Gg: ASbGncsdjnII8rj6PD/2tXoUMFKhZT62K7gSi7DTr5MQkvyJ9LfVWIWUUPspKATMxjQ
	8W79urlTdRyAtds2cWkIOWirbPU9W+95L09i19aCPXksH4egzml6y8YzjuGzAlfO30NnYEb6GUm
	sgzoorlHNf5Npl1deWpfd7ro9SN1lOTwshV3c/oh8gGtcbOFkcElnJkMOeXTK1UXkXWcgwRvaSJ
	K0=
X-Google-Smtp-Source: AGHT+IEVkjp3/UTpRnXdrJVLRjIhG8hGS6F3a+RhUQK26Dswruo4c3C75jqgDprOKOEDLW283eg5n0iCi0K8/sdqhjA=
X-Received: by 2002:a05:6512:318f:b0:553:2355:1f26 with SMTP id
 2adb3069b0e04-5550ba29382mr4281546e87.50.1751272896591; Mon, 30 Jun 2025
 01:41:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623-gpio-sysfs-chip-export-v2-0-d592793f8964@linaro.org>
 <20250623-gpio-sysfs-chip-export-v2-2-d592793f8964@linaro.org> <aF66Q3Jtx1c6rmki@black.fi.intel.com>
In-Reply-To: <aF66Q3Jtx1c6rmki@black.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 30 Jun 2025 10:41:24 +0200
X-Gm-Features: Ac12FXxZJoDHBHEC0Mwhn2czBh3vtNJKqm_zeBHA__WbbzEBsToG9ReKBkITdRo
Message-ID: <CAMRc=Mc3EM8UXKaKgsNx21wR0NAKwqW3iJQV93kmBfk56hbrSw@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] gpio: sysfs: only get the dirent reference for the
 value attr once
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 5:35=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Jun 23, 2025 at 10:59:50AM +0200, Bartosz Golaszewski wrote:
> >
> > There's no reason to retrieve the reference to the sysfs dirent every
> > time we request an interrupt, we can as well only do it once when
> > exporting the GPIO.
>
> ...
>
> > -     struct kernfs_node *value_kn;
> > +     struct kernfs_node *value_class_node;
>
> This change is not mentioned in the commit message. Why?
>

Yeah, I'll mention it.

Bart

