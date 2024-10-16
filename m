Return-Path: <linux-gpio+bounces-11413-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F27F09A04DD
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 10:57:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 850601F26FBB
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 08:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CEF4204F74;
	Wed, 16 Oct 2024 08:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dG1EB1I1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1229203711;
	Wed, 16 Oct 2024 08:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729069046; cv=none; b=OCzIgc9gs9YoNFJl5xI6t7yzEQ0bjg8Ts7wifrsE/U2KqzgozILLthGoVNrDEA8EuOLbv6PBrzKz+wvxuixLZ7QDxxqHjtuuyTLN51o+6Af02gm9Y+kHfO/2BTJtd5kgAnpkIWApqN679d8BtBDz2ILxPNt9Npy0yI1BDcIJCrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729069046; c=relaxed/simple;
	bh=oBxYRTyzYXDesxiIUl129IFZC7jHhuADXJI2FuNlkcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GO3I4shSFO+ANU0/Fi2jXFZ5DFKpq8GxeIepOGCXdBC/OsSoLGVoQFQOhdPiC7j6TPJwvfD2HZcloTKgYOOuH6sDwtT9LmqQ4X72qMSVBP3He1Iwcog+Oqyr9a8/DvW85esMBQYj689eJo9o44bTyjI+fnqwKisSqZ1MNFEI6og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dG1EB1I1; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20c8c50fdd9so4665195ad.0;
        Wed, 16 Oct 2024 01:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729069044; x=1729673844; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r2CRWwiBNbQoQqQ0Dhn+hs+q1/NpF9VZCm1stZBAZ40=;
        b=dG1EB1I17QSpUfbCr8PPmxqs/kBDF2m/Gv64qKCzf7rGbhSiMV3L3mr9QyhxG4L31X
         NR3FRAlZqE/xFLQsa/a0imABuRcygwnB38kGQDAnkQpKYH+cOLctUG3ssngIrDQvAt5r
         awKPZur1iLqkx0H0P24cbrIkCfuEC/yQD9TwccZJM/bDSUHys0rgfOsWwhJ38euSVI/2
         UfHOp3VYW/5Syl8hp48DE7RpssgysHmTxSixZgcUHNrU/ZadbH2L9tIDSTRBau9XbjVD
         Lcvgk13seTmk7Ek8rrqbK5H+wufjsoaIlw49hUaJb1nwFPfBcTCuLub/lDyiDLT03Xq4
         x0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729069044; x=1729673844;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r2CRWwiBNbQoQqQ0Dhn+hs+q1/NpF9VZCm1stZBAZ40=;
        b=PL5PMgJgE4tNDksXiwPK7i43T9STcswfc7Y6OZ8WZHfa4VckPIa9gy1yMYQ3hIbGoL
         MA9ky65PkBu2a87cdJcRh1OU+Bh4g2VRbhK27uwbn88fyhaDEsHhsm81pgZGv9pswkA/
         kBS5PMWgSvs35BDDITNn2XXCwXlufTJ3/uWb32fpqzeKXm18p0IrQxGzj5L5F8VT2jXe
         iH0QOkmn0tI6eHUzkmpPc9LqFylL1L++mXoBgzrvykZzwH3XlL+OcEohBj7baK9NfyF/
         L4LtX267Pjcjz8jYPYdRZE+8PjmH5BMsfMyvEl4daVGaCeWjwUlMiEO6FWTtWeZb37O3
         L93Q==
X-Forwarded-Encrypted: i=1; AJvYcCVl1mqATDdpI937mThP3/+AQQGgxusg/3zsHXK/+/psE6mHZz9jpM/IHctL9spawudKH3fS8091X/90@vger.kernel.org, AJvYcCWlhKB1+5neQD5SHHTUWVyIqxWpjlOpMyVO0Q/hqhRhiO2z7wT4YPal2JwsC5qQeAYPCRp7J42J7c1DPITr@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7Z9A9djS0flk0qg1jFPMwu4WUbMgyqmidPYGjs/qYxy7NoroN
	zv+8TeBbkhEAO+AblL1mhTHcpuWgasaHGoKMVFtZ9QgMkxXsugUT
X-Google-Smtp-Source: AGHT+IEerQTyrecceFws3nAr8shVb9QpVMRYaGqn3OApva7wOQWHb0WfBlU+7w08ToTKA/bgMHKvhw==
X-Received: by 2002:a17:902:da88:b0:20c:e169:eb7b with SMTP id d9443c01a7336-20d26fde7d2mr46569115ad.14.1729069043797;
        Wed, 16 Oct 2024 01:57:23 -0700 (PDT)
Received: from rigel (60-240-10-139.tpgi.com.au. [60.240.10.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d180361e5sm24338475ad.120.2024.10.16.01.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 01:57:23 -0700 (PDT)
Date: Wed, 16 Oct 2024 16:57:19 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 6/6] gpiolib: notify user-space about in-kernel line
 state changes
Message-ID: <20241016085719.GA195243@rigel>
References: <20241015-gpio-notify-in-kernel-events-v3-0-9edf05802271@linaro.org>
 <20241015-gpio-notify-in-kernel-events-v3-6-9edf05802271@linaro.org>
 <20241016051944.GA42100@rigel>
 <20241016072730.GA120095@rigel>
 <CAMRc=MeAfuObBodQu24yUnDbYVd7bFQAeimF5U75chcAK69r6Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeAfuObBodQu24yUnDbYVd7bFQAeimF5U75chcAK69r6Q@mail.gmail.com>

On Wed, Oct 16, 2024 at 09:50:58AM +0200, Bartosz Golaszewski wrote:
> On Wed, Oct 16, 2024 at 9:27 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Wed, Oct 16, 2024 at 01:19:44PM +0800, Kent Gibson wrote:
> > > On Tue, Oct 15, 2024 at 12:56:18PM +0200, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > -   return gpio_do_set_config(guard.gc, gpio_chip_hwgpio(desc), config);
> > > > +   ret = gpio_do_set_config(guard.gc, gpio_chip_hwgpio(desc), config);
> > > > +   if (ret == 0) {
> > > > +           /* These are the only options we notify the userspace about. */
> > > > +           switch (pinconf_to_config_param(config)) {
> > > > +           case PIN_CONFIG_BIAS_DISABLE:
> > > > +           case PIN_CONFIG_BIAS_PULL_DOWN:
> > > > +           case PIN_CONFIG_BIAS_PULL_UP:
> > > > +           case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> > > > +           case PIN_CONFIG_DRIVE_OPEN_SOURCE:
> > > > +           case PIN_CONFIG_DRIVE_PUSH_PULL:
> > > > +           case PIN_CONFIG_INPUT_DEBOUNCE:
> > > > +                   gpiod_line_state_notify(desc,
> > > > +                                           GPIO_V2_LINE_CHANGED_CONFIG);
> > > > +                   break;
> > > > +           default:
> > > > +                   break;
> > > > +           }
> > > > +   }
> > > > +
> > > > +   return ret;
> > > >  }
> > >
> > > Ah, the debounce - I forgot about that, and other features that cdev
> > > might emulate.
> > >
> > > What happens if userspace requests a line with debounce that is
> > > supported by hardware?  Seems to me we'll see both a LINE_REQUESTED and a
> > > LINE_CONFIG_CHANGED when the line is requested.
> > >
> >
> > This is problematic for me to test at the moment, as gpiosim doesn't support
> > debounce. Any chance we could make that configurable?  Similarly drive.
> >
> > > Conversely, what if a config change impacts features that don't result in a
> > > notification from gpiod_set_config(), like active low, or emulated
> > > drive or debounce?
> > >
> >
> > Bah, drive is emulated in gpiolib itself, so that should be fine.
> >
> > When changing config cdev always calls gpiod_direction_input/output(), so I
> > think that covers the active low case.
> >
> > But I have a test taking a line from input to output|open_drain and I
> > get two change events.  The first is the most interesting as it reports
> > input|open_drain, the second then reports output|open_drain.
> > That is due to gpiod_direction_output() calling gpiod_set_config() to
>
> No, it never calls gpiod_set_config() but gpio_set_config() which
> never emits an event.
>

Depends whether the driver supports drive or not.

If it does then
line 2858:

		ret = gpio_set_config(desc, PIN_CONFIG_DRIVE_OPEN_DRAIN);

will emit.

So your _nonotify function is calling a bunch of functions that can
emit.

Cheers,
Kent.

