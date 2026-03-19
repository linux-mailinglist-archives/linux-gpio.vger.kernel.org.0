Return-Path: <linux-gpio+bounces-33798-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIflKFGfu2kLmAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33798-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 08:01:37 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 784B02C7076
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 08:01:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6F1753044368
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 07:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 371B139DBCE;
	Thu, 19 Mar 2026 07:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zxi5y3sr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85B51A2545;
	Thu, 19 Mar 2026 07:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773903653; cv=none; b=URkoZ6oelPR4isll6BLnAvBhGiHAPY2405qX8DO9NjguHxyMiZZGq7roogVM3jwTC9Vt47LRqrq0+5fyAWcGu8n6myW4RfHkb4hRRJXI65tj8XVE6S/M7rh2GeqIQxce3KOg0On2ZvPzU8UHZgdcXm7YKB0hXLrFkIOc50XRZ30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773903653; c=relaxed/simple;
	bh=mSQB39Y+wYfb1mEJAPn6GNde2Q3jWoOUhTefKGA3MZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eWtFmsrdCFLFIaVPkEy7U7NMFOvQ3gOtsHfQNWt+mJyKFLHdyKnbfHrowCZNY6Sk4Nn/lNLZVNy7uVyn8vL3nu5jvrU1EPyE2Q+LDVlef/MhwkgyxfQVaWUCYJnZlKjwi9kspHHYJHsvHp+BVmWQnho4b0ngARSY3/WFkj5BpSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zxi5y3sr; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773903652; x=1805439652;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mSQB39Y+wYfb1mEJAPn6GNde2Q3jWoOUhTefKGA3MZ4=;
  b=Zxi5y3srCFELbMsgvzF9LNKgvprUunhWKL9t2JLCfBtoqhy38W7EIVbD
   6XTvjiSFHFYPZ1ETjs1dqP8e2dVC4z0E/My0xZBc7CsVlU5HrFg6qbWYT
   EPZZuQIq2vyS1LjErOZPVQ/3A7hnMyxcSxK5LKMXYgeFLQfkOk20jNbTQ
   BN8omBrFAN/7FhoOXbhC75/GbZoq/BZwoviIXbzNgT77opi0hAZNIjpp3
   Z8ae6gVoq5srfChXWbdREF6fFWDVmyyUU1IrShRIiCxKtZ3EYq77V1fRO
   oGGmZ3vJa4aTfuyGy6jPMaWe2PL0cOoayP7zRQSI7RTy4hPscjvThtYOu
   g==;
X-CSE-ConnectionGUID: p2qBrCLwSbu6yx4aCa3oPw==
X-CSE-MsgGUID: wH996OZqR4SSYK8DYJuASA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="92541264"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="92541264"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 00:00:51 -0700
X-CSE-ConnectionGUID: Pjtnw8cKTeigdfKvWDOVQQ==
X-CSE-MsgGUID: lC0ZRLTPQrmHc4WpQEufIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="216959640"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.120])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 00:00:49 -0700
Date: Thu, 19 Mar 2026 09:00:47 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 3/5] pinctrl: intel: Enable 3-bit PAD_OWN feature
Message-ID: <abufH4bG1ISKx3bk@ashevche-desk.local>
References: <20260318151256.2590375-1-andriy.shevchenko@linux.intel.com>
 <20260318151256.2590375-4-andriy.shevchenko@linux.intel.com>
 <20260319055837.GO2275908@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319055837.GO2275908@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33798-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: 784B02C7076
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 06:58:37AM +0100, Mika Westerberg wrote:
> On Wed, Mar 18, 2026 at 04:10:17PM +0100, Andy Shevchenko wrote:
> > Starting from revision 1.1 of the Chassis specification the PAD_OWN
> > is represented by 3 bits instead of 2 bits in the previous revisions.
> > Update the driver to support this feature.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko



