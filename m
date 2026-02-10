Return-Path: <linux-gpio+bounces-31549-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKWoMWsEi2kMPQAAu9opvQ
	(envelope-from <linux-gpio+bounces-31549-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 11:11:55 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 738971197B9
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 11:11:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E79C306EF23
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 10:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 844FD346E4A;
	Tue, 10 Feb 2026 10:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UxGyz3iJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683122ECE9B;
	Tue, 10 Feb 2026 10:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770717990; cv=none; b=fmEiCCnpdnv1UDglam2nsNi94xoUT8b5yC1CUEEoTxbnJt7ycKGbpmBPoLUxW1q08y7/Bq2qquLLg6SgANFp9JqxmGmfXuNSQnrfqAPBA2FQYHv199nyYYA6HDEpbVk6qw8wDk3HLUzKQX7rkWMtvswNkY9S6agiIzN/u1prspg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770717990; c=relaxed/simple;
	bh=/bTmQM2IbaG4yBpW9mOQ8aMqXe7doEFJMG4YiD7b+tY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fyZG++VP6AFrSPFsUb+WxNb5pbp0/V9MK6BmMCytXpih9wAZkC6sr4h3O44iFp0me7sdoGxLLUCPhGM4Q5wo6S4g9FdgyZ94dsc1S8+a5NxEyWIte/eBl5Rz8ydEM984k4oex7zIt5qj0BwAdo7qOwSN0fOyDHc68zb/XYJT1ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UxGyz3iJ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770717990; x=1802253990;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/bTmQM2IbaG4yBpW9mOQ8aMqXe7doEFJMG4YiD7b+tY=;
  b=UxGyz3iJp8cvXLk5GmjT9mIMxSxJcAkrmaN+Be/g2e/63YI/DeOsy+Qc
   pciC4z8B0iJ3N9mjS9e/4HRQW86E9Cy3iyVUBKYyrxdbTMiovwC6kRSa8
   YelxcCXl8PpT9NWl7qhXIe+snI8rudKE457bm0g0Etrd80hD6AsIQM0uY
   t0lJjJc5A8jhVssEG9hV3TFPVc2+iKfGXuAyo1SzoTFd8VDwmDeQouR3k
   Z2OdZqDBn2N+T8vcSikdZUX+Krut2kaO/B2EtciKICXA2fMFkO99umJWD
   bYK5j63Ci4KZ9sA7orTLp8/fKbd+jHLpqT1YLYRIZMsq3kdNfFfEaCKuO
   w==;
X-CSE-ConnectionGUID: s0YTub0aRmSWRFwabgqcSg==
X-CSE-MsgGUID: TXtETVSPRcy0z3FKwLRiHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71741062"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71741062"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 02:06:28 -0800
X-CSE-ConnectionGUID: OFUGUk5aSVWjpcyEr77N1g==
X-CSE-MsgGUID: 19xDLYcqQR+cwZ0cAzI+0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="249516733"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.39])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 02:06:23 -0800
Date: Tue, 10 Feb 2026 12:06:21 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] gpio: swnode: restore the swnode-name-against-chip-label
 matching
Message-ID: <aYsDHUTsX4o76OQa@smile.fi.intel.com>
References: <20260210094806.38146-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210094806.38146-1-bartosz.golaszewski@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,gmail.com,linux.intel.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31549-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smile.fi.intel.com:mid]
X-Rspamd-Queue-Id: 738971197B9
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 10:48:06AM +0100, Bartosz Golaszewski wrote:
> Using the remote firmware node for software node lookup is the right
> thing to do. The GPIO controller we want to resolve should have the
> software node we scooped out of the reference attached to it. However,
> there are existing users who abuse the software node API by creating
> dummy swnodes whose name is set to the expected label string of the GPIO
> controller whose pins they want to control and use them in their local
> swnode references as GPIO properties.
> 
> This used to work when we compared the software node's name to the
> chip's label. When we switched to using a real fwnode lookup, these
> users broke down because the firmware nodes in question were never
> attached to the controllers they were looking for.
> 
> Restore the label matching as a fallback to fix the broken users but add
> a big FIXME urging for a better solution.
> 
> Link: https://lore.kernel.org/all/aYmV5Axyfo76D19T@smile.fi.intel.com/

Should be

Link: https://lore.kernel.org/all/aYkdKfP5fg6iywgr@jekhomev/

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



