Return-Path: <linux-gpio+bounces-13164-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A69B99D41E1
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2024 19:12:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C6CA28195E
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2024 18:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD9F81AB6FD;
	Wed, 20 Nov 2024 18:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hRYmQAyd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BB785C5E;
	Wed, 20 Nov 2024 18:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732126364; cv=none; b=UQFYjpVouBfm2mW4FAQjr9jXvhE0K26TYXJCsSNoNXZ0VBHZ409/R3TgghJo6ZP7y70efRn/FDrcD2EAXBmy9UZi3XgB/n5jsy3Se8szRygywFlVQUOSWRRYlpwpnzpKfOQUH/8oZxn4lhxq61jYOX4JOuwZhJ1EvPeYMeGfJ0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732126364; c=relaxed/simple;
	bh=S3W6OYUtc6RpBtlWvHHDwkqdYqpCpCp9r9LAEi9WpgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EtuF60OF2QlUNsPtFI6mBzLYqiWGTaV3t3oDi3rI46lvjNRRPjNcN056f3gXFYbEMCaLe+2X87BEw1RDCty8ROJbk3xSd9Jh9pDBXACHrov2K03gUPjjLX2+qvurq2wb2QgUIBx6h07m4Q08SFYVFN5qgDbyTk1zKfTFgZ2dzLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hRYmQAyd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4C9CC4CECD;
	Wed, 20 Nov 2024 18:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732126364;
	bh=S3W6OYUtc6RpBtlWvHHDwkqdYqpCpCp9r9LAEi9WpgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hRYmQAyd08GsbH/gLhyi8jau4DK5NSWw8MSsmUwUYNimAAXMHBP4W13Tkd9AnUXrd
	 oWt/XrM0p/F54/FqZWGb4FiGLxY/+79vAC1vMKxLMOr1OR3s2t7TMJrlV3XKvi2HoW
	 OGe48ZJlFgDz/2E5WWdrjhwV5A0uqFXxvEhtv5TdOLawkySjdyF9uQre1njHo+PhBX
	 kQKT4NxMGKF5z9VcMzcS8TE2h9lvtW3k0DgA10nzWkGOyNwS2APf+61tAcOaDeLg6a
	 iOfPywR0bWlvze1iMt2Y3ymGyJ9JniMcWLLpXlSOFRYT9IHr2aLgDIE6WH4OWLrESY
	 ZcqV/jCsuO42A==
Date: Wed, 20 Nov 2024 10:12:40 -0800
From: Kees Cook <kees@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: David Wang <00107082@163.com>, brgl@bgdev.pl, tglx@linutronix.de,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	geert@linux-m68k.org, linux-hardening@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH] Fix a potential abuse of seq_printf() format string in
 drivers
Message-ID: <202411201008.5262C14@keescook>
References: <20241120053055.225195-1-00107082@163.com>
 <CACRpkdZ0zwn0908LDqrfQJtF7M-WRcKA4qdJdwSXZNzm0L47CA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZ0zwn0908LDqrfQJtF7M-WRcKA4qdJdwSXZNzm0L47CA@mail.gmail.com>

On Wed, Nov 20, 2024 at 08:35:38AM +0100, Linus Walleij wrote:
> On Wed, Nov 20, 2024 at 6:31 AM David Wang <00107082@163.com> wrote:
> 
> > Using device name as format string of seq_printf() is proned to
> > "Format string attack", opens possibility for exploitation.
> > Seq_puts() is safer and more efficient.
> >
> > Signed-off-by: David Wang <00107082@163.com>
> 
> Okay better get Kees' eye on this, he looks after string vulnerabilities.
> (But I think you're right.)

Agreed, this may lead to kernel memory content exposures. seq_puts()
looks right.

Reviewed-by: Kees Cook <kees@kernel.org>

To defend against this, it might be interesting to detect
single-argument seq_printf() usage and aim it at seq_puts()
automatically...

> 
> >  drivers/gpio/gpio-aspeed-sgpio.c            | 2 +-
> >  drivers/gpio/gpio-aspeed.c                  | 2 +-
> >  drivers/gpio/gpio-ep93xx.c                  | 2 +-
> >  drivers/gpio/gpio-hlwd.c                    | 2 +-
> >  drivers/gpio/gpio-mlxbf2.c                  | 2 +-
> >  drivers/gpio/gpio-omap.c                    | 2 +-
> >  drivers/gpio/gpio-pca953x.c                 | 2 +-
> >  drivers/gpio/gpio-pl061.c                   | 2 +-
> >  drivers/gpio/gpio-tegra.c                   | 2 +-
> >  drivers/gpio/gpio-tegra186.c                | 2 +-
> >  drivers/gpio/gpio-tqmx86.c                  | 2 +-
> >  drivers/gpio/gpio-visconti.c                | 2 +-
> >  drivers/gpio/gpio-xgs-iproc.c               | 2 +-
> >  drivers/irqchip/irq-gic.c                   | 2 +-
> >  drivers/irqchip/irq-mvebu-pic.c             | 2 +-
> >  drivers/irqchip/irq-versatile-fpga.c        | 2 +-
> >  drivers/pinctrl/bcm/pinctrl-iproc-gpio.c    | 2 +-
> >  drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 2 +-
> >  drivers/pinctrl/pinctrl-mcp23s08.c          | 2 +-
> >  drivers/pinctrl/pinctrl-stmfx.c             | 2 +-
> >  drivers/pinctrl/pinctrl-sx150x.c            | 2 +-
> >  drivers/pinctrl/renesas/pinctrl-rzg2l.c     | 2 +-
> 
> Can you split this in three patches per-subsystem?
> One for gpio, one for irqchip and one for pinctrl?
> 
> Then send to each subsystem maintainer and CC kees on
> each.
> 
> I'm just the pinctrl maintainer. The rest can be found with
> scripts/get_maintainer.pl.

Oof. That's a lot of work for a mechanical change like this. Perhaps
Greg KH can take it directly to the drivers tree instead?

-Kees

-- 
Kees Cook

