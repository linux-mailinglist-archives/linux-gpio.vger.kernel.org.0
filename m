Return-Path: <linux-gpio+bounces-39154-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PQPYEPuXQmpS+QkAu9opvQ
	(envelope-from <linux-gpio+bounces-39154-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 18:06:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 232EE6DD1D4
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 18:06:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=goTAYLvT;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39154-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39154-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 405423088D93
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 15:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D23CA43CED7;
	Mon, 29 Jun 2026 15:58:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D3143C05F;
	Mon, 29 Jun 2026 15:58:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782748704; cv=none; b=Q2KWWPKCUEvA28wBCKuQNRpORNeWDGPjvoxBUGpZx4k0wgXjzQU7KJevf3K66CTpn2Rm/EzQ/RvR/bXrnyDEE1OyQEz8GF3A28yKjHRZKZPvSZfVj6i8YT0zCVupqvobh1PWrERPUDtowKs5YVRhlKqz04Qo+6vaG6MGFa3kW90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782748704; c=relaxed/simple;
	bh=6KGEFAPBIUveS9Bm7GjYL9PASDK/Ym91e/0ppgM5eJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ik9Fdhn6n9xOAYTlpM/K+mfq9kkWJdizKc1fLNRfjXtTv7HCxADnD0FtPi4lj7T3U0CmyhF6ORT1fDseuj/HA0cmd9QFG5LpGscR9z6xCHO+vnQv77iZ+u6AjEpVYQqJmhmCs7Y053lvsdvEVhOjSFDu8gnNui1/qXsMwhd2VCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=goTAYLvT; arc=none smtp.client-ip=192.198.163.17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782748703; x=1814284703;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6KGEFAPBIUveS9Bm7GjYL9PASDK/Ym91e/0ppgM5eJg=;
  b=goTAYLvTTnNWsxH9ZXjtMEEqgZ6gsFHcye4zWNh1G/rBwjOY9ngvHT/V
   BHjs2Kja5Pi87XReTPkvf8JgzQlnnBYzUa9aGeJXkS0adtDDNwuQ3Glm0
   brrbCAnCrootX4E6KX7oL2/vz1RPFzyGgEgePimTB1UZDhXqITSwNvNc2
   B/HM+a/Fz1gK9QUBbzS3x40Zh8oJpgnp6TjufJAtD66OAAkeUbfgOI3HJ
   f1bSFAQLbBusdleD0uv2RChW4AEqTqW6LXlhijD9OU60TcIhfMTOXP1L0
   lnntOb9RM8tX1bLdEbBGJzPpg9Qnzmnislk0kqjQv2OLapjUAn93yeQKd
   w==;
X-CSE-ConnectionGUID: szqlGKgVSOibSZPkZNrB+w==
X-CSE-MsgGUID: AEnXeWjoQU2BKYUL1diajw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83318640"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="83318640"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 08:58:22 -0700
X-CSE-ConnectionGUID: fpjnY+FrQxa8CCgxZbqjyw==
X-CSE-MsgGUID: P0HZsrF6QIWQTHFaQDuBBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="248020780"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 08:58:18 -0700
Date: Mon, 29 Jun 2026 18:58:16 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 5/5] gpio: kunit: add test cases verifying swnode devlink
 support
Message-ID: <akKWGNpGmHjWYdfX@ashevche-desk.local>
References: <20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com>
 <20260629-swnode-fw-devlink-v1-5-b90058b41839@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-swnode-fw-devlink-v1-5-b90058b41839@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39154-lists,linux-gpio=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:brendan.higgins@linux.dev,m:david@davidgow.net,m:raemoar63@gmail.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:brgl@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:kunit-dev@googlegroups.com,m:linux-acpi@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.dev,davidgow.net,gmail.com,linux.intel.com,kernel.org,linuxfoundation.org,vger.kernel.org,googlegroups.com,lists.linux.dev];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,vger.kernel.org:from_smtp,linux.intel.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 232EE6DD1D4

On Mon, Jun 29, 2026 at 12:52:10PM +0200, Bartosz Golaszewski wrote:
> The software node fw_devlink support already has its own kunit suite, but
> that verifies the fwnode links in isolation. Add GPIO tests that prove
> the ordering works in a real-life use-case: a GPIO consumer that
> references its provider via a software node.
> 
> The first suite registers the provider's software node, adds the consumer
> device first and checks that fw_devlink defers its probe until the
> provider has been added and bound. The second covers the fallback:
> with the provider's software node not yet registered no supplier link is
> created, so the consumer probes, devm_gpiod_get() returns -EPROBE_DEFER
> and the consumer only binds once the provider shows up.
> 
> While at it: the existing gpio_unbind_with_consumers() test keeps the
> consumer bound while the provider goes away and then operates the orphaned
> descriptor. With software nodes now being covered by fw_devlink that would
> instead force-unbind the consumer along with the provider, so opt it out
> by setting FWNODE_FLAG_LINKS_ADDED.

...

+ cleanup.h // guard()()
+ err.h // IS_ERR()

>  #include <linux/platform_device.h>
>  #include <linux/property.h>

+ types.h // bool

> +#include <kunit/fwnode.h>
>  #include <kunit/platform_device.h>
>  #include <kunit/test.h>

...

> +	properties[1] = (struct property_entry){ };

Just zero the whole array at the definition time.

...

> +	pdevinfo = (struct platform_device_info){

It's better to have a space after ).

> +		.name = GPIO_PROBE_ORDER_TEST_CONSUMER,
> +		.id = PLATFORM_DEVID_NONE,
> +		.data = &gpio_probe_order_pdata_template,
> +		.size_data = sizeof(gpio_probe_order_pdata_template),
> +		.properties = properties,
> +	};

...

> +	pdevinfo = (struct platform_device_info){

Ditto.

> +		.name = GPIO_TEST_PROVIDER,
> +		.id = PLATFORM_DEVID_NONE,
> +		.swnode = &gpio_test_provider_swnode,
> +	};

...

> +struct gpio_probe_defer_pdata {
> +	int probe_count;

Why is this signed?

> +	int gpio_err;
> +};

...

> +static int gpio_probe_defer_consumer_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct gpio_probe_defer_pdata *pdata = dev_get_platdata(dev);
> +	struct gpio_desc *desc;

> +	pdata->probe_count++;

Even in case of error?

> +	desc = devm_gpiod_get(dev, "foo", GPIOD_OUT_HIGH);
> +	if (IS_ERR(desc)) {
> +		pdata->gpio_err = PTR_ERR(desc);
> +		return pdata->gpio_err;
> +	}
> +
> +	pdata->gpio_err = 0;
> +
> +	return 0;
> +}

...

> +static void gpio_swnode_probe_defer_on_unregistered(struct kunit *test)

As per above.

-- 
With Best Regards,
Andy Shevchenko



