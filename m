Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B02DD68178C
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jan 2023 18:26:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237028AbjA3R0a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Jan 2023 12:26:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236200AbjA3R03 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2023 12:26:29 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D35CA3EC66
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2023 09:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675099588; x=1706635588;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UEmBhROALds/ZPkqySC2j3/vDeVFKW78VyHcs2alA08=;
  b=C3Dk4iy3TUTPgn70LtXnHW3eAR8pfdIn0v5CecAseWC2lWCXY0GdYvuu
   Aa6g8UQPTL4B3O3AU7R0nmdOihQwfNAjU/PT3hHTtezArbGa2V5rGUodA
   9kFOvH6Nb7lUynTBRpO35eR+ArTISKLnhiQE+aTRJnCs63Nx+vivQ9byB
   64+UOLbYtFwZjnP6FQAceo38gr9o9bkbyJ6Kk5btgaNIpCetYhn921JBH
   ajleszqh0afOAQyoeM5nGnp0FUbbhyGbCzgCVOR9jz+vOHnl3cNNFfLMJ
   u1ujiRCWatywXnO4Yxkx4e0d06i71Yvcg9ROFUWBihNBcLF3hbNN5U+lR
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="413839429"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="413839429"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 09:26:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="838034315"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="838034315"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 30 Jan 2023 09:26:25 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pMXvD-00HSD1-0i;
        Mon, 30 Jan 2023 19:26:23 +0200
Date:   Mon, 30 Jan 2023 19:26:22 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Marco Felsch <m.felsch@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Robert Schwebel <r.schwebel@pengutronix.de>,
        Sascha Hauer <sha@pengutronix.de>,
        bartosz.golaszewski@linaro.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        christophe.leroy@csgroup.eu, linux-gpio@vger.kernel.org,
        kernel@pengutronix.de, shawnguo@kernel.org
Subject: Re: GPIO static allocation warning with v6.2-rcX
Message-ID: <Y9f9vsbFjwLcqhp0@smile.fi.intel.com>
References: <20230120104647.nwki4silrtd7bt3w@pengutronix.de>
 <CAMRc=Mdo0tvJUJ2G+9BGfyVYBwUQKRZU36JEUZdxVVnXETZHLg@mail.gmail.com>
 <20230125093548.GB23347@pengutronix.de>
 <CACRpkdbcrTv+=7Ev750O=UO=V=afp5NnTT4znb0rzWLkom+_cg@mail.gmail.com>
 <20230126104927.GE23347@pengutronix.de>
 <20230129183339.GY24167@pengutronix.de>
 <CACRpkdYRynwJJZR5uCEn9rmE3c8p7R8SQdXC2FkzRUkBYRjErg@mail.gmail.com>
 <20230130110252.cnw4ex6g3gc5bl3w@pengutronix.de>
 <CACRpkdb-LbRrg0gwB6ArJ-=YdM5TtXVN3oZf58hPCppnt8ZUjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdb-LbRrg0gwB6ArJ-=YdM5TtXVN3oZf58hPCppnt8ZUjg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 30, 2023 at 04:01:49PM +0100, Linus Walleij wrote:
> On Mon, Jan 30, 2023 at 12:02 PM Marco Felsch <m.felsch@pengutronix.de> wrote:
> > On 23-01-30, Linus Walleij wrote:
> > > On Sun, Jan 29, 2023 at 7:33 PM Robert Schwebel
> > > <r.schwebel@pengutronix.de> wrote:
> > >
> > > > While this could also be done with a daemon offering a dbus api, this
> > > > would be significantly more complex. In a critical environment, one
> > > > needs to make sure that the daemon process never fails, otherwhise the
> > > > power of the DuT would maybe be in a random state. Then of course one
> > > > can add a watchdog, but with the current sysfs interface it's really
> > > > simple. Of course that would also work if the new interface would offer
> > > > a "keep this line as it is" feature, but adding a dbus daemon just for
> > > > keeping the state of a pin sounds overcomplex when the kernel could also
> > > > provide that functionality.

Kernel provides it with a cost of a lot of downsides. That's why we moved to
character device approach which is already complex enough. And yeah, the best
what we can do now to support persistent states is to run a daemon.

This also solves the potential security issue (wrong process to access GPIO)
with legacy interface.

No doubt we need to kill sysfs GPIO ABI.

> > > One issue we face as developers is scaleability. Things that
> > > seem straight forward on a single board computer in a lab get
> > > really complex in a big system with man GPIO chips.
> > >
> > > One of the big dangers of the sysfs ABI is that it is dependent on
> > > probe order which the kernel sadly does not really guarantee.
> >
> > Does it? At least the drive I listed (e.g. the imx gpio driver) uses
> > aliases to make it reliable.
> 
> I'm not sure that is the intended use of the aliases in device tree.
> (Rob can maybe answer this.)
> 
> Besides, the problem exist also in ACPI (think every x86
> laptop) which does not have anything like the alias mechanism
> AFAIK. If it does, Andy will tell us.

We never rely on the pure numbers on ACPI based platforms. Yeah, we have couple
of drivers contradict this, but because of wrong numbers in the ACPI tables
(BIOS bugs) which should have not happened to begin with.

And yes, we don't have aliases because we don't need them. You can always
access GPIO pins based on the naming of the controller + relative number of
line on it. I do not understand why you chose aliases approach instead of
making your scripts more robust based on the other information available.

-- 
With Best Regards,
Andy Shevchenko


