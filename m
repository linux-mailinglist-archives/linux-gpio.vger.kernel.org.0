Return-Path: <linux-gpio+bounces-11351-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0871299E2CC
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 11:30:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39CDC1C21B3E
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 09:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 901791DD880;
	Tue, 15 Oct 2024 09:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tP61n0UC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443E61B0137;
	Tue, 15 Oct 2024 09:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728984600; cv=none; b=J/AvSVAioGyStJ4Xn81FtsFra199S+UW9ozMuy2J7Qzdk1XcBMKpvYIjt6kYsaU3jTpCzL5I27mRKIddpK0iSysZhGbDljTyhiAvJ1gQ8GVgUtCAqfzFSAHgtP51w37CFVz0l3nsR5y8gUF/Y7+1Sz8cpdpSnVEvOBvSSYBV2ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728984600; c=relaxed/simple;
	bh=W/TkYHxrVnIc6my5zXTtl1l07XVKWx/k+ZOyI6nY7JU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G9AkPaIEmgy4qXmvePpEuDDSs4bm4XCGggqfuFRKH6ZwWT6CUkWG64kDDQcGY6QJXczLTHzQSpyivdKJYcxrYSsm1NQ0KzlDrtBGHZ0G2ov4Rcx85xJHua8wDunfmlGwKL180rdhrvL54408hNO1xKe/9YMzpIt53IX4QJMC8mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tP61n0UC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3216AC4CEC6;
	Tue, 15 Oct 2024 09:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728984599;
	bh=W/TkYHxrVnIc6my5zXTtl1l07XVKWx/k+ZOyI6nY7JU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tP61n0UCmDvkDYr88ehg2yHhb8z5YuWi8lRKMrQoG/5yLX2NWtd3oXF+0z5rW/1Fq
	 oARGcPqNojD6bG47UcuKJ2HltfSxOe1J3jZC4PlPjCMQTe4HPGvCqMd7UDwZA48f1r
	 E+Dv0g3Y6okAhs2z/Sa+Sv3LxpAmqzJHAAcT4tyU=
Date: Tue, 15 Oct 2024 11:29:56 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 0/2] gpio: create the /sys/class/gpio mount point with
 GPIO_SYSFS disabled
Message-ID: <2024101531-lazy-recollect-6cbe@gregkh>
References: <20241015-gpio-class-mountpoint-v2-0-7709301876ef@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015-gpio-class-mountpoint-v2-0-7709301876ef@linaro.org>

On Tue, Oct 15, 2024 at 10:00:22AM +0200, Bartosz Golaszewski wrote:
> Greg, Rafael,
> 
> The first patch in this series is small but may be seen as controversial
> so here's a little backstory.

Ah, now I see the 0/2 email...

> We have two sets of GPIO APIs currently in the kernel: the legacy one
> based on numbers and the modern one using descriptors. Our goal is to
> remove the old one from the kernel to which there are two obstacles: the
> first one is easier and consists of converting all remaining in-kernel
> users to the preferred API. This is tedious but it's all within our
> control, just demands a lot of effort. The second obstacle is much harder
> as it involves removing an existing kernel uABI that is the GPIO sysfs
> interface at /sys/class/gpio.
> 
> Despite providing a number of user-space tools making using the GPIO
> character device easier, it's become clear that some users just prefer
> how the sysfs interface works and want to keep using it. Unless we can
> provide a drop-in replacement, they will protest any attempts at
> removing it from the kernel. As the GPIO sysfs module is the main user
> of the global GPIO numberspace, we will not be able to remove it from
> the kernel either.

They should protest it's removal, and you should support it for forever,
as that's the api that they rely on and you need to handle.  That's the
joy of kernel development, you can't drop support for stuff people rely
on, sorry.

> I am working on a FUSE-based libgpiod-to-sysfs compatibility layer that
> could replace the in-kernel sysfs and keep all the user-space programs
> running but in order to keep it fully compatible, we need to be able to
> mount it at /sys/class/gpio. We can't create directories in sysfs from
> user-space and with GPIO_SYSFS disabled, the directory is simply not
> there.

Ick, no, just keep the kernel stuff please.

> I would like to do what we already do for /sys/kernel/debug,
> /sys/kernel/config, etc. and create an always-empty mount point at
> /sys/class/gpio. To that end, I need the address of the /sys/class
> kobject and the first patch in this series exports it.

No, debug and config are different, they are not "fake" subsystems, they
are totally different interfaces and as such, can use those locations as
mount points for their in-kernel filesystem interfaces.  You are wanting
a random userspace mount point, that's totally different.

Sorry, just live with the kernel code please.  Work to get all userspace
moved off of it if you feel it is so bad, and only then can you remove
it.

greg k-h

