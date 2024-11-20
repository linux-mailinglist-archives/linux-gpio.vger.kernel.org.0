Return-Path: <linux-gpio+bounces-13165-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F34E9D428D
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2024 20:29:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24CCA2847AF
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2024 19:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB3681BBBE0;
	Wed, 20 Nov 2024 19:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GsoPQu08"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FC11E515;
	Wed, 20 Nov 2024 19:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732130940; cv=none; b=ONmEnKEyg+HCQZVirW+3XpanmBKPBi7TIhGkrt2afQqo2WNGVL7MfqskY0GRhZPYIHkKA5pTTf646w7CRVtOQQYu57fnLsp2cJitUpgZ0Y6Li3OAF2dYd5l88sSVHARiuc9BrwUieRpqvgDQTbuumBJA1y+PE+NV9mLqFUYzSxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732130940; c=relaxed/simple;
	bh=w5KoV6R4w3wkR2latglQmlbGuAhevxtjUG9G3471H8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Knemiky9WPvSS1wv8gyVZakQJOeuuKGmqrO9ToGEtc5iSaZc3Pq8DkH2WWKudeRV2dVaTig6vAjaQMkqMgd1dak3m5FwbceaGa22VCNzUuvXoi9igFiYIJYonLYEQwLbsn4smISumANWQpC8aD6hosNBJIDq+y1WUASayiiRdvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GsoPQu08; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC23CC4CECD;
	Wed, 20 Nov 2024 19:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1732130940;
	bh=w5KoV6R4w3wkR2latglQmlbGuAhevxtjUG9G3471H8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GsoPQu08sKOIENd2J52zwK3KbaYmjebGmVYO+HD+nqe0JmaExx3cuHjvMDfygboCi
	 nnTejj0q8KXfbiVAb3N6oli7CsI99/wr43oRL9dsEDnKjaAle6KmcPazzej1lHjGfm
	 qANOe/ElNqm61uu/Z64GbUtvjcmGwrJyAEG69lHM=
Date: Wed, 20 Nov 2024 20:28:35 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Kees Cook <kees@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, David Wang <00107082@163.com>,
	brgl@bgdev.pl, tglx@linutronix.de, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, geert@linux-m68k.org,
	linux-hardening@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH] Fix a potential abuse of seq_printf() format string in
 drivers
Message-ID: <2024112031-unreal-backslid-0c24@gregkh>
References: <20241120053055.225195-1-00107082@163.com>
 <CACRpkdZ0zwn0908LDqrfQJtF7M-WRcKA4qdJdwSXZNzm0L47CA@mail.gmail.com>
 <202411201008.5262C14@keescook>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202411201008.5262C14@keescook>

On Wed, Nov 20, 2024 at 10:12:40AM -0800, Kees Cook wrote:
> On Wed, Nov 20, 2024 at 08:35:38AM +0100, Linus Walleij wrote:
> > On Wed, Nov 20, 2024 at 6:31 AM David Wang <00107082@163.com> wrote:
> > 
> > > Using device name as format string of seq_printf() is proned to
> > > "Format string attack", opens possibility for exploitation.
> > > Seq_puts() is safer and more efficient.
> > >
> > > Signed-off-by: David Wang <00107082@163.com>
> > 
> > Okay better get Kees' eye on this, he looks after string vulnerabilities.
> > (But I think you're right.)
> 
> Agreed, this may lead to kernel memory content exposures. seq_puts()
> looks right.
> 
> Reviewed-by: Kees Cook <kees@kernel.org>

Wait, userspace "shouldn't" be controlling a device name, but odds are
there are some paths/subsystems that do this, ugh.

> To defend against this, it might be interesting to detect
> single-argument seq_printf() usage and aim it at seq_puts()
> automatically...

Yeah, that would be good to squash this type of issue.

> > >  drivers/gpio/gpio-aspeed-sgpio.c            | 2 +-
> > >  drivers/gpio/gpio-aspeed.c                  | 2 +-
> > >  drivers/gpio/gpio-ep93xx.c                  | 2 +-
> > >  drivers/gpio/gpio-hlwd.c                    | 2 +-
> > >  drivers/gpio/gpio-mlxbf2.c                  | 2 +-
> > >  drivers/gpio/gpio-omap.c                    | 2 +-
> > >  drivers/gpio/gpio-pca953x.c                 | 2 +-
> > >  drivers/gpio/gpio-pl061.c                   | 2 +-
> > >  drivers/gpio/gpio-tegra.c                   | 2 +-
> > >  drivers/gpio/gpio-tegra186.c                | 2 +-
> > >  drivers/gpio/gpio-tqmx86.c                  | 2 +-
> > >  drivers/gpio/gpio-visconti.c                | 2 +-
> > >  drivers/gpio/gpio-xgs-iproc.c               | 2 +-
> > >  drivers/irqchip/irq-gic.c                   | 2 +-
> > >  drivers/irqchip/irq-mvebu-pic.c             | 2 +-
> > >  drivers/irqchip/irq-versatile-fpga.c        | 2 +-
> > >  drivers/pinctrl/bcm/pinctrl-iproc-gpio.c    | 2 +-
> > >  drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 2 +-
> > >  drivers/pinctrl/pinctrl-mcp23s08.c          | 2 +-
> > >  drivers/pinctrl/pinctrl-stmfx.c             | 2 +-
> > >  drivers/pinctrl/pinctrl-sx150x.c            | 2 +-
> > >  drivers/pinctrl/renesas/pinctrl-rzg2l.c     | 2 +-
> > 
> > Can you split this in three patches per-subsystem?
> > One for gpio, one for irqchip and one for pinctrl?
> > 
> > Then send to each subsystem maintainer and CC kees on
> > each.
> > 
> > I'm just the pinctrl maintainer. The rest can be found with
> > scripts/get_maintainer.pl.
> 
> Oof. That's a lot of work for a mechanical change like this. Perhaps
> Greg KH can take it directly to the drivers tree instead?

I can take it all, as-is, right now, if you want me to.  Just let me
know.

thanks,

greg k-h

