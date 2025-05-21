Return-Path: <linux-gpio+bounces-20449-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FFFABF981
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 17:35:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 531F7168047
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 15:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06F47221291;
	Wed, 21 May 2025 15:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MEQ5S6Ze"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C641EA7C6;
	Wed, 21 May 2025 15:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747841587; cv=none; b=mny5YhJw4JZoMiNkpyIqSe+Kyg/4mPOqN7gjfE30sTGAyud5M+qHVgo347hf5lR7V+d1Srfh8fGb9U/bkzseMo1b+BCOj/UoLPOAv9xQAbZWQsSohYSw89ZLivYxxAgzx1tp4enL/YgcuePCLxZNWAstCDb7hjMraQ4j1rhfoos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747841587; c=relaxed/simple;
	bh=GW8fSJtIIcQfrlBHzwFuPMtHkQZy1wmn2vANi12FPSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nZmAsV+X8XTCDgjF5NbDWF4nHe0ifxI2RonJdIJy0p9jVom8RAljKGfbhfz9btKQi9Iisyq4wRgJN+zL12cjH/Daxx8QpGRBaSmvLyxr0lTloPU0kXbka3fQxo0UpfCHCKgnOgO9s+iV5B2GXOl9kUpVPGJk3LgylW034dgykiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MEQ5S6Ze; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747841586; x=1779377586;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GW8fSJtIIcQfrlBHzwFuPMtHkQZy1wmn2vANi12FPSw=;
  b=MEQ5S6ZeVrA9ikBXytNAwjRI/oEFpM61UO9N79vPumUHKs8Fcabc1Tf9
   8Strvm2ulOuyU8B0+ompKRPTARZkdihw2kWsIahLB80uhG87qB8BPoSGx
   82REDkb7jqijcieHjl+1fyv+3XeYa9zzUqEI1kf6Rr4UDUPq+C61cOuvy
   HYT33HSi/D/io1jX/8oTd/3Nto+qP+S8OP/OS6Yd2Zcp7u8rlUX9whMlg
   0K2vDiIEgAGAZvwKj6gtV4umyVnjWqYLmNT8DRrM/Uoqr4cMKMYE4f1G6
   qZrkibiaQpc9uzH4G68/4rJmsSVbuGJWK3zcaTy84ae8uCFrPG25qNUYS
   A==;
X-CSE-ConnectionGUID: /NlwuTENTMyvUoQTCQk15g==
X-CSE-MsgGUID: jYIgMtlCTIyhaiPH9tW3Ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="72345621"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="72345621"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 08:33:04 -0700
X-CSE-ConnectionGUID: /0j+tz1wRYKNB1/qh7Axyg==
X-CSE-MsgGUID: osH+72QJRYGme7yAqVUxjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="141046554"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 08:33:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uHlRB-00000003fEh-41bz;
	Wed, 21 May 2025 18:32:57 +0300
Date: Wed, 21 May 2025 18:32:57 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kees Cook <kees@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v6 12/12] pinctrl: Add pin controller driver for AAEON UP
 boards
Message-ID: <aC3yKaCNZA8H2KPt@smile.fi.intel.com>
References: <20250520-aaeon-up-board-pinctrl-support-v6-0-dcb3756be3c6@bootlin.com>
 <20250520-aaeon-up-board-pinctrl-support-v6-12-dcb3756be3c6@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520-aaeon-up-board-pinctrl-support-v6-12-dcb3756be3c6@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, May 20, 2025 at 03:28:36PM +0200, Thomas Richard wrote:
> This enables the pin control support of the onboard FPGA on AAEON UP
> boards.
> 
> This FPGA acts as a level shifter between the Intel SoC pins and the pin
> header, and also as a mux or switch.
> 
> +---------+          +--------------+             +---+
>           |          |              |             |   |
>           | PWM0     |       \      |             | H |
>           |----------|------  \-----|-------------| E |
>           | I2C0_SDA |              |             | A |
> Intel SoC |----------|------\       |             | D |
>           | GPIO0    |       \------|-------------| E |
>           |----------|------        |             | R |
>           |          |     FPGA     |             |   |
> ----------+          +--------------+             +---+
> 
> For most of the pins, the FPGA opens/closes a switch to enable/disable
> the access to the SoC pin from a pin header.
> Each switch, has a direction flag that is set depending the status of the
> SoC pin.
> 
> For some other pins, the FPGA acts as a mux, and routes one pin (or the
> other one) to the header.
> 
> The driver also provides a GPIO chip. It requests SoC pins in GPIO mode,
> and drives them in tandem with FPGA pins (switch/mux direction).
> 
> This commit adds support only for UP Squared board.

...

> +static int upboard_pinctrl_pin_get_mode(struct pinctrl_dev *pctldev, unsigned int pin)
> +{
> +	struct upboard_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> +	struct upboard_pin *p = &pctrl->pins[pin];
> +	unsigned int val;
> +	int ret;
> +
> +	if (p->funcbit) {
> +		ret = regmap_field_read(p->funcbit, &val);
> +		if (ret)
> +			return ret;
> +		if (val)
> +			return UPBOARD_PIN_MODE_FUNCTION;
> +	}
> +
> +	ret = regmap_field_read(p->enbit, &val);
> +	if (ret)
> +		return ret;
> +	if (!val)
> +		return UPBOARD_PIN_MODE_DISABLED;
> +
> +	ret = regmap_field_read(p->dirbit, &val);
> +	if (ret)
> +		return ret;
> +
> +	return val ? UPBOARD_PIN_MODE_GPIO_IN : UPBOARD_PIN_MODE_GPIO_OUT;
> +}
> +
> +static void upboard_pinctrl_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
> +				     unsigned int offset)
> +{
> +	int ret;
> +
> +	ret = upboard_pinctrl_pin_get_mode(pctldev, offset);
> +	if (ret == UPBOARD_PIN_MODE_FUNCTION)
> +		seq_puts(s, "mode function ");
> +	else if (ret == UPBOARD_PIN_MODE_DISABLED)
> +		seq_puts(s, "HIGH-Z ");

> +	else
> +		seq_printf(s, "GPIO (%s) ", str_input_output(ret == UPBOARD_PIN_MODE_GPIO_IN));

Actually this should be

	else if (ret < 0)
		seq_printf(s, "N/A "); // or similar text
	else
		seq_printf(s, "GPIO (%s) ", str_input_output(ret == UPBOARD_PIN_MODE_GPIO_IN));

as the above may return a negative error code which is not listed here.

> +}

With the above being addressed,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

Thanks for doing this driver, eventually we will have it working
out-of-the-box. Do you have any plans for enabling HSI and SIM card
slot on UP Squared 7000?

-- 
With Best Regards,
Andy Shevchenko



