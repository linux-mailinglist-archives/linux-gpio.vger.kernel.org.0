Return-Path: <linux-gpio+bounces-33891-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAdVDK/5vGmd5AIAu9opvQ
	(envelope-from <linux-gpio+bounces-33891-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 08:39:27 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9DE2D6B39
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 08:39:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C723B30EA9A3
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 07:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E201335555;
	Fri, 20 Mar 2026 07:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dhmq5CEC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BA13346A0;
	Fri, 20 Mar 2026 07:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773992193; cv=none; b=NBOVyfyVvjdhVvlYucUpQwjKh6ndNLfGVe5IFDOK4hrTLNGh5Ond2dXECczSQ7phhnBREdkjvmU5qyaOZNGjOHRlTsolJrKjZtw2Fq6LK8otnz6BBJ4E7dpYLwn8gEZf9Qnm2d3B7AC6VfgSuWfFQVcCa2shkUFfccLwIq8JQxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773992193; c=relaxed/simple;
	bh=aVjU9vB3deYFYEQRjHDO84MBFFxZKuFsTsm53223WNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rf7+vU6YrG8CtYe+u3wVlqxxvQj0CTZkxk/v8Div9wiwAMnduwtoZbDqFxBh5k2xXnGxLdhMEfQEZ5BjQLpeZ/qr8D+hp5O2V4gvB73aYENAngVKUxCs6yW/KvShPg5152B1GX2aptFsvoUvTmnbb7GRYZbPgOdpixsC+CVMkV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dhmq5CEC; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773992192; x=1805528192;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aVjU9vB3deYFYEQRjHDO84MBFFxZKuFsTsm53223WNA=;
  b=dhmq5CECdkNpALjdO83vnn6RNZ+OklnryFtJxElzOWCrUeVkd5ojR0C9
   0OAWFYT9O9Xnrn3BCn+IOT5Os6u+XxP4zjuk8Xu3HCz43WTEf57YvF1D6
   VVuttKFYVxpdSkYEp3bhXrSVxebq8WHoqiXZQaLdXdXeqA7Bupu5e+yb+
   JnczT3tIgap81ASRKeuIA9+zNgV211dtkgpJYZlarCjI21vudiwOx2UP8
   MU63jBebL5b4U340HhQhQ4s3dVx/YCQJ+CUIclsq1CHOtRqD4lOtQEgB7
   VH72i9BWWM2r3tE6YRDqcLwM8Skfx0Fi2Gd2A0743+s3DCaDNxHtLGl/q
   A==;
X-CSE-ConnectionGUID: zMWtvRx+STWndnLBrI+oeA==
X-CSE-MsgGUID: qaVc0LAQTvWIIaPqdER/oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="74088782"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="74088782"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 00:36:32 -0700
X-CSE-ConnectionGUID: 246dr+i8QaGlyKrDOOi8Ng==
X-CSE-MsgGUID: QY4qFbXSSC6smiTJxZajVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="218590930"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.40])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 00:36:28 -0700
Date: Fri, 20 Mar 2026 09:36:26 +0200
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
Subject: Re: [PATCH 1/4] software node: support automatic secondary fwnode
 assignment
Message-ID: <abz4-iKFBsPIJb7F@ashevche-desk.local>
References: <20260319-baytrail-real-swnode-v1-0-75f2264ae49f@oss.qualcomm.com>
 <20260319-baytrail-real-swnode-v1-1-75f2264ae49f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319-baytrail-real-swnode-v1-1-75f2264ae49f@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-33891-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.978];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ashevche-desk.local:mid,intel.com:dkim]
X-Rspamd-Queue-Id: CF9DE2D6B39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 05:10:54PM +0100, Bartosz Golaszewski wrote:
> Provide a structure and a set of functions allowing to set up automatic
> secondary firmware node assignment for platform devices. It uses
> a behind-the-scenes bus notifier for a group of named software nodes. It
> will wait for bus events and when a device is added, it will check its
> name against the software node's name and - on match - assign the
> software node as the secondary firmware node of the device's *real*
> firmware node.

...

> +/**
> + * software_node_register_auto_secondary() - set up automatic assignment of
> + *                                           secondary firmware nodes
> + * @auto_sec: Context data to use.
> + *
> + * NOTE: All software nodes passed in @auto_sec must be named.

> + * Returns:

Is it with 's' in other kernel-doc? The official is "Return", the 's' variant
is supported, but not documented.

> + * 0 on success, negative error number on failure.

The Return section must be last in the kernel-doc description. This is documented.

> + * This registers the software node group passed in @auto_sec and sets up
> + * automatic assignment of them as secondary firmware nodes of real nodes
> + * attached to appropriate devices on the bus specified in @auto_sec. The
> + * software nodes must be named and their names must be the same as the
> + * devices they should reference. The assignment happens when the device is
> + * first added to the bus.
> + */

...

> +/**
> + * struct software_node_auto_secondary - context data for automatic secondary
> + *                                       fwnode assignment
> + * @nb: Private bus notifier data - don't use

Mark it with __private then.

> + * @node_group: NULL-terminated array of software node addresses
> + * @bus: Bus on which to wait for devices

If bus is not compiled into kernel, this optionally has to support NULL
in the code (I haven't checked the code, though).

> + */
> +struct software_node_auto_secondary {
> +	struct notifier_block nb;

	struct notifier_block __private nb;

> +	const struct software_node * const *node_group;
> +	const struct bus_type *bus;
> +};

-- 
With Best Regards,
Andy Shevchenko



