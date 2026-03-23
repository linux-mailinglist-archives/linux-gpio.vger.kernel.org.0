Return-Path: <linux-gpio+bounces-34042-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOvuKpl3wWkQTQQAu9opvQ
	(envelope-from <linux-gpio+bounces-34042-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 18:25:45 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9C12F9E28
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 18:25:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9934632084E5
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 17:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C60AA3C3C01;
	Mon, 23 Mar 2026 17:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NAsPO8mB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E762C11CA;
	Mon, 23 Mar 2026 17:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774285530; cv=none; b=aXnKOMITu1d6AIzpPqkKBW/85y6vYbvSK253XfWfw1UGkKG1N1LLa9Bh708izhaQpC3rMuoiKamnstPYCvIpgjvKop3+U03KSje3yzWqhAxK2LbsdNU9yY/7SKPvXQOIuhxuKHlOAhZoeL0HVhA/uA53ABYQ3cNzpIVSH/cSQLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774285530; c=relaxed/simple;
	bh=6Qur2lsvpG61vQA+N4OQDfAzhlhf0xYbqoLWM6SAJr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hJXiJhPR6fMNRNQbx3dcGc4dwo86G/0+AY2XjtaqSoaDBW+etnbDykKOHaKlAgYilkV9Yl2AuLkGjakpjdxQPDElDTFq9tkMwSerXYSQIond4tdR1Je5gpqkNPQr3uiyiH8l6mCMtiJ23eTSe3ellPOSdg3f+Ye25Nc0kHIFwzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NAsPO8mB; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774285529; x=1805821529;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=6Qur2lsvpG61vQA+N4OQDfAzhlhf0xYbqoLWM6SAJr4=;
  b=NAsPO8mBN+17BO/+VcggnAvfbEZSGwZn08vn7+hIgSwrXjKnONZsLlJq
   ZI4KB2n4qVTIIlhd7YwtEamxB+gTIPLDwZaIIG/gExh06R4JEuY6GwCpJ
   fm/2Dc20/dX+sxJ7ocDSNYP1XRCR8c7ZaBHcNqp4L6KeiPqv7rVU/UrAR
   adPcYVJSbZ5Imen+ZJ6E3Khb/fQHb4LgLOHoASwiI1/7XNzWMSjAamXoy
   kcphu+9vHvWlcS0/R+nKNoPAQB7ifgbHl5bgiLWb6GuYO0OSt+ry3Kfqk
   eWIrSWNxZXoDzyzYSzo+3WEhGPYJhAFZ+v8Vkntvl5Gjaf/QqbAAe2auC
   A==;
X-CSE-ConnectionGUID: mvzNtpIoSCmNp7NwPl6dpA==
X-CSE-MsgGUID: 2Rsh7J8AQo+EA6Bda3dByQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="74470920"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="74470920"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 10:05:28 -0700
X-CSE-ConnectionGUID: do0RC8zYQV2ii/aKNxr10Q==
X-CSE-MsgGUID: iuPD2DA0SvuNzn7GgydAAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="229010438"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.22])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 10:05:24 -0700
Date: Mon, 23 Mar 2026 19:05:21 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Daniel Scally <djrscally@gmail.com>,
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
Message-ID: <acFy0YgLJhvZZU7k@ashevche-desk.local>
References: <20260319-baytrail-real-swnode-v1-0-75f2264ae49f@oss.qualcomm.com>
 <20260319-baytrail-real-swnode-v1-2-75f2264ae49f@oss.qualcomm.com>
 <ab0jmUZGOKSjOa8C@ashevche-desk.local>
 <CAMRc=MdWxgGftNQgs8d-0xqsfgJSSncfBf+7cmWSSypu2rQrmg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdWxgGftNQgs8d-0xqsfgJSSncfBf+7cmWSSypu2rQrmg@mail.gmail.com>
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
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gmail.com,linux.intel.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-34042-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 6C9C12F9E28
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 04:28:39PM +0100, Bartosz Golaszewski wrote:
> On Fri, Mar 20, 2026 at 11:39 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Thu, Mar 19, 2026 at 05:10:55PM +0100, Bartosz Golaszewski wrote:
> > > Use the new automatic secondary fwnode API to ensure that when the
> > > baytrail pinctrl device is added to the platform bus, the static
> > > software node provided for drivers not able to use ACPI will get
> > > automatically assigned as the secondary fwnode of the primary ACPI node.
> > >
> > > Create a new header under linux/pinctrl/ containing intel-specific
> > > symbols and declare the new variables there.
> >
> > As I read the code, this doesn't need to be part of drivers/pinctrl/intel/.
> > I.o.w. I am unable to see why we need to penetrate the certain pinctrl
> > driver for this.
> 
> If old board files were an analogy, the kind of information software
> nodes carry would live neither in the provider module nor in the
> consumer driver. It would be defined in a third place - the board
> file. Do we need something like this or should this logic be invoked
> from the x86 platform driver that uses these GPIOs but accesses them
> via the swnode lookup?

Yes, fine, and that file is kinda board files (or rather quirks) for the
Bay Trail, Braswell and a few more. Please, use that one instead, let's
keep drivers/pinctrl/intel/ clean from it.

...

> > >  static int __init byt_gpio_init(void)
> > >  {
> > > -     return platform_driver_register(&byt_gpio_driver);
> > > +     int ret;
> > > +
> > > +     ret = software_node_register_auto_secondary(&byt_auto_secondary);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     ret = platform_driver_register(&byt_gpio_driver);
> > > +     if (ret)
> > > +             software_node_unregister_auto_secondary(&byt_auto_secondary);
> > > +
> > > +     return ret;
> > >  }
> >
> > This hack can be done in similar way on how we do ACPI LPSS for those
> > platforms, i.e. in drivers/acpi/x86/lpss.c. No?
> 
> Hey, this is not a hack! I'm coming up with a generic solution here. :)

Sorry, let's call it solution.

> It already is similar in that it uses a notifier. For v2 howevere, I
> want to propose a mechanism for having multiple ways of matching real
> fwnodes with software nodes.

Good.

-- 
With Best Regards,
Andy Shevchenko



