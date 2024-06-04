Return-Path: <linux-gpio+bounces-7096-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 874E78FA85C
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 04:43:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EAAD7B21899
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 02:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EAF313D2AB;
	Tue,  4 Jun 2024 02:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TjacSzjb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A622938B
	for <linux-gpio@vger.kernel.org>; Tue,  4 Jun 2024 02:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717469009; cv=none; b=sAWMGrQVQcVZ4qBzGoInei5yYoLmU0ElCakG8YpuvgKfVAb7zEzmnPwNoOQCFvSA/eVkPB6Xj+xeYrwkmahY9JewWLdShaplVSDZI+0qodvrmehuUgZsMY9IWmXvoGozGb7X0AHjhNmTQ7+bbrPEmZ/bfYSpPbHrJQhNPK3F+K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717469009; c=relaxed/simple;
	bh=UqrQnwUg/ifKXaC/+CS15+A5xn2Htk2fNi1ojSn6smM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FNVNOm6rViiFnvHgfnwBx/80H76LhToIA35JUVdDU37yS+snKcux6pT65KFsiyE7OMjCkDSsjX8jqb/Un73zFTfyLFf5WNHuETAijHfL+/xIfNUQ+MLCtEwGmuaTazveJFbi4hjki5DH3kzafyHPx/ZNd+t/4n/hpXIN8nbnzks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TjacSzjb; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3cabac56b38so404283b6e.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2024 19:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717469007; x=1718073807; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nusCAKlTHKXcUWrx3/edsA7PjjvcpqC7Y6/NwoZjyjM=;
        b=TjacSzjb7WENsrDGSljKAcAlJdo2zC0qDwL7IilicpkH+eRwnTDjsc1jKfz8P2dmlw
         Y5+bh//ozEy3dtB5XcdGZFiHM27ZDpqEIu5392kZL88eAnxR2MqwaEwkmmJAjYo/m82W
         o9lWRyNkCzq9qUQTLwR9XKimoHpWy1Nx0E3ahydjBNJ49ZKE8sGEBrQpklBfQbwNivFq
         dNVdlpXW7lFMZ0tVrtzJrdRMz7au7kzsc6H8LIF5h+xBtfRQ5HoZi8oRgrha3vTACBGp
         ut+9oEAsd59IfFQl9rdszIfHWnycPvY6gapln3rczayMpHNmJUMZPa9LQjBeDqSGT+m+
         PXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717469007; x=1718073807;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nusCAKlTHKXcUWrx3/edsA7PjjvcpqC7Y6/NwoZjyjM=;
        b=DBN5CDpJpgDq0mBFzXvHRy+cDgE5mCXQynMVkZBlM7+J45OMItYxJBN8lL1tBLr4ma
         GuJ5rL3QszB2RZtsFvKA1MgMhALPaQbuF3Zi7Ynoq13BtL5dTDWVO66t0nZZvCT2Nmc+
         gA5mMjWI2gK251fSdXu1L5pNj58wL82HSWRfR6YCBs3sLmCiIpCjwsEFJdKYV4K9JfuU
         fVlQEdhVtMVqAa18DeK/Ge//1Wj4cxp+jR2GOi5MVZpkGowgBQuNMzEjcM+llqhL2gLg
         lZzAj4pde2cvm/EFyNF71v3w5Xoqi1FmqxIdU4QCReNeW7KVRQu3q7XInef40cS5Zsuj
         oSiA==
X-Gm-Message-State: AOJu0Yxf19iJFxIwyVlm5j3I/5NqS5mZBzxBIbjgTKlQo4TenEodymJO
	f6/vnjOQp7KLxf4Ka5JFhBNqma0r2DU0GCZ3cJvoGtPcbmnJR+NdonSF9w==
X-Google-Smtp-Source: AGHT+IE9Q3cQRysWmHqWYlTcbEEHMwhXktwiEA+1Uz5kviLj4tAxicCcgN60lHZfw8oYPsyOYCngRQ==
X-Received: by 2002:a05:6808:19a6:b0:3d1:e17c:ef81 with SMTP id 5614622812f47-3d1e35b9f86mr12950589b6e.46.1717469006508;
        Mon, 03 Jun 2024 19:43:26 -0700 (PDT)
Received: from rigel (14-203-42-154.tpgi.com.au. [14.203.42.154])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70242b2c586sm6171763b3a.188.2024.06.03.19.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 19:43:26 -0700 (PDT)
Date: Tue, 4 Jun 2024 10:43:22 +0800
From: Kent Gibson <warthog618@gmail.com>
To: "David C. Rankin" <drankinatty@gmail.com>
Cc: linux-gpio@vger.kernel.org
Subject: Re: Documentation for line_config PULL_UP, effect on line_event
 edges and line_request values?
Message-ID: <20240604024322.GA45268@rigel>
References: <d82c276f-fade-4b23-9617-206c4cf0796e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d82c276f-fade-4b23-9617-206c4cf0796e@gmail.com>

On Mon, Jun 03, 2024 at 05:48:05PM -0500, David C. Rankin wrote:
> All,
>

Well hello again.

>   First post, so only shoot me once if the rational is documented somewhere.

rationale

> I've been working with the gpio_v2 uABI (fantastic piece of work), but I've
> run into a very confusing combination using gpio_line_get_values where the
> line is PULL_UP makes going down "RISING" and going up "FALLING" and a .bits
> value of 1 is for zero voltage and a value of 0 for normal line voltage. I
> think I've digested it correctly, but I'm wondering if there is a better way
> to handle this and whether the chardev.html doc should be updated to further
> explain this behavior?
>

Quite possibly - it is easy to overlook what you consider obvious when
documenting, like line values being logical, not physical.  That seems
to be the key point you are missing.

>   The confusing part comes from what is defined as "active" and what is
> defined as "inactive" when the line is active low, e.g.
>

Line values are logical, and the documentation uses the terminology
active/inactive to emphasise this throughout.  That applies to getting
and setting values, and the polarity of edges.  You will note the
documentation never uses the hi/lo terminology - as that indicates physical
values.

OTOH bias (pull) is always physical.  I've never seen it used otherwise.
A pull-up is always a bias towards Vdd, and a pull-down is a bias towards GND.
That is how it is defined in hardware, and that is independent of whether
a line is considered active low.

The ACTIVE_LOW flag controls the mapping between physical and logical.
When set, the logical is the inverse of the physical.  When cleared
physical and logical are the same.
The ACTIVE_LOW flag does not change how bias is interpreted - those are
always physical.  Having bias also change polarity would be even more
confusing - have you ever seen a pull-up on a schematic referred to as a
pull-down because the line is active low?

>  /* gpio_v2 line config, line request and line values, read defaults set */
>   struct gpio_v2_line_config linecfg = {
>                               .flags =  GPIO_V2_LINE_FLAG_ACTIVE_LOW      |
>                                         GPIO_V2_LINE_FLAG_INPUT           |
>                                         GPIO_V2_LINE_FLAG_EDGE_RISING     |
>                                         GPIO_V2_LINE_FLAG_EDGE_FALLING    |
>                                         GPIO_V2_LINE_FLAG_BIAS_PULL_UP,
>                               .num_attrs = 1 };
>
>   In this case the configured line_request is passed to a thread for reading
> where the interest is in both the edges and the line_values.
>
>   The documentation at
> https://docs.kernel.org/userspace-api/gpio/chardev.html is helpful, but it
> is silent on how the ...FLAG_ACTIVE_LOW/...PULL_UP basically inverts

It is just the ACTIVE_LOW flag.  And as you quote below, when the
ACTIVE_LOW flag is set "line active state is physical low".

Btw, if you are going to provide links then use references, with the link
itself at the bottom of your email e.g.[1].

> everything so that catching the ...FLAG_EDGE_RISING is actually the edge
> going from normal line voltage to zero (normally the falling edge of a
> waveform), how the value retrieved by gpio_line_get_values() then reports
> bit Hi (1) for the zero voltage state. The ...FLAG_EDGE_FALLING is then
> triggered when voltage goes from zero back to normal line voltage (normally
> the rising edge) and the value reported by gpio_line_get_values() is then Lo
> (0) at line voltage.
>

Does highlighting that line values are logical help?

>   The header gpio.h does provide more help. There the description of the
> attribute flags does indicate that rising will trigger on transition from
> (inactive to active) edges and falling will trigger on (active to inactive)
> edges, e.g.
>
> /**
>  * enum gpio_v2_line_flag - &struct gpio_v2_line_attribute.flags values
>  ...
>  * @GPIO_V2_LINE_FLAG_ACTIVE_LOW: line active state is physical low
>  ...

Yup, when that flag is set logical is the inverse of physical.
Not clear enough?

>
>  * @GPIO_V2_LINE_FLAG_EDGE_RISING: line detects rising (inactive to active)
>  * edges
>  * @GPIO_V2_LINE_FLAG_EDGE_FALLING: line detects falling (active to
>  * inactive) edges
>  ...

So that does not makes it clear that the edge definitions are based on
logical values?

>
>   Where there is a little ambiguity is in the comment for
> gpio_v2_line_values related to active/inactive .bits values. Taken together
> with the flags comment it's reasonably clear that active/inactive are as
> used in flags and not as commonly used (e.g. inactive - zero - low, active -
> non-zero - high). The comment reads:
>
> /**
>  * struct gpio_v2_line_values - Values of GPIO lines
>  * @bits: a bitmap containing the value of the lines, set to 1 for active
>  * and 0 for inactive.
>  ...
>

Again, logical values.

>   To make sure I was interpreting "active"/"inactive" and the effect on what
> is RISING and FALLING edge and .bits values I wrote a short program for the
> Raspberry Pi to catch the edges and values on button press and release and
> display the results. The results were indeed that the active RISING edge was
> the transition from line-voltage to zero, with a .bits value of 1 (Hi) for
> voltage zero, and on button release the inactive FALLING edge was the
> transition from zero to line-voltage with a .bits value of 0 (Lo) for line
> voltage.
>
>   (if interested the short test program and Makefile for the Pi are at https://github.com/drankinatty/pi-wo-root/tree/master/tst/gpio_v2_button_value)
>

Sorry, I haven't ipaid much attention to your code - it is easier and clearer
to use the libgpiod command line tools (gpioset/gpioget/gpiomon/gpioinfo)
for examples.  They support all the flag combinations you care to test.

If something isn't working the way you expect then an example using those
tools would be very helpful.

>   My questions are:
>
>  1. is there any thread or document squirreled away that contains a
> discussion of how this rational was arrived at?
>

Logical values are reported, not physical, to allow users to invert the
sense of active low lines.  And given that, logical values have to be
used throughout for consistency.

If you don't want that then don't set active low, so logical IS physical.

I doubt that warranted a detailed discussion.

>  2. should the documentation at
> https://docs.kernel.org/userspace-api/gpio/chardev.html be updated to add
> the behavior for "active"/"inactive" and what flag this is dependent on
> (PULL_UP, ACTIVE_LOW or BOTH?) If so, I'd be glad to take a crack at the
> write-up and pass it to whoever for review and revision. (just let me know
> who the right person is to send it to if interested) The chardev.html seems
> like the right place for it rather than having to also locate and read
> gpio.h to find "active" and "inactive" (especially for newer users using
> latest libgpio for Pi, etc.. based on gpio_v2)
>

To update the documentation you would edit the appropriate file(s) and
submit a patch to this list, as well as those indicated in the
MAINTAINERS list (you can use linux/scripts/get_maintainers.pl on your patch
to find them).

>  3. is the expected programming approach to query the line config so that
> the .bits values can be interpreted as either 1 (Hi or Lo), or 0 (Lo or Hi)?
>

You are coming from the Pi world so there is a good chance you have a set
and forget mindset, but that is not how it is intended to be used.

The approach is that YOU are expected to know how YOU configured the
flags for the line.  You have to configure the line as part of requesting
it - even if you only want to read it, so you definitely configured it.
Why did you forget?

And if you always want physical values then never set ACTIVE_LOW.

>  (I guess that was where the biggest confusion was -- that a .bits value 0
> didn't mean no voltage, and vice-versa)
>

Again, they are logical values, not voltages.

>   Don't take this as a knock on the implementation, I think gpio_v2 is a
> stroke of genius, especially the debounce, but rather these were the parts
> that really were a bit difficult to suss out of the documentation and it may
> be helpful to include further explanation in the chardev.html pages
> explaining this a bit further.
>
> NOTE Also:
>
>   Links for the lists in
> https://docs.kernel.org/process/submitting-patches.html under the "Select
> the recipients for your patch" heading still point to
> http://vger.kernel.org/vger-lists.html (Majordomo)
>

Not sure what your point is.  The MAINTAINERS list is the definitive place
to find the appropriate list - "The best place to look for mailing lists is
in the MAINTAINERS file packaged with the kernel source."[1].

That doc is itself part of the kernel documentation, so suggest a patch to
the appropriate list - it is out of the scope of this one.


I'll have another read of the GPIO documentation with this in mind and
see where logical/physical line values can be clarified.

Cheers,
Kent.

[1] https://docs.kernel.org/process/2.Process.html#mailing-lists

