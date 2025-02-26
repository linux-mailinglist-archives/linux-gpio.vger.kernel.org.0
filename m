Return-Path: <linux-gpio+bounces-16618-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C8BA45C6A
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 11:59:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F4AE163F9B
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 10:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F49920E70A;
	Wed, 26 Feb 2025 10:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OiwAoG3F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695CD24E01A
	for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2025 10:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740567536; cv=none; b=HPELKYCIAYLcSBtWYRm8lwqpzy19ZcpVEjeKkTH6IOw55vrtZ18oSlsDC3IxDZDt0AqAB9oPS/eQvwDRp05/B3TW4oCT4hlpwuJE63e+1fmX4fjvvQFsef2uF69fkZl+GH8gSYMGpBgjkvZSCditi0ooBHfYk3PhKTd7iFiBuQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740567536; c=relaxed/simple;
	bh=wQrTNXOaYvZZQfj2urkS0hNPEAm/KGL1zbtYXzrqddQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VhkgNVKT8wlsF08MYk/dKtBW7sP3ABJ6PtR5NnMTZaMtyxInvLcWj/BUdB3dCiDRA5ad70zuvAWP34xGLIq6WoVdI6XvwCUNGmB2Ee6llmzRgvk8o8zc9uK+2KoOrroMS/euE/JswwcTawgMOyLT+XeZcfMCmA1aOSYq/ghxl3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OiwAoG3F; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-220ec47991aso92491865ad.1
        for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2025 02:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740567533; x=1741172333; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7BXN2njMIOVKy5U58cU01R+hqwDE0YNBwpxVzVjFM+o=;
        b=OiwAoG3FyJkYP1iL6qCgRhOwU/dChf/th+K23aR8amQvbamQC0CpFfVh8LEel8SQJU
         NH8l6yaqr3otkfAiSOYjaibko0ENB017tHjAknePqgNZ/ISk3Gv2ncVoOWN9l7BkLt74
         qiopWpc1qoSF9GkBg+54+9lZuHvj3Q/Uo9amCogIXw0Li/CI7iVAKRdIasMYA8BGlY6D
         74gGDaMAv8tFrXnOBhxVD4BI0Eyvd0jwQPr8Ve3LV24SHqdKydmUyaOGJQnjcWspbMFN
         vyU7Xg05CuRqj5ufAOCtsecKZdOOTE4YBNmttpg8Kz/RmTYcUnbf3SbGCZsWcpeWmAxd
         jSgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740567533; x=1741172333;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7BXN2njMIOVKy5U58cU01R+hqwDE0YNBwpxVzVjFM+o=;
        b=FqqhVjvATnDb1qM3gDbZnJ3YqMdTpF/vW4pRi5YRB+neAresZQFYzKnm/IUUHbdypi
         q1TgZJQI2/hQS9f7UoeuGIgPg/31oKpphdI80/6YqjQrwT0YnSG9FqEl+JKGdc/gUZu2
         cC6XnFUlQDuW95Sun+VVttmVkwUWQxI+n7jKh/J8byLK8cJRQxzvZG3dr20bEd+jcDOa
         ePE2MBZIZzeIzX1P3nUoKj4U4vMK2F8rDEVY8Io7/29OAC8rlDwm0siyTEADHxfmG81a
         Hwi8dyIb635o5Vizu5IKdBCQ2FwAMr74Bxi4yQ/1da17n17aYv9QR92eBF7wXCJib/zt
         UAbg==
X-Forwarded-Encrypted: i=1; AJvYcCXZnD3SFQ0Mn5gi4nOixgGftAIpqKj+Ke1AGdIdBYjsbZaEDJBZuSaGyLi73cjea76vy3qIt1UgBETp@vger.kernel.org
X-Gm-Message-State: AOJu0YxMjC/jEx1S7YzNkcOgoVg9QSudnZT65NzMUDm7BwJzyymTByog
	eGYWSbtR2x3avOn2uI4Hg5dCiJiujT3jlKX6EqOnt9O8M8VEeqeX3YFJzQ==
X-Gm-Gg: ASbGncuLHMfF/RwQqqgEyLxgOdjrTSX+ieT7VXmt80/gZzoiOAtJLfJt7kjFWExWaKY
	cLho57mVWI1+qnbx4l5EnCeVir+mwGcqDvsgnGUXQQKGt/tPq5nbGkmGJCpAshxYLi/x3IMl7KD
	NYIJiczAcLoHXXuR48QL37Y1GpynfL7AcsKn2cx7W6YABYYDZd9Md/Jy4DeGjZDzhjUWbEJjAdE
	M030vh8FufSXjjOwpTpmAyTYwIb+pWF7oB0nyKYUP+WYGxA/xlYCdxIONweNQHasfAhBxf9PSoF
	nuwQcxZjhDPLLCQNv/3JyQZjDkwKijydDtBn64IEwH/lLkgH3w==
X-Google-Smtp-Source: AGHT+IHikSxDUI74+hTWMV2+32OE0GH5Is7+JWjjdXe2PGnwXJSZR5aFRgm2YXP7vCCvhST1OjpbQw==
X-Received: by 2002:a05:6a00:1808:b0:730:f1b7:9bc4 with SMTP id d2e1a72fcca58-7348bda7ee6mr4146145b3a.4.1740567533497;
        Wed, 26 Feb 2025 02:58:53 -0800 (PST)
Received: from rigel (27-32-83-166.static.tpgi.com.au. [27.32.83.166])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a7f8233sm3166808b3a.96.2025.02.26.02.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 02:58:52 -0800 (PST)
Date: Wed, 26 Feb 2025 18:58:47 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Jan =?iso-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>,
	Marek Vasut <marex@denx.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: Replacing global GPIO numbers in sysfs with hardware offsets
Message-ID: <20250226105847.GA127161@rigel>
References: <CAMRc=McUCeZcU6co1aN54rTudo+JfPjjForu4iKQ5npwXk6GXA@mail.gmail.com>
 <20250224014936.GA12854@rigel>
 <CAMRc=Md6_vhs452OM=u7MofSRwFgPNyVeAvkxZ-qULWQCufG8A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Md6_vhs452OM=u7MofSRwFgPNyVeAvkxZ-qULWQCufG8A@mail.gmail.com>

On Wed, Feb 26, 2025 at 10:23:37AM +0100, Bartosz Golaszewski wrote:
> On Mon, Feb 24, 2025 at 2:49 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> >
> > As it stands the user needs to search the gpiochipXYZs looking for the
> > matching label. It would be easier if the chip was identified in sysfs by
> > its label, rather than (as well as) its base address.
> > So no searching required.
> >
>
> TBH that's technically easy and backward compatible - just have a link
> named after the label pointing to the chip.
>
> > Aside: Speaking of which, once the global numberspace is removed does
> > exposing the base address serve any purpose?
> >
>
> Good point, at this point we'd have to switch to fully identifying
> chips by label and possibly the device name (gpiochipX, not
> gpiochip$BASE).
>

That works for me.  Though are chip labels quaranteed unique?

> > Similarly, it would be even simpler if the line could be exported by
> > name, so the user wouldn't need to pull magic chip labels and offsets out
> > of the air.
> > Though that would be a much more extensive change.
> >
> > Btw, I am well aware that line names are not guaranteed unique, so this
> > approach would only be viable/enabled (potentially on a line by line
> > basis) where they are - and that would provide some incentive for them to
> > be made unique downstream, if not in mainline.
> >
> > > Bart
> > >
> > > [1] https://fosdem.org/2025/schedule/event/fosdem-2025-5288-the-status-of-removing-sys-class-gpio-and-the-global-gpio-numberspace-from-the-kernel/
> >
> > My primary takeaway from your talk is that you are more of a thrill
> > seeker than I am comfortable with - making jokes about Rust in a
> > live forum - THAT is living on the edge ;).
> >
> > Wrt the Q&A at 19:42 - the Pi BCM driver with its module parameter and
> > "why only this one driver is allowed to have it and the others not" and
> > the suggestion that there be some flag that can be passed to the driver
> > to request persistence:  I don't like your answer - it conflates specifying
> > the default/safe state, generally defined at boot time, with an ability to
> > override that at runtime.
>
> Yeah I was taken by surprise, I wasn't aware of the RPi driver having
> this parameter.
>
> > Extending the driver API to allow the gpio_chip user to request that the
> > driver NOT reset an output to its default state when released seems like a
> > viable solution to me.  Am I missing something?
> >
>
> This is not that simple actually. struct gpio_chip has the .free()
> callack which leaves to the driver the freedom to do anything at
> release - including reverting the state or not. What and when should
> the core framework code do then? But I'm not saying no if we can have
> a good solution here.
>

That is exactly the point - the driver has the freedom to do whatever
once .free() is called.  What I am suggesting is that while the user has
the line requested they could set a flag, say via .set_config(), to request
the driver NOT to revert the line, but to leave it as is when freed.
That would stand until the next time the line is requested when the flag
would automatically be cleared.

It would be opt-in, so the driver would not have to support it.
And it could be exposed to userspace via a flag in the uAPI.

> > It also didn't address the fact that, even at FOSDEM, there are developers
> > out there that think that some drivers are getting special treatment.
> > In this case the Pi devs have pushed their own downstream solution
> > upstream to reduce their own maintenance burden.  And that was accepted as
> > it didn't conflict with anything in mainline.
> > There is nothing preventing other drivers doing the same, though no one
> > has AFAIAA.
> > Though the module parameter solution is rather crude - if we are going to
> > start touching all the drivers then why not address it via the API?
> >
>
> I don't know the history of this. It's a driver under drivers/pinctrl/
> and I was never Cc'ed on the patch that added it. I probably would
> have objected to doing it inside an individual module.
>

Actually you were on the cc list[1], as was I, but it was a pinctrl change
so you probably skimmed over it.
I only looked at it as the bcm caught my eye, and I'm somewhat familiar
with how the Pi devs addressed the gpioset persistence issue downstream.

I wasn't totally comfortable with the change either, certainly not as a
general solution, but it was contained to the module so I didn't object -
I figured either you or Linus would if it bothered you.

Cheers,
Kent.

[1] https://lore.kernel.org/linux-gpio/20240503062745.11298-1-wahrenst@gmx.net/

