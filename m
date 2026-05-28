Return-Path: <linux-gpio+bounces-37632-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNHwCEcPGGqwbQgAu9opvQ
	(envelope-from <linux-gpio+bounces-37632-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 11:47:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B25815EFDFB
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 11:47:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C765B300BBAF
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 09:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A3573AFB18;
	Thu, 28 May 2026 09:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TbB92kO1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9323B2FEB;
	Thu, 28 May 2026 09:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779961563; cv=none; b=ra0jdUgQsyxhXd6WM6DWt/GYEEjGGUyS3Edv+6+kuFgCU2LXBFZujipl7pHCRnyLXa/2uq9bR4uN8TBbYGonTn+iSrqpCkVHCaFbi9OAuLpYHp34RP7BK3YfwrV5t/KpKqH5/AwLSgmvEBMwo72uvqcbIWsOK+HVasphtYXh2XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779961563; c=relaxed/simple;
	bh=tuKOsWqUApVMudPwuG8K7rTxRvfE1UckQ00rtNKTi04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DiyB15QmmM0tUOP0v922utJsY1o90l3M8EQ4f/RHaRDeCz9xJRS57IfNINZliX985g0tNF8LgzrfZM/IKX53vxKlvFSBI27OateWPM2QQ8pbqw8fEuNtID3Zfp8VFlCaS0Jqm5gssma2PCCCQxin0g8MYqYAKSZX9vYUDpZ6bBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TbB92kO1; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779961561; x=1811497561;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=tuKOsWqUApVMudPwuG8K7rTxRvfE1UckQ00rtNKTi04=;
  b=TbB92kO1yrrvwaCu0sWlLTpDeQNPqJxgF5nGDwEmReeHQIZhZk7bmK14
   gW9dwrnUXQZEtIrUxXDrx0ZygKtTsfs2WF5WGw8Kq1JuSF5eR3si8290P
   BbdoNZTohYJQ7O4IkXVIGizWQ/NR1+ryoLxb1Y9Jf0K4sZmjzXq2KV/TS
   augRTLVZu3SRgnYJMPlg4DuJEwrqYRpT+l+Eqwby3+eX8K3ByXpTKvYqi
   /S2guVgMkNAWXr8g/r96acgVqUpfUWcRgDDr3Nw+rFshp0B3SRJJcrq1P
   Yr8+6hlBgtlzhMuo8k52B55zipK8ruNgyKSystnyMe0KCvD98r7VdQYxS
   A==;
X-CSE-ConnectionGUID: e7nocZQQQRmOScHJdJtrTw==
X-CSE-MsgGUID: 7WnKVrsORMiMCRxdOK2R9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80654393"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="80654393"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 02:46:00 -0700
X-CSE-ConnectionGUID: c+IUXeYJTke+ux4Nuskj2Q==
X-CSE-MsgGUID: DLog5FylTZWfobh2JbLlUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="247584648"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 28 May 2026 02:45:58 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 1F6A698; Thu, 28 May 2026 11:45:57 +0200 (CEST)
Date: Thu, 28 May 2026 11:45:57 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Linus Walleij <linusw@kernel.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v1 1/2] pinctrl: Use named initializers for
 platform_device_id arrays
Message-ID: <20260528094557.GE3102@black.igk.intel.com>
References: <cover.1779896151.git.u.kleine-koenig@baylibre.com>
 <fbe2d29f785798b3e0b7c1b5707e917035a0b442.1779896151.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fbe2d29f785798b3e0b7c1b5707e917035a0b442.1779896151.git.u.kleine-koenig@baylibre.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37632-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: B25815EFDFB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 27, 2026 at 05:43:00PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> Named initializers are better readable and more robust to changes of the
> struct definition. This robustness is relevant for a planned change to
> struct platform_device_id replacing .driver_data by an anonymous unit.
> 
> While touching these arrays unify spacing and usage of commas.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> ---
>  drivers/pinctrl/cirrus/pinctrl-cs42l43.c  |  4 ++--
>  drivers/pinctrl/intel/pinctrl-broxton.c   |  4 ++--
>  drivers/pinctrl/intel/pinctrl-denverton.c |  2 +-

For Broxton and Denverton,

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

