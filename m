Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE44063C033
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Nov 2022 13:37:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbiK2Mhf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Nov 2022 07:37:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230128AbiK2Mhd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Nov 2022 07:37:33 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E458D5D6B7;
        Tue, 29 Nov 2022 04:37:30 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="316232950"
X-IronPort-AV: E=Sophos;i="5.96,203,1665471600"; 
   d="scan'208";a="316232950"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2022 04:35:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="643767060"
X-IronPort-AV: E=Sophos;i="5.96,203,1665471600"; 
   d="scan'208";a="643767060"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 29 Nov 2022 04:35:54 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1ozzq4-001hcv-0M;
        Tue, 29 Nov 2022 14:35:52 +0200
Date:   Tue, 29 Nov 2022 14:35:51 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 3/5] gpio: tps68470: Add support for the indicator LED
 outputs
Message-ID: <Y4X8p79GO2iLzNIP@smile.fi.intel.com>
References: <20221128214408.165726-1-hdegoede@redhat.com>
 <20221128214408.165726-4-hdegoede@redhat.com>
 <CAHp75VcJJtYsxbAYt2FjqSEJGhjpok7Dsh3vp46VyOm3=5_2FQ@mail.gmail.com>
 <007a6345-62e7-20ee-1a48-4adb4a9fa9df@redhat.com>
 <CAHp75VdxRbFmqUzjmMbtmh1tDGMXre+A+2u-hz5H3HSLEBX+OQ@mail.gmail.com>
 <1940674f-84fc-e5c9-59c6-0e6389c9d285@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1940674f-84fc-e5c9-59c6-0e6389c9d285@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_SOFTFAIL
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 29, 2022 at 01:20:03PM +0100, Hans de Goede wrote:
> On 11/29/22 12:59, Andy Shevchenko wrote:

...

> I'm sorry, but just like with your comments on patch 1/3
> I really don't see the problem here. Unlike "dir" or "out_or_in"
> get is a perfectly fine parameter name which is actually clearly
> defined by the parameter-name itself.
> 
> And the function + the callers are all in the same file, so
> anyone reading the code can easily deduce the meaning from
> the code.

OK. I'm not insisting, it's a bikeshedding anyway.

-- 
With Best Regards,
Andy Shevchenko


