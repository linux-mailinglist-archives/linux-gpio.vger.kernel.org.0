Return-Path: <linux-gpio+bounces-33791-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBRJAwWRu2lmlgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33791-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 07:00:37 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 801E82C672B
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 07:00:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 499A6303EFB5
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 05:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3760A39A7F0;
	Thu, 19 Mar 2026 05:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kgs+nFKk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E450E1E0DD8;
	Thu, 19 Mar 2026 05:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773899921; cv=none; b=VEADba8j7DMIN/0P2KflNvWLWgKboPPIYNMddIaQ0raF6PGENy0EaPH82eHUQ73kWrd9yQzYMnq0FPEaJG3X3s+d/QmGw56rgKeaMsWoXScrNjRXOsdlSwIePSastSSpyDF0ypSPB4m4QI23qK4nj3OwhPS4yNqGbZI5Fy7NNZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773899921; c=relaxed/simple;
	bh=6k0XZcNwTBFov1hF3L4O2bs2PC49XzOgWSAPrDhDhDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Chg1l4oAT2RLjJCRWTgDhQGdKXZv4QwZhSFUnihc8P+JgoVlNxatZxq3n0oTj/VKs/u2ahBiDhcbOZMbvITvpFe6hojNr2NVJMIE3ZQpGGiodTsXkvtcB97J2dwWwCPfzKTHiMZcIcTc9W8hoLnRGF8JoI5PfMOOQvFNm3sMjT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kgs+nFKk; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773899920; x=1805435920;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6k0XZcNwTBFov1hF3L4O2bs2PC49XzOgWSAPrDhDhDQ=;
  b=kgs+nFKkzsvNcFx+6xnf5eww49zhw0hcH/HSPq3WeuH7yJxzZvdYHEmV
   hrEnUvO3n9vsV9Stw9RR73gnua79h563lfhq7HFxcxozlfidwKLR8BnPT
   z1E2YUpsuOnyxN69V9S7UkYT9BI6HU7y8wvlEpIlHcGXJAnZgKRtIybig
   agj0rA32QmhZ4uP1NOuJLP+8H0ELfwsfnijIxIOYSefVpHR9umc+0MT7M
   eg33KbGvRmZ0f4kd2zo6luP0Gv70yXHrfYp62RVr855KedkyWPcdQ5PEF
   fWL/cZI9C8uGqAfkcRzMGHKL4hyCntKmXKuaxoGLjsOF/Jt+7P/X/+w99
   w==;
X-CSE-ConnectionGUID: nNVnV6nISW2NbNK2aDtZ6w==
X-CSE-MsgGUID: O8kV92+dQYyRevaJ4iaK/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="77573328"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="77573328"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 22:58:39 -0700
X-CSE-ConnectionGUID: CgLFNh6fRwKU/GwiLaEvRw==
X-CSE-MsgGUID: 9zNAF1DmQhyTHElOS73clA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="218804602"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 18 Mar 2026 22:58:38 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 426F995; Thu, 19 Mar 2026 06:58:37 +0100 (CET)
Date: Thu, 19 Mar 2026 06:58:37 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 3/5] pinctrl: intel: Enable 3-bit PAD_OWN feature
Message-ID: <20260319055837.GO2275908@black.igk.intel.com>
References: <20260318151256.2590375-1-andriy.shevchenko@linux.intel.com>
 <20260318151256.2590375-4-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260318151256.2590375-4-andriy.shevchenko@linux.intel.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33791-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,black.igk.intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 801E82C672B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 04:10:17PM +0100, Andy Shevchenko wrote:
> Starting from revision 1.1 of the Chassis specification the PAD_OWN
> is represented by 3 bits instead of 2 bits in the previous revisions.
> Update the driver to support this feature.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

