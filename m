Return-Path: <linux-gpio+bounces-453-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4AD7F6BBA
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 06:34:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4E2B281868
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 05:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9226723A0;
	Fri, 24 Nov 2023 05:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FFWCXIFH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5476FD6F;
	Thu, 23 Nov 2023 21:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700804079; x=1732340079;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LH3PwsW1t1Y6hWbSRydDUMbWoG30hSVbvNfUjNQfvtE=;
  b=FFWCXIFHHT10hdorFDh2HeHSHLONI5FsRw1pC6/iYEVzriAPVSr+iH4x
   ucbsugna4s/eZwIRNFxC1KPIlWmsplzNCgqJXJXx+ge9twv9zhNhNYXyX
   659pGrLYbOETSybUx5U3ObQlA8aW68U03Oi3C1uOt2qyIDH7pRO6rtXcf
   n7jH22qjkrcgN7zw73iSTbLHEVf0NtR6UTl6cbRoR7u4aXW/Upp+88E7r
   Qmy0IgVWwQXhxkQ8qyGvYDeVVMFaTsRu4DqPzEnsOLuhbOWNiny4p5fnm
   tMAog9FHTlJzCiM+MiPvbKnjiwC//mAMtkrzAG5pS69LtKG5DSrn7OrS8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="458858004"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="458858004"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 21:34:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="890974106"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="890974106"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 23 Nov 2023 21:34:30 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 24759305; Fri, 24 Nov 2023 07:34:29 +0200 (EET)
Date: Fri, 24 Nov 2023 07:34:29 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] pinctrl: lynxpoint: Simplify code with cleanup
 helpers
Message-ID: <20231124053429.GH1074920@black.fi.intel.com>
References: <20231122175444.2316719-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231122175444.2316719-1-andriy.shevchenko@linux.intel.com>

On Wed, Nov 22, 2023 at 07:54:44PM +0200, Andy Shevchenko wrote:
> Use macros defined in linux/cleanup.h to automate resource lifetime
> control in the driver.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

