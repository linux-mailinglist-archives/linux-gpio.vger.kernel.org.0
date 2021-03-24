Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3675347E72
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 18:03:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236399AbhCXRCk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 13:02:40 -0400
Received: from mga07.intel.com ([134.134.136.100]:42415 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237064AbhCXRCc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 24 Mar 2021 13:02:32 -0400
IronPort-SDR: ZtntOzMPKrNVMOeI4JS6oekx5ScelO7nYGT3gGmPDFHN2y6F3hMOO1I161NHPlrEl1/Q949VzL
 abBbTQd40Qaw==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="254740944"
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; 
   d="scan'208";a="254740944"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2021 10:02:32 -0700
IronPort-SDR: rJzS+iHtOGfIZpvOLfsXL6NzmraXGkrb1W962iko8Ym8KaXs9zZRzUjBo7mY3wfQULMhr9JHAe
 OPIWchmumWTg==
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; 
   d="scan'208";a="525308568"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2021 10:02:30 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1lP6tn-00FkQL-KI; Wed, 24 Mar 2021 19:02:27 +0200
Date:   Wed, 24 Mar 2021 19:02:27 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Roger Pau Monne <roger.pau@citrix.com>
Cc:     linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 2/2] intel/pinctrl: check capability offset is between
 MMIO region
Message-ID: <YFtwo4+4Rnmbnyid@smile.fi.intel.com>
References: <20210324154312.61878-1-roger.pau@citrix.com>
 <20210324154312.61878-3-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210324154312.61878-3-roger.pau@citrix.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 24, 2021 at 04:43:12PM +0100, Roger Pau Monne wrote:
> When parsing the capability list make sure the offset is between the
> MMIO region mapped in 'regs', or else the kernel hits a page fault.
> 
> Adding the check is harmless, and prevents buggy or broken systems
> from crashing the kernel if the capability linked list is somehow
> broken.

I don't think we need a dead code in the kernel. If you have a hardware to show
this issue, I eagerly want to know this!

-- 
With Best Regards,
Andy Shevchenko


