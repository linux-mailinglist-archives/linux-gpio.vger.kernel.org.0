Return-Path: <linux-gpio+bounces-15598-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04464A2D0CE
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 23:41:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25E6C18809E4
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 22:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C7791D958E;
	Fri,  7 Feb 2025 22:37:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4751D90DB;
	Fri,  7 Feb 2025 22:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738967833; cv=none; b=MoFg0qzxRKR1KoDYA78UfB/D2wFm1C1a7aPnkQgl6dqKessEEvbc/Dr+3Ik9eUxS3QolEOWNaMnlOEa2kpWcl0Ncs53/Lwyst2uTc0P5+9eyFHkWnuujHF8vPvOjD0TCMqrpBtevE9W63UQi66Sqc7WALPDNyPQsOfT3NKqJ974=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738967833; c=relaxed/simple;
	bh=S/tpQ3STB8+/87M4WfkqS1yWyucnvmjhKxobuJLNll0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c/InPVUarjcTNlAE6BD2eP2BFXPiH1Ev7U5GT5XAgVsLVUSSZs6xHHXs5Wc/h2snAkWl6txpLMXhwbe3S+wwxHCJQO0n8bBVNv6bRHduJ7WQkVOKbXdI7ogTOTQbw4vtsuSma+WpmyssiVzk/KNmTdApJ7zESPZt08b1di4pfS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [180.172.76.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 7A213342FDC;
	Fri, 07 Feb 2025 22:37:10 +0000 (UTC)
Date: Fri, 7 Feb 2025 22:37:05 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Alex Elder <elder@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH] pinctrl: spacemit: enable config option
Message-ID: <20250207223705-GYA7567@gentoo>
References: <20250207-k1-pinctrl-option-v1-1-e8a7e4d8404f@gentoo.org>
 <20250207-promenade-hazily-d7900cbc127e@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207-promenade-hazily-d7900cbc127e@spud>

Hi Linus Walleij:
 I think you won't mind if I take this patch through SpacemiT's SoC tree,
as it's fairly SpacemiT specific, right? anyway I'd appreciate if you
could give an ACK for this, thanks

Hi Conor:

On 16:49 Fri 07 Feb     , Conor Dooley wrote:
> On Fri, Feb 07, 2025 at 08:11:42PM +0800, Yixun Lan wrote:
> > Pinctrl is an essential driver for SpacemiT's SoC,
> > so let's enable it by default for this SoC.
> > 
> > The CONFIG_PINCTRL_SPACEMIT_K1 isn't enabled when using
> > 'make defconfig' to select kernel configuration options.
> > This result in a broken uart driver where fail at probe()
> > stage due to no pins found.
> > 
> > Fixes: a83c29e1d145 ("pinctrl: spacemit: add support for SpacemiT K1 SoC")
> > Reported-by: Alex Elder <elder@kernel.org>
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> > This should fix problem that CONFIG_PINCTRL_SPACEMIT_K1 is not enabled
> > when using make defconfig, thus fail to initilize uart driver which requst
> > pins during probe stage.
> > ---
> >  arch/riscv/Kconfig.socs          | 1 +
> >  drivers/pinctrl/spacemit/Kconfig | 1 +
> >  2 files changed, 2 insertions(+)
> > 
> > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > index 1916cf7ba450ec9958265de2ca41dc504d4d2f7c..17606940bb5239d0fdfc6b5aefb50eeb982d14aa 100644
> > --- a/arch/riscv/Kconfig.socs
> > +++ b/arch/riscv/Kconfig.socs
> > @@ -26,6 +26,7 @@ config ARCH_SOPHGO
> >  
> >  config ARCH_SPACEMIT
> >  	bool "SpacemiT SoCs"
> > +	select PINCTRL
> >  	help
> >  	  This enables support for SpacemiT SoC platform hardware.
> >  
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
thanks Conor

> > diff --git a/drivers/pinctrl/spacemit/Kconfig b/drivers/pinctrl/spacemit/Kconfig
> > index 168f8a5ffbb952cbeae3e3401c11149558e0a84b..aa3dea535def87ed75d86bc555b2b90643adbdea 100644
> > --- a/drivers/pinctrl/spacemit/Kconfig
> > +++ b/drivers/pinctrl/spacemit/Kconfig
> > @@ -7,6 +7,7 @@ config PINCTRL_SPACEMIT_K1
> >  	tristate "SpacemiT K1 SoC Pinctrl driver"
> >  	depends on ARCH_SPACEMIT || COMPILE_TEST
> >  	depends on OF
> > +	default ARCH_SPACEMIT
> 
> This is effectively just "default y", since ARCH_SPACEMIT is a
> dependency.
> 
right, this is the plan, it make sense to bundle this config to ARCH_SPACEMIT

> >  	select GENERIC_PINCTRL_GROUPS
> >  	select GENERIC_PINMUX_FUNCTIONS
> >  	select GENERIC_PINCONF
> > 
> > ---
> > base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> > change-id: 20250207-k1-pinctrl-option-de5bdfd6b42e
> > 
> > Best regards,
> > -- 
> > Yixun Lan
> > 



-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

