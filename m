Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9360E11CE4C
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 14:29:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729226AbfLLN3j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 08:29:39 -0500
Received: from mga04.intel.com ([192.55.52.120]:53169 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729170AbfLLN3i (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Dec 2019 08:29:38 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Dec 2019 05:29:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,306,1571727600"; 
   d="scan'208";a="216284707"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003.jf.intel.com with ESMTP; 12 Dec 2019 05:29:35 -0800
Received: from andy by smile with local (Exim 4.93-RC7)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1ifOX9-0003tz-GO; Thu, 12 Dec 2019 15:29:35 +0200
Date:   Thu, 12 Dec 2019 15:29:35 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        mazziesaccount@gmail.com, Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Use new GPIO direction defines for intel pinctrl
Message-ID: <20191212132935.GL32742@smile.fi.intel.com>
References: <cover.1576132131.git.matti.vaittinen@fi.rohmeurope.com>
 <20191212112135.GE2110480@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191212112135.GE2110480@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 12, 2019 at 01:21:35PM +0200, Mika Westerberg wrote:
> On Thu, Dec 12, 2019 at 08:33:54AM +0200, Matti Vaittinen wrote:
> > We added definitions for GPIO line directions here:
> > https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/commit/?id=9208b1e77d6e8e9776f34f46ef4079ecac9c3c25
> > 
> > Let's use them on Intel pincontrollers too.
> > 
> > Changes for v2:
> >   - Replaced ternary operator with if() for better readability
> > 
> > ---
> > 
> > Matti Vaittinen (3):
> >   pinctrl: pinctrl-intel: Use GPIO direction definitions
> >   pinctrl: pinctrl-cherryview: Use GPIO direction definitions
> >   pinctrl: pinctrl-baytrail: Use GPIO direction definitions
> 
> Andy, please pick these up with my,
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko


