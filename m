Return-Path: <linux-gpio+bounces-32061-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UI5fA3iVnGlOJgQAu9opvQ
	(envelope-from <linux-gpio+bounces-32061-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 18:59:20 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8108717B341
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 18:59:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3C766303E4BA
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 17:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0312333A6E4;
	Mon, 23 Feb 2026 17:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hCEm+SFp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805F7337BB0;
	Mon, 23 Feb 2026 17:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771869555; cv=none; b=pfDRctDZhyXE2Kq0xCXtF4c94bbPBJIFbO3vcsdSCHyy/oihwagicXs72JZu+C+a3EM3SeL644XwXBNsp4yCVsZujIPOrQaatwTq++HQcYb8UPswmWnsf0lb74zSKFTa9FS2pKFkzg1xabp4sHHZs/Z3cXL9Uo+tWR9Cl1GpPlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771869555; c=relaxed/simple;
	bh=ITWecORPFgm3sy7YlYtSuVygImsM/yQTFUyOt2gzHVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aYyv9Ff+NtgcChXyCxsqh/hL/8+QHCHj4EP2WfTpTHpAIFjZ9ODPtXO7Ha5jz/SQ9vHW7IyHd1EOdaxNazyekb+eYvah6ZnfLsweus1O7gEK/PyWicXphX01i9yo9vlSkwwvReD4/UQFbBN7A2vVDvySe/tRjiUPkJPRi76kjso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hCEm+SFp; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771869554; x=1803405554;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ITWecORPFgm3sy7YlYtSuVygImsM/yQTFUyOt2gzHVc=;
  b=hCEm+SFpPCX/EdQyysmk0IMuhvFSDdU/Mba5fC26mnbfmbks08Dm+gfz
   789YBE/TRW6ZS3YKZ7jVg/BbNcgSVgohlGXWsIhmYEsRogIjwdB9FsqGh
   sD+cxs0QRwp3BN6RPIbSz9wJD98okEsSs27Upg5cG3GYcQPZyymK0UT4R
   Q+Qr28rUPKLS91KXxveC3QFzTI+wa8HCDdBgZ8NU+Hu26P7UIpkJcrwzB
   nNBoWWd8ol/9BpQkjQMWXbWYhtEQaxnHc2RlhuWJ0gCOzgeGqvPY7e05g
   Q2S3jHGD8YRRJh9a3PIBeP2gV0jfMLi/yv8Uu7iF7IKlfPKgj/dJD74nU
   Q==;
X-CSE-ConnectionGUID: g67rRxkPT/uLI+jbtgpyaw==
X-CSE-MsgGUID: BEIFGo4dQKmCZ+bsqD2AHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="98336244"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="98336244"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 09:59:14 -0800
X-CSE-ConnectionGUID: uGbkj7fRSXiiayaehKB0Ew==
X-CSE-MsgGUID: MAR5ivknT62NtPUWrzw6Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="220636549"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.222])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 09:59:13 -0800
Date: Mon, 23 Feb 2026 19:59:10 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: introduce a header for symbols shared by suppliers
 and consumers
Message-ID: <aZyVbkFKpjlJriAl@smile.fi.intel.com>
References: <20260223172006.204268-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223172006.204268-1-bartosz.golaszewski@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-32061-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,smile.fi.intel.com:mid,intel.com:email,intel.com:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: 8108717B341
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 06:20:06PM +0100, Bartosz Golaszewski wrote:
> GPIO_LINE_DIRECTION_IN/OUT definitions are used both in supplier (GPIO
> controller drivers) as well as consumer code. In order to not force the
> consumers to include gpio/driver.h or - even worse - to redefine these
> values, create a new header file - gpio/defs.h - and move them over
> there. Include this header from both gpio/consumer.h and gpio/driver.h.

It was discussed before off the list, but I agree with the direction it goes.
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Andy, Linus: I'm no longer sure who proposed it but I've had it on my
> TODO list. Please feel free to take credit below.

I believe both, I added mine above.

-- 
With Best Regards,
Andy Shevchenko



