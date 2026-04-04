Return-Path: <linux-gpio+bounces-34670-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0B7JC0lq0WnXJAcAu9opvQ
	(envelope-from <linux-gpio+bounces-34670-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 04 Apr 2026 21:45:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8249139C4C1
	for <lists+linux-gpio@lfdr.de>; Sat, 04 Apr 2026 21:45:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75C7F300AB31
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Apr 2026 19:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F22E342CB6;
	Sat,  4 Apr 2026 19:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aMNsD8j4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A6C314B9D
	for <linux-gpio@vger.kernel.org>; Sat,  4 Apr 2026 19:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775331905; cv=none; b=ZtBbSfpNaMXLeTLzhU3WAlQmtM+6+tkgExCGio29oCG9GyXLUAHkPr5zayURK0sU8zVsSTJjzvrEoI246ahSEtuHLoTp63rc9+qYXnAGPMwSNT0Bjn5xsaN+nySOOGanx947wHax43+QzKwkUzsc3N13Hh5zaJPeSqdV+dDMJUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775331905; c=relaxed/simple;
	bh=s3iy3aWNHRSg6ILMqYfy4PRrP1W4GiKeUli3rDYroX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hhXGmU5Qao41huL/iAxVwJAM9C1Wr2KSYuCBKSjja4Bb2k/M/hzpyaHilrpnAXE2vK544EC0ltA0EizlJhWtB3g2bqSJeofYutafLLF2/gunf0xt6QilGEfcy6zLx7ZymvVYjErq7cRFDYBveyI5pZywWeUJeNAUsYBoMxhqXLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aMNsD8j4; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775331904; x=1806867904;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s3iy3aWNHRSg6ILMqYfy4PRrP1W4GiKeUli3rDYroX4=;
  b=aMNsD8j48y+3rbjXq84bHB66JYlXyNCuw6sFLVR+3TOwefyaxnjjeY0O
   yr/ET1wdhXYXoxvBm6Klj2hlnkFnnVeSWRNyXLNy8fNRWG2B5xEa1cH67
   IHpmkJkCkHRCqEiOzoiYjs2DlNsN6XWcOi8CMaB6FkwvImCk/Y6PUPteE
   Wb/yZi979Goz/ZHlCQsMwa9halagsFjW7EMy9CDfRVF0DFAW6URZt24Ql
   x9blx6hMxSvcRhuFHRpA5exnJpOTqAMPNXQK9iBb5/HY2LCZSFMdP5p5i
   zoBcWS/uOtO8inCZF60/KM+Osrs9QcXE0+miIeppxMJfbOwyjI4hYKvi9
   w==;
X-CSE-ConnectionGUID: dnMkLs8pTVS3jWjueJA3Sw==
X-CSE-MsgGUID: 3Ao1vSQSSD+vhUEaXkkSyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11749"; a="101805555"
X-IronPort-AV: E=Sophos;i="6.23,160,1770624000"; 
   d="scan'208";a="101805555"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2026 12:45:04 -0700
X-CSE-ConnectionGUID: Oe0RFAYeRGKM+02N6YDQMg==
X-CSE-MsgGUID: 6tEH9I8GR7Cy9k119m4H0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,160,1770624000"; 
   d="scan'208";a="226685822"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.247])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2026 12:45:02 -0700
Date: Sat, 4 Apr 2026 22:44:59 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-gpio@vger.kernel.org, linusw@kernel.org,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Subject: Re: [PATCH v2] gpio: Add Intel Nova Lake ACPI GPIO events driver
Message-ID: <adFqO94IE-jUk-i4@ashevche-desk.local>
References: <20260401174526.60881-1-alan.borzeszkowski@linux.intel.com>
 <20260402094518.GT3552@black.igk.intel.com>
 <CAMRc=MekQqNXM1MRfFOgF-3Vp_TX46soqLvKGfXZ=1P0XyFJPA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MekQqNXM1MRfFOgF-3Vp_TX46soqLvKGfXZ=1P0XyFJPA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34670-lists,linux-gpio=lfdr.de];
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
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ashevche-desk.local:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 8249139C4C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 05:30:56AM -0700, Bartosz Golaszewski wrote:
> On Thu, 2 Apr 2026 11:45:18 +0200, Mika Westerberg
> <mika.westerberg@linux.intel.com> said:
> > On Wed, Apr 01, 2026 at 07:45:26PM +0200, Alan Borzeszkowski wrote:
> >> This driver provides support for new way of handling platform events,
> >> through the use of GPIO-signaled ACPI events. This mechanism is used on
> >> Intel client platforms released in 2026 and later, starting with Intel
> >> Nova Lake.
> >>
> >> Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
> >
> > Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> Should I queue it for v7.1 or will Andy pick it up?

It's unrelated to real GPIO HW drivers I handle. So, please take it.

-- 
With Best Regards,
Andy Shevchenko



