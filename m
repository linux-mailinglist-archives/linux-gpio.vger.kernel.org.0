Return-Path: <linux-gpio+bounces-37807-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABduL0apHmq3IwAAu9opvQ
	(envelope-from <linux-gpio+bounces-37807-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 11:58:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BB362C068
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 11:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D5D26301913F
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 09:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A3EA3C8738;
	Tue,  2 Jun 2026 09:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aqq58lnJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A4F3438BA;
	Tue,  2 Jun 2026 09:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780394031; cv=none; b=NprcSgEvHQozhXmz7PlKIHmOAoNbqHZRO4uMyjqhbqiPI+BLQFkoKaukMHSn9SMjSSxjAryGcrm0JC4dzUz7rGhLgYR/hidAsnMJHBpbjFXxRDzriMN2xVoeWUaub7AMWsO/e/wQHo9PU9IeuNOfGTzBadQrhdMVx6KDG+c1WiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780394031; c=relaxed/simple;
	bh=O6Gd3ziO5QhnGn7e79Ml8g0TwzISvtQEAzRVuyfqA6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FWcxadMnqmxsyQFth8OLm2CyTAKJkq4VXZ2VCjM01T0U5/YFYtjw4YSaF0AmqdaBmQOAC8jjfcnV6HWi96hgDWgDTMhaBjf3znWjUvhS+666ir2+Ap6n59x8zHW7lHF/pk8yLQ/0gxpnYLQP74zsszveh8yv+KqCMSmM9DKqJ5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Aqq58lnJ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780394030; x=1811930030;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O6Gd3ziO5QhnGn7e79Ml8g0TwzISvtQEAzRVuyfqA6Q=;
  b=Aqq58lnJOXiMKwPVr762BYvfjYD2aQ8RWDebRYIkLlNNu/zRkUrZDM1l
   FQWhvnwxk3QIct+CERFCNQ18UwW1CFNDP/8Jcf4RWWU8ac1K+QN0L0J9K
   Zd5LlbGitkS93mQRfN+Z3r71xt9gUnDrHj201uWBoOzadluXT0mUTECiv
   1vVj1VwpjSEbpyRYMdZ6KPGIerTgRM7NZDQ6ubgO1eyTzx1/iacwjT621
   iy8G3qokVDgvbLi3kbb6yPghnQj48Q5yO7pmzed4wQToaxjM/oadlhpyj
   seh1xLVURXEij28kIPyJrnkqVD/eEtrLt9ws8M1Ng7fJ0U0Y5NlqYCFwl
   w==;
X-CSE-ConnectionGUID: 0ia8KlQSQP2ZHF5WNYbYYQ==
X-CSE-MsgGUID: 7E72l0vsSBea0DkkFyLa+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="80910014"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="80910014"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 02:53:50 -0700
X-CSE-ConnectionGUID: bBe5STq7S/WrLXc2QYkuUg==
X-CSE-MsgGUID: pjjgS0gUTRie8ZaSuuEebw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="240858070"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 02 Jun 2026 02:53:47 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 5C09395; Tue, 02 Jun 2026 11:53:46 +0200 (CEST)
Date: Tue, 2 Jun 2026 11:53:46 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Marco Scardovi <scardracs@disroot.org>,
	Mika Westerberg <westeri@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
Subject: Re: [PATCH v4 2/4] gpiolib: acpi: fix resource leak in OpRegion
Message-ID: <20260602095346.GA2990@black.igk.intel.com>
References: <20260531120816.17255-1-scardracs@disroot.org>
 <20260531120816.17255-3-scardracs@disroot.org>
 <20260601121815.GS3102@black.igk.intel.com>
 <ah6M_vEIREG0w_mV@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ah6M_vEIREG0w_mV@ashevche-desk.local>
X-Rspamd-Queue-Id: 90BB362C068
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[disroot.org,kernel.org,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_FROM(0.00)[bounces-37807-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,black.igk.intel.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Jun 02, 2026 at 10:57:50AM +0300, Andy Shevchenko wrote:
> On Mon, Jun 01, 2026 at 02:18:15PM +0200, Mika Westerberg wrote:
> > On Sun, May 31, 2026 at 02:03:09PM +0200, Marco Scardovi wrote:
> 
> ...
> 
> > This is really complex solution to a problem I'm not sure that even exists.
> 
> The problem that potentially may have an attack vector is the malicious ACPI tables
> (via SSDT overlay, for example). So some of the validations (like pin index in the
> pin list) would be somewhat useful.

Yes but with SSDT overlay you can do much worse things than passing an
invalid pin index.

