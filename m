Return-Path: <linux-gpio+bounces-37128-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKaIB2IhDGqiWwUAu9opvQ
	(envelope-from <linux-gpio+bounces-37128-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 10:37:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE8157A41A
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 10:37:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F8ED318A7BE
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 08:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403973E1D08;
	Tue, 19 May 2026 08:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="batO2f7G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE332F547F;
	Tue, 19 May 2026 08:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779179288; cv=none; b=C4YQa72YEptxX4DokYVsedGClh35lDIGqcOWH/clNYdKwW6OnlcYvHbEcDY9ogRenPgsHmrk8zebdW5iJ0X/0t9V+DHpHqngwLm/URWv94bcXVI9V1IFrLdH1aj1zDmDs/1gdIhSMZnWxqGaNXtg2sfThvnGqeyA8fHufQvMf6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779179288; c=relaxed/simple;
	bh=JW8DZprdXrp7JBxezgukD36415BfdI7+3ak4LEfheDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m8YhI4d52wi961fWH9+5t6+jomP48eWs0nuGvBE8LKF+spthkrUhK/qfcV5nc5sbjz5+vf/yDleZWycdc+iRvhail07IJurRVEgjUTEonx43BrLWa444MNKIXfxkMjZzkAr8giMXaJxaJpiHtOj+OcLApjI5Uj5gDCwgfbNG1n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=batO2f7G; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779179287; x=1810715287;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JW8DZprdXrp7JBxezgukD36415BfdI7+3ak4LEfheDc=;
  b=batO2f7GqDmnLbpOX4g99HWRr7OLkQePFaldLYY1UCk9MlDinNQTU4Pn
   EKDXyPh8IAfujWk0Q/WeIJ/6Dge0LCFvxYG9PbeCIjrUS1hL/F0iAlTBv
   ebkMT1mhuOzFw4s12O3Gxwi3sgnmqEDC4tdF+vb5rEcR6e/2x6ciDK40t
   KfmCiPVCH9wg0It4AXFPEXuPElxYLnZcfkdEb661jHa15KmX6KNo9GlX4
   veeZ4XFSZnKfVXE/vZnqOM34R5umQ/TDaVerM7RG4tPRu3vn3WeqOu4z7
   v4RFdLzFSUQzrkjSf4xFBy/GaDfwz1+uVdc9ekjr2tI/owgskWJnF3VD7
   A==;
X-CSE-ConnectionGUID: n5RNsGq9Re2lzHGLCs2VXg==
X-CSE-MsgGUID: mRYN5efpQAaQ8GvUMAX2lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="90744722"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="90744722"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 01:28:06 -0700
X-CSE-ConnectionGUID: KyYTN/2cQHGz8B/oX1aEkQ==
X-CSE-MsgGUID: WPsbR1uUT/KD3JwkarIvSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="243993113"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.150])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 01:28:04 -0700
Date: Tue, 19 May 2026 11:28:00 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
Cc: mika.westerberg@linux.intel.com, brgl@kernel.org, linusw@kernel.org,
	linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, westeri@kernel.org
Subject: Re: [PATCH 2/2] gpiolib: acpi: Fix resource leak in OpRegion cleanup
 path
Message-ID: <agwfEMtEctXYC1oc@ashevche-desk.local>
References: <20260518103302.GO84797@black.igk.intel.com>
 <20260519070039.9280-1-mscardovi95@gmail.com>
 <20260519070039.9280-3-mscardovi95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519070039.9280-3-mscardovi95@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-37128-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim]
X-Rspamd-Queue-Id: 9AE8157A41A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 09:00:31AM +0200, Marco Scardovi (scardracs) wrote:
> If acpi_remove_address_space_handler() fails, the cleanup function
> acpi_gpiochip_free_regions() previously returned early. This leaks
> the connections list and all requested GPIO descriptors.
> 
> Remove the early return statement so that connection cleanup and freeing
> of descriptors are always executed, preventing memory leaks in teardown
> failure paths.

Same problem may happen in the acpi_gpio_adr_space_handler().
What you need is to split the list and GPIO cleaning into a helper
which will be used in both cases.

This might need a Fixes tag.

> Assisted-by: Antigravity:gemini-3-flash
> Signed-off-by: Marco Scardovi <mscardovi95@gmail.com>

-- 
With Best Regards,
Andy Shevchenko



