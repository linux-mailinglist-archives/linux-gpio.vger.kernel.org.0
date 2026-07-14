Return-Path: <linux-gpio+bounces-40051-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A38COtH3VWpwxAAAu9opvQ
	(envelope-from <linux-gpio+bounces-40051-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 10:48:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6480D752905
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 10:48:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=SWxNvCB8;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40051-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40051-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E0FF8301DEFA
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 08:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5502D40E8DF;
	Tue, 14 Jul 2026 08:46:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4C233D4E9;
	Tue, 14 Jul 2026 08:46:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784018777; cv=none; b=SCCR/BmpkIr84ULxgDOU8Khfo/1lsrZcCpf1vP64qLlOYZRO2O5F7XZLlFS7UXGnPJnTZOiI1fyMKb4hpAN/85qQvq8tFqNzqvxdxrDA7EZmUXZVX+UIwSds+lej1+1VsQyF35n5poluwBjjJMK+HCVN/atf7v9GSP+M7TPAjys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784018777; c=relaxed/simple;
	bh=xxJuEvZ2G5Kbr3szIgk1JdoMkjjna6X5BPLRDG4VrrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t0wPaqIM6UNcm0RQo+9HZRN6FvorvQcO73S30MylaqUnUOv6krY/l0WhzVr6Mf5L6dAvokQhRc5NsOfLwQK7cHrlkf23M//LrqrsvfUGKMBMpUdFmo9u8ZG1AhRHPpmzDPA+6L+nPs10XHOVhSEFLf07BZC4LPaLZDrSn0mbO5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SWxNvCB8; arc=none smtp.client-ip=192.198.163.12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784018766; x=1815554766;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xxJuEvZ2G5Kbr3szIgk1JdoMkjjna6X5BPLRDG4VrrU=;
  b=SWxNvCB8NlI3GaweaAE2iNFCVGLmYkOTI2niYqqpCvAogMdn1XrfY9eB
   U6njcMM8P9nRhf4va6YHFdPMm2UeVZCEqlP3KGfXE5cGEmPBmqkZgRxdI
   eO4vCdbCel7RLNaWAyjUdC0wgCKJcgLYaZ0uick+we5t5eqxryzWNd8jZ
   xaw+fY+CZekss59tICy6FEaj5f1e7aAdMsb2ZnEdDdKK9Zi6nYE90hcY1
   V6aN/ps50HVLdiZslQ/BeA84UZGBsDY4PyLjRBfN0Um39QC/WCikhPjEG
   6LPkuU88YTtxxrD6QaruS4cLLm/yDjPHuIcPoHY1HTYQZVorPGiIX7Rsz
   A==;
X-CSE-ConnectionGUID: 3mZ2wnGRTSWox8y3MJcWNQ==
X-CSE-MsgGUID: 2bXhfC15Sd+rTzDN1scP6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="88458776"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="88458776"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 01:45:55 -0700
X-CSE-ConnectionGUID: qtQ7RAR0TAGtJe+16mkeLA==
X-CSE-MsgGUID: yJiBbxipTXeGeysSoUXSEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="259370157"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.189])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 01:45:52 -0700
Date: Tue, 14 Jul 2026 11:45:48 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] gpiolib: tolerate gpio-hogs lacking a hogging state
Message-ID: <alX3PLGgoKTgSy_-@ashevche-desk.local>
References: <4c67cf0839ccf57db35a826df6d8fc779531509a.1783974733.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c67cf0839ccf57db35a826df6d8fc779531509a.1783974733.git.daniel@makrotopia.org>
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
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-40051-lists,linux-gpio=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daniel@makrotopia.org,m:linusw@kernel.org,m:brgl@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:frank-w@public-files.de,m:mika.westerberg@linux.intel.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,collabora.com,public-files.de,linux.intel.com,vger.kernel.org,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.intel.com:from_mime,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6480D752905

On Tue, Jul 14, 2026 at 12:30:53AM +0100, Daniel Golle wrote:
> Commit d1d564ec4992 ("gpio: move hogs into GPIO core") made
> gpiochip_add_hog() return -EINVAL for hog nodes lacking any of the
> 'input', 'output-low' or 'output-high' properties. The error is
> propagated by gpiochip_hog_lines() and fails registration of the
> whole GPIO chip.
> 
> The previous OF-specific implementation tolerated such nodes:
> of_parse_own_gpio() warned "no hogging state specified, bailing out"
> and of_gpiochip_add_hog() stopped processing the node without failing
> chip registration.
> 
> Some boards deliberately ship hog nodes without a hogging state in
> their base devicetree and supply the state via overlay, e.g. the PCIe
> slot key selection hogs on the BananaPi R4 Pro added in
> commit e309fa232d12 ("arm64: dts: mediatek: mt7988a-bpi-r4pro: rework
> pcie gpio-hog handling"), as the polarity set in the base devicetree
> could not be overridden from an overlay.
> 
> Booting such a board without an overlay applied now fails to register
> the gpiochip. On the BananaPi R4 Pro this means the MT7988A pinctrl
> device fails to probe, all peripherals including the console UART
> defer forever, and the board finally hangs when clk_disable_unused()
> gates the clocks of the UART still in use by earlycon:
> 
>   gpiochip_add_data_with_key: GPIOs 512..595 (pinctrl_moore) failed to register, -22
>   mt7988-pinctrl 1001f000.pinctrl: error -EINVAL: Failed to add gpio_chip
>   ...
>   clk: Disabling unused clocks
>   (hangs)
> 
> Restore the previous behaviour by warning about hog nodes lacking a
> hogging state and skipping them instead of failing the registration
> of the whole GPIO chip.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

> -	if (fwnode_property_present(fwnode, "input"))
> +	if (fwnode_property_present(fwnode, "input")) {
>  		dflags |= GPIOD_IN;
> -	else if (fwnode_property_present(fwnode, "output-low"))
> +	} else if (fwnode_property_present(fwnode, "output-low")) {
>  		dflags |= GPIOD_OUT_LOW;
> -	else if (fwnode_property_present(fwnode, "output-high"))
> +	} else if (fwnode_property_present(fwnode, "output-high")) {
>  		dflags |= GPIOD_OUT_HIGH;

For a fix I would make it less invasive and yes, break the style, by just
replacing

> -	else
> -		return -EINVAL;

with

	else {
		gpiochip_warn(gc, "%pfwP: no hogging state specified, bailing out\n",
			      fwnode);
		return 0;
	}

> +	} else {
> +		gpiochip_warn(gc, "%pfwP: no hogging state specified, bailing out\n",
> +			      fwnode);
> +		return 0;
> +	}

This leads patch directly to the point. The style can be modified later on.

-- 
With Best Regards,
Andy Shevchenko



