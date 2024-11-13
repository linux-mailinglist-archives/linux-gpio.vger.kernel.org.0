Return-Path: <linux-gpio+bounces-12990-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FD99C7AA5
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 19:06:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FDD7286212
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 18:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBE0F20494A;
	Wed, 13 Nov 2024 18:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z+PSwtbZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701A21FEFA0;
	Wed, 13 Nov 2024 18:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731521047; cv=none; b=nMyvKvNyiWjrJwMlaLiTcQ1gL3CAo+3O8N8x8ZzRfaoxrcDsmfiIM5Us1+5uae1dJUACMA7hwFtTXz2XtLaQpvyhP1jjxa1xl30QXUWeKHEQbGmrHWDRC7dr/qUr1CDqmR7a6G00q+dwD8CL8ODoXVxP0BcPZxjWJ0KdUBWPpWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731521047; c=relaxed/simple;
	bh=nhpDZhwOTC7eq1C5andGhd85RsJd8uDMIHm6QrWJbRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cP1cHNpE+ZW2OTK+K/1euTkxaano+weMXpvne7A+VwPDES1KZul8t+fsWDaQk/Zz7a7XnQYPmlEBx/PHCbcQ/T4tQuiTH7V1EzdEc97YqYLQqRkHGThn5kp7OU+vISy6FZGH2NZwyebtAxvIoRpYpGzoYC2/aZbCtwDNMe1nlTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z+PSwtbZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC10DC4CEC3;
	Wed, 13 Nov 2024 18:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731521047;
	bh=nhpDZhwOTC7eq1C5andGhd85RsJd8uDMIHm6QrWJbRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z+PSwtbZVHbcyPrMdnmwJ8aIqQWdg4o0ysf4aXQgGrCOJS7yST7kceJCqvR9XqqsF
	 +IwVbKONTuZZ7up1wumL3Uj3RrxwEblLjdllO9MvmZY3SU1mXOhgzROj9Ck3bPk4yg
	 Bduj2rZSf+V6p2MQ1ri8ZTZ0p+JQxg5hiwFbK+2P+Ay8ckqqYoizvhzqLM+DcnFOyl
	 iTKKERLYcR3zr0zQX+kT9U+e4Q78OPL6rphVL29JadjTEp2krzHouC8zq7HCSt5wtM
	 s1s2Tgl9x7YMp7wZFkvzNx44qLyeBfeT+aWtaHusrxpJgUTwgifK0ixwK66LWJp5IQ
	 OzmihPx61K0Nw==
Date: Wed, 13 Nov 2024 12:04:05 -0600
From: Rob Herring <robh@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 4/5] pinctrl: meson: Add driver support for Amlogic A4
 SoCs
Message-ID: <20241113180405.GA653353-robh@kernel.org>
References: <20241113-a4_pinctrl-v6-0-35ba2401ee35@amlogic.com>
 <20241113-a4_pinctrl-v6-4-35ba2401ee35@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113-a4_pinctrl-v6-4-35ba2401ee35@amlogic.com>

On Wed, Nov 13, 2024 at 03:29:42PM +0800, Xianwei Zhao wrote:
> Add a new pinctrl driver for Amlogic A4 SoCs which share
> the same register layout as the previous Amlogic S4.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  drivers/pinctrl/meson/Kconfig              |    6 +
>  drivers/pinctrl/meson/Makefile             |    1 +
>  drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 1324 ++++++++++++++++++++++++++++
>  3 files changed, 1331 insertions(+)
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
> index 000000000000..edc5f2ba2c8a
> --- /dev/null
> +++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> @@ -0,0 +1,1324 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/*
> + * Pin controller and GPIO driver for Amlogic A4 SoC.
> + *
> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
> + * Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
> + *         Huqiang Qin <huqiang.qin@amlogic.com>
> + */
> +
> +#include "pinctrl-meson.h"
> +#include "pinctrl-meson-axg-pmx.h"
> +#include <dt-bindings/gpio/amlogic-gpio.h>
> +
> +/* Standard port */
> +
> +#define GPIOE_0				0
> +#define GPIOE_1				1
> +
> +#define GPIOD_0				2
> +#define GPIOD_1				3
> +#define GPIOD_2				4
> +#define GPIOD_3				5
> +#define GPIOD_4				6
> +#define GPIOD_5				7
> +#define GPIOD_6				8
> +#define GPIOD_7				9
> +#define GPIOD_8				10
> +#define GPIOD_9				11
> +#define GPIOD_10			12
> +#define GPIOD_11			13
> +#define GPIOD_12			14
> +#define GPIOD_13			15
> +#define GPIOD_14			16
> +#define GPIOD_15			17

The conversion from bank+index to a single index space seems less than 
ideal, and looks like a work-around to fit into the existing driver from 
a brief look at it.

If there's not really banks of GPIOs here, then DT shouldn't have them 
either. The question is does anything need to know the bank number 
and/or index? If it's only for human readability (and matching to 
datasheet), then just something like this can be done:

#define GPIOD(n) (2 + (n))

Rob

