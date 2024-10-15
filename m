Return-Path: <linux-gpio+bounces-11361-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3838F99EA38
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 14:46:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F165428847F
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 12:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 996E51C07CD;
	Tue, 15 Oct 2024 12:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qkPKAipe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4684B1C07C2;
	Tue, 15 Oct 2024 12:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728996405; cv=none; b=HRdzqmMchjtab/tP13qtUVHPUCiWnZbSvipYIeH1H79923HMPg3vmnazUoBM3+hJK53MsjaLiLTpb6KPXiRzf2sWFmCylGx7lEb3lEsh/HUslSEGpZbubYMaq6MHmj3D0fRy/ulA0AAF/xgcUe35hHepaLb97DFSYonoZSfUXWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728996405; c=relaxed/simple;
	bh=SMWNDmBPfxChXtubJAJT+Pmtjs2xoVjbkxziJvEEtjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bc/qSR9Rr0jT9O6FQizuNx4matKIiqKcO4o6lbfNXTvHulw6iXJBNpNIhaYhgiXWGLUEpWAXc3VB3rJBp+307AeEd8uD3VPhJONlGXwfnHTcpYZMrZTIHrILXzvVEQnJjZxzupNggJvgdK+ds/0io1qSAoOQcCVWHP9Th51oBIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qkPKAipe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 566DAC4CECF;
	Tue, 15 Oct 2024 12:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728996403;
	bh=SMWNDmBPfxChXtubJAJT+Pmtjs2xoVjbkxziJvEEtjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qkPKAipewn7fmU0jFluCtKq1OcK37BhyoYFgXBh9V/ZwiM/6YYlhjj0oFGskIcaNt
	 rdBdXnG23cfCAbc9gNW0WLwmBpVmDo9AUXBDn1iZ7yMvYGv3aBXZPKIAUcn3F0NnW0
	 8fayhjcBbs++0VSj3w+NtQxBrspnp+vFFZm1tpSg=
Date: Tue, 15 Oct 2024 14:46:40 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 0/2] gpio: create the /sys/class/gpio mount point with
 GPIO_SYSFS disabled
Message-ID: <2024101535-wrangle-reoccupy-5ece@gregkh>
References: <20241015-gpio-class-mountpoint-v2-0-7709301876ef@linaro.org>
 <2024101531-lazy-recollect-6cbe@gregkh>
 <CAMRc=Mea=W-1UoHMew3Si=baW3ayERrHjxjG0NPdmkCfp9dUHw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mea=W-1UoHMew3Si=baW3ayERrHjxjG0NPdmkCfp9dUHw@mail.gmail.com>

On Tue, Oct 15, 2024 at 02:11:45PM +0200, Bartosz Golaszewski wrote:
> On Tue, Oct 15, 2024 at 11:30 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > >
> > > Despite providing a number of user-space tools making using the GPIO
> > > character device easier, it's become clear that some users just prefer
> > > how the sysfs interface works and want to keep using it. Unless we can
> > > provide a drop-in replacement, they will protest any attempts at
> > > removing it from the kernel. As the GPIO sysfs module is the main user
> > > of the global GPIO numberspace, we will not be able to remove it from
> > > the kernel either.
> >
> > They should protest it's removal, and you should support it for forever,
> > as that's the api that they rely on and you need to handle.  That's the
> > joy of kernel development, you can't drop support for stuff people rely
> > on, sorry.
> >
> 
> Yet every now and then some clearly bad decisions from the past are
> amended by removing support for older interfaces. I'm not trying to
> deprive people of something they rely on, I'm trying to provide a
> drop-in replacement in user-space using an existing, better kernel
> interface, so that we can get rid of the old one and - in the process
> - improve the entire in-kernel GPIO support.

How is emulating the existing sysfs api anything "better"?  It's still
the same api.

> > > I am working on a FUSE-based libgpiod-to-sysfs compatibility layer that
> > > could replace the in-kernel sysfs and keep all the user-space programs
> > > running but in order to keep it fully compatible, we need to be able to
> > > mount it at /sys/class/gpio. We can't create directories in sysfs from
> > > user-space and with GPIO_SYSFS disabled, the directory is simply not
> > > there.
> >
> > Ick, no, just keep the kernel stuff please.
> >
> 
> Ick? I'm not sure how to take it but are you criticising the idea
> itself of using the better kernel interface to provide a thin
> compatibility layer in user-space to the bad one that people are just
> too used to to spend time converting? Or just the mounting at the old
> mount-point part?

I'm saying "Ick" for a userspace mounted filesystem on top of sysfs to
emulate a sysfs api that the kernel provides today.

> > > I would like to do what we already do for /sys/kernel/debug,
> > > /sys/kernel/config, etc. and create an always-empty mount point at
> > > /sys/class/gpio. To that end, I need the address of the /sys/class
> > > kobject and the first patch in this series exports it.
> >
> > No, debug and config are different, they are not "fake" subsystems, they
> > are totally different interfaces and as such, can use those locations as
> > mount points for their in-kernel filesystem interfaces.  You are wanting
> > a random userspace mount point, that's totally different.
> >
> > Sorry, just live with the kernel code please.  Work to get all userspace
> > moved off of it if you feel it is so bad, and only then can you remove
> > it.
> >
> 
> What if we just add a Kconfig option allowing to disable the sysfs
> attributes inside /sys/class/gpio but keep the directory? It's not
> like it's a new one, it's already there as a baked in interface.

That's up to you, but again, please do not mount a filesystem there,
that's going to cause nothing but problems in the end (like debugfs and
tracefs and configfs do all the time when people get confused and start
poking around in sysfs code looking for the logic involved in other
places.)

thanks,

greg k-h

