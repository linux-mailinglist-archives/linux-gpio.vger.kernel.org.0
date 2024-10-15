Return-Path: <linux-gpio+bounces-11349-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2559D99E2BB
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 11:24:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D06FD1F24D99
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 09:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C91B21DAC9B;
	Tue, 15 Oct 2024 09:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BYgjyJ8q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70484185B47;
	Tue, 15 Oct 2024 09:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728984245; cv=none; b=SKNixRK/d4tnMcp1uG7FU0YDoKtwXgRh2GMfz2GyUYlJIeMS3d2lBqseIsuXIzJHACkxJ55axYKbcji3faHVqIwJuM84XGxfgF4Xn9oxoZkgIxuvllBg2PvKKMEn+ffS8nh06O8Ja1PoiXDLz+Rtz+AxtE0xzBK5OLwVMiUSYk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728984245; c=relaxed/simple;
	bh=7mzk939jh+CTGYOGvf7Zt38N8YK9/KBRbpM/2PRXOA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m7qXo+MAWsRGav1RnZ9Hy1OsFZaN7zmaPiHMEO8DILa9V6LY0RmwXBIfbrA6F6o+eku+jKsSfTyjIg9laDR78s58jl7yEdbWNltxiHbfY4UN6R5flYpFbcY5zTfBeZEN8OoLEpw7CWV/P5bgUc5GhG/QadqR+l4WcgrJX1Js6wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BYgjyJ8q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74621C4CEC6;
	Tue, 15 Oct 2024 09:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728984244;
	bh=7mzk939jh+CTGYOGvf7Zt38N8YK9/KBRbpM/2PRXOA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BYgjyJ8qbcCKE7oOVYBvgH5lLn8WiY+Z2fBOqaxzpZPGPbASOBIeB4mTN9B5lU/gX
	 Xb3ogt84d5PeGeY6YyyUwxds12FK81DxOcSgQ5Su0Ng8ka85GG/b7264YfcUPNJqJL
	 Q9yc0kpdlOYpEHSGaeevGtMpjdn5931k3Ih50kiU=
Date: Tue, 15 Oct 2024 11:24:01 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 1/2] driver core: class: expose the class kobject
Message-ID: <2024101559-spent-unpicked-fde4@gregkh>
References: <20241015-gpio-class-mountpoint-v2-0-7709301876ef@linaro.org>
 <20241015-gpio-class-mountpoint-v2-1-7709301876ef@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015-gpio-class-mountpoint-v2-1-7709301876ef@linaro.org>

On Tue, Oct 15, 2024 at 10:00:23AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Export the address of the /sys/class kobject to users that need to
> chain off of it by means other than calling register_class().

Ick, no.

> This will
> be used by the GPIO subsystem to provide a backward compatibility
> mount-point for the GPIO sysfs class once it's disabled.

Again, ick, no.

No "mount point" should be messing with sysfs, don't do that.

sysfs is a simple "if the file or directory is not there, don't worry
about it" type of interface (i.e. fixing the issues we had with /proc).
If a userspace tool can't find something there, then it should just
error out or move on.

Let's not allow anything to mount anything at /sys/class/ please, that
way lies madness for the next 40+ years.  If you want to drop a
userspace api, drop it, don't paper over it with something that you
can't drop either.

thanks,

greg k-h

