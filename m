Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9745653B6
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jul 2019 11:24:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727595AbfGKJYx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Jul 2019 05:24:53 -0400
Received: from anchovy1.45ru.net.au ([203.30.46.145]:34124 "EHLO
        anchovy1.45ru.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727680AbfGKJYu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Jul 2019 05:24:50 -0400
Received: (qmail 30049 invoked by uid 5089); 11 Jul 2019 09:24:48 -0000
Received: by simscan 1.2.0 ppid: 29900, pid: 29902, t: 0.0630s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
Received: from unknown (HELO ?192.168.0.128?) (preid@electromag.com.au@203.59.235.95)
  by anchovy1.45ru.net.au with ESMTPA; 11 Jul 2019 09:24:47 -0000
Subject: Re: [PATCH RFC] gpio: Add Virtual Aggregator GPIO Driver
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Graf <agraf@suse.de>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20190705160536.12047-1-geert+renesas@glider.be>
 <8500a069-9e29-d6ad-e5e4-22d5a3eead59@electromag.com.au>
 <CAMuHMdWLcr0pf-ZM3+iWQGwDLB2xoHAZaeCKAjtEVEaiNed63Q@mail.gmail.com>
From:   Phil Reid <preid@electromag.com.au>
Message-ID: <1fc3a5ad-6eb6-3356-5fd4-93ce0482bb7e@electromag.com.au>
Date:   Thu, 11 Jul 2019 17:24:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWLcr0pf-ZM3+iWQGwDLB2xoHAZaeCKAjtEVEaiNed63Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10/07/2019 18:21, Geert Uytterhoeven wrote:
> Hi Phil,
> 
> On Wed, Jul 10, 2019 at 4:00 AM Phil Reid <preid@electromag.com.au> wrote:
>> On 6/07/2019 00:05, Geert Uytterhoeven wrote:
>>> GPIO controllers are exported to userspace using /dev/gpiochip*
>>> character devices.  Access control to these devices is provided by
>>> standard UNIX file system permissions, on an all-or-nothing basis:
>>> either a GPIO controller is accessible for a user, or it is not.
>>> Currently no mechanism exists to control access to individual GPIOs.
>>>
>>> Hence add a virtual GPIO driver to aggregate existing GPIOs (up to 32),
>>> and expose them as a new gpiochip.  This is useful for implementing
>>> access control, and assigning a set of GPIOs to a specific user.
>>> Furthermore, it would simplify and harden exporting GPIOs to a virtual
>>> machine, as the VM can just grab the full virtual GPIO controller, and
>>> no longer needs to care about which GPIOs to grab and which not,
>>> reducing the attack surface.
>>>
>>> Virtual GPIO controllers are instantiated by writing to the "new_device"
>>> attribute file in sysfs:
>>>
>>>       $ echo "<gpiochipA> <gpioA1> [<gpioA2> ...]"
>>>              "[, <gpiochipB> <gpioB1> [<gpioB2> ...]] ...]"
>>>               > /sys/bus/platform/drivers/gpio-virt-agg/new_device
>>>
>>> Likewise, virtual GPIO controllers can be destroyed after use:
>>>
>>>       $ echo gpio-virt-agg.<N> \
>>>               > /sys/bus/platform/drivers/gpio-virt-agg/delete_device
>>>
>>
>> Nice.
>> This provides similar functionality to the "gpio inverter" driver currently on the list.
>> Other than being just a buffer.
> 
> Indeed, both drivers forward GPIO calls, but the gpio inverter modifies
> some parameters passed.
> 
> The way the drivers obtain references to GPIOs is different, though: the
> inverter driver obtains a fixed description from DT, while the virtual
> aggregator receives the description at runtime, from sysfs.
> 
> But perhaps both drivers could share some code?
Other than probing they're almost the same, except the inversion.
This one's more complete for set / get multiple etc.

> 
>> Would it be possible to do the lookup via line names?
> 
> Doesn't the fact that a GPIO has a line name means that it is in use, and
> thus cannot be aggregated and exported to another user?
> 

They can be given line names via the dt property gpio-line-names.
Which can be used by user space to find a gpio. Not sure if there's an equivalent api inkerenl.
But it looks like we can find the info via struct gpiochip_info / gpioline_info linfo and work
out the chip name and line offsets. So probably not required.

Find the right gpio always seems tricky.
We have systems with multiple i2c gpio behind muxes that may or may not be present.
So i2c bus numbers are never consistent. And then different board revisions move the
same gpio line to a different pin (or cahnge the gpio chip type completely) to make routing easier etc.




-- 
Regards
Phil Reid
