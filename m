Return-Path: <linux-gpio+bounces-1485-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9EB8134BB
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 16:28:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0905F1C20C50
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 15:28:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFFA55CD16;
	Thu, 14 Dec 2023 15:28:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B43510F;
	Thu, 14 Dec 2023 07:28:01 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="397917991"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="397917991"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 07:28:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="892507728"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="892507728"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 07:27:58 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rDncy-00000005sVg-1Tny;
	Thu, 14 Dec 2023 17:27:56 +0200
Date: Thu, 14 Dec 2023 17:27:56 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, brgl@bgdev.pl,
	linus.walleij@linaro.org
Subject: Re: [PATCH v2 5/5] gpiolib: cdev: improve documentation of get/set
 values
Message-ID: <ZXse_GEyDOo_bR3q@smile.fi.intel.com>
References: <20231214095814.132400-1-warthog618@gmail.com>
 <20231214095814.132400-6-warthog618@gmail.com>
 <ZXsbZOEjpTN_8oZQ@smile.fi.intel.com>
 <ZXsd1Uhzg328Zdsy@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXsd1Uhzg328Zdsy@rigel>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Dec 14, 2023 at 11:23:01PM +0800, Kent Gibson wrote:
> On Thu, Dec 14, 2023 at 05:12:36PM +0200, Andy Shevchenko wrote:
> > On Thu, Dec 14, 2023 at 05:58:14PM +0800, Kent Gibson wrote:
> > > Add documentation of the algorithm used to perform scatter/gather
> > > of the requested lines and values in linereq_get_values() and
> > > linereq_set_values_unlocked() to improve maintainability.
> >
> > I believe this is based on the old discussion in the thread where I proposed
> > the patch to convert this (unreadable in my opinion) code to use bitmap APIs.
> 
> I believe you are correct - that the code is unreadable in your
> opinion.  And I noted that you were the origin of this change in the
> cover letter.
> 
> I'm not usually comforable with this level of hand holding, but I made
> an exception in your case.

At least it helps somebody to understand that, thank you!

-- 
With Best Regards,
Andy Shevchenko



