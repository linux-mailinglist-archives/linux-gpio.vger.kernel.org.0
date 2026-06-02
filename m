Return-Path: <linux-gpio+bounces-37815-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id O+57MurDHmp6UwAAu9opvQ
	(envelope-from <linux-gpio+bounces-37815-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 13:52:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C9E62DB91
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 13:52:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=LF1yThEc;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37815-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37815-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A5F73078305
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 11:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BE793769EE;
	Tue,  2 Jun 2026 11:45:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5691A6811;
	Tue,  2 Jun 2026 11:45:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780400746; cv=none; b=lSk+YIA3VOwBnymwigm6Ce5Ksa8kDy7xJ19gDB+eL71aok6ugO3E/5buRMBfqF8wcNo8rzQfi+qCvzrkpPmgLFz9Pd2t2Vx0PKjYmKb/WTeU+qNehzOkHoKa/0dZkWbJiUY5ExpyVw+u6DAnx5R+Uk4uu4hotKJ5cyjV/pAlQ0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780400746; c=relaxed/simple;
	bh=GHVB4XWYPCy2F8r1quPtthubTkr3FunC8KUOK2WUcdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZLsRgXP+O/VLDmuvwet/dWl/WENB6Atg6JzbW879Ta7yEtp58YQNOddMfXSV4PoRHH4tXSXd5yoe9W/3S8jDehPK58f4SuijYhu3gXOkJj0rXqBhyITVE/ER3AfNuZQUdwLeRVTP5P1/PpTFXfGBBe4WGVAkV9sGRt79HJ1huEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LF1yThEc; arc=none smtp.client-ip=192.198.163.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780400744; x=1811936744;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GHVB4XWYPCy2F8r1quPtthubTkr3FunC8KUOK2WUcdU=;
  b=LF1yThEcuVEVUY8dBbvh+k2DWi9fHrPwQLyKxFTavKEBN/r5FiqALzFN
   1WiWuH3I7FSEzOuUkGLAXJdMnYbWgcdbP/YYgtwP7E5rYICi84WbGyBE0
   iDa3rIK5KBtsU8YDaUwRyDOXOZA/6mDbgEpsugCc9EZEkRLyiS03eDK5w
   NnVNsD76Voc3XMr0Ss4dB5NIv+pd7/tHD0JJ9R97mX7/uRaNMAl8Wnpl7
   ynWHskAdW0ymkqZbYJHA+sVNlTyXo+zOM5MoKZjyVvhl3nS5x4G6Zt+v+
   ozq9zyakGRTYhC4hUcOMi4MqT4VkbG66mH7Xh0v4WEJQMzB3jdL1+BNVd
   Q==;
X-CSE-ConnectionGUID: LOuQjy2JS46ObaafYm6/Mg==
X-CSE-MsgGUID: Mg/+DYOSTNacxL5ejkHa/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="80326647"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="80326647"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 04:45:43 -0700
X-CSE-ConnectionGUID: blAENsoFRTeBwX0hQur+Dg==
X-CSE-MsgGUID: pBDdHIJwTAq1hEEv/bYHEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="239448415"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 02 Jun 2026 04:45:42 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 9E7E195; Tue, 02 Jun 2026 13:45:40 +0200 (CEST)
Date: Tue, 2 Jun 2026 13:45:40 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Marco Scardovi <scardracs@disroot.org>
Cc: andriy.shevchenko@linux.intel.com, brgl@kernel.org, linusw@kernel.org,
	linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] gpiolib: acpi: prevent address truncation in
 OperationRegion handler
Message-ID: <20260602114540.GB2990@black.igk.intel.com>
References: <20260602113529.52570-1-scardracs@disroot.org>
 <20260602113529.52570-3-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260602113529.52570-3-scardracs@disroot.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37815-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:scardracs@disroot.org,m:andriy.shevchenko@linux.intel.com,m:brgl@kernel.org,m:linusw@kernel.org,m:linux-acpi@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mika.westerberg@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linux.intel.com:from_mime,intel.com:dkim,disroot.org:email,black.igk.intel.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 23C9E62DB91

On Tue, Jun 02, 2026 at 01:32:20PM +0200, Marco Scardovi wrote:
> The ACPI address space handler for GPIO OperationRegions receives the
> pin offset as a 64-bit acpi_physical_address. However, the handler
> truncates this address to a u16 pin_index before validating it.
> 
> If an ACPI table attempts to access a pin offset greater than 65535,
> the truncation wraps the index around. This may result in accesses to
> unintended GPIO pins.

How in practice this can be done given that the GPIO resource has only 2
bytes for the index?

> Fix this by adding an explicit check to verify that the 64-bit address
> is less than agpio->pin_table_length before assigning it to the u16
> pin_index, returning AE_BAD_PARAMETER if it is out of bounds.
> Additionally, make the length calculation overflow-safe and change the types
> of length and loop counter to unsigned.
> 
> Assisted-by: Antigravity:gemini-3.5-flash
> Signed-off-by: Marco Scardovi <scardracs@disroot.org>
> ---
>  drivers/gpio/gpiolib-acpi-core.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-acpi-core.c
> index 1cb5f5884ff0..fc157ee9ac61 100644
> --- a/drivers/gpio/gpiolib-acpi-core.c
> +++ b/drivers/gpio/gpiolib-acpi-core.c
> @@ -1102,10 +1102,10 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
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
> @@ -1125,7 +1125,16 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
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

