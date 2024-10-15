Return-Path: <linux-gpio+bounces-11317-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5AB99DDE1
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 08:01:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77E1B285651
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 06:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3502017C9BB;
	Tue, 15 Oct 2024 06:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f8qwitj+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E176616B75C;
	Tue, 15 Oct 2024 06:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728972107; cv=none; b=VFZM1c1/W6r+7QrWJGdW9+brmhi+aZF8JFk+yPXjdJVFeSmOjZJJCb6alNbkslrqaPjspHKktVWv7IyMNUNkIQ2P5cxHH4yaTL4rIzyMlGBWNGYSAOnNwd9BlMb55uxmmA3iwIAHWGhAyY4WhSuNTCVsF9Er052M8E/EBaMid7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728972107; c=relaxed/simple;
	bh=hjLVAsAxmaKiJMaFRVR95Sfr8mL4+9Ch2JcbTvocQLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qTSR/ax26cOgQVHpluvwf6Ld+xCdLCIKOi76WpuofkF6ErPQxTyy4WHfijL5HfLF2SwFulq6KUyKHsWWks5359SKDKd3Tx5wETvPr/AF0tRJ+0naM07c5pp1ZW+X9YKMUD6WBglGZ+NWlEH/W7wmOQ1fK2V5qZH1yne/jCcdixU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f8qwitj+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAA9CC4CEC7;
	Tue, 15 Oct 2024 06:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728972106;
	bh=hjLVAsAxmaKiJMaFRVR95Sfr8mL4+9Ch2JcbTvocQLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f8qwitj+XNX7VmqfwUPzOqQ3tX62tj/bJMrhXxBiUBNPV7km+tKe3BmC/jGpu8aeO
	 WY7Itdqyv3omV3ZJF4opKEmTc4TgT/isawrqO326Bw6GmW/FwKikym4GrYbm8J770O
	 ZluFfdA3Je2ReIeCf9X7kc2PuAb2cPjQPuqmNhzGo0w5My0Alx/U04jrMBc4VF7KYf
	 HVc7RCA7p3w2zV97n6tFG+i1+OYeKgm/IZsukdvLR6yFecXroGehmcCqWvcaDJx68u
	 MI2hqVkRRaBKzPIwjlBsh0sQanM8jwCf9GMIiMbKYMP3OwhZxBDs7TjfuwNIMLTIKV
	 XmT8ecabPa08g==
Date: Tue, 15 Oct 2024 08:01:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] pinctrl: meson: Add driver support for Amlogic A4
 SoCs
Message-ID: <aju3dgugbmj52i74j7csyuwejczsvk4sxtsdzuq62jutq7jxbe@wbc7fveloxv2>
References: <20241014-a4_pinctrl-v2-0-3e74a65c285e@amlogic.com>
 <20241014-a4_pinctrl-v2-2-3e74a65c285e@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241014-a4_pinctrl-v2-2-3e74a65c285e@amlogic.com>

On Mon, Oct 14, 2024 at 05:05:52PM +0800, Xianwei Zhao wrote:
> Add a new pinctrl driver for Amlogic A4 SoCs which share
> the same register layout as the previous Amlogic S4.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  drivers/pinctrl/meson/Kconfig              |    6 +
>  drivers/pinctrl/meson/Makefile             |    1 +
>  drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 1176 ++++++++++++++++++++++++++++
>  3 files changed, 1183 insertions(+)
> 
> diff --git a/drivers/pinctrl/meson/Kconfig b/drivers/pinctrl/meson/Kconfig
> index cc397896762c..3e90bb5ec442 100644
> --- a/drivers/pinctrl/meson/Kconfig
> +++ b/drivers/pinctrl/meson/Kconfig
> @@ -67,6 +67,12 @@ config PINCTRL_MESON_S4
>  	select PINCTRL_MESON_AXG_PMX
>  	default y
>  
> +config PINCTRL_AMLOGIC_A4
> +	tristate "Amlogic A4 SoC pinctrl driver"
> +	depends on ARM64
> +	select PINCTRL_MESON_AXG_PMX
> +	default y
> +
>  config PINCTRL_AMLOGIC_C3
>  	tristate "Amlogic C3 SoC pinctrl driver"
>  	depends on ARM64
> diff --git a/drivers/pinctrl/meson/Makefile b/drivers/pinctrl/meson/Makefile
> index 9e538b9ffb9b..c92a65a83344 100644
> --- a/drivers/pinctrl/meson/Makefile
> +++ b/drivers/pinctrl/meson/Makefile
> @@ -10,5 +10,6 @@ obj-$(CONFIG_PINCTRL_MESON_AXG) += pinctrl-meson-axg.o
>  obj-$(CONFIG_PINCTRL_MESON_G12A) += pinctrl-meson-g12a.o
>  obj-$(CONFIG_PINCTRL_MESON_A1) += pinctrl-meson-a1.o
>  obj-$(CONFIG_PINCTRL_MESON_S4) += pinctrl-meson-s4.o
> +obj-$(CONFIG_PINCTRL_AMLOGIC_A4) += pinctrl-amlogic-a4.o
>  obj-$(CONFIG_PINCTRL_AMLOGIC_C3) += pinctrl-amlogic-c3.o
>  obj-$(CONFIG_PINCTRL_AMLOGIC_T7) += pinctrl-amlogic-t7.o
> diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> new file mode 100644
> index 000000000000..dee1ae43edb5
> --- /dev/null
> +++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> @@ -0,0 +1,1176 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/*
> + * Pin controller and GPIO driver for Amlogic A4 SoC.
> + *
> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
> + * Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
> + *         Huqiang Qin <huqiang.qin@amlogic.com>
> + */
> +
> +#include <dt-bindings/gpio/amlogic-a4-gpio.h>

I do not see any usage of it.

Best regards,
Krzysztof


