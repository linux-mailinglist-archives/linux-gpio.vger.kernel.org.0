Return-Path: <linux-gpio+bounces-9091-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7130E95D5BA
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 21:02:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D9EF283583
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 19:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48027192B8D;
	Fri, 23 Aug 2024 19:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OKAIug6A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4629D192B86
	for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2024 19:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724439737; cv=none; b=Ogz7xBki8OpdXauoSWy4hKG40njED+grsRW7Nfe4KPNfczFl1Cy+pX4ncatjHFSi3QAgAmQ0fpXmvQfMA1QIaf2/+FYKS+tuj+lURiqqoVksnnQoAfQ/dde3C9kkf7p7b9SYhZkxf4rSp3JJD4VxM88GX2L9OGpt0VAJYGFmkhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724439737; c=relaxed/simple;
	bh=j4zCDtKYby5NAJbcfNgbzO3yEpthFCNJDa/eQ0M3KCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HY43YAgnUoLYQ+L7nLGTqbX2bkpMQJSxs+GP+ElhVHNR5TX+Ktaf7TBjEO2GdUYgCJV+N1pDvxhbxT4jgEhlEu4G3uFe+ByNBHd/BI3PqxXT3NbwWAICCQEdfZsakr2neqcTX/KQJ3XMRUcsrNEJjb2NFwJx5nfUxSDGS/BDatQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OKAIug6A; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724439735; x=1755975735;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j4zCDtKYby5NAJbcfNgbzO3yEpthFCNJDa/eQ0M3KCc=;
  b=OKAIug6ABdWo2xeMC75T+uOgcPtoTrST82Cs/a6aIHwhxysBU0aHFoSN
   iEmYRWpmIi/6BaHKqxn0UDMH6fZ7/YYuM9kFI+JimEr3E3pQE3gNh2eJu
   /lTGH5X4Dyw/T+JWxIFWfXiWNYHvxvW7RpXXLaJ2K/cRmEn52AJ6XNA6d
   y8euw3dxOT8LpsvPwMjTj3KD+aNZWl+UmB+9Z7O02YSfiZYkDf6Nvuy1O
   c0TXCKlaMS6BFVGoI2VZozOgsEc4btwoqh6bKRFjVnxtvAdOucv5hDiOl
   ofzbrPiVMmiDt10AWYG0lz9y8t2g9szA8v9Z7AZA+d4dgt4MsDpSr3yrY
   Q==;
X-CSE-ConnectionGUID: WuXD1PQcQwOvofjTH6WGvQ==
X-CSE-MsgGUID: bAoEzcTMSWKN+UNCzMieKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="40441415"
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; 
   d="scan'208";a="40441415"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 12:02:15 -0700
X-CSE-ConnectionGUID: gCubvebRS1u/V2B/X1gWxw==
X-CSE-MsgGUID: T9G8co4HSR2vF216h5lvpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; 
   d="scan'208";a="62047980"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 23 Aug 2024 12:02:12 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 0F505209; Fri, 23 Aug 2024 22:02:11 +0300 (EEST)
Date: Fri, 23 Aug 2024 22:02:10 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: linus.walleij@linaro.org, aisheng.dong@nxp.com, ping.bai@nxp.com,
	linux-gpio@vger.kernel.org, peng.fan@nxp.com, imx@lists.linux.dev,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH v3] pinctrl: imx: Switch to LATE_SYSTEM_SLEEP_PM_OPS()
Message-ID: <ZsjcshzPkRXv5mBR@black.fi.intel.com>
References: <20240808162750.244092-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240808162750.244092-1-festevam@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Aug 08, 2024 at 01:27:50PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Replace SET_LATE_SYSTEM_SLEEP_PM_OPS() with its modern
> LATE_SYSTEM_SLEEP_PM_OPS() alternative.
> 
> The combined usage of pm_sleep_ptr() and LATE_SYSTEM_SLEEP_PM_OPS() allows
> the compiler to evaluate if the runtime suspend/resume() functions
> are used at build time or are simply dead code.
> 
> This allows removing the __maybe_unused notation from the runtime
> suspend/resume() functions.

...

>  const struct dev_pm_ops imx_pinctrl_pm_ops = {
> -	SET_LATE_SYSTEM_SLEEP_PM_OPS(imx_pinctrl_suspend,
> -					imx_pinctrl_resume)
> +	LATE_SYSTEM_SLEEP_PM_OPS(imx_pinctrl_suspend, imx_pinctrl_resume)
>  };
>  EXPORT_SYMBOL_GPL(imx_pinctrl_pm_ops);

Can go even further

	EXPORT_GPL_DEV_PM_OPS(...) = {
		LATE_SYSTEM_SLEEP_PM_OPS(...)
	};

-- 
With Best Regards,
Andy Shevchenko



