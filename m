Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C063A458E75
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Nov 2021 13:33:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbhKVMgl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Nov 2021 07:36:41 -0500
Received: from mga03.intel.com ([134.134.136.65]:60414 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234638AbhKVMgl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Nov 2021 07:36:41 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="234719872"
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; 
   d="scan'208";a="234719872"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2021 04:33:34 -0800
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; 
   d="scan'208";a="537859733"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2021 04:33:33 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1mp8Vl-009QnG-3a;
        Mon, 22 Nov 2021 14:33:29 +0200
Date:   Mon, 22 Nov 2021 14:33:28 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] gpio: add sloppy logic analyzer using polling
Message-ID: <YZuOGAxO5ZslW5vB@smile.fi.intel.com>
References: <20210918083307.3195-1-wsa+renesas@sang-engineering.com>
 <20210918083307.3195-2-wsa+renesas@sang-engineering.com>
 <CAHp75Vdv=0i05EitMi6JjbjML-jFD_1M0q7ps2KVHcN4UtFU-w@mail.gmail.com>
 <YUhGkBdXJUI3XadP@ninjato>
 <CAHp75VcXuYLM4cPAb+rv47wz0v+Q6tjek6tKuBj32K81XxkKaA@mail.gmail.com>
 <YZuKyEcsXb8dwiHG@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZuKyEcsXb8dwiHG@ninjato>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 22, 2021 at 01:19:20PM +0100, Wolfram Sang wrote:

...

> > > > > +       if (ret < 0) {
> > > >
> > > > > +               dev_err(dev, "error naming the GPIOs: %d\n", ret);
> > > > > +               return ret;
> > > > > +       }
> > > >
> > > > Perhaps
> > > >
> > > >   return dev_err_probe() ?
> > >
> > > Reading strings from DT can be deferred? I don't think so.
> > 
> > There is a new development, i.e. the documentation for dev_err_probe()
> > is going to be amended to allow this. But I can't quickly find a patch
> > in mailing list with the related discussion.
> 
> I still don't get this one, so if there is new development and you have
> a pointer, I'd be glad to hear about it. Otherwise we can fix it
> incrementally later.

See 7065f92255bb ("driver core: Clarify that dev_err_probe() is OK even w/out
-EPROBE_DEFER").

-- 
With Best Regards,
Andy Shevchenko


