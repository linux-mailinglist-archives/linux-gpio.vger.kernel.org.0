Return-Path: <linux-gpio+bounces-34238-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCSBEDBGxmmgIAUAu9opvQ
	(envelope-from <linux-gpio+bounces-34238-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 09:56:16 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B38E13415B2
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 09:56:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31F343058BB9
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 08:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 615E03D9042;
	Fri, 27 Mar 2026 08:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EqXwPQc+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B922FF155;
	Fri, 27 Mar 2026 08:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774601425; cv=none; b=iqccpMlC2bbxjLIOcDPIjdfwBnVw50V5y5U1h50qzSalEG+xCGh9DFue57XNZUwkReZpHYq3WjhqV1mRvjQHLdxYTZIEakvaHN15u75dH+K/821vK1kUdCvCElOqmArFOkhW3V7UMQ1qqXiHG1k5R3piIEXxfmxZ/e/0gPFN8eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774601425; c=relaxed/simple;
	bh=ubhXL/DZLRZgGehOUNb+FHOrN62tfn1Y+9JsvhwjtdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O9oKYvrOpiRvgcwTN9YuBdNwKLBPiydt1hu8lq1PPVj4Mg0nR6HICtJPHiUngzaptx2c7HxLpu6HRoRE3ei3z9QtA16bSCffwYk+CHpP/LG4+lspc0MEoXBVeB3TPRhcrFQypAgsIuIgpAV58QKZR/lDpfEbcwAusM7qocdeHXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EqXwPQc+; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774601423; x=1806137423;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ubhXL/DZLRZgGehOUNb+FHOrN62tfn1Y+9JsvhwjtdA=;
  b=EqXwPQc+CAo+svfiqjWjgd9GEjLi/RD5DwikOZoD2jGqwC7NI4mMGB37
   1MD48asXv9619cAw3335OLGFZzY7VfXl8/IjW3LCuYpoEUsUpnaKjHxLY
   TtjEx6a2wBINvpdboMN8gevQlw804Vu6Cz5TRKnD52TGLT/WwCxYeXIA3
   MdEgfRilduWImvqzeuxsoSQNaPbIm10DF+4nVmWpYvtKQAFs0xL1Ojob9
   xdWhmpVYc5z/QnbsnTXgPMqmUs/7EsbwyiN5hzz4/HZOK70XGI3kmmpD3
   Z4sqlVHH8uEphlaj2l1jqvEKVPXjQ2vqOd5MzYogkSEfCZom9QHOfqrkp
   Q==;
X-CSE-ConnectionGUID: 7X3VCzinQCqVg188G0Xofg==
X-CSE-MsgGUID: vBXvfrYvQJ2NAWaFhD4M1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="74702277"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="74702277"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 01:50:23 -0700
X-CSE-ConnectionGUID: WkzsKBjcSz+cKNnL33j/5w==
X-CSE-MsgGUID: wsOLfilIRpS1DOrkB/vIpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="225179524"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.127])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 01:50:14 -0700
Date: Fri, 27 Mar 2026 10:50:11 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: intel: use FAM for communities
Message-ID: <acZEw7NNKuXfX6gP@ashevche-desk.local>
References: <20260326023627.54349-1-rosenp@gmail.com>
 <acUMB5OUGCpy73eW@ashevche-desk.local>
 <acUNP7ZG87rV-LJL@ashevche-desk.local>
 <CAKxU2N_PViOW_Frpm5AA=9gib0Gjs20RGA+0QXJc5hf8Xtp=NQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKxU2N_PViOW_Frpm5AA=9gib0Gjs20RGA+0QXJc5hf8Xtp=NQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-34238-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: B38E13415B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 12:22:20PM -0700, Rosen Penev wrote:
> On Thu, Mar 26, 2026 at 3:41 AM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Thu, Mar 26, 2026 at 12:35:57PM +0200, Andy Shevchenko wrote:
> > > On Wed, Mar 25, 2026 at 07:36:27PM -0700, Rosen Penev wrote:

...

> > > What I would like to see is rater special devm_kmalloc_and_dup()-like API
> > > instead of doing this in every driver out of dozens of drivers.
> I defer to the hardening people for that. My suggestion was to
> introduce a kmemdup_flex macro that does kzalloc_flex + memcpy on the
> FAM.

Thanks, please come back with a better approach like kmemdup_flex().

> > You may start with providing a common API for all Intel pin control drivers.
> >
> > Patch series of:
> > - add a new API and new member
> > - convert driver-by-driver in separate changes.
> >
> > Actually why can't it be done like this from the start?

-- 
With Best Regards,
Andy Shevchenko



