Return-Path: <linux-gpio+bounces-32375-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOCGMmtdpWlc+QUAu9opvQ
	(envelope-from <linux-gpio+bounces-32375-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 10:50:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 650711D5C2C
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 10:50:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D9CF7300D9C3
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2026 09:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A5A038758F;
	Mon,  2 Mar 2026 09:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O57/e7mm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFD0A932;
	Mon,  2 Mar 2026 09:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772445028; cv=none; b=rU5NJhfRSMFDZZknpB8qD3bxar2jFd/n/usS95lq6AgASDd9O/Bb66f2hFEmsB1diSVK4bor2H0oQ507iHIrvm3kVBT/gdT6UsTVoPkCGgkLdBf2BMP3Iy7KQe++MoDRjJ0QQAmudqWnd0z/cMFO56QrUfLIDfBYSldVtENNKEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772445028; c=relaxed/simple;
	bh=A51oL94zOa/8urM7JjRf73n4/68p4/nUSOPfUKDAYSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OBuirN5vrFTkTarQ8CymuWD3l1jp2wwH8Y5VGcw3uz5L0jfacDOK4xOP3xB2aWrV497r7N4rHTTcDD3p0j4bbrgs2W5sTrw3c6ZMwVUUBZ5FQgdTBEzF/VEjpZfi7rpUndCZXoSxEANY71o4hQiY64CIZXilG03Pok/155sLMp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O57/e7mm; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772445027; x=1803981027;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A51oL94zOa/8urM7JjRf73n4/68p4/nUSOPfUKDAYSk=;
  b=O57/e7mmDqZ0hwMH+oVriJR3nIgZssa9/u2eBFCiYMWD0QYuHbNzczJL
   PXqCYSLAD8Bny+gzDCNe1bpgIl3VvNZXG0q8FHWNsfS3DDAGqI1kJgei8
   X3I6ZPZxQLi7u3Qyc5HXhUtPxzYfeL3gI+FWJ/9HA0+UrcVOaFGRtSnfq
   YNT/yEmJErAwwZ+KLQQeAdnUAwpDTEkVFn1UlJ+ySbPi/oq0IiKsMEGbS
   k9TpLXqth1PIk73rRxIUDfj9nikZAUeYg657+o7Oa8zFqD2+MeMUKLyuw
   PMM2oSAz0+qSl4gWFox+GorVBdkQeaV/Q14xlTARXXhGJsu1BTHLSJjVe
   A==;
X-CSE-ConnectionGUID: 2QIRoSmOQVeNHnPtN2fDXA==
X-CSE-MsgGUID: rT+x4U+rQFeK3DG310otXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="84084752"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="84084752"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 01:50:26 -0800
X-CSE-ConnectionGUID: IOR3SnQdQ1ihKQMkPl7L6A==
X-CSE-MsgGUID: sx/heuR1QOi6G8TlFVUXbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="248103508"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.52])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 01:50:24 -0800
Date: Mon, 2 Mar 2026 11:50:22 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linusw@kernel.org>,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH v1 1/1] pinctrl: cy8c95x0: Avoid returning positive
 values to user space
Message-ID: <aaVdXnhZDyCI-1IY@ashevche-desk.local>
References: <20260227164335.2044035-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227164335.2044035-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32375-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: 650711D5C2C
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 05:43:35PM +0100, Andy Shevchenko wrote:
> When probe fails due to unclear interrupt status register, it returns
> a positive number instead of the proper error code. Fix this accordingly.

Note, for backporting this should be transformed to

-		return ret;
+		return -EBUSY;

in the respective lines.

-- 
With Best Regards,
Andy Shevchenko



