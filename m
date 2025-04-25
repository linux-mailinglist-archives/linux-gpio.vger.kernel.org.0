Return-Path: <linux-gpio+bounces-19316-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0B5A9CA1B
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Apr 2025 15:22:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B2359A2E4B
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Apr 2025 13:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9F7024A074;
	Fri, 25 Apr 2025 13:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UnwmJqpZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67403288A5;
	Fri, 25 Apr 2025 13:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745587356; cv=none; b=YmeeDckkO4I9Ai+cmIlaGlAA/aE30IXRnrKUwlxQe6R7XrMOJQieXC5DU5CSZVRQomUdrtWwFcE8JAisYDzuCMMe+j7WVGRWE/2TcDAxJqqeJ8xaeRAtPZBDNyPIeVS1sAxIHTtzKlYnFZgg48E21YpqVBfQu9I2Z56ccXj5awY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745587356; c=relaxed/simple;
	bh=Csu4kU53xYy8vIqw4BqzvpDFCe+FaWjgzttl9RTuU7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BPJTCU1+gg+T+OiwzUX/UkIIhjsc0PfzjCMD0Yc2M38mOf9xi4wn0hZlaML1tVzgOwklMD9cdd7XZc/qiHb5SrqE6K7TChd+AisuaZ/FrFswmy7zUqwwT8yGu4gg2z54AM8ScEncRAUydb4kot+AUCveDWAZvl/SHnIXWk+FBUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UnwmJqpZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F268C4CEE4;
	Fri, 25 Apr 2025 13:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745587355;
	bh=Csu4kU53xYy8vIqw4BqzvpDFCe+FaWjgzttl9RTuU7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UnwmJqpZ3Mpb0on/fQfoNEriirUddomsj8RAwg1ooWp3feHmVDBObHbt/AAdrG3KP
	 Dns0dNyS9de5hOCSztOXdS7JGnFtf4QQRm5GEBeL5lEqJdEhnTtdoIOZffwZVZ3SR2
	 jyNJTMVOb8EL9zolb6tFCrXp+xmRJ6JXTJBtVMZs=
Date: Fri, 25 Apr 2025 15:22:33 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Zijun Hu <quic_zijuhu@quicinc.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Raag Jadav <raag.jadav@intel.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 0/3] gpiolib: finish conversion to devm_*_action*()
 APIs
Message-ID: <2025042523-immovable-onyx-e648@gregkh>
References: <20250220162238.2738038-1-andriy.shevchenko@linux.intel.com>
 <aAfmBlE3ZXU65PQR@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAfmBlE3ZXU65PQR@smile.fi.intel.com>

On Tue, Apr 22, 2025 at 09:55:02PM +0300, Andy Shevchenko wrote:
> On Thu, Feb 20, 2025 at 06:20:25PM +0200, Andy Shevchenko wrote:
> > GPIOLIB has some open coded stuff that can be folded to the devm_*_action*()
> > calls. This mini-series is for that. The necessary prerequisites are here
> > as well, namely:
> > 1) moving the respective APIs to the devres.h;
> > 2) adding a simple helper that GPIOLIB will rely on;
> > 3) finishing the GPIOLIB conversion to the device managed action APIs.
> > 
> > The series is based on another series that's available via immutable tag
> > devres-iio-input-pinctrl-v6.15 [1]. The idea is to route this via GPIOLIB
> > tree (or Intel GPIO for the starter) with an immutable tag for the device
> > core and others if needed. Please, review and acknowledge.
> 
> Greg, I know you are busy, but do you have a chance to look at this and give
> your Ack if you are okay with the idea? The route is assumed to be via GPIOLIB
> tree.

Looks fine to me:

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

