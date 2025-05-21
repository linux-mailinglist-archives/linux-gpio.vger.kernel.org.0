Return-Path: <linux-gpio+bounces-20396-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8E6ABED8F
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 10:07:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80535188F657
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 08:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AC932367CE;
	Wed, 21 May 2025 08:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Uth0+NE9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3957D2367A5
	for <linux-gpio@vger.kernel.org>; Wed, 21 May 2025 08:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747814804; cv=none; b=VbbkkWAbW0IJgWAk2112x+L7FCKeUFC55DwWO7Ia+bfg8fqsvGxdRdMGxpJexRztO/Ad7wRUnviZVZ9lfHmoSnB7EkJGAK9xkgBvrDc5lD2YO7eYElQ56hzzjaPZeuNQ/+UUn+nqPD4wlHsPi39vY6sYtDSdOhczG6bvMTYPMIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747814804; c=relaxed/simple;
	bh=vmWq8La8V18v88CVLflvXrgvwKzC+y7QtPzqgryZIak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=covXAe+zDdKXhsXeawpukwG63t/QiNQDezdT3hUEjplNAODOwerbkGtnIvYuDfOkOIYU9pVFm+zQZZnklzq6H3idc7l1CfG4YNJEwHy/ZgXRRvOaJUS7HH/V5r8UiY1IBm+YM1o+WVFMHoAWiE1kaBJdC1tEjMEu3bGPwz71/1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Uth0+NE9; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54b10594812so7618195e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 21 May 2025 01:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747814800; x=1748419600; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmWq8La8V18v88CVLflvXrgvwKzC+y7QtPzqgryZIak=;
        b=Uth0+NE9eBUqwamGju1GgRHr0bzsFpO98qPb/jkTeobFV1HNRfY2jUlLTWZrzRfWRg
         9THlUqB928FoOz2EQlucJUUCrvJPjWW0nTOg+ASPX8pO2i5l/Gl6+SCyT5uzz2rdnekR
         tP/qPW6hmGwNEE4QXqOg9C0skmMAH6gqykibEhvfp54uCYzjYDv0O9b3t8w3mlfvVGJp
         KRlGpoDq2HKxuhS5DE2tlWKEEFXVoeTv+FyQESGOT+inJMk88IXpEzWr5J+HSumSkWLs
         Ky6dSTAz2z2WEe82a0/JRgUt9jyb3aOHt0CiasS8rRMiHooyXhSl6zXI0b0vCN274Aga
         iPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747814800; x=1748419600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vmWq8La8V18v88CVLflvXrgvwKzC+y7QtPzqgryZIak=;
        b=Ru+RWMiWrbhM6of2VsJo1U3k71gGEAwV5r+pax/g9FZFgqEj1uzGW/2a0GlBxv6sHx
         rfydenHDO/f5YxvDZvLSsT4A1Dqz9rsQqwhjEO48JjogdvQJ2FonnOMSbbkCVfJ5/Jde
         BdaiG8HczsFXAGvmPL7KIGlvZo0j/Z+crqGM+9ZbiNvoNdMq84RkdHdi1DbLKDk4egO2
         cO2UYOzisHbL+fOTIQXyCA0EhQKfHAyHOfBHqVoDQdjANoRlbMErZ68jzT90+WqXkulZ
         wmG89J06vMAc+2+jDsUSM+R/UsfolxhqLX2kWCAcvsuoMaZyDPZPxFKJiX46/oKJ1RiA
         tTvA==
X-Forwarded-Encrypted: i=1; AJvYcCVmj2FcYLSZHFxE3b+SejMwIbMbatbdWAsL1nIJUoZv2IIkXLTsFUJ27yubJ31E7noJT8lcrOGyNszq@vger.kernel.org
X-Gm-Message-State: AOJu0YwpJ1AEORnNVn6+v4YozwkgzVYZL8WNC0rraFn8gqgcyN6fNOCp
	ySbbw29apDHH3MlOo0rmInsm9OVJigTI1sZP89g/b9izLCse7OJcU05EwEicbQKGmhGLsklODkt
	J7c7XXhMwFRFLUA/vS7EtpWE6Z7XYDwcjW5DZZT4HHg==
X-Gm-Gg: ASbGncsbMmSRU9lM9TTDRHiiSC4VhAYWOX9c84hcSo+lXH+p4KubYPJuSHFhDkBhnkH
	Rba1IMRP3xA1bl9g84U0byVsSRXTcP2befmUmBELqOpJro886AKWlpqtiQZK/D0bed9eg1T/D0y
	WRpvjRtcG7to8sGdJKi07y3TJZnxkiu5H79XvmX2a//9lYBmBYt+hn5vG6UJd6Zn5a
X-Google-Smtp-Source: AGHT+IFzqL2hMQJgymb+obXIB3oV7RaqIxS2CRTsbDvufBjx7VmWWtuVSiEp0oMSdCOjhxMQP3sb8T2eHn6CyskSx20=
X-Received: by 2002:a05:6512:159f:b0:54a:cc11:9cc6 with SMTP id
 2adb3069b0e04-550e71baf85mr6118076e87.19.1747814799693; Wed, 21 May 2025
 01:06:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521072416.57505-1-brgl@bgdev.pl> <PAXPR04MB8459CE5696113684FF076D12889EA@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <PAXPR04MB8459EE334B883AAAE22ACDFB889EA@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB8459EE334B883AAAE22ACDFB889EA@PAXPR04MB8459.eurprd04.prod.outlook.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 21 May 2025 10:06:28 +0200
X-Gm-Features: AX0GCFtBYjsig3EQjgstBBWqVBnIgRC3Zxx92K7iKXq3_O7ir0Ae2MdLcCivxy0
Message-ID: <CAMRc=MeqWd0uEM7=mjA0VnPM3VgZU820osTd+r2jGFF1Y8ZVYw@mail.gmail.com>
Subject: Re: [PATCH] gpio: davinci: select GPIOLIB_IRQCHIP
To: Peng Fan <peng.fan@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 9:50=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:
>
> Hi Bartosz,
>
> > Subject: RE: [PATCH] gpio: davinci: select GPIOLIB_IRQCHIP
> >
> > > Subject: [PATCH] gpio: davinci: select GPIOLIB_IRQCHIP
> > >
> >
> > > ---
> > > Another one signalled by the build bot. Peng: if you could go through
> > > the other patches you sent and verify their dependencies are
> > > satisfied, that would be awesome.
> >
> > I tried all configs under arch/arm/configs/, no error with this patch
> > applied.
> > I will give a check on other archs.
>
> For other Kconfig entries, would you help add a patch to
> select GPIOLIB_IRQCHIP for them all to avoid potential issue?
>
> GPIO_TIMBERDALE: no configs select this entry
> GPIO_BCM_KONA: multi_v7_defconfig has GPIOLIB_IRQCHIP in .config
> GPIO_LPC18XX: lpc18xx_defconfig has GPIOLIB_IRQCHIP in .config
> GPIO_XGENE: arm64 defconfig has GPIOLIB_IRQCHIP in .config
> GPIO_GRGPIO: no configs select this entry
>

I think all of them need to select GPIOLIB_IRQCHIP. Defconfig is not
enough as a randconfig can still break in this case.

Bart

