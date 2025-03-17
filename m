Return-Path: <linux-gpio+bounces-17680-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE95A64F72
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 13:41:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68804188FC22
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 12:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BAE323BCF9;
	Mon, 17 Mar 2025 12:41:33 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22C923A9AA;
	Mon, 17 Mar 2025 12:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742215293; cv=none; b=N6yr1F/gyk39jHV4w1BfCtpzQGy6z3YPATFb9CSFfOyB2oGsLNC830v0NmVnzyw14sL4vFsbiS/6Utmpd5jP+YrGTF8b0LP6SZltyI1iJTIMxwZnJwNvJubHnc1fpBxMqm6T4NgdQZMgfTbTDx2zH9pvb7wgLutWRxXQkYfjewk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742215293; c=relaxed/simple;
	bh=NTIMa/JLkLsU+CMNlhQWrTBB6VsnbivcBYfYYl4V/44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBHpZooJ+2S1SQ+2jSCu5oVBEWDRDpyPK+6xApWOZRaTke9xVjtf9NXs3m/F5bBtd+hBQQVpFJBAqtxW03ikIPLtwFVOsG20A3h7iyXeqDXtDKckPAjXJxj366xqqO+waxH8bB2lAoQtRtZMDF659/K6UJKoOYUHq+Hmr8ADPOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 9FEFE3432D6;
	Mon, 17 Mar 2025 12:41:30 +0000 (UTC)
Date: Mon, 17 Mar 2025 12:41:20 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Alex Elder <elder@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, spacemit@lists.linux.dev,
	Conor Dooley <conor.dooley@microchip.com>,
	Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v3] pinctrl: spacemit: enable config option
Message-ID: <20250317124120-GYA1983@gentoo>
References: <20250218-k1-pinctrl-option-v3-1-36e031e0da1b@gentoo.org>
 <CAMuHMdV4xWLEuCvCC54GBfCdELE=QSHqaOyUPD-ezE0QLYRnVA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdV4xWLEuCvCC54GBfCdELE=QSHqaOyUPD-ezE0QLYRnVA@mail.gmail.com>

Hi Geert:

On 09:18 Mon 17 Mar     , Geert Uytterhoeven wrote:
> Hi Yixun,
> 
> Thanks for your patch, which is now commit 7ff4faba63571c51
> ("pinctrl: spacemit: enable config option") in v6.14-rc7.
> 
> On Tue, 18 Feb 2025 at 01:32, Yixun Lan <dlan@gentoo.org> wrote:
> > Pinctrl is an essential driver for SpacemiT's SoC,
> > The uart driver requires it, same as sd card driver,
> > so let's enable it by default for this SoC.
> >
> > The CONFIG_PINCTRL_SPACEMIT_K1 isn't enabled when using
> > 'make defconfig' to select kernel configuration options.
> > This result in a broken uart driver where fail at probe()
> > stage due to no pins found.
> 
> Perhaps this is an issue with the uart driver?
> I just disabled CONFIG_PINCTRL_RZA2 on RZA2MEVB (which is one of the
> few Renesas platforms where the pin control driver is not enabled by
> default, for saving memory), and the system booted fine into a Debian
> nfsroot.  Probe order of some devices did change, and "Trying to
> probe devices needed for running init" was printed.
> 
my problem was CONFIG_PINCTRL_SPACEMIT_K1 isn't enabled, result as
# CONFIG_PINCTRL_SPACEMIT_K1 is not set

for your case, is CONFIG_PINCTRL_RZA2 built as module? 
it should work for uart driver with deferred probe mechanism..

> > Fixes: a83c29e1d145 ("pinctrl: spacemit: add support for SpacemiT K1 SoC")
> > Reported-by: Alex Elder <elder@kernel.org>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Tested-by: Alex Elder <elder@riscstar.com>
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> 
> > --- a/drivers/pinctrl/spacemit/Kconfig
> > +++ b/drivers/pinctrl/spacemit/Kconfig
> > @@ -4,9 +4,10 @@
> >  #
> >
> >  config PINCTRL_SPACEMIT_K1
> > -       tristate "SpacemiT K1 SoC Pinctrl driver"
> > +       bool "SpacemiT K1 SoC Pinctrl driver"
> >         depends on ARCH_SPACEMIT || COMPILE_TEST
> >         depends on OF
> > +       default y
> 
> Ouch, fix sent...
> "[PATCH] pinctrl: spacemit: PINCTRL_SPACEMIT_K1 should not default to
> y unconditionally"
> https://lore.kernel.org/6881b8d1ad74ac780af8a974e604b5ef3f5d4aad.1742198691.git.geert+renesas@glider.be
> 
I got suggestion in v1
https://lore.kernel.org/all/20250211-nature-kilt-9882e53e5a3f@spud/

so for COMPILE_TEST case, ARCH_SPACEMIT config won't be enabled? then neither PINCTRL_SPACEMIT_K1
anyway, I'm fine with either way, thanks

> >         select GENERIC_PINCTRL_GROUPS
> >         select GENERIC_PINMUX_FUNCTIONS
> >         select GENERIC_PINCONF
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

