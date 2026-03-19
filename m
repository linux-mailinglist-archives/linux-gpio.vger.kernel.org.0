Return-Path: <linux-gpio+bounces-33796-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id jFKpDyGfu2kLmAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33796-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 08:00:49 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A659A2C7031
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 08:00:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A0EFA302AF1D
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 07:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B74B439DBEB;
	Thu, 19 Mar 2026 07:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cUaZjohL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2608639C003;
	Thu, 19 Mar 2026 07:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773903628; cv=none; b=N+McmaW3kh1q3241jdYo8gLSCWTfm9M8T2C3JKO6gvOJAJ3AvGYoGBzgjqPQWG4xDMfLH6vQcoOWCNpfW5vJZRq/G9irLBy5yYccAhjUzkkJEJG/Q92NYhiXWxvt++x6Efd9rM9+K7P03dgOZ109/gPjgATFn8Lgv4p/cmQ2uTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773903628; c=relaxed/simple;
	bh=HmOMzC6xotNLWhON2ErwOeOjoEcpGGMNEuRcdTcg3eU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H6k7ob4Ct2xbI2IRFp/Q2fSsSz5PItrc4ETAFwtM5yt0G0wDsUdKCYJdA1u96ESVmeeUmHOPVZeYtVpOyt9a70bfaMBp3MxfX+aGeHJy1iu8u4wXTN7taJR9oV2wW+D7PYxOahOoRjpYKUVgQvFGfvKn3fop2D7NEr+SrUAxT4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cUaZjohL; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773903618; x=1805439618;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HmOMzC6xotNLWhON2ErwOeOjoEcpGGMNEuRcdTcg3eU=;
  b=cUaZjohLOUVeXEZ6tRFf27o3f7CDia746TSnF1bTEUbvcXdPbqU62ISg
   ifx+Iby1+ncDnFKdNworG62LXhIEebWSPOklCeYtusRPC7v26m45ukdi4
   H+qn/jsAh1m6UVcZqJ72YP85ZKv1mC4AaXDxTv5PI4SjaQhJ5/DDzv+j5
   Yt/tXJZK+0ZTT06yZX5P6ORwM094t9ixt4/hj6YQRWEJF62gqhR2miTvZ
   FyyXcnoxHIzT0C5QqrUgTquHoMn+zJAZOr84tmG75gy27/h1DoSv3KNAO
   dtP36r5HTt5HteOlS5hA3o01gSVd2fJsbw7DpQMPJxEtwRy6BVnNHm1S1
   Q==;
X-CSE-ConnectionGUID: V0hr4rpxQHqi+FkLqqPpew==
X-CSE-MsgGUID: b8dQqy6OTx+qB0SxIW73XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="75087816"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="75087816"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 00:00:17 -0700
X-CSE-ConnectionGUID: mXXZttHoQ6aXl4vRMdiP+g==
X-CSE-MsgGUID: Tz02Q8lIQdqMIByumWkMyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="222915276"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.120])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 00:00:15 -0700
Date: Thu, 19 Mar 2026 09:00:13 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 1/5] pinctrl: intel: Improve capability support
Message-ID: <abue_c06obKYdRWT@ashevche-desk.local>
References: <20260318151256.2590375-1-andriy.shevchenko@linux.intel.com>
 <20260318151256.2590375-2-andriy.shevchenko@linux.intel.com>
 <20260319055754.GM2275908@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319055754.GM2275908@black.igk.intel.com>
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
	TAGGED_FROM(0.00)[bounces-33796-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: A659A2C7031
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 06:57:54AM +0100, Mika Westerberg wrote:
> On Wed, Mar 18, 2026 at 04:10:15PM +0100, Andy Shevchenko wrote:
> > The register space of a certain capability starts at the offset just after
> > the respective node in the capability list. It means that there are no fixed
> > offsets for them from SoC to SoC generation and they have to be calculated
> > at run-time. Improve capability support by adding the respective calculation
> > algorithm and in the result enable PWM on more platforms that currently may
> > use the wrong register.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko



