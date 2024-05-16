Return-Path: <linux-gpio+bounces-6410-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DC08C77F4
	for <lists+linux-gpio@lfdr.de>; Thu, 16 May 2024 15:54:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A88E1F21E92
	for <lists+linux-gpio@lfdr.de>; Thu, 16 May 2024 13:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03BD2147C74;
	Thu, 16 May 2024 13:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gz1BKpbF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB231143886;
	Thu, 16 May 2024 13:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715867686; cv=none; b=ngpmMeTcfgkZQ5LXwxS7/CvhKQNGTKIEGRYuEPtSwgjOBYzGPktoF8TbPRKFWa/tQs6NEjnXESuCfFhIdcBg9Fot3p4bTnHUZyMqW/RlpIfe+0l8FIsZFnwjsE+rzkCoNuVHWJKK+FO7aiMmxBXbQI5//1Nf+BgAjVco1XYDemM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715867686; c=relaxed/simple;
	bh=+/sGHoVHNh7aDbg74jwHs3yv+dQdkDY6SZT5+s9g1/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SMfu6Xz9xkxzVffYX5i3/85B8ZYsxv36Y+Dx+9UuvvH7QGCK0oepxL8iZvG0FcOKJPemKEbpBsP93KBZ1eGhyprm62c+WYXjmrEMZeBstqM8HI+8qjl7uREj8JYgaBBCzXVEww+bD8feRvjaOsjuI7i8daxRqXJpHqB1zlT1VWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gz1BKpbF; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715867685; x=1747403685;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+/sGHoVHNh7aDbg74jwHs3yv+dQdkDY6SZT5+s9g1/M=;
  b=gz1BKpbFnY+FmpztnptLByZKBe35QeEkuqbrYQLryDhx+tCELy/lGT8y
   SxExYcCfhy9dDDHZBHTT5HOBF2/u1ffyhtxu4VeGAedYZBGYW3p9JcUBF
   9rNf7/YrmIzL6McB212cWA0mREaRiBEghG7sm8qgxtExVwW4wugxQJXrf
   j/XlZEfwerp6+lOMXLpUhON3RHdSZfF1kTIKFurc3fDc3NEyeDGmrfnlu
   RqcktvScs2oE49NKb76bO/W7WRxoRhzcZynIfLXldeCtM9ggq49aPyel+
   lf8FQzCEs+3ezc6mhD/CNKv/xzB1DWbjn5Bw9jwMykmFUK0FxOfSTzcPA
   w==;
X-CSE-ConnectionGUID: lyYJu9U7Qn2pUv7O/peESQ==
X-CSE-MsgGUID: ByKj6GvsSJCaHnqMHd5Mug==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12190229"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="12190229"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 06:54:44 -0700
X-CSE-ConnectionGUID: pBlz2EjuTyyvjt6hpl+yQA==
X-CSE-MsgGUID: L/cy23MOSQK7TU5pBtUfEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="36214456"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 06:54:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s7bZ8-000000084Xq-1boe;
	Thu, 16 May 2024 16:54:38 +0300
Date: Thu, 16 May 2024 16:54:38 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vegard Nossum <vegard.nossum@oracle.com>,
	Kent Gibson <warthog618@gmail.com>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <siyanteng@loongson.cn>
Subject: Re: [PATCH v1 1/1] gpio: Remove legacy API documentation
Message-ID: <ZkYQHnF76WLIf8-r@smile.fi.intel.com>
References: <20240508101703.830066-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240508101703.830066-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 08, 2024 at 01:17:01PM +0300, Andy Shevchenko wrote:
> In order to discourage people to use old and legacy GPIO APIs
> remove the respective documentation completely. It also helps
> further cleanups of the legacy GPIO API leftovers, which is
> ongoing task.

Bart, Linus, Kent, what do you think about this?

If there is a positive consensus, I would even dare to go for v6.10-rc2
with it.

-- 
With Best Regards,
Andy Shevchenko



