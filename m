Return-Path: <linux-gpio+bounces-10871-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B88B4991522
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2024 09:46:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 770F61F236DA
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2024 07:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D51F7130E58;
	Sat,  5 Oct 2024 07:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWRInkBX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528B1A95E;
	Sat,  5 Oct 2024 07:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728114403; cv=none; b=IJMhjik3e8wDekv94q2LTCbEn93EcfsByg/HK7Bpgwaiym8MwQy/geJN9kHqKeXBJRuT9GBgpHK4K6kOKzBZjrz6eNaPsnr60iVV3eoW9Xtfw6wQldAV3J1pL2HpbPZz1Z0dVooziJN4WW4kymEqwoT+u5Bluh75KU54Ffk9sA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728114403; c=relaxed/simple;
	bh=EjbzUCcYKQ1WVBX5NMfK99JNuYPQix1iDXIw1Lo05hE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iXbnxjF6jluxv0jSONLXu0pFQLWpIbe0Ix3DE64j7nQpd41om/3n9irHAWHolUwvYgdrtR5OpQgMvSiFncf1ZFXJVyWIGuo87ntMerdQqcp6vTy4nsRnJZXxzNkxjHm58ohdI8ylPOxIS0nzWpoLBMgulqTqOIyrRkgX5Xk7/hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWRInkBX; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20b7463dd89so31501715ad.2;
        Sat, 05 Oct 2024 00:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728114401; x=1728719201; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EjbzUCcYKQ1WVBX5NMfK99JNuYPQix1iDXIw1Lo05hE=;
        b=VWRInkBX/Lrn30IcZlufTyEEzgpHIWq6kBYHjFfFgVqrPGRel7jN+AIS2brqWxrSOw
         j2rwwk+ZirdOU89majZVxmg1CP6YQZC+1IRXpLOjxeeqwBaL353Q3w/3Q/btE/a1dRY9
         7baGWmU6YqIzochUy0CQLcFq2zlcAeEGIt06vLuKCBdrGKjzajikK9WddlqcYv80IKK8
         Sgm9mqX8SSKr0zkB8FuriV57ZKbivBHPi7qxN/OJ3dict15WEvfqdnsJDCvUQUPo9eKP
         61s884mONO0xy44rRHdaqXw119GRGY0j9xRfqxqsn1tRjsPVjMyOIrPyRkHTJY+l8lbj
         fVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728114401; x=1728719201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EjbzUCcYKQ1WVBX5NMfK99JNuYPQix1iDXIw1Lo05hE=;
        b=N20w5b96X+HEfHkjAoASoMYfaEhvNoBrvpX0WbJ1Qqpza8t0AHVa2Ab7QZtoXJAhpA
         hEjG1gHfvwPZUvcWst5OP23FHiyo2BWs0Ga3jUsi1dppCzYNvdFvw7SHFbcWXgueA7dk
         ADlyGOnrTKrDk4OAbFfODCRHeafsSUaITLj3TGq+XvADT0Uly2gJEosfcpZEorSCFrB0
         TREX66CeIHyBq+DVIb2catgEOBuYleB+Vmgj8eT5Qr1d83gYI+dw+gE3CCvXOC0n2npY
         FBbP49iZWvFpVFXxVtQ1F0HQB7Y5Fw+y6/oG6m0I7oypoOOibaR8+hY2dIcoqDqFTF9a
         nwBA==
X-Forwarded-Encrypted: i=1; AJvYcCUqxQ30G2obZnWP6VtA11h4T/focrt7xioYMINSjGNUSGvX+vRmTiN7B+zuEi3Cm9Ky3+kH1CgxkuTE@vger.kernel.org, AJvYcCV2vVB3DzCGVyNjZFMqJ2iwTP/b3ZK/1SJS3Hxln6FC2K4xNsw0WALtRu1v+5UPG7bzVCiF+cvqHgBrXVxS@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp84yutXMjBY80VUg1D6hxBGQsVWAZWdp1wRjjCpD/RDi9IxHI
	PUX60IQzpd0zflSc0mmot+NHhjsW24m3BRXx84DD1BaXgXRWfLuX
X-Google-Smtp-Source: AGHT+IHwWtZ/+z+yB6R6WzQCo10YY1gwQCr00t9wymwwhA2Xeu+K6gGWx9oJmtc6VEqsI2mtB9tGlA==
X-Received: by 2002:a17:902:e5c7:b0:20b:57f0:b372 with SMTP id d9443c01a7336-20bfe070e11mr69723965ad.34.1728114401478;
        Sat, 05 Oct 2024 00:46:41 -0700 (PDT)
Received: from rigel (14-202-6-222.static.tpgi.com.au. [14.202.6.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13994f84sm8620645ad.290.2024.10.05.00.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 00:46:40 -0700 (PDT)
Date: Sat, 5 Oct 2024 15:46:35 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 5/5] gpiolib: notify user-space about in-kernel line
 state changes
Message-ID: <20241005074635.GA174602@rigel>
References: <20241004-gpio-notify-in-kernel-events-v1-0-8ac29e1df4fe@linaro.org>
 <20241004-gpio-notify-in-kernel-events-v1-5-8ac29e1df4fe@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004-gpio-notify-in-kernel-events-v1-5-8ac29e1df4fe@linaro.org>

On Fri, Oct 04, 2024 at 04:43:26PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We currently only notify user-space about line config changes that are
> made from user-space. Any kernel config changes are not signalled.
>
> Let's improve the situation by emitting the events closer to the source.
> To that end let's call the relevant notifier chain from the functions
> setting direction, gpiod_set_config(), gpiod_set_consumer_name() and
> gpiod_toggle_active_low(). This covers all the options that we can
> inform the user-space about.
>
> There is a problem with gpiod_direction_output/input(), namely the fact
> that they can be called both from sleeping as well as atomic context. We
> cannot call the blocking notifier from atomic and we cannot switch to
> atomic notifier because the pinctrl functions we call higher up the stack
> take a mutex. Let's instead use a workqueue and schedule a task to emit
> the event from process context on the unbound system queue for minimal
> latencies.
>

So now there is a race between the state of the desc changing and the
notified reading it?

Cheers,
Kent.

> In tests, I typically get around 5 microseconds between scheduling the
> work and it being executed. That could of course differ during heavy
> system load but in general it should be enough to not miss direction
> change events which typically are not in hot paths.
>
> Let's also add non-notifying wrappers around the direction setters in
> order to not emit superfluous reconfigure events when requesting the
> lines.
>
> We can also now make gpiod_line_state_notify() static.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

