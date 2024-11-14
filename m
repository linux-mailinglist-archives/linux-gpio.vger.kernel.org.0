Return-Path: <linux-gpio+bounces-13001-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DC69C889C
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 12:16:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 065F728118C
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 11:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8258E1F8F17;
	Thu, 14 Nov 2024 11:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wMFQ/bce"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504751DA61E
	for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2024 11:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731582961; cv=none; b=oGNQpm7qdKqdY16k8XkuOAtJ9fYPohD1cntapmrmAfLjDuCpuTYkqLnkcwtx2UfLHpL7ZHNBmiD9BSTyaVI+87i1z90TU5cbVskYiOAruFiQmONN3rzgyptXEnuA6v/p7qbE3S/V63supayafmrgJt9gG4GLI/m5tqKnad/kXtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731582961; c=relaxed/simple;
	bh=xqMGBkWAVRLAU6vznmDe0cD+NYfC6g8uZE14Hb+bp4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LzUxNFYWVACCMeqREgU4k8i1OTSktQS9tpmJC6FgAwOYgFV+jn0zAOwKTtDC/qfV05Si8+N5lfIdq8JrADK9g1GwuMKohH60xS9FQa3fVYdy3A25ki/SRDp0bm10lGx9lt502bw9cPju4zcMH7a48fGR4pvKPMrk47bZ4GEuCUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wMFQ/bce; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539fb49c64aso704976e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2024 03:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1731582957; x=1732187757; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KqYGxV4/tMVzMvBRs0QqY04a1yQuNRbsqSYXced2Jk0=;
        b=wMFQ/bceQyDG3bXM5VKOT6KOPJ9h6foR1YwishIl74W+nFyW6BG+6vzLzlvwNgCeXz
         OOtRw8f+F61GCnxZwWtDEKFLzzr+B4DVvhXrlEYZBvbiSBBiXdeNgYzMblioZXp03TCM
         NgM/eMCMN9RXNcUYYMbekaghYuGyS1hJUVpr/5S/T51biPIpguz0XnmJwEqznJtS0nRH
         L1IoYQpNyMeFyQnpz13FAzruX8xgpUpnItBPWtnASKdd+FxLuRgEuAFnMJom791o2svU
         4xh5aa3feg9oIxfUBfyLcGoeiwhBcrrgQC+kPtykTR6EVPrUDzdQB6vIdEEm62ypUNOm
         SR4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731582957; x=1732187757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KqYGxV4/tMVzMvBRs0QqY04a1yQuNRbsqSYXced2Jk0=;
        b=sihBnOs/Nsr8ZgL1y0A3TowE7LpS8EDaIK9eArwQkQbxfpeBPiz2WCF9YGN7qIVJoG
         bpMrsBOwf1gz/e2xYrzR9lrTyiN82M18MGnYdZjWuEzP9R4yU3HDgvMarb0iOtgwtrTX
         gOM+RQrl6ZKGwL0RPoiXvYyO/Sovxv+7isdIE/sI085PS0omVFXci07d1JB92EjGLNKZ
         aCznYTQBefrESplgrU+K5G0mUi6Pov9CusQe5dwIdyhbqFrolOrmRO486I+OvZeeDPhz
         QslRdurkK6hJNIcRAOhHUo01P+6C9PLzYqxzx7pTtzHoMLdm27kQiGMsY3I9V9m6Grrm
         xWZA==
X-Forwarded-Encrypted: i=1; AJvYcCUR81ujO5y2REjzrMpMDXgEMpM7jzxfLfPm1f/XG+wtGeB96gDeYTGDFh90NE2/W0NAtJp0FBcz6ApL@vger.kernel.org
X-Gm-Message-State: AOJu0YykRXtGd1q0P0W4bDYdHXBw+kiOXXILSLv2mvb5WwDQlsVS0wq8
	fHHogjFOwqTUkDGdM2t8w5sJJElgApcwwNDsw67n6fK0qmKIf+8QNh8kpHHG2ofwibr0ygf4I0g
	p3kNSHCiaREXgCy5cr0ocejqzrdBWddQn46ZBiA==
X-Google-Smtp-Source: AGHT+IEXRitsLak2rnNKjeR0boQJ8Gt3ETQE+CMoQr5P58FAb6T2My0bQLCF0629d5Q7JW90/KZ7qZ4e3xm0k/fBfY8=
X-Received: by 2002:a05:6512:2812:b0:53d:a927:822d with SMTP id
 2adb3069b0e04-53da92782e3mr392250e87.0.1731582957320; Thu, 14 Nov 2024
 03:15:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113171219.2949157-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=MeaDjhxAwmTcNZ+oHniFn4EWVEmfP8MdNWitmD+Rr=scA@mail.gmail.com> <ZzXTbEcrLigXWpAu@smile.fi.intel.com>
In-Reply-To: <ZzXTbEcrLigXWpAu@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 14 Nov 2024 12:15:46 +0100
Message-ID: <CAMRc=MeEtyTXr6A4gXbbN=ZY1tzAQnbVMF0NYA2_6Xm3=jfS6Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: Move and sort Kconfig entries as suggested
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2024 at 11:39=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Nov 14, 2024 at 09:54:50AM +0100, Bartosz Golaszewski wrote:
> > On Wed, Nov 13, 2024 at 6:12=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > The Kconfig under drivers/gpio has a specific comment
> > >
> > >   put drivers in the right section, in alphabetical order
> > >
> > > but in time some of the entries fell unordered there.
> > > Put an order again.
> > >
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > ---
> > Could you elaborate on why you're moving drivers between categories?
> > For instance: you moved Intel LJCA to USB drivers and I'm sure you
> > have a reason for it (it's not clear if this actually is a USB driver,
>
> This one is actually clear as you see that it depends on USB_LJCS which
> suggests that it's USB based.
>
> > it's not registered as such
>
> Neither one of the existing ones in that category, right?
>

Well if you really want to open that can of worms...

Only gpio-mpsse is really a stand-alone USB GPIO expander. Others in
this section are actually MFD devices and would probably better fit in
there.

I don't have a strong opinion but we should at least be consistent.

Bart

> > ) but please expand on it in the commit message.
>
> Okay, I will do in v2.
>
> Thank you for the review!
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

