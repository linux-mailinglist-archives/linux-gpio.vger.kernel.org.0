Return-Path: <linux-gpio+bounces-9559-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB87A968508
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 12:42:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D67A1C21967
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 10:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42EFF15FD13;
	Mon,  2 Sep 2024 10:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PqYl94ee"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544EC13B2A8;
	Mon,  2 Sep 2024 10:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725273770; cv=none; b=j7E3ZZEdLzEmaWqufsaH5sOiw2BrpQ/SDAzV0FW1wap182sgEGqDhsDHOhw09pHVL0ew11u10o9x64YMcz5ITIlLGY7eZwJT0yhQd+oPolJkzgVRD3W9u+gubYMy5fF8SeSjC0xbgNcKih8j72cUyOAB9hgbhnqBSfj6Y6mCUrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725273770; c=relaxed/simple;
	bh=xEEr5YhQ7ynEnYVBuIxwVvHOV4IpVINET57YBn2yaMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aa4y/L9U2ZzoyOdsMfiqdUYJ4Q8nvJYdB3zJNfAsDTjwA/VlOmT5T+nXUg2tGw3O4XvIEV+ZzmacQB+tVriXjaSOXSH0yMs+HokihK0ck5SQ8WbyGJoVlwTk159bAmbqmsJp6QyJ8xBINbTlWxtoqKTauGNOF5DB931EgOpMZu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PqYl94ee; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725273768; x=1756809768;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xEEr5YhQ7ynEnYVBuIxwVvHOV4IpVINET57YBn2yaMY=;
  b=PqYl94eerqxBAhJ89ijOIDtaCjm4IDqeiAQ+Rrz64mHBtHL9JfE/xqf3
   h1T39Icka8Vu4BBXKqDt9Jb3Sfx3OIUZ/pU5lhAWVIptOx7OVQTitTAPM
   8skfpYwHL0xAF1yWXj8E7L4RlGR3AezoIHoZ4G6rrPWroP4X3iXY1BZwi
   yWf3xHPBiJ84tHtRdu1l8SJDDEg0nM51Fw4kh3P6ndhMoJxosuh+1O5Z9
   DIAHoVk3qcaNKiEaLdBiDGItfZE4LnwdAqu5XlqSofAbFf6KZfRN5wSX4
   VCC4m6LBChAsqrGg82/0nuJin9Ok+tjnEgTZm+doct8TsK5292G3s7pJJ
   A==;
X-CSE-ConnectionGUID: AueGdtWmTASxbCcmAF2cng==
X-CSE-MsgGUID: LNxjQIXbT/2tOXdGDU2mqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="23802775"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="23802775"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 03:42:48 -0700
X-CSE-ConnectionGUID: HFGOjsiyR12c8rQn7iGr0A==
X-CSE-MsgGUID: o3T9W1tRRu+On6BWXH+Z/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="64576948"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 03:42:45 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1sl4WA-00000004KMH-0Pzl;
	Mon, 02 Sep 2024 13:42:42 +0300
Date: Mon, 2 Sep 2024 13:42:41 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linus.walleij@linaro.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, Shen Lichuan <shenlichuan@vivo.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	opensource.kernel@vivo.com
Subject: Re: [PATCH v1] gpio: stmpe: Simplify with dev_err_probe()
Message-ID: <ZtWWoT75zCSB4g1x@smile.fi.intel.com>
References: <20240829131051.43200-1-shenlichuan@vivo.com>
 <172527039219.21144.385699965145763717.b4-ty@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172527039219.21144.385699965145763717.b4-ty@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Sep 02, 2024 at 11:46:34AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> On Thu, 29 Aug 2024 21:10:51 +0800, Shen Lichuan wrote:

[...]

> Applied, thanks!

Be careful with patches from @vivo.com [1]!

This one in particular missed '\n' (and yes, I know that it's not an issue
for the ev_*() cases).

[1]: https://lore.kernel.org/linux-spi/20240829033511.1917015-1-11162571@vivo.com/
(read full discussion)

-- 
With Best Regards,
Andy Shevchenko



