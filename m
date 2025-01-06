Return-Path: <linux-gpio+bounces-14537-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBF3A027AD
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 15:20:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 639E47A1360
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 14:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C87FA7081E;
	Mon,  6 Jan 2025 14:20:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8499BA34;
	Mon,  6 Jan 2025 14:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736173204; cv=none; b=jqdnUbrjcVGPgu/54MD1a9KOOzfn1FFSYXh06ti2a1waGjP4Cbc2YZjA3KP1RwpCBt1m9QDWfcgB7ktuETQ69/dsl7UnbsTeAk4K0ynCi79iCM1eBeSLO9B8mERGYXeBhAo9KryZGYO9fk6X4nrYQOxvxjxMdyy+zuEmrOwKXWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736173204; c=relaxed/simple;
	bh=T7jZ6BwhFodRZBkM3Mx+CUm7U+X9D0pjx68bQ7cfUt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AcN3rU35iFMMeAyD575Xd2Jg+bSwWVnumhEBxIU9AzsuwNQUU0Cv/l7U9/BeG0cn4aq8aOletrNmn1Z2cfz9CBs0YB02GHAwjphdbklt4cE8f+cl28t0/cvtgk997LTZi6LvvhxkuwIbp7zKU5m4RokOvc6KfX/J8kj1RgvluIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YRbH0570yz9sSH;
	Mon,  6 Jan 2025 14:53:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mCGRxpvgUuLn; Mon,  6 Jan 2025 14:53:00 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YRbH03qJfz9sSC;
	Mon,  6 Jan 2025 14:53:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6F5D88B76D;
	Mon,  6 Jan 2025 14:53:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id sf1e-5A563xg; Mon,  6 Jan 2025 14:53:00 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B60678B763;
	Mon,  6 Jan 2025 14:52:59 +0100 (CET)
Message-ID: <f4552e33-87d9-4b71-be21-f6884e4b5fa1@csgroup.eu>
Date: Mon, 6 Jan 2025 14:52:59 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/19] powerpc: boot: Enable FIT image generation
To: j.ne@posteo.net, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
 <20250102-mpc83xx-v1-8-86f78ba2a7af@posteo.net>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250102-mpc83xx-v1-8-86f78ba2a7af@posteo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 02/01/2025 à 19:31, J. Neuschäfer via B4 Relay a écrit :
> [Vous ne recevez pas souvent de courriers de devnull+j.ne.posteo.net@kernel.org. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> From: "J. Neuschäfer" <j.ne@posteo.net>
> 
> The Flat Image Tree (FIT) format combines a kernel, a set of
> devicetrees, and optionally additional resources into a single file that
> can be loaded by a bootloader such as U-Boot. Generating a FIT image as
> part of the kernel build reduces the need for additional build scripts,
> and produces a single boot image without falling back to one of the
> many legacy methods implemented in arch/powerpc/boot/Makefile, which
> would require additional changes for arch/powerpc/boot for each board.

Will that allow compressed vmlinux ?

Looking at the change I have the feeling it only includes raw 
uncompressed images.


> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
> 
> Checkpatch warns:
> 
>    arch/powerpc/boot/Makefile:364: WARNING: Possible repeated word: 'Image'
> 
> for this line:
> 
>    image-y += Image image.fit
> 
> This is bogus and can be ignored.
> ---
>   arch/powerpc/Makefile      |  3 ++-
>   arch/powerpc/boot/Makefile | 11 +++++++++++
>   2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index f3804103c56ccfdb16289468397ccaea71bf721e..693c82c06072fb0529288736efee460e375b2476 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -225,7 +225,7 @@ KBUILD_CFLAGS += $(cflags-y)
>   all: zImage
> 
>   # With make 3.82 we cannot mix normal and wildcard targets
> -BOOT_TARGETS1 := zImage zImage.initrd uImage
> +BOOT_TARGETS1 := zImage zImage.initrd uImage image.fit
>   BOOT_TARGETS2 := zImage% dtbImage% treeImage.% cuImage.% simpleImage.% uImage.%
> 
>   PHONY += $(BOOT_TARGETS1) $(BOOT_TARGETS2)
> @@ -237,6 +237,7 @@ $(BOOT_TARGETS1): vmlinux
>   $(BOOT_TARGETS2): vmlinux
>          $(Q)$(MAKE) $(build)=$(boot) $(patsubst %,$(boot)/%,$@)
> 
> +image.fit: dtbs
> 
>   PHONY += bootwrapper_install
>   bootwrapper_install:
> diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> index 1ff6ad4f6cd27755ea7bfe5b02af4a47ca33cea7..e0c62ab1cc5af99e43f6639be11bf1c64d352db8 100644
> --- a/arch/powerpc/boot/Makefile
> +++ b/arch/powerpc/boot/Makefile
> @@ -360,6 +360,9 @@ ifdef CONFIG_PPC32
>   image-$(CONFIG_PPC_PMAC)       += zImage.coff zImage.miboot
>   endif
> 
> +# FIT support (generic)
> +image-y += Image image.fit
> +
>   # Allow extra targets to be added to the defconfig
>   image-y        += $(CONFIG_EXTRA_TARGETS)
> 
> @@ -398,6 +401,14 @@ $(obj)/dtbImage.%: vmlinux $(wrapperbits) $(obj)/dts/%.dtb FORCE
>   $(obj)/vmlinux.strip: vmlinux
>          $(STRIP) -s -R .comment $< -o $@
> 
> +OBJCOPYFLAGS += -O binary
> +
> +$(obj)/Image: vmlinux FORCE
> +       $(call if_changed,objcopy)
> +
> +$(obj)/image.fit: $(obj)/Image $(obj)/dts/dtbs-list FORCE
> +       $(call if_changed,fit)
> +
>   $(obj)/uImage: vmlinux $(wrapperbits) FORCE
>          $(call if_changed,wrap,uboot)
> 
> 
> --
> 2.45.2
> 
> 


