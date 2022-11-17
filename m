Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC48D62D839
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Nov 2022 11:38:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239710AbiKQKiq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Nov 2022 05:38:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239727AbiKQKiC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 05:38:02 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 213225E3D3
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 02:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668681468; x=1700217468;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ljhtXwOZIAkajU0il1alUjH32MQGe0CfPaMqmVnwL54=;
  b=j9uvqn+UYCGvmmTMFr8CauY1whJkyb0PnuVpWBO11eSXIV2iQLhBvqO1
   I9z37sO3LF78PAT55kL9JBE+glJypX5MGNMm/RUouxAfbovio1RF7SS2G
   IIr1Pja4lhLeEH5drI49KVX2MrUQChz6mmTmWaFvnUhFd7J6M1ieRnNyR
   egNpbTEt9zP5e7y0//t65KFjOpXMzfajYj3S8g2Go3tziGAiHHboljsjZ
   9qF5p1R0HVzqRcDg37m7MtcOb7rgJID2hiCKEiSYxEkGRSeISXajuhHZc
   1Khvt//DBX1N9hiCz026qjNkqMNOQ3Msm3dABlgbGQaTnTVrziT7hSLvf
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="292523604"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; 
   d="scan'208";a="292523604"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2022 02:37:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="764713059"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; 
   d="scan'208";a="764713059"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 17 Nov 2022 02:37:45 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ovcHA-00DXCm-0v;
        Thu, 17 Nov 2022 12:37:44 +0200
Date:   Thu, 17 Nov 2022 12:37:44 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Niyas Sait <niyas.sait@linaro.org>, linux-gpio@vger.kernel.org,
        mika.westerberg@linux.intel.com, rafael@kernel.org
Subject: Re: [PATCH RFC v2 2/3] pinconf-generic: clarify pull up and pull
 down config values
Message-ID: <Y3YO+F03Hgu7KVRU@smile.fi.intel.com>
References: <20221115175415.650690-1-niyas.sait@linaro.org>
 <20221115175415.650690-3-niyas.sait@linaro.org>
 <CACRpkdarFa3GYprA98Q2zq5nepe_naY4mZJ0q+HVvz-MBqWEMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdarFa3GYprA98Q2zq5nepe_naY4mZJ0q+HVvz-MBqWEMw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 17, 2022 at 10:30:37AM +0100, Linus Walleij wrote:
> On Tue, Nov 15, 2022 at 6:54 PM Niyas Sait <niyas.sait@linaro.org> wrote:
> 
> > PIN_CONFIG_BIAS_PULL_DOWN and PIN_CONFIG_BIAS_PULL_UP values can
> > be custom or an SI unit such as ohms
> >
> > Signed-off-by: Niyas Sait <niyas.sait@linaro.org>
> 
> This patch is good as-is so I just applied it. No need to resend with
> the ACPI series.

Is it? I think it's visible that it has TAB vs. space issue...

-- 
With Best Regards,
Andy Shevchenko


