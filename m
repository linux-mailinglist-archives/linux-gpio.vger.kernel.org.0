Return-Path: <linux-gpio+bounces-10721-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBED98DC60
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 16:40:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B585F1F26A2D
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 14:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 655D51D131C;
	Wed,  2 Oct 2024 14:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yMjq24ik"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00161D12F0
	for <linux-gpio@vger.kernel.org>; Wed,  2 Oct 2024 14:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727879663; cv=none; b=uADxH1RE4amgeE9qBnsSuHbFApm93xf2565Pqxc2sDi/g1RCpe108JmOhHwBBvTnPsNtgvdZCH7Io20YjqGhXXmIba5SXKk4uqiBfJriO2Zs18g+5bEBZk0s/aypEKkh9WAQGVcUz+eOHL0FbxGtZcDpckyfYYsAEE598VPi1Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727879663; c=relaxed/simple;
	bh=vHZVobx3j/qRB7EtaTbcyJx3Hp5kpf2YHNcc7KgQ67M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PrifsyWDrbpaYEYAkxelG5LXMealEsAeZP2DOXEqLBXqFdgnx7du6WGllyNd8qEEIR0ZQLGh2pTm8VOKFmjn9BXT9TqjnwFl1TnD0zdx80/bN5xC1zb12ZA+ddGD/zac2JdqixCwd6Py89i3I0JisSohQXVT38uIp7C5URZp+5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yMjq24ik; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fac6b3c220so46049711fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2024 07:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727879659; x=1728484459; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gi9Uf6PkDf6FXTmGyJorVKcothQ+6mt+MBCkLwB9XNo=;
        b=yMjq24ikRfQ+r5S26dQjIgc7ghwhLsGiPcTOLdXa3VuTkN2ZvaQFtuHLPQJsCJPFDm
         q0q8RaS62vReCNxwUD/eAZMmF8Mj/t98B/LL4OAEPJ2Sef44M1fM3OlxzFCMMzAxo5cF
         dRnMEDC6YR3vYp0z9DegfXWfQtBMj1Biq25UScTLocSxPSQxgGRpxWiCWIzk/vzKxBqJ
         Qnr56Milu/ElACKosjgADpFq/l/SWMkf9sgRuv7EOiYdCxWtfnsUR+8ZwuoRRC+cDUCy
         P7QWDWLV7yh8ZGxQHkhhXLfk1rInljPfCjxBm9smDQf+deoIKsy3FWHGOpYCO9hgu4vF
         M1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727879659; x=1728484459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gi9Uf6PkDf6FXTmGyJorVKcothQ+6mt+MBCkLwB9XNo=;
        b=xPfGW0L1CLI5hnuKdxW+Xvk1+SeRb+kCvqauPPFiy2+h+/0s08IHaeHBmllHcuy7Ir
         ToufwbW3ITGCGaCahzA/rZ1mZAv4JldOn1vM06GxaU51wwDZRW7mhncvBl9p8JFBftvX
         hZiqfWnOsRZQ3cZmREGrmSmOb6CgSD+kVvlsCcfC3KulnQGg42aEAoP/1e5PnnnpUqdt
         ku0neT7ETcvgJPHLUoj8HkyYscWcqWFkL+9w4i+hUHIqteDEOw+AEtWGtKmI40mVZWYu
         jBzxoF+soyw1LTpxdJVMKkGBHHHdRPL+eeX/H0a/DeviCn+cZODrJraxNmLxdSPvvrS0
         qRrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNbxW8CAhi3bQlZuvmKHrNCEc8PgLRPjpO4MKV8oEgyufCjMg4UsTsfmCBdXaHBBe1jznNj5NXCYBo@vger.kernel.org
X-Gm-Message-State: AOJu0YynFrsJaj5xvp2JBHq3E2wOXAPB7gjVhXpnFNxjxD3BNUUoBweL
	CJ+GmILfe94L53zPbGhoYoF2hHtRPey6werFOFZYRpyHHLcCcGH4TB5/QX6EGM4qdsiqX7EdX20
	doBYzeXuDtNBifXB/ykjiuGUk4K9pzKmPYeLG5Q==
X-Google-Smtp-Source: AGHT+IHsC7BAAbiM3s2smXYTaa1BjjarJDOqZ4F3Y5DsYZFl7il2HLVl8IocRjjs/FundTNj1bM5brpEJ5eD4jLTkpE=
X-Received: by 2002:a2e:4a19:0:b0:2f7:6653:8053 with SMTP id
 38308e7fff4ca-2fae103acc1mr23262851fa.18.1727879658809; Wed, 02 Oct 2024
 07:34:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240930144804.75068-1-brgl@bgdev.pl> <c56f17e9-8da2-4894-9000-b74b7cb66e86@amd.com>
 <CAMRc=MedULpeE5Dwb4W-ten1sOWr_+6Xgb05VDW+w0_9ZxbMqg@mail.gmail.com>
 <36b70588-9ef5-4686-89f3-32603022f242@amd.com> <CAMRc=Md=3cDWG4snPKqD3UHe3t+hAJo2T1hRTx2YURg3_L1NAA@mail.gmail.com>
In-Reply-To: <CAMRc=Md=3cDWG4snPKqD3UHe3t+hAJo2T1hRTx2YURg3_L1NAA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 2 Oct 2024 16:34:07 +0200
Message-ID: <CAMRc=McXytnJJV_LDKXmJE6q9oNmGDaOeKa6BjGsPrz8xGTeqw@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpio: xilinx: drop dependency on GPIO_OF
To: Michal Simek <michal.simek@amd.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 1, 2024 at 2:31=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> On Tue, Oct 1, 2024 at 1:13=E2=80=AFPM Michal Simek <michal.simek@amd.com=
> wrote:
> >
> >
> >
> > On 10/1/24 12:44, Bartosz Golaszewski wrote:
> > > On Tue, Oct 1, 2024 at 12:30=E2=80=AFPM Michal Simek <michal.simek@am=
d.com> wrote:
> > >>
> > >> On 9/30/24 16:48, Bartosz Golaszewski wrote:
> > >>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >>>
> > >>> This driver doesn't really depend on gpiolib-of being built and can=
 be
> > >>> compiled without it.
> > >>>
> > >>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >>> ---
> > >>>    drivers/gpio/Kconfig | 1 -
> > >>>    1 file changed, 1 deletion(-)
> > >>>
> > >>> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > >>> index d93cd4f722b4..0d676c96b72d 100644
> > >>> --- a/drivers/gpio/Kconfig
> > >>> +++ b/drivers/gpio/Kconfig
> > >>> @@ -796,7 +796,6 @@ config GPIO_XGENE_SB
> > >>>    config GPIO_XILINX
> > >>>        tristate "Xilinx GPIO support"
> > >>>        select GPIOLIB_IRQCHIP
> > >>> -     depends on OF_GPIO
> > >>>        help
> > >>>          Say yes here to support the Xilinx FPGA GPIO device.
> > >>>
> > >>
> > >> The patch itself is fine but it should be likely applied as last one=
 not the
> > >> first one.
> > >> If this is applied like that feel free to add
> > >>
> > >> Acked-by: Michal Simek <michal.simek@amd.com>
> > >>
> > >
> > > I think you may be confusing CONFIG_OF with CONFIG_OF_GPIO. This
> > > driver doesn't depend at build-time on the latter and this patch can
> > > be applied right away.
> >
> > ok then.
> >
> > Thanks,
> > Michal
> >
>
> Now that I think about it - we should probably use of_match_ptr() once
> we drop this dependency though.
>
> Bart

Scratch that - that would actually require us to conditionally define
the ids struct.

Bart

