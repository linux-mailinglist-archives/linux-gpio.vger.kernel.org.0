Return-Path: <linux-gpio+bounces-11408-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 885F39A028B
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 09:27:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA9811C22894
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 07:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47A6E1C07EA;
	Wed, 16 Oct 2024 07:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FfSxyeiS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77971BE871;
	Wed, 16 Oct 2024 07:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729063658; cv=none; b=umsujrSk9B44IA38CXQZGvxdKPBauIUMUsWbVzCUzXqzLS0Kdd3MysNA0MUQ+LwK6M0N/J5EPQW9cuxD7juADWpaDafOUiQ7kkGCD3877RjeeErWMHGmdVhcmiMPELfXR5zd3ENRzI13mCHtEGg0mrFfHsmv+5BJI8CV9HsFpfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729063658; c=relaxed/simple;
	bh=uap422286zWiWxsuCiR+KJeq/XyEPEi3vxi+T69rpoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ee1biMfNNsFz9KD+m+TYmqIuNrX3q3GczqkLffnvkvY8H21eSOiSgtT+5nPpSYQOfG4S70arQROYHvXIRNZ3/fKhRfkgxCemJ1u8kcYatTqgqOucyytpVqDaNUguA90EqWsqSROa+fkjgm4eOYdXw9U/pBoyVDxJRmrFP7VNDp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FfSxyeiS; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20ceb8bd22fso24036135ad.3;
        Wed, 16 Oct 2024 00:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729063656; x=1729668456; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qvcMjb9zqr+vpqKpHdzOOkiE8tGgp7Jw24G/OJ0HAoM=;
        b=FfSxyeiSWnGjwAbip2FyAaVJKB8Wa1grs2lGFWPnSaWsXHuvrbmTF0M7FuV3O/4EOz
         LZDqnx6zkAAFxXWQLvPp2OB/hkU2QblVWmgXOVXg6Z5I/bR7I7SaVzG2B8dOO8H3HUYH
         nFDo4saePHt1S5FhGWDc59ptVRoF7Wz/W0EMgHZ8kaE7P7oX13ltkpFaKZi0x8mGwiIj
         rGg75NZwf6y9V9s9odTn9C617CV7zFoS8aDwIW2PPyLaaTVd3aYjub1Hlg7nVKKd9E4z
         KKzsgZBXFtttJsT/CkuiwB7K5IJ7pGsq/VSCGfChfh3cqCNiylRtVgxj1nWQGjbf8870
         LPlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729063656; x=1729668456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvcMjb9zqr+vpqKpHdzOOkiE8tGgp7Jw24G/OJ0HAoM=;
        b=wjZEQly0hd7ywb9ta1KfGkbBlJD1CSIkpiP4P6aNeyBNrdsFprvmCy/MS2OBzL1dLs
         0e369pNBIPGSeYMdlI6LmZ3wwowhHt0FTK0AD+HFzBu2T9mdqBdgBZsW4Rr7eZSlVRpp
         fhLpojIG1BctmfHuPTsYc4ONVmNfbaHacXzdtPy7ju+/jHDB7s2vOjAYqJ/w2Hmv2Fxp
         Z7LEyEJpYB0JkVo7mMqAeLek3BlQxXiHWb6o6MApUo2ie+e1aDTV8Qd8kCv9VnagGiV+
         UYbNWfL2eFUCy3yESPf5pY+js66OtcAsJFPYZL9b3JDVhwTA9nYy2+pO0KaOnPOdjTG4
         hSYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLdd4HBQiDz7GfdWRX9J6qPbtA4pUZnRA1P89dUhoMv8RZg4dJ6+Q7lW1+U23DE3eqZbLyYGD0PmHiWs0l@vger.kernel.org, AJvYcCWSR38PufX82hx+oupk8zvzM52Jc2wmShrecIQc1q2Fnq3dTitMgFFB4qMdLvHauFzYdu2qDVxXeVM0@vger.kernel.org
X-Gm-Message-State: AOJu0YygO5ImZD7pcjJxcp1kETIGet+irqxmtSFy7wJhkfolI0sX7QBQ
	yiIVYos7Uy8oGU6ZR8giZhxo4cWlnbVQTeIDysDVaB5n9rRhrOhS
X-Google-Smtp-Source: AGHT+IFZQw+oq2nxz6UOhRjoj1bBBlnAw4t4aNpfcGoPbiQvLWHmNh3AsVMoQqVcMoEkNGOIWuvVpA==
X-Received: by 2002:a17:90b:314a:b0:2e2:8bce:3d02 with SMTP id 98e67ed59e1d1-2e31536e4dfmr18374001a91.30.1729063655943;
        Wed, 16 Oct 2024 00:27:35 -0700 (PDT)
Received: from rigel (60-240-10-139.tpgi.com.au. [60.240.10.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e392f039b7sm3344168a91.31.2024.10.16.00.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 00:27:35 -0700 (PDT)
Date: Wed, 16 Oct 2024 15:27:30 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 6/6] gpiolib: notify user-space about in-kernel line
 state changes
Message-ID: <20241016072730.GA120095@rigel>
References: <20241015-gpio-notify-in-kernel-events-v3-0-9edf05802271@linaro.org>
 <20241015-gpio-notify-in-kernel-events-v3-6-9edf05802271@linaro.org>
 <20241016051944.GA42100@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016051944.GA42100@rigel>

On Wed, Oct 16, 2024 at 01:19:44PM +0800, Kent Gibson wrote:
> On Tue, Oct 15, 2024 at 12:56:18PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > -	return gpio_do_set_config(guard.gc, gpio_chip_hwgpio(desc), config);
> > +	ret = gpio_do_set_config(guard.gc, gpio_chip_hwgpio(desc), config);
> > +	if (ret == 0) {
> > +		/* These are the only options we notify the userspace about. */
> > +		switch (pinconf_to_config_param(config)) {
> > +		case PIN_CONFIG_BIAS_DISABLE:
> > +		case PIN_CONFIG_BIAS_PULL_DOWN:
> > +		case PIN_CONFIG_BIAS_PULL_UP:
> > +		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> > +		case PIN_CONFIG_DRIVE_OPEN_SOURCE:
> > +		case PIN_CONFIG_DRIVE_PUSH_PULL:
> > +		case PIN_CONFIG_INPUT_DEBOUNCE:
> > +			gpiod_line_state_notify(desc,
> > +						GPIO_V2_LINE_CHANGED_CONFIG);
> > +			break;
> > +		default:
> > +			break;
> > +		}
> > +	}
> > +
> > +	return ret;
> >  }
>
> Ah, the debounce - I forgot about that, and other features that cdev
> might emulate.
>
> What happens if userspace requests a line with debounce that is
> supported by hardware?  Seems to me we'll see both a LINE_REQUESTED and a
> LINE_CONFIG_CHANGED when the line is requested.
>

This is problematic for me to test at the moment, as gpiosim doesn't support
debounce. Any chance we could make that configurable?  Similarly drive.

> Conversely, what if a config change impacts features that don't result in a
> notification from gpiod_set_config(), like active low, or emulated
> drive or debounce?
>

Bah, drive is emulated in gpiolib itself, so that should be fine.

When changing config cdev always calls gpiod_direction_input/output(), so I
think that covers the active low case.

But I have a test taking a line from input to output|open_drain and I
get two change events.  The first is the most interesting as it reports
input|open_drain, the second then reports output|open_drain.
That is due to gpiod_direction_output() calling gpiod_set_config() to
set the drive, and later to set the direction, in that order.
Given it will be setting the direction, it should inhibit the event from
the drive setting?

Still haven't tested any debounce changes...

Cheers,
Kent.

