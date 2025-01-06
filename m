Return-Path: <linux-gpio+bounces-14539-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE64A027B7
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 15:20:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 079483A1FFE
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 14:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F3611DED51;
	Mon,  6 Jan 2025 14:20:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B2E01C69D;
	Mon,  6 Jan 2025 14:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736173211; cv=none; b=Z2XyJV8msoctxjGLvVzXtwWPVW1iSOjewdBr8Fva0WpZry/0SzIb8bTAByn/3VnQPJz4YthwEnAL5iUDybSub0fK7EwIaD8iDAAp3pSextQ9z+T7S8ibvrOzZ9WLvpiD8cdxOx7ARQK7VwPf/I5RRLyo+852TPynJQT5nIinda8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736173211; c=relaxed/simple;
	bh=wn3wFUB9KZfEHhSMsj5RdEQEhDDDg7va4RAbjdECAWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GIDjdoNXo71q247EbNPzOdPYTLbNKf7u27KnO2cUXkHfHw3wMkzTdxrRpndpDKoiTRaNVu9f310P0OOq8uHFenW5u199wBxgBw51L9DWkUCusXWDJ4n+h9PH+/DEL//ImVPvN+Q6Vju/3lFEckW9VfuMs66m9UsantgYve9Gt7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YRbD92xxVz9sRy;
	Mon,  6 Jan 2025 14:50:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6wW4lpObGddX; Mon,  6 Jan 2025 14:50:33 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YRbD83B5lz9sPd;
	Mon,  6 Jan 2025 14:50:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5CAB38B76D;
	Mon,  6 Jan 2025 14:50:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Z_B1MFLFwVVN; Mon,  6 Jan 2025 14:50:32 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9FC648B763;
	Mon,  6 Jan 2025 14:50:31 +0100 (CET)
Message-ID: <0b66e94d-7116-4916-b897-06b1199752b4@csgroup.eu>
Date: Mon, 6 Jan 2025 14:50:31 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/19] powerpc: Generalize MPC831x platform support
To: j.ne@posteo.net, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
 <20250102-mpc83xx-v1-1-86f78ba2a7af@posteo.net>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250102-mpc83xx-v1-1-86f78ba2a7af@posteo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 02/01/2025 à 19:31, J. Neuschäfer via B4 Relay a écrit :
> [Vous ne recevez pas souvent de courriers de devnull+j.ne.posteo.net@kernel.org. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> From: "J. Neuschäfer" <j.ne@posteo.net>
> 
> The Reference Design Boards (RDB) don't have the same relevance they had
> then the MPC831x platform was new; if any work is done today, then
> likely based on used production boards, which are more readily available
> than NXP's discontinued devboards.
> 
> To further reduce the focus on RDBs, add DT compatible strings for all
> four MPC8314/5 variants.

Seems like this patch does more than adding DT compatible strings.

> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
>   arch/powerpc/configs/83xx/mpc8313_rdb_defconfig     |  2 +-
>   arch/powerpc/configs/83xx/mpc8315_rdb_defconfig     |  2 +-
>   arch/powerpc/configs/mpc83xx_defconfig              |  2 +-
>   arch/powerpc/configs/ppc6xx_defconfig               |  2 +-
>   arch/powerpc/platforms/83xx/Kconfig                 |  6 +++---
>   arch/powerpc/platforms/83xx/Makefile                |  2 +-
>   .../platforms/83xx/{mpc831x_rdb.c => mpc831x.c}     | 21 ++++++++++++++-------
>   7 files changed, 22 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/powerpc/configs/83xx/mpc8313_rdb_defconfig b/arch/powerpc/configs/83xx/mpc8313_rdb_defconfig
> index 16a42e2267fbe092ea2344f50548101bc1e344ce..38a4d1ceff6a9ea75d9d8a313adbd2e5e5c9ac67 100644
> --- a/arch/powerpc/configs/83xx/mpc8313_rdb_defconfig
> +++ b/arch/powerpc/configs/83xx/mpc8313_rdb_defconfig
> @@ -12,7 +12,7 @@ CONFIG_PARTITION_ADVANCED=y
>   # CONFIG_PPC_CHRP is not set
>   # CONFIG_PPC_PMAC is not set
>   CONFIG_PPC_83xx=y
> -CONFIG_MPC831x_RDB=y
> +CONFIG_MPC831x=y
>   CONFIG_PCI=y
>   CONFIG_NET=y
>   CONFIG_PACKET=y
> diff --git a/arch/powerpc/configs/83xx/mpc8315_rdb_defconfig b/arch/powerpc/configs/83xx/mpc8315_rdb_defconfig
> index 80d40ae668eb6f1ae10bc0c1100d904946496112..788189a182458c92a62235c10fb3d21a87f4296b 100644
> --- a/arch/powerpc/configs/83xx/mpc8315_rdb_defconfig
> +++ b/arch/powerpc/configs/83xx/mpc8315_rdb_defconfig
> @@ -12,7 +12,7 @@ CONFIG_PARTITION_ADVANCED=y
>   # CONFIG_PPC_CHRP is not set
>   # CONFIG_PPC_PMAC is not set
>   CONFIG_PPC_83xx=y
> -CONFIG_MPC831x_RDB=y
> +CONFIG_MPC831x=y
>   CONFIG_PCI=y
>   CONFIG_NET=y
>   CONFIG_PACKET=y
> diff --git a/arch/powerpc/configs/mpc83xx_defconfig b/arch/powerpc/configs/mpc83xx_defconfig
> index 83c4710017e949c358f3ba8b73f5c1873cfd10f8..4af5e3e8c5a7f44f5e97b8fb4cdf691686f8967b 100644
> --- a/arch/powerpc/configs/mpc83xx_defconfig
> +++ b/arch/powerpc/configs/mpc83xx_defconfig
> @@ -9,7 +9,7 @@ CONFIG_PARTITION_ADVANCED=y
>   # CONFIG_PPC_CHRP is not set
>   # CONFIG_PPC_PMAC is not set
>   CONFIG_PPC_83xx=y
> -CONFIG_MPC831x_RDB=y
> +CONFIG_MPC831x=y
>   CONFIG_MPC832x_RDB=y
>   CONFIG_MPC834x_ITX=y
>   CONFIG_MPC836x_RDK=y
> diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
> index ca0c90e9583790cbca15ba956b371b8b0cb63c47..7e56dc497a48289614c8d01cc51be6d1edad7846 100644
> --- a/arch/powerpc/configs/ppc6xx_defconfig
> +++ b/arch/powerpc/configs/ppc6xx_defconfig
> @@ -40,7 +40,7 @@ CONFIG_PPC_82xx=y
>   CONFIG_EP8248E=y
>   CONFIG_MGCOGE=y
>   CONFIG_PPC_83xx=y
> -CONFIG_MPC831x_RDB=y
> +CONFIG_MPC831x=y
>   CONFIG_MPC832x_RDB=y
>   CONFIG_MPC834x_ITX=y
>   CONFIG_MPC836x_RDK=y
> diff --git a/arch/powerpc/platforms/83xx/Kconfig b/arch/powerpc/platforms/83xx/Kconfig
> index d355ad40995fdc0fc3b4355126c65c761c21c296..944ec44a1fa6044b03ac71c295e891cd411ce444 100644
> --- a/arch/powerpc/platforms/83xx/Kconfig
> +++ b/arch/powerpc/platforms/83xx/Kconfig
> @@ -18,12 +18,12 @@ config MPC830x_RDB
>          help
>            This option enables support for the MPC8308 RDB and MPC8308 P1M boards.
> 
> -config MPC831x_RDB
> -       bool "Freescale MPC831x RDB"
> +config MPC831x

That looks confusing. We already have CONFIG_PPC_MPC831x


> +       bool "Freescale MPC831x boards"
>          select DEFAULT_UIMAGE
>          select PPC_MPC831x
>          help
> -         This option enables support for the MPC8313 RDB and MPC8315 RDB boards.
> +         This option enables support for all MPC831x-based boards.
> 
>   config MPC832x_RDB
>          bool "Freescale MPC832x RDB"
> diff --git a/arch/powerpc/platforms/83xx/Makefile b/arch/powerpc/platforms/83xx/Makefile
> index 6fc3dba943dade4f63da090b520b0c35bb46a091..92fb0b34913e1113d3e6eac49acbb1c32fb06ab7 100644
> --- a/arch/powerpc/platforms/83xx/Makefile
> +++ b/arch/powerpc/platforms/83xx/Makefile
> @@ -6,7 +6,7 @@ obj-y                           := misc.o
>   obj-$(CONFIG_SUSPEND)          += suspend.o suspend-asm.o
>   obj-$(CONFIG_MCU_MPC8349EMITX) += mcu_mpc8349emitx.o
>   obj-$(CONFIG_MPC830x_RDB)      += mpc830x_rdb.o
> -obj-$(CONFIG_MPC831x_RDB)      += mpc831x_rdb.o
> +obj-$(CONFIG_MPC831x)          += mpc831x.o
>   obj-$(CONFIG_MPC832x_RDB)      += mpc832x_rdb.o
>   obj-$(CONFIG_MPC834x_ITX)      += mpc834x_itx.o
>   obj-$(CONFIG_MPC836x_RDK)      += mpc836x_rdk.o
> diff --git a/arch/powerpc/platforms/83xx/mpc831x_rdb.c b/arch/powerpc/platforms/83xx/mpc831x.c
> similarity index 65%
> rename from arch/powerpc/platforms/83xx/mpc831x_rdb.c
> rename to arch/powerpc/platforms/83xx/mpc831x.c
> index 5c39966762e4264d2ef91b2c4ef75fdf2c2c5d65..7250fc11c7ee80b266f39d0b3aebb0deb777c129 100644
> --- a/arch/powerpc/platforms/83xx/mpc831x_rdb.c
> +++ b/arch/powerpc/platforms/83xx/mpc831x.c
> @@ -1,8 +1,8 @@
>   // SPDX-License-Identifier: GPL-2.0-or-later
>   /*
> - * arch/powerpc/platforms/83xx/mpc831x_rdb.c
> + * arch/powerpc/platforms/83xx/mpc831x.c

Please remove the file name from the file.

>    *
> - * Description: MPC831x RDB board specific routines.
> + * Description: MPC831x board specific routines.

s/board/boards ?

>    * This file is based on mpc834x_sys.c
>    * Author: Lo Wlison <r43300@freescale.com>
>    *
> @@ -22,24 +22,31 @@
>   /*
>    * Setup the architecture
>    */
> -static void __init mpc831x_rdb_setup_arch(void)
> +static void __init mpc831x_setup_arch(void)
>   {
>          mpc83xx_setup_arch();
>          mpc831x_usb_cfg();
>   }
> 
>   static const char *board[] __initdata = {
> +       /* Reference design boards */
>          "MPC8313ERDB",
>          "fsl,mpc8315erdb",
> +
> +       /* Generic chip compatibles */
> +       "fsl,mpc8315e",
> +       "fsl,mpc8315",
> +       "fsl,mpc8314e",
> +       "fsl,mpc8314",
>          NULL
>   };
> 
> -machine_device_initcall(mpc831x_rdb, mpc83xx_declare_of_platform_devices);
> +machine_device_initcall(mpc831x, mpc83xx_declare_of_platform_devices);
> 
> -define_machine(mpc831x_rdb) {
> -       .name                   = "MPC831x RDB",
> +define_machine(mpc831x) {
> +       .name                   = "MPC831x",
>          .compatibles            = board,
> -       .setup_arch             = mpc831x_rdb_setup_arch,
> +       .setup_arch             = mpc831x_setup_arch,
>          .discover_phbs          = mpc83xx_setup_pci,
>          .init_IRQ               = mpc83xx_ipic_init_IRQ,
>          .get_irq                = ipic_get_irq,
> 
> --
> 2.45.2
> 
> 



