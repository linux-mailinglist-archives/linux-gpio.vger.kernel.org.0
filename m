Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD8EB32D1A6
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 12:21:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238448AbhCDLUG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 06:20:06 -0500
Received: from mga02.intel.com ([134.134.136.20]:24230 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231703AbhCDLUA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 4 Mar 2021 06:20:00 -0500
IronPort-SDR: cEXGGmCvqe3XP/p4USSNjHdwiy78GBBso3At+qxBFU9+t8W/plMkTM9z7BCCbIUJe/48WUX1Rg
 6XT9wGo7Ivhw==
X-IronPort-AV: E=McAfee;i="6000,8403,9912"; a="174510230"
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="174510230"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 03:18:14 -0800
IronPort-SDR: 0IexT2k7f9Mxr2A/jkO4XKOGEFm3Lw2y/Aosl2JEJ1Qnf0m0jAkq2AkqgzqmgV7urv9LyLtNXA
 lg/U0arftNzA==
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="384406967"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 03:18:12 -0800
Received: by lahna (sSMTP sendmail emulation); Thu, 04 Mar 2021 13:18:09 +0200
Date:   Thu, 4 Mar 2021 13:18:09 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] pinctrl: intel: No need to disable IRQs in the
 handler
Message-ID: <20210304111809.GO2542@lahna.fi.intel.com>
References: <20210304105432.36544-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210304105432.36544-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 04, 2021 at 12:54:32PM +0200, Andy Shevchenko wrote:
> In IRQ handler interrupts are already disabled, hence no need
> to repeat it. Even in the threaded case, which is disabled here,
> it is not a problem because IRQ framework serializes descriptor
> handling. Remove disabling IRQ part in the handler.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
