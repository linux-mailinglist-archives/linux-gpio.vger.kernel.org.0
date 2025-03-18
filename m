Return-Path: <linux-gpio+bounces-17727-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DAAA67113
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 11:21:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0085419A048B
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 10:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CBC3207DEF;
	Tue, 18 Mar 2025 10:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FI2zPbc1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03926206F18;
	Tue, 18 Mar 2025 10:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742293275; cv=none; b=hUiw55ounf8E3KiklVQ2UMelqCc+OSyt5WmMIYeovCrRFCDiM28iqZsLoTDXvx7avyfmjXJlJ9lVzn/+APGhfWdOD3KRvxptOvme4rpEE1v2VhO1rqCcyx40XYj+p787WBS4QMJSbocEvAQWTDdLmoPGERSpXmUssLLxUz3Sl6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742293275; c=relaxed/simple;
	bh=1gPhGppPtEU1UQcFojFgftE6iivSmorJZxJbxThHDHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J+65c5nOprfCQNz5zuUD0cg/prIB8RWj03GdeP5GkBljV8kc0o1/dl0c/bihdSnn4+6iW/ejc4GY8TUyA2B41SIDA3X+fQIMUyZHo8JvxY6UCwTYacsd+mC7z5iGb0NJtXFuvQ2baSGU9fEO+Y9mYU7ZaHoLsbFxGozEJYQi66w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FI2zPbc1; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742293270; x=1773829270;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1gPhGppPtEU1UQcFojFgftE6iivSmorJZxJbxThHDHA=;
  b=FI2zPbc1dbBUeWC7GwsY0jGqDDcZN7ZflzDrENI/l0Rz489TqX5Mcp+h
   xdcNASrQH6WnrZKt6X4O97FLhc+btKEJVlSkaIMqxRoE8R3hqMPtnOE1h
   aY2U0/0r2Daxdhxf/Pv+tptkM/cGQJLtA8sdKKl2E+5chym/H2z+MpAMI
   fo7B6bvgg8JoQf8vk5I8qf3BD8vMSLUtmIFDrhPTy1NAW/7ZLlqysa+ad
   nXJ4zJETUk97d48ra2mN5PRT9OoramSwDE6qDn4DesMYvTq4oblTIdAJR
   fbI7EGKtYdUf8rBMh5M9weSb+VMauqTsPzH4c+ZTSUc/756WpGHp22v7v
   g==;
X-CSE-ConnectionGUID: fmiK3fNrRlWK4+kjdwF7Og==
X-CSE-MsgGUID: U5HMXTtqSwWLdxZEfP6TjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="54054880"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="54054880"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 03:21:09 -0700
X-CSE-ConnectionGUID: mZ2ne34kQa+pJONi9B0N6A==
X-CSE-MsgGUID: UuTlPGtySMWV9KA/Icg2Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="122382913"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 18 Mar 2025 03:21:07 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C1E7A17B; Tue, 18 Mar 2025 12:21:05 +0200 (EET)
Date: Tue, 18 Mar 2025 12:21:05 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: krzk@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
	linus.walleij@linaro.org, brgl@bgdev.pl,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] regulator: s5m8767: Convert to GPIO descriptors
Message-ID: <Z9lJETLh2y27934q@black.fi.intel.com>
References: <20250318052709.1731747-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318052709.1731747-1-peng.fan@oss.nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Mar 18, 2025 at 01:27:09PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Update the driver to fetch buck_gpio and buck_ds as gpio descriptors.

GPIO

> Then drop the usage of 'of_gpio.h' which should be deprecated.

s/should/is/

> Take commit 84618d5e31cf ("regulator: max8997:

s/Take/Based on/

> Convert to GPIO descriptors") as a reference to make the changes.

> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>

Can be done via --to parameter to git-send-email.

...

> +	gpiod_set_value(s5m8767->buck_gpios[0], (temp_index >> 2) & 0x1);

Can be simply done as !!(temp_index & BIT(2)).

> +	gpiod_set_value(s5m8767->buck_gpios[1], (temp_index >> 1) & 0x1);
> +	gpiod_set_value(s5m8767->buck_gpios[2], temp_index & 0x1);

Ditto.

...

> +	gpiod_set_value(s5m8767->buck_gpios[2], temp_index & 0x1);
> +	gpiod_set_value(s5m8767->buck_gpios[1], (temp_index >> 1) & 0x1);
> +	gpiod_set_value(s5m8767->buck_gpios[0], (temp_index >> 2) & 0x1);

As per above.

...

Also the commit message doesn't tell anything about the existing DTS files.
Do we have this device described in any in the kernel? Do we have any googled
examples? Why I'm asking because often the issue is the incorrect setting of
the polarity, which needs to be carefully checked, esp. for the voltage regulators
case.

...

> +	const char *gpiods_names[3] = {"S5M8767 DS2", "S5M8767 DS3", "S5M8767 DS4"};
> +	const char *gpiodvs_names[3] = {"S5M8767 SET1", "S5M8767 SET2", "S5M8767 SET3"};

Add spaces after { and before }.

...

> +		for (i = 0; i < 3; i++) {
> +			enum gpiod_flags flags;
>  
> +			if (s5m8767->buck_gpioindex & BIT(2 - i))
> +				flags = GPIOD_OUT_HIGH;
> +			else
> +				flags = GPIOD_OUT_LOW;
> +
> +			s5m8767->buck_gpios[i] = devm_gpiod_get_index(iodev->dev,
> +								      "s5m8767,pmic-buck-dvs",
> +								      i,
> +								      flags);

i and flags can be located on the same line, or I would rather move i to
the line with the con_id.

			s5m8767->buck_gpios[i] = devm_gpiod_get_index(iodev->dev,
								      "s5m8767,pmic-buck-dvs", i,
								      flags);

> +			if (IS_ERR(s5m8767->buck_gpios[i])) {
> +				ret = PTR_ERR(s5m8767->buck_gpios[i]);
> +				return dev_err_probe(iodev->dev, ret, "invalid gpio[%d]: %d\n",
> +						     i, ret);

ret will be printed twice. This should be as simple as

			if (IS_ERR(s5m8767->buck_gpios[i]))
				return dev_err_probe(iodev->dev, PTR_ERR(s5m8767->buck_gpios[i]),
						     "invalid gpio[%d]\n", i);

> +			}
>  
> +			gpiod_set_consumer_name(s5m8767->buck_gpios[i], gpiodvs_names[i]);
> +		}

...

> +	for (i = 0; i < 3; i++) {

Both comments as per above apply here, in this for-loop.

> +		s5m8767->buck_ds[i] = devm_gpiod_get_index(iodev->dev,
> +							   "s5m8767,pmic-buck-ds",
> +							   i, GPIOD_OUT_LOW);
> +		if (IS_ERR(s5m8767->buck_ds[i])) {
> +			ret = PTR_ERR(s5m8767->buck_ds[i]);
> +			return dev_err_probe(iodev->dev, ret, "can't get GPIO %d (%d)\n",
> +					     i, ret);
> +		}
> +		gpiod_set_consumer_name(s5m8767->buck_ds[i], gpiods_names[i]);
> +	}

-- 
With Best Regards,
Andy Shevchenko



