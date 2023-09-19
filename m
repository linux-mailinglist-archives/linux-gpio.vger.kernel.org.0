Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA5CD7A6AB2
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Sep 2023 20:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbjISS1V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Sep 2023 14:27:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbjISS1V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Sep 2023 14:27:21 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29EC690;
        Tue, 19 Sep 2023 11:27:15 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="382772293"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="382772293"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 11:27:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="861654643"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="861654643"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 11:27:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC0)
        (envelope-from <andy@kernel.org>)
        id 1qifRA-0000000BuCz-3EUB;
        Tue, 19 Sep 2023 21:27:04 +0300
Date:   Tue, 19 Sep 2023 21:27:04 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc:     Gregory CLEMENT <gregory.clement@bootlin.com>,
        Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-gpio@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 2/7] platform: cznic: Add preliminary support for
 Turris Omnia MCU
Message-ID: <ZQnn+Gi0xVlsGCYA@smile.fi.intel.com>
References: <20230919103815.16818-1-kabel@kernel.org>
 <20230919103815.16818-3-kabel@kernel.org>
 <ZQmUFPvIx91+ps6k@smile.fi.intel.com>
 <20230919171638.19bc1619@dellmb>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230919171638.19bc1619@dellmb>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_SOFTFAIL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 19, 2023 at 05:16:38PM +0200, Marek Behún wrote:
> On Tue, 19 Sep 2023 15:29:08 +0300
> Andy Shevchenko <andy@kernel.org> wrote:
> > On Tue, Sep 19, 2023 at 12:38:10PM +0200, Marek Behún wrote:

...

> > >  obj-$(CONFIG_GOLDFISH)		+= goldfish/
> > >  obj-$(CONFIG_CHROME_PLATFORMS)	+= chrome/
> > >  obj-$(CONFIG_SURFACE_PLATFORMS)	+= surface/
> > > +obj-$(CONFIG_CZNIC_PLATFORMS)	+= cznic/  
> > 
> > Why not ordered (to some extent) here (as you did in the other file)?
> 
> Where should I put it? The other entries are not ordered, see
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/platform/Makefile?h=v6.6-rc2

With the visible context above, at least after chrome already much better, no?

...

> > > +turris-omnia-mcu-objs		:= turris-omnia-mcu-base.o  
> > 
> > objs is for user space tools. Kernel code should use m,y.
> 
> I don't understand. There are plenty driver using -objs. The driver
> consists of multiple C source files. I thought this should be done as
>   obj-$(CONFIG_XXX) += xxx.o
>   xxx-objs := xxx-a.o xxx-b.o xxx-c.o
> 
> If you choose CONFIG_XXX = y, then the driver will be compiled into
> kernel, if you choose CONFIG_XXX = m, then the driver will be a module
> xxx.ko.

Hmm... Maybe I mixed something... Let me check.
For now than it's okay.

...

> > > +#include <linux/hex.h>
> > > +#include <linux/module.h>  
> > 
> > Missing types.h, sysfs.h, mod_devicetable.h, i2c.h, ...
> 
> i2c.h comes from turris-omnia-mcu.h. The others I will fix. Does the
> the .c file also include all those headers if it includes a local
> header already?

For generic ones, yes.

...

> > > +	if (ret < 0)  
> > 
> > Can it return positive value? What would be the meaning of it?
> 
> Originally I had it return 0 on success, but recently I've had a
> discussion about this same thing with LED subsystem maintainer about
> some LED patches, Lee Jones, who requested the _read function to return
> number of bytes read on success. See at
>   https://lore.kernel.org/linux-leds/20230821122644.GJ1380343@google.com/
> where he says:
>   Read and write APIs, even abstracted ones such as these generally
>   return the number of bytes successfully read and written respectively.
>   If you are going to normalise, then please do so against this
>   standard.
> I do not agree with him, since this is a local command accessor which
> only succeeds if all the bytes are read/written as requested. But I
> adjusted my code as per his request since he is the maintainer.

This is strange. For example, regmap APIs never returns amount of data written
or read. I think it's solely depends on the API. It might be useful for i²c
APIs, in case you can do something about it. but if you have wrappers on top
of that already (meaning not using directly the i2c_*() calls, I dunno the
positive return is anyhow useful.

> I will change the code back so that it returns 0 on success instead of
> the number of bytes written.

> > > +		return ret;  

...

> > > +	version[40] = '\0';  
> > 
> > How do you know the version has enough space?
> 
> The function is only use within the file, and both users know how much
> space it needs. But ok, I shall enforce it with the static keyword as
>   static int
>   omnia_get_version_hash(...,
> 			 u8 version[static 2*OMNIA_FW_VERSION_LEN + 1]);
> Would that be okay?

Perhaps, it's a thing in a category "TIL", and it seems we have so few callers
of that.

...

> > > +	int err;  
> > 
> > In two near functions you already inconsistent in the naming of the
> > return code variable. Be consistent across all your code, i.e. choose
> > one name and use it everywhere.
> 
> I use
>   ret - when the return value can also be positive and mean something
>   err - when the return value is either 0 (no error) or negative errno
> Is this inconsistent?

TBH sounds good, but I close to never had heard about such a distinction in
a Linux kernel source file(s).

...

> > > +	int status;  
> > 
> > My gosh, it's a _third_ name for the same!
> 
> The variable holds value of the status register, which is needed at
> another point in this function. I thought naming it just "ret" would
> cause confusions... Do you really propose to rename it such?

It's not bad per se, just put yourself on the place of somebody who would like
to understand the semantics of all these variables. Maybe you can add a comment
on top explaining that (in short)?

...

> > > +	for (int i = 0; i < ARRAY_SIZE(features); ++i) {  
> > 
> > Why signed?
> 
> Because it is shorter and makes no difference and there are tons of
>   for (int i = 0; i < ARRAY_SIZE(x); i++)
> in the kernel already. But if you really want, I can change it. Please
> let me know.

It just makes harder to get the code, because of possible unneeded questions
like "if it's a signed type, maybe it's on purpose?"

> > Why pre-increment?
> 
> Again, it makes no difference, is widely used in the kernel and I
> personally prefer it. But I will change it if you want.

Pre-increment usually also a sign of something special about the iterator
variable. In non-special cases we use post-increment. And if you count
the use of each you will see the difference.

...

> > > +		dev_info(dev,
> > > +			 "Consider upgrading MCU firmware with the
> > > omnia-mcutool utility.\n");  
> > 
> > You have so-o many dev_info() calls, are you sure you not abusing use
> > of that?
> 
> I want the users to upgrade the MCU firmware. These infos are only
> printed during probe time, and won't be printed at all if the firmware
> is upgraded. Is this a problem?

Depends how really useful they are. If you think it's way to go, go for it.

...

> > > +	if (likely(ret == ARRAY_SIZE(msgs)))  
> > 
> > Why likely()? Please, justify.
> 
> Becuase it is unlikely the I2C transaction will fail. In most cases, it
> does not.

Yes, but why likely() is needed? So, i.o.w. what's the benefit in _this_ case?

> > > +		return len;  

...

> > > +enum commands_e {  
> > 
> > Are you sure the name is unique enough / properly namespaced?
> > Same Q to all enums.
> 
> I can change it. I wanted it to be compatible with the header in the
> firmware repository.

Are these being generated, or also statically written in that repo?
If the latter, I think better to use more unique naming schema in
the kernel.

-- 
With Best Regards,
Andy Shevchenko


