Return-Path: <linux-gpio+bounces-33194-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LQUJeXRsWnQFQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33194-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 21:34:45 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 32560269FCC
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 21:34:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 94A613020A70
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 20:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71994359A7B;
	Wed, 11 Mar 2026 20:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XaIKjO7H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307273019D9;
	Wed, 11 Mar 2026 20:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773261283; cv=none; b=BHhYODDBNJc8j+gBXDTZePTrx0zlA5opzr9wS/XX1S2vX44Y+auvXEfEHQg/Qu48Lk3lDgucYZh24Lxc23kc/0k03iU10oYtES6Ca4Tt6ejimCIrnxGJi8kMVNx8kYf7WWG3IoDBCTbzKw+G+b/wP8dMhOTNsgsHX0Y3NRuTxik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773261283; c=relaxed/simple;
	bh=nhGqnHBNhb6lR77jGSbn+iK+EoARzRmTjgeIKb+1+Xk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AXSzuRAzKgxrzH7fFdnMwpW7W2p9xdPsFO9VgKszeY80f782mHE7QxPcfNA1bimk1YiqOd5Z4DbZL8Auq1w/rjVbpyujCgJYYouVtMhS7wnpvIlRFPXE3rF11uueYE6orX8st7mXLLMpdEilQh/YMtN1kzWGMviaubwpIhsELJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XaIKjO7H; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773261280; x=1804797280;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nhGqnHBNhb6lR77jGSbn+iK+EoARzRmTjgeIKb+1+Xk=;
  b=XaIKjO7H7cfNRWIqcDUoKgXRdWTAbezhPFKq7+oxqGAAp3xYnoRcAIB8
   2QJPbAk5NZrS8gOZ1wYJ4b07ngWedH7ZeZ3JsrtkneGQ5fNQeQ+7WKE5Q
   t2j03DLQcggni9h0oI2P/G0ygtHvl1VCA4mhjmdcA1qMO2hm5UrrdoD10
   zzrVtBaN1y7XhXeUfBG5NpmGXdUbNJYo679sZploFAkqb4weI72ZHc3lL
   FEHgVMXPfItH+1heUFJAPgseCNN+tGZyFnWqVdfgJ3OQSEsNlgMxi1ElZ
   gCXgTxPWpTXfHymGBhpw9ol3Ox7ohWoo3ZKqa91FRO2D8ekKy2nhJCq3a
   Q==;
X-CSE-ConnectionGUID: fTKEjvcbQ1iy9K0Msc3Tdw==
X-CSE-MsgGUID: 9elzlPLDTMejiZo1pW7s+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="91916492"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="91916492"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 13:34:40 -0700
X-CSE-ConnectionGUID: WapVllgXS6m5Z/wQ8LZi4g==
X-CSE-MsgGUID: A82fTHGUTPKb2NkcgE/mzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="220760382"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.178])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 13:34:37 -0700
Date: Wed, 11 Mar 2026 22:34:34 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Linus Walleij <linusw@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	arm-scmi@vger.kernel.org
Subject: Re: [PATCH v3 7/7] gpio: add pinctrl based generic gpio driver
Message-ID: <abHR2nnC9jJWK2eW@ashevche-desk.local>
References: <cover.1773150895.git.dan.carpenter@linaro.org>
 <93920f541564bc4e6aaf0f2b6df2f5aca721d452.1773150895.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93920f541564bc4e6aaf0f2b6df2f5aca721d452.1773150895.git.dan.carpenter@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-33194-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ashevche-desk.local:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 32560269FCC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 10:39:24PM +0300, Dan Carpenter wrote:

> The ARM SCMI pinctrl protocol allows GPIO access.  Instead of creating
> a new SCMI gpio driver, this driver is a generic GPIO driver that uses
> standard pinctrl interfaces.

Similar wondering here... Can't this code be integrated with one of
the existing generic things, like gpio-aggregator?

I really don't want to see yet another generic code in this folder.

-- 
With Best Regards,
Andy Shevchenko



