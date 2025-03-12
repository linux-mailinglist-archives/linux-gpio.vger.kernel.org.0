Return-Path: <linux-gpio+bounces-17477-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9109AA5D7DD
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 09:09:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B37A1884427
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 08:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52C4C230BD0;
	Wed, 12 Mar 2025 08:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonic.nl header.i=@protonic.nl header.b="L0LqdTO7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp15.bhosted.nl (smtp15.bhosted.nl [94.124.121.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE12320C003
	for <linux-gpio@vger.kernel.org>; Wed, 12 Mar 2025 08:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.124.121.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741766921; cv=none; b=hClUTPL3mH/hh7eGeJWV+R7PAce9ScHMDfHe0zGoCxDPL1ZQfDn4gRNkqFH+mPQ5cJ8LzEGfeamD9eXN0FiMJqwxIllJFZIlzhDAjLNU/Za6b9yZ81jqDCitBMztxlY0ba9CZ/Q6jGwbhfMTzJLvLlo2kPGmh59a6J9YYM8xDC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741766921; c=relaxed/simple;
	bh=FpEhhkI8c7BI2Z6lsduabkQ7J35+wwRfmf1EoCFh4fw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=McTmnA3/RosOJSirU2j6vOickI95Mgh1LR9b7B7x5d/LPGw8w0uqMQ0hWNDEvEYO42+xyAi1EgO62kcHqgtrh2xNRIq96zeS4nnYLbDj3D+ZNWuVS0W8wzFUnwxhiFlYGf2/btPVlP4jjZ101K8GpVuc+qw313z70x1DzV/JAqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=protonic.nl; spf=pass smtp.mailfrom=protonic.nl; dkim=pass (2048-bit key) header.d=protonic.nl header.i=@protonic.nl header.b=L0LqdTO7; arc=none smtp.client-ip=94.124.121.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=protonic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonic.nl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=protonic.nl; s=202111;
	h=content-transfer-encoding:content-type:mime-version:references:in-reply-to:
	 message-id:subject:cc:to:from:date:from;
	bh=8bwWEGrJaKEtAP4w9gQVDnba3twzD8Qvfz5OXjGd88o=;
	b=L0LqdTO7a1++IbV4OvZeFXI+miitsQ9M9X944lXLyUosRFzkP2OdKIith/6lfpJiyCO4okrPAPsAk
	 pbiPryC7qUb2gboURPf7cEnlXvAU9leNMxdxB/QzuK4ljm1bXRzVdxHoRybLyl5MeHi9LWadpIYPdb
	 JYp3ehkeZoQmk1bXuabD6np5363ghBLX7nPUoscF7Z3eRzJMYlc7mV4VGtxQM+HCk/lmY7eay187wC
	 LfIA2d9MFo7+Vsa9SThsNwraD0yYVQbegzX5STkDgWP3EBOfzPX2WcAD0xTwgee/APm1onLmqSgGO/
	 TrZ+Yuf01FqgJkmlNzCRiEgab+c8/sA==
X-MSG-ID: 2f4c367f-ff19-11ef-a3a3-00505681446f
Date: Wed, 12 Mar 2025 09:08:29 +0100
From: David Jander <david@protonic.nl>
To: Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>, Linus Walleij <linus.walleij@linaro.org>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: regression: gpiolib: switch the line state notifier to atomic
 unexpected impact on performance
Message-ID: <20250312090829.5de823b7@erd003.prtnl>
In-Reply-To: <20250312013256.GB27058@rigel>
References: <20250311110034.53959031@erd003.prtnl>
	<CAMRc=MeWp=m1Bi_t_FCrxFOtiv3s8fSjiBjDk4pOB+_RuN=KGg@mail.gmail.com>
	<20250311120346.21ba086d@erd003.prtnl>
	<20250312013256.GB27058@rigel>
Organization: Protonic Holland
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 12 Mar 2025 09:32:56 +0800
Kent Gibson <warthog618@gmail.com> wrote:

> On Tue, Mar 11, 2025 at 12:03:46PM +0100, David Jander wrote:
> >
> > Indeed, it does. My application is written in python and uses the python gpiod
> > module. Even in such an environment the impact is killing.
> 
> Interesting - the only reason I could think of for an application
> requesting/releasing GPIOs at a high rate was it if was built on top of
> the libgpiod tools and so was unable to hold the request fd.

I didn't want to bother the list with the details, but this is during the
configuration phase of the application. It receives many configuration messages
for different IO objects at a fast pace. Most of those objects use one or more
GPIO lines identified by their label. So the application calls
gpiod.find_line(label) on each of them. Apparently libgiod (version 1.6.3 in
our case) isn't very efficient, since it will open and close each of the
gpiodev devices in order to query for each of the gpio lines. I wouldn't blame
libgpiod (python bindings) for doing it that way, since open()/close() of a
chardev are expected to be fast, and caching this information is probably
error prone anyway, since AFAIK user space cannot yet be informed of changes
to gpio chips from kernel space.

If this had been this slow always (even before 6.13), I would probably have
done things a bit differently and cached the config requests to then "find"
the lines in batches directly working on the character devices instead of
using gpiod, so I could open/close each one just once for finding many
different lines each time.

> Generally an application should request the lines it requires once and hold
> them for the duration.  Similarly functions such as find_line() should be
> performed once per line.

Of course it does that ;-)
This board has a large amount of GPIO lines, and like I said, it is during the
initial configuration phase of the application that I am seeing this problem.

> From a performance perspective, NOT having to re-request a line is
> considerably faster than requesting it - even with Bart's fix.
> 
> Is there something unusual about your app that requires the lines be
> released?

See above.

Best regards,

-- 
David Jander

