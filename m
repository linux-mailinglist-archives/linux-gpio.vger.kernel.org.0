Return-Path: <linux-gpio+bounces-9840-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8795896DA0E
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 15:20:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44DCE2818E8
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 13:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D442519D071;
	Thu,  5 Sep 2024 13:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T49DeywJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EED147796;
	Thu,  5 Sep 2024 13:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725542398; cv=none; b=s5RVLfSV1kMP7W0eLByELA4v+OAmdJ8b1dG4aewDu1giiIuEg+V5eNaIUal4dI8+43kLW2tZyOp3HwSYPdTDSHoy/52eiqtE80HczYAw5Oi+G+uZ4GRh/lvzyYFDWWHsrEpgMbkCcaGKXNJkUhfNvls/DlioKkikUE4ePfwKnLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725542398; c=relaxed/simple;
	bh=6V3euneuGtibcLKrF6WsUA6dayTGKVR1M0HT1vjiMIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f+MmX+7nlZ0hb7VNwVRbryOM2G1AaJlZDKSXjOCMjTRxzSFXQpFd8meRFma9aGUdWK+7AVw4TVqxB0txnUmqsi1is8qx6pumFj9Gi6J9zZWHIK/lEu14KaPH9FoLyl7eR0cTAk574H79oIVWfqaQXmAY8aog4tLu7fkZQ3+l7dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T49DeywJ; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-656d8b346d2so497535a12.2;
        Thu, 05 Sep 2024 06:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725542397; x=1726147197; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6G+1H1L06ZYyzHJXqiHVCAxEIU4FmeJw2ZnDmlGGd18=;
        b=T49DeywJ4S7ujU2CAY6BDXYo36r3nuGKnrU/dUy8ZLadTNH9ElIfzqfrU1aJpMygp6
         WTsKF6aEyAhEk7UHxZQ0t61xuMq4rwtHp76Fj/l57s5/XHHcvGpunnWxCPq8H2j9hKEe
         2KgjLHF4sYhXSlK0AhHyxTLuS6Wi2/tRyOHB//4jRZf/kIEECCjsa9e/5jea6n3KgC5t
         WaXHAi5G62HdnK759bc8ypuwstWM3xMqTGRhG4/AcgVTPOzZwnZqbKtmzE4ksHaXTrwJ
         wqpysOi7Mrv2DKLllJ+Fpl78395VaGs6Jc4PpncgicYzetkc7pSn5oRN19C6H1vjElXb
         oTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725542397; x=1726147197;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6G+1H1L06ZYyzHJXqiHVCAxEIU4FmeJw2ZnDmlGGd18=;
        b=JX2dIMH3ffkz11MpmXrH33wGvCutAq49os5pJvXtsbj+nEAhUoVyfmroLksnSsCFWV
         z86LouxZq3wi3T+RIUYbtj3kUhld2YjmashMyX/QJn66Gl8edTOW77+63CMwIEsMwLDy
         BHsCA8c3DfU0HBq64yQt/Q5OXy+XvK35RKZqsg2RkOhevpxS9YTFYxA0xK9jo9bVok9k
         0CihUmbnVUJKEP1W0DXZ10rlI6guR2qyZVFu1+yPNlruvUUEmORxJN1G3cy0iZ/NQxL4
         lkD8RnVKL5OSBUXZI1g9b4xQEtuSyqRUFhNhrklcEBPfHaW62fU7zP5dXEDEZkoW1iZP
         wRiw==
X-Forwarded-Encrypted: i=1; AJvYcCVBbkmyVIuKxEx5Uuj0265zxIMdOYgn6bx2KNiZ0hn3j50X8/w/4dT20aqPva+KOulidghGxTndTziusrA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrALCNGTbt71EUwjliaHMlHJb+7g/UygnSFY4kYg8gPW2jDsKN
	BUIuI96MjXje4Igh+5wuqmBqSPkFKSLeTHTlmsBG/15BEk3x8LiY
X-Google-Smtp-Source: AGHT+IF4dbYu6+uDgLDiTIdVAA5fboZCE6L9E6fXLxkA21wUQYREfw5Enu9CqITADmiySOcl7wbRCg==
X-Received: by 2002:a17:90b:19ca:b0:2c9:b72:7a1f with SMTP id 98e67ed59e1d1-2d8973a580emr15117769a91.28.1725542396544;
        Thu, 05 Sep 2024 06:19:56 -0700 (PDT)
Received: from rigel ([203.63.211.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8ace66f14sm10373548a91.20.2024.09.05.06.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 06:19:55 -0700 (PDT)
Date: Thu, 5 Sep 2024 21:19:50 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] gpiolib: cdev: use !mem_is_zero() instead of
 memchr_inv(s, 0, n)
Message-ID: <20240905131950.GA191863@rigel>
References: <20240904090743.1204593-1-andy.shevchenko@gmail.com>
 <172552177868.28435.4071190094207246356.b4-ty@linaro.org>
 <20240905130121.GA166185@rigel>
 <CAMRc=Mc=aK98ZYvz8AuwxYpqEPDAqG1kLcM+T24JipP6HW0L9A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mc=aK98ZYvz8AuwxYpqEPDAqG1kLcM+T24JipP6HW0L9A@mail.gmail.com>

On Thu, Sep 05, 2024 at 03:04:34PM +0200, Bartosz Golaszewski wrote:
> On Thu, Sep 5, 2024 at 3:01 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Thu, Sep 05, 2024 at 09:36:20AM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > >
> > > On Wed, 04 Sep 2024 12:07:43 +0300, Andy Shevchenko wrote:
> > > > Use the mem_is_zero() helper where possible.
> > > >
> > > >
> > >
> > > Applied, thanks!
> > >
> > > [1/1] gpiolib: cdev: use !mem_is_zero() instead of memchr_inv(s, 0, n)
> > >       commit: b1da870ba36b3f525aee9be35b2f08a1feec61a7
> > >
> >
> > As per my other mail, mem_is_zero() is not defined in gpio/for-next yet.
> > So how does this work?
> >
> > If I build for-next I get:
> >
> > drivers/gpio/gpiolib-cdev.c: In function ‘gpio_v2_line_config_validate’:
> > drivers/gpio/gpiolib-cdev.c:1334:14: error: implicit declaration of function ‘mem_is_zero’; did you mean ‘xa_is_zero’? [-Werror=implicit-function-declaration]
> >  1334 |         if (!mem_is_zero(lc->padding, sizeof(lc->padding)))
> >       |              ^~~~~~~~~~~
> >       |              xa_is_zero
> >
> >
> > Cheers,
> > Kent.
>
> Ah, it'll have to wait until the next release cycle then. Sorry for
> vacuuming patches too eagerly today. Dropping it.
>

My bad for not being clearer in my initial mail - that was why I acked
rather than giving it a Rb - it still needs you to work out how to deal
with the other patch that it requires.

Well that and I would flip the sense of the function but, assuming that
ship has sailed, that is just grumbling.

Cheers,
Kent.

