Return-Path: <linux-gpio+bounces-7436-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBAF90796A
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 19:08:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 281EF286F2D
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 17:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E65149C6C;
	Thu, 13 Jun 2024 17:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kji33KUA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0AB4C6B;
	Thu, 13 Jun 2024 17:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718298498; cv=none; b=hg3cCp+/PEKYs7f1Sep0Ufniw5Y83AyxCo+GkG41SRUdJ7gXoM/C8q8EE8iMjuSKH/MZiPWZ9pnuMBCMHNHPTtY2fmreibLP3Suw7Z/nnCpGe51n9FyxNkIivZWLxKhcfk65AAzIBBYaYwrwbaq2DafoFcVhLFsZ6Pg53u+r8/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718298498; c=relaxed/simple;
	bh=/mtpv7oQiB/HDp/WMox9w7Z6Glgw+lsaHSyHSzXTWnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FQCbox2aNY3AfnBWxiXXiDKOjdUrBP/1zgw4ZmBDjXHbUKJsa/YfA4cXcQawjP0pZ8kWczbCcmeXQYb7pSzanxHSLmrXX9G0ToSjxSrgJaeEId3Eoa4OYjKbHM4kCwG/dZpzjZfFsGCoC/q/ZG2m8CBuLO3SlCVjNlXrWfCo0Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kji33KUA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EA55C3277B;
	Thu, 13 Jun 2024 17:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718298497;
	bh=/mtpv7oQiB/HDp/WMox9w7Z6Glgw+lsaHSyHSzXTWnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kji33KUAszF4cmuHylrzAFirU0EPFC5g79J6Z9DPYf+d1UcS5mMwA0fMS7EvkEUiO
	 rRWaNB2iErp6PePjPgvoD+b2VLVc06h1pPT7BIRbPQYeM1DK1NjZAUDt+/rYGP+PN7
	 3gL9u2LbjI6hPjo/Kp5gFQ4JqV5CXSttTaU3iPCzk9x3uTAqMfc4DKppjDA+IF88ho
	 529fdp2nWG0brVsVe2N/wi9CkC3vE0t3wBo9uN06AVakPJ/Jj4Or2welFU3vumKzk6
	 5f4y7uFW/7vXZvonpkdAUH1s1OWcA3AcDdrr0xri0UkAjLrHM0pmCrTFm4X6Wf/JPw
	 +/SllKTYDwMOw==
Date: Thu, 13 Jun 2024 11:08:16 -0600
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
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: Add support for Amlogic A4 SoCs
Message-ID: <20240613170816.GA2020944-robh@kernel.org>
References: <20240611-a4_pinctrl-v1-0-dc487b1977b3@amlogic.com>
 <20240611-a4_pinctrl-v1-1-dc487b1977b3@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240611-a4_pinctrl-v1-1-dc487b1977b3@amlogic.com>

On Tue, Jun 11, 2024 at 01:10:57PM +0800, Xianwei Zhao wrote:
> Add the new compatible name for Amlogic A4 pin controller, and add
> a new dt-binding header file which document the detail pin names.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  .../bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml |  2 +
>  .../dt-bindings/gpio/amlogic,a4-aobus-pinctrl.h    | 21 +++++
>  .../dt-bindings/gpio/amlogic,a4-periphs-pinctrl.h  | 93 ++++++++++++++++++++++
>  3 files changed, 116 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
> index d9e0b2c48e84..f5eefa0fab5b 100644
> --- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
> @@ -15,6 +15,8 @@ allOf:
>  properties:
>    compatible:
>      enum:
> +      - amlogic,a4-aobus-pinctrl
> +      - amlogic,a4-periphs-pinctrl
>        - amlogic,c3-periphs-pinctrl
>        - amlogic,t7-periphs-pinctrl
>        - amlogic,meson-a1-periphs-pinctrl
> diff --git a/include/dt-bindings/gpio/amlogic,a4-aobus-pinctrl.h b/include/dt-bindings/gpio/amlogic,a4-aobus-pinctrl.h
> new file mode 100644
> index 000000000000..7c7e746baed5
> --- /dev/null
> +++ b/include/dt-bindings/gpio/amlogic,a4-aobus-pinctrl.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
> + * Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
> + */
> +
> +#ifndef _DT_BINDINGS_AMLOGIC_A4_AOBUS_PINCTRL_H
> +#define _DT_BINDINGS_AMLOGIC_A4_AOBUS_PINCTRL_H
> +
> +/* GPIOAO */
> +#define GPIOAO_0			0
> +#define GPIOAO_1			1
> +#define GPIOAO_2			2
> +#define GPIOAO_3			3
> +#define GPIOAO_4			4
> +#define GPIOAO_5			5
> +#define GPIOAO_6			6

I find defines with the value of the define in the name pretty 
pointless.

> +
> +#define GPIO_TEST_N			7
> +
> +#endif
> diff --git a/include/dt-bindings/gpio/amlogic,a4-periphs-pinctrl.h b/include/dt-bindings/gpio/amlogic,a4-periphs-pinctrl.h
> new file mode 100644
> index 000000000000..dfabca4b4790
> --- /dev/null
> +++ b/include/dt-bindings/gpio/amlogic,a4-periphs-pinctrl.h
> @@ -0,0 +1,93 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
> + * Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
> + */
> +
> +#ifndef _DT_BINDINGS_AMLOGIC_A4_PERIPHS_PINCTRL_H
> +#define _DT_BINDINGS_AMLOGIC_A4_PERIPHS_PINCTRL_H
> +
> +/* GPIOE */
> +#define GPIOE_0				0
> +#define GPIOE_1				1
> +
> +/* GPIOD */
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

I'm not really much of a fan of using defines for GPIOs, but if you do, 
wouldn't be better to split banks and lines up rather than a global 
number space. See ASPEED_GPIO() or tegra header.

Rob

