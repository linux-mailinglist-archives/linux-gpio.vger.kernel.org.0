Return-Path: <linux-gpio+bounces-33895-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHcVNCkkvWmr6wIAu9opvQ
	(envelope-from <linux-gpio+bounces-33895-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 11:40:41 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 948FE2D8DCD
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 11:40:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E45773042754
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 10:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EA1039282B;
	Fri, 20 Mar 2026 10:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ln/CSoqV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE068394785;
	Fri, 20 Mar 2026 10:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774003190; cv=none; b=HyfXddzZCFxpUKFnMBpjPyPNgC5Mp/OhSOhtUoou4iXzS1mR2WM97rOv8lxb7p7bqsqxOs3RTTIhsR8f5kQ00KBPv/4S8bgy4YWXzlcAxGDpZ+I4AZ0munLVLAIqEO8CtMl9MjKMJkzXF1PP20z0Mwd0Up95XFPLQmiNpdjZkE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774003190; c=relaxed/simple;
	bh=SnLzT2G6MVdHFsUOkiayvulhkjtORNzjUXCA8pNMTuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IiIe0DPO3koEP2+6mn3DSVIsJjwX2XwF9YO2NLbxn2fLp9BAmaPQQjoubFpBp7W6Vj4tsRjnyCLD2ZegHZXj1PW/qsALtF6mS2l9e71jUblQEa9O8m32r+qvExVOFeTz/Es6ypAleosjnstPizS4S8rLxQyWMlDXZSV2pc/lDiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ln/CSoqV; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774003187; x=1805539187;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SnLzT2G6MVdHFsUOkiayvulhkjtORNzjUXCA8pNMTuM=;
  b=ln/CSoqVAMxTKXTD0ai3u0QmzpQrzxZ+WqVXD2T8Cpwti5XmeuS6iQS1
   mmJzzQ/Az/wbxh8LKN3EydFpZGXjdevAgMFLuuT6QJxKcTqBn6WfNYoHz
   XQ0tkW8O5zDOEFX2+qj/dTi0p53kZ2iRsQ+CMR3mzLPixdvXcnUps+oJB
   4i3rvoSdl6GMUbVLeC7hVxOPakpxtqtHFbIu2v6zJcNT4yObE/ErZ5yeR
   Ekv2rO/L/BK5nL2buE0tvw4WJ/SSHqWnoip72gdN52Y/qmRHtl9Ofwi4X
   +75DgTkcda/vzjgR9kpEt9MOwBW/hxTGtjZoGcvKHrFTcXJuQlfvT3Tgt
   w==;
X-CSE-ConnectionGUID: HloH4AujS5iB2joBxXyVHw==
X-CSE-MsgGUID: wFf3agBcQ36eppDsMYbryg==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="78690886"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="78690886"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 03:39:46 -0700
X-CSE-ConnectionGUID: rTb53jKCTfW9rlOj713jeA==
X-CSE-MsgGUID: Zyxk2wV7SaW7YUHCNR1xeg==
X-ExtLoop1: 1
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.40])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 03:39:42 -0700
Date: Fri, 20 Mar 2026 12:39:40 +0200
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
Message-ID: <ab0j7FEeucEEeD8Q@ashevche-desk.local>
References: <20260319-baytrail-real-swnode-v1-0-75f2264ae49f@oss.qualcomm.com>
 <20260319-baytrail-real-swnode-v1-2-75f2264ae49f@oss.qualcomm.com>
 <ab0jmUZGOKSjOa8C@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab0jmUZGOKSjOa8C@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-33895-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.984];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: 948FE2D8DCD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 12:38:24PM +0200, Andy Shevchenko wrote:
> On Thu, Mar 19, 2026 at 05:10:55PM +0100, Bartosz Golaszewski wrote:
> > Use the new automatic secondary fwnode API to ensure that when the
> > baytrail pinctrl device is added to the platform bus, the static
> > software node provided for drivers not able to use ACPI will get
> > automatically assigned as the secondary fwnode of the primary ACPI node.
> > 
> > Create a new header under linux/pinctrl/ containing intel-specific
> > symbols and declare the new variables there.
> 
> As I read the code, this doesn't need to be part of drivers/pinctrl/intel/.
> I.o.w. I am unable to see why we need to penetrate the certain pinctrl
> driver for this.

...

> >  static int __init byt_gpio_init(void)
> >  {
> > -	return platform_driver_register(&byt_gpio_driver);
> > +	int ret;
> > +
> > +	ret = software_node_register_auto_secondary(&byt_auto_secondary);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = platform_driver_register(&byt_gpio_driver);
> > +	if (ret)
> > +		software_node_unregister_auto_secondary(&byt_auto_secondary);
> > +
> > +	return ret;
> >  }
> 
> This hack can be done in similar way on how we do ACPI LPSS for those
> platforms, i.e. in drivers/acpi/x86/lpss.c. No?

Note, that driver is used on above mentioned platforms. Without it they are
basically useless. With that said, requiring that driver is fine and good thing
to do on those platforms (Bay Trail and Cherry View).

-- 
With Best Regards,
Andy Shevchenko



