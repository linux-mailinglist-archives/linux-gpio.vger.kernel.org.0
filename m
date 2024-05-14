Return-Path: <linux-gpio+bounces-6364-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D158C55DF
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 14:15:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CAE11C225C1
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 12:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 567F33F9D2;
	Tue, 14 May 2024 12:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BNPebhYH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB57320F;
	Tue, 14 May 2024 12:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715688922; cv=none; b=gT6g0aALXk3ttd7tHG/bUOYy5gs/xfiTrB3mWMvqy5wIr0dCEeBd689oZLdLRdXpH3wSOg4GYl+9/dr5MK4oCar3oGBKTQS4ReikAnuNCJg6pFVY5ol7oGNGZdZfYl+gP/GcQQKD1ul0IovRXyKpG1d0NyBe6HadWzV8p9cKZh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715688922; c=relaxed/simple;
	bh=C8AbzcTH0UDOHtZozDO2s82ZaO9jrv9srhBKUr1ss0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mp+QrAQn6+JGpVM0N6WiBRnMisaCWXRk8ASAKwQ5JKVfUlnZ2Lvuj8SRajI5AxUkKBEpE2+5qHB+HzM4Zy6j8MqFpC0yR3UcEuRFlBezyK8rVErlvqcClcdFVE3vftCNnKvFfeQAH/lHkQgpvk4wLooJT/36OHiu2HrMF0YnX0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BNPebhYH; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1eca195a7c8so45209445ad.2;
        Tue, 14 May 2024 05:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715688920; x=1716293720; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pskd4OyVYfOv6TtD0JP21Spo2bkD19tl3Fnn6qpniO0=;
        b=BNPebhYHx4NpL7w/Coz0w61gjSCfuMaabxWrsV7QbKv48vnQ2+EbcQJ1jPsS50M9Mh
         0wA0s41utSAq/aV+ks2jkuSMB01c3nmMPJ5f8swBsw+h++vqUoorGUY7sgd2hP7XF15x
         tDp/CH7PGJC8O6CYptJ8vhx+Ff3rfqN2EG2JN4yBNUwpw8O6DYDiCAuKpB+/KAULNwnh
         DzAWsUHpwrQ7CCsqEg/BrOTBUHZWeD2d6mt2Nf3dQ3DHH6pOlxPZXCvyn0hHpMEP2hDg
         lgK5GG/E1jCMCvhyQvWJ9gRzHRnBpPx4D9xIU8/gWkhNXe/N3gjbRxyjS7ryDwWjIOUm
         lQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715688920; x=1716293720;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pskd4OyVYfOv6TtD0JP21Spo2bkD19tl3Fnn6qpniO0=;
        b=hOnnnXcT7HcwHE13yAA+8pKNxeSSu/lA5uzYrJCNu/vP6j1AscL4eR5ItTednSiwVe
         M1ckN07dKPLocSoloKLCOLO9RDI2djwxy6zrTQd4TPWkZeqpQGt/heYMUYmCnjzO/Np4
         /UQZ3H2rXyEFwdSgAU8AtqYAqLXiJvW1WG6SsbTBuvqcA1R1dJMr58UpHgkljKHTpC9h
         jDMkmHVdkrbkhze+SHZPnHEShX2cn7RpzyeJr7wsxWt+NTTvxCyK6fA6zyNdlmHg7VXl
         oo2q5knC1mctkwaJOS0+m4sovgDI5zTGp8Jd+eOQyu8utcepXWC6xEx6II89drMQ8zSR
         vZIA==
X-Forwarded-Encrypted: i=1; AJvYcCUgHomR8eKStZ0ZiyGL8DSor4j5NJWr8XBzTKIbBOzE3ugwCIiJ30bfHiV+eCmcFu5d263AKUep4C88B9965Hi2Xq/fOHlWnwXhwA+kI7+w1ICIrlncrJ2J8loTpF/rgXDLxOK9eX72FQ==
X-Gm-Message-State: AOJu0Yz8beFayqD4a3RiCXIxbDAoJ18PvLuSnFNACa8CY7BMylac9ZZX
	H9q8vhVe0kAVw+USW8Y+mRUmle7ovmJbDEjU/aw+uhDlQCWe/t/A
X-Google-Smtp-Source: AGHT+IH4mZIj1+A3RtNyc5REPvnbWn8cl+CBwJqHJcC5O4EVt74huk85AhWJipxoDmtWtR8hvEqGBg==
X-Received: by 2002:a17:902:6ac1:b0:1e2:7dc7:477 with SMTP id d9443c01a7336-1ef440583dbmr106394935ad.57.1715688920056;
        Tue, 14 May 2024 05:15:20 -0700 (PDT)
Received: from rigel (60-241-107-82.static.tpgi.com.au. [60.241.107.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c138fa2sm96107365ad.261.2024.05.14.05.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 05:15:19 -0700 (PDT)
Date: Tue, 14 May 2024 20:15:15 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linus.walleij@linaro.org
Subject: Re: [PATCH] gpiolib: cdev: fix uninitialised kfifo
Message-ID: <20240514121515.GA72688@rigel>
References: <20240510065342.36191-1-warthog618@gmail.com>
 <171534996897.34114.8159265536879918834.b4-ty@linaro.org>
 <20240514033656.GA24922@rigel>
 <CACMJSetivWMXNu9dJyMeJTfYSsQaez_7kSHce-5NJL6=72Rd0g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACMJSetivWMXNu9dJyMeJTfYSsQaez_7kSHce-5NJL6=72Rd0g@mail.gmail.com>

On Tue, May 14, 2024 at 08:56:13AM +0200, Bartosz Golaszewski wrote:
> On Tue, 14 May 2024 at 05:37, Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Fri, May 10, 2024 at 04:06:16PM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > >
> > > On Fri, 10 May 2024 14:53:42 +0800, Kent Gibson wrote:
> > > > If a line is requested with debounce, and that results in debouncing
> > > > in software, and the line is subsequently reconfigured to enable edge
> > > > detection then the allocation of the kfifo to contain edge events is
> > > > overlooked.  This results in events being written to and read from an
> > > > unitialised kfifo.  Read events are returned to userspace.
> > > >
> > > > Initialise the kfifo in the case where the software debounce is
> > > > already active.
> > > >
> > > > [...]
> > >
> > > Applied, thanks!
> > >
> > > [1/1] gpiolib: cdev: fix uninitialised kfifo
> > >       commit: 3c1625fe5a2e0d68cd7b68156f02c1b5de09a161
> > >
> >
> > I've got a patch series to tidy this up and catch any similar errors
> > earlier going forward.
> > It is of course based on this patch, but that isn't in gpio/for-next yet.
> > How should I proceed?
> >
> > Cheers,
> > Kent.
>
> Pull in current master into gpio/for-next, apply your series, make
> sure it works and then wait until v6.10-rc1 is tagged because I won't
> be picking up anything during merge window.
>

Will do.

Thanks,
Kent.

