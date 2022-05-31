Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11C00538EBC
	for <lists+linux-gpio@lfdr.de>; Tue, 31 May 2022 12:23:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245586AbiEaKXO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 May 2022 06:23:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242098AbiEaKXN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 May 2022 06:23:13 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F38D85EDB
        for <linux-gpio@vger.kernel.org>; Tue, 31 May 2022 03:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653992593; x=1685528593;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tzwaG0+rGMprxv9rcNpBz2DpHN/ngXy2JpbdmQpyuzs=;
  b=VHEnQt5yC4Kw1yBCUTDDUAyXnCc0ewRax6MrkOQuhbOrfYP6JSOeiLyf
   KMa7l9N7oOi/wHtWc0nxoTsng97wckQIzvPQN5wrLrSiCLMZiJh4dMN4n
   Y4VeAtCaIfVwzT2VbfYHYLtgGtH/GzQQOv10oCaVmoREg5TJ0n+mrUrOs
   bT7iRkyNYAlrvmxBz94LwmtEBAhRqtN9XyrcPNAADXvzwTtw9q8fVxfqK
   1ans8isqXuvYr99KmTmW8a8xPsERyZ4pimcnEzL7CD6V5Ah5MAgsaxX4Y
   I4/Ov6MNK7t7gJ8LyadyIRbY0GWpyzhwvyLir1auGTviPwCNYP3dcLc9L
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10363"; a="300561598"
X-IronPort-AV: E=Sophos;i="5.91,264,1647327600"; 
   d="scan'208";a="300561598"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 03:23:12 -0700
X-IronPort-AV: E=Sophos;i="5.91,264,1647327600"; 
   d="scan'208";a="611771395"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 03:23:11 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nvz1o-000PhN-BE;
        Tue, 31 May 2022 13:23:08 +0300
Date:   Tue, 31 May 2022 13:23:08 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     Shyam-sundar.S-k@amd.com, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com
Subject: Re: [PATCH v3 4/6] pinctrl: amd: Define and use AMD_PINS macro
Message-ID: <YpXsjDEkUVw/KXdu@smile.fi.intel.com>
References: <20220531084322.1310250-1-Basavaraj.Natikar@amd.com>
 <20220531084322.1310250-5-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531084322.1310250-5-Basavaraj.Natikar@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 31, 2022 at 02:13:20PM +0530, Basavaraj Natikar wrote:
> AMD pingroup can be extended to support multi-function pins.
> Hence define and use a macro "AMD_PINS" to represent larger
> number of pins.

...

> +#define AMD_PINS(...) ((const unsigned int []){__VA_ARGS__})

Do you need to have it as GCC expression?

-- 
With Best Regards,
Andy Shevchenko


