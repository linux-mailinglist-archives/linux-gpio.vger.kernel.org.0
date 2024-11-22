Return-Path: <linux-gpio+bounces-13201-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6459D608B
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2024 15:40:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9548BB2240A
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2024 14:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 763321442F6;
	Fri, 22 Nov 2024 14:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kk41hIxV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E7513632B;
	Fri, 22 Nov 2024 14:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732286137; cv=none; b=j8K6KaphYMBYyn3kdsFMfRoFnzIRdEAcH2twHEYBOOuZXF99itsWuOy5j8fcvZhfZjB1zWokxzq4fdNRWlQ22rqvqemwEt9WTkEs7em1diJ2xXfw3hF+4l9FJIDXVd7e8H7TnmyK0d+V8S9h4YR/Kxf6SvCxZpFpSNdqyRPLbXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732286137; c=relaxed/simple;
	bh=P3LpHamRarxbPekIwfEOuKQjsioKyb0VI61LrbiusJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LHXt/7M8izQuwROVOGTiuJLkEOilvFm4+i9zEkcLJxWcEfRRv6EM23Zw+B/95GMhZLJHhIo7S9WqzqNOAHrwWU6khhFpWjgwzqB1B780ytOrfKXtCFrkLfIIiuedhFn5vB6tsIYQlkZb99Yv6QhfHwsHlKqEdUVluKUljX5NrLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kk41hIxV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AD89C4CECE;
	Fri, 22 Nov 2024 14:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1732286136;
	bh=P3LpHamRarxbPekIwfEOuKQjsioKyb0VI61LrbiusJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kk41hIxVbqJi+HRvUxayl8qy4FydMVYORD+YncMsakBNAFYyJfpT76T5jLcN/DJzn
	 k5X4+fLtDEDUyLpF8dPpVUkaDqDYfO5sH776WqA+LWucQ0G1OF8HlmHnAUP5NIYyPw
	 WTP8gvTV6a2Edgu8k5sL0gk5uT8FbTMcA6Tw6OJA=
Date: Fri, 22 Nov 2024 15:35:10 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Kees Cook <kees@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, David Wang <00107082@163.com>,
	brgl@bgdev.pl, tglx@linutronix.de, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, geert@linux-m68k.org,
	linux-hardening@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH] Fix a potential abuse of seq_printf() format string in
 drivers
Message-ID: <2024112259-bagful-commend-89ff@gregkh>
References: <20241120053055.225195-1-00107082@163.com>
 <CACRpkdZ0zwn0908LDqrfQJtF7M-WRcKA4qdJdwSXZNzm0L47CA@mail.gmail.com>
 <202411201008.5262C14@keescook>
 <2024112031-unreal-backslid-0c24@gregkh>
 <8BEA1444-469F-4276-AB04-0CF7C324916D@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8BEA1444-469F-4276-AB04-0CF7C324916D@kernel.org>

On Thu, Nov 21, 2024 at 08:38:27PM -0800, Kees Cook wrote:
> 
> 
> On November 20, 2024 11:28:35 AM PST, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> >On Wed, Nov 20, 2024 at 10:12:40AM -0800, Kees Cook wrote:
> >> On Wed, Nov 20, 2024 at 08:35:38AM +0100, Linus Walleij wrote:
> >> > On Wed, Nov 20, 2024 at 6:31 AM David Wang <00107082@163.com> wrote:
> >> > 
> >> > > Using device name as format string of seq_printf() is proned to
> >> > > "Format string attack", opens possibility for exploitation.
> >> > > Seq_puts() is safer and more efficient.
> >> > >
> >> > > Signed-off-by: David Wang <00107082@163.com>
> >> > 
> >> > Okay better get Kees' eye on this, he looks after string vulnerabilities.
> >> > (But I think you're right.)
> >> 
> >> Agreed, this may lead to kernel memory content exposures. seq_puts()
> >> looks right.
> >> 
> >> Reviewed-by: Kees Cook <kees@kernel.org>
> >
> >Wait, userspace "shouldn't" be controlling a device name, but odds are
> >there are some paths/subsystems that do this, ugh.
> >
> >> To defend against this, it might be interesting to detect
> >> single-argument seq_printf() usage and aim it at seq_puts()
> >> automatically...
> >
> >Yeah, that would be good to squash this type of issue.
> >
> >> > >  drivers/gpio/gpio-aspeed-sgpio.c            | 2 +-
> >> > >  drivers/gpio/gpio-aspeed.c                  | 2 +-
> >> > >  drivers/gpio/gpio-ep93xx.c                  | 2 +-
> >> > >  drivers/gpio/gpio-hlwd.c                    | 2 +-
> >> > >  drivers/gpio/gpio-mlxbf2.c                  | 2 +-
> >> > >  drivers/gpio/gpio-omap.c                    | 2 +-
> >> > >  drivers/gpio/gpio-pca953x.c                 | 2 +-
> >> > >  drivers/gpio/gpio-pl061.c                   | 2 +-
> >> > >  drivers/gpio/gpio-tegra.c                   | 2 +-
> >> > >  drivers/gpio/gpio-tegra186.c                | 2 +-
> >> > >  drivers/gpio/gpio-tqmx86.c                  | 2 +-
> >> > >  drivers/gpio/gpio-visconti.c                | 2 +-
> >> > >  drivers/gpio/gpio-xgs-iproc.c               | 2 +-
> >> > >  drivers/irqchip/irq-gic.c                   | 2 +-
> >> > >  drivers/irqchip/irq-mvebu-pic.c             | 2 +-
> >> > >  drivers/irqchip/irq-versatile-fpga.c        | 2 +-
> >> > >  drivers/pinctrl/bcm/pinctrl-iproc-gpio.c    | 2 +-
> >> > >  drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 2 +-
> >> > >  drivers/pinctrl/pinctrl-mcp23s08.c          | 2 +-
> >> > >  drivers/pinctrl/pinctrl-stmfx.c             | 2 +-
> >> > >  drivers/pinctrl/pinctrl-sx150x.c            | 2 +-
> >> > >  drivers/pinctrl/renesas/pinctrl-rzg2l.c     | 2 +-
> >> > 
> >> > Can you split this in three patches per-subsystem?
> >> > One for gpio, one for irqchip and one for pinctrl?
> >> > 
> >> > Then send to each subsystem maintainer and CC kees on
> >> > each.
> >> > 
> >> > I'm just the pinctrl maintainer. The rest can be found with
> >> > scripts/get_maintainer.pl.
> >> 
> >> Oof. That's a lot of work for a mechanical change like this. Perhaps
> >> Greg KH can take it directly to the drivers tree instead?
> >
> >I can take it all, as-is, right now, if you want me to.  Just let me
> >know.
> 
> Yes, please do. I will send a patch for making seq_printf more defensive separately.

Great, now queued up, let's make sure 0-day is ok with it...

greg k-h

