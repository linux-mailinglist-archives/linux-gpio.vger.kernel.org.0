Return-Path: <linux-gpio+bounces-15861-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3D1A3283D
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 15:18:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EDD247A2CE1
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 14:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C627D20FA89;
	Wed, 12 Feb 2025 14:17:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D641A5AA;
	Wed, 12 Feb 2025 14:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739369869; cv=none; b=dZfbkx5wpWx6XNrooO/uRM4V67d9zP0p8NkpZxI2YNOc0qZSa0cwQYJkNPJDwqBkpVh5rLfyRFxpJFzbCvhTJCpjsGS6K3ulLb6BTrPisYkhM2F7e6a4clvoqhEEkzliAludlCEQl5D12kAup6kVzbmuvP94pTX8K4azk15Uoo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739369869; c=relaxed/simple;
	bh=mJxBysoRgZGhkya7SXolEV5gKdR7CjNvQTnBQE2fKxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V+D8e3EC/YVekVAapmr3owww6ipX+a8RO+gN/jzTqorLIR8/qBNKFyp1shGg61F/2o5Sm92ig/DSBO/eZ60kUVcE66C7S3uibav+43Z8B/ee1zzKcIy/28V6e9S7OWbRYWZzUdR/TZJimMkxVx0IFuI4Wjf3hqYKKoeWAo/qFso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [180.172.76.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 0BBAF343065;
	Wed, 12 Feb 2025 14:17:46 +0000 (UTC)
Date: Wed, 12 Feb 2025 14:17:41 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Alex Elder <elder@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, spacemit@lists.linux.dev,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2] pinctrl: spacemit: enable config option
Message-ID: <20250212141741-GYA18065@gentoo>
References: <20250212-k1-pinctrl-option-v2-1-bde7da0bc0d9@gentoo.org>
 <b67abe31-5647-4450-b025-2bbacee5fa72@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b67abe31-5647-4450-b025-2bbacee5fa72@riscstar.com>

Hi Alex:

On 07:50 Wed 12 Feb     , Alex Elder wrote:
> On 2/12/25 2:27 AM, Yixun Lan wrote:
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
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Tested-by: Alex Elder <elder@riscstar.com>
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> 
> I just tested this version of the patch.  By default
> PINCTRL_SPACEMIT_K1 is "y".  But since it's tristate,
> perhaps it should be default=m so it's not built in
> for everyone.  Yixun I assume the K1 pinctrl driver
> actually *works* as a kernel module.
> 
in theory, making it built as module, it should work fine if all drivers
can handle "deferred probe" gracefully, but since pinctrl is an essential
 basic driver, I'd prefer to make it built-in ..

I didn't bother to change this module from tristate to bool,
as there is additional COMPILE_TEST option(maybe it want to test as module?)

> Anyway, I suggest this change to be a module; Conor
> should weigh in.  Either way is good for me, and I
> have tested both.
> 
no, I don't think making it as module is a good idea,

I can adjust this driver from tristate to bool if necessary,
also adjust to builtin_platform_driver() in driver..

let me know what you think

> Reviewed-by: Alex Elder <elder@riscstar.com>
> 
> > ---
> > This should fix problem that CONFIG_PINCTRL_SPACEMIT_K1 is not enabled
> > when using make defconfig, thus fail to initilize uart driver which requst
> > pins during probe stage.
> > ---
> > Changes in v2:
> > - set default as y
> > - Link to v1: https://lore.kernel.org/r/20250207-k1-pinctrl-option-v1-1-e8a7e4d8404f@gentoo.org
> > ---
> >   arch/riscv/Kconfig.socs          | 1 +
> >   drivers/pinctrl/spacemit/Kconfig | 1 +
> >   2 files changed, 2 insertions(+)
> > 
> > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > index 1916cf7ba450ec9958265de2ca41dc504d4d2f7c..17606940bb5239d0fdfc6b5aefb50eeb982d14aa 100644
> > --- a/arch/riscv/Kconfig.socs
> > +++ b/arch/riscv/Kconfig.socs
> > @@ -26,6 +26,7 @@ config ARCH_SOPHGO
> >   
> >   config ARCH_SPACEMIT
> >   	bool "SpacemiT SoCs"
> > +	select PINCTRL
> >   	help
> >   	  This enables support for SpacemiT SoC platform hardware.
> >   
> > diff --git a/drivers/pinctrl/spacemit/Kconfig b/drivers/pinctrl/spacemit/Kconfig
> > index 168f8a5ffbb952cbeae3e3401c11149558e0a84b..c18d879274e72df251e0bc82a308603ce23738bd 100644
> > --- a/drivers/pinctrl/spacemit/Kconfig
> > +++ b/drivers/pinctrl/spacemit/Kconfig
> > @@ -7,6 +7,7 @@ config PINCTRL_SPACEMIT_K1
> >   	tristate "SpacemiT K1 SoC Pinctrl driver"
> >   	depends on ARCH_SPACEMIT || COMPILE_TEST
> >   	depends on OF
> > +	default y
> >   	select GENERIC_PINCTRL_GROUPS
> >   	select GENERIC_PINMUX_FUNCTIONS
> >   	select GENERIC_PINCONF
> > 
> > ---
> > base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> > change-id: 20250207-k1-pinctrl-option-de5bdfd6b42e
> > 
> > Best regards,
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

