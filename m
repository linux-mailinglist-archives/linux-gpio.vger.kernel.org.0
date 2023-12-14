Return-Path: <linux-gpio+bounces-1480-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B62A881343A
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 16:11:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E88211C208E9
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 15:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 955125C091;
	Thu, 14 Dec 2023 15:10:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CE27111;
	Thu, 14 Dec 2023 07:10:28 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="426261795"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="426261795"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 07:10:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="774400393"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="774400393"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 07:10:26 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rDnLz-00000005sIR-1rWc;
	Thu, 14 Dec 2023 17:10:23 +0200
Date: Thu, 14 Dec 2023 17:10:23 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, brgl@bgdev.pl,
	linus.walleij@linaro.org
Subject: Re: [PATCH v2 4/5] gpiolib: cdev: reduce locking in
 gpio_desc_to_lineinfo()
Message-ID: <ZXsa39xneH6Rh7Gd@smile.fi.intel.com>
References: <20231214095814.132400-1-warthog618@gmail.com>
 <20231214095814.132400-5-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231214095814.132400-5-warthog618@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Dec 14, 2023 at 05:58:13PM +0800, Kent Gibson wrote:
> Reduce the time holding the gpio_lock by snapshotting the desc flags,
> rather than testing them individually while holding the lock.
> 
> Accept that the calculation of the used field is inherently racy, and
> only check the availability of the line from pinctrl if other checks
> pass, so avoiding the check for lines that are otherwise in use.

...

> -	spin_lock_irqsave(&gpio_lock, flags);

Shouldn't this be covered by patch 1 (I mean conversion to scoped_guard()
instead of spinlock)?

-- 
With Best Regards,
Andy Shevchenko



