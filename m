Return-Path: <linux-gpio+bounces-18642-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35251A83E56
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 11:20:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EAB607AADBF
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 09:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C038A221F36;
	Thu, 10 Apr 2025 09:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QQQ3DxEG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6979721D3F6;
	Thu, 10 Apr 2025 09:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744276771; cv=none; b=XaMZl/keiZ1Fwh+q/A033DPjUBXv8+pJb5zj1zok/z4GPa66rmT0U+6LeAwX1oE9ST4c3nYGutq/5mb1uFj1f8bPveVt4jw/Ul20CMevs9nJ2k6WeB+5Iqdg+3QzCBrN3x3is2qn1H/N327+r1M2AbzTPK/vl83MbWrbecMBBjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744276771; c=relaxed/simple;
	bh=jyp8zbK16dxt+pX+B0WDW/DB8XOD++gFP8UT7RAEGFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bM4VgSxUoskY6P2Q4H2Mzxl87mHZdAWl6ODX5Lwd/3HU61rvHrWRrmMRvvX5h0blBqQi6DreOYxM3RBbPJDHYxrelItlYnLNslUr4jlAnpG7PiC3AP79FTbxA4/80n8qbhH8GukRHLMCcQRqp2YnnotUED82yhGzjkIzo52xzRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QQQ3DxEG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81EFAC4CEDD;
	Thu, 10 Apr 2025 09:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744276770;
	bh=jyp8zbK16dxt+pX+B0WDW/DB8XOD++gFP8UT7RAEGFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QQQ3DxEGDF9pyyPblYM8Xn5VeUqluQYvDaI3IAIHr6q2ffOCVY3X/b5HOWc2o2i1t
	 nWeirPwmNvuLwtoBo1PxW+6UXKm4wiiwi9pQXAvmTOrGanlYqcqnTfLi7TUcmPrelB
	 4EdpxjCoARZesnvC4MCRxDJ3cNiTc8QRuoRpOWyQy9XqnWFMOFGXUA+xPfGo2ZnTPM
	 RyUoDsMFHbAbHKmgYOCkISiKgIDouoqPljHq5vtmoBy21+UyWnDKt5POkKllL84wVS
	 vpe/wZYS+VQksyrEeZrvHemdal8oyoB63RORYlPI+ifTdlCt78lKATAB/QUBW3U43B
	 IVtqBFo6RAV3g==
Date: Thu, 10 Apr 2025 10:19:24 +0100
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-hardening@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v6 0/6] Maxim Integrated MAX77759 PMIC MFD-based drivers
Message-ID: <20250410091924.GR372032@google.com>
References: <20250325-max77759-mfd-v6-0-c0870ca662ba@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250325-max77759-mfd-v6-0-c0870ca662ba@linaro.org>

On Tue, 25 Mar 2025, André Draszik wrote:

> Hi,
> 
> This series improves support for the Maxim Integrated MAX77759
> companion PMIC for USB Type-C applications using the MFD framework.
> 
> This series must be applied in-order, due to interdependencies of some
> of the patches:
> * to avoid use of undocumented compatibles by the newly added drivers,
>   the bindings are added first in this series
> * patch 1 ("dt-bindings: gpio: add max77759 binding") also creates a
>   new MAINTAINERS entry, including a wildcard match for the other
>   bindings in this series
> * patch 3 ("dt-bindings: mfd: add max77759 binding") references the
>   bindings added in patch 1 and 2 and can not work if those aren't
>   available
> * patch 4 ("mfd: max77759: add Maxim MAX77759 core mfd driver") adds
>   the core MFD driver, which also exposes an API to its leaf drivers
>   and is used by patches 5 and 6
> * patches 5 and 6 won't compile without patch 4
> 
> The MAX77759 PMIC includes Battery Charger, Fuel Gauge, temperature
> sensors, USB Type-C Port Controller (TCPC), NVMEM, and a GPIO expander.
> 
> This PMIC is used on the Google Pixel 6 and 6 Pro (oriole / raven).
> 
> This series adds support for the top-level MFD device, the gpio, and
> nvmem cells. Other components are excluded for the following reasons:
> 
>     While in the same package, Fuel Gauge and TCPC have separate and
>     independent I2C addresses, register maps, interrupt lines, and
>     aren't part of the top-level package interrupt hierarchy.
>     Furthermore, a driver for the TCPC part exists already (in
>     drivers/usb/typec/tcpm/tcpci_maxim_core.c).
> 
>     I'm leaving out temperature sensors and charger in this submission,
>     because the former are not in use on Pixel 6 and I therefore can
>     not test them, and the latter can be added later, once we look at
>     the whole charging topic in more detail.
> 
> To make maintainers' work easier, I am planning to send the relevant
> DTS and defconfig changes via a different series, unless everything
> is expected to go via Lee's MFD tree in one series?
> 
> Cheers,
> Andre'
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
> Changes in v6:
> - add one missing change in core driver
> - Link to v5: https://lore.kernel.org/r/20250325-max77759-mfd-v5-0-69bd6f07a77b@linaro.org
> 
> Changes in v5:
> - core: incorporate Lee's comments (hoping I didn't miss any :-)
> - Link to v4: https://lore.kernel.org/r/20250312-max77759-mfd-v4-0-b908d606c8cb@linaro.org
> 
> Changes in v4:
> - collect tags
> - mfd: add missing build_bug.h include
> - mfd: update an irq chip comment
> - mfd: fix a whitespace in register definitions
> - Link to v3: https://lore.kernel.org/r/20250228-max77759-mfd-v3-0-0c3627d42526@linaro.org
> 
> Changes in v3:
> - collect tags
> - mfd: drop gpio-controller and gpio-cells, GPIO is provided by the
>   child (Rob)
> - gpio: drop duplicate init of 'handled' variable in irq handler
> - gpio: use boolean with IRQ_RETVAL() (Linus)
> - gpio: drop 'virq' variable inside irq handler to avoid confusion
>   (Linus)
> - gpio: drop assignment of struct gpio_chip::owner (Linus)
> - Link to v2: https://lore.kernel.org/r/20250226-max77759-mfd-v2-0-a65ebe2bc0a9@linaro.org
> 
> Changes in v2:
> - reorder bindings patches to avoid validation failures
> - add dependency information to cover letter (Krzysztof)
> - fix max77759_gpio_direction_from_control() in gpio driver
> - gpio: drop 'interrupts' property from binding and sort properties
>   alphabetically (Rob)
> - nvmem: drop example from nvmem binding as the MFD binding has a
>   complete one (Rob)
> - nvmem: rename expected nvmem subdev nodename to 'nvmem-0' (Rob)
> - mfd: add kernel doc
> - mfd: fix an msec / usec typo
> - mfd: error handling of devm_mutex_init (Christophe)
> - whitespace fixes & tidy-ups (Christophe)
> - Link to v1: https://lore.kernel.org/r/20250224-max77759-mfd-v1-0-2bff36f9d055@linaro.org
> 
> ---
> André Draszik (6):
>       dt-bindings: gpio: add max77759 binding
>       dt-bindings: nvmem: add max77759 binding
>       dt-bindings: mfd: add max77759 binding
>       mfd: max77759: add Maxim MAX77759 core mfd driver
>       gpio: max77759: add Maxim MAX77759 gpio driver
>       nvmem: max77759: add Maxim MAX77759 NVMEM driver
> 
>  .../bindings/gpio/maxim,max77759-gpio.yaml         |  44 ++
>  .../devicetree/bindings/mfd/maxim,max77759.yaml    |  99 +++
>  .../bindings/nvmem/maxim,max77759-nvmem.yaml       |  32 +
>  MAINTAINERS                                        |  10 +
>  drivers/gpio/Kconfig                               |  13 +
>  drivers/gpio/Makefile                              |   1 +
>  drivers/gpio/gpio-max77759.c                       | 524 ++++++++++++++++
>  drivers/mfd/Kconfig                                |  20 +
>  drivers/mfd/Makefile                               |   1 +
>  drivers/mfd/max77759.c                             | 690 +++++++++++++++++++++
>  drivers/nvmem/Kconfig                              |  12 +
>  drivers/nvmem/Makefile                             |   2 +
>  drivers/nvmem/max77759-nvmem.c                     | 156 +++++
>  include/linux/mfd/max77759.h                       | 165 +++++
>  14 files changed, 1769 insertions(+)
> ---
> base-commit: 9388ec571cb1adba59d1cded2300eeb11827679c
> change-id: 20250224-max77759-mfd-aaa7a3121b62
> 
> Best regards,
> -- 
> André Draszik <andre.draszik@linaro.org>

Didn't apply cleanly.  Please rebase onto v6.15-rc1.

-- 
Lee Jones [李琼斯]

