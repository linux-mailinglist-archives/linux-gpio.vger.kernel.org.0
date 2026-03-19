Return-Path: <linux-gpio+bounces-33799-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIBcDbGgu2kLmAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33799-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 08:07:29 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D36CA2C715B
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 08:07:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48E25307E098
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 07:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B27C39DBD5;
	Thu, 19 Mar 2026 07:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y5ABZpWg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FEF39A7E9;
	Thu, 19 Mar 2026 07:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773904041; cv=none; b=kXAA8dt1ElMhKitZgq/EByqLukgbm+29IVQHE4VA11PTjlq/MR/traYZ4dEk/B9qSEgr0ywiicL3ASF6yVmG+PA0DMuTg4akB5DHwhBwenyCmgWipLF9xiTYNphLSRbG3o5Qid/RY1tb9F5MA9yHDt33Rl8C5EITL1EJDvu+IM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773904041; c=relaxed/simple;
	bh=k+vhMXU9tliaK7mx+m1/RxboVxEJCCL1SNj67HeboYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MinOGknazVHHWhL3NRTufwXpKlR57HGYydGSSvA7gRsVBj9qGRTloLByNa/FdxCNtwt8JfhIX28OP+4diTCxjQ31GhC2TXk3BK8XRvaFETa/KMlw8ds29vQuOLENBnG+7xKiQ5DQ0ZL7vyYluGbirv1+G90ukJgC51jnlcvBD9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y5ABZpWg; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773904040; x=1805440040;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=k+vhMXU9tliaK7mx+m1/RxboVxEJCCL1SNj67HeboYo=;
  b=Y5ABZpWgMM9hobagwxTES0bRTxSYK6CcNN3qJd8GOIdYuC5OTgIiloyE
   0KZXR8nUXdCDDwYJte2GbzAVWm09hZUrDO3EoHMDp/yLaTjapfrjqSAI2
   0JG6AJKxQx55muCW4zsPInAu3y19BVv0gfpaW/E2IZAbSWS3ESxQtTlTo
   O5/HGKzpTs68xHepJwDZ0g72tEagDT4Cl5Anb8dTSqCzWoSoMNC9Ygv6j
   KyWch7q+ydA4yWGrzZc/ayddTvO52jnDu2HIisn0Vu+LlucfQUW0MwoYY
   3FtIiWVb4mbMn9tlrSOd1BnHoL9r5ETfyrVXh51ZeYoV7KVJqb1HmoPwI
   A==;
X-CSE-ConnectionGUID: O6UaXNtcT4O3EH9X7CuTWA==
X-CSE-MsgGUID: E5OO+jyBTIKE641T21vqkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="86330213"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="86330213"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 00:07:19 -0700
X-CSE-ConnectionGUID: Gws023sxRlOCdmCQIU+E9Q==
X-CSE-MsgGUID: aC/7ElxUQWWv2/hUoOIHpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="223086511"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 19 Mar 2026 00:07:17 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 7536295; Thu, 19 Mar 2026 08:07:16 +0100 (CET)
Date: Thu, 19 Mar 2026 08:07:16 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 4/5] pinctrl: intel: Refactor
 intel_gpio_add_pin_ranges() to make it shorter
Message-ID: <20260319070716.GR2275908@black.igk.intel.com>
References: <20260318151256.2590375-1-andriy.shevchenko@linux.intel.com>
 <20260318151256.2590375-5-andriy.shevchenko@linux.intel.com>
 <20260319060345.GQ2275908@black.igk.intel.com>
 <abueBMq5VcKdUOEf@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <abueBMq5VcKdUOEf@ashevche-desk.local>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33799-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,black.igk.intel.com:mid]
X-Rspamd-Queue-Id: D36CA2C715B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 08:56:04AM +0200, Andy Shevchenko wrote:
> On Thu, Mar 19, 2026 at 07:03:45AM +0100, Mika Westerberg wrote:
> > On Wed, Mar 18, 2026 at 04:10:18PM +0100, Andy Shevchenko wrote:
> > > Refactor intel_gpio_add_pin_ranges() to make it shorter in binary
> > > and source formats.
> > > 
> > > Function                                     old     new   delta
> > > intel_gpio_add_pin_ranges                    219     215      -4
> > > Total: Before=15522, After=15518, chg -0.03%
> > 
> > Well if you enable optimization the compiler probably puts this into
> > register and you don't see any changes here.
> 
> What do you mean? I do not alter what kernel uses.

Enable -Ox and compare then. I think there is Kconfig option for that too.

> > Also code-wise this is neglible IMHO.
> 
> Maybe, but still good to have also shorter in source as well — we have
> -1 LoC at the end of the day.

Well this is silly. Your other patch adds "unsigned " to every other place
growing the driver "horizonally" but that's okay.

