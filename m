Return-Path: <linux-gpio+bounces-9738-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9216D96B03F
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 07:02:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 500F3284474
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 05:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91FA5823AF;
	Wed,  4 Sep 2024 05:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CalP10dm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D5126AC3;
	Wed,  4 Sep 2024 05:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725426133; cv=none; b=R0ra4jgCca2oZzRqzd0JmP/UziONU2Fz+NW5FRBYlxUclwYG+YZIiqYEFBAhZ8w8LlzNvg1sUvqqi4kt5sUeixxTh3tsSuW/AxBVG92M6osrBD7QRbKrM5es/50VIej7OvPeJqojTIkK7M3Al/EF4valm//4534QDbWTBej3bJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725426133; c=relaxed/simple;
	bh=Yd9Jt5H6kqUswcUBovMB6X+MxDq0pfwHs2nZ6xATBjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fKkEQA+xgDtNd3dDhdXaFhJ0NXfnUG9AO35Lr3fkcnqKwdb7rZBfmeYLwltwwpTOgd8mlbUcUYgXKenThnVAkDIX/9Njf/NMwK27YQ/3WAtnf3S4r9cenbtfVHufH0DfSp+BExtnzZs/Hmkl9vEGpW1GhN1PTQScgyHp3UBV9vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CalP10dm; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725426132; x=1756962132;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Yd9Jt5H6kqUswcUBovMB6X+MxDq0pfwHs2nZ6xATBjc=;
  b=CalP10dmhLexlw4TMK4abl9BJMAULd/rHEvGM1Eg2YB56bs7qaGW8H9e
   DYItlQBIGVqLofa2mGIjJaoqK3jxpX6zUSDFQwn8gt+uqpZYuNaFTkBRf
   AZ0IexBIll4AHPAj8PGIL4b08AwIVdGx0DZKKmp6kRFpoy2adWRwle6g8
   dK6hhjOk21UoZovtctb6LlzJeLPsZ1NQwSztSoNVFXwOB0A/IPIsfWwgb
   ZY2ywxFRFbwHJRfA/u0HT6PdspFTOMSw8D/R78LVUoasrm2HvRNfxOU1V
   41T40oL/C/iARu3itO/U/zzyTkctAnP/o0B2ry9o8qvQO1RYklEuY0rc7
   A==;
X-CSE-ConnectionGUID: ReqrOP2RSlGQYNjlFldjhw==
X-CSE-MsgGUID: i5+cwwmER7O3XwJBwyefSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="46589207"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="46589207"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 22:02:11 -0700
X-CSE-ConnectionGUID: Dbw2Z8BFTCKsJ8NEvyn6Rg==
X-CSE-MsgGUID: pgEoj2/vTiy8PMgtfnIZsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="70001305"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 03 Sep 2024 22:02:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 9024D128; Wed, 04 Sep 2024 08:02:08 +0300 (EEST)
Date: Wed, 4 Sep 2024 08:02:08 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] pinctrl: baytrail: Drop duplicate return statement
Message-ID: <20240904050208.GA1532424@black.fi.intel.com>
References: <20240903154755.3460442-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240903154755.3460442-1-andriy.shevchenko@linux.intel.com>

On Tue, Sep 03, 2024 at 06:47:55PM +0300, Andy Shevchenko wrote:
> No need to repeat 'return ret;' inside and outside conditional.
> Just use one outside conditional for both cases.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

