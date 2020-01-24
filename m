Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1AE1147F14
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Jan 2020 11:57:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbgAXK5g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Jan 2020 05:57:36 -0500
Received: from mga01.intel.com ([192.55.52.88]:1073 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726294AbgAXK5g (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 24 Jan 2020 05:57:36 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Jan 2020 02:57:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,357,1574150400"; 
   d="scan'208";a="291927596"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001.fm.intel.com with ESMTP; 24 Jan 2020 02:57:33 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iuwed-0007gG-E6; Fri, 24 Jan 2020 12:57:35 +0200
Date:   Fri, 24 Jan 2020 12:57:35 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.6-1
Message-ID: <20200124105735.GC32742@smile.fi.intel.com>
References: <20200120100957.GA11113@black.fi.intel.com>
 <CACRpkdZh4Cy83BPfdgcXR6idf7KCr15VD0YkR-7CcDxV=HZgaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZh4Cy83BPfdgcXR6idf7KCr15VD0YkR-7CcDxV=HZgaQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 23, 2020 at 03:45:14PM +0100, Linus Walleij wrote:
> On Mon, Jan 20, 2020 at 11:10 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:

> > Intel pin control drivers update for v5.6 (next release cycle).

...

> Pulled this into my "devel" branch for v5.6.

Thanks!
How long usually does it take to see in linux-next?

-- 
With Best Regards,
Andy Shevchenko


