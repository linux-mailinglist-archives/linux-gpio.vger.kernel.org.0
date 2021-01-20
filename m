Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB532FD468
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Jan 2021 16:48:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729869AbhATPnH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Jan 2021 10:43:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:56168 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732584AbhATPkO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 20 Jan 2021 10:40:14 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8DCFF23340;
        Wed, 20 Jan 2021 15:39:32 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1l2FZy-008yxu-8L; Wed, 20 Jan 2021 15:39:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 20 Jan 2021 15:39:30 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Saravana Kannan <saravanak@google.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        Android Kernel Team <kernel-team@android.com>,
        linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] gpiolib: Bind gpio_device to a driver to enable
 fw_devlink=on by default
In-Reply-To: <CAGETcx_5JJ2An=URY=0GwBbZzjfqN4w=-+2BuCsstYePej3sRw@mail.gmail.com>
References: <20210116011412.3211292-1-saravanak@google.com>
 <87r1mjkc07.wl-maz@kernel.org>
 <CAGETcx_5JJ2An=URY=0GwBbZzjfqN4w=-+2BuCsstYePej3sRw@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.10
Message-ID: <01f733ab81959e4cf847cbf1d521ad9d@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: saravanak@google.com, linus.walleij@linaro.org, bgolaszewski@baylibre.com, gregkh@linuxfoundation.org, Jisheng.Zhang@synaptics.com, kever.yang@rock-chips.com, kernel-team@android.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2021-01-18 20:38, Saravana Kannan wrote:
> On Sun, Jan 17, 2021 at 4:02 AM Marc Zyngier <maz@kernel.org> wrote:
>> 
>> Hi Saravana,
>> 
>> Thanks for posting this, much appreciated.
>> 
>> On Sat, 16 Jan 2021 01:14:11 +0000,
>> Saravana Kannan <saravanak@google.com> wrote:
>> >
>> > There are multiple instances of GPIO devictree nodes of the form:
>> >
>> > foo {
>> >       compatible = "acme,foo";
>> >       ...
>> >
>> >       gpio0: gpio0@xxxxxxxx {
>> >               compatible = "acme,bar";
>> >               ...
>> >               gpio-controller;
>> >       };
>> >
>> >       gpio1: gpio1@xxxxxxxx {
>> >               compatible = "acme,bar";
>> >               ...
>> >               gpio-controller;
>> >       };
>> >
>> >       ...
>> > }
>> >
>> > bazz {
>> >       my-gpios = <&gpio0 ...>;
>> > }
>> >
>> > Case 1: The driver for "foo" populates struct device for these gpio*
>> > nodes and then probes them using a driver that binds with "acme,bar".
>> > This lines up with how DT nodes with the "compatible" property are
>> > generally converted to struct devices and then registered with driver
>> > core to probe them. This also allows the gpio* devices to hook into all
>> > the driver core capabilities like runtime PM, probe deferral,
>> > suspend/resume ordering, device links, etc.
>> >
>> > Case 2: The driver for "foo" doesn't populate its child device nodes
>> > with "compatible" property and instead just loops through its child
>> > nodes and directly registers the GPIOs with gpiolib without ever
>> > populating a struct device or binding a driver to it.
>> 
>> That's not quite an accurate description. The gpiolib subsystem does
>> create a struct device. It doesn't register a driver though, which is
>> what causes the issue with fr_devlink (more on that below).
> 
> The devices created by gpiolib care are created for case 1 and case 2.
> They are just devices gpiolib uses to represent a virtual software
> device to hook different attributes to and expose them in sysfs. I'm
> not talking about those devices here. The devices I'm referring to are
> devices that represent the actual HW IP -- so what I'm saying is
> accurate.

Please read what you wrote : "without ever populating a struct device".
I stand by the "not quite accurate".

> 
>> >
>> > Drivers that follow the case 2 cause problems with fw_devlink=on.  This
>> > is because fw_devlink will prevent bazz from probing until there's a
>> > struct device that has gpio0 as its fwnode (because bazz lists gpio0 as
>> > a GPIO supplier). Once the struct device is available, fw_devlink will
>> > create a device link between with gpio0 as the supplier and bazz as the
>> > consumer. After this point, the device link will prevent bazz from
>> > probing until its supplier (the gpio0 device) has bound to a driver.
>> > Once the supplier is bound to a driver, the probe of bazz is triggered
>> > automatically.
>> >
>> > Finding and refactoring all the instances of drivers that follow case 2
>> > will cause a lot of code churn and it not something that can be done in
>> > one shot. Examples of such instances are [1] [2].
>> >
>> > This patch works around this problem and avoids all the code churn by
>> > simply creating a stub driver to bind to the gpio_device. Since the
>> > gpio_device already points to the GPIO device tree node, this allows all
>> > the consumers to continue probing when the driver follows case 2.
>> >
>> > If/when all the old drivers are refactored, we can revert this
>> > patch.
>> 
>> My personal gripe with this approach is that it is an abrupt change in
>> the way DT and device model are mapped onto each other.
>> 
>> As far as I know (and someone please correct me if I am wrong), there
>> is zero expectation that a device/subdevice/random IP block described
>> by a node with a "compatible" property will end-up being managed by a
>> driver that is bound to that particular node.
>> 
>> The node/subnode division is a good way to express some HW boundaries,
>> but doesn't say anything about the way this should be handled in the
>> kernel. Assuming that everything containing a "compatible" string will
>> eventually be bound to a driver is IMO pretty limiting.
> 
> The default behavior of of_platform_populate() is to create a struct
> device for every node with "compatible" property. That's how top level
> devices (or children of simple-bus devices) are populated. IIRC,
> that's what a lot of other busses do too. So, if anything, not having
> a struct device for nodes with "compatible" property is an exception.

Again, that's not a description of the reality. The case we are talking
about here does have a struct device. The misconception you keep
repeating is that binding it to a driver is the only valid approach.

> 
> Honestly, if one has a driver that supports a HW IP, I don't see any
> reason it should operate outside of the device-driver model supported
> by driver core. The driver code is there for a reason -- to solve all
> the common problems faced by drivers.

News flash: this isn't the case. Most of the code I deal with cannot
be represented as a driver, because it is needed way earlier
than the device model.

> Operating outside of it just
> causes reinventing the wheel, things like playing chicken with
> initcalls to make sure drivers initialize their device in the right
> order, not working with deferred probe, etc. For example, the rockchip
> driver in your device (the one that follows case 2) tries to get some
> clocks. But if that fails with -EPROBE_DEFER, the driver has no way
> for it to recover and just doesn't register the GPIO anymore.
> 
> Obviously exceptions are allowed for devices that are needed before
> the driver core even comes up -- like early, clocks, irqs and timers
> for the kernel/scheduler to kick off.

There you go. Exceptions. Tons of. The trouble is, you are rewriting
the rules of the game. Except that you are about 10 year late to
the party. Forcing your changes on everyone by saying that was
perfectly valid a month ago is now illegal doesn't really fly.

Anyway, I said what I had to say. If platforms break with this
change, I'll expect it to be disabled in 5.12.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
