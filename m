Return-Path: <linux-gpio+bounces-19870-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC617AB1750
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 16:26:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D83C189278E
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 14:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F265218599;
	Fri,  9 May 2025 14:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qx8gIq78"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06D02110;
	Fri,  9 May 2025 14:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746800771; cv=none; b=KyyEmQT6MhZ14KXOVzYFm3Jezg/6MCuUnIq4IyInt1Ky7QLLl7olql2uKR3bgkTTH/07jhlRnktAjDBlCKLjt6t5tltBwVgfpF93X41Kx+WaFwcZZsxBaqW8tfc1a7GLJb6DL3IkUpbI6GMwmff48yP79w5XsbZOgzzGfRfHVXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746800771; c=relaxed/simple;
	bh=4ufOcVydqxVVIvINctf2UypbLRoZqZIntPZ1NEBHHrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lOKGAcqAA/DNNr2e439wFj84tpddW1+Hq6ebfObLxOw00P73vKa2W+HhtsQT1Oj8UPSTaUdSTVoShxYC7WLv+NyJ0OQkx5ldexkfQEUUxoERaXST+ALe2/AxrcYz3QcRnE4iXslITn/Je6deFXQzrX9E71XF/cTFfXm0ydZXZ44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qx8gIq78; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDFF2C4CEE4;
	Fri,  9 May 2025 14:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746800770;
	bh=4ufOcVydqxVVIvINctf2UypbLRoZqZIntPZ1NEBHHrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qx8gIq78juITgvNr32N9pAP36xz7pzHCx6hrpnzvO7iOFM6Qn5T9hwASFaiE5lju6
	 VsOn5n1SU6c4kbXZFPaSG1PPegaNoe0kUu6Ih6dIw6h4SBo4ZWuAwqapL6tbsvsDMH
	 tR2s0WP+2LKnLJjOm22BQLSz/cbNUeAjty1AZ2Ub5knDzN42IqmaNpRwpvjBPr7HaU
	 +6xFYQVmzimfaBIHIWVTAAAbGtIGwPe56mljfmwMc3omkMKPYlpgJkqseH3sPhdtmL
	 66FE7PSPa1sg13pc3xnIjA/VfPFnXDfNHNHIWqimfFuDgPrtOOeiVA6zAxMPHPhpe8
	 tXbR7h+SwutaA==
Date: Fri, 9 May 2025 15:26:04 +0100
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-hardening@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v10 0/3] Maxim Integrated MAX77759 PMIC MFD-based drivers
Message-ID: <20250509142604.GF2492385@google.com>
References: <20250509-max77759-mfd-v10-0-962ac15ee3ef@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250509-max77759-mfd-v10-0-962ac15ee3ef@linaro.org>

On Fri, 09 May 2025, André Draszik wrote:

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

Okay, this (and the DT bindings) has been applied and submitted for
testing.  Once successful, I'll get a PR out for the other maintainers
to pull from.

Note to self: ib-mfd-gpio-nvmem-6.16

-- 
Lee Jones [李琼斯]

