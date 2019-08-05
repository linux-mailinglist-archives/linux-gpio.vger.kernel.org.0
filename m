Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3D6A816EB
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 12:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728056AbfHEKV7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 06:21:59 -0400
Received: from foss.arm.com ([217.140.110.172]:45428 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727158AbfHEKV6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 5 Aug 2019 06:21:58 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB77728;
        Mon,  5 Aug 2019 03:21:57 -0700 (PDT)
Received: from [10.1.197.61] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A7183F694;
        Mon,  5 Aug 2019 03:21:56 -0700 (PDT)
Subject: Re: [PATCH RFC] gpio: Add Virtual Aggregator GPIO Driver
To:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        christoffer.dall@arm.com
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Graf <agraf@suse.de>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20190705160536.12047-1-geert+renesas@glider.be>
 <CACRpkdY6qAUkQW4YHN9HskvZS2P-viWYTHSb28ECh1p+itU=4Q@mail.gmail.com>
From:   Marc Zyngier <marc.zyngier@arm.com>
Openpgp: preference=signencrypt
Autocrypt: addr=marc.zyngier@arm.com; prefer-encrypt=mutual; keydata=
 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
 Z46HaNmN2hZS/oJ69c1DI5Rcww==
Organization: ARM Ltd
Message-ID: <dc2016d4-b06c-aa8e-2644-90caa40fbd63@arm.com>
Date:   Mon, 5 Aug 2019 11:21:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdY6qAUkQW4YHN9HskvZS2P-viWYTHSb28ECh1p+itU=4Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 01/08/2019 09:41, Linus Walleij wrote:
> Hi Geert!
> 
> Thanks for this very interesting patch!
> 
> On Fri, Jul 5, 2019 at 6:05 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> 
>> GPIO controllers are exported to userspace using /dev/gpiochip*
>> character devices.  Access control to these devices is provided by
>> standard UNIX file system permissions, on an all-or-nothing basis:
>> either a GPIO controller is accessible for a user, or it is not.
>> Currently no mechanism exists to control access to individual GPIOs.
> 
> Yes, I did that decision deliberately, as the chip is one device
> and the base system control is usually on a per-device granularity.
> At one point some people were asking for individual GPIO line
> permissions in the character device and my argument was something
> like why can't I have individual control over the access rights on a block
> device or the pixels on a graphics device then.
> 
> Jokes aside, filesystems do provide access control over individual
> blocks on a block device in a way. So it is further up the stack.
> 
> The same goes for this: something above the GPIO chip provide
> more granular access control, and as such it fits the need very well.
> 
>> Hence add a virtual GPIO driver to aggregate existing GPIOs (up to 32),
>> and expose them as a new gpiochip.  This is useful for implementing
>> access control, and assigning a set of GPIOs to a specific user.
>> Furthermore, it would simplify and harden exporting GPIOs to a virtual
>> machine, as the VM can just grab the full virtual GPIO controller, and
>> no longer needs to care about which GPIOs to grab and which not,
>> reducing the attack surface.
> 
> Excellent approach.
> 
> I would even go so far as to call it "gpio-virtualization" or
> "gpio-virtualized" rather than "gpio-virtual" so it is clear what the
> intended usecase is. We have a bit of confusion in the kernel
> because people misuse the word "virtual" left and right, like for
> "virtual IRQ number" (Linux IRQ numbers) which are just some
> random number space, but not really "virtual", it's a semantic
> disease similar to the confusion of using the word "manual" in
> computer code.

I'd drop the notion of "virtual" altogether. Nothing is virtual in this
thing at all (the GPIOs are very real, from what I gather). Instead (and
assuming I got it right, which is a long shot), what you have is a
"synthetic" GPIO controller, made from the GPIOs belonging to other
controllers. I'd call it "GPIO aggregator".

> 
> Here it is however used correctly! (Maybe for the first time.)
> 
>> Virtual GPIO controllers are instantiated by writing to the "new_device"
>> attribute file in sysfs:
>>
>>     $ echo "<gpiochipA> <gpioA1> [<gpioA2> ...]"
>>            "[, <gpiochipB> <gpioB1> [<gpioB2> ...]] ...]"
>>             > /sys/bus/platform/drivers/gpio-virt-agg/new_device
>>
>> Likewise, virtual GPIO controllers can be destroyed after use:
>>
>>     $ echo gpio-virt-agg.<N> \
>>             > /sys/bus/platform/drivers/gpio-virt-agg/delete_device
> 
> I suppose this is the right way to use sysfs.
> 
> I would check with some virtualization people (paged Marc Zyngier
> and Christoffer Dall) so they can say whether this is the way any
> virtual machine wants to populate its local GPIO chip for
> use with a certain machine.
> 
> If QEMU can deal in a simple and straight-forward way with this
> I see it quickly becoming a very useful tool for industrial automation
> where you want to run each control system in isolation and just
> respawn the virtual machine if something goes wrong.

What the VMM (QEMU, kvmtool) would need to do is to present this as a
"standard" GPIO IP, and use the backend aggregator to emulate it.
Certainly doable. The nice part is that all the work is in userspace,
and thus completely off my plate! ;-)

You also may want to look into not emulating a standard IP, but use
something virtio-based instead. The ACRN project seems to have something
like this in progress, but I know nothing about it.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
