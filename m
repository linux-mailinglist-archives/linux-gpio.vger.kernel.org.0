Return-Path: <linux-gpio+bounces-30254-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBC6D01E4F
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 10:44:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AF123062D7C
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 09:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68AE73A9DBF;
	Thu,  8 Jan 2026 09:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tZdQHdx4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A383806BE;
	Thu,  8 Jan 2026 09:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767863093; cv=none; b=WVjdKWy+pVJuNWuGVa97e3V+T4l8JHiGPPdcyRaEXWONvVQDxurosnOpnDdOr8VKMK/A7kqPF+lguG/ZY0PMifpjVvzcAINqaezIu35OahQ0NZtxmzyhkxPXU1CoZRgNMOUZhq6yB38zzHWFYVtL0XeQftd7gsTtKsaAHY7F+1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767863093; c=relaxed/simple;
	bh=43HsA+1OXyUWr3mVZANSq6uxii1VuqzSvvFempqNf50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J6s7jUzYvMIQBPKG/A5WDtEf+3SBkCihiMbg+K7QrzwHYBS487O+u0MSoEHbGXcQgr0dkfVuXWq1mqMcg67jizK9dLR35+PV6upErAYqDN8l742N3cB31TmiTIQKyaF7OdMqiJ0b8GT308dYuC6my7my0JdfAUwNfs5WWPv5VME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tZdQHdx4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95E5AC16AAE;
	Thu,  8 Jan 2026 09:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767863091;
	bh=43HsA+1OXyUWr3mVZANSq6uxii1VuqzSvvFempqNf50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tZdQHdx43glaOblk/H1NlkrIEfCgVhc9ixqj8kbFiMUqX7aVTE299Mp40oqArJUSZ
	 kyhZWgNQN3uxMYQn2IfRo2RKMK4pDK8QiXf734qQV2+2HFDCZ5mrDC+c1YRJyU+v8t
	 pZHbO3CIlPlOcKLnCA9bvFXZRNzkzIJTe9ODoa1q/fh97AN7MFPOlbVcSfmYO3s83h
	 Li+f+GDArxZWQnZds67025iTikParUWNxhPZciqmO7+I9kAMNNkJzGCvYBUwKXL+Ca
	 OljmmlIOv2MKdYTTR1KFTfF0PEcY0SulfOlvOmzk3AwUQDhvGADruz577Vc3A/DX8m
	 FJD1T6e7PJOVQ==
Date: Thu, 8 Jan 2026 10:04:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: sa8775p-lpass-lpi: Add SA8775P
 LPASS pinctrl
Message-ID: <20260108-archetypal-potoo-of-felicity-8ac479@quoll>
References: <20260107192007.500995-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260107192007.500995-3-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260107192007.500995-3-mohammad.rafi.shaik@oss.qualcomm.com>

On Thu, Jan 08, 2026 at 12:50:07AM +0530, Mohammad Rafi Shaik wrote:
> Add pin control support for Low Power Audio SubSystem (LPASS)
> of Qualcomm SA8775P SoC.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/Kconfig                  |  10 +
>  drivers/pinctrl/qcom/Makefile                 |   1 +
>  .../pinctrl/qcom/pinctrl-sa8775p-lpass-lpi.c  | 216 ++++++++++++++++++
>  3 files changed, 227 insertions(+)
>  create mode 100644 drivers/pinctrl/qcom/pinctrl-sa8775p-lpass-lpi.c
> 
> diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
> index c480e8b78503..bb1524243906 100644
> --- a/drivers/pinctrl/qcom/Kconfig
> +++ b/drivers/pinctrl/qcom/Kconfig
> @@ -60,6 +60,16 @@ config PINCTRL_LPASS_LPI
>  	  Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
>  	  (Low Power Island) found on the Qualcomm Technologies Inc SoCs.
>  
> +config PINCTRL_SA8775P_LPASS_LPI
> +	tristate "Qualcomm Technologies Inc SA8775P LPASS LPI pin controller driver"
> +	depends on ARM64 || COMPILE_TEST
> +	depends on PINCTRL_LPASS_LPI
> +	help
> +	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
> +	  Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
> +	  (Low Power Island) found on the Qualcomm Technologies Inc SA8775P
> +	  platform.
> +
>  config PINCTRL_SC7280_LPASS_LPI
>  	tristate "Qualcomm Technologies Inc SC7280 LPASS LPI pin controller driver"
>  	depends on ARM64 || COMPILE_TEST
> diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
> index 748b17a77b2c..b2a23a824846 100644
> --- a/drivers/pinctrl/qcom/Makefile
> +++ b/drivers/pinctrl/qcom/Makefile
> @@ -39,6 +39,7 @@ obj-$(CONFIG_PINCTRL_QCOM_SSBI_PMIC) += pinctrl-ssbi-gpio.o
>  obj-$(CONFIG_PINCTRL_QCOM_SSBI_PMIC) += pinctrl-ssbi-mpp.o
>  obj-$(CONFIG_PINCTRL_QDU1000)	+= pinctrl-qdu1000.o
>  obj-$(CONFIG_PINCTRL_SA8775P)	+= pinctrl-sa8775p.o
> +obj-$(CONFIG_PINCTRL_SA8775P_LPASS_LPI) += pinctrl-sa8775p-lpass-lpi.o
>  obj-$(CONFIG_PINCTRL_SAR2130P)	+= pinctrl-sar2130p.o
>  obj-$(CONFIG_PINCTRL_SC7180)	+= pinctrl-sc7180.o
>  obj-$(CONFIG_PINCTRL_SC7280)	+= pinctrl-sc7280.o
> diff --git a/drivers/pinctrl/qcom/pinctrl-sa8775p-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sa8775p-lpass-lpi.c
> new file mode 100644
> index 000000000000..4579a079f7c6
> --- /dev/null
> +++ b/drivers/pinctrl/qcom/pinctrl-sa8775p-lpass-lpi.c
> @@ -0,0 +1,216 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/gpio/driver.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +#include "pinctrl-lpass-lpi.h"
> +
> +enum lpass_lpi_functions {
> +	LPI_MUX_dmic1_clk,
> +	LPI_MUX_dmic1_data,
> +	LPI_MUX_dmic2_clk,
> +	LPI_MUX_dmic2_data,
> +	LPI_MUX_dmic3_clk,
> +	LPI_MUX_dmic3_data,
> +	LPI_MUX_dmic4_clk,
> +	LPI_MUX_dmic4_data,
> +	LPI_MUX_i2s1_clk,
> +	LPI_MUX_i2s1_data,
> +	LPI_MUX_i2s1_ws,
> +	LPI_MUX_i2s2_clk,
> +	LPI_MUX_i2s2_data,
> +	LPI_MUX_i2s2_ws,
> +	LPI_MUX_i2s3_clk,
> +	LPI_MUX_i2s3_data,
> +	LPI_MUX_i2s3_ws,
> +	LPI_MUX_i2s4_clk,
> +	LPI_MUX_i2s4_data,
> +	LPI_MUX_i2s4_ws,
> +	LPI_MUX_qua_mi2s_data,
> +	LPI_MUX_qua_mi2s_sclk,
> +	LPI_MUX_qua_mi2s_ws,
> +	LPI_MUX_slimbus_clk,
> +	LPI_MUX_slimbus_data,
> +	LPI_MUX_swr_rx_clk,
> +	LPI_MUX_swr_rx_data,
> +	LPI_MUX_swr_tx_clk,
> +	LPI_MUX_swr_tx_data,
> +	LPI_MUX_wsa_swr_clk,
> +	LPI_MUX_wsa_swr_data,
> +	LPI_MUX_wsa2_swr_clk,
> +	LPI_MUX_wsa2_swr_data,
> +	LPI_MUX_ext_mclk1_a,
> +	LPI_MUX_ext_mclk1_b,
> +	LPI_MUX_ext_mclk1_c,
> +	LPI_MUX_ext_mclk1_d,
> +	LPI_MUX_ext_mclk1_e,
> +	LPI_MUX_gpio,
> +	LPI_MUX__,
> +};

Isn't this entire driver exactly the same as sm8450?

Best regards,
Krzysztof


