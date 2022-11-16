Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69AF662BFA8
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Nov 2022 14:38:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238497AbiKPNiu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Nov 2022 08:38:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238294AbiKPNik (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Nov 2022 08:38:40 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64DAAF038
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 05:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668605919; x=1700141919;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xJDAFKBccGBEfHFK8kKpsPqsX9HjlC02ZGEv1dPTP4c=;
  b=fYzgRK/G33r+hgbdoEd1hIaW9aF/LsN6o6liKu/mThWytD/PqicCXu3b
   luFH4Ru0CqNYtCssndPXoj7oBbH/S8gW+FTom7ZxqGWcTrhrfjrLzCz1S
   QwlLz6rWlHgUtfJ/uyO7llwXZYtZXC+csjbLVUJXME5poj45icLX4bqVS
   cdL5aaAPmfMQ+tNJyczBNvqsl3vqwIdpzZtcVImXDsBUDKJYBMdbUJtk7
   FgV//Bf+QlkQLiMVcxY5wtYh5ybykuox9D9PCqCsU1peD5uusckyQAlsn
   wwwyM24ZK9FSb8Zt2edBUnXCVBVyx+UnnMKQcbagKbA7qPQqcUfQN6QP5
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="292933471"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="292933471"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2022 05:38:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="670502918"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="670502918"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 16 Nov 2022 05:38:37 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ovIcd-00D93w-2H;
        Wed, 16 Nov 2022 15:38:35 +0200
Date:   Wed, 16 Nov 2022 15:38:35 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Niyas Sait <niyas.sait@linaro.org>
Cc:     linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com,
        rafael@kernel.org, linus.walleij@linaro.org
Subject: Re: [PATCH RFC v2 0/3] pinctrl: add ACPI support to pin controller
Message-ID: <Y3Tn2+uHqLeusvT4@smile.fi.intel.com>
References: <20221115175415.650690-1-niyas.sait@linaro.org>
 <Y3PWjZb9Jci1oXyM@smile.fi.intel.com>
 <3766343a-ce40-10aa-99dc-2ea94bc1ffbd@linaro.org>
 <Y3Pexz7tLrAP05uY@smile.fi.intel.com>
 <c9eb64c4-4cb3-b25c-df04-97da24a595fd@linaro.org>
 <Y3Sz32+4uuynGeAy@smile.fi.intel.com>
 <05f3c105-12f8-1fd5-0e6c-1ab7e24a01df@linaro.org>
 <Y3TlQYcLHjA23iRL@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3TlQYcLHjA23iRL@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 16, 2022 at 03:27:30PM +0200, Andy Shevchenko wrote:
> On Wed, Nov 16, 2022 at 10:40:19AM +0000, Niyas Sait wrote:
> > On 16/11/2022 09:56, Andy Shevchenko wrote:
> > > The GPIO to pin mapping is done by GPIO ranges. This can be made up in the
> > > driver or, IIRC, in DT (so in ACPI) by already registered properties).
> > > 
> > > Not sure, why you don't use them.
> > 
> > OK. I might have missed it.
> > 
> > In DT, gpio-ranges property is used to describe the mapping, I could not
> > find equivalent property in GPIO ACPI properties -
> > https://www.kernel.org/doc/html/latest/firmware-guide/acpi/gpio-properties.html
> 
> It's the same. You just need to check the code of GPIO library to make sure
> that it uses fwnode / device property APIs, so it will be parsed in ACPI case
> as well.

Ah, and it's always welcome to have Documentation updates to make it up-to-date.

-- 
With Best Regards,
Andy Shevchenko


