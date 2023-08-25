Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19B387884F5
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Aug 2023 12:32:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240294AbjHYKbr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Aug 2023 06:31:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241882AbjHYKb1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Aug 2023 06:31:27 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7294C133
        for <linux-gpio@vger.kernel.org>; Fri, 25 Aug 2023 03:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692959484; x=1724495484;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qE2FXJd+W/DJXUhTV/KaLCSXSXkJJX3lOpvtFLyhkFk=;
  b=SHo2MTW++nsFKK+9EDTiahNhLEh6eSuRZ9gZFaKAs+Cs6bUpgAJVAlBZ
   OnXrTFsrDfqQZ3NSDe0qN84wgxXy8V6V09JHkBz1r1R5T0E3AsM3c3+qB
   z6ekkd4V05YCeVkEMKtHDwhFR/HdAduszIYCLqcUbHEY+YIFdo+IQyci/
   7hNZv4JxGx9TrN3t/IUWau4zweZLq7LjhzOYa6jljTVTxVxjMG1+md1O3
   +FeJL+p61hQBS+k7znQUfsjwFMyu86qRtkI+nD4wdrDv2IPu+5okGPJrz
   EIBDiMxNd1xyXy1RkM75VnNxJJTpYJ2c0PFe6baGOoxeNG4khnpPe62FF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="359682453"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="359682453"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 03:31:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="911246351"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="911246351"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 25 Aug 2023 03:29:58 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qZU4j-00D5D5-14;
        Fri, 25 Aug 2023 13:29:57 +0300
Date:   Fri, 25 Aug 2023 13:29:57 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yue Haibing <yuehaibing@huawei.com>
Cc:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH -next] pinctrl: lantiq: Remove unsued declaration
 ltq_pinctrl_unregister()
Message-ID: <ZOiCpYQ9zr/EFW0C@smile.fi.intel.com>
References: <20230825092706.14680-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825092706.14680-1-yuehaibing@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 25, 2023 at 05:27:06PM +0800, Yue Haibing wrote:
> From: YueHaibing <yuehaibing@huawei.com>
> 
> Commit 3f8c50c9b110 ("OF: pinctrl: MIPS: lantiq: implement lantiq/xway pinctrl support")
> declared but never implemented it, so can be removed.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


