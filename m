Return-Path: <linux-gpio+bounces-20629-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCBBAC6479
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 10:28:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1092418832D0
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 08:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74FD202F71;
	Wed, 28 May 2025 08:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WEH0pHT0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D252580EC;
	Wed, 28 May 2025 08:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748420886; cv=none; b=EArUe47KnLr+Oq/OQy8uz/dgZRBJNcwHuoB9YHfi+ChQvkXq0u/1mr8vUZgWStzPhX7Yb0O0QpaAO1a6RXWEGMuupZfQdT0mPfp1DVD/nYdeZgC+inp1RZKgQp7yi5bZl75AMQNw5n+E1xY5iZeoYo7GxKg5a2y91n9VhdtMTlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748420886; c=relaxed/simple;
	bh=5QawpBClqOpPhhlcu/fH26V+8lDsrsdbWKBN3lHj9ps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IoJ/j0nXtsAMfcDM+eJ5T3Pcl/hyAtwYez90OZDuRAGcFlLXjduK7Oujq756RLwMjTtnXQFn5hH+3Rt0KcHSdGs1y2dgZ8JJYVJgv46mmx/6dmabfoFt2cXbvNtCgo1gyRNvq+fERuxoB2K7bRL+zciWoEoZDV4/BAKL1pLNKiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WEH0pHT0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F11AFC4CEE7;
	Wed, 28 May 2025 08:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748420885;
	bh=5QawpBClqOpPhhlcu/fH26V+8lDsrsdbWKBN3lHj9ps=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WEH0pHT0tuETHSvRnrp4qQjj1fwRWk2zzFKK+wycleRmcuH5nQCGeW+o0qgaG57Jd
	 eR94B3SZuLL+SfEDMAcBrdlLZmCO940Q+nTRVzwuinHAtHWaPnKonGukAAeL770WjU
	 iHaUtN/kabQ6gHr1Cx/5NwFPcEI9jYpfIsFuhF5OHXrkoQiLOY0YDtiFryNHMuMmaZ
	 zDfjgFxWUmoRYIeF5chbsxdFDHkxNwS+BQyyCXn4sjg88QtKueJVYFfh3z8AmUcl3w
	 8WbeNX6HdOd9VMsdHf50XH976mZFrcAdy45K/vmyrrxBk/50AsJSaQvfDl7Eyj55CB
	 AKrKtRQhNI/hQ==
Message-ID: <85866e42-b3d4-462c-8890-e2a354627229@kernel.org>
Date: Wed, 28 May 2025 10:28:01 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/9] pinctrl: stm32: Introduce HDP driver
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com>
 <20250523-hdp-upstream-v3-3-bd6ca199466a@foss.st.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <20250523-hdp-upstream-v3-3-bd6ca199466a@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/05/2025 14:38, Clément Le Goffic wrote:
> This patch introduce the driver for the Hardware Debug Port available on

"Add driver...", see submitting patches



> STM32MP platforms. The HDP allows the observation of internal SoC
> signals by using multiplexers. Each HDP port can provide up to 16
> internal signals (one of them can be software controlled as a GPO).
> 
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> ---
>  drivers/pinctrl/stm32/Kconfig             |  14 +
>  drivers/pinctrl/stm32/Makefile            |   1 +
>  drivers/pinctrl/stm32/pinctrl-stm32-hdp.c | 720 ++++++++++++++++++++++++++++++
>  3 files changed, 735 insertions(+)
> 
> diff --git a/drivers/pinctrl/stm32/Kconfig b/drivers/pinctrl/stm32/Kconfig
> index 2656d3d3ae40..4b474cfd1f2c 100644
> --- a/drivers/pinctrl/stm32/Kconfig
> +++ b/drivers/pinctrl/stm32/Kconfig
> @@ -57,4 +57,18 @@ config PINCTRL_STM32MP257
>  	depends on OF && HAS_IOMEM
>  	default MACH_STM32MP25
>  	select PINCTRL_STM32
> +
> +config PINCTRL_STM32_HDP
> +	tristate "STMicroelectronics STM32 Hardware Debug Port (HDP) pin control"
> +	depends on OF && HAS_IOMEM
> +	default ARM64 || (ARM && CPU_V7)

I just cleaned this up and I still think this should be default for your
arch, not for every other platform during compile test. See bunch of my
commits "Do not enable by default during compile testing".


> +	select PINMUX
> +	select GENERIC_PINCONF
> +	select GPIOLIB
> +	help
> +	  The Hardware Debug Port allows the observation of internal signals.
> +	  It uses configurable multiplexer to route signals in a dedicated observation register.
> +	  This driver also permits the observation of signals on external SoC pins.
> +	  It permits the observation of up to 16 signals per HDP line.
> +
>  endif
> diff --git a/drivers/pinctrl/stm32/Makefile b/drivers/pinctrl/stm32/Makefile
> index 7b17464d8de1..98a1bbc7e16c 100644
> --- a/drivers/pinctrl/stm32/Makefile
> +++ b/drivers/pinctrl/stm32/Makefile
> @@ -11,3 +11,4 @@ obj-$(CONFIG_PINCTRL_STM32H743)	+= pinctrl-stm32h743.o
>  obj-$(CONFIG_PINCTRL_STM32MP135) += pinctrl-stm32mp135.o
>  obj-$(CONFIG_PINCTRL_STM32MP157) += pinctrl-stm32mp157.o
>  obj-$(CONFIG_PINCTRL_STM32MP257) += pinctrl-stm32mp257.o
> +obj-$(CONFIG_PINCTRL_STM32_HDP) += pinctrl-stm32-hdp.o
> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
> new file mode 100644
> index 000000000000..e91442eb566b
> --- /dev/null
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
> @@ -0,0 +1,720 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
> + * Author: Clément Le Goffic <clement.legoffic@foss.st.com> for STMicroelectronics.
> + */
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>

Not used.

> +#include <linux/pinctrl/consumer.h>
> +#include <linux/pinctrl/pinconf-generic.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm.h>
> +
Best regards,
Krzysztof

