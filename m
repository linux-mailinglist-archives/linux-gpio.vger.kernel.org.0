Return-Path: <linux-gpio+bounces-11410-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9720F9A046E
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 10:38:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FACC285CB4
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 08:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E6F1FCC6D;
	Wed, 16 Oct 2024 08:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jvuo28JS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EC41F80C7;
	Wed, 16 Oct 2024 08:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729067876; cv=none; b=qKUzPyGbKoByBsPOuwIZpHfIC7MIl9XFS8OgpxWWBbvHhNjIZiExaCmY/nm5f/qF/4cnuuCZ8uJTDAEMBVPqW02z3dQDRrbeWfgn7HlPz61KEvGPHeQ7Stoi4jNTXZKpi+f0lKQWx3YC5EicLwG+aperFi6FVD4Ur3nxHRLzrV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729067876; c=relaxed/simple;
	bh=c5TCI52WZ1UkqBSS+3fWdnzPi9kTce9kHGsiuVEYKFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BDDUfHNWkD9GKFkrU1l5gInv3uHruDrpNchH85gK9POswa71GJsP1PFMpkp1SkBTw7UoTh4HmGJI5JwCqxHfE5nz5By7wQDv3t7hex2SK4G6ci4jqH9QaNkmIexbmw7anSOKUQVmtSAqWTSmbHTaUfa8nvv2LNRZzbViKTe7gQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jvuo28JS; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20ca388d242so34833635ad.2;
        Wed, 16 Oct 2024 01:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729067874; x=1729672674; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h7dUx8uVYzhcc/HdjOy6+GuHZEkQ6hWUSDri5b+dncQ=;
        b=jvuo28JSqWMxw+LlrGBhrc+D9cgVvX78qBNEEZ9W8GYcnCbeLWK0fZFtRuCwVBFDhe
         aBQ5RndZTh0nWHEWJtBvmL/AyYKhz5//n+eQzDvd7/2WwxcO82SnX0RC/ejuXiRkzg1s
         XYzoyBFEd7n5T71Lkz2pT0g4LA0sEmadoam8W9owFzqDZ447ZEDIqMuuRSQmIWyS93B9
         /BPqW7wnfIQP6sAsSOS0wTYyUUOLzjPkX8qrxLXnflPO342VYxZtC32h0amdOP923cB+
         +LTLKY4xqeeGPlKgTHcEWP4lqj03kGO4Y1HVfw1d9A9JzvvRcsEs1AP+JbNIrzQkspot
         sDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729067874; x=1729672674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7dUx8uVYzhcc/HdjOy6+GuHZEkQ6hWUSDri5b+dncQ=;
        b=hg/0kUGXdlXs43ai+dljz+xd3wdXXpwupiRDUjOlB/8r0DvM3nNSkxoo1yjvXPs2tY
         Ka/tyspDls+YB1AIQfkQBYa+S2yrChg/4Py5VAH4CLwvmJTzc8gvSw7YJofmGaw8Ry6Y
         3EPg9iXJzn4ozX0lLeErNPZYHoWMXZ4WHFNiTprBixlnIz6MaxH4r+Y3Dv7eWgbjiB6b
         iARzsohVjLHH45p/AMQYKn1UwVl0sBMI96tXh0Gepvjb1byGURDyW+eOzifXddHpCxSn
         BfcmYwyhgTvuNrjslilatw86vNbFizUacCL3COp3touXojZ7tc3fKMr5y/Xz5CklWBbq
         finw==
X-Forwarded-Encrypted: i=1; AJvYcCUtsNwnQbn+SFpRo6lgSuj0PKJhg1eun0lzgMz6S3msMnLDlEJEigvhgsuf10c+O2cOK9jTD0W68NFR@vger.kernel.org, AJvYcCXOI+1ho+DTC5u5x0WoZcBEqDgDX7zVuFE4O9/Xmy1mj5S1OpF95zKt95eeJu4o5WaurjbwyoBs8ZVyMkN2@vger.kernel.org
X-Gm-Message-State: AOJu0YxTrY0hvnsdAVF8AVwzDuQAIeHuqitmF4XM5Id8OJnr2qY1talH
	S1HhQ9EBJ4M+l0mfRTT7ozbhSQKsXmoHxEC3/0iy3NmymmDZxmT7caLI7g==
X-Google-Smtp-Source: AGHT+IFq1aq/ol1Wu9Snq74pTt9DvQ3mBwoUkUWtfHmQCgtrtvl5j/15i8oaFv+yBvPLaAjdfXrfRg==
X-Received: by 2002:a17:902:f60a:b0:20c:8cc4:cf1b with SMTP id d9443c01a7336-20cbb230570mr232880425ad.43.1729067874252;
        Wed, 16 Oct 2024 01:37:54 -0700 (PDT)
Received: from rigel (60-240-10-139.tpgi.com.au. [60.240.10.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d1803767csm23986295ad.147.2024.10.16.01.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 01:37:53 -0700 (PDT)
Date: Wed, 16 Oct 2024 16:37:47 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 6/6] gpiolib: notify user-space about in-kernel line
 state changes
Message-ID: <20241016083747.GB120095@rigel>
References: <20241015-gpio-notify-in-kernel-events-v3-0-9edf05802271@linaro.org>
 <20241015-gpio-notify-in-kernel-events-v3-6-9edf05802271@linaro.org>
 <20241016051944.GA42100@rigel>
 <20241016072730.GA120095@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016072730.GA120095@rigel>

On Wed, Oct 16, 2024 at 03:27:30PM +0800, Kent Gibson wrote:
> On Wed, Oct 16, 2024 at 01:19:44PM +0800, Kent Gibson wrote:
> > On Tue, Oct 15, 2024 at 12:56:18PM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > -	return gpio_do_set_config(guard.gc, gpio_chip_hwgpio(desc), config);
> > > +	ret = gpio_do_set_config(guard.gc, gpio_chip_hwgpio(desc), config);
> > > +	if (ret == 0) {
> > > +		/* These are the only options we notify the userspace about. */
> > > +		switch (pinconf_to_config_param(config)) {
> > > +		case PIN_CONFIG_BIAS_DISABLE:
> > > +		case PIN_CONFIG_BIAS_PULL_DOWN:
> > > +		case PIN_CONFIG_BIAS_PULL_UP:
> > > +		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> > > +		case PIN_CONFIG_DRIVE_OPEN_SOURCE:
> > > +		case PIN_CONFIG_DRIVE_PUSH_PULL:
> > > +		case PIN_CONFIG_INPUT_DEBOUNCE:
> > > +			gpiod_line_state_notify(desc,
> > > +						GPIO_V2_LINE_CHANGED_CONFIG);
> > > +			break;
> > > +		default:
> > > +			break;
> > > +		}
> > > +	}
> > > +
> > > +	return ret;
> > >  }
> >
> > Ah, the debounce - I forgot about that, and other features that cdev
> > might emulate.
> >
> > What happens if userspace requests a line with debounce that is
> > supported by hardware?  Seems to me we'll see both a LINE_REQUESTED and a
> > LINE_CONFIG_CHANGED when the line is requested.
> >
>
> This is problematic for me to test at the moment, as gpiosim doesn't support
> debounce. Any chance we could make that configurable?  Similarly drive.
>
> > Conversely, what if a config change impacts features that don't result in a
> > notification from gpiod_set_config(), like active low, or emulated
> > drive or debounce?
> >
>
> Bah, drive is emulated in gpiolib itself, so that should be fine.
>
> When changing config cdev always calls gpiod_direction_input/output(), so I
> think that covers the active low case.
>
> But I have a test taking a line from input to output|open_drain and I
> get two change events.  The first is the most interesting as it reports
> input|open_drain, the second then reports output|open_drain.
> That is due to gpiod_direction_output() calling gpiod_set_config() to
> set the drive, and later to set the direction, in that order.
> Given it will be setting the direction, it should inhibit the event from
> the drive setting?
>

Ok, I oversimplified, it was actually

input -> output|active_low|open_drain

and

input -> output|open_source

fails the same way.

> Still haven't tested any debounce changes...
>

Have now.

input -> input|debounce

does not report the debounce.  Only get the one event and it does not
contain any debounce.

Similarly

input -> input|edge|debounce

which exercises a different path through cdev.

Cheers,
Kent.

