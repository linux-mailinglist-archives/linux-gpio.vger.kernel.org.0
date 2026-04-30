Return-Path: <linux-gpio+bounces-35917-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKgDHf5Q82khzgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35917-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 14:54:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 217B64A2F47
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 14:54:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9D663017C0E
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 12:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7903401A07;
	Thu, 30 Apr 2026 12:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kS18Ch94"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4016335F5EC;
	Thu, 30 Apr 2026 12:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777553526; cv=none; b=KhcZ31M7xnNcE4Z7oOe/98Isz53QCLWZDEqaBW29xSjr4Q4EmqRKu4h07BF/3BXqxYLyu4PEkjh/KqaFnVDTeI+aTRwvOGeaIbaaShj8mjDCDH9I+waXWjLK9zJanGPaHiAEgv0qsd+AvmmWXL3zBNNDdbrg66sxSeklq3IAaa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777553526; c=relaxed/simple;
	bh=3A+ZKlTiXYyj3m20/8ggC63q8vnO7tm6cFlVhOyzMLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oi8oQSw7PoklcwNxKfYI0HGRLvU/YT7fuepNwzvqoQCiYt83KNH2p1KI6xE4B/oFkiq+UFEZedMvqIZ08o+3pCUkM8VNrXTDP12RobmURh2CPaA+U7XOvx/TQO2TuSiQ5KY5sQTjVCgNRmB2olyhIlX6I7P14bITPrkLQlczQ+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kS18Ch94; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777553526; x=1809089526;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3A+ZKlTiXYyj3m20/8ggC63q8vnO7tm6cFlVhOyzMLk=;
  b=kS18Ch94nrLaE/ftqHPJuczTX2aWwuUS5U/nr0cpHWMNLjb4T1E5Hc3i
   ounjhd/639I7Y2Fk3CdtCy568UUcY0tE48ixHyVl0FkvlNLBxefprhVZe
   bWBcbxzxCbYj9pXZyR7R/xVc3lsJ72SY1JKcWwHVTg5rL+jNqowPw5MQv
   9kxUX4uqmGjLkf9o2VfAfLsVNXVF8MgvA6u5/ksdi4uzQoW4KpBfRWPhq
   3hO1JebzAQqYwIUloSEVjo6l9dg3Fi7No9yQD0Ah1QGx77JV4mC+R1Hdi
   lEESrBps1xT4mgMkYEbfxDx5r2JiO4nbG5Z88q3nNFjUiA2/LByQ+gHle
   Q==;
X-CSE-ConnectionGUID: NLbwVlvSQKCaaC7c17397w==
X-CSE-MsgGUID: Fd642AaTQmuvIt+EsSB9Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="81075730"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="81075730"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 05:52:05 -0700
X-CSE-ConnectionGUID: 3iFZh2LPSv6l+Uj1zSqRAQ==
X-CSE-MsgGUID: bp9WQx6kRm6e+OedyEC20A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="228063936"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.244.42])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 05:52:00 -0700
Date: Thu, 30 Apr 2026 15:51:58 +0300
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
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	brgl@kernel.org
Subject: Re: [PATCH v4 2/2] platform/x86: x86-android-tablets: enable fwnode
 matching of GPIO chips
Message-ID: <afNQbtmd3j6wG0iI@ashevche-desk.local>
References: <20260430-baytrail-real-swnode-v4-0-767bcda6667f@oss.qualcomm.com>
 <20260430-baytrail-real-swnode-v4-2-767bcda6667f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430-baytrail-real-swnode-v4-2-767bcda6667f@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 217B64A2F47
X-Rspamd-Action: no action
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
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-35917-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
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
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,ashevche-desk.local:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Thu, Apr 30, 2026 at 09:34:06AM +0200, Bartosz Golaszewski wrote:
> In order to allow GPIOLIB to match cherryview and baytrail GPIO
> controllers by their firmware nodes instead of their names, we need to
> attach the - currently "dangling" - existing software nodes to their
> target devices dynamically.
> 
> The driver uses platform_create_bundle() and expects all required
> providers to be present before it itself is probed. We know the name of
> the device we're waiting for so look them up and assign the appropriate
> software node as the secondary firmware node of the underlying ACPI node.
> 
> Scheduling fine-grained devres actions allows for proper teardown and
> unsetting of the secondary firmware nodes.

...

> +static void auto_secondary_unset(void *data)
> +{
> +	struct fwnode_handle *fwnode = data;
> +
> +	fwnode->secondary = NULL;
> +}
> +
> +static int acpi_set_secondary_fwnode(struct device *parent, struct device *dev,
> +				     const struct software_node *const swnode)
> +{
> +	struct acpi_device *device = to_acpi_device(dev);
> +	struct fwnode_handle *fwnode;
> +	int ret;
> +
> +	fwnode = software_node_fwnode(swnode);
> +	if (WARN_ON(!fwnode))
> +		return -ENOENT;
> +
> +	fwnode->secondary = ERR_PTR(-ENODEV);
> +	device->fwnode.secondary = fwnode;
> +
> +	ret = devm_add_action_or_reset(parent, auto_secondary_unset, &device->fwnode);
> +	if (ret)
> +		dev_err(parent, "Failed to schedule the unset action for secondary fwnode\n");
> +
> +	return ret;
> +}

Why don't we use set_secondary_fwnode() in the above functions?
Drivers are not supposed to know the guts of the fwnode implementation.

...

> +static int auto_secondary_fwnode_init(struct device *parent)
> +{
> +	const struct software_node *const *swnode;
> +	int ret;
> +
> +	if (!gpiochip_node_group)
> +		return 0;
> +
> +	ret = software_node_register_node_group(gpiochip_node_group);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_add_action_or_reset(parent,
> +				       auto_secondary_unregister_node_group,
> +				       gpiochip_node_group);
> +	if (ret)
> +		return ret;
> +
> +	for (swnode = gpiochip_node_group; *swnode; swnode++) {
> +		struct device *dev __free(put_device) =
> +				acpi_bus_find_device_by_name((*swnode)->name);
> +		if (!dev) {
> +			dev_err(parent, "Failed to find the required GPIO controller: %s\n",
> +				(*swnode)->name);

swnode at this point is registered, meaning we have an associated fwnode
handle, hence why not use %pfwP here?

> +			return -ENODEV;
> +		}
> +
> +		ret = acpi_set_secondary_fwnode(parent, dev, *swnode);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko



