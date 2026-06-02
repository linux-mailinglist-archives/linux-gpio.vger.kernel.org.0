Return-Path: <linux-gpio+bounces-37792-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0M5wDmWLHmr0kgkAu9opvQ
	(envelope-from <linux-gpio+bounces-37792-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 09:51:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E54B1629EF2
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 09:51:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 145A73040C42
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 07:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78A8D3B5F48;
	Tue,  2 Jun 2026 07:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M2B6PcZR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259863B38BA;
	Tue,  2 Jun 2026 07:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780386441; cv=none; b=f+hPashQf0VovcuLcdgtJPBfVKI6G6XunFybdV3OAWT6bRC+GPM6TFERWWBIa7MhN9MKbrLNUh7aYgpUun/xBNYLUq81eBzhtyfv38jHhOZTI0kogGFEEJhrC+G6o85MlBmEPgj9aTZ9jMIGCCZl2Wm5HtEIH93VoWgj/L7U4l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780386441; c=relaxed/simple;
	bh=P228OhwL8kyNtiEhBsWPAgaWG1MfkyfnDMrS1csxmL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UVdrJuJul1uHTs1wG5W00vZrz59poSJUoxT/F1/tyN/iwUNIV5ralMR9IO6vQ0GXko2jip6ywko2McHVNwGH4VAZfGre8d8w+bG9k3E2nAXqDyDj2Mq+ZvPCK/3xKBpM7/o4MAGI0JbADXTQ5XgcUwhK+3HaL90O7UCFa82DqG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M2B6PcZR; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780386440; x=1811922440;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P228OhwL8kyNtiEhBsWPAgaWG1MfkyfnDMrS1csxmL4=;
  b=M2B6PcZRuC0zbJIy+CStT55BBjbkaIWcLUItixPPKV/TuvRfFhVcR/3b
   i9ExdieMUG2MXySBGmQ8VUz5DM0PRZxQQ803EuA67exPK0d1K5sf4jwvB
   +4yQFlmO3wcaLhnrZ5N7MShWbXKOWgMb6Vu2ne3pWtiLbN89Uau3ag7gu
   q0seFXLLV3DhY2RI/Er9Uh6RmKN9/y+5OxVfzNKtFEktP9/DlaQtscjGY
   UKktx4PmAkdlaK/UneftoIH7coEP0UpE47xxgg85NHTOGJ9Gs8Xy7CfUm
   YWB6cClTfI7fGOL1/h9VejKvw+9qNGo43PSx1mzPSXRx25XS9sjE3GyqD
   g==;
X-CSE-ConnectionGUID: 7B+8A4CFSLC6sNkC0NWK9w==
X-CSE-MsgGUID: ri2WqDNASLeSXApbQBdcNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81157127"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="81157127"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 00:47:20 -0700
X-CSE-ConnectionGUID: HBiuIkG1QG6avrxeb03FGA==
X-CSE-MsgGUID: 3vM8DyoFSxKxzPM7p+i0TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="248755769"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.229])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 00:47:18 -0700
Date: Tue, 2 Jun 2026 10:47:15 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
Cc: brgl@kernel.org, linusw@kernel.org, linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com, westeri@kernel.org
Subject: Re: [PATCH v3 0/2] gpiolib: acpi: Fix bounds-checking and connection
 leak
Message-ID: <ah6Kgz8J0oJ7NSDX@ashevche-desk.local>
References: <agwfEMtEctXYC1oc@ashevche-desk.local>
 <20260520074955.55443-1-mscardovi95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520074955.55443-1-mscardovi95@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37792-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: E54B1629EF2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 09:45:45AM +0200, Marco Scardovi (scardracs) wrote:
> Hi Andy,
> 
> This new series addresses two issues in the ACPI GPIO library while trying
> to address your feedbacks:
> 1. Adds robust bounds checking for pin resource indexing when requesting
>    owned descriptors and querying wakeup/interrupt pin configurations.
> 2. Fixes a connection/descriptor leak in the OpRegion address space
>    handler and handles connection rollback in a transaction-local list
>    to avoid wiping successfully established connections.
> 
> Please note that some of these changes were found during a personal follow up
> analysis before submitting the patches to the community. They are reported
> to explain why some of these fixes are made in that way instead of another.

Thanks for the update!

Please, split the second patch more to make it better to understand what the
helpers are doing (without changing the behaviour) and then fix the problem.

Otherwise it looks better than previous attempts.

-- 
With Best Regards,
Andy Shevchenko



