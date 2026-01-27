Return-Path: <linux-gpio+bounces-31146-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJ0dCpeQeGmirAEAu9opvQ
	(envelope-from <linux-gpio+bounces-31146-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 11:16:55 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D3A929AC
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 11:16:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA7943015727
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B022F39A7;
	Tue, 27 Jan 2026 10:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KaGzwO4q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E6C2F361F
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 10:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769508744; cv=none; b=GMdlkgiIVw0GiwZ2T7MJRBraVzfSJn1u8FWem1MZ6dikr22j/EgDfo2UTn4NsSPAfXflPCK+VLuYObxhXiJAtEuTlWSCUxYONbUztwxKiKOBYAF9OS/y4ey7GK1d2CkGc9tQvp0vTUKOsrAioOwREydA5PKnd/3kOulbxaaW93E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769508744; c=relaxed/simple;
	bh=KWIUJCZiC4IID2T/kbuoBltgs9FJy4f4V5b6xvbuVtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JfmL/u2WtNsPxHqU2K5GAwoMOjJAeIUuyyn9aWflnHKawSRbb2POuYOcEMRAr4oIT5zLNGmD9vGQDayjeC7IVhh62qvXhNjftL6UBlXds6xYjrLIyajcKyYwSMup/vsSF7o0T1hTeACTNBFa5Ia6nWbR/sdaiuFgyX265vLquMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KaGzwO4q; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769508743; x=1801044743;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=KWIUJCZiC4IID2T/kbuoBltgs9FJy4f4V5b6xvbuVtA=;
  b=KaGzwO4qs5ahGI8IL6mJbKela0TUgqpViTCJkNGowNlA0/q99VB42fo1
   JO/yVcTZz8SOiADENeWamWcrLI5prLLpe/qGDQN+5lTslJiw+axJ3ESXr
   7iI7Dla3Fy9Ks1cdViZ29eU40fQv6+zO+NyblSa8BzNb9b6HzA50Mb4tI
   4oD4sCy2cojIACk9LrvbkDEWHrHdbAgnU/+9pf92AlQ4zbbVlCqh0qoBw
   6+QJqkjgWhXmfBr4F4WJbgbZ3B6D8ZVW4Y4NcClZiYlpDg1gTzlaocJO9
   2PXln8kE7sdMRgDYmBPuhdjdXH73nyXPRGFupnvZFEuaV0wOUcTnGUsgv
   g==;
X-CSE-ConnectionGUID: 7lBzHTLvRBG2x7wjxCsTpg==
X-CSE-MsgGUID: DicBEYVmTrOfi2UIBlx7dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81333583"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="81333583"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 02:12:22 -0800
X-CSE-ConnectionGUID: StdxrrwETAKdDS6LgusuNg==
X-CSE-MsgGUID: ovuUjwG1RKCcpnylAg4jKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="212915643"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.248])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 02:12:21 -0800
Date: Tue, 27 Jan 2026 12:12:18 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Linux pin control <linux-gpio@vger.kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [GIT PULL] intel-pinctrl for 6.20-1
Message-ID: <aXiPgsr9_FmFV9gJ@smile.fi.intel.com>
References: <aXeCgo5w1YOHUKiK@black.igk.intel.com>
 <aXh-Ngz97DG4KneT@smile.fi.intel.com>
 <CAD++jLmdQnKM39JOXPo6iQ8X=T5zDoAHS8wBrfj9e83dinCKhA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLmdQnKM39JOXPo6iQ8X=T5zDoAHS8wBrfj9e83dinCKhA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31146-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smile.fi.intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 86D3A929AC
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 10:55:13AM +0100, Linus Walleij wrote:
> On Tue, Jan 27, 2026 at 9:58 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Jan 26, 2026 at 04:04:34PM +0100, Andy Shevchenko wrote:
> > > Hi Linux pin control  maintainers,
> > >
> > > A small but important update to Intel pin control drivers. The main thing is
> > > documentation fix by Raag to make users less confused about list of supported
> > > HW. Everything was floating in Linux Next for at least a few days.
> >
> > This went to a wrong Linus' address. I will send a new PR (within a couple of days)
> > as we got more patches there.
> 
> I actually see it because I'm using some clever lei and korgalore hacks to
> read lists now.
> 
> Send more pull requests if needed! :)

Sure, this tag is immutable, any new PR will be based on this.

-- 
With Best Regards,
Andy Shevchenko



