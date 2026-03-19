Return-Path: <linux-gpio+bounces-33789-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JUpEWuQu2lmlgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33789-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 06:58:03 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2622C669C
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 06:58:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EE8E830087F8
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 05:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA83039A057;
	Thu, 19 Mar 2026 05:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HnF3d+Uo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DB72F84F;
	Thu, 19 Mar 2026 05:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773899879; cv=none; b=WZ7ITng493905vtvT/qJ7EeElzIQRXtd2UHN+FBJJIh5J6c6wp/YaixGNDfl+i24NsOyugc5DFujB6iMfTRioukwAVN83LoqAheXQiF3jnira4Y0luUpXbKb1PMJDvGW48Q3W1hjpmAjPxggpzgmYmvoSv1TcGN3qffL4Dnryyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773899879; c=relaxed/simple;
	bh=c8exxiQODU5rY2h7OCDCMHJtJVkKh7gTORd+HBnOWco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oha5fVr4WgIZRU/85KhBjGvKJuFdKjqIo6S15AnptS2GEnoPKmzlZoEZT0oonukqm0EHlSyHOhX+f2eJjx8NltZHLFJCFEHqgZEVAdfQ2/so5DeQcWzm6giJd+rPsNoaSvQNVOQazJaWe8HguxggxwRXbNA11UfzSlbN/lcU5Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HnF3d+Uo; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773899878; x=1805435878;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c8exxiQODU5rY2h7OCDCMHJtJVkKh7gTORd+HBnOWco=;
  b=HnF3d+UoyMgmtYl2fnr3EW4qfQJAm6IW9fBGRD9mfODTuwMho3wDkNCx
   igEeRsEdQ9omIKBN/QA5oSfslEFjQKq/3vz6R1LnwHg8pvt4MisKs2jOB
   Pcn8Yjz5ocfCqJyQP5HAgyIIvUWSWeqKpPJs6FT9SaFL/BVlPwNmr2nhi
   umPoxouBcQdoncH+uMPY2Qe9p0NCTbtpKLwmhRuu5TWaYvUD0u0au+4CT
   6dR6Mx6yvN0J/uHdntY7RdbUbMnUnZb11pf1ephY7lNpxlscmYT5S6R5R
   ds9Yb6saR8R7POW5j3+w0YB5jkLa4Bionxr44EpVFhYmttYQL2lUZFd4R
   A==;
X-CSE-ConnectionGUID: 4ikR7vPaT0G5N6KA06jPzg==
X-CSE-MsgGUID: Hltq9fA/QB2cCCNQimuWqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="73980932"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="73980932"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 22:57:57 -0700
X-CSE-ConnectionGUID: 8FPp2MwkSg2zdyJohf7i7Q==
X-CSE-MsgGUID: 0aK1yqShS/+6GqD4VtgAqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="260761074"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 18 Mar 2026 22:57:55 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 7A74195; Thu, 19 Mar 2026 06:57:54 +0100 (CET)
Date: Thu, 19 Mar 2026 06:57:54 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 1/5] pinctrl: intel: Improve capability support
Message-ID: <20260319055754.GM2275908@black.igk.intel.com>
References: <20260318151256.2590375-1-andriy.shevchenko@linux.intel.com>
 <20260318151256.2590375-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260318151256.2590375-2-andriy.shevchenko@linux.intel.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33789-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,black.igk.intel.com:mid]
X-Rspamd-Queue-Id: 9B2622C669C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 04:10:15PM +0100, Andy Shevchenko wrote:
> The register space of a certain capability starts at the offset just after
> the respective node in the capability list. It means that there are no fixed
> offsets for them from SoC to SoC generation and they have to be calculated
> at run-time. Improve capability support by adding the respective calculation
> algorithm and in the result enable PWM on more platforms that currently may
> use the wrong register.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

