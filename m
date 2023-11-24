Return-Path: <linux-gpio+bounces-479-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C51BF7F729C
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 12:22:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F764281BA0
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 11:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FCF71CFA9;
	Fri, 24 Nov 2023 11:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d4ksl9FB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23491D5A;
	Fri, 24 Nov 2023 03:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700824966; x=1732360966;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9yjNfQtfB2BdmFrIHFcnhCyo9oYVHddulRbdnt91E0Q=;
  b=d4ksl9FBJtYTKGe0H0IJ6FL9UrFMWcujG4U1WfLIyK3cTd67XAdB/MQc
   NSheSS3maVcZjW/ZbrHVPgl7GDFIS852nWJGxXxsbhUWhFoic0BvxDylA
   9fKXgAX8HBhRbKzrlXgMlIHm2kg9Ff2w82X+hPQ+ICZQOJ7buqBB6GP3p
   WFUDL7afz8Wy5KtQlwxclZTGysXAlqr7xpk/94w9Br0YblKGrfKHLbbfE
   mtn42hMbzf9jyUm83FZi3KI73+aJBfEnhmK5PzIMhHnhmtr7nz91ULGBE
   JzyqlHcaHDwBip7ZQFdyQDYAlvVkbt1sfjH8Nmt+cIqdNc/xbmrqzKflW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="395224903"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="395224903"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 03:22:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="1099064791"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="1099064791"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 03:22:43 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r6U3h-0000000GhBM-37mm;
	Fri, 24 Nov 2023 13:09:17 +0200
Date: Fri, 24 Nov 2023 13:09:17 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>, linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] pinctrl: tangier: simplify locking using cleanup
 helpers
Message-ID: <ZWCEXZrgafGqwBKT@smile.fi.intel.com>
References: <20231123140212.12135-1-raag.jadav@intel.com>
 <20231123142816.GE1074920@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231123142816.GE1074920@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Nov 23, 2023 at 04:28:16PM +0200, Mika Westerberg wrote:
> On Thu, Nov 23, 2023 at 07:32:12PM +0530, Raag Jadav wrote:
> > Use lock guards from cleanup.h to simplify locking.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko



