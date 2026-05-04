Return-Path: <linux-gpio+bounces-36011-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBQDOFpL+GmQsQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36011-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 09:31:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3549F4B95CF
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 09:31:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3EB4D3010EF2
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 07:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 531AC2797AC;
	Mon,  4 May 2026 07:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T2k0UDfl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590D12EAD1B;
	Mon,  4 May 2026 07:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777879890; cv=none; b=n6p7a9xMWJ+tRTO4zbrwTmjHASEg5OVVt3j4UBzf5LgEF6akFRN2QY/pb5Q8i9SX0KaWyi+uCHepW+1X9WxNodEJSZyZCLZThzzm+y6yQQZTQaAIk4BZgY/aoBShWZ8btp+TCak8B+7OStcdI8crg1ZHb8HQ1LzlceeQkLkOLWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777879890; c=relaxed/simple;
	bh=6g7xp08WTGLosFsZvjTI5s8npg6GBiLQJ2IOqbWCD6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UIZe+IwvbsCmoX7yEd9mx/Nvvrq1R230JHoa5/Ce9N5gNkX/AmO1YGI5j2QHBx+yVUO4xNIRTAB6I/9AaYKfW07NPIYctBO1lY57mcjPc79iSAQG4kfWPr/xi1xgRAF4kMU8OpTVIUjRAk4/vX/8MOn9VzKbho77kRQgOKI04zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T2k0UDfl; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777879888; x=1809415888;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6g7xp08WTGLosFsZvjTI5s8npg6GBiLQJ2IOqbWCD6M=;
  b=T2k0UDfluzMoJr7bnVGvgrBsdSzorhFL+RGZqW1MvWRhkmTtbZq2DNEs
   T/NHwXvsqeF19PRjlXF70ALPFXKClTz7+RPkSmcp2dIL6KhE0gCtzPGwS
   VnQaB8pTkyH9JpmiUIKQUhjIW42VM4YtLITLEmHZ7v/pX0LATehdwp2Cv
   T12NU/o1pVpAS4/LlLQ3AyiTtdn5Gx7Z3/eARL0nRgB+nFGS1X02Ux6kq
   E3AXXhhQjQ9AUuF6eCnQ92lvoxvaFDw3CobROLRgH3PEK3RxZho8EC6bF
   2d9oPcp4aas09ggdQrm2LRO1oZ6Vy+TlTBFZB17JCn/jLygNCwPVJp8y8
   g==;
X-CSE-ConnectionGUID: Fy8Ehq95SLqta0CO1+UjYg==
X-CSE-MsgGUID: 8T/YpU5HRj+c7dVXy+AnBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="78758081"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="78758081"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 00:31:28 -0700
X-CSE-ConnectionGUID: N0ky8Wf5Q/+58WxIh3WUQg==
X-CSE-MsgGUID: TJdHNHWNQ8y+rSV7qyMi4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="232797863"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.78])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 00:31:25 -0700
Date: Mon, 4 May 2026 10:31:23 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] [v2] leds: gpio: make legacy gpiolib interface optional
Message-ID: <afhLS6xwHGm9_mLy@ashevche-desk.local>
References: <20260430091202.2724109-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430091202.2724109-1-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 3549F4B95CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,arndb.de,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-36011-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Thu, Apr 30, 2026 at 11:11:55AM +0200, Arnd Bergmann wrote:

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

>  		return gpiod;
>  	}
>  
> -	/*
> -	 * This is the legacy code path for platform code that
> -	 * still uses GPIO numbers. Ultimately we would like to get
> -	 * rid of this block completely.
> -	 */
> +	return gpiod;

Do we need to repeat the upper `return gpiod;` statement? With this split
I don't see that we need to have two repetitive return statements.

-- 
With Best Regards,
Andy Shevchenko



