Return-Path: <linux-gpio+bounces-6235-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B83F8BFB67
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 12:58:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 277E02831D4
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 10:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2C4781749;
	Wed,  8 May 2024 10:58:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186DD7EF1E;
	Wed,  8 May 2024 10:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715165919; cv=none; b=i/10MwcdAsGB10KLWrOXkp1P4pWaRpTznZYbhHw5l/h9f4C+zDcO1PDZVRYN22oJj2dPhxdYgBqxCZRSvN8GRIJFuHRQWBUOyhzVX4VrnzBfwwidGYxc/nqD6M4MFU+NkfhpO8IYLKOq90bP9St9sY2wv1oPhoU0jkz8BsGyRsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715165919; c=relaxed/simple;
	bh=oK8Ps5pWIiXzvtTq6erCKYqbUyIACm90iS5WcjxXyqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ASfnc34rPjqSnuxe+jz1DLoPdH2xrz7vwLgUl665TNkSjmSDAOnjZqy4Rwl+2XlvB8nR1ddIKrGyxLgdaXHOyOPaPj5flr+7Svcy7q1EdrLHu0Z4hRZwumkx364uSkcx2C9DSZ2Y8fUhqKlUA6MTMmGChqkg4yLLSeR5PnucS2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: L9VJsnbOQtakB9K3seseIA==
X-CSE-MsgGUID: MyFZIttzQX6dqpLFdxk7BQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="22171413"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="22171413"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 03:58:37 -0700
X-CSE-ConnectionGUID: Ja0uQrJvRyaRl45hGG6lAw==
X-CSE-MsgGUID: OU+OvBErQyWZ2HLb66rDRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="28821136"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 03:58:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1s4f0I-00000005P1l-21SC;
	Wed, 08 May 2024 13:58:30 +0300
Date: Wed, 8 May 2024 13:58:30 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v9 2/9] platform: cznic: Add preliminary support for
 Turris Omnia MCU
Message-ID: <Zjta1vXG0Yak3vz-@smile.fi.intel.com>
References: <20240508103118.23345-1-kabel@kernel.org>
 <20240508103118.23345-3-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240508103118.23345-3-kabel@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 08, 2024 at 12:31:11PM +0200, Marek Behún wrote:
> Add the basic skeleton for a new platform driver for the microcontroller
> found on the Turris Omnia board.

Some cosmetics in case you need a new version.
Possibly can be done as follow up(s).

...

> +Date:		July 2024
> +KernelVersion:	6.10

TBH, I'm not sure you manage to squeeze this rather big driver to v6.10.

...

> +static const struct attribute_group *omnia_mcu_groups[] = {
> +	&omnia_mcu_base_group,
> +	NULL
> +};

__ATTRIBUTE_GROUPS()

...

Perhaps also

	struct i2c_client *client = mcu->client;

> +	struct device *dev = &mcu->client->dev;

	struct device *dev = &client->dev;

> +	bool suggest_fw_upgrade = false;
> +	u16 status;
> +	int err;
> +
> +	/* status word holds MCU type, which we need below */
> +	err = omnia_cmd_read_u16(mcu->client, OMNIA_CMD_GET_STATUS_WORD,
> +				 &status);

	err = omnia_cmd_read_u16(client, OMNIA_CMD_GET_STATUS_WORD, &status);

and so on...


> +	if (err)
> +		return err;

...

> +	/*
> +	 * check whether MCU firmware supports the OMNIA_CMD_GET_FEATURES

Check

> +	 * command

command.

> +	 */

-- 
With Best Regards,
Andy Shevchenko



