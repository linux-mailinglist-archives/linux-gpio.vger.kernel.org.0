Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF2E476BC41
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Aug 2023 20:22:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231922AbjHASWq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Aug 2023 14:22:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230456AbjHASWe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Aug 2023 14:22:34 -0400
Received: from mgamail.intel.com (unknown [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 511DD268D
        for <linux-gpio@vger.kernel.org>; Tue,  1 Aug 2023 11:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690914130; x=1722450130;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qk+v55ylmaMRNH+NF7s+xwvDSP7kAEVKRFS8SGtTcY0=;
  b=PYON2AUamguOu0rlMIYlhY/KZ+m7M4UIYql6P7qoYMhMYA/jTPabhrHS
   NjOOnIrvU+xizNwlOmd4tQwbv3Eqaa8nfjQ8quDJmSjg53+7o+qUL/cAi
   ruUL7hQIXaRXwm8x77r/wmsb+9GuhZSJ031tJxO950JIqkSCPX2Onp/YE
   czIksG8Uw5TZi1KahsPPbVLZCrQXHHr57TCfzkhjpqLR+A/0nLpEhSOri
   ICcF2UlGxAxITx31WsWLlPZM8u8hkSRTKf6pZLw7Ki3MTnvDcSMuBQKcy
   VTLZRj26G4HQKgG0P+T84JM6qGixvY/6955ujsbBW1eRk2AOQgaeBRE8W
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="369379838"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="369379838"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 11:21:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="1059508163"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="1059508163"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 01 Aug 2023 11:21:22 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qQtzk-00EKub-2X;
        Tue, 01 Aug 2023 21:21:20 +0300
Date:   Tue, 1 Aug 2023 21:21:20 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Zhu Wang <wangzhu9@huawei.com>
Cc:     bartosz.golaszewski@linaro.org, thor.thayer@linux.intel.com,
        linus.walleij@linaro.org, brgl@bgdev.pl,
        linux-gpio@vger.kernel.org, u.kleine-koenig@pengutronix.de,
        arnd@arndb.de
Subject: Re: [PATCH -next] gpio: altera-a10sr: remove redundant of_match_ptr
Message-ID: <ZMlNIBaIg5I2zbkz@smile.fi.intel.com>
References: <20230801033428.220493-1-wangzhu9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801033428.220493-1-wangzhu9@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 01, 2023 at 11:34:28AM +0800, Zhu Wang wrote:
> The driver depends on CONFIG_OF, so it is not necessary to use
> of_match_ptr here.

of_match_ptr()

> 
> Even for drivers that do not depend on CONFIG_OF, it's almost always
> better to leave out the of_match_ptr(), since the only thing it can
> possibly do is to save a few bytes of .text if a driver can be used both
> with and without it. Hence we remove of_match_ptr.

of_match_ptr()


Driver even doesn't include required of.h for this...
But with your change you have to provide mod_devicetable.h.

Good change,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
after updating the commit message and adding missing header.

-- 
With Best Regards,
Andy Shevchenko


