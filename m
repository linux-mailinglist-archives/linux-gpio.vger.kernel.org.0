Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E015D5341A9
	for <lists+linux-gpio@lfdr.de>; Wed, 25 May 2022 18:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234192AbiEYQpa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 May 2022 12:45:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239271AbiEYQp3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 May 2022 12:45:29 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C5CB101F1
        for <linux-gpio@vger.kernel.org>; Wed, 25 May 2022 09:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653497127; x=1685033127;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0VnW7fqaivxCuppJ/e3+KFUKEmJr8KEast74dpgPL84=;
  b=Rx5g4IMyWBdbB8qzNsCs4eeepGhT+zA3c2CtxldqSyKcM76BF3c8qBy/
   N4p7QEGr3QNxhHzDkK9BNMzw0vsC9+tHSGgGF+s93GWExULxKKHeSXPwz
   NBJDqOemkym5WKfl2o48VeR+k+a1sMNgbUiMrJDMXnrDDXgP50aYeqs7V
   7/CB0k++VvIGXdyitqviFYKmBs295LH9KxM1CsaulhQvxchNzOcIGwPy3
   2hWbmbgsAKGG3tIWfUKCIzQeHrePfltBRJ8blOOmTjH5YOjWtn+Vc0X2z
   aLqG+SH2C4FfPTRDVSfsh0ANReRp8Q69+BEi8KONoZCG5UUa0GBvdyIGg
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="273590294"
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; 
   d="scan'208";a="273590294"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2022 09:45:26 -0700
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; 
   d="scan'208";a="704072630"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2022 09:45:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ntu8Q-000L3L-Ez;
        Wed, 25 May 2022 19:45:22 +0300
Date:   Wed, 25 May 2022 19:45:22 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Basavaraj Natikar <bnatikar@amd.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Shyam-sundar.S-k@amd.com, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/3] pinctrl: amd: Get and update IOMUX details
Message-ID: <Yo5dIqADnv/puBrb@smile.fi.intel.com>
References: <CACRpkdZ267_CjNoro4A+eBASjz=qCL4ixLnbsac5U+gCsBSGwg@mail.gmail.com>
 <e35efb44-6e74-690c-91b6-c8270f624894@amd.com>
 <YozDbugZc8vXPHU2@lahna>
 <8ba8857d-c3ab-8959-5bc3-a4e225459f61@amd.com>
 <YozKd+Zehnlg1s1p@lahna>
 <c79fc5ce-469d-a547-5485-aa00210db79b@amd.com>
 <YozQxvHzoiISqjob@lahna>
 <d14a0bae-c43b-f365-2fc9-873ca03eb87d@amd.com>
 <Yo0KNY55M7d+eli2@smile.fi.intel.com>
 <800030c9-8a74-9186-b329-8a3edff273ff@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <800030c9-8a74-9186-b329-8a3edff273ff@amd.com>
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

On Wed, May 25, 2022 at 03:12:05PM +0530, Basavaraj Natikar wrote:
> On 5/24/2022 10:09 PM, Andy Shevchenko wrote:
> > On Tue, May 24, 2022 at 07:20:34PM +0530, Basavaraj Natikar wrote:
> >> On 5/24/2022 6:04 PM, Mika Westerberg wrote:
> >>> On Tue, May 24, 2022 at 05:54:47PM +0530, Basavaraj Natikar wrote:
> >>>> There is no CRS method defined for IOMX/0xFED80D00 in ACPI namespace // IOMX Address Base 
> >>>> Hence I added additional code to get IOMX memory region.
> >>>>
> >>>> since _CRS method is used to get GPIO pin base for AMDI0030 in
> >>>> pinctrl-amd as below, same is not available for IOMX
> >>>>  
> >>>>   Device (GPIO)
> >>>>         {
> >>>>             Name (_HID, "AMDI0030")  // _HID: Hardware ID
> >>>>             Name (_CID, "AMDI0030")  // _CID: Compatible ID
> >>>>             Name (_UID, Zero)  // _UID: Unique ID
> >>>>             Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
> >>>>             {
> >>>>                 Name (RBUF, ResourceTemplate ()
> >>>>                 {
> >>>>                     Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
> >>>>                     {
> >>>>                         0x00000007,
> >>>>                     }
> >>>>                     Memory32Fixed (ReadWrite,
> >>>>                         0xFED81500,         // Address Base
> >>>>                         0x00000400,         // Address Length
> >>>>                         )
> >>> Is there something preventing you to add it here like below?
> >>>
> >>>                      Memory32Fixed (ReadWrite, 0xFED80D00 0x00000400)
> >> yes few system has different entries already defined like below      
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
> >>                 })
> >>                 Return (RBUF) /* \_SB_.GPIO._CRS.RBUF */
> >>             }
> >>
> >>
> >>         Device (GPIO)
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
> >>                     Memory32Fixed (ReadWrite,
> >>                         0xFED81200,         // Address Base
> >>                         0x00000100,         // Address Length
> >>                         )
> >>                 })
> >>                 Return (RBUF) /* \_SB_.GPIO._CRS.RBUF */
> >>             }
> >>
> >> if we add or in future some entries added. 
> >> is there way to map particular entry for IOMUX? 
> > Straightforward way is to add it always to the end and add _DSD boolean
> > property ("amd,pinctrl-iomux-present") and act accordingly. More flexible and
> > less error prone is to name all resources with DSD property and find resource
> > by name: "amd,pinctrl-resource-names" = "bank0", "bank1", "iomux".
> >
> Idea of adding _DSD property looks good, we can add easily _DSD
> "pinctrl-iomux-present" u8 property to return index or instance
> value directly. 

Better to name them all, it will be more consistent and robust.

> But systems already in use or old platforms needs BIOS update to avail 
> this feature and it may also impact existing windows OS functionality.

I don't believe it will anyhow alter Windows, except the new part not being
tested in Windows.

> one more flexible way is to directly use _DSD property to get memory
> region as below also works, 

Strongly no. We do not allow to repeat in _DSD the existing ACPI concepts.

...

> How about adding generic new function in drivers/acpi/utils.h to avoid
> using "../acpi/acpica/accommon.h" in pinctrl-amd.c like below.
> 
> acpi_status acpi_get_sys_mem_region(acpi_handle handle, 
>                            const char *nname, struct acpi_mem_space_context *res); 
> 
> can be used directly in acpi_get_iomux_region by calling like 
> acpi_get_sys_mem_region(handle, "IOMX", &res)
> This can be generically used to get details like below Operation regions 
> which is already present in dsdt table.
> OperationRegion (IOMX, SystemMemory, 0xFED80D00, 0x0100)

It seems you missed the point of OpRegions in ACPI. We have a standart way of
subscribing to the OpRegion:s, if somebody in ACPI touches it, you will handle
writes and reads in the driver.

Using OpRegion in replace of _CRS is a huge abuse of ACPI. Fix your firmware,
because it sounds like it must be fixed.

-- 
With Best Regards,
Andy Shevchenko


