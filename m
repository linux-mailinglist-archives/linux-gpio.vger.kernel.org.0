Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0516462B77F
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Nov 2022 11:16:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231418AbiKPKQe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Nov 2022 05:16:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229801AbiKPKQd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Nov 2022 05:16:33 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFFCFFFF
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 02:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668593792; x=1700129792;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m3PfdTcRdVd2y8+Yfwu54IhehZZlVocVyayURbrVAVA=;
  b=nPCIxaZyo7vspU2yw6yFgbkr7Fzf8NpDUi4IqwK1+gP+RWxhqh3lOnEO
   NwDvNcQSXSAWYR6FCaLWlfQZpftB85IGP6W68OvjEh9fa6s5douNm1BRb
   vZHeJdI3nV5OMYl1HtsUoTOc1Z/VFJDGRH/UG9tKrpMj7F6vag7PCro8n
   E2XGp1l7hyVf80tJtKRSFqEFksKHLHXhibMLAz1JBgcWeuBORNoVk/mHL
   Ndujzz0uRbIqz/G5zDljOJwtwpEvphm/QWUJrAHFKKJskxDGdOuz+ZTHY
   Y1c5VrtOWuaCcg3AZIJkl0DxzpQLlcL6wAOGCqn50ReW0e0r+kqkjban9
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="314322910"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="314322910"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2022 02:16:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="672344274"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="672344274"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 16 Nov 2022 02:16:23 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ovFSv-00D56t-33;
        Wed, 16 Nov 2022 12:16:21 +0200
Date:   Wed, 16 Nov 2022 12:16:21 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Niyas Sait <niyas.sait@linaro.org>
Cc:     linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com,
        rafael@kernel.org, linus.walleij@linaro.org
Subject: Re: [PATCH RFC v2 0/3] pinctrl: add ACPI support to pin controller
Message-ID: <Y3S4dXdneJ6mEVoI@smile.fi.intel.com>
References: <20221115175415.650690-1-niyas.sait@linaro.org>
 <Y3PWjZb9Jci1oXyM@smile.fi.intel.com>
 <3766343a-ce40-10aa-99dc-2ea94bc1ffbd@linaro.org>
 <Y3Pexz7tLrAP05uY@smile.fi.intel.com>
 <35760f9d-e491-4014-96f3-b13657c1c523@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35760f9d-e491-4014-96f3-b13657c1c523@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 15, 2022 at 07:15:25PM +0000, Niyas Sait wrote:
> >>> 1) why do you need specific _DSD() for the pin mappings?
> >>
> >> _DSD is required to pass the GPIO number to Pin mapping. Is there a
> better
> >> way to do it ?
> >
> > Don't you have your pins sequential? Doesn't driver know the pin list?
> > Where are the device tree bindings for those properties? Are they already
> > present there?
> 
> They are not sequential. There are multiple GPIO controllers and GPIO pins
> are mapped to different pin ranges.
> 
> Please checkout arch/arm64/boot/dts/freescale/imx8mp.dtsi for device tree
> binding.
> 
> Yes I think it can be done in the driver.
> 
> >>> 2) wgy you need vendor data for some of Pin*() resources?
> >>
> >> Vendor data contains platform specific mux, config and input selection
> >> register for the pin group.
> >
> > Why can't this be in the driver?
> 
> Yes I think it can be done in driver. But I think we still have to pass the
> vendor data from the ACPI resources to the drivers in case if any
> implementation wants to pass vendor specific data for the driver.

I'm afraid that opening this to the drivers will allow to a lot of unknown data
to be encoded in ACPI, so I would really like to see the vendor data to be
absent (ideally).

> On 15/11/2022 18:47, Andy Shevchenko wrote:
> > On Tue, Nov 15, 2022 at 06:29:28PM +0000, Niyas Sait wrote:
> > > > Cover letter doesn't point to the ASL code you are using.
> > > 
> > > I've built this patch with a prototype ACPI implementation for NXP I.MX8MP
> > > platform.
> > > 
> > > You can see the code here: https://gitlab.com/nsait-linaro/acpi-patches/-/blob/master/0001-add-acpi-pinctrl-support-for-i2c-controllers.patch.
> > 
> > Yes, my point that you have to create a cover letter
> > 
> > > > 1) why do you need specific _DSD() for the pin mappings?
> > > 
> > > _DSD is required to pass the GPIO number to Pin mapping. Is there a better
> > > way to do it ?
> > 
> > Don't you have your pins sequential? Doesn't driver know the pin list?
> > Where are the device tree bindings for those properties? Are they already
> > present there?
> > 
> > > > 2) wgy you need vendor data for some of Pin*() resources?
> > > 
> > > Vendor data contains platform specific mux, config and input selection
> > > register for the pin group.
> > 
> > Why can't this be in the driver?
> > 
> > ...
> > 
> > On top of that, how other hardware can utilize what you are doing without
> > adding redundancy to the ACPI?

-- 
With Best Regards,
Andy Shevchenko


