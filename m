Return-Path: <linux-gpio+bounces-30904-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OEaD3E+cmnpfAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30904-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:12:49 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF0568799
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:12:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 562393036174
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 15:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A8A7341AD0;
	Thu, 22 Jan 2026 15:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FlLiCd+r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F117E30C624;
	Thu, 22 Jan 2026 15:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769094449; cv=none; b=D/AnOebBa5BAeh1Vzu8pQiDTZOmvet+p0HIjAqYk7K/Ob6Ts4VtPpFk57LJQ9bWL4ET53RZ40OwIiX/48v+z5DvXAsFTJw2TyTJefA1fNoO6uhlQHZlLx7VxcP0t0IpuRlN1hDAmuclFlfrlGnacM1mxLAmHiiOxYzMcbILBsjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769094449; c=relaxed/simple;
	bh=Yu8hIcz6LsJdSdVI0ARln3Qs2ekXTeI4xd+A/dSoqNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KIWhit6zU8teq8zDWWu/71CUh9hq4YNrS5Ihp/0FMXO1RbmTyVqAEvlh/jKAk9I4FWiJgckMlBBwTPB/fvwA3lWQZYux5zJMQGJR0xFpuwPsmCMnkJdhLHHF9aC55NkeDaNDvxa2cQpmuzj1kkZmvluptUSYdB6GWtvm++LDRuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FlLiCd+r; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769094448; x=1800630448;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Yu8hIcz6LsJdSdVI0ARln3Qs2ekXTeI4xd+A/dSoqNE=;
  b=FlLiCd+r7tX6n8RMGRd155QGghMsCLpLYspM+tuybR52KiqaZpR13uc3
   9TGWyr+tVoPJcqCDdiBcWsr7zr7N2yiUmXsWD33iPcx+K0w7cxNjCJ5Mb
   TD2x0s7+53ia4rjbmLy8hWFITFniOn4opYWHGckHxiBKeYNriSj/TEfPD
   bt5o24G/TfLnQuVL/DZUdXCIB+dmh3QL/0jD1iPSlpZdCPOihgrMsMTv8
   bgoHgt0AGs8pPFwdxHVw/oeqqA02qypWQujh2GqivBRniRO78BTIdBQ9p
   lM0EojXAqd++VB8OfwDSGCcxrxz43EC+CFhpEy9nzcIcSeA34H3av36aG
   g==;
X-CSE-ConnectionGUID: 017ldTjISNCCwTYIR6jKhg==
X-CSE-MsgGUID: mXFRCENOQ9ik4k/F5y9vkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="87915290"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="87915290"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 07:07:27 -0800
X-CSE-ConnectionGUID: lrGmoEL/Ta6R+1zUAMw9RQ==
X-CSE-MsgGUID: lDSlKKAkSMqleLtnDd4eAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="244370822"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.225])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 07:07:23 -0800
Date: Thu, 22 Jan 2026 17:07:20 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 4/4] ASoC: ac97: Convert to GPIO descriptors
Message-ID: <aXI9KKlohbA1ySB0@smile.fi.intel.com>
References: <20260122-sound-cleanup-v1-0-0a91901609b8@nxp.com>
 <20260122-sound-cleanup-v1-4-0a91901609b8@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122-sound-cleanup-v1-4-0a91901609b8@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,kernel.org,zonque.org,free.fr,vger.kernel.org,lists.infradead.org,nxp.com];
	TAGGED_FROM(0.00)[bounces-30904-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smile.fi.intel.com:mid]
X-Rspamd-Queue-Id: 8EF0568799
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 08:45:00PM +0800, Peng Fan (OSS) wrote:

> of_gpio.h is deprecated, update the driver to use GPIO descriptors.
>  - Use devm_gpiod_get to get GPIO descriptor, and set consumer
>    name.
> 
> Since the driver still pass the reset_gpio to pxa27x_configure_ac97reset,
> so use desc_to_gpio() to get it gpio id.

GPIO

Why can't we convert that one to use GPIO descriptor to begin with?

...


>  	if (dev->dev.of_node) {
> -		reset_gpio = of_get_named_gpio(dev->dev.of_node, "reset-gpios", 0);
> -		if (reset_gpio == -ENOENT)
> +		/* Assert reset using GPIOD_OUT_HIGH, because reset is GPIO_ACTIVE_LOW */
> +		rst_gpio = devm_gpiod_get(&dev->dev, "reset", GPIOD_OUT_HIGH);
> +		ret = PTR_ERR(rst_gpio);
> +		if (ret == -ENOENT)
>  			reset_gpio = -1;
> -		else if (reset_gpio < 0)
> -			return reset_gpio;
> +		else if (ret)
> +			return ret;
> +		reset_gpio = desc_to_gpio(rst_gpio);

Also, have you considered moving towards 'reset-gpio' driver?

...

And last but not least Q, have you checked gpiolib-of.c if there is any quirks
regarding this case (might be some fixes related to polarity)?

-- 
With Best Regards,
Andy Shevchenko



