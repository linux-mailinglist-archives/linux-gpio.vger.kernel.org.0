Return-Path: <linux-gpio+bounces-20264-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DA5ABA16F
	for <lists+linux-gpio@lfdr.de>; Fri, 16 May 2025 19:01:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 929C7522454
	for <lists+linux-gpio@lfdr.de>; Fri, 16 May 2025 16:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 099AB25290E;
	Fri, 16 May 2025 16:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QFh8V4J5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B3A250C1F;
	Fri, 16 May 2025 16:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747414711; cv=none; b=intNJBdUe0oMZ2isWQUvdhtczZb6OjhcB01mW5tOmIi/d6haWKd6ftHNtJDMnjTzWi4LHfD+/iMjYO8G6NlfRQ67R/+YOt1wwIcAQsUwjcWM1uyuNgGCm5u40rFVBgL9nA9KEJg73XpeLAra9i3kDj05sEI1nvv37OMPr4vFNh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747414711; c=relaxed/simple;
	bh=Pa+c9PjmCSQn92YhqXv2lH7ZolnhV1WRtgLkV1dHxEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ImFRsv4fYXcp3KG4pPF8ElzIANWCx3g9j1CIt9IFBb3Ke2U9lqnI6c4Tz9NvktMz+lSoj4AD6DWYg0M1sGmkLtRUWANWkyTErjCwQBN/vrshqJxZaQs3RWmgHL0ecr4xkRisKBLa8vetEBHFM2yz1x5M0siT4bU+iJE6GtfM92Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QFh8V4J5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33E7DC4CEE4;
	Fri, 16 May 2025 16:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747414711;
	bh=Pa+c9PjmCSQn92YhqXv2lH7ZolnhV1WRtgLkV1dHxEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QFh8V4J5d+PVqj45++VMM1hFYVo3lpvpUTjhcmGwPal8vrbshQD/l+ZaQiuPLT9M7
	 Cx0PuqGolLklI3eVRPk6j++cCUbtTpJpZpP2T6id61ONXuepxjgOwkv+P+AxM0NmpC
	 upONAZNF1Pb4gNWNZHjfnjR4Rpi6DyG1RKYU4A5u+7wEHgr3YI/8VblHQ4L3wAqh3r
	 2vXMMYt1ijY7+cEryP5su3lxAEAwA8felN/aJbe/LUKZ12cDyynjZS/IuojLnKFZWG
	 5CZBi17EvRk9d1q7o9RPGsy+5PzC2563taZ74ZsfUiuIyW+u7FBJH54lr1kABuSuGs
	 RFoDZZK0MjQLg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uFyOC-0000000062z-1mxn;
	Fri, 16 May 2025 18:58:28 +0200
Date: Fri, 16 May 2025 18:58:28 +0200
From: Johan Hovold <johan@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH] gpio: sysfs: add missing mutex_destroy()
Message-ID: <aCdutI4J6r5kjCNs@hovoldconsulting.com>
References: <20250516104023.20561-1-brgl@bgdev.pl>
 <aCckl9cC8fCBhHQT@hovoldconsulting.com>
 <CAMRc=Mf=xW6HFVYOOVS2W6GOGHS2tCRtDYAco0rz4wmEpMZhmA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mf=xW6HFVYOOVS2W6GOGHS2tCRtDYAco0rz4wmEpMZhmA@mail.gmail.com>

On Fri, May 16, 2025 at 02:32:54PM +0200, Bartosz Golaszewski wrote:
> On Fri, May 16, 2025 at 1:42 PM Johan Hovold <johan@kernel.org> wrote:
> >
> > On Fri, May 16, 2025 at 12:40:23PM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > We initialize the data->mutex in gpiod_export() but lack the
> > > corresponding mutex_destroy() in gpiod_unexport() causing a resource
> > > leak with mutex debugging enabled. Add the call right before kfreeing
> > > the GPIO data.
> >
> > No, there's no resource leak and it's perfectly fine not to call
> > mutex_destroy().
> 
> No, there's no leak but with lock debugging it still warns if the
> mutex is locked when it's being destroyed so the change still makes
> sense with a modified commit message.
> 
> > You can't just make shit up and then pretend to fix it...
> 
> There's no need for this kind of comment. You made your point clear in
> the first sentence.

Your claim that there's "a resource leak with mutex debugging enabled"
is is quite specific. Now I had to go check that no one had changed
something in ways they shouldn't have recently. But mutex_destroy()
still works as it always has, which you should have verified yourself
before sending a "fix" tagged for stable backport based on a hunch.

Johan

