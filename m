Return-Path: <linux-gpio+bounces-32912-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBXJBCv8r2mmdwIAu9opvQ
	(envelope-from <linux-gpio+bounces-32912-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 12:10:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B01824A063
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 12:10:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 067423038D1E
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 11:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC3138236A;
	Tue, 10 Mar 2026 11:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iVHLfLle"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204B537E2E3;
	Tue, 10 Mar 2026 11:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773140675; cv=none; b=PfsvcGWiQy11rXkKMKik0ylHCaN2D1ekiusCoc92+ln+MdtGp6WZ4hE/Ykj7YN9GvHpsV3IajyikQwLYzIJfOZ8hNL3NTlS6HkvihkaPTDLGBTnTxf+KYKBNpKDWlMAicxkC+u7CxDvcnAU2T4jTEe+q+YhWM2uhlrj8vq8v1qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773140675; c=relaxed/simple;
	bh=P1gure9BkpN1turlVCP6etour16l+lF1rdvzOn0ZEcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sXqgmezWFwzSuo7L11kB9i1zdebjyfLfNuiRlGkzqGkkaql7FgtFRzbUg8oblsW9jpXhOWx0QbQtefw31Rqp1zIIOzN/BII1pyBSoQWnJAaGq/uEJ5R47rYMytTbngPYpqreEPkySaW/up8khM5Oyf38vIrotsmtzDEwxbBrCYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iVHLfLle; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773140674; x=1804676674;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=P1gure9BkpN1turlVCP6etour16l+lF1rdvzOn0ZEcw=;
  b=iVHLfLle+7ciiRO3xf90e0VWk9yp/4pqGnmr3ljNBmhYOveA8GYRNWMv
   MDbkfP0VxJGLzknZ6zqOjzv8D78QzUMA/ZPsNrzmRy2nIPVmW1ft6Kglj
   dMz3IvlHf3y1N9vnPYXcQESJfa9FVqnOXGhC8pkC91TkcSawpYnD5KWfq
   CsWDse1qdBf/JU3THbJx3s6nGT45X5BpJqwUNI4LNooeEMAxSKFoV5euH
   kN97am65S166cx4MW65pmPrT24Se/gMTfkQtFxhm8nwklur4ZYuKk9+nr
   MLt2jvBK5xgeWjzmBE+vjs1/CeS5FonL6+Q/clvELpxBik76vsiSZmkt8
   w==;
X-CSE-ConnectionGUID: 6/ul8q17RyyimkvQtc1p+g==
X-CSE-MsgGUID: BN2xhl8DSZaanswrd7oxbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="76791565"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="76791565"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 04:04:33 -0700
X-CSE-ConnectionGUID: uLTMAQllTYaDuKWo7otl7Q==
X-CSE-MsgGUID: eEuMUxpyRFWa/vjbFbx1IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="216871678"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.54])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 04:04:32 -0700
Date: Tue, 10 Mar 2026 13:04:29 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH v1 1/1] pinctrl: cy8c95x0: Avoid returning positive
 values to user space
Message-ID: <aa_6vcd6si4BlGUc@ashevche-desk.local>
References: <20260227164335.2044035-1-andriy.shevchenko@linux.intel.com>
 <CAD++jLkcY1PWPwaHZJ88UnLuCUS0EBnDjPpDe_EH-tFqAwmmVA@mail.gmail.com>
 <CAD++jLk_hDYR8kMDFGL8Lnw7YUskf6R3ovGf-PEorZUjmQ-aoA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLk_hDYR8kMDFGL8Lnw7YUskf6R3ovGf-PEorZUjmQ-aoA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 4B01824A063
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32912-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,intel.com:dkim,intel.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 11:55:37AM +0100, Linus Walleij wrote:
> On Tue, Mar 10, 2026 at 11:54 AM Linus Walleij <linusw@kernel.org> wrote:
> > On Fri, Feb 27, 2026 at 5:43 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> >
> > > When probe fails due to unclear interrupt status register, it returns
> > > a positive number instead of the proper error code. Fix this accordingly.
> > >
> > > Fixes: e6cbbe42944d ("pinctrl: Add Cypress cy8c95x0 support")
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > Closes: https://lore.kernel.org/r/202602271847.vVWkqLBD-lkp@intel.com/
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >
> > Patch applied for fixes!
> 
> Or no, for next actually, it doesn't apply to fixes... noticed
> after applying to next.

Thanks!

Yes, I replied to it with explanation that for backporting the patch should be
modified.

-- 
With Best Regards,
Andy Shevchenko



