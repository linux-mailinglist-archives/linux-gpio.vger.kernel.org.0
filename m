Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE79E66281F
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jan 2023 15:09:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232040AbjAIOJq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Jan 2023 09:09:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233436AbjAIOJQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Jan 2023 09:09:16 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0636265A
        for <linux-gpio@vger.kernel.org>; Mon,  9 Jan 2023 06:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673273355; x=1704809355;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+kiBkmIhTRve6JyhcW4q0ULEglyxuibupsCKqdSdkzw=;
  b=O5u7u6XV5h9wDEu2RZP/WEriJfDAlrBawP7r3Okau4Ho7AxubPntjIrc
   mKkUTSRzUgpQRYKf0tHpl9nZhjyT2uVi0INgWZcZVNSiDSz+Q+vtMLzdR
   EGd8JsBcyw2nK5Xc0p1w7TcYxQEZkAutqY/AKQD0Q9r30FaRFa2DNIHJe
   P3ABpoYR1DQVEhOI02kDCXE1HgjcnACoXc89k1wivehxothp7r2xgweT2
   A1zFqh5BlpGTxQFcxY8JhaOScFyZxlmnoBfm81RpsnGCWFqn8V0qYcyFY
   M1qAEBYrqPnCt5yKV3kGAL1hYSI+0xB0Gadsn4TpbHZo2AVp2FZYjcuKC
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="350093771"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="350093771"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2023 06:09:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="725179997"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="725179997"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 09 Jan 2023 06:09:11 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pEspq-006VkL-01;
        Mon, 09 Jan 2023 16:09:10 +0200
Date:   Mon, 9 Jan 2023 16:09:09 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Niyas Sait <niyas.sait@linaro.org>
Cc:     linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com,
        rafael@kernel.org, linus.walleij@linaro.org, fugang.duan@linaro.org
Subject: Re: [PATCH v3 1/2] pinctrl: add support for ACPI pin function and
 config resources
Message-ID: <Y7wgBU7CoTpH7PTe@smile.fi.intel.com>
References: <20221130164027.682898-2-niyas.sait@linaro.org>
 <Y4fE6CPLHKPdjt9y@smile.fi.intel.com>
 <a23d0da6-6f80-a7d5-a0fb-a10e1a408129@linaro.org>
 <Y4fnoOKngSLW7dfb@smile.fi.intel.com>
 <a033178f-89f8-1843-ee02-321da8c2ca90@linaro.org>
 <Y4kzG3K1LlC5ZcQi@smile.fi.intel.com>
 <ae60701e-a2f1-4945-d9e0-e8ecd1c82f62@linaro.org>
 <Y43oYSF8WWu6ziJ9@smile.fi.intel.com>
 <24bf8b5d-d0ff-1d45-9c36-12bcc6fc3868@linaro.org>
 <a85b6bf6-e00b-243a-4ca4-8339a1c81c48@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a85b6bf6-e00b-243a-4ca4-8339a1c81c48@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 03, 2023 at 04:49:23PM +0000, Niyas Sait wrote:
> On 20/12/2022 10:53, Niyas Sait wrote:
> > Hi Andy,
> >
> > As discussed previously, I've put together a design for the pinctrl ACPI
> > support in a google doc [1]
> >
> > Could you please have a look ?
> >
> > [1]
> > https://docs.google.com/document/d/1bgLAOEGmhVnxSF_Bx6-blg1_ZNnv8BTQGYW6gixOvjY/edit?usp=sharing
> 
> Did you get a chance to look at the design doc ?

I started reading it before Xmas holidays and then other tasks overhent me.
I'll prioritize this.

> I am not sure if I missed any of your comments.
> 
> Let me know if you have any feedback.

P.S. Have you seen the ECR for the ACPI specification regarding pin numbering
vs. GPIO numbering?

-- 
With Best Regards,
Andy Shevchenko


