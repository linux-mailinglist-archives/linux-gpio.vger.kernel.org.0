Return-Path: <linux-gpio+bounces-33894-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGEbGiokvWmr6wIAu9opvQ
	(envelope-from <linux-gpio+bounces-33894-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 11:40:42 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E502D8DD4
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 11:40:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BFBDB303AAB3
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 10:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B0F395D81;
	Fri, 20 Mar 2026 10:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gaVsxeTc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99573392818;
	Fri, 20 Mar 2026 10:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774003105; cv=none; b=QWal0cD0HTN+uR4oYmnmxzvUW0U5DLbl9DcHCYq68lBnuMeSbc+Bi00E2TLz/RpGKdlF/lv7H1jaxLrt+21/IGXhqgmGvUWqhfGv5uvN++8niMRydHTYVUVml7kRxpZ8j84SZjK8JEMAuTq5TqItPiKat0Zu+xj/sxHXZjmMGBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774003105; c=relaxed/simple;
	bh=gMVGMwrvlhSKPLhRN0bux7/s5qAGHCFJcmzPq35TBOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tVF8ckxioFNRsHyvrKwZo6y4nWwOOGPUScwREArKMnhjcKA7xU+zCs86jspD3Vy8v3yKgqYfRRzuxpjj9nKQ//iaghLgI5ilVy/6ywAMSIdoYn5EsFP7OVUq//ile92nih5koPw5R1pqN6nkygrPXzI0KfBLEzeq95x0T4ZeQQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gaVsxeTc; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774003105; x=1805539105;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gMVGMwrvlhSKPLhRN0bux7/s5qAGHCFJcmzPq35TBOM=;
  b=gaVsxeTcI4gOqRQvw0OR+QN0DxknifaNFsvTjUCqkr0+nWBTafJTOrnh
   0CmTaC38W8zL60rRZWwrhkm3Ghkpn5RlmbQ4Smj84lqZ5QvtWP8c1R8WY
   qteU8pbw8YYYhSBLNdH9dU6XYH7dAuJUPp++MSfu5IFLa4IKwbBBc9Lkr
   /hUFhhWGxWljPKg4tN6liMTpt5JXakonwtko3oitnsik/+9S1afJNpIjt
   7q3QfDAfQPeEBpjhB7Ixp4zvyjJi3LjRrkCoMCOXdUIjwylo2xH1MrmBo
   EvDMPLEJdNec5ZJQIJhVNI79XAhLnateo91QCvl+vh2WgzTJQbvxOuVq7
   Q==;
X-CSE-ConnectionGUID: 9O5utjD+S6ytPXrKh9UV2A==
X-CSE-MsgGUID: WbTbvSs7Sbej+mOE6wHNsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="74787670"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="74787670"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 03:38:25 -0700
X-CSE-ConnectionGUID: nOj8Pb9xSimgluByhTgAaQ==
X-CSE-MsgGUID: W29P3dsLQsC6aEYwKrROaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="223275845"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.40])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 03:38:20 -0700
Date: Fri, 20 Mar 2026 12:38:17 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 2/4] pinctrl: intel: expose software nodes for baytrail
 GPIO devices
Message-ID: <ab0jmUZGOKSjOa8C@ashevche-desk.local>
References: <20260319-baytrail-real-swnode-v1-0-75f2264ae49f@oss.qualcomm.com>
 <20260319-baytrail-real-swnode-v1-2-75f2264ae49f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319-baytrail-real-swnode-v1-2-75f2264ae49f@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-33894-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
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
	NEURAL_HAM(-0.00)[-0.982];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ashevche-desk.local:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 14E502D8DD4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 05:10:55PM +0100, Bartosz Golaszewski wrote:
> Use the new automatic secondary fwnode API to ensure that when the
> baytrail pinctrl device is added to the platform bus, the static
> software node provided for drivers not able to use ACPI will get
> automatically assigned as the secondary fwnode of the primary ACPI node.
> 
> Create a new header under linux/pinctrl/ containing intel-specific
> symbols and declare the new variables there.

As I read the code, this doesn't need to be part of drivers/pinctrl/intel/.
I.o.w. I am unable to see why we need to penetrate the certain pinctrl
driver for this.

...

>  static int __init byt_gpio_init(void)
>  {
> -	return platform_driver_register(&byt_gpio_driver);
> +	int ret;
> +
> +	ret = software_node_register_auto_secondary(&byt_auto_secondary);
> +	if (ret)
> +		return ret;
> +
> +	ret = platform_driver_register(&byt_gpio_driver);
> +	if (ret)
> +		software_node_unregister_auto_secondary(&byt_auto_secondary);
> +
> +	return ret;
>  }

This hack can be done in similar way on how we do ACPI LPSS for those
platforms, i.e. in drivers/acpi/x86/lpss.c. No?

-- 
With Best Regards,
Andy Shevchenko



