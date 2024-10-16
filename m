Return-Path: <linux-gpio+bounces-11415-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E209A050D
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 11:08:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3F7B2876D4
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 09:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4270B204934;
	Wed, 16 Oct 2024 09:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X6h+prwu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0574134A8;
	Wed, 16 Oct 2024 09:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729069695; cv=none; b=klzB0VyHRQ85cdY+l1W3rJRASHmgF2XsMDcF2U8LuRDHBkhwH8YCESyJGJf+T9VwDhVDvZYS2E6N8eNeFK6OsBbS0vlNfc7gvyHfm58Y6oMQf3+C1QVf8uJFbagt+8FPFJ6mgcu2idjV/dfr2ggKTH9TgzuUz7mea+GMWcKHtMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729069695; c=relaxed/simple;
	bh=agi1IdhrWDLfNL1f/B1+9xs5gfQcbA6s+/384FFY6gc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NLyjLDxE1ro2apiazLMyxIRdMNNAhqitw3emwFk1tI4bqK04VffD0JBKQoHxMqxvZkzfOqF60ft4KOksUrTPkDZYn3i00LUO5UnuwtAyEBsNHcgXiRGYh/esWCOWs5dT2I5xfQ8USBKsq1PYTJEHYd8vZw2d1phDg8oHrvtxDzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X6h+prwu; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7ea7ad1e01fso517520a12.0;
        Wed, 16 Oct 2024 02:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729069693; x=1729674493; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dkyM6OMWk8EuZMJ6dvNSgb3zJy48IobDCiksIoW5pi4=;
        b=X6h+prwuLfui/vyAk87kOM92u715or6QmfSGnQ7EdOBobWylSi3Ldpki7UAUMKlo2T
         12hG6OAc9Iua/ha/2EN4eFSH9zilkxRBogMXz0shgMpm2yofXHRoTK3kSRuVp0yvCk04
         sD+DrFAPjYxLmiEzdyc42MaelM7cNWykITPq+eWbrcc1033B5tXLJ1zyaQsjHfMZN25Y
         zEacNae64yKLJvwa+7skS8JYPmw6NqSHK+bP57AiaoQp9uE4mqEdBuOx/5wgETPgGkhp
         fSr/m5Z8T5G+Wsn0kALj/i5Cb5zY2hz7XXKoWNigGMZTLqr2cVtD4CRyB5S9WQfse/SH
         z1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729069693; x=1729674493;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dkyM6OMWk8EuZMJ6dvNSgb3zJy48IobDCiksIoW5pi4=;
        b=a/tjWM2hKYkz8JyZZhLI4cveTcHnOKlmiSninQoZQ8baFeNF/7Ks4+T5tXrKAlXej5
         AHcOzWDtjvYdxMop+5LzK9EdPG5ela2HPheMx+8Y7eTc9FT3ZGoXI1HQ6Eh1NisS7yRx
         BZCTUiI6LvjiNX9QXO/MK0EatqUdwA8LjIkdNrSPmatlXxQ661f8X3/+fEIHW/CYehQc
         8L9R8g38EkrqWKxxB3cstd13gcRx5I14Dudg+LZxz2Cw4FmXqgnlQF0/3DzJICQdjWJM
         wDoYBfft3orAbO7/KxouFE08WqSf0SKGXhb+vBr50baldRuw63LgXeeFrpkBL/MNCiqL
         AphQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnjrY4HCGDAU5BsRMReHE+16cECw0upeMQqRhx3VgfK7InBy3KEgDJh7fdn4wACFiIYtjgzQMyoXtN@vger.kernel.org, AJvYcCW1lYPbMeyk0Yo5vdM+TUBW1Y/+ptMiEqwliKGB8yXBLZ7L7rUG2t/Y0glQVyFQYkDd6/bk3paI1wiEnb0j@vger.kernel.org
X-Gm-Message-State: AOJu0YznaQ5kOxHBitCsUO5vCl26idmfOQM3tyCbIttEpfeCsqjhVg57
	4r5AdtmE8YqkCSSL3rxct5wF4ro88SqGB5D2RyvX596caas5T65u
X-Google-Smtp-Source: AGHT+IE7YdWSW7p4zOPMwx3xoDyj+R/MUC28WEFSfppzFtRtdrKJEDsAFvwE5KJtbhhobApwWbeZhg==
X-Received: by 2002:a05:6a20:4314:b0:1cf:2a19:b1b with SMTP id adf61e73a8af0-1d904f49c74mr5074832637.7.1729069692876;
        Wed, 16 Oct 2024 02:08:12 -0700 (PDT)
Received: from rigel (60-240-10-139.tpgi.com.au. [60.240.10.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ea9c6ba33csm2780697a12.17.2024.10.16.02.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 02:08:12 -0700 (PDT)
Date: Wed, 16 Oct 2024 17:08:07 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 6/6] gpiolib: notify user-space about in-kernel line
 state changes
Message-ID: <20241016090807.GA202104@rigel>
References: <20241015-gpio-notify-in-kernel-events-v3-0-9edf05802271@linaro.org>
 <20241015-gpio-notify-in-kernel-events-v3-6-9edf05802271@linaro.org>
 <20241016051944.GA42100@rigel>
 <20241016072730.GA120095@rigel>
 <CAMRc=MeAfuObBodQu24yUnDbYVd7bFQAeimF5U75chcAK69r6Q@mail.gmail.com>
 <20241016085719.GA195243@rigel>
 <CAMRc=MfcDK9u1T6=2kNoC-nfjkBHd8d38paZ-DvNG-1BLFr4_g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfcDK9u1T6=2kNoC-nfjkBHd8d38paZ-DvNG-1BLFr4_g@mail.gmail.com>

On Wed, Oct 16, 2024 at 11:02:37AM +0200, Bartosz Golaszewski wrote:
> On Wed, Oct 16, 2024 at 10:57 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Wed, Oct 16, 2024 at 09:50:58AM +0200, Bartosz Golaszewski wrote:
> > > On Wed, Oct 16, 2024 at 9:27 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > On Wed, Oct 16, 2024 at 01:19:44PM +0800, Kent Gibson wrote:
> > > > > On Tue, Oct 15, 2024 at 12:56:18PM +0200, Bartosz Golaszewski wrote:
> > > > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > > >
> > > > > > -   return gpio_do_set_config(guard.gc, gpio_chip_hwgpio(desc), config);
> > > > > > +   ret = gpio_do_set_config(guard.gc, gpio_chip_hwgpio(desc), config);
> > > > > > +   if (ret == 0) {
> > > > > > +           /* These are the only options we notify the userspace about. */
> > > > > > +           switch (pinconf_to_config_param(config)) {
> > > > > > +           case PIN_CONFIG_BIAS_DISABLE:
> > > > > > +           case PIN_CONFIG_BIAS_PULL_DOWN:
> > > > > > +           case PIN_CONFIG_BIAS_PULL_UP:
> > > > > > +           case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> > > > > > +           case PIN_CONFIG_DRIVE_OPEN_SOURCE:
> > > > > > +           case PIN_CONFIG_DRIVE_PUSH_PULL:
> > > > > > +           case PIN_CONFIG_INPUT_DEBOUNCE:
> > > > > > +                   gpiod_line_state_notify(desc,
> > > > > > +                                           GPIO_V2_LINE_CHANGED_CONFIG);
> > > > > > +                   break;
> > > > > > +           default:
> > > > > > +                   break;
> > > > > > +           }
> > > > > > +   }
> > > > > > +
> > > > > > +   return ret;
> > > > > >  }
> > > > >
> > > > > Ah, the debounce - I forgot about that, and other features that cdev
> > > > > might emulate.
> > > > >
> > > > > What happens if userspace requests a line with debounce that is
> > > > > supported by hardware?  Seems to me we'll see both a LINE_REQUESTED and a
> > > > > LINE_CONFIG_CHANGED when the line is requested.
> > > > >
> > > >
> > > > This is problematic for me to test at the moment, as gpiosim doesn't support
> > > > debounce. Any chance we could make that configurable?  Similarly drive.
> > > >
> > > > > Conversely, what if a config change impacts features that don't result in a
> > > > > notification from gpiod_set_config(), like active low, or emulated
> > > > > drive or debounce?
> > > > >
> > > >
> > > > Bah, drive is emulated in gpiolib itself, so that should be fine.
> > > >
> > > > When changing config cdev always calls gpiod_direction_input/output(), so I
> > > > think that covers the active low case.
> > > >
> > > > But I have a test taking a line from input to output|open_drain and I
> > > > get two change events.  The first is the most interesting as it reports
> > > > input|open_drain, the second then reports output|open_drain.
> > > > That is due to gpiod_direction_output() calling gpiod_set_config() to
> > >
> > > No, it never calls gpiod_set_config() but gpio_set_config() which
> > > never emits an event.
> > >
> >
> > Depends whether the driver supports drive or not.
> >
> > If it does then
> > line 2858:
> >
> >                 ret = gpio_set_config(desc, PIN_CONFIG_DRIVE_OPEN_DRAIN);
> >
>
> I'm seeing this:
>
> gpiod_direction_output_nonotify()
>   gpio_set_config()
>     gpio_set_config_with_argument()
>       gpio_do_set_config()
>         gc->set_config()
>
> There's no call to gpiod_line_state_notify() in this path.
>

Ah, my bad - thought it was gpiod_set_config().
So it is just the gpiod_direction_input() calls.

Cheers,
Kent.

