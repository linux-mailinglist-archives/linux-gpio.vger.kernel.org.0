Return-Path: <linux-gpio+bounces-34672-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJyENMRs0WnqJQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34672-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 04 Apr 2026 21:55:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7645639C56A
	for <lists+linux-gpio@lfdr.de>; Sat, 04 Apr 2026 21:55:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B019230041FF
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Apr 2026 19:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 595C134029E;
	Sat,  4 Apr 2026 19:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="isNxeoyJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F340C33DEFC;
	Sat,  4 Apr 2026 19:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775332546; cv=none; b=Wq2mb9iD2f4avlSS4jl2JVLJnK7KlF6Ta36Bfn3wC6zD1Z/ftH+WKfeZ7K7gZuLFEbAdaSxsMh5FIRugdTuTe1gff0OV6ldEe67d5eB7j1T2BrB0hrHjMLpZHexieINlvUYgx/61yxIj3VU1XX8F+s2yGg3bnmMVDfpwkMZq5Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775332546; c=relaxed/simple;
	bh=46gXTYEWVGeE7EbU+wUG4ZAVht4kEwVzSzAD4Nafddw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=axXjYgXnM6nrxy1sTxr7npQkETD39LfUEvRt4uCxBy1qqnss+k6S4jyBacHsAHYR2a8zWqC52vI3KRbzvXbPGAFq1btnRS5YeoRw2niVj0SpytFnk7TRGocJnsRKaHLNcrxp8L/iTOBzLoZWkPgVD6iMFAnQz+oXhvtApX8SfS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=isNxeoyJ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775332545; x=1806868545;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=46gXTYEWVGeE7EbU+wUG4ZAVht4kEwVzSzAD4Nafddw=;
  b=isNxeoyJxcBDBYcRVAM4lqLN5dCQh8OPF4VugnMbvW/hk0t4xzuQk1Sl
   lnI2d55b6WH/U27Z+sSjzfrHfDkc2hqPJ4wwX3Edm29mlFYkIV0xAfGLI
   +yf6WkkhDUmoWp4v7a5iTLtoJePfE3j+sQIEJuoaFbyRWtc7s5xC0y1QF
   P+r7uali59BTWNxSNCFjosZrDuU04Q6Br2bHbSqa7H+hmTSDVtQd1VP+2
   fhg8zFoEys0fkkUt6IWvYXCpAVQ/ws22cVtpBU78LRNa0WdXwxljETdqc
   AxIU18kO788mJRyCzUwVz7c8aTpZFcQ5+goWcHmpC9pnu7DURNZQUZ0vF
   Q==;
X-CSE-ConnectionGUID: cMpwS74uTK6EGKvZGHAPSw==
X-CSE-MsgGUID: 4KsZIEVzQBWsPjoFdn7N8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11749"; a="76244891"
X-IronPort-AV: E=Sophos;i="6.23,160,1770624000"; 
   d="scan'208";a="76244891"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2026 12:55:41 -0700
X-CSE-ConnectionGUID: L7Zot7S+SJiMvvYqKuVHFw==
X-CSE-MsgGUID: B/7sDw7STtSG8xjqA/NKdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,160,1770624000"; 
   d="scan'208";a="232460585"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.247])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2026 12:55:33 -0700
Date: Sat, 4 Apr 2026 22:55:30 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vasu <vasuhansalia05@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, djrscally@gmail.com,
	mika.westerberg@linux.intel.com
Subject: Re: [PATCH 2/2] platform/x86: int3472: Handle GPIO types 0x02 and
 0x12 for Lunar Lake
Message-ID: <adFssnMzgbvKW3Ul@ashevche-desk.local>
References: <20260404190236.5218-1-vasuhansalia05@gmail.com>
 <20260404190236.5218-2-vasuhansalia05@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404190236.5218-2-vasuhansalia05@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34672-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.990];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ashevche-desk.local:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 7645639C56A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 05, 2026 at 12:32:36AM +0530, Vasu wrote:

> Intel Lunar Lake platforms (Core Ultra 200V series) use two GPIO types
> in their INT3472 ACPI tables that are not handled by the discrete driver:
> 
>   - Type 0x02: Strobe GPIO, used for IR LED/flash control. Map to sensor.
>   - Type 0x12: AVDD/sensor-supply GPIO, used on Lunar Lake to control
>     sensor power. Treat like RESET/POWERDOWN and map to sensor.
> 
> Without these handlers the driver logs:
> 
>   int3472-discrete INT3472:00: GPIO type 0x02 unknown; the sensor may not work
>   int3472-discrete INT3472:00: GPIO type 0x12 unknown; the sensor may not work
> 
> Type 0x12 handling was confirmed by inspecting the OEM kernel module for
> Ubuntu 24.04 (6.11.0-1016-oem) which handles this type by mapping it
> directly to the sensor via skl_int3472_fill_gpiod_lookup().
> 
> Tested on: Dell Pro 14 Premium PA14250, Intel Core Ultra 7 266V
>            (Lunar Lake), Ubuntu 24.04, kernel 6.11.0-1016-oem
>            Camera confirmed working at 1280x720 30fps after fix.

STROBE is about to be added by another series. The 0x12 needs a proper define.

-- 
With Best Regards,
Andy Shevchenko



