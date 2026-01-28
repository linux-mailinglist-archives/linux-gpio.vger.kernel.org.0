Return-Path: <linux-gpio+bounces-31236-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6B9ZIUMNemlo2AEAu9opvQ
	(envelope-from <linux-gpio+bounces-31236-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 14:21:07 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEFBA20AA
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 14:21:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 582A83011F1A
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 13:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C132352C3C;
	Wed, 28 Jan 2026 13:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LGCMtkLk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417A322541C;
	Wed, 28 Jan 2026 13:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769606384; cv=none; b=X9xRNOfSsZhYldmweA59WYNHKgfb7HAVTyxt3qsSdC4lyLsNnoG7fyMz4HiSQTgAn7KN9AxtV+z+AO1ymdi1PxAdk1QsbQJvlCIfbiDPzldL6xCoie+qpK66BBy3mqsnz4SGLdj7maGMK8Ll2UeceOkw57O0EppuzC4ssSUWQYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769606384; c=relaxed/simple;
	bh=OJHnu6ZZktiXtybkajhMnWpx9V6dzZCZjR2mKhpwoJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fdcitC3/O4YlRZ0l1u79dMOwzSX+DVsAYAFe/rryhWuxRxgEoygrd4SjXWZB0tQXGTsi6CpCCKDxHUTyqt3ulk2pcG9smWivGrbMXOmsLjveTWtk/mPYTdGiXNNWsvNg6kjW7+EnCiUwZ2zsO+hB/LR/ombbHCLN0BdS6/5BIwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LGCMtkLk; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769606383; x=1801142383;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OJHnu6ZZktiXtybkajhMnWpx9V6dzZCZjR2mKhpwoJs=;
  b=LGCMtkLkExggb/L2cgEMrI8VCKbbWt8GfeBrFvqSNYVBd5TOc3FpyBSI
   2ZNxHHjjpWw/IfV2WimfR9XYz/vCoJp1VaQyu1K5evMKyHeiF6xEAzrav
   SNqiYG5TCgA7OBQxS0+ebk16wL81cQH+GM/CzmxRbt/NN2OATgOVRvvdr
   BsuOHFGvYtnQ4rd63SINqiAme1GJGBOJIDJcq779Vmo86iFHsglMKBwKA
   Sark+0k5wfv6Q/OV092f88wBqK5prN/4d0t5oFIOoTujRf4n5K4GImk4I
   SxkPCfPdLnUbbPHHEzpxk5mY7TBG32OG7BSaWHWiYnP7f72IDjdGGK/7d
   Q==;
X-CSE-ConnectionGUID: OTD232tcQraOnV0a2hi/Og==
X-CSE-MsgGUID: k0Pb2j83RIaY6QA69XjLHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70873738"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="70873738"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 05:19:42 -0800
X-CSE-ConnectionGUID: R08Cali5QbeiOCEBc8C1Hg==
X-CSE-MsgGUID: G1IVUbULQz6XE0G+jMYOhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="207506269"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 28 Jan 2026 05:19:41 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 5A82098; Wed, 28 Jan 2026 14:19:40 +0100 (CET)
Date: Wed, 28 Jan 2026 14:19:40 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 1/1] pinctrl: baytrail: Remove duplicate error messages
Message-ID: <20260128131940.GP2275908@black.igk.intel.com>
References: <20260128125128.44508-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260128125128.44508-1-andriy.shevchenko@linux.intel.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-31236-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,black.igk.intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EDEFBA20AA
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 01:51:28PM +0100, Andy Shevchenko wrote:
> The pin control core is covered to report any error via message.
> Since that it's not needed in the callers.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

