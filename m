Return-Path: <linux-gpio+bounces-31107-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPztC0B+eGkFqQEAu9opvQ
	(envelope-from <linux-gpio+bounces-31107-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 09:58:40 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F309915F8
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 09:58:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E8A6E3002D1D
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 08:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1DC32B99F;
	Tue, 27 Jan 2026 08:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VNXsgE/P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63624221FCF
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 08:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769504315; cv=none; b=nXQCIvZplUphYEPQfPiI8oItn6me9vAqQWwC2q4phj6GgxF9ixGiCikq5thhgI+dcKMpYfokS8gXB/X3EuKknKRsN3yITnKU1GptbGaB5XO0qgX/7i23uXs/xDET9Bo2bGGoeYKjzz3Y7AyXy2LU3ziH7XqZy0MpuhY/2ltRg2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769504315; c=relaxed/simple;
	bh=Uo4R2z4XTl0OK8Jdytxjfvxk4CZHIpoo/8s0RobGIbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CS1MQ6nBexsiD+JMeSkL7rdOKbcsK2HZd0el7hvJnPqOBjsi72ukEz79n9+KV5Qf34yAa1etc23HUE0DKrDEee46F1z0BC4ia6NGlEjjd9zC+TmWxty7ljpPlqHpn+OLeZvR0s1A0Hc84VLVNCNV4Rpg4PFCekfPEmNj/zvTvVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VNXsgE/P; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769504314; x=1801040314;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Uo4R2z4XTl0OK8Jdytxjfvxk4CZHIpoo/8s0RobGIbo=;
  b=VNXsgE/PEwGIrZYD79lZ0Sr/pHVhgfmFkPq+T6QLRI/+VPYoKqY4IR3/
   xvX/b+fKGomvZGvCjCasj5QOv7inWWAmqqOGciJlecyyXERwum5YzZzot
   r6RRRorqlDObgaslo1eefsLiQvoZDT0gD0yiLNroyHku2xE6Ki1h4150G
   DVOy8nS2LixHnXAOCCl2DlHjbs77ZsTU4stnEaHmhpKGoy3vIpKA7y3cW
   xV3gaQhH7L1fo3ZGhKqJcX2ffCuw1YFTMh+bO59Eg5+5NV0NIb5e9xD0y
   JfheHsYNmL1gJhEcQx+QkFAk18N+EEoQswWNw7QNVOxf/wZkFkJPlD5a0
   w==;
X-CSE-ConnectionGUID: iGpOVUH5RzSdrlMBCnjSbQ==
X-CSE-MsgGUID: zgaoribzQias2DXFrEFlXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="73279452"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="73279452"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 00:58:33 -0800
X-CSE-ConnectionGUID: T4oAxrXqSRebaEFq+tZCXA==
X-CSE-MsgGUID: G0H4QTbdTE6zxH0JHGA63Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="208354864"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.248])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 00:58:32 -0800
Date: Tue, 27 Jan 2026 10:58:30 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linux pin control <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [GIT PULL] intel-pinctrl for 6.20-1
Message-ID: <aXh-Ngz97DG4KneT@smile.fi.intel.com>
References: <aXeCgo5w1YOHUKiK@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXeCgo5w1YOHUKiK@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31107-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: 5F309915F8
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 04:04:34PM +0100, Andy Shevchenko wrote:
> Hi Linux pin control  maintainers,
> 
> A small but important update to Intel pin control drivers. The main thing is
> documentation fix by Raag to make users less confused about list of supported
> HW. Everything was floating in Linux Next for at least a few days.

This went to a wrong Linus' address. I will send a new PR (within a couple of days)
as we got more patches there.

-- 
With Best Regards,
Andy Shevchenko



