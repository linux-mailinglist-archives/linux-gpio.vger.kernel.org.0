Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A06B27E13D
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 08:37:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728025AbgI3Gh0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 02:37:26 -0400
Received: from mga02.intel.com ([134.134.136.20]:42066 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725786AbgI3GhZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Sep 2020 02:37:25 -0400
IronPort-SDR: gmkOz/AFk9cH03CvbcPifEehIJwnPQ0137ch5JHOGQwzXOiWHEUYSvyZc5lKT/NOizIZU0/K5R
 njlut8jck0Cw==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="150037569"
X-IronPort-AV: E=Sophos;i="5.77,321,1596524400"; 
   d="scan'208";a="150037569"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 23:37:25 -0700
IronPort-SDR: Nrzq853xbzGQ+XRciNmd4bjZi/tdvIb0jSB9L4nLMeOWFGUtexOEh5igF2y1LAGZpboB3wqhft
 LoT9SpJYYiFw==
X-IronPort-AV: E=Sophos;i="5.77,321,1596524400"; 
   d="scan'208";a="457545182"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 23:37:22 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 30 Sep 2020 09:37:20 +0300
Date:   Wed, 30 Sep 2020 09:37:20 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v1 1/3] pinctrl: tigerlake: Fix register offsets for
 TGL-H variant
Message-ID: <20200930063720.GS2495@lahna.fi.intel.com>
References: <20200929110306.40852-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200929110306.40852-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 29, 2020 at 02:03:04PM +0300, Andy Shevchenko wrote:
> It appears that almost traditionally the H variants have some deviations
> in the register offsets in comparison to LP ones. This is the case for
> Intel Tiger Lake as well. Fix register offsets for TGL-H variant.
> 
> Fixes: 653d96455e1e ("pinctrl: tigerlake: Add support for Tiger Lake-H")
> Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
