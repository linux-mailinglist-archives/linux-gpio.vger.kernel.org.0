Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE9976428BB
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Dec 2022 13:47:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231940AbiLEMrs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Dec 2022 07:47:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231942AbiLEMrk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Dec 2022 07:47:40 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2198121
        for <linux-gpio@vger.kernel.org>; Mon,  5 Dec 2022 04:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670244452; x=1701780452;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qB9QdJnZ9aLabQCYERjl5yExfMb+lhjB2mJq7nRijPo=;
  b=S9AMz9N1/sXNWUOnTkQOwKHmXZnwQXoNn7LiZrbEkYKziMLq4+VENof9
   ZnH7XsV1aBiril9fV+AQ4Z4xPdjgk+EE9+Y6dNcSPPBj9uPGQzxl23km4
   BK8K8CE2RlGuQjDjC31XCSymq2p4eyGINJCN1bYpdBmdwaZ52PQiKMoHY
   fheUWiNfCaG2XsaMMLPAPzutYO3bn9UlX9EeQ55teDdNWJefPLlsu41tD
   3qQgGnaKIM6ThqzqS7hw+w6Y11x7Uk7izxZW24/q6iqqe19ttdV+ADRTp
   yOB43drVKk9R7fFuMLII+JLP0fwTmA1Ro6+UZx9Vio2CBiR6dE9y4gZIL
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="316362344"
X-IronPort-AV: E=Sophos;i="5.96,219,1665471600"; 
   d="scan'208";a="316362344"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2022 04:47:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="788061241"
X-IronPort-AV: E=Sophos;i="5.96,219,1665471600"; 
   d="scan'208";a="788061241"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 05 Dec 2022 04:47:30 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p2Asb-004sH9-1B;
        Mon, 05 Dec 2022 14:47:29 +0200
Date:   Mon, 5 Dec 2022 14:47:29 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Niyas Sait <niyas.sait@linaro.org>
Cc:     linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com,
        rafael@kernel.org, linus.walleij@linaro.org, fugang.duan@linaro.org
Subject: Re: [PATCH v3 1/2] pinctrl: add support for ACPI pin function and
 config resources
Message-ID: <Y43oYSF8WWu6ziJ9@smile.fi.intel.com>
References: <20221130164027.682898-1-niyas.sait@linaro.org>
 <20221130164027.682898-2-niyas.sait@linaro.org>
 <Y4fE6CPLHKPdjt9y@smile.fi.intel.com>
 <a23d0da6-6f80-a7d5-a0fb-a10e1a408129@linaro.org>
 <Y4fnoOKngSLW7dfb@smile.fi.intel.com>
 <a033178f-89f8-1843-ee02-321da8c2ca90@linaro.org>
 <Y4kzG3K1LlC5ZcQi@smile.fi.intel.com>
 <ae60701e-a2f1-4945-d9e0-e8ecd1c82f62@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae60701e-a2f1-4945-d9e0-e8ecd1c82f62@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 05, 2022 at 07:20:24AM +0000, Niyas Sait wrote:
> On 01/12/2022 23:04, Andy Shevchenko wrote:
> > That's why third (?) time I'm asking you to provide a design level
> > documentation of your approach to understand it better.
> 
> Sorry Andy. I made a wrong assumption that the docs added would clarify
> things. I will put together a design document.
> 
> > The pin control has provider-consumer idea behind. When a*consumer*  device
> > is being probed, it tries to configure its pins based on the data collected
> > in the pin control device that*provides*  the resources. At this point of
> > time the pin control subsystem parses tables (currently DT and board files)
> > for that. For the pin control device itself, the registration of it also
> > parses tables but for the*provider*.
> > 
> > Now, the pin control device driver (*provider*) may or may not have
> > (a subset of) the pin functions and pin groups hard coded in the driver.
> > This can be used by the pin control subsystem as well as data that comes
> > from the tables. The data from the tables, nevertheless, is not really
> > needs names of the functions, because it's not what is programmed into
> > HW registers. That's why when driver doesn't have that information, it's
> > fine to generate it.
> > 
> > Also note, that in ACPI all Pin*() descriptors are optional and we need
> > to cover all such cases, I already pointed out to my preliminary research,
> > which I have done 5 years ago, where I tried to understand how it should
> > be covered for the most used cases.
> > 
> > I think I stopped with my solution in particular due to the problems with
> > the power management interaction with pin control, i.e. string-based odd
> > states (4 of which are hard coded in the pin control core code).
> 
> Let's start with the design document. ACPI have far fewer information for
> the pin controller compared to DT.

Exactly.

> I am not quite sure how we can generate
> data from Pin(*) descriptions for the pin controller reliably.

Yep, and this what we need to discuss.

> Let me first
> put together the design document, hopefully that will help.

Yes, please! And thank you for pumping up the topic, sooner or later we need to
bring a solution to this.

-- 
With Best Regards,
Andy Shevchenko


