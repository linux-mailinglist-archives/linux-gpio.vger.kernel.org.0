Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FFC5816F9
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 12:25:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727340AbfHEKZO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 06:25:14 -0400
Received: from mga07.intel.com ([134.134.136.100]:34723 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727328AbfHEKZO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 5 Aug 2019 06:25:14 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Aug 2019 03:24:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,349,1559545200"; 
   d="scan'208";a="176273282"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by orsmga003.jf.intel.com with ESMTP; 05 Aug 2019 03:24:46 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1huaAX-0005hy-9C; Mon, 05 Aug 2019 13:24:45 +0300
Date:   Mon, 5 Aug 2019 13:24:45 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v1 2/2] pinctrl: qdf2xxx: Switch to use
 device_property_count_uXX()
Message-ID: <20190805102445.GJ23480@smile.fi.intel.com>
References: <20190723192738.68486-1-andriy.shevchenko@linux.intel.com>
 <20190723192738.68486-2-andriy.shevchenko@linux.intel.com>
 <CACRpkdZDeOXJzT6xXp_in0TYjYnE=wFJ8t0AO2bQ+4WMbRS=mw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZDeOXJzT6xXp_in0TYjYnE=wFJ8t0AO2bQ+4WMbRS=mw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 05, 2019 at 12:02:10PM +0200, Linus Walleij wrote:
> On Tue, Jul 23, 2019 at 9:27 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Use use device_property_count_uXX() directly, that makes code neater.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Patch applied. (Same comment.)

Thanks, same comment.

-- 
With Best Regards,
Andy Shevchenko


