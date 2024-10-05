Return-Path: <linux-gpio+bounces-10875-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B23F99159B
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2024 11:54:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 879ACB20ACF
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2024 09:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E5AA13BC02;
	Sat,  5 Oct 2024 09:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nnTxbNcO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0557FD27E;
	Sat,  5 Oct 2024 09:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728122083; cv=none; b=aAmtozv4Ngf9yD60odTUjaetHHRyMLOKZDRf7voAZzv/YOzNiehtsK4W1AmYRWlMThqzSoDh/k3R+O+PrQV6apQ4X/n/QHKbbPsKjcad5czbcID5MeJJTfiDguXraeGWDrjFoT+UJY/J2Dq2eYHV0wW5631xC35DbkLIbmdJVRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728122083; c=relaxed/simple;
	bh=lGoUSGWniXVPZFWx9NUfW68r3snAy3+vw4xlKPKpiSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hwTpaGJmZOV2N5sPHLEX1d76UwJZDxufk3hE7GaIoC3Mfgam69j8aZIcWMeOZLG5pdPeEVYRWESG/ZfDkAccigQdY2cj3skAmKj1zz2bT/Wg1YfBPKP8dCpu0hc3FMKyS76LIPbXj7i6QAvrvQgd54hyT4C8pGr7nB7o2PDfTRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nnTxbNcO; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7e6bb2aa758so1267025a12.2;
        Sat, 05 Oct 2024 02:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728122081; x=1728726881; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sEsYnWEWq4RygIHhVkjnsPo7RuOOOcQUO/vrxkw08rE=;
        b=nnTxbNcOPDTR8bgFBwnP9YOXAnXzM0YHY1pMn1kZTgLcrh5jsc2fUFd1k5VBhvDMNb
         BvkRdPx7ikduWQrUrgbbpv3et0Ovb6sY4n7epQD4cNdc383uQvgH8WpIxlT8SorE/fpA
         ERfweyWjqgjReRiGgn5/5PkRlfcVapMjGjfjfJJxSePaxyLZowdLCCHHIacTGV+BZ6fO
         ukJzDmiToubL5bRIlz+soMmBtZ2JdX7CUbka0JQJgkC24HzbzhjnRoevWAJKFaQwjFpV
         urmY6PkkRUYLI67m1iGYlXmImC+IDoYkuZiOnhq8vpSPmj/BekP08EJI3qYExUlEXg8b
         AXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728122081; x=1728726881;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sEsYnWEWq4RygIHhVkjnsPo7RuOOOcQUO/vrxkw08rE=;
        b=DQsjLiMivfhRLR98rgp+Ba7CTRAWkDLh+JPLso8LZK/dn+O0/KJwqWqWRQoV+PPxIp
         wx7vQ01FsvEI2edVrJYNJNSyipzW4SzOyx41QNQWZixCYIHvXAs5PZQVGDc+c5kAVpNd
         Fl8gOPH0bNAZ56ceBSy7moGZZhHv4DklBGe8CtVrPoDBmtCneClhQJq0z0bjQUjddkyk
         Yk2ZWpGqWSQo68LjMF7aTpIHfDJEDRR+LW6+1ngofTM5RTrHGIlSA9j3gaBmKyv4s1BF
         Vp1WXQ5cZTjUSLzAEZC6eJ9s8QFiAONZ3U8jzQ2kvHgij1b6E+wTuHEoSEEQ822A4Sy7
         LJ1A==
X-Forwarded-Encrypted: i=1; AJvYcCUXoYg/STRAswh/aia2QPQq8jo67xvkEy1E/xt7vJ9YzOe6SmrItK7+smmZawR2Y2jeFZagfnv5IZut5A56@vger.kernel.org, AJvYcCVVxTYFEKWJl69Q8+9cn70UDmxVIDwWbjlLNwly2ePBYHW08L7gyXD9rqemjqYMnD1Ptbgsq3WPmRK2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+ofqepGloHy5eivDQMApyoNb62I2OtFIOBSl6eKtEwBj5VKT2
	paqWG6Ff/4oHCSGsmMG9dcYtbzVrQpK5BjMVvetoO+WD/uT7OZGk
X-Google-Smtp-Source: AGHT+IHnmQiXM9kpp5cWEP+GN/WRsGLpsYFYlYzNHVuNWKusso2BypeVuSLlu+0IFJGJhtvkR6PAug==
X-Received: by 2002:a05:6a20:b58b:b0:1cf:6533:5c86 with SMTP id adf61e73a8af0-1d6dfa40a0fmr7293933637.21.1728122081188;
        Sat, 05 Oct 2024 02:54:41 -0700 (PDT)
Received: from rigel (14-202-6-222.static.tpgi.com.au. [14.202.6.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d47863sm1176384b3a.119.2024.10.05.02.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 02:54:40 -0700 (PDT)
Date: Sat, 5 Oct 2024 17:54:36 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 5/5] gpiolib: notify user-space about in-kernel line
 state changes
Message-ID: <20241005095436.GB238189@rigel>
References: <20241004-gpio-notify-in-kernel-events-v1-0-8ac29e1df4fe@linaro.org>
 <20241004-gpio-notify-in-kernel-events-v1-5-8ac29e1df4fe@linaro.org>
 <20241005074635.GA174602@rigel>
 <CAMRc=MdU5+AC4PyPjuXuG_S7R59OJ-DaaCdX2fZfoCcs5BveJg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdU5+AC4PyPjuXuG_S7R59OJ-DaaCdX2fZfoCcs5BveJg@mail.gmail.com>

On Sat, Oct 05, 2024 at 11:42:34AM +0200, Bartosz Golaszewski wrote:
> On Sat, Oct 5, 2024 at 9:46 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Fri, Oct 04, 2024 at 04:43:26PM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > There is a problem with gpiod_direction_output/input(), namely the fact
> > > that they can be called both from sleeping as well as atomic context. We
> > > cannot call the blocking notifier from atomic and we cannot switch to
> > > atomic notifier because the pinctrl functions we call higher up the stack
> > > take a mutex. Let's instead use a workqueue and schedule a task to emit
> > > the event from process context on the unbound system queue for minimal
> > > latencies.
> > >
> >
> > So now there is a race between the state of the desc changing and the
> > notified reading it?
> >
>
> Theoretically? Well, yes... In practice I don't think this would
> matter. But I understand the concern and won't insist if it's a
> deal-breaker for you.
>

I don't like that correctness depends on timing, so this is a deal
breaker for me as it stands.  I would like to see the relevant state passed
via the notifier chain, rather than assuming it can be pulled from the desc
when the notifier is eventually called.

Cheers,
Kent.

> Ideally we'd switch to an atomic notifier but I don't have a good idea
> on how to handle pinctrl_gpio_can_use_line(). It digs deep into the
> pinctrl code and it's all synchronized with a mutex. Unlike GPIO, it
> doesn't make any sense to spend days converting pinctrl to SRCU for a
> single corner-case.
>
> I wanted to use in_atomic() to determine whether we can emit the event
> immediately or (if we're in interrupt or with a spinlock taken) we
> should use a workqueue as a fallback but checkpatch.pl is very adamant
> about it being an error (in capital reds).
>
> Bart

