Return-Path: <linux-gpio+bounces-37662-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDxqMpc+GWpVtAgAu9opvQ
	(envelope-from <linux-gpio+bounces-37662-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 09:21:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BA55FE6FF
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 09:21:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 27B8030AA13F
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 07:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2369336EA8B;
	Fri, 29 May 2026 07:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NH9EAe7X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026553403EC
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 07:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780039259; cv=pass; b=nktW983CdtyBBTkjc7h1RJPxSLjYmY25UmQu05pChQ23DAPhs5d6EDh4eUMdVjfqtKJjZNtO8bQmF+EebB4Ix56nfq9XubDuEJsnlzv6hGnYduqb6pGRwV8lyiHhhlVX/8fP+MyYTaxdqlvztNwCJ8zh2jdenfmwva8dsjUruc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780039259; c=relaxed/simple;
	bh=33WWjC55cXE7tKmbZu8HXjV/6aeFV4KMQ4A8FwwKBcE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jozfAggAhmsgy1Bb3ziPHCU5k2dtmAykdcHbpQSvtut9nt8aMROelCJt4ILQsM1lL9m6XK99f6vXZGiGAk+krr/Hz9iVb/VQ4QwgOyCnAIJ6+O84GRjBplNCoI4bMHa9cWqoLEFrbTZHdzmIF+b9s9tn01qSNk1pshDynqQMD3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NH9EAe7X; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-68bfcf11050so811593a12.0
        for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 00:20:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780039256; cv=none;
        d=google.com; s=arc-20240605;
        b=RbE6KDtDcp9mCmM2j/RCvKG7cQv6FUgd7Dazm23qPDQO0UfuydZHYSwsonkE5yYC3x
         eCG5jb15v4SiBAqWcP/Qq/YXL9Bh86fnnn2sPenhe5Vwp/V2YZIvFCvSZ6EJJPeHxmLj
         SVI48DYCA8CSmEg1a0e605V5QVsbfcQ84Bs3dfRnYdCt9FAj3p7bNkDv3em0GOiY4Zi1
         jBzW9GA+2oL/3GwQaHA75nsALo+6t5LwhqrPfG63eNsiQgUEE8uBJZvDWRIoP+kG4G/s
         aXU2PLBKli4yjwuYt/bFDKr0yRAuwmczMf97qm0f7B4FG6oOACifYlzO4oXKxHoijBnb
         VMfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a5oOvflUrqsCekGczpulXOV0OnqiPpXa6jJFOATsImI=;
        fh=nYTsp9w1vT/1hznALHXCerEgZbLx8IuLRf0RvnCXpMY=;
        b=IY4qYHv7oDEqff5C8JelGbmtrT1ckT1LjL8q8AU0ATq6xd4cFmSdo2xHBwXqKmo9yq
         NzNxVLuOeHMQ2rBCRCZCZFROzAlB3xUR3UEsx+OsrpBRpWpOvUgxCWUL/4JrE01Apokv
         rxGR3xjiYK1KDclbNjQ3WPhDIyz12Ntz2o0A5Juk9SoC+5R1UteqEYRhQrMBsCrHtNH1
         WdYjERZroMT7XkxOsurwB3sHtdNm+ZPyJZC6KMK4U9QenEUrY0h1THNxEge58x82Gbr6
         hdM/dzJUxChr05RJU69TeYdqB0O/8eyljo6hdhNKLbogDRid89pxEdccAOSUT5ncDo5P
         k8ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780039256; x=1780644056; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5oOvflUrqsCekGczpulXOV0OnqiPpXa6jJFOATsImI=;
        b=NH9EAe7XNCtfNr0Ge4IyUEhnlqzrTECpb9JBHt6vAoFmmsFKmxPoK/yeECqGfAdSoa
         trtW9Fu6dgNOPJqoIIUYpuS0UP2Ox/QULE2KQ+Yb2dPYGuX3HnEV1cyVFPpyS6YTiQwK
         f0uhjQYPvolYo7R1wCw6MHbWBVFDPFUGo4RFwabw/HCIXjKFt87pDXLRcebrtNLatVUH
         4QLW6EoPSy5dnBRZbZd6FfCQARgkxfXmlFLfza86/dkl2vJPApYLZoxOcFCi6WgFLkkF
         2z79LPqxlNWJJPkn6LEgu3Ixuz8n4Qo+T1RGGNvKfCkUWZ/at3jMgHhReD5Gprd4tjFp
         YaTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780039256; x=1780644056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a5oOvflUrqsCekGczpulXOV0OnqiPpXa6jJFOATsImI=;
        b=Nkw9Mw4+M5dHm3NGuq2AE3fLP7PcW7jiikCofoP8RKDffd/g/nK54+5KVF8Gjy9lk/
         igC/LTthN2KJYkAtK1UkdrSdEbT2BLecTCPHnMjReevIF7da+JZU5czxBw55qbzslq4+
         gJOqosgIJOTUSHheSzyl1D9Sk5xBXc5jc+251N3DrqMRNOSc6UdCV1/Jry1OkGc+NJXe
         kXEGqZ54NSA5CD3V67pUbcoImm1dXBqGtBInlg+FrgboE34sX3SzYbaGGM0nZHefx9LJ
         m1sC/WXoMsOBxT0o/TaX+uZwsMAWhqVYnW+3LfVoHrEuNd7SaWZG0FCHDRoJlFk6ZmOU
         4U2A==
X-Forwarded-Encrypted: i=1; AFNElJ8308wRdNhNWd+CqGvmnDwB1h9MjsC4/inT661X9vbz5hIczMk11OZqnfvS2nJ4UwMWMm7A2opjBHtX@vger.kernel.org
X-Gm-Message-State: AOJu0YxK2UdTCm5fCK9MleEScRLgDWwyERPI0ILH2eTUe/Nni5ceQgy3
	epcB3FW4+RNN/XDeD0sxREGZ5+NPe5Ja+PHBeooSWGwX9X9dzIhTwrjl7GtsAELGazm+U4PHYTY
	3LB5FvoZhbSW+yKww0Y0ZdePNl7/FNiQ=
X-Gm-Gg: Acq92OGVhmsqZLQTwgHr3Y3i7Ff3AL/RVJ6QufxHqQwaI4ZQ0LMcJ2iFJ5BrnV9W5aK
	5xgQ0EVLK2vRvrqFbLipe8cwGBBrIoCLHL6rUMgErLP7Q5fGRVSNVXGtzG/3Brjx/ihkpXwkDb/
	NScdPq9TOzlY1/AOnjxdps/MnLvnvhrF3gZDOcqYBRBSpnGHQkAu1lcd583/oV5wCzBuQyvCgyi
	AR12nSbuXWYFbfKywenXKFDMoc+LGHZj36kUyQY5wZ59huhZAuIeLbJzuyFePnlPE9wSOQsK2wg
	dbPF4z0/R4nCegohDhlJpwosGGtbvPtF4lGgjW+ME4xVHpoB0jKTEH1G/3+ZarP867dbjTEVd9d
	AzK6a6F6RgagH8dR3H53o6HJXh/VhdlL2dKwcpJPpwE3z3IWvueITh8dEGYBaJlcPEaMi
X-Received: by 2002:a05:6402:3604:b0:689:6c2e:6cdf with SMTP id
 4fb4d7f45d1cf-68c1067b1e8mr760728a12.22.1780039256138; Fri, 29 May 2026
 00:20:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529071408.38689-1-rosenp@gmail.com>
In-Reply-To: <20260529071408.38689-1-rosenp@gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 29 May 2026 00:20:44 -0700
X-Gm-Features: AVHnY4KzNu-hw5nUV0SMX9tCHcBcl5o2JZdOxpALN300KtJOh5-GPDqsUaGk7xQ
Message-ID: <CAKxU2N_CFUaF9kgpg8dWVcVMD8pv-EcGBFRgNswiu0TxDoR3eA@mail.gmail.com>
Subject: Re: [PATCH] gpio: move ppc4xx gpio driver from arch/powerpc to drivers/gpio
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37662-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,pengutronix.de:email]
X-Rspamd-Queue-Id: 40BA55FE6FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 29, 2026 at 12:14=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wro=
te:
>
> Move the ppc4xx gpio driver out of arch/powerpc/platforms/44x/ into
> drivers/gpio/gpio-ppc44x.c. The driver follows the same pattern as
> other PowerPC GPIO drivers already in drivers/gpio/ (e.g.
> gpio-mpc8xxx, gpio-mpc5200).
>
> - Replace PPC-specific clrbits32()/setbits32() with local helpers
>   using ioread32be()/iowrite32be() so the driver can be built on
>   any architecture with COMPILE_TEST
> - Renamed Kconfig symbol from PPC4xx_GPIO to GPIO_PPC44X (40x was
>   removed in 47d13a269bbd, only 44x remains)
> - Rename symbols in the driver with 44x instead of 4xx to reflect the
>   absense of 40x.
> - Changed dependency to depends on 44x || COMPILE_TEST
> - Updated ppc44x_defconfig and warp_defconfig to use the new symbol
> - Marked the new option as tristate (was bool) since the driver
>   supports module build via module_platform_driver()
>
> Assisted-by: OpenCode:BigPickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v2: COMPILE_TEST everywhere
This was not it either. I forgot I had a bunch of local modifications
that would conflict. Back to the drawing board...
>  arch/powerpc/configs/44x/warp_defconfig       |  2 +-
>  arch/powerpc/configs/ppc44x_defconfig         |  2 +-
>  arch/powerpc/platforms/44x/Kconfig            |  8 --
>  arch/powerpc/platforms/44x/Makefile           |  1 -
>  drivers/gpio/Kconfig                          |  7 ++
>  drivers/gpio/Makefile                         |  1 +
>  .../44x/gpio.c =3D> drivers/gpio/gpio-ppc44x.c  | 88 +++++++++++--------
>  7 files changed, 62 insertions(+), 47 deletions(-)
>  rename arch/powerpc/platforms/44x/gpio.c =3D> drivers/gpio/gpio-ppc44x.c=
 (61%)
>
> diff --git a/arch/powerpc/configs/44x/warp_defconfig b/arch/powerpc/confi=
gs/44x/warp_defconfig
> index 5757625469c4..d6014b9c5708 100644
> --- a/arch/powerpc/configs/44x/warp_defconfig
> +++ b/arch/powerpc/configs/44x/warp_defconfig
> @@ -12,7 +12,7 @@ CONFIG_MODULE_UNLOAD=3Dy
>  # CONFIG_BLK_DEV_BSG is not set
>  # CONFIG_EBONY is not set
>  CONFIG_WARP=3Dy
> -CONFIG_PPC4xx_GPIO=3Dy
> +CONFIG_GPIO_PPC44X=3Dy
>  CONFIG_HZ_1000=3Dy
>  CONFIG_CMDLINE=3D"ip=3Don"
>  # CONFIG_PCI is not set
> diff --git a/arch/powerpc/configs/ppc44x_defconfig b/arch/powerpc/configs=
/ppc44x_defconfig
> index 41c930f74ed4..b0c7ad8c6d9b 100644
> --- a/arch/powerpc/configs/ppc44x_defconfig
> +++ b/arch/powerpc/configs/ppc44x_defconfig
> @@ -22,7 +22,7 @@ CONFIG_GLACIER=3Dy
>  CONFIG_REDWOOD=3Dy
>  CONFIG_EIGER=3Dy
>  CONFIG_YOSEMITE=3Dy
> -CONFIG_PPC4xx_GPIO=3Dy
> +CONFIG_GPIO_PPC44X=3Dy
>  CONFIG_MATH_EMULATION=3Dy
>  CONFIG_NET=3Dy
>  CONFIG_PACKET=3Dy
> diff --git a/arch/powerpc/platforms/44x/Kconfig b/arch/powerpc/platforms/=
44x/Kconfig
> index d9717bf04a3f..150813cea945 100644
> --- a/arch/powerpc/platforms/44x/Kconfig
> +++ b/arch/powerpc/platforms/44x/Kconfig
> @@ -227,14 +227,6 @@ config PPC44x_SIMPLE
>         help
>           This option enables the simple PowerPC 44x platform support.
>
> -config PPC4xx_GPIO
> -       bool "PPC4xx GPIO support"
> -       depends on 44x
> -       select GPIO_GENERIC
> -       select GPIOLIB
> -       help
> -         Enable gpiolib support for ppc440 based boards
> -
>  # 44x specific CPU modules, selected based on the board above.
>  config 440EP
>         bool
> diff --git a/arch/powerpc/platforms/44x/Makefile b/arch/powerpc/platforms=
/44x/Makefile
> index ca7b1bb442d9..179468a00f5e 100644
> --- a/arch/powerpc/platforms/44x/Makefile
> +++ b/arch/powerpc/platforms/44x/Makefile
> @@ -15,4 +15,3 @@ obj-$(CONFIG_FSP2)    +=3D fsp2.o
>  obj-$(CONFIG_PCI)              +=3D pci.o
>  obj-$(CONFIG_PPC4xx_HSTA_MSI)  +=3D hsta_msi.o
>  obj-$(CONFIG_PPC4xx_CPM)       +=3D cpm.o
> -obj-$(CONFIG_PPC4xx_GPIO)      +=3D gpio.o
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 89c77ec6c205..7374f82b7040 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -593,6 +593,13 @@ config GPIO_POLARFIRE_SOC
>         help
>           Say yes here to support the GPIO controllers on Microchip FPGAs=
.
>
> +config GPIO_PPC44X
> +       tristate "PPC44x GPIO support"
> +       depends on 44x || COMPILE_TEST
> +       select GPIO_GENERIC
> +       help
> +         Enable gpiolib support for ppc440 based boards.
> +
>  config GPIO_PXA
>         bool "PXA GPIO support"
>         depends on ARCH_PXA || ARCH_MMP || COMPILE_TEST
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 8ec03c9aec20..9e8c9ca1d3fb 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -146,6 +146,7 @@ obj-$(CONFIG_GPIO_PCIE_IDIO_24)             +=3D gpio=
-pcie-idio-24.o
>  obj-$(CONFIG_GPIO_PCI_IDIO_16)         +=3D gpio-pci-idio-16.o
>  obj-$(CONFIG_GPIO_PISOSR)              +=3D gpio-pisosr.o
>  obj-$(CONFIG_GPIO_PL061)               +=3D gpio-pl061.o
> +obj-$(CONFIG_GPIO_PPC44X)              +=3D gpio-ppc44x.o
>  obj-$(CONFIG_GPIO_PMIC_EIC_SPRD)       +=3D gpio-pmic-eic-sprd.o
>  obj-$(CONFIG_GPIO_POLARFIRE_SOC)       +=3D gpio-mpfs.o
>  obj-$(CONFIG_GPIO_PXA)                 +=3D gpio-pxa.o
> diff --git a/arch/powerpc/platforms/44x/gpio.c b/drivers/gpio/gpio-ppc44x=
.c
> similarity index 61%
> rename from arch/powerpc/platforms/44x/gpio.c
> rename to drivers/gpio/gpio-ppc44x.c
> index 6b4814ed12b5..cc7796e0cfbd 100644
> --- a/arch/powerpc/platforms/44x/gpio.c
> +++ b/drivers/gpio/gpio-ppc44x.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * PPC4xx gpio driver
> + * PPC44x gpio driver
>   *
>   * Copyright (c) 2008 Harris Corporation
>   * Copyright (c) 2008 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
> @@ -22,7 +22,7 @@
>  #define GPIO_MASK2(gpio)       (0xc0000000 >> ((gpio) * 2))
>
>  /* Physical GPIO register layout */
> -struct ppc4xx_gpio {
> +struct ppc44x_gpio {
>         __be32 or;
>         __be32 tcr;
>         __be32 osrl;
> @@ -43,11 +43,27 @@ struct ppc4xx_gpio {
>         __be32 isr3h;
>  };
>
> -struct ppc4xx_gpio_chip {
> +struct ppc44x_gpio_chip {
>         struct gpio_generic_chip chip;
>         void __iomem *regs;
>  };
>
> +static inline void ppc44x_clrbits32(void __iomem *addr, u32 mask)
> +{
> +       u32 val =3D ioread32be(addr);
> +
> +       val &=3D ~mask;
> +       iowrite32be(val, addr);
> +}
> +
> +static inline void ppc44x_setbits32(void __iomem *addr, u32 mask)
> +{
> +       u32 val =3D ioread32be(addr);
> +
> +       val |=3D mask;
> +       iowrite32be(val, addr);
> +}
> +
>  /*
>   * GPIO LIB API implementation for GPIOs
>   *
> @@ -55,9 +71,9 @@ struct ppc4xx_gpio_chip {
>   */
>
>  static inline void
> -__ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
> +__ppc44x_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
>  {
> -       struct ppc4xx_gpio_chip *chip =3D gpiochip_get_data(gc);
> +       struct ppc44x_gpio_chip *chip =3D gpiochip_get_data(gc);
>         struct gpio_generic_chip *gen_gc =3D &chip->chip;
>
>         if (val)
> @@ -68,29 +84,29 @@ __ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int =
gpio, int val)
>         gpio_generic_write_reg(gen_gc, gen_gc->reg_set, gen_gc->sdata);
>  }
>
> -static int ppc4xx_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
> +static int ppc44x_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
>  {
> -       struct ppc4xx_gpio_chip *chip =3D gpiochip_get_data(gc);
> +       struct ppc44x_gpio_chip *chip =3D gpiochip_get_data(gc);
>         struct gpio_generic_chip *gen_gc =3D &chip->chip;
> -       struct ppc4xx_gpio __iomem *regs =3D chip->regs;
> +       struct ppc44x_gpio __iomem *regs =3D chip->regs;
>         unsigned long flags;
>
>         gpio_generic_chip_lock_irqsave(gen_gc, flags);
>
>         /* Disable open-drain function */
> -       clrbits32(&regs->odr, GPIO_MASK(gpio));
> +       ppc44x_clrbits32(&regs->odr, GPIO_MASK(gpio));
>
>         /* Float the pin */
> -       clrbits32(&regs->tcr, GPIO_MASK(gpio));
> +       ppc44x_clrbits32(&regs->tcr, GPIO_MASK(gpio));
>         gen_gc->sdir &=3D ~GPIO_MASK(gpio);
>
>         /* Bits 0-15 use TSRL/OSRL, bits 16-31 use TSRH/OSRH */
>         if (gpio < 16) {
> -               clrbits32(&regs->osrl, GPIO_MASK2(gpio));
> -               clrbits32(&regs->tsrl, GPIO_MASK2(gpio));
> +               ppc44x_clrbits32(&regs->osrl, GPIO_MASK2(gpio));
> +               ppc44x_clrbits32(&regs->tsrl, GPIO_MASK2(gpio));
>         } else {
> -               clrbits32(&regs->osrh, GPIO_MASK2(gpio));
> -               clrbits32(&regs->tsrh, GPIO_MASK2(gpio));
> +               ppc44x_clrbits32(&regs->osrh, GPIO_MASK2(gpio));
> +               ppc44x_clrbits32(&regs->tsrh, GPIO_MASK2(gpio));
>         }
>
>         gpio_generic_chip_unlock_irqrestore(gen_gc, flags);
> @@ -99,32 +115,32 @@ static int ppc4xx_gpio_dir_in(struct gpio_chip *gc, =
unsigned int gpio)
>  }
>
>  static int
> -ppc4xx_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
> +ppc44x_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
>  {
> -       struct ppc4xx_gpio_chip *chip =3D gpiochip_get_data(gc);
> +       struct ppc44x_gpio_chip *chip =3D gpiochip_get_data(gc);
>         struct gpio_generic_chip *gen_gc =3D &chip->chip;
> -       struct ppc4xx_gpio __iomem *regs =3D chip->regs;
> +       struct ppc44x_gpio __iomem *regs =3D chip->regs;
>         unsigned long flags;
>
>         gpio_generic_chip_lock_irqsave(gen_gc, flags);
>
>         /* First set initial value */
> -       __ppc4xx_gpio_set(gc, gpio, val);
> +       __ppc44x_gpio_set(gc, gpio, val);
>
>         /* Disable open-drain function */
> -       clrbits32(&regs->odr, GPIO_MASK(gpio));
> +       ppc44x_clrbits32(&regs->odr, GPIO_MASK(gpio));
>
>         /* Drive the pin */
> -       setbits32(&regs->tcr, GPIO_MASK(gpio));
> +       ppc44x_setbits32(&regs->tcr, GPIO_MASK(gpio));
>         gen_gc->sdir |=3D GPIO_MASK(gpio);
>
>         /* Bits 0-15 use TSRL, bits 16-31 use TSRH */
>         if (gpio < 16) {
> -               clrbits32(&regs->osrl, GPIO_MASK2(gpio));
> -               clrbits32(&regs->tsrl, GPIO_MASK2(gpio));
> +               ppc44x_clrbits32(&regs->osrl, GPIO_MASK2(gpio));
> +               ppc44x_clrbits32(&regs->tsrl, GPIO_MASK2(gpio));
>         } else {
> -               clrbits32(&regs->osrh, GPIO_MASK2(gpio));
> -               clrbits32(&regs->tsrh, GPIO_MASK2(gpio));
> +               ppc44x_clrbits32(&regs->osrh, GPIO_MASK2(gpio));
> +               ppc44x_clrbits32(&regs->tsrh, GPIO_MASK2(gpio));
>         }
>
>         gpio_generic_chip_unlock_irqrestore(gen_gc, flags);
> @@ -134,14 +150,14 @@ ppc4xx_gpio_dir_out(struct gpio_chip *gc, unsigned =
int gpio, int val)
>         return 0;
>  }
>
> -static int ppc4xx_gpio_probe(struct platform_device *ofdev)
> +static int ppc44x_gpio_probe(struct platform_device *ofdev)
>  {
>         struct device *dev =3D &ofdev->dev;
>         struct device_node *np =3D dev->of_node;
> -       struct ppc4xx_gpio_chip *chip;
> +       struct ppc44x_gpio_chip *chip;
>         struct gpio_generic_chip_config config;
>         struct gpio_chip *gc;
> -       struct ppc4xx_gpio __iomem *regs;
> +       struct ppc44x_gpio __iomem *regs;
>         int ret;
>
>         chip =3D devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
> @@ -169,8 +185,8 @@ static int ppc4xx_gpio_probe(struct platform_device *=
ofdev)
>
>         gc =3D &chip->chip.gc;
>         gc->fwnode =3D dev_fwnode(dev);
> -       gc->direction_input =3D ppc4xx_gpio_dir_in;
> -       gc->direction_output =3D ppc4xx_gpio_dir_out;
> +       gc->direction_input =3D ppc44x_gpio_dir_in;
> +       gc->direction_output =3D ppc44x_gpio_dir_out;
>
>         gc->label =3D devm_kasprintf(dev, GFP_KERNEL, "%pOF", np);
>         if (!gc->label)
> @@ -179,20 +195,20 @@ static int ppc4xx_gpio_probe(struct platform_device=
 *ofdev)
>         return devm_gpiochip_add_data(dev, gc, chip);
>  }
>
> -static const struct of_device_id ppc4xx_gpio_match[] =3D {
> +static const struct of_device_id ppc44x_gpio_match[] =3D {
>         {
>                 .compatible =3D "ibm,ppc4xx-gpio",
>         },
>         {},
>  };
> -MODULE_DEVICE_TABLE(of, ppc4xx_gpio_match);
> +MODULE_DEVICE_TABLE(of, ppc44x_gpio_match);
>
> -static struct platform_driver ppc4xx_gpio_driver =3D {
> -       .probe          =3D ppc4xx_gpio_probe,
> +static struct platform_driver ppc44x_gpio_driver =3D {
> +       .probe          =3D ppc44x_gpio_probe,
>         .driver         =3D {
> -               .name   =3D "ppc4xx-gpio",
> -               .of_match_table =3D ppc4xx_gpio_match,
> +               .name   =3D "ppc44x-gpio",
> +               .of_match_table =3D ppc44x_gpio_match,
>         },
>  };
>
> -module_platform_driver(ppc4xx_gpio_driver);
> +module_platform_driver(ppc44x_gpio_driver);
> --
> 2.54.0
>

