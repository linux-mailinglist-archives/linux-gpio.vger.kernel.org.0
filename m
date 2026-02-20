Return-Path: <linux-gpio+bounces-31965-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /n8jJYN0mGnhIwMAu9opvQ
	(envelope-from <linux-gpio+bounces-31965-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 15:49:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD8C16884A
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 15:49:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E08883015CBA
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 14:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07155342C8B;
	Fri, 20 Feb 2026 14:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AH03F3lD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C553203B4;
	Fri, 20 Feb 2026 14:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771598974; cv=none; b=iIkTfYOWEJ3Q98QGJlO4a/PVjRjiOth5uVNL3sQl/57hjTpw1uKugTzkYlhUcic0opgdP8KJ8PuKv24KTyFXFYUWXJZAvKhfFYnSOpRKVeHq7fCQJ3qMr7ekZrAJYmPeC4LcI2lDeyTGlo21EhRu7cC8UtEOMazzZ+6LzYOXWdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771598974; c=relaxed/simple;
	bh=X3Q8GqhES0hprhj7pIIzJlqdXUW1qVIT0Zs1kaB7aRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SwpvkTMFHra1gdQoG8ouuyJAGAbvyAF736ljgXnC16+MZLXA5pzUfBSDQUTYMIl5GcJlvEqX1nkRUTGIDXQCRGxQVPCorV6sNSFjKvdxdsMYauCqx4Mlf5TPZBNscknXSgkxNY2fJbRpMfs4RnDreQWwCWXHlLNn50uZgbCM6hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AH03F3lD; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771598973; x=1803134973;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=X3Q8GqhES0hprhj7pIIzJlqdXUW1qVIT0Zs1kaB7aRA=;
  b=AH03F3lDhQsQEG9yCGLGrDzPm07yp+Ly4fD7ArVOhsLp1k31eD++LMal
   dKWoVFkn3dCpHeGA6lMAovI9OVeJgr8RgILkpWJk8M8PsEX4HabVLMnZo
   oe6llccYk2QFHgnKJqW6k2VCDp2cksrH1F39LSr0Ll7zR2y6ya1D7aslo
   WK34Yjbzsd5M8PLb5bGqFSDmVdxPZH+eqmZUJZALQW2pE1QwaoqySFNIe
   15N/06FVDZp4f8y4OguLOtFqXSeVTuOiGMRsvKTx70R3sFeWlbdKE1PNm
   +seWBTxTrasZIPlXWlc/DayRYd63QShfh6lu3CmFiVb4z+sZTVrliZRJJ
   A==;
X-CSE-ConnectionGUID: 8ljB6cx+RS2GfXP34QxCTw==
X-CSE-MsgGUID: WBUq7TmYRG6yFLCl2ffNXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="90272420"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="90272420"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 06:49:33 -0800
X-CSE-ConnectionGUID: FIs7jBFoRSOagLSrK9spoA==
X-CSE-MsgGUID: C/iY0PWCTwOMx6QtpPX6SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="219867093"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.25])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 06:49:30 -0800
Date: Fri, 20 Feb 2026 16:49:27 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] driver core: provide device_match_fwnode_ext()
Message-ID: <aZh0d6c3kbfoKWyk@smile.fi.intel.com>
References: <20260219-device-match-secondary-fwnode-v1-0-a64e8d4754bc@oss.qualcomm.com>
 <20260219-device-match-secondary-fwnode-v1-1-a64e8d4754bc@oss.qualcomm.com>
 <aZdraIXlkAHwP-Pm@smile.fi.intel.com>
 <CAMRc=MdYcbO74sbjvKeg5k_E7EHfovFHHasDx2erWfcO39zBNA@mail.gmail.com>
 <aZgPGndb-6FTlnyR@smile.fi.intel.com>
 <CAMRc=McUnsnVOVvxDwTKmchrvyh-_HCwEyJLnseE29d00Eicbw@mail.gmail.com>
 <CAJZ5v0gM08=Zq-VMHX-RT78L=HDacbayM7=SoQ2di-Hsc2SB0w@mail.gmail.com>
 <CAMRc=MeP7_pWef0hrY1+hmjxzQCpMhCZFni1zZcpocPUtyonog@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeP7_pWef0hrY1+hmjxzQCpMhCZFni1zZcpocPUtyonog@mail.gmail.com>
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
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,gmail.com,lists.linux.dev,vger.kernel.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-31965-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CBD8C16884A
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 03:35:28PM +0100, Bartosz Golaszewski wrote:
> On Fri, Feb 20, 2026 at 1:08 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
> > On Fri, Feb 20, 2026 at 12:25 PM Bartosz Golaszewski <brgl@kernel.org> wrote:
> > > On Fri, 20 Feb 2026 08:36:58 +0100, Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> said:
> > > > On Thu, Feb 19, 2026 at 04:21:59PM -0500, Bartosz Golaszewski wrote:
> > > >> On Thu, 19 Feb 2026 20:58:32 +0100, Andy Shevchenko
> > > >> <andriy.shevchenko@linux.intel.com> said:
> > > >> > On Thu, Feb 19, 2026 at 05:31:22PM +0100, Bartosz Golaszewski wrote:
> > > >> >> Provide an extended variant of device_match_fwnode() that also tries to
> > > >> >> match the device's secondary fwnode.

...

> > > >> >> +int device_match_fwnode_ext(struct device *dev, const void *fwnode)
> > > >> >> +{
> > > >> >> + struct fwnode_handle *dev_node = dev_fwnode(dev);
> > > >> >
> > > >> >> + if (!fwnode)
> > > >> >
> > > >> > IS_ERR_OR_NULL()
> > > >> > If supplied @fwnode is secondary, it might be an error pointer.
> > > >>
> > > >> I mirrored existing device_match_fwnode(), should it be fixed too?
> > > >
> > > > The answer is "I don't know". Strictly speaking this should be done everywhere
> > > > in the generic code when we can't guarantee that fwnode that comes to the
> > > > function is pure NULL or valid one.
> > > >
> > > >> >> +         return 0;
> > > >> >
> > > >> >> + if (dev_node == fwnode)
> > > >> >> +         return 1;
> > > >> >> +
> > > >> >> + return fwnode_is_primary(dev_node) && dev_node->secondary == fwnode;
> > > >> >> +}
> > > >> >
> > > >> > I think we can refactor this.
> > > >> >
> > > >> >    struct fwnode_handle *node;
> > > >> >
> > > >> > // I would name it like this, because in 3 cases in drivers/base/property.c
> > > >> > // 2 with node and 1 with dev_node when the same API is called.
> > > >>
> > > >> Haystack's node is "node" and the needle is "fwnode"? Seems confusing to me.
> > > >
> > > > But we need some consistency. drivers/base/property.c is inconsistent to begin
> > > > with and here the code chose the least used one for unknown reasons to me.
> > > >
> > > > I'm fine with "node" that is inside the function.
> > > >
> > > >> >    if (IS_ERR(fwnode))
> > > >> >            return 0;
> > > >> >
> > > >> >    if (device_match_fwnode(dev, fwnode)) // NULL check is inside
> > > >> >            return 1;
> > > >>
> > > >> Yeah, and it too can be supplied a secondary fwnode. Let's say we resolve
> > > >> a reference to a secondary software node and try to lookup a GPIO through it,
> > > >> we'll end up with an IS_ERR() fwnode with existing code, right?
> > > >
> > > > I'm not sure I understood the use case you are trying to describe here.
> > > >
> > > > The very first check guarantees that fwnode is either NULL or valid one.
> > > > When it's a valid one, the comparison with error pointer will be false.
> > > > What did I miss?
> > > >
> > >
> > > I mean: device_match_fwnode() has a NULL check but not an IS_ERR() check and
> > > can be passed a secondary fwnode as argument and that can be -ENODEV. It will
> > > probably not fail terribly but is still incorrect.
> > >
> > > I was speaking about the existing implementation, not addressing your comments.
> > >
> > > >> >    node = dev_fwnode(dev);
> > > >> >
> > > >> >    return fwnode_is_primary(node) && node->secondary == fwnode; // NULL check is inside
> > > >> >
> > > >> >
> > > >> >> + if (!fwnode)
> > > >> >> +         return 0;
> > > >> >
> > > >> >> + if (dev_node == fwnode)
> > > >> >> +         return 1;
> > > >> >> +
> > > >> >> + return fwnode_is_primary(dev_node) && dev_node->secondary == fwnode;
> > > >> >> +}
> > > >
> > > > ...
> > > >
> > > >> >> +int device_match_fwnode_ext(struct device *dev, const void *fwnode);
> > > >> >
> > > >> > Perhaps ext --> or_secondary ?
> > > >>
> > > >> I thought about it but it would make it sound like it only matches the
> > > >> secondary to me. Maybe device_match_all_fwnodes()? Would be future-proof if
> > > >> we end up doing the linked list approach.
> > > >
> > > > Danilo proposed _full, but in my opinion it's not better than _ext unless you
> > > > know very deep how fwnode structure is designed. Same with _all. It's confusing.
> > > >
> > > > fwnode_or_secondary (the key part is "or") sounds more precise. But if you come
> > > > up with something else that makes less ambiguity I will be glad.
> > > >
> > >
> > > device_match_fwnode_or_secondary() sounds good to me but shouldn't we try to
> > > limit the propagation of the "secondary" token in namespaces if our goal is to
> > > get rid of the whole "secondary fwnode" concept?
> >
> > I'm a bit late to this, but here's some background.
> >
> > Secondary fwnodes were not intended for device matching in the first
> > place.  The idea was to use them as a secondary supply of device
> > properties that may be missing from the primary node (think of an ACPI
> > device object accompanied by a software node supplying properties that
> > cannot be derived from the former).  They could be added by a driver
> > after matching the primary node for the benefit of a generic
> > framework.
> >
> > IMV, the example with children inheriting the fwnode from their parent
> > where the user wants to add a different secondary node to each child
> > doesn't really match the picture described above.  At least it was not
> > anticipated.  The idea was to allow the parent's fwnode to be extended
> > and then (possibly) inherited.
> >
> > That's why the secondary fwnode pointer is there under the primary one.
> >
> 
> That's evolution in practice for you. :) It turned out software nodes
> are a good alternative for platform data in board files or MFD
> sub-devices and can serve as the primary firmware node of a device.
> That's alright - we have a common fwnode interface and it works fine.
> 
> > So all of this goes beyond the original anticipated use of secondary
> > fwnodes and it seems to be calling for a list of equivalent (not
> > primary and secondary) fwnodes in struct device, but then of course
> > there's the question about duplicate properties and whether or not the
> > fwnode used for driver binding should be preferred (I don't see why
> > not).
> 
> I think that was Andy's initial proposal: treat the DT or ACPI node as
> the primary "main" node and any software node as an additional source
> of properties. In the absence of "real" nodes, I propose to treat the
> first software node as the primary.
> 
> > Until all of this is resolved, I wouldn't even add a generic helper
> > for matching secondary nodes.  I'd just put this code directly into
> > gpio_chip_match_by_fwnode() along with a big fat comment explaining
> > why exactly secondary nodes need to be taken into account there.
> >
> 
> IMO that's a recipe for keeping it local forever but I don't mind it.
> I think I proposed to add the helper because Andy suggested doing it
> in driver core.

Hmm...
Participating in the discussions for the implementation, yes, true.
Don't remember suggesting that, but if you tell, I might have done
t If it was the case, hat and forgot...

Whatever, for now we have a compromise solution and since Rafael
is the author and maintainer of device properties we may follow
his suggestion.

-- 
With Best Regards,
Andy Shevchenko



