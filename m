Return-Path: <linux-gpio+bounces-21551-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F47DAD8F64
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 16:23:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 210B71888D36
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 14:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB152E11DA;
	Fri, 13 Jun 2025 14:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q3ktUf3q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35E12E11A0;
	Fri, 13 Jun 2025 14:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749824349; cv=none; b=HTIM1oTaAHPUXukgafsOc3CtaESZGJ2JxdTvfwh89wkovf1WLghHgadBWGRQXDooRIH/yi6Ov09BwH9Tqm5iryNM71KZcEl6IFye21di6hQL/7/TP4F27ShpRZyOuGy5ZwWpR8l8T72EB0+T/yBee4ZPoNclv9itenUJzuTbIpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749824349; c=relaxed/simple;
	bh=7NuewwxhjIpWCfA/4QVSJBmlPJfiIKAOM2O4WYjnn7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ot+BQ2ywq/J8T1KEyyC7KsMaxYif0X7L67oKz1Modzpr9l+FoTpOuu+atHqNjrzErv3XkLf5UeWAw7XA4qKR5RbF2ChuoWENMZd20jts1XGP5EaZ4NbvwKH6UhUc243KtaEBblw2RV/jEIgWBIW2goV5ghktEg1EQqnUl7qEh80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q3ktUf3q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7397DC4CEE3;
	Fri, 13 Jun 2025 14:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749824348;
	bh=7NuewwxhjIpWCfA/4QVSJBmlPJfiIKAOM2O4WYjnn7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q3ktUf3qj4ZnrXBfTsZSTEqrTjZEQqDUVO1SfjZn1nPPO8B6rVbOv5zuIa4ayeM6W
	 WYsBQ207IxsEQl9D539ovU8y42/Qs5FU3DgpefWliVOCZQR1tepM7/N39hH0ePIK4k
	 U6ZZbbgW6SYDygD/wZ0FkX9JDrIey4bq7f6SpGGwC9KuitBDtJEm+MEzRI0XWHz/uc
	 MdOJ/4o2XY87ZEk9Bx5/iaAT4HSav0oAb2KoHM6yOcNM3OePGs1C36owXnxhS+3CB6
	 RIyNb2H3KiIJ0Za/ElPaPNlO55Lr1qj3dr6SW4IrZXGA75yCAVTEDLYDzLZW4YFafV
	 WDWP4XjWczz/g==
Date: Fri, 13 Jun 2025 15:19:02 +0100
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
Subject: Re: [PATCH 07/17] mfd: sec-common: Instantiate s2mpg10 bucks and
 ldos separately
Message-ID: <20250613141902.GI897353@google.com>
References: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
 <20250604-s2mpg1x-regulators-v1-7-6038740f49ae@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250604-s2mpg1x-regulators-v1-7-6038740f49ae@linaro.org>

On Wed, 04 Jun 2025, André Draszik wrote:

> Bucks can conceivably be used as supplies for LDOs, which means we need
> to instantiate them separately from each other so that the supply-
> consumer links can be resolved successfully at probe time.
> 
> By doing so, the kernel will defer and retry instantiating the LDOs
> once BUCKs have been created while without this change, it can be
> impossible to mark BUCKs as LDO supplies. This becomes particularly
> an issue with the upcoming support for the S2MPG11 PMIC, where
> typically certain S2MP10/11 buck rails supply certain S2MP11/10 LDO
> rails.
> 
> The platform_device's ::id field is used to inform the regulator driver
> which type of regulators (buck or ldo) to instantiate.

I'm confused.

There is nothing that differentiates the two, so why do you need to?

> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
>  drivers/mfd/sec-common.c            | 4 +++-
>  include/linux/mfd/samsung/s2mpg10.h | 5 +++++
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
> index 42d55e70e34c8d7cd68cddaecc88017e259365b4..8a1694c6ed8708397a51ebd4a49c22387d7e3495 100644
> --- a/drivers/mfd/sec-common.c
> +++ b/drivers/mfd/sec-common.c
> @@ -14,6 +14,7 @@
>  #include <linux/mfd/core.h>
>  #include <linux/mfd/samsung/core.h>
>  #include <linux/mfd/samsung/irq.h>
> +#include <linux/mfd/samsung/s2mpg10.h>
>  #include <linux/mfd/samsung/s2mps11.h>
>  #include <linux/mfd/samsung/s2mps13.h>
>  #include <linux/module.h>
> @@ -35,7 +36,8 @@ static const struct mfd_cell s2dos05_devs[] = {
>  
>  static const struct mfd_cell s2mpg10_devs[] = {
>  	MFD_CELL_NAME("s2mpg10-meter"),
> -	MFD_CELL_NAME("s2mpg10-regulator"),
> +	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_REGULATOR_CELL_ID_BUCKS),
> +	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_REGULATOR_CELL_ID_LDOS),
>  	MFD_CELL_NAME("s2mpg10-rtc"),
>  	MFD_CELL_OF("s2mpg10-clk", NULL, NULL, 0, 0, "samsung,s2mpg10-clk"),
>  	MFD_CELL_OF("s2mpg10-gpio", NULL, NULL, 0, 0, "samsung,s2mpg10-gpio"),
> diff --git a/include/linux/mfd/samsung/s2mpg10.h b/include/linux/mfd/samsung/s2mpg10.h
> index 9f5919b89a3c286bf1cd6b3ef0e74bc993bff01a..3e8bc65078472518c5e77f8bd199ee403eda18ea 100644
> --- a/include/linux/mfd/samsung/s2mpg10.h
> +++ b/include/linux/mfd/samsung/s2mpg10.h
> @@ -8,6 +8,11 @@
>  #ifndef __LINUX_MFD_S2MPG10_H
>  #define __LINUX_MFD_S2MPG10_H
>  
> +enum s2mpg10_regulator_mfd_cell_id {
> +	S2MPG10_REGULATOR_CELL_ID_BUCKS = 1,
> +	S2MPG10_REGULATOR_CELL_ID_LDOS = 2,
> +};
> +
>  /* Common registers (type 0x000) */
>  enum s2mpg10_common_reg {
>  	S2MPG10_COMMON_CHIPID,
> 
> -- 
> 2.49.0.1204.g71687c7c1d-goog
> 

-- 
Lee Jones [李琼斯]

