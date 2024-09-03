Return-Path: <linux-gpio+bounces-9606-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB449692F6
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 06:57:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2CA5B21F9B
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 04:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665F31CDFD7;
	Tue,  3 Sep 2024 04:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I0YPQt2y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1142904;
	Tue,  3 Sep 2024 04:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725339432; cv=none; b=YBrrrZ7f26/ipwFoO8lamkqi4aX1zH0fvUw0tZmUFiTILBSh3dpGtnH/LmNs/S0eHYdtzDIJ+liJzeYsYeBXrhtxn2Lxm694FCokY4UlrGzwKF7FCbMxmohbgOkDXjU/ZVEj9k1JFWTr6tVwYAudBTiMs+RTtAsptGyuqkox/No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725339432; c=relaxed/simple;
	bh=bd+sRLC6HH+A8wx6Pbv3VKtu9Vb/vHaKAATRLwePD4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YG8Cn1RqzHJnaruurFaOXXlM//JWEW+lCRayvilRy8dx6fUTj8lA6RlWrLlpmzgtF83UX/cWvoYY7+nF2Jn3+3et44+GKD8yXhHLYC3yDbSpt8r3z8vGEN13KBzmCAPiY4Nh8GK/nUlXQFAsS+1LN54m517VSn8/HmXB3VRY/7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I0YPQt2y; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725339431; x=1756875431;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bd+sRLC6HH+A8wx6Pbv3VKtu9Vb/vHaKAATRLwePD4I=;
  b=I0YPQt2yqtftiHKRuqNBPqM0MIkM3CN4ky6owL2ohjPkjsE4RrGd9Tue
   THXud9RddKTAHZV7OB465M+TnYFsUYRzA9gO3Q4ZiqnvMvS4WOsSSMjkI
   7b+Xkgt5LiYUbbB0vb7hr8nqQOsy2eM58mKTRvH5Mnz4eQtlDI3q5HPMr
   8AOFl1JSCMuhknopNodLFFhbtNHzW6yl3d7ZgxvpQrwb2/W5/0n0hE9Gp
   cB6gWdL4NEesRIl8sjWuOkonmM3qcsY7CYWs3BuezIhaZ+6pGN+L60y2D
   uhbPYg6AcI2eof5f9VD0Q283RHpGu2658t1DsR7aEKl2y5g4TDMGVRpux
   Q==;
X-CSE-ConnectionGUID: aiydig5OTpms4GMo9HYNFw==
X-CSE-MsgGUID: 2DkhcMTBSoSDbWZCC/Tl1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="13338055"
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="13338055"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 21:57:10 -0700
X-CSE-ConnectionGUID: Zv+/GkIvTFm9XtqP+ZPu3w==
X-CSE-MsgGUID: iE3SDYMtSvqltQkdLr19SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="64412398"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 02 Sep 2024 21:57:09 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id B0F341FA; Tue, 03 Sep 2024 07:57:06 +0300 (EEST)
Date: Tue, 3 Sep 2024 07:57:06 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] pinctrl: intel: Constify struct intel_pinctrl
 parameter
Message-ID: <20240903045706.GY1532424@black.fi.intel.com>
References: <20240902141607.2694988-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240902141607.2694988-1-andriy.shevchenko@linux.intel.com>

On Mon, Sep 02, 2024 at 05:15:11PM +0300, Andy Shevchenko wrote:
> -static void __iomem *intel_get_padcfg(struct intel_pinctrl *pctrl,
> +static void __iomem *intel_get_padcfg(const struct intel_pinctrl *pctrl,
>  				      unsigned int pin, unsigned int reg)

This is not good. You take const pointer but return non-const inside
that struct. I don't think we should "change" the constness this way.

All changes that take const pointer and return scalar are fine, though
(did not check all of them).

