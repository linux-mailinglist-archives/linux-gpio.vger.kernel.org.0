Return-Path: <linux-gpio+bounces-452-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4218E7F6BB8
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 06:31:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DC071C20AB7
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 05:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4BF020EA;
	Fri, 24 Nov 2023 05:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g9+3g8Wi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEB271BD;
	Thu, 23 Nov 2023 21:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700803897; x=1732339897;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tMYQUYRHJkiNfAgz4/JDUhm1l9MYuzStRUkLJeVL9CY=;
  b=g9+3g8WiTfO7Shsr4OzCfj/6y7cd6YvupbxnEcDYvDoKOO+4lCaHtsq5
   YtwHO0mxFAMk2ZjIIE4p+q5ntLG2vVpKEL50eQNH8ZaRQqFh217eDHPAy
   2lF0hDeRWbpKqmq1hqIvw4a+rFWxGDbYokmQPPQwKO+xtTqP8eYRnnqEG
   lzx1pxxPaVH1Djc87Lx8KWlX/QpFih9hWd3db64tnvPnrVEsMbDJ8mhIg
   KfDv/aXLhPqo/n2riToDpsb07mR89VTaiB5pUCTpOyPqeTzZa7J8TOO9h
   NR796TewhQWTSXHeOY9JMHJtqyzzFHnt33y+hMyK8e8S3CaGqe9nD9CZ8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="458857567"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="458857567"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 21:31:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="890972676"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="890972676"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 23 Nov 2023 21:31:34 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 8A33B1C7; Fri, 24 Nov 2023 07:31:33 +0200 (EET)
Date: Fri, 24 Nov 2023 07:31:33 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 3/4] pinctrl: baytrail: Move default strength
 assignment to a switch-case
Message-ID: <20231124053133.GF1074920@black.fi.intel.com>
References: <20231122175039.2289945-1-andriy.shevchenko@linux.intel.com>
 <20231122175039.2289945-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231122175039.2289945-3-andriy.shevchenko@linux.intel.com>

On Wed, Nov 22, 2023 at 07:50:38PM +0200, Andy Shevchenko wrote:
> iWhen ->pin_config_set() is called from the GPIO library (assumed

-i

