Return-Path: <linux-gpio+bounces-28749-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2985AC6E909
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 13:47:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0E3D14FC708
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 12:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BC7E35A93B;
	Wed, 19 Nov 2025 12:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fLkqZoGL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31EF2BE04C;
	Wed, 19 Nov 2025 12:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763555476; cv=none; b=YyfwD3EUYNXi2dkfS17iQrZIqJwUMv03QBoa3p42wlScb1cquWD2MnEgHiVdc1z5lPzO80nhX/mMxYt8KFEXP6DRsDCVzzrg+BQQoUJtVWNvBhOIfkSSzaaNDWQN7wY/va2VaeHqY8cmn/ohrxO2TiYcD2mq6NqWmHXcrTypqZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763555476; c=relaxed/simple;
	bh=y/zzfLQSzl+5mUlGXQBEdG4Z8LaW4OaFwYbD1U+wIlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MzeJ0MP7MAKLzNHSMyeegOGIU34tPVS2Z7tmyU7KbBOd4If0Yn3Td7rBxpHpVKFWLIjIYdqDOpAkYvH37cohwlwtm1d0QUIibGW2hH2jd3wOQ98LGVvuInvfWjupqRbt9lvYUs9KG7fEAewEA7mnGka4ycxmdw6sG4PLM4jSA+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fLkqZoGL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C52DFC19423;
	Wed, 19 Nov 2025 12:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763555475;
	bh=y/zzfLQSzl+5mUlGXQBEdG4Z8LaW4OaFwYbD1U+wIlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fLkqZoGLIgXpBcwQZ+zxLz2CWU5EgT+NeN6La00otBX8dHSRAxXBAs9bPWfR9aIwJ
	 JT7Hze+QU66YEGFCYe3vS7dgVzHC7PtMHUUNchhw+kOzIIDhlXkD6aRw/sK3G7gLAQ
	 1ha5WvjyZnCeHhBTzY/9T3dqOKjgnIRf2zSt5fnFuyFAYVTXFnFIYV44gP0WEuQO9p
	 scq9XVRUAdtrCQR3CMOegR9ZUkqcZal0EHT0T1fqCiJBcHGDp7PPqVIBd6HGiHl7pC
	 bjWfEUmHBGovEcaZn4ozcyP2WrlVK8MxDvk3UaQfWLPHWvGxzteqc0yI6ZWyiw2uJ0
	 sEIcFG3K5vMWA==
Date: Wed, 19 Nov 2025 20:13:09 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] gpio: fxl6408: Add optional reset gpio control
Message-ID: <aR20VUP0RXnJj2pb@xhacker>
References: <20251117001502.12618-1-jszhang@kernel.org>
 <20251117001502.12618-2-jszhang@kernel.org>
 <CAMRc=Mdw73GddiJFx-+3Kk114Nq6ZsSfXQjD_Lf0_ta3=2iQxg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mdw73GddiJFx-+3Kk114Nq6ZsSfXQjD_Lf0_ta3=2iQxg@mail.gmail.com>

On Mon, Nov 17, 2025 at 11:01:47AM +0100, Bartosz Golaszewski wrote:
> On Mon, Nov 17, 2025 at 1:32 AM Jisheng Zhang <jszhang@kernel.org> wrote:
> >
> > Add optional active low reset-gpios pin control. If present, de-assert
> > the specified reset gpio pin to bring the chip out of reset.
> >
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> 
> This is covered by the bindings at gpio/trivial-gpio.yaml but the
> document does not describe a reset-gpios pin. This series doesn't add
> any users of it either. What platform do you want to use it on?

the platform hasn't been upstreamed, but you raise a good question, let
me drop this patch now. Will send out a v2.
> 
> Bartosz

