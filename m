Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25927744136
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jun 2023 19:29:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbjF3R3p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jun 2023 13:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbjF3R3o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2023 13:29:44 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2D78199C
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 10:29:43 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="365026639"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="365026639"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 10:28:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="862359352"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="862359352"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 30 Jun 2023 10:28:57 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1qFHvT-001AKL-1n;
        Fri, 30 Jun 2023 20:28:55 +0300
Date:   Fri, 30 Jun 2023 20:28:55 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Shenwei Wang <shenwei.wang@nxp.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [EXT] Re: [PATCH] gpio: mxc: add runtime pm support
Message-ID: <ZJ8Q12drayWSyLNE@smile.fi.intel.com>
References: <20230629191903.2423243-1-shenwei.wang@nxp.com>
 <CAHp75Vc5JFrh1HqYQca9BcYALQfVD6A-kHgmc5OpwtvcGC4beA@mail.gmail.com>
 <PAXPR04MB91851FA4382AA267E3C1849A892AA@PAXPR04MB9185.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB91851FA4382AA267E3C1849A892AA@PAXPR04MB9185.eurprd04.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_SOFTFAIL,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 30, 2023 at 05:01:10PM +0000, Shenwei Wang wrote:
> > From: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Sent: Friday, June 30, 2023 4:19 AM

...

> > > +       ret = pm_runtime_get_sync(chip->parent);
> > 
> > reference count disbalance here.
> 
> Seems we shouldn't check the return value here and simply return 0.
> Or should it be changed to " pm_runtime_resume_and_get" ?

It depends. I don't know the goal and what the case will be if PM fails
and you still go with that.

> > > +       return ret < 0 ? ret : 0;

...

> > But here is the question: does your controller support wake from IRQ?
> > 
> > Have you tried to see if the lines that are used for IRQ with
> > gpiod_to_irq() really work with this?
> 
> Yes, the controller supports wake from IRQ. This patch has been
> Verified with the SDCARD plug-in/out use case which use a GPIO line as CD PIN.

Yes, but in that case it has been probably requested. What I'm telling is when
the GPIO IRQ is went via IRQ chip and hence never been requested by GPIO.

...

> > > +       err = pm_runtime_get_sync(&pdev->dev);
> > > +       if (err < 0)
> > 
> > reference count leak here.
> 
> Change to pm_runtime_resume_and_get?

No idea. You know it better than me. See above.

> > > +               goto out_pm_dis;

...

> > Personal view on this is that it makes little sense to do and is prone to
> > subtle bugs with wake sources or other, not so obvious, uses of the GPIO
> > lines. Can you provide the numbers of the current dissipation if the
> > controller is on and no line is requested? Also is there any real example
> > of hardware (existing DTS) that has no GPIO in use?
> 
> While putting the GPIO module itself into power saving mode may not have an
> obvious impact on current dissipation, the function is necessary because the
> GPIO module disables its clock when idle.  This enables the system an
> opportunity to power off the parent subsystem, and this conserves more power.
> The typical i.MX8 SoC features up to 8 GPIO controllers, but most of the
> controllers often remain unused.

Maybe you need to summarize above in the commit message to improve your
selling point.

-- 
With Best Regards,
Andy Shevchenko


