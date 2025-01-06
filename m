Return-Path: <linux-gpio+bounces-14538-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BCBA027B2
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 15:20:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37E897A03C5
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 14:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 700311DE3BF;
	Mon,  6 Jan 2025 14:20:06 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 773B41C69D;
	Mon,  6 Jan 2025 14:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736173206; cv=none; b=YJitcRxLzwUdfRJKd8JypxlQqk8QwstlAlVslPoBXYmbOE0vlGTP6Zy+cSai9H/mwl4yoozkS9X3qDSOKBhoOZIhte0lXz/JQoVh5Pisu4qllJ/Kg9/G6GuYKkyWOHpkfL3M4Tw8/OPpdaU5zUBfp4S+r+k9p3/sZXIaSGHGnQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736173206; c=relaxed/simple;
	bh=gzzBF7n5kC/+cETKNbjjYq5/qgPcVGc7LEimPiYlZjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MECUeqUfadnTcOlU7uW7IHhhuTon/hqq+2yAmv+D4PeH8+/lrZlXEQ3UpKKnwFBHkdLx0ihD7WY300T3355Avrqttc4eaS95EnZsDUr0qtWnUmfRo3JQu4KYxvtFvmjoXsnO7mPUJHL+PKngjmtTKa5FyDlfyEjfkBvOq5N+q7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YRbKm4tWrz9sS7;
	Mon,  6 Jan 2025 14:55:24 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s9Oh1RsQil6n; Mon,  6 Jan 2025 14:55:24 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YRbKl41kYz9rvV;
	Mon,  6 Jan 2025 14:55:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 765CE8B76D;
	Mon,  6 Jan 2025 14:55:23 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 658LmXtQ7wrh; Mon,  6 Jan 2025 14:55:23 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C588D8B763;
	Mon,  6 Jan 2025 14:55:22 +0100 (CET)
Message-ID: <6443434a-f810-4591-b1e4-cfea0bc0b993@csgroup.eu>
Date: Mon, 6 Jan 2025 14:55:22 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/19] powerpc: boot: Build devicetrees when
 CONFIG_MPC831x=y
To: j.ne@posteo.net, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
 <20250102-mpc83xx-v1-9-86f78ba2a7af@posteo.net>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250102-mpc83xx-v1-9-86f78ba2a7af@posteo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 02/01/2025 à 19:31, J. Neuschäfer via B4 Relay a écrit :
> [Vous ne recevez pas souvent de courriers de devnull+j.ne.posteo.net@kernel.org. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> From: "J. Neuschäfer" <j.ne@posteo.net>
> 
> In order to produce useful FIT images, the kernel needs to know which
> devicetrees to build. To that end, follow the same approach as other
> architectures, and enable devicetrees per platform.

Why do you need that ? Why not just use CONFIG_EXTRA_TARGETS for that ?

> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
> 
> I've only enabled MPC831x devicetrees, because that's the hardware I have.
> ---
>   arch/powerpc/boot/dts/Makefile | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/powerpc/boot/dts/Makefile b/arch/powerpc/boot/dts/Makefile
> index 0cd0d8558b475cfe342f36f4b78240ef88dd2e37..6aee895d5baaa2c978d4b1c82a6d198d9e166ea2 100644
> --- a/arch/powerpc/boot/dts/Makefile
> +++ b/arch/powerpc/boot/dts/Makefile
> @@ -3,3 +3,8 @@
>   subdir-y += fsl
> 
>   dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(src)/%.dts,%.dtb, $(wildcard $(src)/*.dts))
> +
> +dtb-$(CONFIG_MPC831x) += \
> +       kmeter1.dtb \
> +       mpc8313erdb.dtb \
> +       mpc8315erdb.dtb

How will it know which one of the three to put in the FIT image ? Or do 
you want all three in the FIT image ? In that case how do you select 
which one to use at boot ?

> 
> --
> 2.45.2
> 
> 


