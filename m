Return-Path: <linux-gpio+bounces-6237-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 884A98BFBB6
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 13:17:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 250EA1F21A71
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 11:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0980823C3;
	Wed,  8 May 2024 11:16:33 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691C781AB2
	for <linux-gpio@vger.kernel.org>; Wed,  8 May 2024 11:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715166993; cv=none; b=CXPJ77WSY4Zz/a6azRDU+pPDqCQhxwrkc6VHqiYyqtUihUKhGoCpwVnDd6O+u4AuZFYo4tzf0oHceOjkqxbCHTbeR2ZMEQ/Xgm+NVI07u+a+xXKVksnP5HU8g1OvOZcZZOCxhtMTwXzBJ1WCkKnFW2tvG4H3SBxFDYBWDlj4+10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715166993; c=relaxed/simple;
	bh=h0oN6RzBd2VtorrkSm42ckeBYrxswzsk4BxJxNQMlrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TjgXpz3vCRoK++5ugtk7Tv3CgYsL3t9mngT4h+hAZk3/AJyTsfMKwvraEmsADEULmRthhci70DsumBhPTOwto5sZ4sxSsdZI1M9ADn28r8CZB/Xqfw1s394Bs/4UthsbbE9upyrW3Wysp6awINwmzbusd+Z2+mibR8Sw+sEt/2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: jYhqN8O6STKTLVD8sr0FbA==
X-CSE-MsgGUID: ZM3C6s8WTTS5MrReZlc4wA==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="33525619"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="33525619"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 04:16:32 -0700
X-CSE-ConnectionGUID: 0P89rAG+Q0OqhOCQLWPhMw==
X-CSE-MsgGUID: 0K8kh/5tRTKKuSJVQ6/BHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="33688834"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 04:16:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1s4fHe-00000005PKq-1QJ3;
	Wed, 08 May 2024 14:16:26 +0300
Date: Wed, 8 May 2024 14:16:26 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v9 3/9] platform: cznic: turris-omnia-mcu: Add support
 for MCU connected GPIOs
Message-ID: <ZjtfCjAlDMMndRfv@smile.fi.intel.com>
References: <20240508103118.23345-1-kabel@kernel.org>
 <20240508103118.23345-4-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240508103118.23345-4-kabel@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 08, 2024 at 12:31:12PM +0200, Marek Behún wrote:
> Add support for GPIOs connected to the MCU on the Turris Omnia board.
> 
> This includes:
> - front button pin
> - enable pins for USB regulators
> - MiniPCIe / mSATA card presence pins in MiniPCIe port 0
> - LED output pins from WAN ethernet PHY, LAN switch and MiniPCIe ports
> - on board revisions 32+ also various peripheral resets and another
>   voltage regulator enable pin

...

>  static const struct attribute_group *omnia_mcu_groups[] = {
>  	&omnia_mcu_base_group,
> +	&omnia_mcu_gpio_group,
>  	NULL
>  };

Ah, __ATTRIBUTE_GROUPS() can't be used.

...

> +static int omnia_ctl_cmd_locked(struct omnia_mcu *mcu, u8 cmd, u16 val,
> +				u16 mask)

Can be one line as it's only 81 characters long.

...

> +	if (type & IRQ_TYPE_EDGE_RISING)
> +		mcu->rising |= bit;
> +	else
> +		mcu->rising &= ~bit;
> +
> +	if (type & IRQ_TYPE_EDGE_FALLING)
> +		mcu->falling |= bit;
> +	else
> +		mcu->falling &= ~bit;

If those variables was defined as unsigned long, these can be just

	__assign_bit()
	__assign_bit()

And other non-atomic bitops elsewhere, like __clear_bit().

...

> + * Feel free to remove this function and its inverse, omnia_mask_deinterleave,
> + * and use an appropriate bitmap_* function once such a function exists.

bitmap_*()

...

> +static void omnia_mask_interleave(u8 *dst, u32 rising, u32 falling)
> +{
> +	for (int i = 0; i < sizeof(u32); ++i) {
> +		dst[2 * i] = rising >> (8 * i);
> +		dst[2 * i + 1] = falling >> (8 * i);
> +	}

Yeah, this can actually be converted to the existing bitmap ops, but I think it
will be a bit an overkill for now. Perhaps we will have something better in the
future.

> +}

+ blank line. (Or is it me who accidentally removed it?)

> +/**
> + * omnia_mask_deinterleave - Deinterleaves the bytes into @rising and @falling
> + *	@src: the source u8 array containing the interleaved bytes
> + *	@rising: pointer where to store the rising mask gathered from @src
> + *	@falling: pointer where to store the falling mask gathered from @src
> + *
> + * This is the inverse function to omnia_mask_interleave.
> + */
> +static void omnia_mask_deinterleave(const u8 *src, u32 *rising, u32 *falling)
> +{
> +	*rising = *falling = 0;
> +
> +	for (int i = 0; i < sizeof(u32); ++i) {
> +		*rising |= src[2 * i] << (8 * i);
> +		*falling |= src[2 * i + 1] << (8 * i);
> +	}
> +}

...

> +static int omnia_read_status_word_old_fw(struct omnia_mcu *mcu, u16 *status)
> +{
> +	int err;
> +
> +	err = omnia_cmd_read_u16(mcu->client, OMNIA_CMD_GET_STATUS_WORD,
> +				 status);
> +	if (!err)

Why not traditional pattern?

	if (err)
		return err;

> +		/*
> +		 * Old firmware has a bug wherein it never resets the USB port
> +		 * overcurrent bits back to zero. Ignore them.
> +		 */
> +		*status &= ~(OMNIA_STS_USB30_OVC | OMNIA_STS_USB31_OVC);
> +
> +	return err;

	return 0;

> +}

...

> +static bool omnia_irq_read_pending(struct omnia_mcu *mcu,
> +				   unsigned long *pending)
> +{
> +	if (mcu->features & OMNIA_FEAT_NEW_INT_API)
> +		return omnia_irq_read_pending_new(mcu, pending);
> +	else

'else' is redundant, but it can be still used for indentation purposes here.

> +		return omnia_irq_read_pending_old(mcu, pending);
> +}

...

> +static struct attribute *omnia_mcu_gpio_attrs[] = {
> +	&dev_attr_front_button_mode.attr,
> +	NULL
> +};
> +
> +const struct attribute_group omnia_mcu_gpio_group = {
> +	.attrs = omnia_mcu_gpio_attrs,
> +};

Haven't seen the rest, but here perhaps ATTRIBUTE_GROUPS().

...

> +static inline int omnia_cmd_read_bits(const struct i2c_client *client, u8 cmd,
> +				      u32 bits, u32 *dst)
> +{
> +	__le32 reply;
> +	int err;
> +
> +	if (!bits) {
> +		*dst = 0;
> +		return 0;
> +	}
> +
> +	err = omnia_cmd_read(client, cmd, &reply,
> +			     omnia_compute_reply_length(bits, false, 0));

> +	if (!err)

	if (err)
		return err;

> +		*dst = le32_to_cpu(reply) & bits;
> +
> +	return err;

	return 0;

> +}

-- 
With Best Regards,
Andy Shevchenko



