Return-Path: <linux-gpio+bounces-93-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BDF7EAF93
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Nov 2023 13:00:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1669B28119D
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Nov 2023 12:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 003AB3D3B4;
	Tue, 14 Nov 2023 12:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FVMgX2F0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0E53C68A
	for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 12:00:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB61E132;
	Tue, 14 Nov 2023 04:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699963209; x=1731499209;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b27aR23QnMlnn3EqrFF72aKDu4+Fvfh3kQ7lTwG6N7Q=;
  b=FVMgX2F0jJv6XF5kKatB0Mdd/sqonGpgfct9AEGwX924OOY70iWnz3T3
   6VtBnMUjGjYmyDgWnGQjLcuwwjOydZulRcH1kIp2QOEdObgLNVgiCQfwN
   vUwHBrAx5ZvtuYuGPdbbUaVf+9XrEXxKSZZDeZaltPcM+/dE2kROmtJ3z
   szfHICquT3E4aK65y/toTvwYlBg6WKjlzrfNCpEjDoJyiR3aAzZ3niGiy
   UuO6yAyMD7QjZ/iWmaPTub9oYA4xNERAm9jpSUo8uQ6WIyUEBBhQkZDNY
   SK1b8NwkRM7TzcsS+tuuShOue81SvKOfFkHLwcwBPn9dbNE9lTBXEqp4j
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="9279355"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="9279355"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 04:00:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="1096074227"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="1096074227"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 14 Nov 2023 04:00:05 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id EF6475C2; Tue, 14 Nov 2023 13:50:24 +0200 (EET)
Date: Tue, 14 Nov 2023 13:50:24 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: kernel test robot <yujie.liu@intel.com>,
	Raag Jadav <raag.jadav@intel.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/2] pinctrl: intel: Add a generic Intel pin control
 platform driver
Message-ID: <20231114115024.GV17433@black.fi.intel.com>
References: <20231113123147.4075203-3-andriy.shevchenko@linux.intel.com>
 <202311140345.etMnKZeR-lkp@intel.com>
 <ZVNczZMruhh59Vfc@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZVNczZMruhh59Vfc@smile.fi.intel.com>

On Tue, Nov 14, 2023 at 01:41:01PM +0200, Andy Shevchenko wrote:
> On Tue, Nov 14, 2023 at 09:46:07AM +0800, kernel test robot wrote:
> > Hi Andy,
> > 
> > kernel test robot noticed the following build errors:
> > 
> > [auto build test ERROR on linusw-pinctrl/devel]
> > [also build test ERROR on linusw-pinctrl/for-next linus/master v6.7-rc1 next-20231113]
> 
> False positive as the dependencies appeared in today's Linux Next.
> 
> $ git tag --contains 22f57707fa0c
> next-20231114

Okay thanks for checking!

The series looks good to me so feel free to add,

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

