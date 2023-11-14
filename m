Return-Path: <linux-gpio+bounces-90-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B82A17EAF59
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Nov 2023 12:41:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9AF91C20845
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Nov 2023 11:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C57D73A28E;
	Tue, 14 Nov 2023 11:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CAQaDdBf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E249D224CD
	for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 11:41:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FCD4D9;
	Tue, 14 Nov 2023 03:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699962072; x=1731498072;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qd0JXalpGcwrYa5tsYwaquRc1lmCzBIUp6iekemYFyE=;
  b=CAQaDdBf3d1g622tAJGdJHJxbVXHeHEPuY/hut0aFM/uNGWKM6IH5u2q
   PmkyC+q1vEnQcU7BIGz5FDIW6NLe7HDQ2lH+V6K3MUq4fV+BXeBcf6Ytz
   TdJYDTafooshQ+5Fy2XCEJang17eSdtnemfpv8+T/qmPjLLz47l/GwTCF
   psJsuQUH/QVFzWUeGxB0N2TUVa9VuZrK50ahRwKTFS5W0rgT6OwINREq7
   MjK5BNWyv/gi23DHjLeaW2/Sr33VA+tuWxnDrGgvzbbOz8XBtvmvSxC4o
   hA4Q2N5AI0NyCsZBEAqx9tfH1aGqP7lW+/mqzGnLqHjOw0VDyK6SD88HI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="3742844"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="3742844"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 03:41:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="938053799"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="938053799"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 03:41:05 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r2rmv-0000000DnLW-4BEl;
	Tue, 14 Nov 2023 13:41:01 +0200
Date: Tue, 14 Nov 2023 13:41:01 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <yujie.liu@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/2] pinctrl: intel: Add a generic Intel pin control
 platform driver
Message-ID: <ZVNczZMruhh59Vfc@smile.fi.intel.com>
References: <20231113123147.4075203-3-andriy.shevchenko@linux.intel.com>
 <202311140345.etMnKZeR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202311140345.etMnKZeR-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Nov 14, 2023 at 09:46:07AM +0800, kernel test robot wrote:
> Hi Andy,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on linusw-pinctrl/devel]
> [also build test ERROR on linusw-pinctrl/for-next linus/master v6.7-rc1 next-20231113]

False positive as the dependencies appeared in today's Linux Next.

$ git tag --contains 22f57707fa0c
next-20231114

-- 
With Best Regards,
Andy Shevchenko



