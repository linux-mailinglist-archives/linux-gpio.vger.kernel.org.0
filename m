Return-Path: <linux-gpio+bounces-454-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E8F7F6BBF
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 06:41:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7D6DB20D6D
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 05:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E57D23D5;
	Fri, 24 Nov 2023 05:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dETjZJfx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0336E101;
	Thu, 23 Nov 2023 21:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700804488; x=1732340488;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oVQwgv2ow7U2EuiQeF94cjR2sx9Q558B5162Jzqi6NM=;
  b=dETjZJfxTz8iHOTyyjXsxXtXFbLfMAmotA8qC45IbN9pqHf4lv21cMEe
   zputlPDJ4iRgCNn1rNwXG3KruPkf7ZZV0g69c4JirphqbBs6wKS7snqPO
   2rpZ4ZGYy5sNRebX8bCCFte7nFVaEomnx7UeD7rWFQzPkgsB2rZD16reC
   BQTprucHLZL3TJZyxf8jrkz/d2OnK24fjndM1c/yb6DD2VCyG1KdOPSrM
   fDozETJQWOYDdyrZYtIcpVoyPwbxEnO3mHhdBpRj+a9by9DJ4nX6zlFDq
   uoeEjhTUZiV4ck9n5Uf9IJcHlukzL7OdhugqKVxcox95B56+eW7Ezax8u
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="423505261"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="423505261"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 21:41:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="796494457"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="796494457"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 23 Nov 2023 21:41:25 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 20B2B1C7; Fri, 24 Nov 2023 07:33:39 +0200 (EET)
Date: Fri, 24 Nov 2023 07:33:39 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/4] pinctrl: baytrail: Fix types of config value in
 byt_pin_config_set()
Message-ID: <20231124053339.GG1074920@black.fi.intel.com>
References: <20231122175039.2289945-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231122175039.2289945-1-andriy.shevchenko@linux.intel.com>

On Wed, Nov 22, 2023 at 07:50:36PM +0200, Andy Shevchenko wrote:
> When unpacked, the config value is split to two of different types.
> Fix the types accordingly.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

There was one typo which I commented (please fix when applying).
Otherwise the series looks good to me,

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

