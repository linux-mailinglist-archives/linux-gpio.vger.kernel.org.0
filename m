Return-Path: <linux-gpio+bounces-483-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA54D7F736E
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 13:08:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 949B2281874
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 12:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C53A123768;
	Fri, 24 Nov 2023 12:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ea6Rz1oK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7878E18B;
	Fri, 24 Nov 2023 04:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700827699; x=1732363699;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lTasg4zfwuBp5HNu3rjNfYk3zMkCWqUCjRSpE0sPDnM=;
  b=Ea6Rz1oKTz3kYYF93vJYeJVEdOvGCjjyi+wz1guN6KO3GfKSgw1nl/tx
   jAHoKzxEpTLwmeD37Xo/v2PDqBkYhLtT0uVk/CfKw872zkhoxIa8NmNg4
   AJStIXg3gIVSASmtdv3Tt02ylqnDKqyBGVULWbHb9jHvUyqPp5uWcQiAE
   EMqZZB55wyFvhHFjEgFUf+7kDJqu/asI9IqqkMFiUxrbiFYCX4qGPPxqk
   Y9nmtYqiA5MqWGjq9ChlMjD6RO2ooK7m0gp7igY+cQFcH0NJyESfW/zax
   AS6fPBhAUAwp6hjqBmxDm9Mpb+AnlmY5GMCdGePguxUAfrCh/rFHProuE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="395229459"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="395229459"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 04:08:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="771241593"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="771241593"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 04:08:11 -0800
Date: Fri, 24 Nov 2023 14:08:05 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] pinctrl: tangier: simplify locking using cleanup
 helpers
Message-ID: <ZWCSJQoJ1m9PtF_e@black.fi.intel.com>
References: <20231123140212.12135-1-raag.jadav@intel.com>
 <20231123142816.GE1074920@black.fi.intel.com>
 <ZWCEXZrgafGqwBKT@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZWCEXZrgafGqwBKT@smile.fi.intel.com>

On Fri, Nov 24, 2023 at 01:09:17PM +0200, Andy Shevchenko wrote:
> On Thu, Nov 23, 2023 at 04:28:16PM +0200, Mika Westerberg wrote:
> > On Thu, Nov 23, 2023 at 07:32:12PM +0530, Raag Jadav wrote:
> > > Use lock guards from cleanup.h to simplify locking.
> > > 
> > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > 
> > Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> Pushed to my review and testing queue, thanks!

Awesome, I noticed a few commits having duplicate Acks in Intel tree.

Raag

