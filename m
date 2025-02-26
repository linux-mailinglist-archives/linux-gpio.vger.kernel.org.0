Return-Path: <linux-gpio+bounces-16606-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA91A459E1
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 10:24:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 759AB189120C
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 09:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F885383;
	Wed, 26 Feb 2025 09:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1Cm2rmaP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FC81DC997
	for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2025 09:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740561833; cv=none; b=mPQQWpeaPieDJpVgLwcRZ2OVXsJIA8IaM6RzsZoxVRvahUCUebszs6faGgZ+hLyXVKjJ9TMWUsMVA8oGFX8iyXra5HUe51Wh1IOPcYesEjaMluwq7WpCIaPnPcwEsGYasPNtd2gpqw8UKCp5XOoj/oCbDGgJ9TBxcbFCSdLEahI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740561833; c=relaxed/simple;
	bh=VU2DzTrseGgg/l/rje1lmukSvYAz0JN9eYMLIVkbMhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h6EQ201g9f5y5h3yDJXlBnU8ZqUxPQXONfvgE7/ei6AigpIKe6eoFzw2lIJZs83MpEFSmQDXYx2h5h8joQ6hPOVi8XfcfWWh2GipHCV8ryt7mSHnm0XF/vMNlzpITGujx21+YbFLSdvCqbUt9QoybF+mzVRVrvgmEQhu7poBJt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1Cm2rmaP; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5485646441cso1712954e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2025 01:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740561829; x=1741166629; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7MiW3D5vP17y07Zpl4AtJ9eXVmggqn5N25dd9hbfgU=;
        b=1Cm2rmaPBi7cC+VeZwnmyUa113fnTMFJc0bOzROLjNp1lUEBUkSJJCvviXuNjXwG1O
         F4f4nfaxhnagRW5HUwqysqaRgqHlQ5G5iyfeLFolDlsW+eYHjv1x96MaWhmxmQ9f5Nw0
         8zeiZOda45XrA9Krj7xdEObNF/Rtebc1r99Wy1ZDcE4kGp1AQViEtC9bvVXTEk3/YTWw
         IYuGlj2B78NwbLoJI7PWLyzYZ1Rbf99JeXTccNYHyCgdpvi0foXnmwGisymDQP2JJiuf
         0O/zKuP3u4naUKSOQTbE3lgQyinDmgLHZEdvK6FZwB89IQQ1zgeZ9sUt4b5D9blYyOF+
         mydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740561829; x=1741166629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i7MiW3D5vP17y07Zpl4AtJ9eXVmggqn5N25dd9hbfgU=;
        b=ia63MD8aPLys6YBQNuz9bZ6laDCh3Q4CJtCNgrVllfsrYVrWYeUif2uXMOOUec57bE
         s2XXn0EOjU9/BNoAEyxKr8rH2PxaSpTXVEkPNT6Ys5vP7DpVmrFNAnFw0b8CTcdtODNy
         zsU+FcEtXrwPm1VjzUEkm36/BOtn2Du3txkOxFWaoDqlCOTMqqUlSZnal/3Sj+0kOo7F
         GC0w13wS14fzQIhGPLahqD/XHxXkwN2cxcuSCZfMoTq1kNefR1Im61O2HnQEPRnSFr5o
         oMyw18iC2ClRAFwHNjHfjjztydARcA9o9TNFNIQYZGSbfDSXoDauPXxu2gK5h8s4KsLZ
         kZsg==
X-Forwarded-Encrypted: i=1; AJvYcCVWRSlNjjEVANxY4C3xyRKu/tNuYXWGHAE4NrsbsGG90A64OJKg463CYEDy3sJvI8m1jc42ubYSjDkd@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8V0U0nIjP1NVjJ7RGCGP66XNyNdW4AmD4Jl+FiOrRAs5k/CmV
	1tjddPR38AasNqe40iYLdmhUWVtQagvjVythzZRnkHJGjpg+G0lLvaSKOZoMc6MlWrjsAQtNIrx
	fZz22qvZUar/xq0ATB8Y06Tk/kvXSqcFb8DY89DuhMCM7Bc9tlOI=
X-Gm-Gg: ASbGncsCYuzNOu6zSf38CCG9VKyuwQxoMFf1Yz2Gcq55W7NFaRXS8CExLIDmvxxDjMK
	f21tNexPmGAD7PnQ2oVp3yBgg/UH7eMSdl2JSsb1fzAVqTtPur3dx7g5d2dT/Uis2DefmlA5ZNj
	k3JUHMux/GLIbP3oxrO4zYG+RGDNYtD8JhsC53
X-Google-Smtp-Source: AGHT+IERagHV3Rjgx5CMBSfP0jPmhOERBEl/5zKjI9QXDVW6CLlPV88Pqlpz22s7RWLWcNU4UOum0VUPVfUAeYCKLjA=
X-Received: by 2002:a05:6512:b8d:b0:545:2950:5360 with SMTP id
 2adb3069b0e04-548510d7323mr4207969e87.22.1740561828987; Wed, 26 Feb 2025
 01:23:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=McUCeZcU6co1aN54rTudo+JfPjjForu4iKQ5npwXk6GXA@mail.gmail.com>
 <20250224014936.GA12854@rigel>
In-Reply-To: <20250224014936.GA12854@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 26 Feb 2025 10:23:37 +0100
X-Gm-Features: AQ5f1JoJyIFCD18OTGPn5KYxTdEc1jh5h6-lwZf76dF7XHgqyy8yuPWTnCESJBM
Message-ID: <CAMRc=Md6_vhs452OM=u7MofSRwFgPNyVeAvkxZ-qULWQCufG8A@mail.gmail.com>
Subject: Re: Replacing global GPIO numbers in sysfs with hardware offsets
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2025 at 2:49=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> >
> > Please let me know what you think about it?
> >
>
> TBH, I think you will have trouble getting users to adopt it - they
> require a solution no more complex than what they already have or they
> will resist the change for as long as they possibly can.  So if you want
> them to migrate before removing the global numberspace then that will
> never happen.
>
> As it stands the user needs to search the gpiochipXYZs looking for the
> matching label. It would be easier if the chip was identified in sysfs by
> its label, rather than (as well as) its base address.
> So no searching required.
>

TBH that's technically easy and backward compatible - just have a link
named after the label pointing to the chip.

> Aside: Speaking of which, once the global numberspace is removed does
> exposing the base address serve any purpose?
>

Good point, at this point we'd have to switch to fully identifying
chips by label and possibly the device name (gpiochipX, not
gpiochip$BASE).

> Similarly, it would be even simpler if the line could be exported by
> name, so the user wouldn't need to pull magic chip labels and offsets out
> of the air.
> Though that would be a much more extensive change.
>
> Btw, I am well aware that line names are not guaranteed unique, so this
> approach would only be viable/enabled (potentially on a line by line
> basis) where they are - and that would provide some incentive for them to
> be made unique downstream, if not in mainline.
>
> > Bart
> >
> > [1] https://fosdem.org/2025/schedule/event/fosdem-2025-5288-the-status-=
of-removing-sys-class-gpio-and-the-global-gpio-numberspace-from-the-kernel/
>
> My primary takeaway from your talk is that you are more of a thrill
> seeker than I am comfortable with - making jokes about Rust in a
> live forum - THAT is living on the edge ;).
>
> Wrt the Q&A at 19:42 - the Pi BCM driver with its module parameter and
> "why only this one driver is allowed to have it and the others not" and
> the suggestion that there be some flag that can be passed to the driver
> to request persistence:  I don't like your answer - it conflates specifyi=
ng
> the default/safe state, generally defined at boot time, with an ability t=
o
> override that at runtime.

Yeah I was taken by surprise, I wasn't aware of the RPi driver having
this parameter.

> Extending the driver API to allow the gpio_chip user to request that the
> driver NOT reset an output to its default state when released seems like =
a
> viable solution to me.  Am I missing something?
>

This is not that simple actually. struct gpio_chip has the .free()
callack which leaves to the driver the freedom to do anything at
release - including reverting the state or not. What and when should
the core framework code do then? But I'm not saying no if we can have
a good solution here.

> It also didn't address the fact that, even at FOSDEM, there are developer=
s
> out there that think that some drivers are getting special treatment.
> In this case the Pi devs have pushed their own downstream solution
> upstream to reduce their own maintenance burden.  And that was accepted a=
s
> it didn't conflict with anything in mainline.
> There is nothing preventing other drivers doing the same, though no one
> has AFAIAA.
> Though the module parameter solution is rather crude - if we are going to
> start touching all the drivers then why not address it via the API?
>

I don't know the history of this. It's a driver under drivers/pinctrl/
and I was never Cc'ed on the patch that added it. I probably would
have objected to doing it inside an individual module.

Bart

