Return-Path: <linux-gpio+bounces-21826-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A870CADF64D
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 20:54:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F4543A42E2
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 18:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14E912F49EA;
	Wed, 18 Jun 2025 18:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F3wLT3Jm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41953085C7;
	Wed, 18 Jun 2025 18:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750272869; cv=none; b=LYMXbwgBiWV3MBYh9XrWuARbZi2+RRcIDFPOXmhc68hidE1KsSxbCTaOS91f6+WAzJtPqEtuo5vDih7I8vgrlsdwtHjzRkWbKvp74qKwcXQF2EmXSUxHsRdJEFTQWFZtqGPZc4AQXNJilHfIPHWoDOxpAw+ZXsHjjdJHKupTHFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750272869; c=relaxed/simple;
	bh=QAiRtMLjN9yBvNArRlNZT/m5P2zBf7MsiMCxOQfzOa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MccLab/qlRONnhmV66b32D6BijlAZ0MQ0lThTl2NupQdP/R/mrTBZ5j7qNqO7t3drmDme52t2NzKsLlI2MhMBRL/bqAJ5mfpyW2jzROZe64jZUncmx7LgtXhXxbkLz+tOdtloIbzBc3f+IZcs1g2E8XUhTUqO0baM+s4lRIvxpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F3wLT3Jm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D35AC4CEE7;
	Wed, 18 Jun 2025 18:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750272869;
	bh=QAiRtMLjN9yBvNArRlNZT/m5P2zBf7MsiMCxOQfzOa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F3wLT3JmjiQGLndTsjHABR9CWBTjxX3cqdJzKBTTom2cVsIqxJcc6eMtzvI+asZD2
	 cTpAjilGjRJqNaCC23Y2RaPjJQDph3kflEo29w3uxdGLD6VG7v0xOoOOIvGPv9Yto3
	 Ckqz0cWoDVhO676OsuVjCienTx9dzjt//HoujtsbbO6f0BVndyDVY71Um8jLgW9Kqv
	 dm56wi6KVc5w3fRruCk/cpwV2+n/m2pNIpnsIMylSkqce45GFMSGY26OEkHn3CmaKW
	 8+4MyfsV0aBnThmGGEpv3Z1m14zWlXUt4LXlt5RGZC4iVXB5bWJ9a8wIAk1iztwxv4
	 6MoOOY2YYheiA==
Date: Wed, 18 Jun 2025 20:54:25 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH] platform: cznic: turris-omnia-mcu: Use new GPIO line
 value setter callbacks
Message-ID: <xov3tbnn7gcenyu4ud5vvdfmw6a67g276aws2clpfvk2l7jhbz@mj35nxxysw7y>
References: <20250618124319.19220-1-kabel@kernel.org>
 <CAMRc=MfdPc0T_6G7uRUW7BAjFaBQYFFs=u2NGKj29eJGSjRVCw@mail.gmail.com>
 <ge4wcqilbvc374fap2z5klrie6c6k5xwuwfbfrt6wbf2nvkt7u@hdskg6eilzcv>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ge4wcqilbvc374fap2z5klrie6c6k5xwuwfbfrt6wbf2nvkt7u@hdskg6eilzcv>

On Wed, Jun 18, 2025 at 08:47:33PM +0200, Marek Behún wrote:
> On Wed, Jun 18, 2025 at 03:20:15PM +0200, Bartosz Golaszewski wrote:
> > On Wed, Jun 18, 2025 at 2:43 PM Marek Behún <kabel@kernel.org> wrote:
> > >
> > > struct gpio_chip now has callbacks for setting line values that return
> > > an integer, allowing to indicate failures. Convert the driver to using
> > > them.
> > >
> > > Signed-off-by: Marek Behún <kabel@kernel.org>
> > > ---
> > 
> > What's going on with this patch? I sent it a few days ago, now you
> > just resent it without changes. Who should pick it up?
> 
> I didn't see any patch for this driver, only for gpio-moxtet (for which
> I sent R-b). Did I overlook it?

OMG I see it now. Sorry.

There is one difference, though. Your change makes omnia_gpio_set() return
-EINVAL on a GPIO that does not support output direction. I put -ENOTSUPP
there, since -ENOTSUPP is also returned by direction_input() and
direction_output() methods in this case.

I don't know if -EINVAL or -ENOTSUPP is more consistent, though. Feel free
to apply your version (you can also add my R-b tag).

Marek

