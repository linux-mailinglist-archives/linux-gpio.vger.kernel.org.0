Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6A71464E8B
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Dec 2021 14:10:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349491AbhLANNZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Dec 2021 08:13:25 -0500
Received: from mga14.intel.com ([192.55.52.115]:41722 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244690AbhLANNZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 1 Dec 2021 08:13:25 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10184"; a="236681939"
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800"; 
   d="scan'208";a="236681939"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2021 05:10:02 -0800
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800"; 
   d="scan'208";a="459246179"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2021 05:10:00 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1msPM1-000zNi-EA;
        Wed, 01 Dec 2021 15:08:57 +0200
Date:   Wed, 1 Dec 2021 15:08:57 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        linux-gpio@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH 0/5] GPIO PCH/ML-IOH consolidation baby steps
Message-ID: <Yadz6QFmk3wy7Hub@smile.fi.intel.com>
References: <20211130220841.2776562-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211130220841.2776562-1-helgaas@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 30, 2021 at 04:08:36PM -0600, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> These are tiny cleanups to pch and ml-ioh to try to make them easier to
> merge together.  I can't really test either driver, so I'm not pushing too
> hard on this.

Thanks, all pushed to my review and testing queue!

> If anybody wants to go further, Andy mentioned some docs here:
>   https://lore.kernel.org/lkml/CAHp75VfDcQXqmK9=4k4rqi7t2OZaVPC13b45vLY7fELr7zBG_Q@mail.gmail.com/
> 
> Bjorn Helgaas (5):
>   gpio: pch: Use .driver_data instead of checking Device IDs again
>   gpio: pch: Cache &pdev->dev to reduce repetition
>   gpio: ml-ioh: Cache &pdev->dev to reduce repetition
>   gpio: ml-ioh: Use BIT() to match gpio-pch.c
>   gpio: ml-ioh: Change whitespace to match gpio-pch.c
> 
>  drivers/gpio/gpio-ml-ioh.c | 52 +++++++++++++++++++-------------------
>  drivers/gpio/gpio-pch.c    | 42 +++++++++++++++---------------
>  2 files changed, 46 insertions(+), 48 deletions(-)
> 
> -- 
> 2.25.1
> 

-- 
With Best Regards,
Andy Shevchenko


