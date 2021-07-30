Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 136EB3DB7E0
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 13:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238720AbhG3Lam (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 07:30:42 -0400
Received: from mga03.intel.com ([134.134.136.65]:26078 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238576AbhG3Lam (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 30 Jul 2021 07:30:42 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10060"; a="213113302"
X-IronPort-AV: E=Sophos;i="5.84,281,1620716400"; 
   d="scan'208";a="213113302"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2021 04:30:36 -0700
X-IronPort-AV: E=Sophos;i="5.84,281,1620716400"; 
   d="scan'208";a="500477957"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2021 04:30:34 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1m9Qii-003MxI-Gk; Fri, 30 Jul 2021 14:30:28 +0300
Date:   Fri, 30 Jul 2021 14:30:28 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "Raja Subramanian, Lakshmi Bai" 
        <lakshmi.bai.raja.subramanian@intel.com>,
        "Saha, Tamal" <tamal.saha@intel.com>
Subject: Re: [PATCH v3 2/2] pinctrl: Add Intel Keem Bay pinctrl driver
Message-ID: <YQPi1FdmzhMXcIY0@smile.fi.intel.com>
References: <20210716162724.26047-1-lakshmi.sowjanya.d@intel.com>
 <20210716162724.26047-3-lakshmi.sowjanya.d@intel.com>
 <CACRpkdbv77hjJ91h3fuLSYbpT+Yxd4X8_S7F+NsUw+QsKXN3Ww@mail.gmail.com>
 <CAHp75VdZ2_Hd66FoB5W_p0WCy8Hvx7ypz5K9iVAv22mnjE+jCQ@mail.gmail.com>
 <BL3PR11MB56995CA61A5C6AF043A37B11C4EC9@BL3PR11MB5699.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL3PR11MB56995CA61A5C6AF043A37B11C4EC9@BL3PR11MB5699.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 30, 2021 at 11:06:08AM +0000, D, Lakshmi Sowjanya wrote:
> Thank you Linus Walleij and Andy Shevchenko,
> 
> I will fix the warning and post the next version with 'Reviewed-by: Linus Walleij <linus.walleij@linaro.org>' tag.

Do not top-post!

-- 
With Best Regards,
Andy Shevchenko


