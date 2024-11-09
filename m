Return-Path: <linux-gpio+bounces-12755-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 184549C2AE4
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Nov 2024 07:47:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C56D91F2252B
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Nov 2024 06:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4B213DDA7;
	Sat,  9 Nov 2024 06:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dominikbrodowski.net header.i=@dominikbrodowski.net header.b="m0Ck6tLN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from isilmar-4.linta.de (isilmar-4.linta.de [136.243.71.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EC046447;
	Sat,  9 Nov 2024 06:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.243.71.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731134866; cv=none; b=IBT/QyegqlluWfpRLe/XhGNNVOATm5YyiKAdVF3heE98QuaGBheaVxKX8SM7ob9hgOhnLqXhlLOs447PIk8svf/MikZ4YB/QJKRCj3A0/cpuce7eg5nzECgEl8vcuW4iSiGJgedtBRXPHL53YkCzp9S2+fs3xLb/e9sT+g4hMDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731134866; c=relaxed/simple;
	bh=m68XOFghE54ivU2dcmIYLk882k+HwPd8s6RJ2NuvOUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lkqOAWdSI+s2tqRO1b2QkOlFXPTvY7kZ2JT4EdgsQboqNe2Hrc1xJQVnn+wOlxefeEWUE+28guflX8FX0vO6fzgySABl5F3emDQtlUO9FqW3Ws7uWvQZ+daaXTKXwfkhOzKsKTBtHf7GzL1SdJtC7ZR3Bgc4PdXqtbhlKvyOBs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dominikbrodowski.net; spf=pass smtp.mailfrom=dominikbrodowski.net; dkim=pass (2048-bit key) header.d=dominikbrodowski.net header.i=@dominikbrodowski.net header.b=m0Ck6tLN; arc=none smtp.client-ip=136.243.71.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dominikbrodowski.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dominikbrodowski.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dominikbrodowski.net;
	s=k10.isilmar-4; t=1731134425;
	bh=m68XOFghE54ivU2dcmIYLk882k+HwPd8s6RJ2NuvOUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m0Ck6tLN37f+wQFu3UsQKdc+QFgC4L455vHgvRwEu/CVsrintIaqw0BGGgBpyMvdW
	 3KihegNFT/LSWiBGJHrh2x4bq2Tw/x8qpX2tSqHkcHUtNaZ4IJ2gQGC4GnUZTUiCLQ
	 r56r2k3qqEKDP0FwBJlQPXH7YxXcxu81/eip498VpxpX7p3tYsQfg0wB+5KyAZvFv+
	 5cuD7F/DteExPqXttlt9JrilrD6jrYzfKLgGkoZpUZzbqFgWkNrjt5d36ItgqB3Xx/
	 ncV2XBUlHYtqXvveXkMXoNho0jTuTbMH4TEpAUqHdct6wbuMCY+YILmbceORQa2Unv
	 BubNYu8gN0QBA==
Received: from shine.dominikbrodowski.net (shine.brodo.linta [10.2.0.112])
	by isilmar-4.linta.de (Postfix) with ESMTPSA id 03AE8200602;
	Sat,  9 Nov 2024 06:40:24 +0000 (UTC)
Received: by shine.dominikbrodowski.net (Postfix, from userid 1000)
	id B3D61A006B; Sat, 09 Nov 2024 07:40:15 +0100 (CET)
Date: Sat, 9 Nov 2024 07:40:15 +0100
From: Dominik Brodowski <linux@dominikbrodowski.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 4/6] pcmcia: soc_common: Avoid using GPIOF_ACTIVE_LOW
Message-ID: <Zy8Dz7v2cGdGOPLj@shine.dominikbrodowski.net>
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
 <20241104093609.156059-5-andriy.shevchenko@linux.intel.com>
 <CACRpkdYF-_6vb3SsJ9EHh1mCbqeW5=qoYkLF7Re+XyGq36OJSg@mail.gmail.com>
 <Zy3NXXFFw4l-vfvr@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zy3NXXFFw4l-vfvr@smile.fi.intel.com>

Am Fri, Nov 08, 2024 at 10:35:41AM +0200 schrieb Andy Shevchenko:
> On Fri, Nov 08, 2024 at 09:28:19AM +0100, Linus Walleij wrote:
> > On Mon, Nov 4, 2024 at 10:36 AM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > 
> > > Avoid using GPIOF_ACTIVE_LOW as it's deprecated and subject to remove.
> > >
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > 
> > Looks right to me, some testing would be even better
> > because I never trust these flags to get right.
> 
> I also would like to have this, but seems the only odd fixer was active ca.
> 2023 last time, I'm not sure we may hear from Dominik in time, otherwise the
> series will be postponed for unknown period of time, which I do not prefer,
> rather I will fix any regressions later (but I doubt there are here).

As I don't have such hardware, I cannot help with testing, but from the
PCMCIA point of view:

	Acked-by: Dominik Brodowski <linux@dominikbrodowski.net>

Thanks,
	Dominik

