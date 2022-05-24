Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7E5A532A6E
	for <lists+linux-gpio@lfdr.de>; Tue, 24 May 2022 14:34:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237350AbiEXMeW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 May 2022 08:34:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237341AbiEXMeV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 May 2022 08:34:21 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E14695A2A
        for <linux-gpio@vger.kernel.org>; Tue, 24 May 2022 05:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653395660; x=1684931660;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=slZnXl+rBUnCmhi6d+tFf8jJ5+WznZjZdHxCtZQ3E9U=;
  b=U2RK9EtQpBIxHTuGltSWBptxuAUIVFmWIpkm/DupBDgftKV7e4k5c3CM
   rCAqbu/P2xvY6ZQ+LGY+xEDL6fZRMacTXTiY5FOH7O6QpIGwzO4d8yR/b
   OEXzpVk7TWJOBOLcxdN0Z74sSZbRflO5ZF3eufHQZFR5HUCRu822Veh7f
   VYWBJSSQ9ZuWyKi6J54dHC4BI1Uar3gYWD1If9ygGhT8vtvMKlqZ9Cywu
   MsxAMh+cX5oVP3tohA9AgUv2YwHkl/fsAKEsrpSSD07BkL6L5NdhPqe09
   nV8K2IGDGvu1KYiIyu8KLos1kVHL7DWthUVvXscOSjK9sTDwYueHLC8UA
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="261124256"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; 
   d="scan'208";a="261124256"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2022 05:34:19 -0700
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; 
   d="scan'208";a="548455366"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2022 05:34:17 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 24 May 2022 15:34:14 +0300
Date:   Tue, 24 May 2022 15:34:14 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Basavaraj Natikar <bnatikar@amd.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Shyam-sundar.S-k@amd.com, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/3] pinctrl: amd: Get and update IOMUX details
Message-ID: <YozQxvHzoiISqjob@lahna>
References: <20220524074007.2792445-1-Basavaraj.Natikar@amd.com>
 <20220524074007.2792445-3-Basavaraj.Natikar@amd.com>
 <CACRpkdZ267_CjNoro4A+eBASjz=qCL4ixLnbsac5U+gCsBSGwg@mail.gmail.com>
 <e35efb44-6e74-690c-91b6-c8270f624894@amd.com>
 <YozDbugZc8vXPHU2@lahna>
 <8ba8857d-c3ab-8959-5bc3-a4e225459f61@amd.com>
 <YozKd+Zehnlg1s1p@lahna>
 <c79fc5ce-469d-a547-5485-aa00210db79b@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c79fc5ce-469d-a547-5485-aa00210db79b@amd.com>
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

On Tue, May 24, 2022 at 05:54:47PM +0530, Basavaraj Natikar wrote:
> There is no CRS method defined for IOMX/0xFED80D00 in ACPI namespace // IOMX Address Base 
> Hence I added additional code to get IOMX memory region.
> 
> since _CRS method is used to get GPIO pin base for AMDI0030 in
> pinctrl-amd as below, same is not available for IOMX
>  
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

Is there something preventing you to add it here like below?

                     Memory32Fixed (ReadWrite, 0xFED80D00 0x00000400)
