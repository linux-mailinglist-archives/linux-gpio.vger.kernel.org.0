Return-Path: <linux-gpio+bounces-37606-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMvzNmWxF2p+NggAu9opvQ
	(envelope-from <linux-gpio+bounces-37606-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 05:07:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 420775EC118
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 05:07:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1632F31155EA
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 03:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4053309EF9;
	Thu, 28 May 2026 03:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tc9PwLGu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B19130C161
	for <linux-gpio@vger.kernel.org>; Thu, 28 May 2026 03:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779937537; cv=pass; b=Mq+1J6cPzOXAuSKXUk0xryRgK8InPOe9DimeYfzwWilOidk/x2oJsAbPT55PnfuGIh5pAUGaOH2rRZKR6azFfiyF156ak3MjAaaTr91UyU1rF8wswS1+ykAGCFxbkhbF4gkW2Vles4SLyyNEBRnzPZVzlAq07FUZHo1N5exbblg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779937537; c=relaxed/simple;
	bh=bFw36DY2mxSfznEig/zdayqksbA5LTYQ6lZhKUxM/wo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=snGA8x40U70ud3CMqr3dLKBDZ24qh6m1CXplgmTQydqS+YNrLiGW6e4wMDec5M4kvHqRl7uHEZ42YCJOEJqfdFA5ofzz7NIuikljip1g9IwgtPv+toS2d1AjpzgvGkFzTBVdu5+xruATgv1+NA5q0Ya9q6ZCAJ2zWBPGvAHP2dY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tc9PwLGu; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6886be3d39bso9876382a12.3
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 20:05:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779937532; cv=none;
        d=google.com; s=arc-20240605;
        b=I7Y06Nan+qlo4H+OukOIz8qVLxVRqzF8U6uv6BO16c0qwYFrtk4lzW1Z+TuCw9phYJ
         UR2+T6Y33MaIvpL1nFWhymU3Zfk4imuyteuNz+tNt3/Daeq3F76utMsqpIFv2TKxsbXg
         ytI9y5XwGh9K+NBBtNZQ3vF1zc+YLe9ab9gVAFmM4eSWGAadm9Xviq3yQfsWFiFPM/LB
         UpP43jI9K0Q3bEnN+BIY7dpTd3QV7ZGAIaKA/xHSKmcsUrCbsPAVnHByXHcPK7uL4cTw
         /hLkKJ1D8nuZONqQPkQgc6xikKZ25SxnE8w9/kt9Lak9xvBS//cyAOkX9SkmTJBYzvCL
         UB9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cPHLoqDxPmB8d9qB6DtASLpOV7DkVrp8skXoe/juiQs=;
        fh=eV3iiE7KWeSX0rYWMRCQomLwMil9T4Tlf4zbGeaEQwQ=;
        b=gs1ppRk5QvA7XMdwaBFsQ3OmahAbHTIKkjVl8pGgLKbqXCSSz/VWXTcRiKuu9AyCjB
         GvdFdGaPKJTLAbIctpdk4zAlN09sv57f6KZ8xMVNOoQz3kyUOW5+7BxEqyieBkXp2GMT
         JNZoTK9f2TWo3vM1uBObXw7HmoSqFmPAPVN56EcC+WDpmMtUwkf4nu7kYChf5rMBw9xM
         K29z0JDKp2NS2RBGKCqIX5cB1Yxsm7p+viD1KsnSKwRbgv8CyavLvUujiG5kMX7tWxat
         0Gjot2dCjJBsaPGIDnTkDDrqCoGV0//tZgpU7BJRwbJMClcm5KVcSCtsgvzWRO1QQoai
         bF6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779937532; x=1780542332; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPHLoqDxPmB8d9qB6DtASLpOV7DkVrp8skXoe/juiQs=;
        b=Tc9PwLGu1yUMZkG0M2xOGAtMR6GJ3YAxnpliREOgAZd07qGPg0Z75rDZnchf8dzion
         Yxh5cN2wX+joX6Zv0oet5OqdZsGPCvUtdhOwfv+nLKyLiqw7cdcIWjYmXIpZNi345/LJ
         nKVvuks8JUJYL4UGr/CqMbERLhpMeqpAawcAmQ1eeCyZ8QEgx2+gzLMlYkIO/9QiWgil
         VaH8lYZEOtcUjcBVGZn7Es1bchl+iI5PUtLS9VtPQIwsRL+W/92iGMH2RWDgcbd4Ogrm
         V58ieX5AlAKG39zPtNHM9umnRL1qv/vU5xu/t/IlcTPeuMXEu6nQ9edLVjDzodojeGYe
         ixMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779937532; x=1780542332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cPHLoqDxPmB8d9qB6DtASLpOV7DkVrp8skXoe/juiQs=;
        b=hu9zphaaaAA9yga0/6VjmgIqzQruAGDZnYzaRN0j3QpwwEtcoDtCavNP0nk6R/WorE
         OHuTbnVvhQiXT/Vydo7zuyl2pZu7mDHjyx+bm34gKhKl/GD+zG8Tmc+2mpnAEGBoMkDv
         sQZiiJGQmh/stHdPiOJX8dWsBjMCdG6qKYq/+ybc9WGymSBNaQsfPR4jD6mFAuLJvuL3
         YzCND5T2wHo4m3aoJV+dAdQGtsekNIh89EKlyjVLmUs4NULgmpMfMD1zyKu1ffW+3Iys
         9CKnSXwSflmPgWrXnYmWluOmtH8pHS/xPTUAzJVw6gc7jjh5caU2mxNBBLsvkDrVROKn
         nymg==
X-Forwarded-Encrypted: i=1; AFNElJ/TzsKqmcW4qBphlXXXGR3diw7c1I70lxuAd/qnKSvD0lmhAdZNcTji0bAd215SNYMoJYoA/knIB/l8@vger.kernel.org
X-Gm-Message-State: AOJu0YyhYsY2OLM+53WfTKC2H4jZzqro1gcll4PGEW1A3R+W9jaSyhTB
	BK9LTjZh/prRsT3S0Uf0O0YqyIKYUbSb8y+sgFUsvdvhlSGJBvaBYt9XOAcM4PXcf6iuFPVeM9Z
	DMOmp+AWpU159onSN12ZAevJ69Vn8ejXZsjcu
X-Gm-Gg: Acq92OGqLjtm7s3oDgmJhpGJLyefpoUKx06y5ixGpObEP8CMXsu/eq0HrQSg4rYgDkD
	6ua92APXcYQrON8N0pMTqNI9zv/JZT541YoJjLWDiIjiN8KpU8SYMzUN4I3jSJosyufy6XTXfB8
	bd4UWiA1TtVmQssuHFd/yXbJZ9evT++VXoIv/efJCKjc/qeYh7HvCeKxD/XFbbbeusaWgEf/4TT
	MAxUXA+YlrGVqhPYpH2WUVCBvbijGTHvdn+Td8hJnlAGph/Jh2rCSvX6HxuuXZMXi3XFyOBp6u4
	lIPsaCorK1pnaEJzRqbxvgDrCFXUUNxBbp8Vo7Y/7/JbyB8FOPVIxidMy8BcxTVrSY5Iz7N5xGP
	tM2h9WkHzsqT7PgcTfCDORR1Wdubv0UzS90at8CCmgxwGq+jPebkll3Ss6IsHurphdPSE
X-Received: by 2002:a05:6402:1f8d:b0:68b:117b:2155 with SMTP id
 4fb4d7f45d1cf-68b117b25f0mr307439a12.15.1779937531643; Wed, 27 May 2026
 20:05:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528025610.713514-1-rosenp@gmail.com>
In-Reply-To: <20260528025610.713514-1-rosenp@gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 27 May 2026 20:05:20 -0700
X-Gm-Features: AVHnY4ISyDQ2wTV2j_1EbZdqvCNnJ2nwvhsyfLrB93TNg5isZhi6AALrDPoCpm8
Message-ID: <CAKxU2N8uBpBNJgPP+J1=MgCTYb9tweoeqzYRTTtOmB=6Z9W6Yw@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37606-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[disroot.org:email,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 420775EC118
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 27, 2026 at 7:56=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> Move the ppc4xx gpio driver out of arch/powerpc/platforms/44x/ into
> drivers/gpio/gpio-ppc4xx.c. The driver has no architecture-specific
> dependencies and follows the same pattern as other PowerPC GPIO
> drivers already in drivers/gpio/ (e.g. gpio-mpc8xxx, gpio-mpc5200).
>
> - Renamed Kconfig symbol from PPC4xx_GPIO to GPIO_PPC4XX
> - Updated ppc44x_defconfig and warp_defconfig to use the new symbol
> - Marked the new option as tristate (was bool) since the driver
>   supports module build via module_platform_driver()
> - Added COMPILE_TEST support. Needs PPC as clrbits32 is in use.
>
> Assisted-by: OpenCode:BigPickle
> Signed-off-by: mangix <mangix@disroot.org>
Sigh forgot to check this. Was too focused on testing this.
> ---
>  arch/powerpc/configs/44x/warp_defconfig                    | 2 +-
>  arch/powerpc/configs/ppc44x_defconfig                      | 2 +-
>  arch/powerpc/platforms/44x/Kconfig                         | 7 -------
>  arch/powerpc/platforms/44x/Makefile                        | 1 -
>  drivers/gpio/Kconfig                                       | 7 +++++++
>  drivers/gpio/Makefile                                      | 1 +
>  .../platforms/44x/gpio.c =3D> drivers/gpio/gpio-ppc4xx.c     | 0
>  7 files changed, 10 insertions(+), 10 deletions(-)
>  rename arch/powerpc/platforms/44x/gpio.c =3D> drivers/gpio/gpio-ppc4xx.c=
 (100%)
>
> diff --git a/arch/powerpc/configs/44x/warp_defconfig b/arch/powerpc/confi=
gs/44x/warp_defconfig
> index 5757625469c4..380fa15af68d 100644
> --- a/arch/powerpc/configs/44x/warp_defconfig
> +++ b/arch/powerpc/configs/44x/warp_defconfig
> @@ -12,7 +12,7 @@ CONFIG_MODULE_UNLOAD=3Dy
>  # CONFIG_BLK_DEV_BSG is not set
>  # CONFIG_EBONY is not set
>  CONFIG_WARP=3Dy
> -CONFIG_PPC4xx_GPIO=3Dy
> +CONFIG_GPIO_PPC4XX=3Dy
>  CONFIG_HZ_1000=3Dy
>  CONFIG_CMDLINE=3D"ip=3Don"
>  # CONFIG_PCI is not set
> diff --git a/arch/powerpc/configs/ppc44x_defconfig b/arch/powerpc/configs=
/ppc44x_defconfig
> index 41c930f74ed4..57a7342232d7 100644
> --- a/arch/powerpc/configs/ppc44x_defconfig
> +++ b/arch/powerpc/configs/ppc44x_defconfig
> @@ -22,7 +22,7 @@ CONFIG_GLACIER=3Dy
>  CONFIG_REDWOOD=3Dy
>  CONFIG_EIGER=3Dy
>  CONFIG_YOSEMITE=3Dy
> -CONFIG_PPC4xx_GPIO=3Dy
> +CONFIG_GPIO_PPC4XX=3Dy
>  CONFIG_MATH_EMULATION=3Dy
>  CONFIG_NET=3Dy
>  CONFIG_PACKET=3Dy
> diff --git a/arch/powerpc/platforms/44x/Kconfig b/arch/powerpc/platforms/=
44x/Kconfig
> index fc79f8466933..150813cea945 100644
> --- a/arch/powerpc/platforms/44x/Kconfig
> +++ b/arch/powerpc/platforms/44x/Kconfig
> @@ -227,13 +227,6 @@ config PPC44x_SIMPLE
>         help
>           This option enables the simple PowerPC 44x platform support.
>
> -config PPC4xx_GPIO
> -       bool "PPC4xx GPIO support"
> -       depends on 44x
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
> index 020e51e30317..b87d2329900b 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -584,6 +584,13 @@ config GPIO_POLARFIRE_SOC
>         help
>           Say yes here to support the GPIO controllers on Microchip FPGAs=
.
>
> +config GPIO_PPC4XX
> +       tristate "PPC4xx GPIO support"
> +       depends on 44x || (PPC && COMPILE_TEST)
> +       select GPIO_GENERIC
> +       help
> +         Enable gpiolib support for ppc440 based boards.
> +
>  config GPIO_PXA
>         bool "PXA GPIO support"
>         depends on ARCH_PXA || ARCH_MMP || COMPILE_TEST
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index b267598b517d..192242988ecb 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -145,6 +145,7 @@ obj-$(CONFIG_GPIO_PCIE_IDIO_24)             +=3D gpio=
-pcie-idio-24.o
>  obj-$(CONFIG_GPIO_PCI_IDIO_16)         +=3D gpio-pci-idio-16.o
>  obj-$(CONFIG_GPIO_PISOSR)              +=3D gpio-pisosr.o
>  obj-$(CONFIG_GPIO_PL061)               +=3D gpio-pl061.o
> +obj-$(CONFIG_GPIO_PPC4XX)              +=3D gpio-ppc4xx.o
>  obj-$(CONFIG_GPIO_PMIC_EIC_SPRD)       +=3D gpio-pmic-eic-sprd.o
>  obj-$(CONFIG_GPIO_POLARFIRE_SOC)       +=3D gpio-mpfs.o
>  obj-$(CONFIG_GPIO_PXA)                 +=3D gpio-pxa.o
> diff --git a/arch/powerpc/platforms/44x/gpio.c b/drivers/gpio/gpio-ppc4xx=
.c
> similarity index 100%
> rename from arch/powerpc/platforms/44x/gpio.c
> rename to drivers/gpio/gpio-ppc4xx.c
> --
> 2.54.0
>

