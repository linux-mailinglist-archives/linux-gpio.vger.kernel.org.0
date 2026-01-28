Return-Path: <linux-gpio+bounces-31234-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AiTLqkMemlo2AEAu9opvQ
	(envelope-from <linux-gpio+bounces-31234-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 14:18:33 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DED6A1F60
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 14:18:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3A127300861A
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 13:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E883352931;
	Wed, 28 Jan 2026 13:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hZPsqnT6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AAE35292C;
	Wed, 28 Jan 2026 13:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769606298; cv=none; b=upMdGqDo1OPL77syIZprboXIUVqQAqhGMljsos2e8lvf+g123s9rcT5vw4ImLs0PkESOikGrgUed54ez6dsox615K8nquKS5QUtv8J4FXjDpV4CBoxa7dRq8fzSZHIJ9Bo26Lr2oaeNJaBcjk/IkjsoGdYFpP1ouFsFwd5aA0oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769606298; c=relaxed/simple;
	bh=iC+ZHIY6e6cHZHljNQVqf+EZBi+UzyviZxI+HTBlYbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DkJwcEcKjKvajodxdh/zkLdKB4bkOalxmBp4Rhpe8fs2WldMWa8DtDxl+MrZVumOQcULp2xY7YRSnGRVztyTqqWvp2iTa7fwd24XqmytF9a+sdObf98MIXF9jMBQAfcyZLBYoV0uUKjYxM4zX+OTQb1YwJWs16AofgTeb2GON74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hZPsqnT6; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769606297; x=1801142297;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iC+ZHIY6e6cHZHljNQVqf+EZBi+UzyviZxI+HTBlYbc=;
  b=hZPsqnT6E71fluHlHxBewwoMqdu+IO3Ewpn7zLUsPFQM2FGBmnSmNZyq
   pisHIiEx/yPLrocL226zyoZ16yHWlE+e6Z8ReZRIEuWDfIAnqUFwC+t/b
   +qRx0SXx84rcZaN2GfT4FEK22GsL3+b5uL7Vh0/yHM5P2aMm0RdLzW7Zb
   IlXAwo0Psc3WbTtw2JW9zawgPH5xVGpR6r/EL/NJ/gW4ud9RL9UGfJTMS
   KumHEebxgxdJbA7xZ8PIKSHtoiwymmLKmLzGaKS7K5snyQgsHs+8sF54W
   kLTf0l+38HVoS96GzjgdvkL72R+yZnVmCgC21UKBAxBP4xAq2DSIzReJJ
   w==;
X-CSE-ConnectionGUID: 6Hgm1HgDRs+vQORv56MNCw==
X-CSE-MsgGUID: VOSV8i1rQGu+RzDbfLOhJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="74676920"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="74676920"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 05:18:16 -0800
X-CSE-ConnectionGUID: AgmAyt0RQgSq9oK07qF6Dg==
X-CSE-MsgGUID: 3Dxb8DTmRCibmc9okce9zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="239517082"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 28 Jan 2026 05:18:15 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id CAF0C98; Wed, 28 Jan 2026 14:18:13 +0100 (CET)
Date: Wed, 28 Jan 2026 14:18:13 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 1/1] pinctrl: tangier: Remove duplicate error messages
Message-ID: <20260128131813.GN2275908@black.igk.intel.com>
References: <20260128124506.40882-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260128124506.40882-1-andriy.shevchenko@linux.intel.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31234-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[black.igk.intel.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3DED6A1F60
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 01:45:06PM +0100, Andy Shevchenko wrote:
> The pin control core is covered to report any error via message.
> Since that it's not needed in the callers.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

