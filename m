Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5204624B50
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Nov 2022 21:14:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbiKJUOu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Nov 2022 15:14:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbiKJUOt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Nov 2022 15:14:49 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D9BE43841
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 12:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668111289; x=1699647289;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4yBmpt/Fv1PbYctoR7mLWTtuvc33tN+wCt4Y+0zAQTk=;
  b=aC1eYwFt3GvBEHutukljqiOTxutkzbJF3l4qoJZ91T2oze+KAngDHQiB
   fAeo8JxhPTocGy3k6jyao4ROfh99vAHWymDod3iVChLVyCMhpqhLhYHjj
   SMjnHydFl833xl8fT8ecb4QpQtIsZIukqVOj2dEZKhLKuvPe2iZODsn5V
   ICxiGF4nKEmUSlyMtfaXEMeG0ZxGkHXRUuVk9ELu4bQTuK/mdE91WWs0E
   Tg7bwuy/RzK6seH8OKQfUSf4rKOBsRp6xr9iuqcXWhVMWsCWJmshipzcD
   eGdr8v6klEXIF6q3TLrjzdrmfyuVF8KfO5M9SqZLdd+bkS7A1SIncn0Zh
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="312571319"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; 
   d="scan'208";a="312571319"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2022 12:14:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="670495555"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; 
   d="scan'208";a="670495555"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 10 Nov 2022 12:14:47 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1otDwj-00AKJG-1B;
        Thu, 10 Nov 2022 22:14:45 +0200
Date:   Thu, 10 Nov 2022 22:14:45 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Niyas Sait <niyas.sait@linaro.org>
Cc:     linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com,
        rafael@kernel.org, linus.walleij@linaro.org
Subject: Re: [PATCH RFC 0/3] pinctrl: add ACPI support to pin controller
Message-ID: <Y21btYwNRMD4xXXL@smile.fi.intel.com>
References: <20221110191258.1134378-1-niyas.sait@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221110191258.1134378-1-niyas.sait@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 10, 2022 at 07:12:55PM +0000, Niyas Sait wrote:
> This is a proposal for adding ACPI support to pin controller.
> 
> The patch supports following resources introduced in ACPI from v6.2
> 
> - PinFunction
> - PinConfig
> - PinGroupFunction
> - PinGroupConfig
> - PinGroup
> 
> The patch has been tested on NXP I.MX8MP Plus platform with ACPI.

Thank you very much for this work!

I will take time to review it, presumably next week.

I'm not sure it will go to the v6/2-rc1 due to tough time range
(we are almost at -rc5), I hope you are not in such hurry.

> Niyas Sait (3):
>   pinctrl: add support for acpi PinGroup resource
>   pinconf-generic: add pull up and pull down config with resistance
>   pinctrl: add support for acpi pin function and config resources
> 
>  drivers/pinctrl/Makefile                |   1 +
>  drivers/pinctrl/core.c                  |  19 +-
>  drivers/pinctrl/core.h                  |   3 +
>  drivers/pinctrl/pinctrl-acpi.c          | 450 ++++++++++++++++++++++++
>  drivers/pinctrl/pinctrl-acpi.h          |  50 +++
>  include/linux/pinctrl/pinconf-generic.h |   6 +
>  include/linux/pinctrl/pinctrl.h         |  15 +
>  7 files changed, 540 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/pinctrl/pinctrl-acpi.c
>  create mode 100644 drivers/pinctrl/pinctrl-acpi.h
> 
> -- 
> 2.25.1
> 

-- 
With Best Regards,
Andy Shevchenko


