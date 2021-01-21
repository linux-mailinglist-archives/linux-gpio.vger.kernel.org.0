Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A450D2FF16B
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jan 2021 18:10:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388493AbhAURKe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Jan 2021 12:10:34 -0500
Received: from mga06.intel.com ([134.134.136.31]:65052 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388322AbhAURK2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 21 Jan 2021 12:10:28 -0500
IronPort-SDR: GRgJLU+OueWqSYD+bFi+3xpkdjHBPAn7G2Z0dPgwiBSdqFb27WGbEg1SVSmb1vDSrDgFR1Mgx+
 49Noy/iKp2Pw==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="240843772"
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="240843772"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 09:08:25 -0800
IronPort-SDR: 19OsrA0I8xoruRLq5p31rpUBfk1H7b5L09+oUZGG8XQpKGDjgH4vY2qtwhh9wnDk6mzZMM5FQm
 YbEqXQKJI+4w==
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="366983163"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 09:08:23 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l2dST-007m7X-Bx; Thu, 21 Jan 2021 19:09:21 +0200
Date:   Thu, 21 Jan 2021 19:09:21 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 5/5] gpio: aggregator: Remove trailing comma in
 terminator entries
Message-ID: <YAm1QUjqnW9UbtM6@smile.fi.intel.com>
References: <20210120214547.89770-1-andriy.shevchenko@linux.intel.com>
 <20210120214547.89770-5-andriy.shevchenko@linux.intel.com>
 <CACRpkdanZ7yenqB0ThNLzfK0safTK4zgd_nxDkfd+RYPS+KuvA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdanZ7yenqB0ThNLzfK0safTK4zgd_nxDkfd+RYPS+KuvA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 21, 2021 at 02:17:47PM +0100, Linus Walleij wrote:
> On Wed, Jan 20, 2021 at 10:45 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Remove trailing comma in terminator entries to avoid potential
> > expanding an array behind it.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks!

Bart, I would like to send this series as a part of my Intel GPIO PR or tell me
if you wish another approach.

-- 
With Best Regards,
Andy Shevchenko


