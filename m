Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECFE2392B82
	for <lists+linux-gpio@lfdr.de>; Thu, 27 May 2021 12:12:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236071AbhE0KNj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 May 2021 06:13:39 -0400
Received: from mga17.intel.com ([192.55.52.151]:31997 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236069AbhE0KNi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 27 May 2021 06:13:38 -0400
IronPort-SDR: LJHZQWA4vBo/XWD6yP2Fh+PqFumY4aivIrZ7mAKjRUDzHv+VqViaWcM0mO/0lq3JeUZGWCc7r2
 gqq1/wX/KZAw==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="183033755"
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; 
   d="scan'208";a="183033755"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2021 03:12:04 -0700
IronPort-SDR: k7t2Emme3dYCOJ+Yu9o4VWtB5w6KcjCmn0fFrBq40yggSZpr13g3F7+FhI/S+5kOsX9vkR9Ge7
 tyGeTPhc0OoA==
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; 
   d="scan'208";a="547743416"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2021 03:12:02 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lmCzg-00F1UP-AK; Thu, 27 May 2021 13:12:00 +0300
Date:   Thu, 27 May 2021 13:12:00 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     lakshmi.sowjanya.d@intel.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "Raja Subramanian, Lakshmi Bai" 
        <lakshmi.bai.raja.subramanian@intel.com>, tamal.saha@intel.com
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: Add bindings for Intel Keembay
 pinctrl driver
Message-ID: <YK9wcPtCQzUHh8jm@smile.fi.intel.com>
References: <20210524092605.734-1-lakshmi.sowjanya.d@intel.com>
 <20210524092605.734-2-lakshmi.sowjanya.d@intel.com>
 <CACRpkdZ2bDDNecLc5sEe36KyJCBqAo5-vZdvwM+V2a33tr4w_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZ2bDDNecLc5sEe36KyJCBqAo5-vZdvwM+V2a33tr4w_g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 27, 2021 at 01:19:36AM +0200, Linus Walleij wrote:
> On Mon, May 24, 2021 at 11:26 AM <lakshmi.sowjanya.d@intel.com> wrote:
> 
> > From: "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>
> >
> > Add Device Tree bindings documentation for Intel Keem Bay
> > SoC's pin controller.
> > Add entry for INTEL Keem Bay pinctrl driver in MAINTAINERS file
> >
> > Signed-off-by: Vineetha G. Jaya Kumaran <vineetha.g.jaya.kumaran@intel.com>
> > Signed-off-by: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
> > Signed-off-by: D, Lakshmi Sowjanya <lakshmi.sowjanya.d@intel.com>
> > Acked-by: Mark Gross <mgross@linux.intel.com>
> 
> So since this thing has device tree bindings I suppose it is one
> of those intel-but-not-x86-and-not-acpi things that Andy should
> not merge through his tree?
> 
> I bet he wants to take a look though, so keep Andy posted.

Yeah, this is the series I have reviewed couple of times internally, but then
it lost on cracks and somebody decided to submit (forgetting to include me) to
the mailing list.

In any case some points about this:
 - this is ARM based platform
 - this pin control doesn't have anything in common with x86 LPSS pin control
 - Lighting Mountain is a former MIPS-based SoC with x86 core

I.o.w. they all are different. I doubt the unification with equilibrium may
have happened.

But I think it's fine to continue the review publicly. We will see the
potential issues, maintainer's desires, etc earlier.

Btw, thanks for your preliminary review!

-- 
With Best Regards,
Andy Shevchenko


