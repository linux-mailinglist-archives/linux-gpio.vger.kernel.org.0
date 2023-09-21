Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E43D37AA0DB
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Sep 2023 22:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232176AbjIUUt0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Sep 2023 16:49:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232442AbjIUUsg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Sep 2023 16:48:36 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2F04561FF
        for <linux-gpio@vger.kernel.org>; Thu, 21 Sep 2023 10:49:52 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="446947501"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="446947501"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 02:55:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="723676393"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="723676393"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 02:55:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC0)
        (envelope-from <andy@kernel.org>)
        id 1qjGOr-0000000Gr7S-1QmO;
        Thu, 21 Sep 2023 12:55:09 +0300
Date:   Thu, 21 Sep 2023 12:55:08 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc:     Gregory CLEMENT <gregory.clement@bootlin.com>,
        Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 3/7] platform: cznic: turris-omnia-mcu: Add support
 for MCU connected GPIOs
Message-ID: <ZQwS/DXBt/kyyU5r@smile.fi.intel.com>
References: <20230919103815.16818-1-kabel@kernel.org>
 <20230919103815.16818-4-kabel@kernel.org>
 <ZQmbd211FzPjA97r@smile.fi.intel.com>
 <20230920190818.50b2018b@dellmb>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230920190818.50b2018b@dellmb>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 20, 2023 at 07:08:18PM +0200, Marek Behún wrote:
> On Tue, 19 Sep 2023 16:00:39 +0300
> Andy Shevchenko <andy@kernel.org> wrote:
> > On Tue, Sep 19, 2023 at 12:38:11PM +0200, Marek Behún wrote:

...

> > Ditto for all cases like this.
> 
> checkpatch warns: 
>   ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP

So, fix checkpatch then. It has false positives, because it doesn't know
if the actual error code will sneak outside the kernel or not. But in
the subsystem we internally use ENOTSUPP.

...

> Linus suggested using guards, so I will refactor this away.

Even better.

...

> > > +		dev_err(&mcu->client->dev, "Cannot set GPIOs:
> > >   %d\n", err);  
> > 
> > How is useful this one?
> 
> The function does not return, this way we will know something has gone
> wrong. I am used to do this from the networking subsystem, where people
> at least from mv88e6xxx wanted such behavior. Do you want me to drop
> this?

You are the developer and owner of the specific hardware, if you have a good
justification for this message _in production_, then leave it, otherwise drop.

...

> > > +	bitmap_zero(valid_mask, ngpios);  
> > 
> > No need.
> > 
> > Also do you have bitops.h included?
> 
> bitmap.h actually for this

Right, but I already thought a step forward, when you drop bitmap APIs,
the bitops are still in place.

...

> > > +	rising = reply[0] | (reply[2] << 8) | (reply[4] << 16) |
> > > +		 (reply[6] << 24);
> > > +	falling = reply[1] | (reply[3] << 8) | (reply[5] << 16) |
> > > +		  (reply[7] << 24);  
> > 
> > With a help of two masks, you can access to the both edges as to
> >   64-bit value and simplify the code.
> 
> Huh? As in
>   rising = reply & 0x00ff00ff00ff00ff;
>   falling = reply & 0xff00ff00ff00ff00;
> ?
> But then I can't or the rising bit with the corresponding falling bit
> to get pending...
> Or I guess i can with:
>   pending = rising & (pending >> 8);
> 
> Am I understanding you correctly?
> 
> But then I would need to store the mask in driver data as a 64-bit
> value with half the data not used. Also the CPU is 32-bit.

If you use proper bitmaps, perhaps this will be easier. You can use one for
each and merge them whenever you want (with bitmap_or() call) or split (with
bitmap_and() respectively):

	bitmap_or(full, raising, failing); // merge
	bitmap_and(raising, full, rasing_mask); // split

...

> > ATTRIBUTE_GROUPS() ?
> 
> I only want to create ane attribute_group. (I am using
> devm_device_add_group(), not devm_device_add_groups()).

...and you should not use that APIs.

> > > +	err = devm_device_add_group(dev, &omnia_mcu_gpio_group);  
> > 
> > No way, no-one should use the API scheduled for removal.
> > What's wrong with .dev_groups ?
> 
> Can I add them conditionally? GPIO chip is always created, but the
> patch 4/7 only adds the attributes conditionally. Is it possible via
> .dev_groups?

Yes. You use __ATTRIBUTE_GROUPS() and .is_visible callback.

...

> > > +void omnia_mcu_unregister_gpiochip(struct omnia_mcu *mcu)
> > > +{
> > > +	if (!(mcu->features & FEAT_NEW_INT_API))
> > > +
> > >   cancel_delayed_work_sync(&mcu->button_release_emul_work); +
> > > +	mutex_destroy(&mcu->lock);  
> > 
> > Wrong order?
> 
> No, the mutex may be used in the work. Can't destroy it first. Or am I
> misunderstanding something?

I mean you are using a lot of devm(), can mutex be used in IRQ or whatever
that can be triggered after this call?

...

> > >  	struct i2c_client *client;
> > >  	const char *type;
> > >  	u16 features;
> > > +
> > > +	/* GPIO chip */
> > > +	struct gpio_chip gc;  
> > 
> > Making this a first member may lead to the better code. Check with
> >   bloat-o-meter.
> 
> kabel@dellmb ~/linux $ ./scripts/bloat-o-meter \
>   turris-omnia-mcu.o turris-omnia-mcu-gpiochip-first.o
> add/remove: 0/0 grow/shrink: 9/0 up/down: 52/0 (52)
> Function                                     old     new   delta
> omnia_mcu_register_gpiochip                  840     852     +12
> omnia_mcu_probe                              696     708     +12
> omnia_mcu_unregister_gpiochip                 20      24      +4
> omnia_irq_bus_sync_unlock                    256     260      +4
> omnia_irq_bus_lock                            36      40      +4
> omnia_gpio_get_multiple                      872     876      +4
> omnia_gpio_get                               372     376      +4
> fw_features_show                              28      32      +4
> front_button_mode_show                       260     264      +4
> Total: Before=10468, After=10520, chg +0.50%
> 
> Seems the code grew when I swapped it.

Thanks for checking! It means that access to client pointer is needed
more often.

-- 
With Best Regards,
Andy Shevchenko


