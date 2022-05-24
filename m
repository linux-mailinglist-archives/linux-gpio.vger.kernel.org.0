Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 355375329F9
	for <lists+linux-gpio@lfdr.de>; Tue, 24 May 2022 14:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237168AbiEXMH0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 May 2022 08:07:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237166AbiEXMHZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 May 2022 08:07:25 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19286644FC
        for <linux-gpio@vger.kernel.org>; Tue, 24 May 2022 05:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653394045; x=1684930045;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HU9oUOY7R9qz+DIL6Pc7greTsV3E61u9KYsgIdLq1l4=;
  b=N74KtWAvU3DD3lmVr7PHdSHHtbWnYLujG+5+aS4Ngt3TVfbZvyO/8tjR
   GPOAqW1HTHFtcqJ1fUsFLLwGruxhImPsv/7Ey6dQEeaBEJTDjNgFhxNyZ
   UkSMcSoZ2mcIrE66PgmA15EBtPnCO8/X5zfIG/BgVi88hh/qZEL5vuQM3
   jJ7+QJ6cv8zHaVep+fr0g4zfyPAg0omcgiapawtas2B7daVf/fIpHwras
   2snS/yvFSkrWyIoBKgL6kKx9Nl26vqxJteJ6SdjovG45ucRKgp/MFiElh
   oZ8zeKbS9dWTvwYfy9g2bndaYt6MI95F8hM0oT110QNsYKqRdq2Vsp07o
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="273624660"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; 
   d="scan'208";a="273624660"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2022 05:07:24 -0700
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; 
   d="scan'208";a="641916647"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2022 05:07:21 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 24 May 2022 15:07:19 +0300
Date:   Tue, 24 May 2022 15:07:19 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Basavaraj Natikar <bnatikar@amd.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Shyam-sundar.S-k@amd.com, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/3] pinctrl: amd: Get and update IOMUX details
Message-ID: <YozKd+Zehnlg1s1p@lahna>
References: <20220524074007.2792445-1-Basavaraj.Natikar@amd.com>
 <20220524074007.2792445-3-Basavaraj.Natikar@amd.com>
 <CACRpkdZ267_CjNoro4A+eBASjz=qCL4ixLnbsac5U+gCsBSGwg@mail.gmail.com>
 <e35efb44-6e74-690c-91b6-c8270f624894@amd.com>
 <YozDbugZc8vXPHU2@lahna>
 <8ba8857d-c3ab-8959-5bc3-a4e225459f61@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ba8857d-c3ab-8959-5bc3-a4e225459f61@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 24, 2022 at 05:22:47PM +0530, Basavaraj Natikar wrote:
> 
> On 5/24/2022 5:07 PM, Mika Westerberg wrote:
> 
> > Hi,
> >
> > On Tue, May 24, 2022 at 04:48:03PM +0530, Basavaraj Natikar wrote:
> >>>> +
> >>>> +       status = acpi_walk_namespace(ACPI_TYPE_REGION, sys_bus_handle, ACPI_UINT32_MAX,
> >>>> +                                    acpi_get_iomux_region, NULL, gpio_dev, NULL);
> >>>> +
> >>>> +       if (ACPI_FAILURE(status)) {
> >>>> +               dev_err(&gpio_dev->pdev->dev, "Failed to get acpi_get_iomux_region\n");
> >>>> +               return;
> >>>> +       }
> >>>> +}
> >>> Oh this looks scary to me, make sure you get the review from the GPIO
> >>> ACPI experts, Andy Shevchenko and/or Mika Westerberg. (Added on the
> >>> To: line)
> >> Thanks Linus for the feedback.
> >>
> >> Hi Andy/Mika,
> >>
> >> Please provide your suggestions for this patch.
> > If this is about muxing pins, have you looked at the ACPI PinFunction ()
> > and related descriptors?
> 
> This is about finding below IOMX (pinmux region) from ACPI namespace.

Yes, I know but you use it for muxing pins, no?

> OperationRegion (IOMX, SystemMemory, 0xFED80D00, 0x0100)
> 
> I did not find any other methods to get IOMUX system memory region.

It seems to be standard BAR so simple memory descriptor in _CRS ()
probably works too and does not need any additional lines of code.
