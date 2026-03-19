Return-Path: <linux-gpio+bounces-33797-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DeUC5qfu2kLmAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33797-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 08:02:50 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 575F32C70CE
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 08:02:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 17B8D3038B92
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 07:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9E9A39BFE0;
	Thu, 19 Mar 2026 07:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PbOPPbdb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89751274FD0;
	Thu, 19 Mar 2026 07:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773903637; cv=none; b=r6IjjQF/Kej6GFJJYle7vFJVdFMXlBUmqEYXPrKWOM1VDuaD7ITPFl0ds78Z2CLsJJDuiWomzBad8fkjXZHLqtKexwUvfivoYCT/uFmL/F9El9RHoJ9gyjZxieXbeSQzv1Irfb81kFOFUzDyM5OjJOh6BwRpf9ECyDcdKvgPmig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773903637; c=relaxed/simple;
	bh=9mPxJACxP0SSZIuW29ozCfuCphXP7FSMcNULuEEXW6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AWbfnhDw0UDmrswF2YxtSv+ylwBpB1f3VSkVsXCE5RIdrXISVkaR0WpUKZnQP2zgYBsMyWzjSU2WxNfr1mfDpDTjnFmVVBfhBhooTG3W6TCtjggIDR7SMatD/QLatZvCKEDCo0Voiaf3px94nTHktQutMG9AjQuWUFkj18Pj4lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PbOPPbdb; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773903636; x=1805439636;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9mPxJACxP0SSZIuW29ozCfuCphXP7FSMcNULuEEXW6U=;
  b=PbOPPbdbCca5jdH7MiMtfWSMDaPEI7taL0V+aCuyH4HifhW7oVxDg0NH
   jw4gKFkmzdY/spnkO1hQRnbQ2CWC81uNsQrQAwm5PNb23aTfOPmNUAdoc
   LaPGkdfl7KGihdv1vGQ8/xxLWdIrma4M2UzuuY3FroVFpcNUO2bVZCqs1
   E6L0EhlCCH9jm6rzz30DMrtfaaUXk7flEd8z36a/rccEjF9ggn46lM5zo
   Xrx2TocAT1Bo0Qe2MdFBS0aufEwicXGtSwhywdx48dtqgI5E+hxoqW8lO
   swqZWX9OfLwT6VcLO3UDpZ958RJuCJaIZcXLnoLea6fhACjwRhxe4I8y1
   Q==;
X-CSE-ConnectionGUID: pbPacSDuQnulz+LikUH8PA==
X-CSE-MsgGUID: vdbpIiA7R5yh/nX9dFzQrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="92541201"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="92541201"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 00:00:36 -0700
X-CSE-ConnectionGUID: 2YAZzmXYSc2v2jx6dWKjQQ==
X-CSE-MsgGUID: OzrP8mcaT1mLchoCR1SXKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="216959583"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.120])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 00:00:34 -0700
Date: Thu, 19 Mar 2026 09:00:32 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 2/5] pinctrl: intel: Fix the revision for new features
 (1kOhm PD, HW debouncer)
Message-ID: <abufEMBGSbhDlaq1@ashevche-desk.local>
References: <20260318151256.2590375-1-andriy.shevchenko@linux.intel.com>
 <20260318151256.2590375-3-andriy.shevchenko@linux.intel.com>
 <20260319055812.GN2275908@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319055812.GN2275908@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33797-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: 575F32C70CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 06:58:12AM +0100, Mika Westerberg wrote:
> On Wed, Mar 18, 2026 at 04:10:16PM +0100, Andy Shevchenko wrote:
> > The 1kOhm pull down and hardware debouncer are features of the revision 0.92
> > of the Chassis specification. Fix that in the code accordingly.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko



