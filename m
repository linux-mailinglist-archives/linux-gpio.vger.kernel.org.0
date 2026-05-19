Return-Path: <linux-gpio+bounces-37126-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHgUArsRDGoZVQUAu9opvQ
	(envelope-from <linux-gpio+bounces-37126-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 09:31:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 758295791EB
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 09:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 188E33023DDE
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 07:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 690243D3481;
	Tue, 19 May 2026 07:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JWEO/y6G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B4A3BE162;
	Tue, 19 May 2026 07:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779175552; cv=none; b=LAK1axvfbDNuSk1HSCBRNsMnfW5NQgtD53N2UqBpNLyePvsNAoe174pO2Aosd9a6/0uQ65YUjOl3+Suq1fNpLA0XOG2C61Re2E3Cz8fJKlAMyl5uzNVs+jHrxZrtamB2UdZXe/zoAwsKnJlxIn2zUj9l0AFzXOH51wRe2FWZwOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779175552; c=relaxed/simple;
	bh=58L1KNGX+QIzwXTTzN9x8hSe74UDCFMVIwQ9GyMGH6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dIj7/9/2ull3Z2tiN7nwfHw7UrsZVjd4aPb7Xb/eHRvU/1NlT4KL4lYmsy91jEatuHVZTMd/6pyxycC2HpY/vxaT2/855ZlIDaC+UuWr3ZWEB41Xlyxp7Aa7jxV608Y5vld/HSR+Z65FHOcQsj3JbrhP5bKAvtFRWCCvVIpbjdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JWEO/y6G; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779175551; x=1810711551;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=58L1KNGX+QIzwXTTzN9x8hSe74UDCFMVIwQ9GyMGH6Y=;
  b=JWEO/y6GgZF64Pdl7wpoEtNefdfUEZ1XDR5K3F6+UtkxTfV1QkWeGo7B
   ovFmpXnMIACloSc4MQsDY0TNp0IDTMe7qmxgTdMBplPoWtZ0+TrQXPlB5
   H1I/m7FM0Dn1bXCkgRFDE1CLp/y/Epkkk+KBQSurZ6Pso6VMb5pdZGfzS
   oMrnNR1WybPG7kjakBNCI8vtXTFgH5fJlhrbMP+7G73gVDZF95Op9egXL
   7j+l5gxPCwxn2+HY7nX1b3QR+GrllX/q6/vzUvU+1K4xl+d8GEI3nGcQa
   IYRqKEWEjG+so/Q3NcNO/h7JIPrP7JZBHF+E4k0+MT7vrYC+VHGeP7lFt
   w==;
X-CSE-ConnectionGUID: 357Jjl0yRuii7joTaUwruA==
X-CSE-MsgGUID: jBNrscTbS5SLPNBB8leeLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="97611403"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="97611403"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 00:25:50 -0700
X-CSE-ConnectionGUID: K6UGEx/1SqWPz0PPPH//3A==
X-CSE-MsgGUID: uHpzScoZQtamDviB3G0vyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="243979681"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.150])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 00:25:48 -0700
Date: Tue, 19 May 2026 10:25:45 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
Cc: mika.westerberg@linux.intel.com, brgl@kernel.org, linusw@kernel.org,
	linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, westeri@kernel.org
Subject: Re: [PATCH 1/2] gpiolib: acpi: Add robust bounds-checking for GPIO
 pin resources
Message-ID: <agwQeVt3UhhFAUA8@ashevche-desk.local>
References: <20260518103302.GO84797@black.igk.intel.com>
 <20260519070039.9280-1-mscardovi95@gmail.com>
 <20260519070039.9280-2-mscardovi95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519070039.9280-2-mscardovi95@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37126-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	URIBL_MULTI_FAIL(0.00)[ashevche-desk.local:server fail,intel.com:server fail,sea.lore.kernel.org:server fail];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: 758295791EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 09:00:30AM +0200, Marco Scardovi (scardracs) wrote:
> Ensure that the GPIO pin resource arrays are safely bounded before
> accessing indices. Add bounds checking in acpi_request_own_gpiod(),
> acpi_gpio_irq_is_wake(), acpi_gpiochip_alloc_event(), and
> acpi_gpio_adr_space_handler() to prevent out-of-bounds array reads if
> the ACPI namespace provides malformed or empty pin tables.

...

>  	int polarity = GPIO_ACTIVE_HIGH;
>  	enum gpiod_flags flags = acpi_gpio_to_gpiod_flags(agpio, polarity);
> -	unsigned int pin = agpio->pin_table[index];
> +	unsigned int pin;
>  	struct gpio_desc *desc;

Preserve reversed xmas tree order.

...

>  static bool acpi_gpio_irq_is_wake(struct device *parent,
>  				  const struct acpi_resource_gpio *agpio)
>  {
> -	unsigned int pin = agpio->pin_table[0];
> +	unsigned int pin;
> +
> +	if (agpio->pin_table_length == 0)
> +		return false;
> +
> +	pin = agpio->pin_table[0];

This pin is not used...

>  	if (agpio->wake_capable != ACPI_WAKE_CAPABLE)
>  		return false;

...in the above condition, so, you can move the check and pin assignment even
further.

...

>  	if (!acpi_gpio_get_irq_resource(ares, &agpio))
>  		return AE_OK;

> +	if (agpio->pin_table_length == 0)
> +		return AE_OK;

Move this check after the handle assignment.

>  	handle = ACPI_HANDLE(chip->parent);

>  	pin = agpio->pin_table[0];
>  

While at it, move this blank line to be before pin assignment.

...

> +	if (pin_index >= agpio->pin_table_length) {
> +		ACPI_FREE(ares);
> +		return AE_BAD_PARAMETER;
> +	}

This is bogus. Please, read the code. Do not blindly follow some AI nonsense.

>  	length = min(agpio->pin_table_length, pin_index + bits);
>  	for (i = pin_index; i < length; ++i) {
>  		unsigned int pin = agpio->pin_table[i];

-- 
With Best Regards,
Andy Shevchenko



