Return-Path: <linux-gpio+bounces-9678-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5188396A37D
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 18:00:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 840D81C240ED
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 16:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93A84188594;
	Tue,  3 Sep 2024 16:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R1hloNs9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C7A2BB09;
	Tue,  3 Sep 2024 16:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725379251; cv=none; b=dhwEx26TL9HGznF7j7NLcl5q3J5cRdd1Jib3xxHhjTcnOiK9NON+mxYZPA/UNIm2cRYR+PJvm8uOqrMEREFWwG5ZBae3AgV7f/CpMTB2YOOvf9ctr36wQyXQ6I/BQz1IeDCTXSuXCXISABPDbzEbMcdSsOkmI8lqZokAEGwkeVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725379251; c=relaxed/simple;
	bh=Oew8IDhF6NxnCQa2ei5kdBgarOsXjY6eAd6r7gRPK/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oJZkR2xO7Jt7/ZbigyctHsM+9tVVQX2pt2WxkJ+vm+4x0Pc9EK+40u2VLOcV99Wxd8w8U2yI6repfAwPCYGbj8Iz+irKhV8PW/QLERyY/LiRmrdO4QXpZhj0jHNfYR+9HlCyxKYy8RO9YN0Zs1hd8a1/7SFFa9mJrNYvaB97IRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R1hloNs9; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725379250; x=1756915250;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Oew8IDhF6NxnCQa2ei5kdBgarOsXjY6eAd6r7gRPK/Q=;
  b=R1hloNs9zE5cpDttWJlEPZ9/gSibjsi0ConHO8QaQ8iPjHxshYiPbkg2
   tNwFTR2itdbAXoEPaxWYQfHD66lr7T3V/J4F2bh1t2IOKgkeL5TFuJukr
   Q4dzwbtSVe5MgKtoHMPnz0542EkxXlX93ReEY8zBsF7eJ/CT0pD/Gc7xv
   Rbi+PORKZK7t5fctxhVQpFt9WfSShw/wpbiz/Pnwr4HHQvVwAFhgDPspp
   v4psBXjleV/JYjWRV3vQSxwCcg/3RGZ5ISOc2Z+Z9Pkb34vU0bleQEjA0
   KDdIZ4N+w5Fh+GDwdEhJVgFpH5b5H7heg8cKm2Oycn7CQl/uMWa3o7iGP
   g==;
X-CSE-ConnectionGUID: nsZFZkS3SnCRKds8fVdsNA==
X-CSE-MsgGUID: 3v/qS2LjTzGf9qsgjKa3GQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="26905829"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="26905829"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 09:00:48 -0700
X-CSE-ConnectionGUID: HO7fN3G2SHekqfXha2S5Ig==
X-CSE-MsgGUID: N914ntmLSau3alqs+hN68w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="64630668"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 09:00:45 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1slVxT-00000004lIG-1JOJ;
	Tue, 03 Sep 2024 19:00:43 +0300
Date: Tue, 3 Sep 2024 19:00:43 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, heiko@sntech.de,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com, tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com
Subject: Re: [PATCH v3 00/12] gpio: rockchip: Update the GPIO driver
Message-ID: <Ztcyq2lb1YS43ncV@smile.fi.intel.com>
References: <20240903073649.237362-1-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903073649.237362-1-ye.zhang@rock-chips.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Sep 03, 2024 at 03:36:37PM +0800, Ye Zhang wrote:
> GPIO driver support acpi and new version, set input direction in
> irq_request_resources, fix division error and debounce config error.

Looking at patch 7 it seems the new feature has been barely tested.
First of all, I recommend to split out the real fixes for now and send them
separately while working on the rest. Second, perform better bisectability
(both compile and run time) and overall test coverage in different scenarios.

-- 
With Best Regards,
Andy Shevchenko



