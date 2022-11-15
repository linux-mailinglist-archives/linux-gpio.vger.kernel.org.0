Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65CC262A186
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Nov 2022 19:47:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230457AbiKOSrk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Nov 2022 13:47:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230194AbiKOSrj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Nov 2022 13:47:39 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89F4365F2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 10:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668538058; x=1700074058;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=27M0aY6vIBYylsanGBo4Mk4363AYOzvHmZaijcetPUs=;
  b=mXtLeT5b9qIZgPm0dktW29FnYZwLmYEgVIVb5tesUdt7THwZzgKry8J7
   OsdKwFMDfC5QX0CeuQHiubGpa9WEVVYVsyXdW1BPJol5M22HkjAcYNuRO
   ODGCMdydvXXVdtYWWzJ/BV5QExHxDPOzBnYXKTGIJ16QWW0rbm3m0BPp1
   Gi39zCCgq2qWbdckx6TMMy3HxbsvlFeOZ/1KbfsvMl56Dv9Ki8OvfYY8O
   WkTRSI3MsqF0o5VQ61gfGdgrDJokhvNKYaACDS5JWnoW70YJXoF91C6LX
   94GcjNAqtRWge6HOlfHJHELTuseXEW3wY6VpsFysf8KXdhuYwXo1wsexB
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="309965875"
X-IronPort-AV: E=Sophos;i="5.96,166,1665471600"; 
   d="scan'208";a="309965875"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2022 10:47:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="884072040"
X-IronPort-AV: E=Sophos;i="5.96,166,1665471600"; 
   d="scan'208";a="884072040"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 15 Nov 2022 10:47:36 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ov0y7-00ClOF-1n;
        Tue, 15 Nov 2022 20:47:35 +0200
Date:   Tue, 15 Nov 2022 20:47:35 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Niyas Sait <niyas.sait@linaro.org>
Cc:     linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com,
        rafael@kernel.org, linus.walleij@linaro.org
Subject: Re: [PATCH RFC v2 0/3] pinctrl: add ACPI support to pin controller
Message-ID: <Y3Pexz7tLrAP05uY@smile.fi.intel.com>
References: <20221115175415.650690-1-niyas.sait@linaro.org>
 <Y3PWjZb9Jci1oXyM@smile.fi.intel.com>
 <3766343a-ce40-10aa-99dc-2ea94bc1ffbd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3766343a-ce40-10aa-99dc-2ea94bc1ffbd@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 15, 2022 at 06:29:28PM +0000, Niyas Sait wrote:
> > Cover letter doesn't point to the ASL code you are using.
> 
> I've built this patch with a prototype ACPI implementation for NXP I.MX8MP
> platform.
> 
> You can see the code here: https://gitlab.com/nsait-linaro/acpi-patches/-/blob/master/0001-add-acpi-pinctrl-support-for-i2c-controllers.patch.

Yes, my point that you have to create a cover letter

> > 1) why do you need specific _DSD() for the pin mappings?
> 
> _DSD is required to pass the GPIO number to Pin mapping. Is there a better
> way to do it ?

Don't you have your pins sequential? Doesn't driver know the pin list?
Where are the device tree bindings for those properties? Are they already
present there?

> > 2) wgy you need vendor data for some of Pin*() resources?
> 
> Vendor data contains platform specific mux, config and input selection
> register for the pin group.

Why can't this be in the driver?

...

On top of that, how other hardware can utilize what you are doing without
adding redundancy to the ACPI?

-- 
With Best Regards,
Andy Shevchenko


