Return-Path: <linux-gpio+bounces-36288-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBv8Lsg4+2nUXwMAu9opvQ
	(envelope-from <linux-gpio+bounces-36288-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 14:49:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3DD4DA7E9
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 14:49:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C6FBF30041DC
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 12:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A96544E052;
	Wed,  6 May 2026 12:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ITiqkvk7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F5343DA29;
	Wed,  6 May 2026 12:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778071750; cv=none; b=atvv3tLj4qw3eFRhykJzH1mdwzFGLypGP63KC4i557wLhtEAoc/zOYsUlVkT2F5pc5jalF2ZdDx61V4wevTxEmDtlAdo0m+NLc4vd8Ub64D9ChEkV5uEVBNSmZplp2z1cXffbO7wfqEaZt4hdCD76nA/WKJ9H6sg8UE3UMG/N3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778071750; c=relaxed/simple;
	bh=9hmajR31b1Ajm4nElMf9ezRiEhlqIEGPPJIfuW3vIkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EfAUE4NF7+9ozHbwcXEzn5gXi2jUu/zS1KRO7Bb23cKBc2Pk52rNMdzeqrwpfzVX7bT788Q/Fwq+GZ+m+jMpm/V0dNxkVpHW44Q8iLxKNpEv+9XVeVB05MQMS43/xD9c/E11BSmiyR3JP+4Aym/Hy/6uvN3tnnXH330rJjPwdRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ITiqkvk7; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778071748; x=1809607748;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9hmajR31b1Ajm4nElMf9ezRiEhlqIEGPPJIfuW3vIkE=;
  b=ITiqkvk7jRjFdim8LDB4foT85m6Akxqwbh5DJSiZvH9166E6xd4p8WyB
   946PHmoYcy/i0TnswAnv+8b4MNxdv8UrlCj3plpzbz4qYR3KuEHNaUcZn
   sHHuoXSmlI+4Ij5J0+p313KaF9IKfqggJY5CP4LwHmUsAhNUXx0Mnofvn
   gtlW/ErfFJaj+cFI+WJFqFT6yKfFQLYzIR0jLrQRx0H2rg6duZH04Bmqo
   2D0yxwVHOlXaPFYXCRCqtvoQZUXKJDd8fKPssSl0dzcg5gZMoc6hJmThc
   rfdG5Q4YTy4+PpAXNma+w/jtzy10pjBvoqg+kI4QyAsC02U6Hmh2SJyDv
   w==;
X-CSE-ConnectionGUID: Id+ng18RQuiF5sKxJLCA0A==
X-CSE-MsgGUID: j3Qt2JkZQumeU54Hp4l2PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="66530340"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="66530340"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 05:49:07 -0700
X-CSE-ConnectionGUID: kiEsOw6dSRmfYMeGhncYqA==
X-CSE-MsgGUID: 1jCTTk54QIGHHLaZ/M+vwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="235124521"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.183])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 05:49:05 -0700
Date: Wed, 6 May 2026 15:49:02 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Marco Scardovi <mscardovi95@gmail.com>
Cc: mika.westerberg@intel.com, mathias.nyman@intel.com,
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, Marco Scardovi <mscardovi@icloud.com>
Subject: Re: [PATCH v2 0/3] gpio: acpi: modernize resource management using
 cleanup.h
Message-ID: <afs4vmGPzhXq2WCt@ashevche-desk.local>
References: <20260506113215.GK6785@://intel.com>
 <20260506123427.1077274-1-mscardovi95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506123427.1077274-1-mscardovi95@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 5F3DD4DA7E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[intel.com,vger.kernel.org,icloud.com];
	TAGGED_FROM(0.00)[bounces-36288-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:dkim]

On Wed, May 06, 2026 at 02:34:21PM +0200, Marco Scardovi wrote:

> thanks for the quick reply. Unfortunately I noticed too late that thunderbird had
> broken my patch during copy/paste. I'm pushing it again using git send-mail.
> I've divided tha patch in 3 smaller pieces: let me know if it is ok for you and
> Andy. In the meantime I'm testing it against KASAN and kmemleak as You suggested.
> 
> Let me know if there's anything else I need to improve.

Slow down, please! The time between two versions should be at least 24h!
On top of that, Mika Cc'ed me with this and I only answered a few minutes ago,
meaning that not earlier than on Friday the next version should come. I'm not
going to review this. I believe most of my comments still apply. Also note,
that the email thread is a mess now, something went wrong. And do not forget
to remove placeholders when filing the contents of a cover letter.

-- 
With Best Regards,
Andy Shevchenko



