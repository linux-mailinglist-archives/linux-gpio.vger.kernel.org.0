Return-Path: <linux-gpio+bounces-33970-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CH5MAJKcvmkcUQMAu9opvQ
	(envelope-from <linux-gpio+bounces-33970-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Mar 2026 14:26:42 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E2A2E5840
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Mar 2026 14:26:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52DF33023DF0
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Mar 2026 13:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E69CA38B138;
	Sat, 21 Mar 2026 13:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IYNcvBzC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DD52FE560;
	Sat, 21 Mar 2026 13:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774099169; cv=none; b=XVs60Bw8hmfeDJSVArFDRn5MfPFKloI5F8FF0lkiWuYOMqb2w3aBwzmqj9Oh5sqJMKDDvhyv64z/4mEiW7Xq8wvCKIPsgXkDARcGQYx/SAtCQsX2LED9pKouYvroi795UW1lS1T0u/MO5N0UMgHzdi5V28sT1LgZE47l5n3uJf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774099169; c=relaxed/simple;
	bh=LUF/6vFCXaXhcWtLCV4YfgFTbjErUmHlepSE935r8Nc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qg1j35gn4Pg4SHdMn0tC52XiguClhfWu9ve4EI0fEI5SgIk/L11CZk3chulbSlfvkqoprNYjgx5XFAKU09AMKHPzi4vnqUEAzC+vINCecStajePhdlDPMqTNCzp9Ct7wSUXJEIz7hJAZNkxxVBsMI8VIeOeJUJCGlqY5r0tjX/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IYNcvBzC; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774099169; x=1805635169;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LUF/6vFCXaXhcWtLCV4YfgFTbjErUmHlepSE935r8Nc=;
  b=IYNcvBzCJnZd/HkWm4gXLfJkZG3Rm/3KxrVlVtibTWNB0pNhomwaNH6b
   bV3WGK9Tp41rKmIub2wk3mtyy1XhG84ic0RfuLDfrybMrzV/3rPzgvvIZ
   lZvxcESHXjLNyhWsz7hkddUTT7aHu1ZBIdwm3zxlKK4eSn+RL/PwAc0sH
   uf1b2IC6VsOapc42cin4YUBnIELEPYeMdIjZ+egvoBf1V6YNdxuHJGhHR
   kh9NxtBD5wKlSt5uUdAod9woYYBw9UZAIYnqnMs8kvBgZLf7pY2yGHZY2
   Co8f9nMoLgyTImnbajbNr2H7xVPGgKj08ELa5Ts7krZJ67mx9hnb3JrID
   w==;
X-CSE-ConnectionGUID: PgGMQrmKStOUjqWU691cqg==
X-CSE-MsgGUID: dpMWgCtiQyCNTlT/fxYhBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="75051899"
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="75051899"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 06:19:28 -0700
X-CSE-ConnectionGUID: YoWggR7AQXW0Ig4nlMclPA==
X-CSE-MsgGUID: 4NU+7VG2TOCCfIUJfyTz2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="223773304"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.245.191])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 06:19:26 -0700
Date: Sat, 21 Mar 2026 15:19:24 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 1/1] pinctrl: core: Drop unused include
Message-ID: <ab6a3MACb9fed99h@ashevche-desk.local>
References: <20260320220550.3237142-1-andriy.shevchenko@linux.intel.com>
 <202603211748.5YfMNVO3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202603211748.5YfMNVO3-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33970-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: 56E2A2E5840
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 21, 2026 at 05:55:35PM +0800, kernel test robot wrote:
> Hi Andy,
> 
> kernel test robot noticed the following build errors:

Ouch!

So, seems the gpio.h is used as a 'proxy' for some other headers.
I will test it carefully before sending v2.

-- 
With Best Regards,
Andy Shevchenko



