Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEC8829E5A8
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 09:04:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbgJ2IEv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Oct 2020 04:04:51 -0400
Received: from mga12.intel.com ([192.55.52.136]:57828 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725807AbgJ2IEd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 29 Oct 2020 04:04:33 -0400
IronPort-SDR: iQHoGSXV+DFmWaMuLrSvX90gr0g8eD2FqmR5LhwALk8eX+ujvlbg6jCgXoFiWsaJPHKvpSIJ+z
 hqPanSkGlUDg==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="147676230"
X-IronPort-AV: E=Sophos;i="5.77,429,1596524400"; 
   d="scan'208";a="147676230"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 01:04:33 -0700
IronPort-SDR: lwT/dKncOx5kf3TRp5J0H5XXaCISUOoeOR8tDgFy3UVAUT8vt6avsh5BsnIP+TMN0RQt3VgENg
 L4H5dy1e2I9A==
X-IronPort-AV: E=Sophos;i="5.77,429,1596524400"; 
   d="scan'208";a="536572832"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 01:04:26 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 29 Oct 2020 10:04:24 +0200
Date:   Thu, 29 Oct 2020 10:04:24 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Coiby Xu <coiby.xu@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        wang jun <availa@outlook.com>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: Any other ways to debug GPIO interrupt controller (pinctrl-amd)
 for broken touchpads of a new laptop model?
Message-ID: <20201029080424.GM2495@lahna.fi.intel.com>
References: <69853d2b-239c-79d5-bf6f-7dc0eec65602@redhat.com>
 <4f02cbdf-e1dd-b138-4975-118dd4f86089@redhat.com>
 <a07d3890-f560-855f-3631-a3d5848dcdf5@redhat.com>
 <20201014042420.fkkyabmrkiekpmfw@Rk>
 <df2c008b-e7b5-4fdd-42ea-4d1c62b52139@redhat.com>
 <20201026225400.37almqey2wxyazkn@Rk>
 <f15806d6-32e2-c6b0-8f96-670a196380a8@redhat.com>
 <CAHp75VcwiGREBUJ0A06EEw-SyabqYsp+dqs2DpSrhaY-2GVdAA@mail.gmail.com>
 <86963e59-3661-c43c-4e08-a0f9b9e7ed07@redhat.com>
 <CAHp75VcEr0AcdM2+ig5neMQn+5cfuttpFuAak7CkSO-qVjPeCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VcEr0AcdM2+ig5neMQn+5cfuttpFuAak7CkSO-qVjPeCw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 27, 2020 at 06:09:49PM +0200, Andy Shevchenko wrote:
> On Tue, Oct 27, 2020 at 6:01 PM Hans de Goede <hdegoede@redhat.com> wrote:
> > On 10/27/20 4:13 PM, Andy Shevchenko wrote:
> > > On Tue, Oct 27, 2020 at 4:31 PM Hans de Goede <hdegoede@redhat.com> wrote:
> > >> On 10/26/20 11:54 PM, Coiby Xu wrote:
> > >>> Hi Hans and Linus,
> > >>>
> > >>> Will you interpret the 0x0000 value for debounce timeout in GPIO
> > >>> Interrupt Connection Resource Descriptor as disabling debouncing
> > >>> filter?
> > >>>
> > >>> GpioInt (EdgeLevel, ActiveLevel, Shared, PinConfig, DebounceTimeout, ResourceSource,
> > >>> ResourceSourceIndex, ResourceUsage, DescriptorName, VendorData) {PinList}
> > >>>
> > >>> I'm not sure if Windows' implementation is the de facto standard like
> > >>> i2c-hid. But if we are going to conform to the ACPI specs and we would
> > >>> regard 0x0000 debounce timeout as disabling debouncing filter, then we
> > >>> can fix this touchpad issue and potentially some related issues by
> > >>> implementing the feature of supporting configuring debounce timeout in
> > >>> drivers/gpio/gpiolib-acpi.c and removing all debounce filter
> > >>> configuration in amd_gpio_irq_set_type of drivers/pinctrl/pinctrl-amd.c.
> > >>> What do you think?
> > >>>
> > >>> A favorable evidence is I've collected five DSDT tables when
> > >>> investigating this issue. All 5 DSDT tables have an GpioInt specifying
> > >>> an non-zero debounce timeout value for the edge type irq and for all
> > >>> the level type irq, the debounce timeout is set to 0x0000.
> > >>
> > >> That is a very interesting observation and this matches with my
> > >> instincts which say that we should just disable the debounce filter
> > >> for level triggered interrupts in pinctrl-amd.c
> > >>
> > >> Yes that is a bit of a shortcut vs reading the valie from the ACPI
> > >> table, but I'm not sure that 0 always means disabled.
> > >>
> > >> Specifically the ACPI 6.2 spec also has a notion of pinconf settings
> > >> and the docs on "PinConfig()"  say:
> > >>
> > >> Note: There is some overlap between the properties set by GpioIo/GpioInt/ PinFunction and
> > >> PinConfig descriptors. For example, both are setting properties such as pull-ups. If the same
> > >> property is specified by multiple descriptors for the same pins, the order in which these properties
> > >> are applied is undetermined. To avoid any conflicts, GpioInt/GpioIo/PinFunction should provide a
> > >> default value for these properties when PinConfig is used. If PinConfig is used to set pin bias,
> > >> PullDefault should be used for GpioIo/GpioInt/ PinFunction. *If PinConfig is used to set debounce
> > >> timeout, 0 should be used for GpioIo/GpioInt.*
> > >>
> > >> So that suggests that a value of 0 does not necessarily mean "disabled" but
> > >> it means use a default, or possibly get the value from somewhere else such
> > >> as from a ACPI PinConfig description (if present).
> > >
> > > Nope, it was added to get rid of disambiguation when both Gpio*() and
> > > PinConfig() are given.
> > > So, 0 means default *if and only if* PinConfig() is present.
> > >
> > > I.o.w. the OS layers should do this:
> > >
> > >  - if Gpio*() provides Debounce != 0, we use it, otherwise
> > >  - if PinConfig() is present for this pin with a debounce set, use it, otherwise
> > >  - debounce is disabled.
> > >
> > > Now we missed a midentry implementation in the Linux kernel, hence go
> > > to last, i.e. disable debounce.
> > > But it should be rather done in gpiolib-acpi.c.
> > >
> > > Hope this helps.
> > >
> > > I Cc'ed this to Mika as co-author of that part of specification, he
> > > may correct me if I'm wrong.
> >
> > I see, so then the right thing to do for the bug which we are seeing
> > on some AMD platforms would be to honor the debounce setting I guess ?
> >
> > Can you and/or Mika write a patch(set) for this ?
> 
> I will look at it, but meanwhile I would postpone until having a
> Mika's Ack on the action that my understanding and course of actions
> is correct.

From what I recall this sounds correct :)
