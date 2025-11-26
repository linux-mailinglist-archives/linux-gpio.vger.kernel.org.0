Return-Path: <linux-gpio+bounces-29080-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1DFC89EF0
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 14:08:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3A5E3B6478
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 13:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1BAF22F76F;
	Wed, 26 Nov 2025 13:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g5w/HxZn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D93225A5B;
	Wed, 26 Nov 2025 13:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764162412; cv=none; b=euttt4WjqaW/sNtKXCn9k9IeP2VF92Ud9dmh7htWsOWU2PtKtbwvXKWA5LDsTf3p++Y9lND7w8SHAhfUwkLLSxbWStzXUJRhW9OOSr59pqBOEVvWiukoTXkbVrjRt92cNvToWBKa4KdQLMMr72Ik6PEU/KDB15egX8NC8OFoMVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764162412; c=relaxed/simple;
	bh=mS6MwChLlrnU9SKlzCRc4xW3NM1SPshvO/AD1kbOhgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z0sI0ux45BdYW89fNlNzf4vvDXcwZZzTI+WIP2S0xKrmQVojbP3J9NLqVxzuGT9M+7CXxmt4tzCQPeIdBuGmE2BAZq3GXW1FBVJiTa9q8YvWbsky8p+XzfF1bXbAK7g0JnADkVNl4mdP4/ouqr2V73wApPMAaUqUQhdnvc1fbew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g5w/HxZn; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764162411; x=1795698411;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mS6MwChLlrnU9SKlzCRc4xW3NM1SPshvO/AD1kbOhgU=;
  b=g5w/HxZnHFavyk3SNSt5Vbv/uw57sM5ZN4ZQY7yuH8QQVv2dYCu95Wmk
   nlvv8ngxT3JtZSdX25yLa9DGArN9KVof5AwH4IeLwpyRHkNwbJ8RlI8JY
   4+X8YWsHNo+xXR64Gx3dCJnL1pIoQmUcWU/HtIfj3IR8AJ0aIDkth7rwj
   kBOh5ws+d5D2NkdgLotEFDF5O6OhT7J9qULdDkGMcj1vhlm2YBSNKK4hn
   2LGtuNtOijat9RvLv4Fz0nBnQanQUPDHPbdE2mxJbGoQy4kSfeNWexSdL
   pQV6rWeMvqj2CgPL0ENL8wfUDBnaZp6wgDbxgOk38j2+N0dYZvtJPTCwb
   w==;
X-CSE-ConnectionGUID: Uvy7H4m3RByyORp85NrQxA==
X-CSE-MsgGUID: +NYrjC8sQ/epKimlefHJ0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="77563525"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="77563525"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 05:06:47 -0800
X-CSE-ConnectionGUID: wnzOtTXMS7SwitAwXXpgnA==
X-CSE-MsgGUID: duYij1bZSKyi6i0j+WSoBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="192724593"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 26 Nov 2025 05:06:40 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 6FE7FA0; Wed, 26 Nov 2025 14:06:38 +0100 (CET)
Date: Wed, 26 Nov 2025 14:06:38 +0100
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	alexey.klimov@linaro.org, krzk@kernel.org,
	bryan.odonoghue@linaro.org, jorge.ramirez@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
	quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
	quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com
Subject: Re: [PATCH v1 4/4] serial: qcom-geni: Enable Serial on SA8255p
 Qualcomm platforms
Message-ID: <aSb7XhbTTtF3Wd-3@black.igk.intel.com>
References: <20251110101043.2108414-1-praveen.talari@oss.qualcomm.com>
 <20251110101043.2108414-5-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110101043.2108414-5-praveen.talari@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Nov 10, 2025 at 03:40:43PM +0530, Praveen Talari wrote:
> The Qualcomm automotive SA8255p SoC relies on firmware to configure
> platform resources, including clocks, interconnects and TLMM.
> The driver requests resources operations over SCMI using power
> and performance protocols.
> 
> The SCMI power protocol enables or disables resources like clocks,
> interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
> such as resume/suspend, to control power states(on/off).
> 
> The SCMI performance protocol manages UART baud rates, with each baud
> rate represented by a performance level. The driver uses the
> dev_pm_opp_set_level() API to request the desired baud rate by
> specifying the performance level.

...

> +static int geni_serial_pwr_init(struct uart_port *uport)
> +{
> +	struct qcom_geni_serial_port *port = to_dev_port(uport);
> +	int ret;
> +
> +	ret = dev_pm_domain_attach_list(port->se.dev,
> +					&port->dev_data->pd_data, &port->pd_list);
> +	if (ret <= 0)
> +		return -EINVAL;
> +
> +	return 0;

Why shadowing an error code?

This should be

	ret = dev_pm_domain_attach_list(port->se.dev,
					&port->dev_data->pd_data, &port->pd_list);
	if (ret < 0)
		return ret; // assuming it returns a Linux err code.
	/* Some comment, perhaps? */
	if (ret == 0)
		return -EINVAL;

	return 0;

> +}

...

>  		port->rx_buf = devm_kzalloc(uport->dev,
>  					    DMA_RX_BUF_SIZE, GFP_KERNEL);
> -		if (!port->rx_buf)
> -			return -ENOMEM;
> +		if (!port->rx_buf) {
> +			ret = -ENOMEM;
> +			goto error;

This is wrong. After devm_*() calls should not be goto:s. It should be very
exceptional cases otherwise.

> +		}

...

>  	port->name = devm_kasprintf(uport->dev, GFP_KERNEL,
>  			"qcom_geni_serial_%s%d",
>  			uart_console(uport) ? "console" : "uart", uport->line);
> -	if (!port->name)
> -		return -ENOMEM;
> +	if (!port->name) {
> +		ret = -ENOMEM;
> +		goto error;
> +	}

Ditto.

...

> +	if (irq < 0) {
> +		ret = irq;
> +		goto error;

Ditto. And so on...

> +	}

...

Hint: use devm_add_action_or_reset() above and drop most of the changes in this
patch.

-- 
With Best Regards,
Andy Shevchenko



