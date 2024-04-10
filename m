Return-Path: <linux-gpio+bounces-5284-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D87089EFBA
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 12:19:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDAAA284D5A
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 10:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69AD615820B;
	Wed, 10 Apr 2024 10:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DLaWDYK8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EAA15885C
	for <linux-gpio@vger.kernel.org>; Wed, 10 Apr 2024 10:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712744386; cv=none; b=Hr94fxLbuCTrHAJdAwWGoGFTofCoY4rA3U88OIFcubzl4v7bRm9wf4oNbrSFQqlXnbf5xrQSOp1yKJBhiFqRcqbQwgGXzHuoJCb4uAQKFp8f+MR2jGZjuxXYaWYLbOaMMeuw8hjMKfMut3RIjL6KA7RO7gwupYgnbxdkg++SUOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712744386; c=relaxed/simple;
	bh=RjSzYGV3aWgLQ7jeC9fMYpTf4oRre8ZlQUnGFBK+VLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cNnGKAPHc2O1j4fVOfo58kzYvO1xTqckys/OweCfq5I1O4223mkPVn3IyhkCUgkomU/8HfE3zVo56qtCGNDaf07Wzv2fQWB/Ufq0qoFkvyqNUuCJwp6vnVx8TMaXDkq4GiNvRpIorRwNnYSSgSHn9gXFVovUg/NIChFtuHDWz7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DLaWDYK8; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2a2d0ca3c92so4322706a91.0
        for <linux-gpio@vger.kernel.org>; Wed, 10 Apr 2024 03:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712744384; x=1713349184; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sdkwWbMXuRqHHW9QshxEfxsGRSbceG4Z3tNNCe7jYoo=;
        b=DLaWDYK83NULqX9CZSrQVWhU6I1R24E7dATN7kDIh1mR4OBhERO+SYMA8GDTZSo5ge
         M1yBFWHWNOW4YKf+9s6ld4LbwE6TzcLhjwWV/3eWmjbN5E1x4YihnwPEaEYb3SM2YB/e
         C+bp7yJivUD9ZALIEJ9Q22G7pCSqCelKP8/y29c+qkkeN1ajR7aNEnC5Orl87BYGsnny
         5mF9Qz5ulsmo5DahPXPIBECe1msp/vYOX+rjFDDT9LD/iozObLrWHTzC3VpnLrUXWjZi
         kDk/VnqiWOtXNvDGaKNiBX17mnN5gzXGJuk9dUGx+sui78MBm758fEoV5HFf2Q8JOUXk
         ffLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712744384; x=1713349184;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sdkwWbMXuRqHHW9QshxEfxsGRSbceG4Z3tNNCe7jYoo=;
        b=AOwOUeZAVVeHx9HLlD7P83Pwb7d16gTemcdEpHEzgjPTbD/5hT6parD6K/seSudU1F
         dECvMplhznfhhNImLBD6fJzxzahUjn9KKTzKTMaM14p4wVC1FYSWiJ3QUOqAWZiX42TU
         gbM+Q84dryTctz3nuTm6Z+7rVgmmG3bYUKaswHIQEb776c4+Hp3UZcatilLJAAkaTEsi
         +yErlg4XurjAw4UmKajH9XWX0Wksy62qVBBu9KTChRkC0+suweiI+bbebeTrg7L++XNT
         zH/KhBJZYE3Y3o8y/u5XQFsTMb/aOCb6E48IPS4hiVIujO+VDDs8ncalDMZnOgEg42Wy
         2wow==
X-Forwarded-Encrypted: i=1; AJvYcCXYMV30arHShJ01xOmrnk0UalqkCZTMqH+armajivLr5oI+7j3h32mDzSTRRkgDsikqMr3bkR10aq1Zt1Jh6rCJSMB76cmFC07ekA==
X-Gm-Message-State: AOJu0YxeNxjtOmfbW5fcUFnuTYwONRirtfjj/LMNrCGuNZ0oeZJKR2nD
	te9M/Tf9JDLJjl57N2dAVmh4nd7X4ycjDd5e1WcGZhA2Px95qTi0
X-Google-Smtp-Source: AGHT+IFBKGXRN0ZVhfB/pgDic4N9aiYgO0+f9Dw6NQ6pB2BYs6kk6jESQVz2dQUIsx5aTK4mdOCjew==
X-Received: by 2002:a17:90b:4a87:b0:2a2:d05c:95f6 with SMTP id lp7-20020a17090b4a8700b002a2d05c95f6mr7474868pjb.7.1712744383828;
        Wed, 10 Apr 2024 03:19:43 -0700 (PDT)
Received: from rigel (194-223-186-215.tpgi.com.au. [194.223.186.215])
        by smtp.gmail.com with ESMTPSA id k32-20020a17090a4ca300b0029c3bac0aa8sm1161526pjh.4.2024.04.10.03.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 03:19:43 -0700 (PDT)
Date: Wed, 10 Apr 2024 18:19:38 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Gunnar =?iso-8859-1?Q?Th=F6rnqvist?= <gunnar@igl.se>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 2/2] tools: allow longer time periods
Message-ID: <20240410101938.GA68412@rigel>
References: <20240409093333.138408-1-brgl@bgdev.pl>
 <20240409093333.138408-3-brgl@bgdev.pl>
 <20240409125551.GA69328@rigel>
 <3f31c7bc-de8a-4552-ba48-4432b335f413@igl.se>
 <20240409160516.GA211845@rigel>
 <CAMRc=Md3U=sEypUOSzSiWwQasOxqLn1LGCCHE2fUU5ohnCkKqg@mail.gmail.com>
 <20240409233747.GB3000@rigel>
 <CAMRc=Mem+PaLK+CyWXf3z47U1R4myZxFH5TEj3rmTyqOqHXYSA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mem+PaLK+CyWXf3z47U1R4myZxFH5TEj3rmTyqOqHXYSA@mail.gmail.com>

On Wed, Apr 10, 2024 at 09:53:49AM +0200, Bartosz Golaszewski wrote:
> On Wed, Apr 10, 2024 at 1:37 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Tue, Apr 09, 2024 at 07:24:43PM +0200, Bartosz Golaszewski wrote:
> > > On Tue, Apr 9, 2024 at 6:05 PM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > On Tue, Apr 09, 2024 at 04:58:52PM +0200, Gunnar Thörnqvist wrote:
> > > > > Hi, Got a use case where a hold period is measured in more than seconds?
> > > > > Specifically for a get.:::
> > > > >
> > > > > I can see a large number of use cases where the time can be hours, days and
> > > > > weeks. In my case, pin 17 controls a relay that heats water when electricity
> > > > > is cheapest. It is ok to only have seconds as unit but the range must be
> > > > > larger. /Gunnar
> > > > >
> > > >
> > > > I was asking specifically about the case for gpioget, where a long hold
> > > > period makes absolutely no sense.
> > > >
> > >
> > > One could argue that this option doesn't make sense at all for gpioget. :)
> > >
> >
> > And one would be wrong.  The point of the hold period for gets is to
> > allow the line to settle after a config change before the get itself is
> > performed.
> >
>
> One is indeed wrong.
>
> > > I don't think it hurts to support a longer period of time even if only
> > > for code reuse and less surface for bugs.
> > >
> >
> > Well that is a complicated bit of code.
> >
>
> I'll submit the daemon RFC tomorrow or on Friday. Maybe this change
> isn't even needed after all.
>

I'm not completely averse to it, but it isn't the best solution to the
use case described.  It seems to me that if you want to hold the line for
that long then the terminating condition you are after is unlikely to be
elapsed time.

If we do go ahead with it, I think you are right, we should switch to long
periods throughout for consistency.  Assuming a switch to ppoll(), the only
wrinkle then being the debounce period which is constrained to 32bit by
the uAPI.  Returning an error if the debounce is greater than 32bit is
probably best, as anyone trying to debounce for periods measured in minutes
or longer is definitely doing something wrong.
So basically your original patch, but with the switch to ppoll().

Cheers,
Kent.

