Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 747EE6897C4
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Feb 2023 12:32:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232100AbjBCLck (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Feb 2023 06:32:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbjBCLcj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Feb 2023 06:32:39 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E60BF131
        for <linux-gpio@vger.kernel.org>; Fri,  3 Feb 2023 03:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675423958; x=1706959958;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=EieJvBlczXw3d8osClRp+yumqpYIJllRTUsmKJMLy9c=;
  b=Z/dEkx8uPRL3nCfn3wB/IBOoPIzB/cETfg2WajTaJEi4JtWJVIGCwK6M
   SmD3eYmOsb385lL8HxmQB4BC3Vic5YDmblKgHCf8trVcMaVmuIc7MK0ZM
   HAyAgtOKJGm9Gmy52ho2S6Q18XgwbwLTu7AFIhKtpnXV2aJ2c5aRqYTyt
   F5KhYydxEGlzwrbzHLBPkRFgYo4pRJ3T95Fn47TAbw7quPo9A4YVDjfpY
   gkq+CHas913eWMQ8OJQcOBtHVw05ni0KWxZeZFySF5N4Eu2Z5o7PX1f3W
   DZiLcNm8jP3M46nqS+h1X1GQgS6QZ7PUecYYQWV2vesFJloBSKYIra67L
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="326423382"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; 
   d="scan'208";a="326423382"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 03:32:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="774306486"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; 
   d="scan'208";a="774306486"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 03 Feb 2023 03:32:35 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pNuIz-001ZES-1k;
        Fri, 03 Feb 2023 13:32:33 +0200
Date:   Fri, 3 Feb 2023 13:32:33 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Levente =?iso-8859-1?B?Uul26XN6?= <levente.revesz@eilabs.com>
Cc:     Martyn Welch <martyn.welch@collabora.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Haibo Chen <haibo.chen@nxp.com>, Puyou Lu <puyou.lu@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Nate Drude <nate.d@variscite.com>, linux-gpio@vger.kernel.org,
        Peter Robinson <pbrobinson@gmail.com>
Subject: Re: [RFC PATCH 0/3] gpio: pca953x: Redesign handling of chip types
Message-ID: <Y9zw0Xy2ctkQ383S@smile.fi.intel.com>
References: <7b736829-414a-ba4f-59f5-bc78c27621e5@eilabs.com>
 <Y9vS1dsuMm5XxkdD@smile.fi.intel.com>
 <Y9vTQQlmMd+ZXO4/@smile.fi.intel.com>
 <8c9dc414-9c15-26db-fcae-233c5ca0a171@eilabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c9dc414-9c15-26db-fcae-233c5ca0a171@eilabs.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 03, 2023 at 11:40:50AM +0100, Levente Révész wrote:
> On 02/02/2023 16.14, Andy Shevchenko wrote:
> > On Thu, Feb 02, 2023 at 05:12:22PM +0200, Andy Shevchenko wrote:
> >> Now as I'm thinking more of your nice job, it may be less effort to everybody
> >> if you start from moving the driver to be a real pin control driver united with
> >> GPIO handling.
> 
> I will look into this, it will probably take a few weeks to come up with
> something presentable.

You have that time because the current series marked as RFC and even
if it had been ready it would have not been applied due to release schedule
(we are now at almost v6.2-rc7 and in two and half weeks we expect
 the release to come, so it means you have ~6 weeks of time).

> Thank you for your review so far!

You are welcome!

-- 
With Best Regards,
Andy Shevchenko


