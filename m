Return-Path: <linux-gpio+bounces-19779-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C04B9AAFC4D
	for <lists+linux-gpio@lfdr.de>; Thu,  8 May 2025 16:03:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3ADE04A48D5
	for <lists+linux-gpio@lfdr.de>; Thu,  8 May 2025 14:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03F9722F154;
	Thu,  8 May 2025 14:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S4wet2nT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8E722D9F7;
	Thu,  8 May 2025 14:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746712985; cv=none; b=u47xmWkY8KaqLlnakWTTSCfBpdJdkGKgyIAtZXvmPVyv/vb2H8ccES9uo70lHdMTQcxNgfWXEB1dN+eRrf1idIbmj2aHNpUSOLOoN8c5uHkx/zE3GKkGaBfmee2AAvOteL3mXxYIldIz9R+KPABY7twja8K0Lg6ybt9mOVKCfb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746712985; c=relaxed/simple;
	bh=C/L/pftHGTCWGdWgJfT7sKUaqugtRJmVqtPPXBpoS98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U3Ozt6/MRLk4X1MA0hJG3/K1kCqyQBYhzjQLapcHh1RpvUyNuYBBs0oYWXVOF1t8j3rG0jSV0/KsOwYl1F277yul1/2s5hBM4zKtcnUN/vtD0SKXdUxmQz0Nn7OVnfQPIL3N4Bg2+lghTJtIBTeKmM15Fg6ZuvlwTQQLDJUlPQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S4wet2nT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3777C4CEE7;
	Thu,  8 May 2025 14:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746712985;
	bh=C/L/pftHGTCWGdWgJfT7sKUaqugtRJmVqtPPXBpoS98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S4wet2nTFae/hq0ivrloA8WadwPEauM183hm9+Bu4YlWD2GkEMsbffzfnzdIYa8iy
	 XUsPA30tiKJodYhuowT1dMdJWwlU3+XOnO/P6qK6MajeIsJzWIcopRtYo7mnp9LtIo
	 2IE51HXnnaP3GYIFFO/fh8+OBvQtunqBJgkllvPicUyT2b2+jyO8gmIOGfkkp3taBP
	 reI2//D4TvUWuAwwJklHmqglJe2fLRaPBiNohoQqJIXM2y2Ws6h4THDRxQ7mSUndyl
	 2yakR5t27fi+iNZ75/KgbctlgpbjHN2yMe6t5fj9HchbYtEYh7xJa9VcAPnH+un7jB
	 Ix8+r/CvflXYQ==
Date: Thu, 8 May 2025 15:02:59 +0100
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
	linux-gpio@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v9 4/6] mfd: max77759: add Maxim MAX77759 core mfd driver
Message-ID: <20250508140259.GN3865826@google.com>
References: <20250430-max77759-mfd-v9-0-639763e23598@linaro.org>
 <20250430-max77759-mfd-v9-4-639763e23598@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250430-max77759-mfd-v9-4-639763e23598@linaro.org>

On Wed, 30 Apr 2025, André Draszik wrote:

> The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
> includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
> Port Controller (TCPC), NVMEM, and a GPIO expander.
> 
> Fuel Gauge and TCPC have separate and independent I2C addresses,
> register maps, and interrupt lines and are therefore excluded from the
> MFD core device driver here.
> 
> The GPIO and NVMEM interfaces are accessed via specific commands to the
> built-in microprocessor. This driver implements an API that client
> drivers can use for accessing those.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> 
> ---
> v6: really use postinc
> 
> v5:
> * update all (I hope) of Lee's comments:
> * file header C comment (not C++)
> * drop references to 'MFD'
> * extra indent register bit definitions
> * make 'struct max77759' public
> * drop comments that were used for visual separation only
> * drop MAX77759_*_REG_LAST_REGISTER defines
> * add comments to regmap ranges
> * use longer lines
> * sort local variable in reverse christmas tree order
> * update comments in max77759_maxq_command()
> * drop BUILD_BUG_ON()
> * use dev_err() in max77759_maxq_command()
> * reflow max77759_create_i2c_subdev() slightly and update error messages
> * drop useless comment in max77759_add_chained_maxq()
> * reflow max77759_probe()
> * consistent upper-/lower-case in messages
> 
> v4:
> * add missing build_bug.h include
> * update an irq chip comment
> * fix a whitespace in register definitions
> 
> v2:
> * add kernel doc for max77759_maxq_command() and related structs
> * fix an msec / usec typo
> * add missing error handling of devm_mutex_init() (Christophe)
> * align sentinel in max77759_of_id[] with max77759_i2c_id[]
>   (Christophe)
> * some tidy-ups in max77759_maxq_command() (Christophe)
> 
> max77759 Lee's updates
> ---
>  MAINTAINERS                  |   2 +
>  drivers/mfd/Kconfig          |  20 ++
>  drivers/mfd/Makefile         |   1 +
>  drivers/mfd/max77759.c       | 690 +++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/max77759.h | 165 +++++++++++
>  5 files changed, 878 insertions(+)

This looks okay to me now.

I assume the other patches depend on this one?

[...]

> diff --git a/drivers/mfd/max77759.c b/drivers/mfd/max77759.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..15723ac3ef49771eafd5c2e9984abc550eec7aa1
> --- /dev/null
> +++ b/drivers/mfd/max77759.c
> @@ -0,0 +1,690 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright 2020 Google Inc
> + * Copyright 2025 Linaro Ltd.
> + *
> + * Core driver for Maxim MAX77759 companion PMIC for USB Type-C
> + */

[...]

> +int max77759_maxq_command(struct max77759 *max77759,
> +			  const struct max77759_maxq_command *cmd,
> +			  struct max77759_maxq_response *rsp)
> +{
> +	DEFINE_FLEX(struct max77759_maxq_response, _rsp, rsp, length, 1);
> +	struct device *dev = regmap_get_device(max77759->regmap_maxq);
> +	static const unsigned int timeout_ms = 200;
> +	int ret;
> +
> +	if (cmd->length > MAX77759_MAXQ_OPCODE_MAXLENGTH)
> +		return -EINVAL;
> +
> +	/*
> +	 * As a convenience for API users when issuing simple commands, rsp is
> +	 * allowed to be NULL. In that case we need a temporary here to write
> +	 * the response to, as we need to verify that the command was indeed
> +	 * completed correctly.
> +	 */
> +	if (!rsp)
> +		rsp = _rsp;
> +
> +	if (!rsp->length || rsp->length > MAX77759_MAXQ_OPCODE_MAXLENGTH)
> +		return -EINVAL;
> +
> +	guard(mutex)(&max77759->maxq_lock);
> +
> +	reinit_completion(&max77759->cmd_done);
> +
> +	/*
> +	 * MaxQ latches the message when the DATAOUT32 register is written. If
> +	 * cmd->length is shorter we still need to write 0 to it.
> +	 */
> +	ret = regmap_bulk_write(max77759->regmap_maxq,
> +				MAX77759_MAXQ_REG_AP_DATAOUT0, cmd->cmd,
> +				cmd->length);
> +	if (!ret && cmd->length < MAX77759_MAXQ_OPCODE_MAXLENGTH)
> +		ret = regmap_write(max77759->regmap_maxq,
> +				   MAX77759_MAXQ_REG_AP_DATAOUT32, 0);
> +	if (ret) {
> +		dev_err(dev, "writing command failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* wait for response from MaxQ */

If you have to respin this patch, please s/wait/Wait/.

If not, please send a subsequent patch.

-- 
Lee Jones [李琼斯]

