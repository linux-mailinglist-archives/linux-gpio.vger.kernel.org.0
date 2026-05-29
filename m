Return-Path: <linux-gpio+bounces-37658-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4G8UKNU3GWrzswgAu9opvQ
	(envelope-from <linux-gpio+bounces-37658-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 08:53:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C5C5FE33F
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 08:53:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E776B3065A2D
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 06:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6CD936A365;
	Fri, 29 May 2026 06:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CutkgRmh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CAA3AA510;
	Fri, 29 May 2026 06:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780037405; cv=none; b=GuXschoKycJd6omqfVSz1N4oMwxi6AOkuiwsxiSeZIPY19xgTJunv/GmJ9woW+XP1MzPGzkgK6sdlDschF5wT0sE11B70sgqSFaRHsLT2bVqa2j8Sqm7uB5yqCOiQF1Tpd/JrqIe1Y7XgLs5OOq4U+YHcQ/DR5SVr70eVgO6iFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780037405; c=relaxed/simple;
	bh=5T+rAD/Mayv5NUYhuNFMdMbiadnQIePXWKsFidmBh/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oSP+Isan6jr33GpxFWXO/Pn2ItUeiB+0MEJhNmH6+Z4MRHRAbxz1rbZ4dogGsJZEsRbwRvCAlUK0g1v9chW4Tz73xN/sEt0TDNJBxwFxbw83xP8LlDoG+rBzzVCd82wrajTjC/zIbIu9X5hmD42jRg8WECh32LnsLNvDCP8ICGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CutkgRmh; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A2A1F00893;
	Fri, 29 May 2026 06:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780037404;
	bh=r1VXBQolH9n4v7TjEVBXIv3XIfE+zzKBxA2kgFL60r0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=CutkgRmhdEYf4HQ/shwyeH9rVmWmCWHf/ctVELIqliWB4LPG7dcZLie8SVnOymyU9
	 yqcu4fX96GoTLLN65XUKKaENHT6VFg5vU2tLwg8rqxRUTX5lHJTuHyz+Q4XKnebDwn
	 MIki8O4aOSaVtAKIFbpcEL8MaCmevdaYvjUFFTPCilz0Ku1v5+ubqR3HYLiTOjHjfc
	 dJAargVvHU4V+UAJn0IxcDjamtJByKKFTWqA7zB13brwA6sSnJkL3O7Fzuf1vJxk9k
	 ae/pu0GXlNW8tvrtJMsdFTCfW9hjvfMAIog6qK4LpAqDUe8EiNjfBZsuDE4kBkH2Ar
	 BcnFnd/UxHQHw==
Message-ID: <cc236562-3967-4361-ad92-05582db82282@kernel.org>
Date: Fri, 29 May 2026 08:49:57 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: move ppc4xx gpio driver from arch/powerpc to
 drivers/gpio
To: Rosen Penev <rosenp@gmail.com>, linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <20260528025610.713514-1-rosenp@gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260528025610.713514-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37658-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,disroot.org:email]
X-Rspamd-Queue-Id: A8C5C5FE33F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



Le 28/05/2026 à 04:56, Rosen Penev a écrit :
> Move the ppc4xx gpio driver out of arch/powerpc/platforms/44x/ into
> drivers/gpio/gpio-ppc4xx.c. The driver has no architecture-specific
> dependencies and follows the same pattern as other PowerPC GPIO
> drivers already in drivers/gpio/ (e.g. gpio-mpc8xxx, gpio-mpc5200).
> 
> - Renamed Kconfig symbol from PPC4xx_GPIO to GPIO_PPC4XX
> - Updated ppc44x_defconfig and warp_defconfig to use the new symbol
> - Marked the new option as tristate (was bool) since the driver
>    supports module build via module_platform_driver()
> - Added COMPILE_TEST support. Needs PPC as clrbits32 is in use.

Not only clrbits32() but also setbits32() and in_be32().

On the long run we want to get rid of PPC specific IO helpers, at least 
outside arch/powerpc/ , so don't add new instances.

Remove that dependency by switching to ioread32be() which has been 
equivalent to in_be32() since commit 894fa235eb4c ("powerpc: inline 
iomap accessors"), then implement a local equivalent of 
clrbits32()/setbits32()

See for instance:
- qe_setbits_be32() in include/soc/fsl/qe/qe.h
- tsa_clrbits32() in drivers/soc/fsl/qe/tsa.c

> 
> Assisted-by: OpenCode:BigPickle
> Signed-off-by: mangix <mangix@disroot.org>

Who is that ?

> ---
>   arch/powerpc/configs/44x/warp_defconfig                    | 2 +-
>   arch/powerpc/configs/ppc44x_defconfig                      | 2 +-
>   arch/powerpc/platforms/44x/Kconfig                         | 7 -------
>   arch/powerpc/platforms/44x/Makefile                        | 1 -
>   drivers/gpio/Kconfig                                       | 7 +++++++
>   drivers/gpio/Makefile                                      | 1 +
>   .../platforms/44x/gpio.c => drivers/gpio/gpio-ppc4xx.c     | 0

Not gpio-ppc4xx.c but gpio-ppc44x.c

>   7 files changed, 10 insertions(+), 10 deletions(-)
>   rename arch/powerpc/platforms/44x/gpio.c => drivers/gpio/gpio-ppc4xx.c (100%)
> 
> diff --git a/arch/powerpc/configs/44x/warp_defconfig b/arch/powerpc/configs/44x/warp_defconfig
> index 5757625469c4..380fa15af68d 100644
> --- a/arch/powerpc/configs/44x/warp_defconfig
> +++ b/arch/powerpc/configs/44x/warp_defconfig
> @@ -12,7 +12,7 @@ CONFIG_MODULE_UNLOAD=y
>   # CONFIG_BLK_DEV_BSG is not set
>   # CONFIG_EBONY is not set
>   CONFIG_WARP=y
> -CONFIG_PPC4xx_GPIO=y
> +CONFIG_GPIO_PPC4XX=y
>   CONFIG_HZ_1000=y
>   CONFIG_CMDLINE="ip=on"
>   # CONFIG_PCI is not set
> diff --git a/arch/powerpc/configs/ppc44x_defconfig b/arch/powerpc/configs/ppc44x_defconfig
> index 41c930f74ed4..57a7342232d7 100644
> --- a/arch/powerpc/configs/ppc44x_defconfig
> +++ b/arch/powerpc/configs/ppc44x_defconfig
> @@ -22,7 +22,7 @@ CONFIG_GLACIER=y
>   CONFIG_REDWOOD=y
>   CONFIG_EIGER=y
>   CONFIG_YOSEMITE=y
> -CONFIG_PPC4xx_GPIO=y
> +CONFIG_GPIO_PPC4XX=y
>   CONFIG_MATH_EMULATION=y
>   CONFIG_NET=y
>   CONFIG_PACKET=y
> diff --git a/arch/powerpc/platforms/44x/Kconfig b/arch/powerpc/platforms/44x/Kconfig
> index fc79f8466933..150813cea945 100644
> --- a/arch/powerpc/platforms/44x/Kconfig
> +++ b/arch/powerpc/platforms/44x/Kconfig
> @@ -227,13 +227,6 @@ config PPC44x_SIMPLE
>   	help
>   	  This option enables the simple PowerPC 44x platform support.
>   
> -config PPC4xx_GPIO
> -	bool "PPC4xx GPIO support"
> -	depends on 44x
> -	select GPIOLIB
> -	help
> -	  Enable gpiolib support for ppc440 based boards
> -
>   # 44x specific CPU modules, selected based on the board above.
>   config 440EP
>   	bool
> diff --git a/arch/powerpc/platforms/44x/Makefile b/arch/powerpc/platforms/44x/Makefile
> index ca7b1bb442d9..179468a00f5e 100644
> --- a/arch/powerpc/platforms/44x/Makefile
> +++ b/arch/powerpc/platforms/44x/Makefile
> @@ -15,4 +15,3 @@ obj-$(CONFIG_FSP2)	+= fsp2.o
>   obj-$(CONFIG_PCI)		+= pci.o
>   obj-$(CONFIG_PPC4xx_HSTA_MSI)	+= hsta_msi.o
>   obj-$(CONFIG_PPC4xx_CPM)	+= cpm.o
> -obj-$(CONFIG_PPC4xx_GPIO)	+= gpio.o
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 020e51e30317..b87d2329900b 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -584,6 +584,13 @@ config GPIO_POLARFIRE_SOC
>   	help
>   	  Say yes here to support the GPIO controllers on Microchip FPGAs.
>   
> +config GPIO_PPC4XX

I'd prefer CONFIG_GPIO_PPC44X

That was added by 878e7556bfe7 ("powerpc/4xx: Add PowerPC 4xx GPIO 
driver") but since then 40x is gone with commit 47d13a269bbd 
("powerpc/40x: Remove 40x platforms.") so only 44x remains as depicted 
by commit 7bf5f0562b62 ("powerpc: Replace CONFIG_4xx with CONFIG_44x")

> +	tristate "PPC4xx GPIO support"
> +	depends on 44x || (PPC && COMPILE_TEST)
> +	select GPIO_GENERIC
> +	help
> +	  Enable gpiolib support for ppc440 based boards.
> +
>   config GPIO_PXA
>   	bool "PXA GPIO support"
>   	depends on ARCH_PXA || ARCH_MMP || COMPILE_TEST
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index b267598b517d..192242988ecb 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -145,6 +145,7 @@ obj-$(CONFIG_GPIO_PCIE_IDIO_24)		+= gpio-pcie-idio-24.o
>   obj-$(CONFIG_GPIO_PCI_IDIO_16)		+= gpio-pci-idio-16.o
>   obj-$(CONFIG_GPIO_PISOSR)		+= gpio-pisosr.o
>   obj-$(CONFIG_GPIO_PL061)		+= gpio-pl061.o
> +obj-$(CONFIG_GPIO_PPC4XX)		+= gpio-ppc4xx.o
>   obj-$(CONFIG_GPIO_PMIC_EIC_SPRD)	+= gpio-pmic-eic-sprd.o
>   obj-$(CONFIG_GPIO_POLARFIRE_SOC)	+= gpio-mpfs.o
>   obj-$(CONFIG_GPIO_PXA)			+= gpio-pxa.o
> diff --git a/arch/powerpc/platforms/44x/gpio.c b/drivers/gpio/gpio-ppc4xx.c
> similarity index 100%
> rename from arch/powerpc/platforms/44x/gpio.c
> rename to drivers/gpio/gpio-ppc4xx.c


