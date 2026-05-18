Return-Path: <linux-gpio+bounces-37013-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCryGZy6CmoB6QQAu9opvQ
	(envelope-from <linux-gpio+bounces-37013-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 09:07:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C766256729A
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 09:07:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05ECA3024110
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 07:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B07413CDBC3;
	Mon, 18 May 2026 07:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nRLz8DEM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153EC3C8705;
	Mon, 18 May 2026 07:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779088022; cv=none; b=eLWFmHS/D9pOzhuR+DElp6y2mY2h02xQhz91ys86agS8tufgjLYe4gxMcgOaOPzXIPc5xsDE+lIjokZUAgpZ13cjc8QFgsaxzUXBPHq5MrUw6fYHGaN5QVViZd+STZn8gnCicVhKa7EwdzfDIrTIpptp0zIFbL5DeG1RJ/gmlzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779088022; c=relaxed/simple;
	bh=DHEXSoOOKkUMqT/tGbgYU6CT2Xzxq45MhRBO5p8YVEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z1tWg7JFQ8dqPz67HtXmoIYbNdpv4Lbi6/piB2uVNoaRmdSFxNJ6NINF/U+N7f1zR4W2hegjzB1EU5YKmaZ6bwnV1VON/ynm5UWNX4ajkrqlN/4waT7O0Z8suPqpr4YRFTYnaB2xfGT3M5g7Y2FYs47k4wrvRSP3hasWzMYQ1eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nRLz8DEM; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779088021; x=1810624021;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DHEXSoOOKkUMqT/tGbgYU6CT2Xzxq45MhRBO5p8YVEs=;
  b=nRLz8DEMu4evWbOio9ssxvEWZrYm6gom6HIgZtDUcK78Xrb/fJJsVQxq
   S+W0+b/J3SJiUonfuWdwWDd+6k9G/63tenHowL5yg5DIZ17Ut+P+TQoJM
   ho9yiRxc852zOGbgk3cFX5Yv/4s2L4Q1pF383EOmaoFifbFD/mOIZh82c
   3HaQKQhdem20nMWqWBsLxHnInc3Na4NVPXWrgypWxNK/mzO1PqBCCw4Qb
   qPCxnp8SAAUhuJFZnWlZllYfmrZOCxuQgvRYPyGkTxQaYQbQX9+1O2uZk
   tirIAHwhaxRUggPD90XDdI32Wn9jK6W9j4+W97oZRyCTtdMJGtQIOld+7
   A==;
X-CSE-ConnectionGUID: uXYFn3wxQxqWkJKrVCkdPA==
X-CSE-MsgGUID: +Clt3y6fQ9Ook1NbjVgCqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="79071954"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="79071954"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 00:07:01 -0700
X-CSE-ConnectionGUID: 4aB3IFbWRQmirTs3dKaemQ==
X-CSE-MsgGUID: /1LULbm8QcCF27Gtwo19dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="241163221"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.3])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 00:06:33 -0700
Date: Mon, 18 May 2026 10:06:31 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Hardik Prakash <hardikprakash.official@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, wsa@kernel.org,
	mario.limonciello@amd.com, brgl@bgdev.pl, basavaraj.natikar@amd.com,
	linus.walleij@linaro.org
Subject: Re: [PATCH v3 0/1] i2c: designware: fix probe ordering for AMD GPIO
 on Lenovo Yoga 7 14AGP11
Message-ID: <agq6d6W-o-U6hoJl@ashevche-desk.local>
References: <20260515161516.10474-1-hardikprakash.official@gmail.com>
 <agmPrF0IClOpDYlR@ashevche-desk.local>
 <CANTFpSWMjz-V_oOsP+7Ww57vhdDVwq0nJ0icQnp3qSq7-=yFRQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANTFpSWMjz-V_oOsP+7Ww57vhdDVwq0nJ0icQnp3qSq7-=yFRQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: C766256729A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37013-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Sun, May 17, 2026 at 10:38:57PM +0530, Hardik Prakash wrote:
> On Sat, May 17, 2026 at 15:21, Andy Shevchenko wrote:
> > On Fri, May 15, 2026 at 09:45:15PM +0530, Hardik Prakash wrote:
> > > v3:
> > >  - Patch 2 only (patch 1 already in Linus Walleij's tree)
> >
> > The patch numbering is broken. Where did 2/2 come from?
> 
> Both patches are committed in my local tree. git format-patch counted
> both commits and numbered this 2/2. I excluded the 0001 file from the
> git send-email call since patch 1 is already in Linus Walleij's tree,
> but the numbering carried over from the two-commit series.

Don't do like this. New version should use proper --base and hence be only
1 patch. We do not confuse people by ghost patches.

> Apologies for the confusion. If preferred I can resend with 1/1
> numbering by dropping patch 1 from my local branch before running
> format-patch.

Make sure you base your tree on the official Linus Walleij's one, this will be
depicted in the cover letter when you supply proper --base to git-format-patch.

-- 
With Best Regards,
Andy Shevchenko



