Return-Path: <linux-gpio+bounces-36437-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDVTFsyP/WnWfgAAu9opvQ
	(envelope-from <linux-gpio+bounces-36437-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 09:25:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE1F4F2F7D
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 09:24:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBA86302F3AC
	for <lists+linux-gpio@lfdr.de>; Fri,  8 May 2026 07:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FFE52F49FD;
	Fri,  8 May 2026 07:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="baah6Vd0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D52376BCD;
	Fri,  8 May 2026 07:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778224986; cv=none; b=YM1xFaWcdWgRUNA8brJvU2x5c3k8UKD2R/VeTqyxPRG32hgsOH5WofBqIDDIM+C4Wis2ZsmSgxge1XSatuBVdXYPIloTFZg4Jt+ezawZn/lqBT12ZWt2udkQCiBLP1vRbVswAzg9XFDhqdDD6bBZmYJmuVpYzHCAvwc+uCvQip0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778224986; c=relaxed/simple;
	bh=H88G6CL5TWFd7eybjl9i88KQu59+VhkHbQ8Vy9juMf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BPY3qg93Uo0/bZruIBXVwL5BXscYzak2zxiP6EwhSYaLfusIAqoh4WYR7GnuXmuvcff4fzWWJ8FzoMFsPHillg0BU8JmEsg6SjZi7mJ7WVosydSd+MV8c686LtJRpqM6+FPWtw5YqKEhVXH/OBA+7Jmb/g9kv/Nv5vrx5q2MbgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=baah6Vd0; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778224981; x=1809760981;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H88G6CL5TWFd7eybjl9i88KQu59+VhkHbQ8Vy9juMf4=;
  b=baah6Vd0lUtlWoIi6IPQLtHhUNu27t4H98KO2iMGhvVp7kwNAqmgImJk
   Gghdlj+1JWzzPBKb6oEgxnFULYIFHMP95wnL3aClcuK6ySqKhrS/rIv80
   Fi5bN2UYbKiYsc8/FCiOQrdLJ1oolmM3Gh1xuETqcpuAu/lF4VLOrs3Wj
   YlzG/BLYOZx73liCY8/JLKmY00UFMdLSSHrEWd5K4FaXHsYFTW0jIk3ME
   ZGuGJ6/0LFrbl2K1DeobLbK4ez/g+Jd2uRAHTXi4l1g7mLmDTrqqyjBIm
   3dKKnEqxTxycZ0Lqz8vnfwmm5cbu4wpJ70it7tlHgAD09dccymVk/5P0S
   w==;
X-CSE-ConnectionGUID: rqwT8BSCTNORMDNUOH1xig==
X-CSE-MsgGUID: gT8L2u2WRj6UT9ji0jkf5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="78913474"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="78913474"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 00:22:57 -0700
X-CSE-ConnectionGUID: sP8EyzS4Q2CEw4wpMF5N/w==
X-CSE-MsgGUID: GhWzL3kcT0K/Q5NLYveojw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="234034060"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.237])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 00:22:55 -0700
Date: Fri, 8 May 2026 10:22:53 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Marco Scardovi <mscardovi95@gmail.com>
Cc: linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, mathias.nyman@intel.com,
	mika.westerberg@intel.com
Subject: Re: [PATCH v4 0/6] gpio: acpi: modernize resource management using
 cleanup.h
Message-ID: <af2PTWlxzIffkaU2@ashevche-desk.local>
References: <afzlsRkyKQzuUcgL@ashevche-desk.local>
 <20260508061729.9530-1-mscardovi95@gmail.com>
 <af2O4wKm01mSCaxr@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af2O4wKm01mSCaxr@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: ABE1F4F2F7D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36437-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ashevche-desk.local:mid,intel.com:dkim]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 10:21:11AM +0300, Andy Shevchenko wrote:
> On Fri, May 08, 2026 at 08:17:23AM +0200, Marco Scardovi wrote:
> > Hi Andy,
> > as requested I've added the missing Signed-off-by and related commits' messages.
> > Let me know if it's everything alright now.
> 
> Note, cover letter is not just for a simple comment like the above, it's mainly
> for the overview of the series as a whole, what it doing and why. No need to
> resend a series, just try to write down one in a reply to this message.

Also this is v4 of the series, you need to provide a changelog for each delta
between two sequential versions (here we expect to see a v1->v2, v2->v3, and
v3->v4).

-- 
With Best Regards,
Andy Shevchenko



