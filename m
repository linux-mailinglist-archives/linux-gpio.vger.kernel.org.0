Return-Path: <linux-gpio+bounces-10874-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD3899158C
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2024 11:49:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A056BB23340
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2024 09:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44464145FEB;
	Sat,  5 Oct 2024 09:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MxV1Y3RU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A102D143722;
	Sat,  5 Oct 2024 09:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728121751; cv=none; b=YK9M0RXA/FpusxTyWsvdMjaPr+c1mOgi8VYHf+dijGs9eAKuagyR1lxrRDqd3C4z1MjqhbqXdauySPYZDJ+ApjZxJs0D7RqXCn5U95GqLGgXSvuk1cgkfv21ZNWOt4O1u19fEAU6Ekb68M5vufQnFNtEGY5uxXyCrvUrdB6ChH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728121751; c=relaxed/simple;
	bh=8ONowbH8q0ENauwIlxunEnyQHJlyp0FFuaGM3eHZWs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZA8TshNonSE/eVS/aR4c1fuvosZwlMTeJxEErECl7DmXHBsjLrdt7QFZZ96dfw5AXcpL/wLmnEvFZYxQbpCs8Xn/KRwCkzDHsvjrMDifTQJppeFNnXI/OGKiuJ9L98EBqQSnSxQIHZhlXP8MYVky8fELm9+MueJTb+cF86/WVCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MxV1Y3RU; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-71dae4fc4c9so2503188b3a.0;
        Sat, 05 Oct 2024 02:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728121749; x=1728726549; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rQMG5vGBJauOrVt5ripN3qu/e2mvWfHeahfKsFEF0xk=;
        b=MxV1Y3RUprRDXglf1E2YXJM+oSmOQTfhUj0i5vbsXawV6JtUdJE5sFguGUjPQANHON
         PEivWCjNfMAkjL2fwV8YTwyEdT70bGo3HJ5sG4SOFhTH5cvPCO9wVc+FFphbwRufr5bQ
         CoKRFRTDaDB+0sZkwEmAcfhtnVvyEu610xu9gbcG+sTUhRepNytZnYzUOveQDdnyBqcm
         AI4Wf6uqPlTvqgAUzcvYefexVX+4oJeRGzDJz7+EWogMtqdHmn/ofWbDNpnUZ/cmaDP0
         LQ0eiZggTWLgruhds4NiTkkf0aG3UXbE4br10ht8AYvnzDrx8NjTiXlpIWLlGd5qb2Vw
         KZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728121749; x=1728726549;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rQMG5vGBJauOrVt5ripN3qu/e2mvWfHeahfKsFEF0xk=;
        b=LzS2XNiGl2NSeRl0uRBpYiatiGprpBsSg7AnnraKXoTZ4jhCj2dpGrL79keFN/gN3b
         JIQz/TRuF2yxeTwEYW80WnigEcNpGjGjzoPCdA2BtM9Dy2jWbLnXp0SgXJsdZzh7saBB
         3Ck9a4DblmTLTXrB0Npq/XRlgB/KPJcf9LFqzfI6omUS+D/1pa56YYeCHgVc0BH2ZSjk
         IBWhvgmNXbqsw6JUK58IOk7vGo17oKakIiv4sF8K66h4ua4L+Hqc3xUV/8wLHgu/FOuM
         nmhQGYKpsj4DmLYYZoON2M5Sv6zpwq8eNNMjbkDZJ5NOpq6e9eymybVoAWSyfnBQauIr
         OlVQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3wrBlHkIyb8ss1K6CMX6AXgqvUvLePzXuuZTeUHPbvQA+Vcu47/OUhuC99KN2l2h6yaKxIx0nw4b1LvRO@vger.kernel.org, AJvYcCWLhh0N0kr8Ug3d3cKuTFqEx1/bbCNlYU3SDB3MShJSgFX5Tej90B82kiI3O4ykkdlvzjDWIkXfOZUT@vger.kernel.org
X-Gm-Message-State: AOJu0Yz62ZjoJGAFxlRLDBiZigZETRFd0jPlkn+h2/d3O3pwKLBo0DPA
	N2aj0PUCloqGNSqzgJjKIcVQKcq8SukIVfUgggRRUhPRXwt3qG0JUYVROsNY
X-Google-Smtp-Source: AGHT+IEIYSG2Zzdg4/tbBDZL5luAg/oi1QJA9M5XXuoJzBhWA9cX+cZKuy+bAQRBzR2o7fP5UG9iIw==
X-Received: by 2002:a05:6a00:22cc:b0:706:6962:4b65 with SMTP id d2e1a72fcca58-71de23e2d59mr8938898b3a.14.1728121748933;
        Sat, 05 Oct 2024 02:49:08 -0700 (PDT)
Received: from rigel (14-202-6-222.static.tpgi.com.au. [14.202.6.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d66324sm1205788b3a.172.2024.10.05.02.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 02:49:08 -0700 (PDT)
Date: Sat, 5 Oct 2024 17:49:04 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 4/5] gpiolib: simplify notifying user-space about line
 requests
Message-ID: <20241005094904.GA238189@rigel>
References: <20241004-gpio-notify-in-kernel-events-v1-0-8ac29e1df4fe@linaro.org>
 <20241004-gpio-notify-in-kernel-events-v1-4-8ac29e1df4fe@linaro.org>
 <20241005034604.GA41715@rigel>
 <CAMRc=MeL9B+oCLb4SFupmBzK5E+JoGfCvtUp-RvYNT=L9i5M1Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeL9B+oCLb4SFupmBzK5E+JoGfCvtUp-RvYNT=L9i5M1Q@mail.gmail.com>

On Sat, Oct 05, 2024 at 11:34:26AM +0200, Bartosz Golaszewski wrote:
> On Sat, Oct 5, 2024 at 5:46 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Fri, Oct 04, 2024 at 04:43:25PM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Instead of emitting the line state change event on request in three
> > > different places, just do it once, closer to the source: in
> > > gpiod_request_commit().
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > ---
> > >  drivers/gpio/gpiolib-cdev.c | 6 ------
> > >  drivers/gpio/gpiolib.c      | 4 ++--
> > >  2 files changed, 2 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> > > index b0050250ac3a..f614a981253d 100644
> > > --- a/drivers/gpio/gpiolib-cdev.c
> > > +++ b/drivers/gpio/gpiolib-cdev.c
> > > @@ -372,8 +372,6 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
> > >                               goto out_free_lh;
> > >               }
> > >
> > > -             gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_REQUESTED);
> > > -
> > >               dev_dbg(&gdev->dev, "registered chardev handle for line %d\n",
> > >                       offset);
> >
> > This moves the notify to before the desc->flags have been set.
> > So the notified will now see the flags as previously set, not what they
> > have been requested as.
> >
>
> Ah, I got fooled by the libgpiod tests passing. I guess we should
> cover that first in tests-kernel-uapi.c.
>
> > That might be acceptible if you subsequently issue GPIO_V2_LINE_CHANGED_CONFIG
> > when the flags are set, but that is not done here and you explicitly don't
> > notify from here in patch 5 when you add notifying to gpiod_direction_output()
> > etc.
> >
>
> IMO it doesn't make sense to always emit REQUESTED and CONFIG_CHANGED
> events together. The initial config should be part of the request
> event. I'll get back to the drawing board.
>

Oh, I agree - that "might" is doing a lot of heavy lifting - there should
only be the one event.

Cheers,
Kent.

