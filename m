Return-Path: <linux-gpio+bounces-31055-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMSJFOk6d2mMdQEAu9opvQ
	(envelope-from <linux-gpio+bounces-31055-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 10:59:05 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2614C86506
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 10:59:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 399C13012242
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 09:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7B1F32E146;
	Mon, 26 Jan 2026 09:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A5XDDsgf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F0B32D45C;
	Mon, 26 Jan 2026 09:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769421272; cv=none; b=BjdR0s091CLjruwcSNcr08fDM5+e5t6n4/l/tjq+1hjgOnhDbH88C0MNpm+Nxwybbm8GKDcsAc9WkTSun/r5++OeYz2pe0jkIPIsGxwIU087bLlzmsOzI2mfmwJ0vWSbOU1p1NDnKPK/Bof7kxoxUzvgWfkUZZVvly11VvaUNLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769421272; c=relaxed/simple;
	bh=biNWH6Rr15jnwx8nyn4xZSAxcP4dKu8eJOtBc9tUiV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gUI8/Gp9F0RHGyW4BwmLKOzd/rDW5i/yKk+aam1h64c65c6FeW5TbE1CDNQaHOV5aoawV+4lmEq65q3fp+kGdchb9Fe9I95lb/okwo2769D1GX67M85hr5gw8Do/8HW4ObjPGScm5SB/s3gSjkKgXsnvidCSS5SzsJW7j/OT/GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A5XDDsgf; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769421271; x=1800957271;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=biNWH6Rr15jnwx8nyn4xZSAxcP4dKu8eJOtBc9tUiV4=;
  b=A5XDDsgf7fb1KmUFb1J8Or6xmxrvt26nTvRFsy+ypTeR3HFwdasP5/tD
   pzxoieESV9da7ZziiPsbiLe/SrqbVF//+RIgoCPWy4cDAeVT9DjlIyhJA
   Y6x2jDrE2aHm4nBKx8SJzxWTq+Yxtfpr7KLN6ra734jkYiKdp9u3NQFas
   YAA7U4S563oRTaYz8EB0/C1ZqBn9/YM07Ok8kkG+VEuXzgUDgd3KKJEGy
   vwkNutQ6AMgduLyw7HC3Ulu96Y08NIEBj4QzxcTRUoomM7YBE1nrt6WI1
   hqen5CDj8mqWOtPYgTbWJvpwxnz2vwrN05Tqez203wsuYeXt1IE0X9D9d
   g==;
X-CSE-ConnectionGUID: urGoeAXDTaivnMJWnomEsg==
X-CSE-MsgGUID: fO6k5zgUQkyQxu9+8TBhLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70564213"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="70564213"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 01:54:30 -0800
X-CSE-ConnectionGUID: /uPQCNh+TY+54SwqBmU90w==
X-CSE-MsgGUID: oOdeRaRpTx+ETctxkEpfVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="207242420"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.122])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 01:54:24 -0800
Date: Mon, 26 Jan 2026 11:54:21 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Srinivas Kandagatla <srini@kernel.org>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Linus Walleij <linusw@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-iio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [RFC PATCH 3/4] treewide: convert hwspinlock users to the new
 consumer header file
Message-ID: <aXc5zVLkSAHT55Tm@smile.fi.intel.com>
References: <20260125184654.17843-6-wsa+renesas@sang-engineering.com>
 <20260125184654.17843-9-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260125184654.17843-9-wsa+renesas@sang-engineering.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linuxfoundation.org,baylibre.com,analog.com,gmail.com,linux.alibaba.com,foss.st.com,arndb.de,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-31055-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smile.fi.intel.com:mid]
X-Rspamd-Queue-Id: 2614C86506
X-Rspamd-Action: no action

On Sun, Jan 25, 2026 at 07:46:54PM +0100, Wolfram Sang wrote:
> Point the drivers to the new header file. No functional changes.

...

> +++ b/drivers/base/regmap/regmap.c

>  #include <linux/sched.h>
>  #include <linux/delay.h>
>  #include <linux/log2.h>
> -#include <linux/hwspinlock.h>
> +#include <linux/hwspinlock/consumer.h>
>  #include <linux/unaligned.h>

Can it be also moved to be a bit more ordered? (With given context like to put
it before log2.h).

-- 
With Best Regards,
Andy Shevchenko



