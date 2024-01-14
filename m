Return-Path: <linux-gpio+bounces-2193-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A2682D0D5
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Jan 2024 15:11:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9F5E1F21532
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Jan 2024 14:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA98423BD;
	Sun, 14 Jan 2024 14:11:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BA623C2;
	Sun, 14 Jan 2024 14:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="403230632"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; 
   d="scan'208";a="403230632"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 06:10:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="1030418125"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; 
   d="scan'208";a="1030418125"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 06:10:57 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rP1CQ-0000000DuIc-2x0U;
	Sun, 14 Jan 2024 16:10:54 +0200
Date: Sun, 14 Jan 2024 16:10:54 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, brgl@bgdev.pl,
	linus.walleij@linaro.org
Subject: Re: [PATCH 0/5] gpio: uapi: documentation improvements
Message-ID: <ZaPrbi6GxqlfysWe@smile.fi.intel.com>
References: <20240109140221.77725-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240109140221.77725-1-warthog618@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Jan 09, 2024 at 10:02:16PM +0800, Kent Gibson wrote:
> This is a series of minor clarifications and formatting tidy ups for
> the GPIO uAPI kernel doc.
> 
> The series is intended as a companion to my character device
> uAPI documentation series, but makes sense on its own too.
> 
> The patches are self contained and trivial so not much to add here.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

for patches starting from the second one.

The first one I personally don't understand why, but I'm not a native speaker!
I believe, it's correct, although the original version seems okay to me.

-- 
With Best Regards,
Andy Shevchenko



