Return-Path: <linux-gpio+bounces-34671-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HQ7ECZs0WmWJQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34671-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 04 Apr 2026 21:53:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8F439C540
	for <lists+linux-gpio@lfdr.de>; Sat, 04 Apr 2026 21:53:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 303EB300D15F
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Apr 2026 19:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8BC333F8A4;
	Sat,  4 Apr 2026 19:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MZJexPqL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFB927E1A1;
	Sat,  4 Apr 2026 19:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775332384; cv=none; b=gwVv+w+GIEIqOdkqQSJw1rToyXwQLKzPJ0xyCqUjAa4jtwmYAmG39D9AibFqtEy5SwP9kn22kfiWpJ27KY9YcC6nVMh6v5YGvnMlPGoiSLrCjQrl5Gbh5No87oK4oAsPzoS1ySg9Yx+kQdYvfm9aEB0vRFRM6g1VJNGwi9Utscc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775332384; c=relaxed/simple;
	bh=9xDTklPy9jUF/qGTL5Rz2rToKjPZgxDV+9c4LV6jSCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nKVRE7BMAxDCBGHzW07/UOpp6oVjfUEA1iC+OiSOkeyNod8DhXURnM+WqgT7wRzoW+t6PxWcksKqokRCIMGYLTT2F/d+zgPH65G7ERP4yukoSmAy7fzLyLODc1an9lplYwWVp8m4KTQk7Vw2ZCg7jMQBvzFw/jfJLLCNC0s5qMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MZJexPqL; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775332383; x=1806868383;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9xDTklPy9jUF/qGTL5Rz2rToKjPZgxDV+9c4LV6jSCE=;
  b=MZJexPqLmHGSE5kYnEd/apj41B9GyeD1rr/jweVhlb5FR2IoXujZsb+G
   NoXSJ7Vo7wDNlUM78rJo4StTTvrnRiwck7z4h4UwNlSzYqOcqkIRQg9er
   KZ813ISehpt/kKuyOIfahr+4iJQuwaj9xCAIYgnYDkuEQVFtafZijZumx
   KidHleSedH28DfneBpH8tZ/Sq3wWe/Tp2z8ok6gNsMYDUXgv+HDlK4zFc
   jdr6wFDbwBGVpfCQZvLxv+i3tEP760CESqFIzIzof9E0Lm81kTx15ik6I
   soBrmaWudYyR7tG3otV6mFvi8ubQ18fbkab+VJm3b/cSmZi0QVWfUV3+H
   Q==;
X-CSE-ConnectionGUID: DJiZ9IGRQ0SpZGY4wNpCpQ==
X-CSE-MsgGUID: C7LGPbwGQeGnqWRQkFrUaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11749"; a="76244823"
X-IronPort-AV: E=Sophos;i="6.23,160,1770624000"; 
   d="scan'208";a="76244823"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2026 12:53:03 -0700
X-CSE-ConnectionGUID: 0Ye8a0n3Tbm81pdP1nhbWw==
X-CSE-MsgGUID: pL1ulymiTDKR5VaORIyb4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,160,1770624000"; 
   d="scan'208";a="232460393"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.247])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2026 12:53:02 -0700
Date: Sat, 4 Apr 2026 22:52:59 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vasu <vasuhansalia05@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, djrscally@gmail.com,
	mika.westerberg@linux.intel.com
Subject: Re: [PATCH 1/2] pinctrl: intel: platform: Add INTC10B5 ACPI ID for
 Lunar Lake
Message-ID: <adFsG9mTkoE3kIF4@ashevche-desk.local>
References: <20260404190236.5218-1-vasuhansalia05@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404190236.5218-1-vasuhansalia05@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34671-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ashevche-desk.local:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 8B8F439C540
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 05, 2026 at 12:32:35AM +0530, Vasu wrote:

> Intel Lunar Lake platforms (Core Ultra 200V series) use INTC10B5 as
> the ACPI hardware ID for the GPIO controller that manages power to
> the integrated MIPI camera sensor.
> 
> Without this entry, the pinctrl-intel-platform driver does not bind
> to the GPIO controller, causing int3472-discrete to report:
> 
>   int3472-discrete INT3472:00: cannot find GPIO chip INTC10B5:00, deferring
> 
> This prevents the camera sensor from being powered on entirely.
> 
> Tested on: Dell Pro 14 Premium PA14250, Intel Core Ultra 7 266V
>            (Lunar Lake), Ubuntu 24.04, kernel 6.11.0-1016-oem

Huh?!

The currently mentioned ID is CID in the driver, the BIOS has to set _CID
properly. Can you file the bug against BIOS and make OEM aware of this?

-- 
With Best Regards,
Andy Shevchenko



