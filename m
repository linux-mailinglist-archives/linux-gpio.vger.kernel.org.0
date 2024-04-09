Return-Path: <linux-gpio+bounces-5262-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 351DC89E630
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 01:38:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68D74B2326C
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Apr 2024 23:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88B4F159209;
	Tue,  9 Apr 2024 23:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/CrY3So"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B661591F8
	for <linux-gpio@vger.kernel.org>; Tue,  9 Apr 2024 23:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712705874; cv=none; b=Z+sbXwLtejeSDNq6sYinQ+rlts6dspD567iLV6hXqpbQODnP3CZruJvaaizDSXqhvW70oPK1uD9/OjhUJycp6igv6HsOJfykOyXzmAva9wzJ7praDW14e+t4WOEvelqczYS97WJMnIjhVNhVwOuygjDvLQGboDmuO6uDMZE49Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712705874; c=relaxed/simple;
	bh=MBDgkwZQlYKK8u22zho0OTmwZXBX5QQcQeFhZiQLyfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pBqU6sBqQFgn2ouUvvy7fSUM6ed3aCtKHLaee4hjqXH8RDLi6qalxH5Gf5vjSMjvcC+evNKIRbrxwGOy+nFm0MctoHstFl2y4HiaG2kzE5Y0d/qsluowds6qLBeBrElRvEqVmq5D0T0YnmMmrsuC+MqDbga9RAFX3PtWUsOues0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/CrY3So; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1e3cf5b171eso33262995ad.0
        for <linux-gpio@vger.kernel.org>; Tue, 09 Apr 2024 16:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712705872; x=1713310672; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IpK8YYawKDvvGhn1h+JGwsC1amwC6XNQkBjHospxbac=;
        b=A/CrY3SoPg51uZP4tL+TtrkMvte8Ba0BWuvUX7+f4XYt8DK4+sVG0AjXxWOtWUIAeF
         cZzsTAAxQsIoHz5OYSx+Y6NTRsd9tEOZM/JY1QsTgKvtRiUc2eUtPCOOZ62M36NUsv9c
         pOx3jR5jKmV3I+MNzmEJ8ZuyEhx6qNwoKntS9BxOqCu6xmGjE+h24Z4HBDliKcJMeJyV
         jKTi6EB4gq3r9ua1i2/nZlTqpQvA6/B0W0IPNvLpM8wxk69y75vMrIX/njl3iaLPRdUY
         XrfAdcIOUw3sKl3PPV6Myh8eHa8Gc1c+Yf5UneKSJ59NuPif65lRFYUtDkQVAN1Ud4qV
         FgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712705872; x=1713310672;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IpK8YYawKDvvGhn1h+JGwsC1amwC6XNQkBjHospxbac=;
        b=XIjCi+kU/nn92P3bYCsLNFbweHRR4Hz3unzYnSjBj5RUffuEQ2zjJ4rWAHfCKNB6Wx
         6t1Ft+YO/BbdUy5h5NB7KoVAhTNdmcdODUJoFBQ8ebqDLOKToJhNBvCQ4rFMLNO8Atj+
         BYawwqHcKcHWe9bramC2JYz4YWCfPZmavgaU/beUGQaFRP30aW6yQC6pbTJIf9Af4/9U
         uJzcdLDrB6cD7ejYgSYXP14oeyDO/c8ZpK/lW0/bfLjjxIyHCUai/ZKx0ThLuwm/pjDX
         A0Hm5Vt6o1Ys+sPS3chWGcMhjbCdpcmed8UyTZg8BQ0xSWXoIuLgAomsVYy4KKFpd4we
         Ebcw==
X-Forwarded-Encrypted: i=1; AJvYcCXosPToXGtLt4MzFh9elfl0iJsi7TXJf2m8phTiv4ca7oknUFTbz5nhYKamxMvLClR4P4EQpFYWLumqKMLGDJ2NbcoY/V/autdJtw==
X-Gm-Message-State: AOJu0Yzs3mFIIvwf9YQN9Me6OQUY/SCJwS6ylXLHebP1gxs8tMD2CgH8
	gAFbK6SFFIg4wKFQzJfDw+5ee+WaQ1u6oxQ281wcd04SoVzlFsi2n3O8S8HM
X-Google-Smtp-Source: AGHT+IHfSEiHxgrJHq2ksgt/1aDM07442Q+Lhqx8Vkg+K9wlJDf6suHOOk99czIvl/5Gg5AEsNr8Ew==
X-Received: by 2002:a17:902:dac2:b0:1e4:6232:367a with SMTP id q2-20020a170902dac200b001e46232367amr1835878plx.22.1712705872145;
        Tue, 09 Apr 2024 16:37:52 -0700 (PDT)
Received: from rigel (194-223-186-215.tpgi.com.au. [194.223.186.215])
        by smtp.gmail.com with ESMTPSA id h10-20020a170902f54a00b001e3dff1e4d5sm4247897plf.135.2024.04.09.16.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 16:37:51 -0700 (PDT)
Date: Wed, 10 Apr 2024 07:37:47 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Gunnar =?iso-8859-1?Q?Th=F6rnqvist?= <gunnar@igl.se>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 2/2] tools: allow longer time periods
Message-ID: <20240409233747.GB3000@rigel>
References: <20240409093333.138408-1-brgl@bgdev.pl>
 <20240409093333.138408-3-brgl@bgdev.pl>
 <20240409125551.GA69328@rigel>
 <3f31c7bc-de8a-4552-ba48-4432b335f413@igl.se>
 <20240409160516.GA211845@rigel>
 <CAMRc=Md3U=sEypUOSzSiWwQasOxqLn1LGCCHE2fUU5ohnCkKqg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Md3U=sEypUOSzSiWwQasOxqLn1LGCCHE2fUU5ohnCkKqg@mail.gmail.com>

On Tue, Apr 09, 2024 at 07:24:43PM +0200, Bartosz Golaszewski wrote:
> On Tue, Apr 9, 2024 at 6:05 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Tue, Apr 09, 2024 at 04:58:52PM +0200, Gunnar Thörnqvist wrote:
> > > Hi, Got a use case where a hold period is measured in more than seconds?
> > > Specifically for a get.:::
> > >
> > > I can see a large number of use cases where the time can be hours, days and
> > > weeks. In my case, pin 17 controls a relay that heats water when electricity
> > > is cheapest. It is ok to only have seconds as unit but the range must be
> > > larger. /Gunnar
> > >
> >
> > I was asking specifically about the case for gpioget, where a long hold
> > period makes absolutely no sense.
> >
>
> One could argue that this option doesn't make sense at all for gpioget. :)
>

And one would be wrong.  The point of the hold period for gets is to
allow the line to settle after a config change before the get itself is
performed.

> I don't think it hurts to support a longer period of time even if only
> for code reuse and less surface for bugs.
>

Well that is a complicated bit of code.

Cheers,
Kent.

