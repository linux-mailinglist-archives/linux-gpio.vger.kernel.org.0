Return-Path: <linux-gpio+bounces-32318-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIvpNT61oWmMvgQAu9opvQ
	(envelope-from <linux-gpio+bounces-32318-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 16:16:14 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4D41B98B3
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 16:16:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0781317D91C
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 15:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6D7C42EEC5;
	Fri, 27 Feb 2026 15:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SKog+K61"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC4C438FED
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 15:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772205013; cv=none; b=FEJy2YT77r7D2wxAjgqfSRAsOVItwxd2m5soPWsBVBOdDwkSRXIDnJpWRpnlxDPdL3NxVTfF3KFgpyc2++tXu1Y7VtdnH7XNz+5TLwWgg9hFXglthrqQvpUzJdjJ1z6+NKu/yFPDP9d4XRP0xVqlQx7h1u3Ka9bS/O2AcvfZh9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772205013; c=relaxed/simple;
	bh=GQmfSHcKDy0GffPbgpng0PxRwNUSytHhkEYddj7FZ0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h/z+gtS4RqBmTcCgt9VEvp2wP8nkKLJr38jlMndX6tAgCF959EygtsRq2k5QId4Md7RCHDVXEL82ehpA3Hjdb63TIrxeuWL5yf+gDuaZPFLAT38x3rdIvWzPsnyJIhmAZutNfj9TDjcoKikxf/ggsq4sBwWlYrwAzmBhnRcJtY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SKog+K61; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772205012; x=1803741012;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GQmfSHcKDy0GffPbgpng0PxRwNUSytHhkEYddj7FZ0I=;
  b=SKog+K61GperPvvKjfQCRh0oMpgPnEl05cQrIXTJfmff1WhalC2tDPfD
   EfI7GEWngLXWuHDnDwsTtETFIwUxNCabDWk8n7mxOKwpdFtZk0VNVW+7U
   D8XuQiYlIv1ETiJocf4XsSJLfwxR/JNvf8v/cBIBOhEnmoHYNjTQ+O/sF
   lmEzefdU+ZCJ5Tfz8FTp7yp9p8vYLB18xEYzJ715bX33KjbsoNus7cmCO
   EbNQzukOKk7NLzgtu/RNKGgyDLK5XjuZ8MCqkZkORkeZhaJvAWJVl/V+S
   49xNZPKtcve/8+D+ocep0VeXWT3fRAnkTJry4Dy/7aatRIIcRCpi98x9l
   g==;
X-CSE-ConnectionGUID: D6qOVvrYQzG0L3nwk9babw==
X-CSE-MsgGUID: gNGKuM0kSFyV/Yf9liD1sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="76897922"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="76897922"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 07:10:11 -0800
X-CSE-ConnectionGUID: k1wNGAb+TcySWkVIUwcShA==
X-CSE-MsgGUID: bFCQlblcQnSyEp+VrFhWzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="247434646"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.180])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 07:10:09 -0800
Date: Fri, 27 Feb 2026 17:10:06 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
	Patrick Rudolph <patrick.rudolph@9elements.com>
Subject: Re: [linusw-pinctrl:devel 16/22]
 drivers/pinctrl/pinctrl-cy8c95x0.c:1325 cy8c95x0_irq_setup() warn: passing
 positive error code '1' to 'dev_err_probe'
Message-ID: <aaGzzsLMeW2DTjiE@ashevche-desk.local>
References: <202602271847.vVWkqLBD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202602271847.vVWkqLBD-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32318-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: 4B4D41B98B3
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 02:40:45PM +0300, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
> head:   a901e8705f89f3616fad3bb6aeddba33be86b08a
> commit: 014884732095b982412d13d3220c3fe8483b9b3e [16/22] pinctrl: cy8c95x0: Unify messages with help of dev_err_probe()

False positive. This commit didn't change the previous behaviour. Perhaps
smatch complained earlier?

But thanks, I'm going to address this right away!

-- 
With Best Regards,
Andy Shevchenko



