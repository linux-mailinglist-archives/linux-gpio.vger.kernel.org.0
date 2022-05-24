Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A26E8532F19
	for <lists+linux-gpio@lfdr.de>; Tue, 24 May 2022 18:39:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236421AbiEXQji (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 May 2022 12:39:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233418AbiEXQjh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 May 2022 12:39:37 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3885EE023
        for <linux-gpio@vger.kernel.org>; Tue, 24 May 2022 09:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653410376; x=1684946376;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z8JQ890saiCJwg0n22svYm3opD2eTDf6NCHNsEjahX8=;
  b=cZ1XUwLeI7tl1PLaibyCWYiXfQB+82vESUu+aFfdIlE3wLqfwARtIiyV
   aa7cEgNqJy5/sHFWUnw99SUgMtsIX+7Gsy8yCps4peZdEagW+YW4v/dmD
   sU+YTab2V1OcPfDMGWeTvClulTRM67Km6NGeQj1B3rKvLvdSvjICp6EoL
   f6ztMoYJYx6j/HedG8T2dHEjmyEbhePGIt4VV6/IwVIHgGrfkr0WsiVtK
   7kcZlNyFVhCs4PDAIQQXn4//ottRzC3sBSDPfioEdWysuGZA7jYe/86Ei
   3kGe0At7PtWPlEZGlYC7qDy1kpIGbtNjeTIFN9q5NhDGPuPDleOOioXKe
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10357"; a="273306760"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; 
   d="scan'208";a="273306760"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2022 09:39:21 -0700
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; 
   d="scan'208";a="601388069"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2022 09:39:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ntXYz-000KEw-Gb;
        Tue, 24 May 2022 19:39:17 +0300
Date:   Tue, 24 May 2022 19:39:17 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Basavaraj Natikar <bnatikar@amd.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Shyam-sundar.S-k@amd.com, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/3] pinctrl: amd: Get and update IOMUX details
Message-ID: <Yo0KNY55M7d+eli2@smile.fi.intel.com>
References: <20220524074007.2792445-1-Basavaraj.Natikar@amd.com>
 <20220524074007.2792445-3-Basavaraj.Natikar@amd.com>
 <CACRpkdZ267_CjNoro4A+eBASjz=qCL4ixLnbsac5U+gCsBSGwg@mail.gmail.com>
 <e35efb44-6e74-690c-91b6-c8270f624894@amd.com>
 <YozDbugZc8vXPHU2@lahna>
 <8ba8857d-c3ab-8959-5bc3-a4e225459f61@amd.com>
 <YozKd+Zehnlg1s1p@lahna>
 <c79fc5ce-469d-a547-5485-aa00210db79b@amd.com>
 <YozQxvHzoiISqjob@lahna>
 <d14a0bae-c43b-f365-2fc9-873ca03eb87d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d14a0bae-c43b-f365-2fc9-873ca03eb87d@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 24, 2022 at 07:20:34PM +0530, Basavaraj Natikar wrote:
> On 5/24/2022 6:04 PM, Mika Westerberg wrote:
> > On Tue, May 24, 2022 at 05:54:47PM +0530, Basavaraj Natikar wrote:
> >> There is no CRS method defined for IOMX/0xFED80D00 in ACPI namespace // IOMX Address Base 
> >> Hence I added additional code to get IOMX memory region.
> >>
> >> since _CRS method is used to get GPIO pin base for AMDI0030 in
> >> pinctrl-amd as below, same is not available for IOMX
> >>  
> >>   Device (GPIO)
> >>         {
> >>             Name (_HID, "AMDI0030")  // _HID: Hardware ID
> >>             Name (_CID, "AMDI0030")  // _CID: Compatible ID
> >>             Name (_UID, Zero)  // _UID: Unique ID
> >>             Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
> >>             {
> >>                 Name (RBUF, ResourceTemplate ()
> >>                 {
> >>                     Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
> >>                     {
> >>                         0x00000007,
> >>                     }
> >>                     Memory32Fixed (ReadWrite,
> >>                         0xFED81500,         // Address Base
> >>                         0x00000400,         // Address Length
> >>                         )
> > Is there something preventing you to add it here like below?
> >
> >                      Memory32Fixed (ReadWrite, 0xFED80D00 0x00000400)
> 
> yes few system has different entries already defined like below      
>   Device (GPIO)
>         {
>             Name (_HID, "AMDI0030")  // _HID: Hardware ID
>             Name (_CID, "AMDI0030")  // _CID: Compatible ID
>             Name (_UID, Zero)  // _UID: Unique ID
>             Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
>             {
>                 Name (RBUF, ResourceTemplate ()
>                 {
>                     Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
>                     {
>                         0x00000007,
>                     }
>                     Memory32Fixed (ReadWrite,
>                         0xFED81500,         // Address Base
>                         0x00000400,         // Address Length
>                         )
>                 })
>                 Return (RBUF) /* \_SB_.GPIO._CRS.RBUF */
>             }
> 
> 
>         Device (GPIO)
>         {
>             Name (_HID, "AMDI0030")  // _HID: Hardware ID
>             Name (_CID, "AMDI0030")  // _CID: Compatible ID
>             Name (_UID, Zero)  // _UID: Unique ID
>             Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
>             {
>                 Name (RBUF, ResourceTemplate ()
>                 {
>                     Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
>                     {
>                         0x00000007,
>                     }
>                     Memory32Fixed (ReadWrite,
>                         0xFED81500,         // Address Base
>                         0x00000400,         // Address Length
>                         )
>                     Memory32Fixed (ReadWrite,
>                         0xFED81200,         // Address Base
>                         0x00000100,         // Address Length
>                         )
>                 })
>                 Return (RBUF) /* \_SB_.GPIO._CRS.RBUF */
>             }
> 
> if we add or in future some entries added. 
> is there way to map particular entry for IOMUX? 

Straightforward way is to add it always to the end and add _DSD boolean
property ("amd,pinctrl-iomux-present") and act accordingly. More flexible and
less error prone is to name all resources with DSD property and find resource
by name: "amd,pinctrl-resource-names" = "bank0", "bank1", "iomux".


-- 
With Best Regards,
Andy Shevchenko


