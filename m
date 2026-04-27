Return-Path: <linux-gpio+bounces-35605-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOguEiiH72ksCQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35605-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 17:56:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD241475B55
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 17:56:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B04BF301E21F
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 15:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CDB131E84F;
	Mon, 27 Apr 2026 15:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Umiet226"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B171A6822;
	Mon, 27 Apr 2026 15:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777304554; cv=none; b=mthT+D4enHRjtAIuDMVRym9tWS33/hGPh0zYIbV6EmudPcxwyQxwx0Wcv/7wMEy4QaWqf0Y02WzAy2XgR+2e/zNS20pqu6lxNEQc1jFqEFY3JqQjpBJOXZBMsYXsTq6cVeS4IUC/sVQTYSpSsmQAemw84vL2IWfVssbzeTXyU68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777304554; c=relaxed/simple;
	bh=jpeqo3blo68qkWdVPmQrUuVlGinKzd6r+L8pS5ET8wc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mUom5wg236c6AlWSk9QkYoPUbOo8YOlJmJCmxXu1Uj/1rKC4yaWdrb7DH9kghJ16Sywb+lMrGaDc/FKiWgAQgPas3hGzS8AvvLgpJdgmnH6tdq/+YTEOXWdLrhvj14xtJ0v3T99pNAhVy+ziOnqDTLtj/9W0clyAx+e6GYaHUUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Umiet226; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777304552; x=1808840552;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jpeqo3blo68qkWdVPmQrUuVlGinKzd6r+L8pS5ET8wc=;
  b=Umiet226sjN59+PO5ZFl9SfXMnsmLGb2b49uLAycdvGK2fkxMcfocAqB
   k2xghJ3pvIBg82pkwRFCykyU1DfBnZDJVcjRxSpeaM6wL8YV08mdSPpAe
   McJ4P38HlFTyHwWGPsL1s8a2L6RiKHfOFQUvDDmFxamadkuzMIpSiB4Tz
   COY1LUb0N26s1KvggAj5CzHDbcydEebVYpNKN9wn7oe9HUYuUfGk4mmVO
   hcA+hgDPNRLGQmqz+ohSb16EZGvIek62LltAuPkgweacjL3uHoqzyVFCM
   b9JzYgParHj4yfd4+M8Bv1rt4tyacBgO1AGExLXCcgOUBNkJ7ksoQyrZ8
   Q==;
X-CSE-ConnectionGUID: GJmEHxCoREyHgAj0lo1fBA==
X-CSE-MsgGUID: +wGkdRo1QeqfvF+OXOZ4iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="95758804"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="95758804"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 08:42:31 -0700
X-CSE-ConnectionGUID: YGGLeOhSQYyz1BHpkVsziQ==
X-CSE-MsgGUID: aLLViqwXTyqs3NaMC227iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="235425461"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.2])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 08:42:28 -0700
Date: Mon, 27 Apr 2026 18:42:25 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] usb: udc: pxa: remove unused platform_data
Message-ID: <ae-D4Qki41GpOHyx@ashevche-desk.local>
References: <20260427143300.2887692-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427143300.2887692-1-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: BD241475B55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,arndb.de,zonque.org,gmail.com,free.fr,kernel.org,lists.infradead.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-35605-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim]

On Mon, Apr 27, 2026 at 04:32:10PM +0200, Arnd Bergmann wrote:

> None of the remaining boards put useful data into the platform_data
> structures, so effectively this only works with DT based probing.
> 
> Remove all code that references this data, to stop using the legacy
> gpiolib interfaces. The pxa27x version already supports gpio
> descriptors, while the pxa25x version now does it the same way.

...

> +	dev->pullup_gpio = devm_gpiod_get_index_optional(&pdev->dev, "pullup", 0,
> +						    GPIOD_OUT_HIGH);

While I gave a tag some time ago, I still wonder why we use _index variant here.
With

	struct device *dev = &pdev->dev;

it becomes just a single line (yes, 82 characters long).

	dev->pullup_gpio = devm_gpiod_get_optional(dev, "pullup", GPIOD_OUT_HIGH);

> +	if (IS_ERR(dev->pullup_gpio)) {
> +		dev_dbg(&pdev->dev,
> +			"can't get pullup gpio err: %ld\n",
> +			PTR_ERR(dev->pullup_gpio));

This occupies more LOC than needed (also gpio --> GPIO).

		dev_dbg(dev, "can't get pullup GPIO err: %ld\n",
			PTR_ERR(dev->pullup_gpio));

I even wouldn't mind this to be long single line

		dev_dbg(dev, "can't get pullup GPIO: %ld\n", PTR_ERR(dev->pullup_gpio));

(I dropped ' err' part in this variant, though).

> +		retval = PTR_ERR(dev->pullup_gpio);
> +		goto err;
>  	}

-- 
With Best Regards,
Andy Shevchenko



