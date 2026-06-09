Return-Path: <linux-gpio+bounces-38184-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JWH3DxsjKGp4+gIAu9opvQ
	(envelope-from <linux-gpio+bounces-38184-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 16:28:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDB0661089
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 16:28:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=XzbKDAhw;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38184-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38184-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 69CD23182A0B
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 14:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0832C3491E1;
	Tue,  9 Jun 2026 14:16:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6660C33FE0A;
	Tue,  9 Jun 2026 14:16:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014603; cv=none; b=gNiT9q0HK1WZRBS2RzYBTOOJ2RwenpnIlM5Y7Zhrj+h/MRdcOkhi/HpYfni4UjR/63nkIVaxt8IM2fO5iY/8CoirFC1yIi4+6hlCTTcRabeO2TQ/BEHzFtWla7lQLclzi1KKIpDl7e1R2FraB+2KZHFPcLP7Qcs6RBHtEkXfwVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014603; c=relaxed/simple;
	bh=o+0c0WsPcevmNgNT/b61eApninEr9vObhjnMpL1rZD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=unAPsQPi1E3XmuVQLmy186W4TNOfIPxYDqNwgtpBjdm2mkcQ46hhtTT5fyU8EgHtkWcuvozmV1OG/fU0fYjowsYmdCz96rGpw+8GLCZf4iMbPeLjjNawu1UUP+UiYjkXNTnKB6S5gOpV7AddTiBvIldxGwFmcKqLEcVArubk1rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XzbKDAhw; arc=none smtp.client-ip=198.175.65.17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781014601; x=1812550601;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o+0c0WsPcevmNgNT/b61eApninEr9vObhjnMpL1rZD8=;
  b=XzbKDAhw8adQUJ0SHGGKTlg+76q4P8axDcC+2c0fO9Lunh5fGmgcB4/w
   jVLX55zIcXEmGPH9YwYknQVNwyQOJCdIJ/+xJv05lYtCeAlEoYokhfiHX
   uU/uuYg3V5VK4MKB94U4fdjG7/pcO5RutpTdumZHYnRqNBkR8fI01DLx1
   8A3mRVyFb5uV7czsgtw41MDFQiLrJG/cR2xKo7HVkPrVSZHlmL7BBHYph
   iyKf7ypfz70+8jAfwDa8ub4X4p8S8RS2GsvZs5b8x1amN7nd8QdxqppdU
   A5ccx3Adj92XAQTRNGBt98lBmXUZu4ol6t//UaJgldET6dL1Qvr/wzNL9
   Q==;
X-CSE-ConnectionGUID: XS/A4O5zRhmvcxqkt5V/Eg==
X-CSE-MsgGUID: hSgh0eWLT3mdDc631Hk66w==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81783073"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="81783073"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 07:16:41 -0700
X-CSE-ConnectionGUID: SHI38RueQEaN5dJAK1DL4w==
X-CSE-MsgGUID: 8B5xzpfhReeRknG7RJXNhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="269887781"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.162])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 07:16:39 -0700
Date: Tue, 9 Jun 2026 17:16:36 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] gpio: don't process hogs on disabled nodes
Message-ID: <aiggRCmJ8FQEMDib@ashevche-desk.local>
References: <20260609-gpio-hogs-fixes-v1-0-b4064f8070e7@oss.qualcomm.com>
 <20260609-gpio-hogs-fixes-v1-1-b4064f8070e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-gpio-hogs-fixes-v1-1-b4064f8070e7@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:linusw@kernel.org,m:brgl@kernel.org,m:mika.westerberg@linux.intel.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_FROM(0.00)[bounces-38184-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,bootlin.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EBDB0661089

On Tue, Jun 09, 2026 at 02:17:49PM +0200, Bartosz Golaszewski wrote:
> The core hogging logic uses device_for_each_child_node_scoped(), which
> iterates over all child firmware nodes without checking their
> availability. Before the code was moved to the GPIO core, it correctly
> used for_each_available_child_of_node_scoped() to skip disabled nodes.
> Check if the node is available and skip it if not.

...

>  	device_for_each_child_node_scoped(&gc->gpiodev->dev, fwnode) {
> -		if (!fwnode_property_present(fwnode, "gpio-hog"))
> +		if (!fwnode_device_is_available(fwnode) ||
> +		    !fwnode_property_present(fwnode, "gpio-hog"))
>  			continue;

Red herring. the device_for_each_child_node*() is already "available".

So, teach Sashiko to stop on this, not the first time...
https://elixir.bootlin.com/linux/v7.1-rc7/source/drivers/of/property.c#L1132

-- 
With Best Regards,
Andy Shevchenko



