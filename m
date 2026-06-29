Return-Path: <linux-gpio+bounces-39146-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3C18LLGMQmpY9gkAu9opvQ
	(envelope-from <linux-gpio+bounces-39146-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 17:18:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADEA6DC8D4
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 17:18:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=X8MtNOMV;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39146-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39146-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5ABA3315EB34
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 15:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D19D83F23D0;
	Mon, 29 Jun 2026 15:10:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545383E92BD;
	Mon, 29 Jun 2026 15:10:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782745804; cv=none; b=OY0qM397LWZo1GLv21w++jjnMeFVRfrRs8m1rsdjOGpIBLFJIq5YqH4hKQw1RKpgsDqfyKksqcahs0jHGlUiR156MKyZOdahWEQAtxRmXoRPWtqtxoUb5iZawNMN4NiFQOjbs6RXZ8dqoSTHb3YAO1w8qEqJ70hDWHW5zShGJ6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782745804; c=relaxed/simple;
	bh=KPvDGPjMqG4x73TK2zJPV7GSwKG2WIpcWNT33r6AJIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QtG1HdE+GYo9Tmr6KDzX7IFVJ63u99Xk3Khsr5KW3GCRQ4VrJ/+m2v3db5TsFfXxDNcpzwgLmMhVpPxTYP2KCcYbXBPa/0F89qT7GTkg+GK6khRpEH5hI9vYhhpC0J/go9uF6PrULVew0Vtd2o+VsF+7txYMtu5+4PeLIOQ/H/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X8MtNOMV; arc=none smtp.client-ip=198.175.65.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782745804; x=1814281804;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KPvDGPjMqG4x73TK2zJPV7GSwKG2WIpcWNT33r6AJIo=;
  b=X8MtNOMVqqrgbmuJ/e8Uwm60puEgWjdSUUdteXbIBWQrq/+CiXR2ToRX
   PE9HCl+jlpanhkYk4SUC4YGHzXLwGU/MBsLL2XSKX8iEnScCwdl9SNaMa
   nx9R2/4G5S+NnArrw1/StR4ErkrX8vyrqqC/PUxsAV0CjIPwWllOB55Bm
   8EQIIetY5tkzWKGnjhVLNW7s4Y316GeEh1j6gFwaMF7PJb2IwdQIDvkWE
   vlUwpKEb2HGPKAp9zBzfLmu6QV4X61d1n/q2JBEmO1STQMqhS41KZsIZU
   qCYCTa3S5JxDf/JI2mqgUlgHcbrOMstQJgACsitLzpL+ifwJLtxpW1eRu
   Q==;
X-CSE-ConnectionGUID: 7Kl0kvw/R2uPTgChT3T8cg==
X-CSE-MsgGUID: MlLLlKBxRpmT+oD8Wbl+2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="93789514"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="93789514"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 08:10:03 -0700
X-CSE-ConnectionGUID: /xknQc/XQ/O5QOYBgCiPfA==
X-CSE-MsgGUID: hSUYX2pDSkK656ZDkQ8Bng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="290105338"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 08:09:58 -0700
Date: Mon, 29 Jun 2026 18:09:56 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 5/6] [v5] leds: gpio: make legacy gpiolib interface
 optional
Message-ID: <akKKxHB6RMymG70Z@ashevche-desk.local>
References: <20260629130329.1291953-1-arnd@kernel.org>
 <20260629130329.1291953-6-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629130329.1291953-6-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39146-lists,linux-gpio=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:arnd@kernel.org,m:linux-gpio@vger.kernel.org,m:arnd@arndb.de,m:glaubitz@physik.fu-berlin.de,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linusw@kernel.org,m:brgl@kernel.org,m:dmitry.torokhov@gmail.com,m:lee@kernel.org,m:pavel@kernel.org,m:linux-sh@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-leds@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,arndb.de,physik.fu-berlin.de,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,gmail.com,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,vger.kernel.org:from_smtp,ashevche-desk.local:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2ADEA6DC8D4

On Mon, Jun 29, 2026 at 03:03:28PM +0200, Arnd Bergmann wrote:

> There are still a handful of ancient mips/armv5/sh boards that use the
> gpio_led:gpio member to pass an old-style gpio number, but all modern
> users have been converted to gpio descriptors.
> 
> While the CONFIG_GPIOLIB_LEGACY option that guards devm_gpio_request_one()
> and related helpers is currently turned on in all kernel builds,
> the plan is to only enable it on the few platforms that actually
> pass gpio numbers in any platform_data.
> 
> Split out the legacy portion of the platform_data handling into a custom
> helper function that is guarded with in #ifdef block, to allow the
> the leds-gpio driver to compile cleanly when CONFIG_GPIOLIB_LEGACY
> gets turned off. Once the last user is converted, this function can
> be removed.

...

>  	gpiod = devm_gpiod_get_index_optional(dev, NULL, idx, GPIOD_OUT_LOW);
> -	if (IS_ERR(gpiod))
> -		return gpiod;

We can leave these and rather have

	gpiod_set_consumer_name(gpiod, template->name);
	return gpiod;

than introduce irregular pattern.

> -	if (gpiod) {
> +	if (!IS_ERR(gpiod))
>  		gpiod_set_consumer_name(gpiod, template->name);
> -		return gpiod;
> -	}
>  
> -	/*
> -	 * This is the legacy code path for platform code that
> -	 * still uses GPIO numbers. Ultimately we would like to get
> -	 * rid of this block completely.
> -	 */
> +	return gpiod;
> +}

I haven't insisted on this previously as I thought that this was on track to be
applied. Since it's not (yet), please, amend the change.

-- 
With Best Regards,
Andy Shevchenko



