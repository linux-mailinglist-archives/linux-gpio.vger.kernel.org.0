Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0D63DFC4
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Apr 2019 11:49:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727368AbfD2JtI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Apr 2019 05:49:08 -0400
Received: from submit-1.e-mind.com ([188.94.192.45]:48712 "EHLO
        submit-1.e-mind.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727514AbfD2JtI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Apr 2019 05:49:08 -0400
Received: from localhost (unknown [127.0.0.1])
        by submit-1.e-mind.com (Postfix) with ESMTP id EB4CF835925
        for <linux-gpio@vger.kernel.org>; Mon, 29 Apr 2019 09:49:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at emind.it
Received: from submit-1.e-mind.com ([127.0.0.1])
        by localhost (submit-1.e-mind.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id xRDdOkd1_7G8 for <linux-gpio@vger.kernel.org>;
        Mon, 29 Apr 2019 11:49:04 +0200 (CEST)
Received: from qmail.e-mind.com (qmail34.e-mind.com [188.94.192.34])
        by submit-1.e-mind.com (Postfix) with SMTP id 98503836281
        for <linux-gpio@vger.kernel.org>; Mon, 29 Apr 2019 11:49:04 +0200 (CEST)
Received: (qmail 11496 invoked by uid 0); 29 Apr 2019 09:49:05 -0000
Received: from unknown (HELO ?192.168.143.6?) (185.53.252.165)
  by 0 with SMTP; 29 Apr 2019 09:49:05 -0000
Subject: Re: GPIO Character device driver
To:     Linus Walleij <linus.walleij@linaro.org>
References: <0fb34aa5-60d8-cf6d-ffcf-237298977347@eurek.it>
 <CACRpkdaWGBoV_OFkjj6y0Rayz1hNziDCaA7VXh+1Uf5soh46Ww@mail.gmail.com>
 <7e0af1af-a565-a12e-8356-e9964d8174c4@eurek.it>
 <CACRpkdZs_E=6cjPa+vaNvqcXF1DmtMPujtPLS-nPQqysYhG2pQ@mail.gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
From:   gianluca <gianlucarenzi@eurek.it>
Message-ID: <4a854870-d294-8a84-8d82-51a90e20b362@eurek.it>
Date:   Mon, 29 Apr 2019 11:49:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdZs_E=6cjPa+vaNvqcXF1DmtMPujtPLS-nPQqysYhG2pQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 04/24/2019 07:07 PM, Linus Walleij wrote:
> On Wed, Apr 24, 2019 at 3:10 PM gianluca <gianlucarenzi@eurek.it> wrote:
>> On 04/23/2019 07:51 PM, Linus Walleij wrote:
>>>> Do I have to __DISABLE__ the sysfs support from kernel config?
>>>
>>> No.
>>
>> Ok, mainly because the kernel config has GPIOLIB enabled by default and
>> I added a _NOT_MODULE_ sysfs driver i.e. it is monolithic inside the
>> kernel...
>
> The character device is created from inside the core GPIOLIB code
> and cannot be disabled.

Got it.

>
>> No, I mean which is the 'entry point' for creating those
>> /dev/gpiochip[X] devices? I suppose some system call has to be issued to
>> tell udev to create those char drivers...
>
> The character device for each gpiochip is created inside the
> gpiochip_setup_dev() call in drivers/gpio/gpiolib.c
>

Ok.

> What happens next is that the kernel invokes the uevent helper.
> This used to be /sbin/hotplug but udev+systemd systems
> nowadays use a netlink socket to send the events to userspace
> and I have no idea how that works, sorry.
>

Well, in my systems I have systemd disable because we are heavly 
customizing the boot sequence as we are using sysinit for booting...

Is this behaviour forced to *NOT* have gpio characters in udev /dev 
structure during boot up?

As soon as possible I will check better in my boards which having Kernel 
 > 4.9 to find which issue is causing those drivers not to appear in /dev...

>>> /dev/gpiochipN even appears on my Intel laptop.
>>
>> I suppose you are using non OF_ but ACPI_ stuff. ;-)
>
> It doesn't matter. The /dev/gpiochipN are the same no matter what
> hardware description you use. The appear when the driver
> call [devm_]gpiochip_add[_data](). This is the same for all
> GPIO drivers.
>

Ok.

>> Ok. Now this reveals a question: if I configure some pin using sysfs,
>> those pins can be used in gpiolib chardev stuff? I suppose I have to
>> unregister the driver with 'unexport'.
>
> I want to forget how the sysfs works but it is protected AFAIK
> so you cannot use the same pins with sysfs and the chardev.
>
> exporting/unexporting just affects individual lines on a chip
> it doesn't register/unregister the driver att all.
>

Ok, I will test it under userspace ASAP if it breaks up our software...

>> P.S.: by the way, it is an HONOR to me, having a mail with the 2nd Linus
>> of the Kernel! ;-P
>
> I'm just some engineer, it's not that big deal.


It's a big deal to me afterall.

Kindest regards,
-- 
Eurek s.r.l.                          |
Electronic Engineering                | http://www.eurek.it
via Celletta 8/B, 40026 Imola, Italy  | Phone: +39-(0)542-609120
p.iva 00690621206 - c.f. 04020030377  | Fax:   +39-(0)542-609212
