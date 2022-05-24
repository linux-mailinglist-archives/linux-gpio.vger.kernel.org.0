Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74129532924
	for <lists+linux-gpio@lfdr.de>; Tue, 24 May 2022 13:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236754AbiEXLh3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 May 2022 07:37:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236756AbiEXLh3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 May 2022 07:37:29 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7C7C50440
        for <linux-gpio@vger.kernel.org>; Tue, 24 May 2022 04:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653392244; x=1684928244;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3rAYzIPVSyuPAZa2tf2IJnRXOJUNtZJxTQU6aCiVd4Y=;
  b=LNzfkYU+5Cm7MpJzLMVOcNFjrYJC/qMod+5ePGfvyzZ8Gz6SfnGVy95t
   UUgwPftL5c9ThwQHcAW3ZGHDg1zA6wJx9yXNzjRopLRkA51Bs2IyCnUjl
   escguoiAqyZGlsHcUDt1pCt+mQPWLGn1mjXMPWsyUntVgyf6RQyG2n4FW
   t7gRWJsmOaKYNCYgtM5LaHdTyTYrMYzU640mzyMHPp52zDIypPYzTDdey
   C0wdF99K8K++lmy+0LkkVIk0kIEdTreMfVu0KsFw600EjomlwI9gacsic
   LSkCfJahJXphKidLgO7T9PGjv3Ia38so7jDVQjrI9skD4TM7J5QGdFJcv
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="254005360"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; 
   d="scan'208";a="254005360"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2022 04:37:24 -0700
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; 
   d="scan'208";a="601183964"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2022 04:37:21 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 24 May 2022 14:37:18 +0300
Date:   Tue, 24 May 2022 14:37:18 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Basavaraj Natikar <bnatikar@amd.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Shyam-sundar.S-k@amd.com, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/3] pinctrl: amd: Get and update IOMUX details
Message-ID: <YozDbugZc8vXPHU2@lahna>
References: <20220524074007.2792445-1-Basavaraj.Natikar@amd.com>
 <20220524074007.2792445-3-Basavaraj.Natikar@amd.com>
 <CACRpkdZ267_CjNoro4A+eBASjz=qCL4ixLnbsac5U+gCsBSGwg@mail.gmail.com>
 <e35efb44-6e74-690c-91b6-c8270f624894@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e35efb44-6e74-690c-91b6-c8270f624894@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Tue, May 24, 2022 at 04:48:03PM +0530, Basavaraj Natikar wrote:
> 
> >> +
> >> +       status = acpi_walk_namespace(ACPI_TYPE_REGION, sys_bus_handle, ACPI_UINT32_MAX,
> >> +                                    acpi_get_iomux_region, NULL, gpio_dev, NULL);
> >> +
> >> +       if (ACPI_FAILURE(status)) {
> >> +               dev_err(&gpio_dev->pdev->dev, "Failed to get acpi_get_iomux_region\n");
> >> +               return;
> >> +       }
> >> +}
> > Oh this looks scary to me, make sure you get the review from the GPIO
> > ACPI experts, Andy Shevchenko and/or Mika Westerberg. (Added on the
> > To: line)
> 
> Thanks Linus for the feedback.
> 
> Hi Andy/Mika,
> 
> Please provide your suggestions for this patch.

If this is about muxing pins, have you looked at the ACPI PinFunction ()
and related descriptors?
