Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B112E1646
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2019 11:36:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390895AbfJWJgN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Oct 2019 05:36:13 -0400
Received: from mga14.intel.com ([192.55.52.115]:22073 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390802AbfJWJgN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 23 Oct 2019 05:36:13 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Oct 2019 02:36:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,220,1569308400"; 
   d="scan'208";a="281568591"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001.jf.intel.com with ESMTP; 23 Oct 2019 02:36:11 -0700
Received: from andy by smile with local (Exim 4.92.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iND3r-0008Jt-2Q; Wed, 23 Oct 2019 12:36:11 +0300
Date:   Wed, 23 Oct 2019 12:36:11 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 0/5] pinctrl: intel: Refactor register restoring on
 resume
Message-ID: <20191023093611.GM32742@smile.fi.intel.com>
References: <20191022100004.66532-1-andriy.shevchenko@linux.intel.com>
 <20191023073033.GM2819@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191023073033.GM2819@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 23, 2019 at 10:30:33AM +0300, Mika Westerberg wrote:
> On Tue, Oct 22, 2019 at 12:59:59PM +0300, Andy Shevchenko wrote:
> > Refactor ->resume() path to be a bit smarter and less noisy.
> > 
> > In v2:
> > - add a patch to reduce a noise in kernel log
> > - drop warning to debug level for one message
> > - constify local pointers (Mika)
> > 
> > Andy Shevchenko (5):
> >   pinctrl: intel: Introduce intel_restore_padcfg() helper
> >   pinctrl: intel: Introduce intel_restore_hostown() helper
> >   pinctrl: intel: Introduce intel_restore_intmask() helper
> >   pinctrl: intel: Drop level from warning to debug in
> >     intel_restore_hostown()
> >   pinctrl: intel: Use helper to restore register values on ->resume()
> 
> For the whole series,
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko


