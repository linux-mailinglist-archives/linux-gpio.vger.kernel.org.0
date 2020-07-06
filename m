Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 662E8215ACB
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2020 17:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729412AbgGFPd3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jul 2020 11:33:29 -0400
Received: from smtpcmd10101.aruba.it ([62.149.156.101]:56656 "EHLO
        smtpcmd10101.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729297AbgGFPd3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jul 2020 11:33:29 -0400
Received: from [192.168.1.129] ([93.146.66.165])
        by smtpcmd10.ad.aruba.it with bizsmtp
        id zrZS2200T3Zw7e501rZSBy; Mon, 06 Jul 2020 17:33:26 +0200
Subject: Re: [RFC] GPIO User I/O
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <01afcac0-bd34-3fd0-b991-a8b40d4b4561@enneenne.com>
 <CACRpkdbX9T9EuN-nxkMPC=sN74PEdoLuWurNLdGCzZJwwFrdpQ@mail.gmail.com>
From:   Rodolfo Giometti <giometti@enneenne.com>
Message-ID: <1c4f1a83-835a-9317-3647-b55f6f39c0ba@enneenne.com>
Date:   Mon, 6 Jul 2020 17:33:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdbX9T9EuN-nxkMPC=sN74PEdoLuWurNLdGCzZJwwFrdpQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aruba.it; s=a1;
        t=1594049606; bh=sjhRclmbNQRngrKqfhNGWCPGl7uVo1ztyrmApJp5b2o=;
        h=Subject:To:From:Date:MIME-Version:Content-Type;
        b=Y9JrYiAY9mqN4rpCtup82nASdqGFnpsgbcwunaugM2ZTSbo131CjkiwkmGB87Q0tA
         6kkprkAre8PT249nD/qfSAmiCWbBoCDaAa19ZcSHmUbOJ5gJd95MVjoN8HrZ7VUjPC
         tgi/zIIPJoK6Lv88IaYGMTa7yTbSB6CVk2LgMerliHfsw3Td1vdr2d958A4Z8UGfbA
         RXRPYxJyDf7he6FCFVcdhvvViiwMx68CS49bnan7vhJfOOMH4NRkCrYrMThP7YLZGX
         EfW3xVTTaNJC218SmpU403vnRi7CbQ/bK44mUCIIHUGRDK0uFvxjmmcbCJEkuw5g1I
         dgBoTbPfhhAlA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 06/07/2020 15:43, Linus Walleij wrote:
> Hi Rodolfo!

Hi. :)

> thanks for your mail.
> 
> On Mon, Jul 6, 2020 at 2:19 PM Rodolfo Giometti <giometti@enneenne.com> wrote:
> 
>> 4) Then users will find a new class with entries, one for each new line:
>>
>> # ls /sys/class/gpio-uio/
>> bypass-1  bypass0
>>
>> 5) By using the attribute "line" the users can get or set the line status
>>
>> # cat /sys/class/gpio-uio/bypass-1/line
>> 0
>> # echo 1 > /sys/class/gpio-uio/bypass-1/line
>> # cat /sys/class/gpio-uio/bypass-1/line
>> 1
> 
> This interface is problematic because it extends the sysfs ABI which is
> obsolete. This is why the documentation of this ABI has been moved to
> Documentation/ABI/obsolete/sysfs-gpio  for many years.

This support is not part of CONFIG_GPIO_SYSFS; it just uses the sysfs to work.

> The sysfs approach has several problems which are summarized like
> this in the commit where it was introduced:

I see, but my solution is just for having an easy-to-use way to get access to
meaningful GPIOs the board manufacturer defined for some specific usage during
the board design. It's not generic as gpio-sysfs.

> Another thing that is not mentioned here is that when a character
> device is opened it is automatically closed if a process crashes,
> which means that kernelspace can do clean-ups and reference counting
> and making the lines available to other consumers (like if you
> restart the program).

In this case there is nothing to release nor clean up since each line has a
fixed name, usage and it can be used as input or output without modifications.

> With Geert's GPIO aggregator userspace and device tree can conjure
> special per-usecase gpio chips as pointed out by Drew: this is
> very useful when you want some kernel-managed yet
> usecase-specific GPIO lines in a special "container" chip.
> To me this is the best of two worlds. (Kernelspace and userspace.)

Maybe this is the "best of two worlds" as you say but the problem is that board
manufactures need a way to well-define how a GPIO line must be used for within
the device-tree and without the need of patches! In this point of view neither
the "driver_override" way nor adding a compatible value to
gpio_aggregator_dt_ids[] can help (this last solution requires a patch for each
board!). That's why at the moment they prefer not specify these GPIO lines at
all or (improperly) use the gpio-leds and gpio-uinput interfaces to keep it
simple...

By using my solution each board manufacturer can specify meaningful GPIO lines
directly within the device-tree, then users can use it via the "line" property
or just use the new chrdev interface for better performances.

Also my solution allows developers to manage these lines without any external
programs but just using cat&echo. This is _very_ useful when your embedded
system has a very tiny rootfs!

My two cents. :)

Ciao,

Rodolfo

-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming                     skype:  rodolfo.giometti
