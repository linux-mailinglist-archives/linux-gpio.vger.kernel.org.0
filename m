Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E8816043DF
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Oct 2022 13:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbiJSLwD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Oct 2022 07:52:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231667AbiJSLvr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Oct 2022 07:51:47 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B4FE112AA4
        for <linux-gpio@vger.kernel.org>; Wed, 19 Oct 2022 04:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666179009; x=1697715009;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4YcfoLble85KQpMkw8dEMj5Q0sVuTa7xH+2uJMHUuQs=;
  b=mHBf27CxL2X00X4FaCNJutSOUtH54dbHAta6qoa4g4CcN5H3A8MXF1hh
   OY2Q2GoUTw8vnbolmr8LChT5hCFS109dbk0zIDgYV5oTsqNpdHbsTmKTL
   J+yPamsMU8sGv9DhuK6ohf82m+Ub49Kmo9qHcfoPBerrd8O7ZllB0/igl
   MTkckLvjTHa+hu2NFo1L2mhgwfPzgRnTD7BXxzfmrUk9TwIqJlsFUMCtn
   W6Cm/QKL3W76wQmeoS5jNO5eP9FmVCI8v8YvWIXo/JPGKVq9DnWp2tWyn
   Wv92RstLs1oT7e61vfvU0Rzx7+OepVJDwwcrhFuzmS3xpzjv5hM2CRUXk
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="286099416"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; 
   d="scan'208";a="286099416"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2022 04:29:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="624091750"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; 
   d="scan'208";a="624091750"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 19 Oct 2022 04:29:01 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ol7Fq-009pYJ-3B;
        Wed, 19 Oct 2022 14:28:58 +0300
Date:   Wed, 19 Oct 2022 14:28:58 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     =?iso-8859-1?B?Uul26XN6LA==?= Levente <levente.revesz@eilabs.com>
Cc:     Martyn Welch <martyn.welch@collabora.com>,
        Nate Drude <nate.d@variscite.com>,
        Haibo Chen <haibo.chen@nxp.com>, Puyou Lu <puyou.lu@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Peter Robinson <pbrobinson@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/2] gpio: pca953x: Add interrupt mask support for
 pca953x chips
Message-ID: <Y0/feqFujcGKS0pf@smile.fi.intel.com>
References: <20221010132007.924810-1-levente.revesz@eilabs.com>
 <CACRpkdbVCw=b-Hot83UpqmzaBSYGT0VY0g3QcgHNaPke4=grgA@mail.gmail.com>
 <Y02RWJVvybzvNbaA@smile.fi.intel.com>
 <VI1P194MB06553A18E489E4F456B0EBE1E32B9@VI1P194MB0655.EURP194.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VI1P194MB06553A18E489E4F456B0EBE1E32B9@VI1P194MB0655.EURP194.PROD.OUTLOOK.COM>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 19, 2022 at 10:15:01AM +0000, Révész, Levente wrote:
> On Monday, October 17, 2022 7:31 PM, Andy Shevchenko wrote:
> > At first glance I think this needs two prerequisite patches:
> >
> > 1) convert _TYPE from bits to plain numbers, so we will have room
> >    for up to 16 types;
> >
> > 2) Introducing PCAL953X_TYPE.
> >
> > After this is done, the current series will be neater.
> 
> Thanks for the suggestions!
> 
> I have started implementing this change:
> 
>     * Convert _TYPE from bits to 4 bit integer
> 
>     * Define 4 chip types: PCA953X_TYPE, PCAL953X_TYPE,
>                            PCAL653X_TYPE, PCA957X_TYPE
> 
> The PCA_PCAL bit is redundant, we know which chip is PCAL from their
> chip type. Remove the PCA_PCAL bit and the PCA_LATCH_INT mask.

Sounds good.

> The now modified bits were also used in the acpi_device_id
> initialization:
> 
>     static const struct acpi_device_id pca953x_acpi_ids[] = {
>         { "INT3491", 16 | PCA953X_TYPE | PCA_LATCH_INT, },
>         { }
>     };
>     MODULE_DEVICE_TABLE(acpi, pca953x_acpi_ids);

I do not see any modifications in the above.

> I do not understand what is happening in this snippet.
> What should be the id?

INT3491 is the ID. The chip behind is (usually) PCAL9555. In the cases
when it's not, there is no associated interrupt line in the ACPI tables,
so it won't hurt, however it's not the best solution made that time.

-- 
With Best Regards,
Andy Shevchenko


