Return-Path: <linux-gpio+bounces-31930-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJ9YCSQPmGlz/gIAu9opvQ
	(envelope-from <linux-gpio+bounces-31930-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 08:37:08 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ED4165550
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 08:37:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B89583004F0F
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 07:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4526E3321C7;
	Fri, 20 Feb 2026 07:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VwmUCTf3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88231D555;
	Fri, 20 Feb 2026 07:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771573025; cv=none; b=Z7DGesvznFHAbcAEiWCM2NTZ9qFaligU6EJ7ariSX+xfWkM8mwDKXite1IWQv16LifG0qjNQSSI3bycuAGIXyreyirY8sjWy+1aH5+bhm8J/+qqj9NFtEyCfBtMcReIRruopJ9vgycx1TFr+2kV2aekihmyL+f80hFbcrh+nCmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771573025; c=relaxed/simple;
	bh=NUiFxmOZzrsZQMhVK8dOe2jzKIBT/IpW+g5qMyYOfeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jDeKVSfstFCrjn94SfgR654kLSydqklXErPgn2j1PnxOpVkpeViEplSHoyEusfnNcsjJ8yN6wZJ++gLXuskW4qIKrwFmmAx9KIiuQ8A4s2oDbgetv7xs7QNBjAizWCzpprAi+G9lcVYfRA6St2vuHR9YKPcXXRVoOfsGbEziiSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VwmUCTf3; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771573024; x=1803109024;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NUiFxmOZzrsZQMhVK8dOe2jzKIBT/IpW+g5qMyYOfeE=;
  b=VwmUCTf3ZL0YMGA9yoXqt4NSdhKA71uT6Z32A1cbI4FaTyKtJdEPsb19
   0X26HsKZ4UpHz4AckQYr8152RvfimNt3ibS7ffjEKUxpa6y10oy9BXDhN
   vlEliRRCTtPpjxRBlS/SnnQ98E8+y6L14sTkkXzIaW5YJVkiVlFFcZQRT
   7IWdWnT1mjq+TVLKa1do8DmoIKZr31yNDrohFsOoysippiYNhiT7zpg8Y
   byTxn0PFRlgHPsJ6hZAtkEgCT5GvFHIfBxAzzPzL+p1Oc5ihRDHvnf0pp
   kw+ddTOsK4PUmeo9snv2v2vmEKqRRtH9V8q1RWz9UkJbmCHY6I9M5FEZ9
   Q==;
X-CSE-ConnectionGUID: +ndjPWR/SqyDHGPNaBHzqA==
X-CSE-MsgGUID: lmnDMcWlSySVjejJh5hSXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="90074535"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="90074535"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 23:37:04 -0800
X-CSE-ConnectionGUID: vUmRqhwqSFaz2tqLBTIr5w==
X-CSE-MsgGUID: PCuWXM3rRb6nj5PVQUcxAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="214897020"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.25])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 23:37:01 -0800
Date: Fri, 20 Feb 2026 09:36:58 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] driver core: provide device_match_fwnode_ext()
Message-ID: <aZgPGndb-6FTlnyR@smile.fi.intel.com>
References: <20260219-device-match-secondary-fwnode-v1-0-a64e8d4754bc@oss.qualcomm.com>
 <20260219-device-match-secondary-fwnode-v1-1-a64e8d4754bc@oss.qualcomm.com>
 <aZdraIXlkAHwP-Pm@smile.fi.intel.com>
 <CAMRc=MdYcbO74sbjvKeg5k_E7EHfovFHHasDx2erWfcO39zBNA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdYcbO74sbjvKeg5k_E7EHfovFHHasDx2erWfcO39zBNA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,gmail.com,lists.linux.dev,vger.kernel.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-31930-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: 73ED4165550
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 04:21:59PM -0500, Bartosz Golaszewski wrote:
> On Thu, 19 Feb 2026 20:58:32 +0100, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> said:
> > On Thu, Feb 19, 2026 at 05:31:22PM +0100, Bartosz Golaszewski wrote:
> >> Provide an extended variant of device_match_fwnode() that also tries to
> >> match the device's secondary fwnode.

...

> >> +int device_match_fwnode_ext(struct device *dev, const void *fwnode)
> >> +{
> >> +	struct fwnode_handle *dev_node = dev_fwnode(dev);
> >
> >> +	if (!fwnode)
> >
> > IS_ERR_OR_NULL()
> > If supplied @fwnode is secondary, it might be an error pointer.
> 
> I mirrored existing device_match_fwnode(), should it be fixed too?

The answer is "I don't know". Strictly speaking this should be done everywhere
in the generic code when we can't guarantee that fwnode that comes to the
function is pure NULL or valid one.

> >> +		return 0;
> >
> >> +	if (dev_node == fwnode)
> >> +		return 1;
> >> +
> >> +	return fwnode_is_primary(dev_node) && dev_node->secondary == fwnode;
> >> +}
> >
> > I think we can refactor this.
> >
> > 	struct fwnode_handle *node;
> >
> > // I would name it like this, because in 3 cases in drivers/base/property.c
> > // 2 with node and 1 with dev_node when the same API is called.
> 
> Haystack's node is "node" and the needle is "fwnode"? Seems confusing to me.

But we need some consistency. drivers/base/property.c is inconsistent to begin
with and here the code chose the least used one for unknown reasons to me.

I'm fine with "node" that is inside the function.

> > 	if (IS_ERR(fwnode))
> > 		return 0;
> >
> > 	if (device_match_fwnode(dev, fwnode)) // NULL check is inside
> > 		return 1;
> 
> Yeah, and it too can be supplied a secondary fwnode. Let's say we resolve
> a reference to a secondary software node and try to lookup a GPIO through it,
> we'll end up with an IS_ERR() fwnode with existing code, right?

I'm not sure I understood the use case you are trying to describe here.

The very first check guarantees that fwnode is either NULL or valid one.
When it's a valid one, the comparison with error pointer will be false.
What did I miss?

> > 	node = dev_fwnode(dev);
> >
> > 	return fwnode_is_primary(node) && node->secondary == fwnode; // NULL check is inside
> >
> >
> >> +	if (!fwnode)
> >> +		return 0;
> >
> >> +	if (dev_node == fwnode)
> >> +		return 1;
> >> +
> >> +	return fwnode_is_primary(dev_node) && dev_node->secondary == fwnode;
> >> +}

...

> >> +int device_match_fwnode_ext(struct device *dev, const void *fwnode);
> >
> > Perhaps ext --> or_secondary ?
> 
> I thought about it but it would make it sound like it only matches the
> secondary to me. Maybe device_match_all_fwnodes()? Would be future-proof if
> we end up doing the linked list approach.

Danilo proposed _full, but in my opinion it's not better than _ext unless you
know very deep how fwnode structure is designed. Same with _all. It's confusing.

fwnode_or_secondary (the key part is "or") sounds more precise. But if you come
up with something else that makes less ambiguity I will be glad.

-- 
With Best Regards,
Andy Shevchenko



