Return-Path: <linux-gpio+bounces-21552-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD9EAD8F77
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 16:26:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6ECF13BC28E
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 14:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F2F17A2FA;
	Fri, 13 Jun 2025 14:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C1eaC9Sk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B05D19F120;
	Fri, 13 Jun 2025 14:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749824560; cv=none; b=QTfnkGHLJmoMY+xbs4T6f1kFjcYZfEzlWMHZX5R4i3rWiPMhG8shHSg0Y/iYB4x0a/hQ9QQ7LLPa0pNy91iy3vJgmUpvOwcTNXdwjFA6lRkLlimoCS0HILbu0QJ04edx1u0bTGuJmpvBKIFtzDhmM9QzMlHwZAFJjNaDO/mUGrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749824560; c=relaxed/simple;
	bh=oMg+kCCQTmB5ZzySDND4ghksqjUJeDVjXxmeeKJnxoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PgcnMNPfFqmJ7mh56i0S/x3D2cLgX9ZY/rLkXLo8Zzfap4nUzxZ9GhQl2BcRJJLcxRvx/+wcXYi2/rpTYACO+nst/8Y74dbpf/cb5dVjpC6EjU20dtQ8FQR5Ms1pkbRe4QBOk1Nad9LVPLuW/1J8+kb2qGeCofSuK5ONAgimMbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C1eaC9Sk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AE42C4CEE3;
	Fri, 13 Jun 2025 14:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749824560;
	bh=oMg+kCCQTmB5ZzySDND4ghksqjUJeDVjXxmeeKJnxoo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C1eaC9SkKYz2XzYwfeOxv9fxtZOckbC9Kwxys7+R94VpG+38E6rEVjj0Yty2yh4Dp
	 n+mPSuHBjKU18+2auN61ryNWcSiQtd+ijdhD5HAIzaW9yR4KxfkfSiZnWor/oR8s3F
	 N8/3Y6FW45HSME2oB1hjhJMKlRHHFxRGqeVUXz7aZhDS0DaVJ9485dtGl43YX8pcez
	 /hJZJSmi+kNXDK4+iNgM50lL0zXEXdNdcPjvGE54VL5cv+/bUPHmzSfYpbekdm/BYZ
	 Gh3w0lIZJl3mNzR3NRjSlGu0s3D9b1DZy8UvePfSSrC/O7FJUFc5OX3fM4w0db/pCh
	 PTowGNIuXM9iA==
Date: Fri, 13 Jun 2025 15:22:34 +0100
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Peter Griffin <peter.griffin@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 08/17] mfd: sec: Add support for S2MPG11 PMIC via ACPM
Message-ID: <20250613142234.GJ897353@google.com>
References: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
 <20250604-s2mpg1x-regulators-v1-8-6038740f49ae@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250604-s2mpg1x-regulators-v1-8-6038740f49ae@linaro.org>

On Wed, 04 Jun 2025, André Draszik wrote:

> Add support for Samsung's S2MPG11 PMIC, which is a Power Management IC
> for mobile applications with buck converters, various LDOs, and power
> meters. It typically complements an S2MPG10 PMIC in a main/sub
> configuration as the sub-PMIC.
> 
> Like S2MPG10, communication is not via I2C, but via the Samsung ACPM
> firmware.
> 
> Note: The firmware uses the ACPM channel ID and the Speedy channel ID
> to select the PMIC address. Since these are firmware properties, they
> can not be retrieved from DT, but instead are deducted from the
> compatible for now.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> 
> ---
> Note: checkpatch suggests to update MAINTAINERS, but the new file is
> covered already due to using a wildcard.
> ---
>  drivers/mfd/sec-acpm.c              | 213 +++++++++++++++++-
>  drivers/mfd/sec-common.c            |  18 +-
>  drivers/mfd/sec-irq.c               |  67 +++++-
>  include/linux/mfd/samsung/core.h    |   1 +
>  include/linux/mfd/samsung/irq.h     |  99 +++++++++
>  include/linux/mfd/samsung/s2mpg11.h | 420 ++++++++++++++++++++++++++++++++++++
>  6 files changed, 807 insertions(+), 11 deletions(-)

Nice patch.

[...]

> +static const struct mfd_cell s2mpg11_devs[] = {
> +	MFD_CELL_NAME("s2mpg11-meter"),
> +	MFD_CELL_BASIC("s2mpg11-regulator", NULL, NULL, 0, S2MPG10_REGULATOR_CELL_ID_BUCKS),
> +	MFD_CELL_BASIC("s2mpg11-regulator", NULL, NULL, 0, S2MPG10_REGULATOR_CELL_ID_LDOS),

I still don't understand this.  Let's talk on the previous patch.

> +	MFD_CELL_OF("s2mpg11-gpio", NULL, NULL, 0, 0, "samsung,s2mpg11-gpio"),
> +};

-- 
Lee Jones [李琼斯]

