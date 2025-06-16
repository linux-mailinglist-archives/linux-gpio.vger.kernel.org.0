Return-Path: <linux-gpio+bounces-21667-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A8BADB4E7
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 17:08:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B74B97A982A
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 15:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 329E720E310;
	Mon, 16 Jun 2025 15:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ncCrwldi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D239784039;
	Mon, 16 Jun 2025 15:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750086237; cv=none; b=mVSJ6VmE92MbyX3W3w7c5hl/fLYrJPUUW5S0RxtJ1grJzb4B20MvVdFn14St4AO0A4PKwe5qqcOUjxg0qH4bjWTaVxomu+e3sZLpT3PkLD/k+jQpb1k7ffa0O9TdZnYEvfEpbflW9xxx1Gl6LH+6eaMxdJQL233EwaUOHBdkiTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750086237; c=relaxed/simple;
	bh=Z1NVxtB6FWsUaP0Tts63iaOqkQo4XjWoxebAKiOjg/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rPnG7SUHkoHfa/DqCBTHGT7KeGvXz8U0qpMaMITvUI6A+k4y/OEHyPa9PMNbT3aJAxZqCAYcZkXnUCpi7IzpxEOf7nzLTjEDA/3LxDnCAtUYqLaFjA1N+DIRnclC5xzqMGM2uq6oQ6E+aZE+Qll1i/DSQr4Bd1nqe3VsbaaD5D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ncCrwldi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D093C4CEEA;
	Mon, 16 Jun 2025 15:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750086236;
	bh=Z1NVxtB6FWsUaP0Tts63iaOqkQo4XjWoxebAKiOjg/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ncCrwldi7KW2oR0BGna/HBIIAJv+ZAHCoEZKs/BPyn5/AoAX6SCi4QOiYwdfUhXDK
	 FvYkI2VE7Pi53zget0gbSimS3IiNE01ZriAjIc10bUcXNbMISKldm54Qislz5xWw1f
	 t47CTk8CTT7AkauDj92qs5EMcK6scec1Am7KlSq0juEFKe+cnu7xsAAkKXnZXx8TzS
	 9IXoFG9gUOcL9xgDdicFC5WOZ0S4TKm3GFmf77drUF6ZLUl4a04uBgm0QIiIsIygdf
	 IMMz13YeWwL0zt0oYXWq6XHO3ofduFutX9NUVepde1X3iycMWpig7Uv+Ub61MAfe9i
	 sp4gIvBdMMjRA==
Date: Mon, 16 Jun 2025 16:03:50 +0100
From: Simon Horman <horms@kernel.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux GPIO <linux-gpio@vger.kernel.org>,
	Linux MTD <linux-mtd@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>,
	Linux USB <linux-usb@vger.kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Corbet <corbet@lwn.net>,
	Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Felipe Balbi <balbi@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH] Documentation: treewide: Replace remaining spinics links
 with lore
Message-ID: <20250616150350.GC6918@horms.kernel.org>
References: <20250611065254.36608-2-bagasdotme@gmail.com>
 <20250613130753.GE414686@horms.kernel.org>
 <aEznrV9XoXNpYKwa@archie.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEznrV9XoXNpYKwa@archie.me>

On Sat, Jun 14, 2025 at 10:08:29AM +0700, Bagas Sanjaya wrote:
> On Fri, Jun 13, 2025 at 02:07:53PM +0100, Simon Horman wrote:
> > I am wondering if you considered also addressing
> > the spinics.net links in gadget-testing.rst.
> > They are the only other instances I see under Documentation.
> 
> I can't find on lore remaing spinics threads ([1], [2], [3]). These are all
> from 2012-2013 and somehow lore doesn't have linux-usb archive on that year.
> 
> Andrzej, Sebastian, what do you think?
> 
> Thanks.
> 
> [1]: https://lore.kernel.org/all/?q=s%3A%22f_phonet+with+SOCK_DGRAM%22
> [2]: https://lore.kernel.org/all/?q=s%3A%22pnxmit.c%2C+test+program%22
> [3]: https://lore.kernel.org/all/?q=s%3A%22usb%2Fgadget%3A+the+start+of+the+configfs+interface%22

Hi Bagas,

Thanks for the explanation.  Based on that I think this patch is fine.
And the remaining links can be updated in future if appropriate.

Reviewed-by: Simon Horman <horms@kernel.org>



