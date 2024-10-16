Return-Path: <linux-gpio+bounces-11400-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C27E9A020A
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 09:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD58B1F23768
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 07:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B21C518CC02;
	Wed, 16 Oct 2024 07:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="A1/EmwXB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5041C4A0C;
	Wed, 16 Oct 2024 07:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729062147; cv=none; b=ioDLuIR8iyMWOlh8JRGSGGaBsET0QHbz9sjPvFIzZYehBfM2gse0uMZ/XeiG1u4KQBm7UkBbh4E2M+/5DqKmNKtNGR7EhaXYtqtLg5oeUYHNoLaA/Y8dy4WCUM5LSM8m8npEv++s2YAp7Jn+7hOed1FbP3v/8cmXOVSLuVSG0o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729062147; c=relaxed/simple;
	bh=oWbvTHvDdSDPaM+ZpWD850EhZTzS9EyrAwmDS4BJPQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dM0JXuahDO8RMgjLjJ/FK2l8Cds0I0yK8VFspuXeXenaRAPS5rCkeZffWQ84G6eTXSO5WKIHOZPvaQNxek/LaQt37T4NFVyHLZBaDI5IF9SjKEFICUDLOb4VXLd6SMyw48KOtcRGBM77d+DszCbzeE5aqXezn53PiESmT+ug2HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=A1/EmwXB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 497A4C4CEC5;
	Wed, 16 Oct 2024 07:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1729062146;
	bh=oWbvTHvDdSDPaM+ZpWD850EhZTzS9EyrAwmDS4BJPQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A1/EmwXBKBQ+XRwLpnQomU1kRWJjhiyCagSCW44KlXJXjXw3fhBYYKxWTomaxAV8j
	 oecLJJd642/SFdCa4dokYcwmAIPgR26OAGmYsn4DIYO3yRfuOS9VsiUcl0jPdak56z
	 jKKtgBWW63kN66QQBVtuKcgJths7ovvFhmiwhpuY=
Date: Wed, 16 Oct 2024 09:02:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 0/2] gpio: create the /sys/class/gpio mount point with
 GPIO_SYSFS disabled
Message-ID: <2024101611-extruding-overstock-4626@gregkh>
References: <20241015-gpio-class-mountpoint-v2-0-7709301876ef@linaro.org>
 <2024101531-lazy-recollect-6cbe@gregkh>
 <CAMRc=Mea=W-1UoHMew3Si=baW3ayERrHjxjG0NPdmkCfp9dUHw@mail.gmail.com>
 <2024101535-wrangle-reoccupy-5ece@gregkh>
 <CAMRc=MdsXggB9TUK-Rxt1GLZ9OA+3FskD1q3BM8TGbOhqmhXjg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdsXggB9TUK-Rxt1GLZ9OA+3FskD1q3BM8TGbOhqmhXjg@mail.gmail.com>

On Tue, Oct 15, 2024 at 07:52:53PM +0200, Bartosz Golaszewski wrote:
> On Tue, Oct 15, 2024 at 2:46 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Oct 15, 2024 at 02:11:45PM +0200, Bartosz Golaszewski wrote:
> > > On Tue, Oct 15, 2024 at 11:30 AM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > >
> > > > > Despite providing a number of user-space tools making using the GPIO
> > > > > character device easier, it's become clear that some users just prefer
> > > > > how the sysfs interface works and want to keep using it. Unless we can
> > > > > provide a drop-in replacement, they will protest any attempts at
> > > > > removing it from the kernel. As the GPIO sysfs module is the main user
> > > > > of the global GPIO numberspace, we will not be able to remove it from
> > > > > the kernel either.
> > > >
> > > > They should protest it's removal, and you should support it for forever,
> > > > as that's the api that they rely on and you need to handle.  That's the
> > > > joy of kernel development, you can't drop support for stuff people rely
> > > > on, sorry.
> > > >
> > >
> > > Yet every now and then some clearly bad decisions from the past are
> > > amended by removing support for older interfaces. I'm not trying to
> > > deprive people of something they rely on, I'm trying to provide a
> > > drop-in replacement in user-space using an existing, better kernel
> > > interface, so that we can get rid of the old one and - in the process
> > > - improve the entire in-kernel GPIO support.
> >
> > How is emulating the existing sysfs api anything "better"?  It's still
> > the same api.
> >
> 
> The existence of the sysfs API in the kernel makes us stick to some
> sub-optimal design decisions (like the global GPIO numberspace) that
> we'll be able to entirely remove once sysfs is gone. We want people to
> use the GPIO character device and if it takes a layer emulating the
> old API on top of it to make them switch then it's still better than
> keeping the API in the kernel.

How are you going to emulate the "global numberspace" in usersapce if
the kernel isn't exposing that?  Why can't you just do it in the same
way that you would in userspace here?

Again, the issue is "do not remove apis that userspace relies on".
That's all.  I'm going to add another one called "do not mount any
filesystem at /sys/devices/class/ as that is insane" as well :)

thanks,

greg k-h

