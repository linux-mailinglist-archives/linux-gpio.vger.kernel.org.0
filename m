Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FE0E7AD5F7
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Sep 2023 12:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231888AbjIYKaS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Sep 2023 06:30:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232377AbjIYKaN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Sep 2023 06:30:13 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4DFA1BB
        for <linux-gpio@vger.kernel.org>; Mon, 25 Sep 2023 03:30:02 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="380093961"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="380093961"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 03:30:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="724943166"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="724943166"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 03:29:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC0)
        (envelope-from <andy@kernel.org>)
        id 1qkiqe-00000000JnZ-1xTn;
        Mon, 25 Sep 2023 13:29:52 +0300
Date:   Mon, 25 Sep 2023 13:29:52 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc:     Gregory CLEMENT <gregory.clement@bootlin.com>,
        Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 3/7] platform: cznic: turris-omnia-mcu: Add support
 for MCU connected GPIOs
Message-ID: <ZRFhILlFx3J1Yxy/@smile.fi.intel.com>
References: <20230919103815.16818-1-kabel@kernel.org>
 <20230919103815.16818-4-kabel@kernel.org>
 <ZQmbd211FzPjA97r@smile.fi.intel.com>
 <20230920190818.50b2018b@dellmb>
 <ZQwS/DXBt/kyyU5r@smile.fi.intel.com>
 <20230921222453.4b3bdb4c@thinkpad>
 <ZQ2iULDcH6kdk7cJ@smile.fi.intel.com>
 <20230925120356.52bcd639@dellmb>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230925120356.52bcd639@dellmb>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 25, 2023 at 12:03:56PM +0200, Marek Behún wrote:
> On Fri, 22 Sep 2023 17:18:56 +0300
> Andy Shevchenko <andy@kernel.org> wrote:
> > On Thu, Sep 21, 2023 at 10:25:01PM +0200, Marek Behún wrote:
> > > On Thu, 21 Sep 2023 12:55:08 +0300
> > > Andy Shevchenko <andy@kernel.org> wrote:  

...

> > > > > > > +	rising = reply[0] | (reply[2] << 8) | (reply[4] << 16) |
> > > > > > > +		 (reply[6] << 24);
> > > > > > > +	falling = reply[1] | (reply[3] << 8) | (reply[5] << 16) |
> > > > > > > +		  (reply[7] << 24);      
> > > > > > 
> > > > > > With a help of two masks, you can access to the both edges as to
> > > > > >   64-bit value and simplify the code.    
> > > > > 
> > > > > Huh? As in
> > > > >   rising = reply & 0x00ff00ff00ff00ff;
> > > > >   falling = reply & 0xff00ff00ff00ff00;
> > > > > ?
> > > > > But then I can't or the rising bit with the corresponding falling bit
> > > > > to get pending...
> > > > > Or I guess i can with:
> > > > >   pending = rising & (pending >> 8);
> > > > > 
> > > > > Am I understanding you correctly?
> > > > > 
> > > > > But then I would need to store the mask in driver data as a 64-bit
> > > > > value with half the data not used. Also the CPU is 32-bit.    
> > > > 
> > > > If you use proper bitmaps, perhaps this will be easier. You can use one for
> > > > each and merge them whenever you want (with bitmap_or() call) or split (with
> > > > bitmap_and() respectively):
> > > > 
> > > > 	bitmap_or(full, raising, failing); // merge
> > > > 	bitmap_and(raising, full, rasing_mask); // split  
> > > 
> > > Hmm. But then what? I or the result and use it as pending interrupt
> > > bitmap, to be iterated over. The indexes of the bits correspond to the
> > > constants in the MCU API.
> > > 
> > > So after your suggestion I have rising and falling containgin
> > >   rising = 00rr00rr00rr00rr; /* r means rising bits */
> > >   falling = 00ff00ff00ff00ff; /* f means falling bits */
> > >   pending = rising | falling;
> > > which means:
> > >   pending = pp00pp00pp00pp; /* p means pending bits */
> > > But these bit positions do not correspond to the interrupt number
> > > anymore.
> > > 
> > > I still think the de-interleaving of the buffer from
> > >   rr ff rr ff rr ff rr ff
> > > into two words:
> > >   rising = rrrrrrrr;
> > >   falling = ffffffff;
> > > is simpler...  
> > 
> > There are two sides of this: OS and hardware. See Xilinx GPIO driver how it's
> > made there. But before going that way, check on
> > https://lore.kernel.org/all/ZOMmuZuhdjA6mdIG@smile.fi.intel.com/
> > That APIs you would need I am pretty sure.
> 
> Andy, thank you for patience in reviewing this.
> 
> Hmm. I like the names, scatter and gather. In the firmware, I used
> interleave and deinterleave, see
>   https://gitlab.nic.cz/turris/hw/omnia_hw_ctrl/-/blob/master/src/drivers/i2c_iface.c#L360
> 
> But those functions work bit-wise. I realize that the I2C transfers in
> the driver are so slow that such bit-wise cycling over a bitmap won't
> matter much, but I still find my original proposal more simple and
> straight-forward. But I will cave if you insist. Please let me know
> (and can I then send your local patch in the series?)

You can. but I need to add test cases there.

Yes, I think the best is to have hardware values and Linux cached ones
to be separated. Let me try my best and send it out this week.

...

> > > > > > > +	if (!(mcu->features & FEAT_NEW_INT_API))
> > > > > > > +
> > > > > > >   cancel_delayed_work_sync(&mcu->button_release_emul_work); +
> > > > > > > +	mutex_destroy(&mcu->lock);      
> > > > > > 
> > > > > > Wrong order?    
> > > > > 
> > > > > No, the mutex may be used in the work. Can't destroy it first. Or am I
> > > > > misunderstanding something?    
> > > > 
> > > > I mean you are using a lot of devm(), can mutex be used in IRQ or whatever
> > > > that can be triggered after this call?  
> > > 
> > > OK, I think I need to free the irq before canceling the work. Thank you!  
> > 
> > Can you rather switch everything to be devm managed?
> 
> There are no devm_ calls for mutex and work initialization. Are you
> suggesting that I should write a release function for the gpio
> sub-driver? Something like
> 
> static void omnia_gpiochip_release(dev, res)
> {
>   cancel_work();
>   mutex_destroy();
> }

Not together, but
- for mutex use devm_add_action_or_reset() as done in many other drivers
  for the same reason;
- for the work we have devm_work_autocancel()
  (you need to include devm-helpers.h)

> int omnia_mcu_register_gpiochip(mcu)
> {
>   ...
>   x = devres_alloc(omnia_gpiochip_release);
>   devres_add(dev, x);
>   ...
> }

-- 
With Best Regards,
Andy Shevchenko


