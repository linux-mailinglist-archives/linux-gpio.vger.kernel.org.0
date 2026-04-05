Return-Path: <linux-gpio+bounces-34687-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILkBKjeL0mkqYwcAu9opvQ
	(envelope-from <linux-gpio+bounces-34687-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Apr 2026 18:17:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D7C39EF81
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Apr 2026 18:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BCEF830028C9
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Apr 2026 16:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61A0F30C35C;
	Sun,  5 Apr 2026 16:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nhefRRrv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87A24AEE2;
	Sun,  5 Apr 2026 16:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775405874; cv=none; b=jThK1R5JmmUlmfqa4qGIMsNkkJgNUkZpqTMEUnh94+ZfKK5w7YL7xtBy71QatFZ/gXe/MCak6L1FPvCPZZOc8VmV2boxqSk+7WPD4oqUuuyjjsIa+3pk5H0boRVp2KBV/Umusj2jxH3v/sqs1BZUw1gKo9DMgDJ+PBQk3VfQmwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775405874; c=relaxed/simple;
	bh=4IbK2v3MpcuvS7BW394d6fYBerOrGS/oL7o52zJQzT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ixtTbNVLZxbAQC83+vOz0vtGObSZcDfaN9j9p4fj+SgWgkGEu+gNP9S80bpl2OhpmNfkDrRCSMy28NO/LADX/sEkspboHxj1xqlPEoap0jetL/60JfTsKFoWcgHfvqHmS6b8U2cb/nr3Q/aprlWDAVraX7iAHAx095sA8hhXGS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nhefRRrv; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775405873; x=1806941873;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4IbK2v3MpcuvS7BW394d6fYBerOrGS/oL7o52zJQzT4=;
  b=nhefRRrv8sbuJnlZ5hiFcQcetQFqaplkIinOSYWdhBK2D5XriF9U+9ri
   6wcLAUCGZjyqxVBjeRwHd7iS8yH39vK0B2IXbiAI89Y+N6IRECZ0w13+X
   zHESs0adx1IaD+NJqK8VnEIHaff0rx6ze4Wyd62udkF5b+ZpAvyYGIH3A
   j1LfKadSyhLOUX2EW7+eTN6vlAcOkrLE+CbkkgPgGiTzKuYTtV/eX5woX
   0IB6KBRwa5zSK50LTPL4iEvtaovgY0iLAWjBYCebAxOsEaS6KX6V6Kmkm
   4Laub1NA7WTikUHqalWqRY+rOkkjE+IBlPQt0TVz8B76ydqo+G8LkTG6g
   Q==;
X-CSE-ConnectionGUID: 9f+kdgBDQ6S632UIZ1kwIg==
X-CSE-MsgGUID: Uiy1OeEbSFS4FJ5LZ07vjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="76575212"
X-IronPort-AV: E=Sophos;i="6.23,161,1770624000"; 
   d="scan'208";a="76575212"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2026 09:17:53 -0700
X-CSE-ConnectionGUID: poGSh0RGQBiEgRevTCRg9g==
X-CSE-MsgGUID: ZLVAREaJQfKFgb7jvs03TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,161,1770624000"; 
   d="scan'208";a="222882581"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.12])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2026 09:17:50 -0700
Date: Sun, 5 Apr 2026 19:17:48 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vasu <vasuhansalia05@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, djrscally@gmail.com,
	mika.westerberg@linux.intel.com
Subject: Re: [PATCH 1/2] pinctrl: intel: platform: Add INTC10B5 ACPI ID for
 Lunar Lake
Message-ID: <adKLLO1oKOy1tjdo@ashevche-desk.local>
References: <adIkXdCXr2x2zTrE@ashevche-desk.local>
 <20260405091518.5322-1-vasuhansalia05@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405091518.5322-1-vasuhansalia05@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34687-lists,linux-gpio=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.993];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: A9D7C39EF81
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 05, 2026 at 02:45:17PM +0530, Vasu wrote:
> 
> Yes, multiple PA14250 variants are already on the market and shipping.
> The Core Ultra 5 variants ship with Ubuntu 24.04 and are Ubuntu-certified.
> The Dell Pro 13 Plus (PB13250) with Core Ultra 7 266V is also
> Ubuntu-certified. My device, the PA14250 with Core Ultra 7 266V, ships
> with Windows 11.
> 
> All of these Lunar Lake Dell laptops share the same ACPI BIOS issue with
> INTC10B5 not having _CID set properly.

Okay, you misinterpreted the SoC's GPIO with external component. The problem is
you forgot (or distro, in that case file a bug in their respective bugzilla) to
have the proper LJCA driver(s) be enabled.

Another possibility that they are using old kernel.

You can spent 5 minutes by checking yourself:

$ git grep -n -w INTC10B5
drivers/gpio/gpio-usbio.c:31:   { "INTC10B5" }, /* LNL */
drivers/usb/misc/usb-ljca.c:182:        { "INTC10B5" }, /* LNL LJCA GPIO */

Overall, your series is not needed at all.

-- 
With Best Regards,
Andy Shevchenko



