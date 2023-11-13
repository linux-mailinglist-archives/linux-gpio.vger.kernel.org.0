Return-Path: <linux-gpio+bounces-50-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B55BB7E9B82
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 12:55:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 219CFB20BAF
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 11:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 699891D520;
	Mon, 13 Nov 2023 11:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K3S9fIz0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB971CF8C
	for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 11:55:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 039E5D71;
	Mon, 13 Nov 2023 03:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699876538; x=1731412538;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KuVJPrj65vfM4OV91+tDFxw3gKSD9D4VLoDkOciGoN8=;
  b=K3S9fIz0QZv3B65UHxsVU61YZxs3+RhGuD4Gl6d05bSCPjBpThsI9FeB
   WfBvYmBYRgZ/9bLorlv2JPq7s2J6a74fbsbEG393ssUr7rXQnP+Qoxpnx
   qznd/nPZggp60O6gjlC0+5VZ1sl3O+vR0VRTJsVMDvqotS7+gDOfbPMAb
   NVBdklHc+9qKHcGtb+vsajz9fdRXaspIvy0guz2dZZ1MXNz0V/c8c1B64
   8t8SCcuwVGXIijyZhZC2wzqM7jpraycg1C5mudAaWtr5VR4WATJIMaHI9
   /fkSFn5yAFMbZAVy5E9bKJ1WmKJIcXdLI/PbC++MYAJQgR6BsYI3dPojq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="394321270"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="394321270"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 03:55:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="881643458"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="881643458"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 03:55:33 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r2VXP-0000000DY4q-1ARc;
	Mon, 13 Nov 2023 13:55:31 +0200
Date: Mon, 13 Nov 2023 13:55:31 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] pinctrl: intel: Refactor
 intel_pinctrl_get_soc_data()
Message-ID: <ZVIOs0IooJ1zGBfR@smile.fi.intel.com>
References: <20231030155906.3492801-1-andriy.shevchenko@linux.intel.com>
 <20231101063643.GE17433@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231101063643.GE17433@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Nov 01, 2023 at 08:36:43AM +0200, Mika Westerberg wrote:
> On Mon, Oct 30, 2023 at 05:59:06PM +0200, Andy Shevchenko wrote:
> > Refactor intel_pinctrl_get_soc_data() to drop initial assignment
> > of the data variable. It's only used in ACPI case and instead
> > we may always assign it there as the ACPI ID table has the terminator
> > entry that has driver data set to NULL.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!


-- 
With Best Regards,
Andy Shevchenko



