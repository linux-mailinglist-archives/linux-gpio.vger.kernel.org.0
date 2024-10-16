Return-Path: <linux-gpio+bounces-11417-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A4A9A0539
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 11:17:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26A82B26A8B
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 09:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FB681D90DD;
	Wed, 16 Oct 2024 09:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NmY5yVH1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF43018C340;
	Wed, 16 Oct 2024 09:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729070241; cv=none; b=YXixEQ3sI+nRMp35vs/e+YAj9Kb0CcYJQmju6jTJUg4Px7JWVGWIVQjO2ChU7JpEf6nHmiKTI8WbL5gBAH5xe6r97StjuGK4PvRMKrNdlMXVXmYk0B8Y2bnnvsiuhmzagzb/cDcH+7LnYlPboY/Ay8uyShX1ZfEsxerOoKvCz1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729070241; c=relaxed/simple;
	bh=FqCpaaTVfUEksVZSntboP/jQbZ5KRlkmllBQzNmok8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JUly/7dtZM/rPe49Ugp+bU0z2E7PvN9C25pdKD5ZfxqBD7ck5LJngNUyNw1/H7/UOYikrznu0b6VDmgv7f+ZgGg5UOwA4v5MyRglALw8pLPPo2QmwA/Cx5NDvIBmQLBtGOweKP60IS6W7MbyxitNN138DyhkkmatyVUDiYBtDr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NmY5yVH1; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20ca7fc4484so31588705ad.3;
        Wed, 16 Oct 2024 02:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729070239; x=1729675039; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yztsizxjMpBcJQ63I4A8OaXSnNSjdmkpV8jlCXGDS8g=;
        b=NmY5yVH1eVp2aSO2vQhLR4FhG4i7Ah6KG0z1Svz7lNlJreO6edqJwnaGEgy1+ZIoV6
         8ITMsWx8PfEYiXmRhU8ibE33h13O0XQ2X27d23OFjoYbUedCmACS4sxbRKlq/e+jh7EA
         cnaEz8LPZ65VSOQ6a9GzCVSBsC4M8brmw5GDHIx2/mQF/WrrFIKaZ2HbLKGgaf1I0GQn
         8ZsYeIWt0PJJtFlCqwi2q14JWjdbWNPB7wYI3PttLfvis24/5M1FoaodBxpY8PMzQUS4
         gEaWbziB6OjAOgMfV8xEBdO/fEZKJn27ZP886G3QtRb1H/VX2WoPxhw0/e77v9QJ++ea
         WAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729070239; x=1729675039;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yztsizxjMpBcJQ63I4A8OaXSnNSjdmkpV8jlCXGDS8g=;
        b=JwVboIFOHU/tYBuu0IwUYEQF09NLOUI+DZ5FLruu2LvXbzQti7v5zeXUwi5c7dQixl
         YbVvOX+Gww0KjsiYT/zR1sDdB1PnNMMmiRHU2epmA80xa/oaKwwW4nJKvQsaRJGRMjhP
         calxGdMTOZG4avIy7p5IxncHXbl8l9c9ftE1T/SlQUA9gJvv8wJ1Qf5naRnEwZGEeVpr
         wsE4I2QCTbPsBdh09VB+SIiypqrnKwxISZx6jDe1Jj5hl87F9DYZH3KienXIwde09jZb
         KQpcL2Vlo2v7oYcHZrnf3izZbnqAMcB4ofZQU+ignXG52B5aMVc9qkfqf12eSQvN9ZcX
         DtZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYlWA9eL5r4i210vQgQXKypm3ctWbJvl0j8iMAZnTd98ihC99ur1aoEw4JAn1r5180hYUBoXVGJPyCLCpT@vger.kernel.org, AJvYcCXoh2zfXLfwERUtvCk+1hghxECyBiksf2nShXnCp51TWOR69xj7Vs8a+yKqAMCNh8yJDQdBNsjjmXRd@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg7gtrsxoc8RdvSBG2oaq43fUtbTe4AkXw8G5VMibtejAG21lp
	x2/jNUEBjhoMNzkOxZSZndVT/+NmtCzEvs5MHWuZWrJ2mACFQodf
X-Google-Smtp-Source: AGHT+IFHUHtctcmlBhWm39YPxI6Y+n7jeYOJzfnEs0mZ/hK6br/RmEiAXPd8ZQd4xDektg4rRLqAKg==
X-Received: by 2002:a17:903:41cd:b0:20b:7388:f74 with SMTP id d9443c01a7336-20cbb17d5f9mr233822005ad.12.1729070238902;
        Wed, 16 Oct 2024 02:17:18 -0700 (PDT)
Received: from rigel (60-240-10-139.tpgi.com.au. [60.240.10.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d17f844a5sm24892765ad.17.2024.10.16.02.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 02:17:18 -0700 (PDT)
Date: Wed, 16 Oct 2024 17:17:14 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 6/6] gpiolib: notify user-space about in-kernel line
 state changes
Message-ID: <20241016091714.GA207325@rigel>
References: <20241015-gpio-notify-in-kernel-events-v3-0-9edf05802271@linaro.org>
 <20241015-gpio-notify-in-kernel-events-v3-6-9edf05802271@linaro.org>
 <20241016051944.GA42100@rigel>
 <20241016072730.GA120095@rigel>
 <20241016083747.GB120095@rigel>
 <CAMRc=McR_eMizF6r30NqbgK4mE5ErzR=wbkD4O-Czn=+Oj4AXQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McR_eMizF6r30NqbgK4mE5ErzR=wbkD4O-Czn=+Oj4AXQ@mail.gmail.com>

On Wed, Oct 16, 2024 at 01:52:49AM -0700, Bartosz Golaszewski wrote:
> On Wed, 16 Oct 2024 10:37:47 +0200, Kent Gibson <warthog618@gmail.com> said:
> > On Wed, Oct 16, 2024 at 03:27:30PM +0800, Kent Gibson wrote:
> >> On Wed, Oct 16, 2024 at 01:19:44PM +0800, Kent Gibson wrote:
> >> > On Tue, Oct 15, 2024 at 12:56:18PM +0200, Bartosz Golaszewski wrote:
> >> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >> > >
> >> > > -	return gpio_do_set_config(guard.gc, gpio_chip_hwgpio(desc), config);
> >> > > +	ret = gpio_do_set_config(guard.gc, gpio_chip_hwgpio(desc), config);
> >> > > +	if (ret == 0) {
> >> > > +		/* These are the only options we notify the userspace about. */
> >> > > +		switch (pinconf_to_config_param(config)) {
> >> > > +		case PIN_CONFIG_BIAS_DISABLE:
> >> > > +		case PIN_CONFIG_BIAS_PULL_DOWN:
> >> > > +		case PIN_CONFIG_BIAS_PULL_UP:
> >> > > +		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> >> > > +		case PIN_CONFIG_DRIVE_OPEN_SOURCE:
> >> > > +		case PIN_CONFIG_DRIVE_PUSH_PULL:
> >> > > +		case PIN_CONFIG_INPUT_DEBOUNCE:
> >> > > +			gpiod_line_state_notify(desc,
> >> > > +						GPIO_V2_LINE_CHANGED_CONFIG);
> >> > > +			break;
> >> > > +		default:
> >> > > +			break;
> >> > > +		}
> >> > > +	}
> >> > > +
> >> > > +	return ret;
> >> > >  }
> >> >
> >> > Ah, the debounce - I forgot about that, and other features that cdev
> >> > might emulate.
> >> >
> >> > What happens if userspace requests a line with debounce that is
> >> > supported by hardware?  Seems to me we'll see both a LINE_REQUESTED and a
> >> > LINE_CONFIG_CHANGED when the line is requested.
> >> >
> >>
> >> This is problematic for me to test at the moment, as gpiosim doesn't support
> >> debounce. Any chance we could make that configurable?  Similarly drive.
> >>
> >> > Conversely, what if a config change impacts features that don't result in a
> >> > notification from gpiod_set_config(), like active low, or emulated
> >> > drive or debounce?
> >> >
> >>
> >> Bah, drive is emulated in gpiolib itself, so that should be fine.
> >>
> >> When changing config cdev always calls gpiod_direction_input/output(), so I
> >> think that covers the active low case.
> >>
> >> But I have a test taking a line from input to output|open_drain and I
> >> get two change events.  The first is the most interesting as it reports
> >> input|open_drain, the second then reports output|open_drain.
> >> That is due to gpiod_direction_output() calling gpiod_set_config() to
> >> set the drive, and later to set the direction, in that order.
> >> Given it will be setting the direction, it should inhibit the event from
> >> the drive setting?
> >>
> >
> > Ok, I oversimplified, it was actually
> >
> > input -> output|active_low|open_drain
> >
> > and
> >
> > input -> output|open_source
> >
> > fails the same way.
> >
>
> Does the following help?
>
> @@ -2830,7 +2860,7 @@ int gpiod_direction_output(struct gpio_desc
> *desc, int value)
>  			goto set_output_value;
>  		/* Emulate open drain by not actively driving the line high */
>  		if (value) {
> -			ret = gpiod_direction_input(desc);
> +			ret = gpiod_direction_input_nonotify(desc);
>  			goto set_output_flag;
>  		}
>  	} else if (test_bit(FLAG_OPEN_SOURCE, &flags)) {
> @@ -2839,7 +2869,7 @@ int gpiod_direction_output(struct gpio_desc
> *desc, int value)
>  			goto set_output_value;
>  		/* Emulate open source by not actively driving the line low */
>  		if (!value) {
> -			ret = gpiod_direction_input(desc);
> +			ret = gpiod_direction_input_nonotify(desc);
>  			goto set_output_flag;
>  		}
>  	} else {
>

That fixes the drive problems.

> >> Still haven't tested any debounce changes...
> >>
> >
> > Have now.
> >
> > input -> input|debounce
> >
> > does not report the debounce.  Only get the one event and it does not
> > contain any debounce.
> >
>
> You mean, you get a CHANGED_CONFIG event but the debounce value is not
> in the associated line info?
>

Correct.

Cheers,
Kent.

