Return-Path: <linux-gpio+bounces-18472-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C000FA7F8CF
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 11:01:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 697B218985AC
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 09:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A30F1264627;
	Tue,  8 Apr 2025 08:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RVPmepSi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B362B2620E8
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 08:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102785; cv=none; b=rUXwcurucgD/xCyt5WMEWc8Cv87rr3gxWtmueuwjmAsIUbnIc6VECABgjB7qrqJNAzQPDKVL85SWO2AzmP0cmNJnW5yQEgzR4VHWw7Z7PaVuDZsJhbh1w3eK0jl5j4U6MtUzyPi+WlRguovee1an6PPhQ26BtZMTlZh6vEujdMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102785; c=relaxed/simple;
	bh=lNiYZkdnErtTzxt0Uq6hCnSDgBoG7jrmCa6HXR2axIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WOEqUJSFTVZI8JjYL/HRtSeoTrllMN/Wvv7LcKgeRT8YQ9PUomiIXdo56j16GsKlFOat/3RcmGJ4rwNa94vAkqThRuufFAkYH189d7kZUwYZdPA0xluK1VP8kaprq4VKlQc7ZPq7roSvR0Zrhi8J5407hwT7ColnDZ+rO1nQCzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RVPmepSi; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54acc04516cso6102461e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 01:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744102782; x=1744707582; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n1ti+glIs7kbdo7Cmb4p1nzhkGIqNEX/Na3aCrAR2g8=;
        b=RVPmepSiUFhgs+jpHCVKcKCszAKep92VNp9w3dNfyoKlYwT7vpFa6cevGCjzIQZ6Lx
         7AUsxuIYBkDOQSoEc/1V2sk9Hajq+7sAgLhy/eTaVjH361D5rO8UzkwaGznblTbpstmz
         QgAwkc2vlLIFi6IIeeCeA9NpoM1yM5Yze+aw48tMypRWdjnkaiCMfy0PEW5FSbjZ3c8z
         sl896MBdwdAYR1fh9XCYVKmkzTXmGVJIXXZnOV6FB+3X3Vmtg8sfozfSY9c2p9pUyWhV
         xDCevtApSyWiBcBetqbpsr4cJZ9EEp7pzy2l1XnWdIND3VgxAsYryv8ZRoHlue7X/b2O
         V6oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744102782; x=1744707582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n1ti+glIs7kbdo7Cmb4p1nzhkGIqNEX/Na3aCrAR2g8=;
        b=WDVbaA1CAnett+5VyACyd2k3yXPVb2aS+dERyIjQUXWu8HfiWYtBX5kF0mq45z1Wt4
         6NORolJVPpGs8IhIxfNBHse8EL8U7YnrH6G/GuAlcRtxtpst2wlJu6xkeaEzdkvSrrIg
         QgZxpeWDM1OmXZ7XO5fgM1Dh1f7TxuT6RyUwq5fxwGi1o9zmULayCuSpwrBdBMWMhmBR
         +PovfAq9dmJlNH8Ap5Vas9q5zPz9L2cCKq1GTZKoquyU5TszLRecpUXrrmuFAwo0AOPP
         lHs4f6mG+qZIcoeYRabcAg2k5bF1D7s7OektEwab/gGDlb3Lc4npsj1PndqrU/b0INQ9
         Bs3g==
X-Forwarded-Encrypted: i=1; AJvYcCXL2Hh0aMJO2uZzhmwojv9AHSfssAx5J8745IEim2EV+h2nXwE0T5iadkjjMSZWmZsrHhxDODMCbedK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2l6S2MrdVX52q7wBgy6uA8sMMqD2xRrpoaSeFHfLjKhKm/J/f
	7XIudWR1LvW8RjbexQ+Ut5EoxeQa21p9cFgQSCskP/XUa9xK4F10vVsWHatXFu9BDTCJXVE8+PF
	/9QHcPJ0I4T4iDOn9sVLoecPAVN/R6P8bmFbK8A==
X-Gm-Gg: ASbGnctw+DyhhvhSkKWEGK0yfmK1DiYcl2+wAaLiGq7X31zt9uZqmYKKf2pPiwaC4NP
	bUue9/F3zadW2NZJq3WESbrloUYvnLl1hQHDedkNFZQlAX+CMTmuqSYOEO32zczj/6w/pezX8kY
	r0TISEBN+Q+sx9ZnXG/iSFMxTeSfjrYENEZJ6sojBarTZwGBWmXPMkQvr8hg==
X-Google-Smtp-Source: AGHT+IFhU+IhVBAJzBIMUxOBAo7QfFVW11UL24yOIyLgi1oINyxWjy4Dxkzmcdvr4r4k1H5XdlGKfbxf2ZKflqozVaw=
X-Received: by 2002:a05:6512:1328:b0:545:2eca:863 with SMTP id
 2adb3069b0e04-54c29836e84mr3493147e87.42.1744102781735; Tue, 08 Apr 2025
 01:59:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org>
 <20250326-04-gpio-irq-threecell-v3-2-aab006ab0e00@gentoo.org>
 <20250407103320-GYA13974@gentoo> <CAMRc=MeFK1gX69CWH2gkYUqkLU-KCOcwHcA+gjN1RXFA++B_eQ@mail.gmail.com>
 <87r023ujiv.ffs@tglx>
In-Reply-To: <87r023ujiv.ffs@tglx>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Apr 2025 10:59:30 +0200
X-Gm-Features: ATxdqUFtpGaiXd9grNQP3Ib6EubxTwZJQ656Dn7NldoLYjiAufIbT8WtF0ED4JY
Message-ID: <CAMRc=MdP09b-cm2uZeqbbCP20kNjQJ8CbXTXSTxQEihdoXjGJw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] gpiolib: support parsing gpio three-cell
 interrupts scheme
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 10:47=E2=80=AFAM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> On Mon, Apr 07 2025 at 13:26, Bartosz Golaszewski wrote:
> > On Mon, Apr 7, 2025 at 12:33=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wro=
te:
> >> On 06:06 Wed 26 Mar     , Yixun Lan wrote:
> >>   I'd assume this patch [2/2] will go via pinctrl's tree?
> >> as patch [1/2] has been accepted by Thomas into tip tree [1]..
> >>   Additonally need to pull that commit first? since it's a dependency
> >>
> >
> > No, this should go through the GPIO tree but for that I'd need an
> > immutable tag with patch 1/2.
>
> Here you go:
>
>    git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irqdomain-04=
-08-25
>
> Thanks,
>
>         tglx

Thanks, pulled.

Bartosz

