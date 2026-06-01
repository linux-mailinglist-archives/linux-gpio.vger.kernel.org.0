Return-Path: <linux-gpio+bounces-37740-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Gc9CKoSHWrLVQkAu9opvQ
	(envelope-from <linux-gpio+bounces-37740-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 07:03:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB19619910
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 07:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF34D300FC53
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jun 2026 05:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0338B32E151;
	Mon,  1 Jun 2026 05:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d0IF6SWN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852B52737E0;
	Mon,  1 Jun 2026 05:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780290163; cv=none; b=MGPvU/iCD5B9XFvWb2aMJOdTEFJzEtW8UCRlyUs3uvgZWXgQ3Vaz8bGBPma88N/oP9ANlF+BiAmvchy5jSngl6vuPn5jNlSUxUqPX8qc4uVt4RvwYV+PGlx9rjN4zQkHLPhW/JPzOZx/RewjWTeyeGuXr0VtVrJv371yQN6+sWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780290163; c=relaxed/simple;
	bh=4j2J06AswmbmCGSMQfQDGL7137iXkKG0DTNPjMOrVS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i1laj1wdxmoU+iOJq0yRBcmz6gYmVjLPvI2VZcW8LYi6JdV7n0lAddPU9rnR6D/YAjBCRvQiENGsV47H8mXjOgzM5tu22RVnm//6BIfpGRnQ1H5RL04o2SNn5js5YhJSAJy0JcOcMQqQ80+9ONKI0J+wkFDtgTid8MIYA9sBmQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d0IF6SWN; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780290161; x=1811826161;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4j2J06AswmbmCGSMQfQDGL7137iXkKG0DTNPjMOrVS4=;
  b=d0IF6SWNTEs9ycuA1exuxAbqL1tKrj6JhRJBUnUkDE+oRQLreNZcEva2
   25i2d+RGqHhyumrRdjCKUMR3KX9I+Ff5onU5ZHg9eH3uGGbk7rPXn5tDg
   N1z0+z9Y1BuAvg4B92W6I1GUB2kvG9lXmS6LDmuEQbJP7v45GQLvGnW1J
   50vHbhpgOFNlTWqiURs73PkAx0vMXCAKdhZmIA99hmuVdaZdyWbHhRjzC
   2qS95k7flkLh7jCFnbWfQr+W3Vo8W2hl5IcM/I5a58VEsxT2RY1rlOWH9
   06NuLuBSV0JGu/cYvifX32xdHP5K5TN1qC0yKfchG8ysCP1ZMAPSYoR7T
   g==;
X-CSE-ConnectionGUID: XbZ6B0hJQa+VZvMJ/yPwAw==
X-CSE-MsgGUID: Ds3GRBbgRoizYW82BjSyFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80771666"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="80771666"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 22:02:41 -0700
X-CSE-ConnectionGUID: QGb9deI7QtKpPdL/hdlgxg==
X-CSE-MsgGUID: blSD5ZaTSQejLDRs5iCSCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="242649613"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 31 May 2026 22:02:39 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 2081495; Mon, 01 Jun 2026 07:02:38 +0200 (CEST)
Date: Mon, 1 Jun 2026 07:02:38 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Marco Scardovi <scardracs@disroot.org>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] gpiolib: acpi: prevent address truncation in
 OperationRegion handler
Message-ID: <20260601050238.GM3102@black.igk.intel.com>
References: <20260530094012.184276-1-scardracs@disroot.org>
 <20260530094012.184276-2-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260530094012.184276-2-scardracs@disroot.org>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37740-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,black.igk.intel.com:mid,uefi.org:url,intel.com:dkim,disroot.org:email]
X-Rspamd-Queue-Id: 6BB19619910
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Sat, May 30, 2026 at 11:40:11AM +0200, Marco Scardovi wrote:
> The ACPI address space handler for GPIO OperationRegions receives the
> pin offset as a 64-bit acpi_physical_address. However, the handler
> truncates this address to a u16 pin_index before validating it.
> 
> If an ACPI table attempts to access a pin offset greater than 65535,
> the truncation wraps the index around. This may result in accesses to
> unintended GPIO pins.

If you look at the ACPI spec:

https://uefi.org/specs/ACPI/6.5/06_Device_Configuration.html#connection-descriptors

the pin number is 2 bytes and 0xffff is defined as no connection. So the
firmware cannot really think that it can access GPIO outside of that range.

> Fix this by adding an explicit check to verify that the 64-bit address
> is less than agpio->pin_table_length before assigning it to the u16
> pin_index, returning AE_BAD_PARAMETER if it is out of bounds.
> Additionally, make the length calculation overflow-safe and change the
> types of length and loop counter to unsigned.
> 
> Signed-off-by: Marco Scardovi <scardracs@disroot.org>
> ---
>  drivers/gpio/gpiolib-acpi-core.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-acpi-core.c
> index eb8a40cfb7a9..049e4cbc14ed 100644
> --- a/drivers/gpio/gpiolib-acpi-core.c
> +++ b/drivers/gpio/gpiolib-acpi-core.c
> @@ -1087,10 +1087,10 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
>  	struct gpio_chip *chip = achip->chip;
>  	struct acpi_resource_gpio *agpio;
>  	struct acpi_resource *ares;
> -	u16 pin_index = address;
> +	unsigned int length;
>  	acpi_status status;
> -	int length;
> -	int i;
> +	unsigned int i;
> +	u16 pin_index;
>  
>  	status = acpi_buffer_to_resource(achip->conn_info.connection,
>  					 achip->conn_info.length, &ares);
> @@ -1110,7 +1110,16 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
>  		return AE_BAD_PARAMETER;
>  	}
>  
> -	length = min(agpio->pin_table_length, pin_index + bits);
> +	if (address >= agpio->pin_table_length) {
> +		ACPI_FREE(ares);
> +		return AE_BAD_PARAMETER;
> +	}
> +
> +	pin_index = address;
> +	if (bits > agpio->pin_table_length - pin_index)
> +		length = agpio->pin_table_length;
> +	else
> +		length = pin_index + bits;
>  	for (i = pin_index; i < length; ++i) {
>  		unsigned int pin = agpio->pin_table[i];
>  		struct acpi_gpio_connection *conn;
> -- 
> 2.54.0

