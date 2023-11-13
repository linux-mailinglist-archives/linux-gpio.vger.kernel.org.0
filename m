Return-Path: <linux-gpio+bounces-77-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7207EA0C0
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 16:58:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3BFB1F21A1A
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 15:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8306F21A14;
	Mon, 13 Nov 2023 15:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="llTF/xRO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82C521A0E
	for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 15:58:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A65D910DA;
	Mon, 13 Nov 2023 07:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699891127; x=1731427127;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N7kzXyIt0QpnYXS9pgj96jxoxq8wbs0NMfKL/kdARyc=;
  b=llTF/xRO7O7Ms0+N+EOg3tneafedQT5ZP31M2UofVtYKre/m/exStbht
   BbW1CxuC2BcTv7o4V3/VzrNaJhHsNtW9SbuPiFmuBdnGYDcYUGLAfV650
   SDPvVzILSzdWLXvn+a1U+8typ9CpN578fefP8THZnjBlgBXDHQSo3Cq0Z
   I6TTd2fSltfdi2QKGT+IXfLImo4ZKoqBCSR2Bydfzs0Q/Q7KR2QGnYxub
   WXFJs1UuP0rZZKPxVKlOTlD54149Rz8/JL2sLz1bJAUrnbgKMvDojrMst
   NowhlB+3wTPxTfLIxYk8q4Jd6JOaUfBNZUSZEfqcjtIGs8lalnK1FRwoA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="12010577"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="12010577"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 07:58:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="908081388"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="908081388"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 07:58:37 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r2ZKd-0000000DbDj-05eK;
	Mon, 13 Nov 2023 17:58:35 +0200
Date: Mon, 13 Nov 2023 17:58:34 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl,
	mika.westerberg@linux.intel.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, mallikarjunappa.sangannavar@intel.com,
	bala.senthil@intel.com
Subject: Re: [PATCH v1 0/3] Use the standard _PM_OPS() export macro in Intel
 Tangier GPIO driver
Message-ID: <ZVJHqrj5OzoWav5Z@smile.fi.intel.com>
References: <20231113131600.10828-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231113131600.10828-1-raag.jadav@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Nov 13, 2023 at 06:45:57PM +0530, Raag Jadav wrote:
> This series exports pm_ops structure from Intel Tangier GPIO driver using
> EXPORT_NS_GPL_SIMPLE_DEV_PM_OPS() helper and reuses it into its users.

Yet you missed --base...

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko



