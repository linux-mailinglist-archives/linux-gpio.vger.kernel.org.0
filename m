Return-Path: <linux-gpio+bounces-39144-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NfXDCLKFQmpJ9AkAu9opvQ
	(envelope-from <linux-gpio+bounces-39144-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 16:48:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC3B6DC3EF
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 16:48:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=MIwUD5NB;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39144-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39144-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 74680304DCC1
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 14:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DED2416D09;
	Mon, 29 Jun 2026 14:36:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF853E169E;
	Mon, 29 Jun 2026 14:35:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782743760; cv=none; b=rvJ2THwrWbAyFm36O5MZWXA5vmi0P2p0XhVx1gzrSEjkc48TBqCcb52WYnONnMRi2DwYDIWpxM05AY+pjtNcT5lHaoAKbL+ptCyyYZFkLk7VkgVkgV49zuOndA3DHqbiG/7vTPed8njSgswWN9BWSo3apKXHstXiopCvcjIkDBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782743760; c=relaxed/simple;
	bh=qadMrehZipQBP0SK0FEIR9R8NAJ0UU3ERZJptjWc3Ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y1LZkacCmcgUtmZf2bBAoXXWRVWHcSM/K+7FnqJsZ+2le5eg5MCrgz+wAuGlMk88/BxC8s/K54NvdtY5pyAzeS8jGFmIAQ7q5MRya+MUJOTO67ngQKaiBe8KMfvy5erC/nCKJ20JxA4AFOO290q8cjhpb7R5Q4MmR4+RnHkBXDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MIwUD5NB; arc=none smtp.client-ip=192.198.163.17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782743759; x=1814279759;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qadMrehZipQBP0SK0FEIR9R8NAJ0UU3ERZJptjWc3Ws=;
  b=MIwUD5NBcdkigX9aNnpyao4UpHEFXg44hhy2XNqFZAyMhns6Q42AV5Sq
   CRY9oZ/BxhELg5uUxAeD/oaj63500Bo8A1q4xhs9vgOE7THjvmXoaN8xu
   v9GEyMEFJdWWPStTz7ghIWia2sc49a2rZfGUCHfUUyzYoR26CLd0hRW0B
   utIh/4J/n1E4GcxUtLR4f4H7hY24AQmF1LquGtVXPbd+KHW5I153lWFey
   5xlQNzpr5DIdW3YPjVeuZdBh6k3K1TSUaF9iBJUylz3R/XELnXXf90QZI
   A80kwX8Yh+gsfnKcy7GVsoHxOsVEpdZB7B6n1m9TjzsYAXQd+HIkXf2Hn
   Q==;
X-CSE-ConnectionGUID: 8sQ9+YejTfKXbnWJEV00nw==
X-CSE-MsgGUID: HyzVzSXNQhymOJIpFpFpiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83308752"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="83308752"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 07:35:58 -0700
X-CSE-ConnectionGUID: YWmC+1XOSc2qoy3jMewjgw==
X-CSE-MsgGUID: cFd+FRyQSiOxP2AmOj47hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="253876941"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 07:35:56 -0700
Date: Mon, 29 Jun 2026 17:35:54 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH] gpio: swnode: remove deprecated lookup mechanism
Message-ID: <akKCyguixSY2VIJN@ashevche-desk.local>
References: <20260629-gpio-swnode-drop-label-matching-v1-1-db1af36cf883@oss.qualcomm.com>
 <akJu0EFRFUjxaq34@ashevche-desk.local>
 <CAMRc=MdZeUEMh28_NCNo1k02E3X_A2tUsv6YuUUWONPoy2nwBQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdZeUEMh28_NCNo1k02E3X_A2tUsv6YuUUWONPoy2nwBQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-39144-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:andy@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:dkim,intel.com:email,intel.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7EC3B6DC3EF

On Mon, Jun 29, 2026 at 07:04:43AM -0700, Bartosz Golaszewski wrote:
> On Mon, 29 Jun 2026 15:10:40 +0200, Andy Shevchenko
> <andriy.shevchenko@intel.com> said:
> > On Mon, Jun 29, 2026 at 12:54:58PM +0200, Bartosz Golaszewski wrote:

...

> >>  fwnode_lookup:
> >> -	gdev = gpio_device_find_by_fwnode(fwnode);
> >
> >> -	return gdev ?: ERR_PTR(-EPROBE_DEFER);
> >
> > Can we simply leave these two instead?
> 
> Honestly, that's just personal preference. I prefer the oneliner.

I was under impression that gdev variable has use after this, but LKP showed
that you missed its removal. With that in mind, I have no objections against
oneliner.

-- 
With Best Regards,
Andy Shevchenko



