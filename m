Return-Path: <linux-gpio+bounces-9068-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBED95D13A
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 17:19:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF5881F22D26
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 15:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E83D1188908;
	Fri, 23 Aug 2024 15:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GwHregNS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100591885A2;
	Fri, 23 Aug 2024 15:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724426350; cv=none; b=suWD3qGewbbnz4N0TWM3DISmTCcTPfwbD/bzqPIZbGzQYY9g0c9w+yeR9+krYe7/+ZDYC/fr3dH5BaN7Gio2R7el1piwBwl6iFnuwOlUJ0jsGKRDN+gx9U8zHVa6VLxvs2Zv4lmcmfTFZJ3sYryLA3uvidKsZ1tA5t//RcxCp3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724426350; c=relaxed/simple;
	bh=2ckHsWI1oHYPBboaJzPZNVzKNFhuQ7xoopUCRosW+sY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bFQoysIayx+Vwn5t7xb3gQOgc26Wlasjn2v+2tJ83F07PldBo16PpLUT0RkUmldWjNwCJSUNjM7377sgRGAervbZcawrCgEzbbtB/URfWi7+9F2IPeCr3ozLG12z37v6bZb+gRWZnCO9uxgBjEgDqTuKe6EhUc16STSsCvrEqaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GwHregNS; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724426349; x=1755962349;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2ckHsWI1oHYPBboaJzPZNVzKNFhuQ7xoopUCRosW+sY=;
  b=GwHregNSplo9bkhGQ9xb0krao7CDsuzUCFFKf5GQam40jeQcNe5pPakN
   ZZIqWpzL6M9BeIRB642vjUNHuwyR8+pC2FZfNAPp/tp5hKyx2Wc2uh3fk
   Z9ae/uAGf5h9D/ZD0cvWrGVKXDdDGP6XZ5q4UroMf+cB9L7OlQeU614uO
   muNBDLE2WOduF8gxbf4d/v6Y0VyOGFuHjAayv1MOZAxPQflrn4pY3Gj8u
   YQCRIWTNmS0gfTu7PjMqJnZi6JadL6z1J+nthK2i6a/kNHBqLTwIsqjeQ
   nwFbsM6kCkkFJaASO4ElEMSPc2FNGvAN/adFhFOmQO7PeUXQl2826hDnA
   A==;
X-CSE-ConnectionGUID: yAAGfWrfRayQrxStjtH0Kw==
X-CSE-MsgGUID: 1d/e6tIvTky7Kz/u8PR3IA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="23079890"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="23079890"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 08:19:05 -0700
X-CSE-ConnectionGUID: LRRY21N2RO2yaiHTgR/XWA==
X-CSE-MsgGUID: sLwt5anFT3+covv1bGovmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="62538212"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 23 Aug 2024 08:19:02 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 4792D209; Fri, 23 Aug 2024 18:19:01 +0300 (EEST)
Date: Fri, 23 Aug 2024 18:19:01 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Shen Lichuan <shenlichuan@vivo.com>
Cc: aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
	ping.bai@nxp.com, linus.walleij@linaro.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, linux-gpio@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] drivers/pinctrl/freescale: Use kmemdup_array instead
 of kmemdup for multiple allocation
Message-ID: <ZsioZW_EGO27zsWf@black.fi.intel.com>
References: <20240823013959.6281-1-shenlichuan@vivo.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823013959.6281-1-shenlichuan@vivo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Aug 23, 2024 at 09:39:59AM +0800, Shen Lichuan wrote:
> Let the kememdup_array() take care about

kmemdup_array()

> multiplication and possible overflows.

-- 
With Best Regards,
Andy Shevchenko



