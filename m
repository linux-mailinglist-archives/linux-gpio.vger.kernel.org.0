Return-Path: <linux-gpio+bounces-24361-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F74B24A7E
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 15:23:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87F9817963B
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 13:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 616D72E8DE4;
	Wed, 13 Aug 2025 13:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PTr5nIXi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7E62E8888;
	Wed, 13 Aug 2025 13:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755091073; cv=none; b=UB3oxqCQdM8k88uP8LBaqmFTs1OjMCMaxi8cAvIUQ/eAVApgTV1FjbJ4Gxh2FVPNZa6oguGrPGD9Hpd5K/7uwtMV7VfxdaEZ5PlXqTZyPRGplh2C8zS6H6G7J0535tpWf7WXUMuhIUqTTn1Z95UFXg+zAvt0weQ7XUKwC526Lzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755091073; c=relaxed/simple;
	bh=yMTV0LQo1tcRndZCuG8i9fEDOmsrxWYo7I7ez7sbtzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qrzToZ7KHnU4prfOStz5hRDa1LUOCFWjC8PtLr2d93voub7TzM8JF0J775yMKaSzygNXeN6zaRtrznjmaRO+R80qD7CU2nVkQNMkV0ntQB3oo7mIK1J0saUJv4v1TYzFNBLpBTgDAx3l2j7HzK8RXw/xP+kDfPoEzxNnlrcH2CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PTr5nIXi; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755091071; x=1786627071;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yMTV0LQo1tcRndZCuG8i9fEDOmsrxWYo7I7ez7sbtzY=;
  b=PTr5nIXiocFMmSREcZDyvNE9MRBDC3RhJ4PwFV3V+Z0gvjbsyViKdzaO
   HCQlpCsZ7AMw8Mu5M0c5CahuY9tkpzPBEM+b4o1XuoqlSAbpHw26FnYPi
   X1Zxs7J9W566I4R3b2PitWD0eWQdJp9rd0OxGBqiE9081E5US/uFEl/ro
   0vNwzSaEBj+a5UgcgEe/QGlLJhIdYLfRQi3LLPRdz0JRC61n2FSeqloLb
   fdVtg0BtujpwU01GxsN5w/2pXEVJVRtKX3tZdUAl2td6TErFUrKGG7O7Z
   ljoO3yoF3M2l+UAEpt2BlhyROFiT4rc06Zui4EDVHgaVlVBW5w/Xgg2iy
   g==;
X-CSE-ConnectionGUID: e5UnMWnATOSpmBo7l58MHQ==
X-CSE-MsgGUID: 0PPN/EeaSfCKfAj0NmlBFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="56407719"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="56407719"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 06:17:51 -0700
X-CSE-ConnectionGUID: pGgfaIpXRz2Sz2085zjb4g==
X-CSE-MsgGUID: 2lcKhnnBSc6XsVPdWJTrHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="166837125"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 06:17:49 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1umBMQ-00000005RVQ-3yL6;
	Wed, 13 Aug 2025 16:17:46 +0300
Date: Wed, 13 Aug 2025 16:17:46 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Liao Yuanhong <liaoyuanhong@vivo.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Rahul Tanwar <rahul.tanwar@linux.intel.com>,
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: equilibrium: Remove redundant semicolons
Message-ID: <aJyQevLQIs3Z1WVI@smile.fi.intel.com>
References: <20250812075444.8310-1-liaoyuanhong@vivo.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812075444.8310-1-liaoyuanhong@vivo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Aug 12, 2025 at 03:54:44PM +0800, Liao Yuanhong wrote:
> Remove unnecessary semicolons.

While this is a good one
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

...

>  	raw_spin_unlock_irqrestore(&pctl->lock, flags);
>  	*config = pinconf_to_config_packed(param, val);
> -;
>  	return 0;


...I would still keep a blank line before return. But I leave it to Linus to
decide or even amend when applying.

-- 
With Best Regards,
Andy Shevchenko



