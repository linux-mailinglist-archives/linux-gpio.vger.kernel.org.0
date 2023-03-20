Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D11FD6C1146
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Mar 2023 12:54:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231252AbjCTLyl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Mar 2023 07:54:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231300AbjCTLyj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Mar 2023 07:54:39 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA5A810435;
        Mon, 20 Mar 2023 04:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679313272; x=1710849272;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=tSGuRyYCkEG5apEu/urBdXyfINko5BoAavDLnCG0vqA=;
  b=S9O9o4hmdt1CkPO/rM1kpZ7MFVwLUalPk+GFzsdeGSudrtCeoxGtMFoE
   uC6CFzmuFhkRzutilHkBYv7tLBx8GrqjcFwFWqtL/X11U1vOfTBQ8GD/z
   vMtO8EzVKsia1yBh2KVg1/6TiJWMSCPRCl+i6tx0LxIWP5JkILbjbGY2z
   Rby5wGiUBmlU6t2rTcQyxAT7URKVuf/SP8jbzLwg07+XH/RB0xAbfWfFF
   u8paG+Ekof/pFs30ZpmS2MeoKi8/erM4H+mb+Vbb+p6OjxtV2a6X3lNAQ
   hPVdQ/mR0B19zblLflJLI8lNfMHi4sDzA03fOAWbl/XmV5cj4QeVbHr1h
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="319040997"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="319040997"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 04:54:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="804880875"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="804880875"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 20 Mar 2023 04:54:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1peE5q-006Fq3-2q;
        Mon, 20 Mar 2023 13:54:26 +0200
Date:   Mon, 20 Mar 2023 13:54:26 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Lee Jones <lee@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v1 1/1] backlight: hx8357: Convert to agnostic GPIO API
Message-ID: <ZBhJctqSkdtoUmBi@smile.fi.intel.com>
References: <20230317185230.46189-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdYXTk2pzXEM9MTjt=oT-CbhENABSLeb9dN7ZvEy8oqiag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYXTk2pzXEM9MTjt=oT-CbhENABSLeb9dN7ZvEy8oqiag@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 17, 2023 at 09:53:40PM +0100, Linus Walleij wrote:
> On Fri, Mar 17, 2023 at 7:51 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > The of_gpio.h is going to be removed. In preparation of that convert
> > the driver to the agnostic API.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Thanks for fixing this Andy!
> 
> > -#if !IS_ENABLED(CONFIG_LCD_HX8357)
> > +#if IS_ENABLED(CONFIG_LCD_HX8357)
> >                 /*
> >                  * Himax LCD controllers used incorrectly named
> >                  * "gpios-reset" property and also specified wrong
> > @@ -452,7 +452,7 @@ static struct gpio_desc *of_find_gpio_rename(struct device_node *np,
> >                  */
> >                 const char *compatible;
> >         } gpios[] = {
> > -#if !IS_ENABLED(CONFIG_LCD_HX8357)
> > +#if IS_ENABLED(CONFIG_LCD_HX8357)
> >                 /* Himax LCD controllers used "gpios-reset" */
> >                 { "reset",      "gpios-reset",  "himax,hx8357" },
> >                 { "reset",      "gpios-reset",  "himax,hx8369" },
> 
> Eh what happened here .. it's even intuitively wrong.

I believe it had to be something  like

	#if 0 && IS_ENABLED()

to show that this change is for the future.
Currently it does something unneeded for the kernels with that option off.

> I would add
> Fixes: fbbbcd177a27 ("gpiolib: of: add quirk for locating reset lines
> with legacy bindings")

I'm not sure. But it's fine, I can add it. Just want to double confirm
you really want this Fixes tag.

> It wasn't used until now it seems so not a regression and no
> need for a separate patch.

Exactly why I'm not sure about the tag :-)

> Other than that it looks correct.
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thank you!

-- 
With Best Regards,
Andy Shevchenko


