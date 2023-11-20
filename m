Return-Path: <linux-gpio+bounces-257-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9207F120D
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Nov 2023 12:33:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF8861C2173B
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Nov 2023 11:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FDCA14AB0;
	Mon, 20 Nov 2023 11:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GWI6uDWp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF1009D;
	Mon, 20 Nov 2023 03:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700479995; x=1732015995;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LkgwfC9q+Fm8LcV+fAvpsTxPWqX3sTwTmzLmwkZ+BNc=;
  b=GWI6uDWp0VFHMjB8DjswmjZZoiwK7Z1/Hrsq459h5BUEv0BZCKQ0ScFl
   XjIbLRUYM2eAeUX7HdZ2Dpl5lhtfeM8n3vfTh2i+TAAcZLefv9BH7EKgv
   8oJSkYFlNjlR+RBTFQDU7+mqckHIxTf7W0djcUZLtqGR0FTaiGNf2eHDb
   qEp8LvvYmNyiIT/W2hEbyo8/Dn8BL+HlWWW0JMHlZdn1jG2KNApgaB1qS
   6fuCiB5bVAGEea5BMGk8gqmFbJ90cYHw6Nzyd8nlA8V6IBB9tdpPdZLDP
   +QVkqid+w/FNowcEc5390lJKyTwphVYk0ISGdLF+CZX2sz+2B99RzT362
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="381989519"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="381989519"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 03:33:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="742697708"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="742697708"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 03:33:13 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r52Wc-0000000FXGt-09EJ;
	Mon, 20 Nov 2023 13:33:10 +0200
Date: Mon, 20 Nov 2023 13:33:09 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>, linus.walleij@linaro.org,
	brgl@bgdev.pl, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] gpio: tangier: simplify locking using cleanup helpers
Message-ID: <ZVtD9elOfE1Uxgib@smile.fi.intel.com>
References: <20231118072037.10804-1-raag.jadav@intel.com>
 <20231120095615.GA1074920@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120095615.GA1074920@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Nov 20, 2023 at 11:56:15AM +0200, Mika Westerberg wrote:
> On Sat, Nov 18, 2023 at 12:50:37PM +0530, Raag Jadav wrote:
> > Use lock guards from cleanup.h to simplify locking.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko



