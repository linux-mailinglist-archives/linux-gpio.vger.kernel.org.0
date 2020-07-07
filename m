Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F95B21672B
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2020 09:17:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725766AbgGGHRu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jul 2020 03:17:50 -0400
Received: from smtpcmd14161.aruba.it ([62.149.156.161]:47051 "EHLO
        smtpcmd14161.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbgGGHRu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jul 2020 03:17:50 -0400
Received: from [192.168.1.129] ([93.146.66.165])
        by smtpcmd14.ad.aruba.it with bizsmtp
        id 07Hn2301S3Zw7e5017HncG; Tue, 07 Jul 2020 09:17:48 +0200
Subject: Re: [RFC] GPIO User I/O
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <01afcac0-bd34-3fd0-b991-a8b40d4b4561@enneenne.com>
 <CACRpkdbX9T9EuN-nxkMPC=sN74PEdoLuWurNLdGCzZJwwFrdpQ@mail.gmail.com>
 <1c4f1a83-835a-9317-3647-b55f6f39c0ba@enneenne.com>
 <CACRpkdZPjJSryJc+RtYjRN=X7xKMcao5pYek1fUM2+sE9xgdFQ@mail.gmail.com>
 <CAMuHMdUtguuu4FWU4nRS=pBUyEwKM1JZ8DYPdCQHXBYN0i_Frg@mail.gmail.com>
From:   Rodolfo Giometti <giometti@enneenne.com>
Message-ID: <87efe96c-3679-14d5-4d79-569b6c047b00@enneenne.com>
Date:   Tue, 7 Jul 2020 09:17:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUtguuu4FWU4nRS=pBUyEwKM1JZ8DYPdCQHXBYN0i_Frg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aruba.it; s=a1;
        t=1594106268; bh=gjXhXmgD+B/RGJdapYr3LZScV27ekBpijS2USkQB/rI=;
        h=Subject:To:From:Date:MIME-Version:Content-Type;
        b=WWBhZROOaAEZmGjg9RccMPw79CYNK7hUbfmh29JpOssPCjwOG3QL5eSnp18nvE2Ay
         zZWzjJZS9RYcIZbzP0wltwy5XNquSfhfsJ6gtqPZQbSe76B4rGjOcNRbNtETttFUts
         KBLKRcv90+BbHfgiQBOwzD4OF1XOy0BGz3nmRmLM1IoFP95m5JJM42MfPvauXp4QlR
         gOwzDo1u8JuCOiGUfz1Wx55fZBde5mD8Myqu6edUSD23kbu1UnosDz2PONA8n2Smh3
         1ET5AQqdV6cSpGH/cXpTEQ1oiN1bnF09DUrb7XdxgQbwxQ1g+SYK1OwvjAyk4EASc7
         iIV3h2c2e7Dcw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 06/07/2020 23:00, Geert Uytterhoeven wrote:
> On Mon, Jul 6, 2020 at 10:38 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Mon, Jul 6, 2020 at 5:33 PM Rodolfo Giometti <giometti@enneenne.com> wrote:
>>>> With Geert's GPIO aggregator userspace and device tree can conjure
>>>> special per-usecase gpio chips as pointed out by Drew: this is
>>>> very useful when you want some kernel-managed yet
>>>> usecase-specific GPIO lines in a special "container" chip.
>>>> To me this is the best of two worlds. (Kernelspace and userspace.)
>>>
>>> Maybe this is the "best of two worlds" as you say but the problem is that board
>>> manufactures need a way to well-define how a GPIO line must be used for within
>>> the device-tree and without the need of patches! In this point of view neither
>>> the "driver_override" way nor adding a compatible value to
>>> gpio_aggregator_dt_ids[] can help (this last solution requires a patch for each
>>> board!). That's why at the moment they prefer not specify these GPIO lines at
>>> all or (improperly) use the gpio-leds and gpio-uinput interfaces to keep it
>>> simple...
>>
>> I think the idea is to add a very generic DT compatible to the
>> gpio_aggregator_dt_ids[]. That way, any DT can use the aggregator
>> to create a new chip with named lines etc.
>>
>> But Geert can speak of that.
> 
> The idea is to describe the real device in DT, and add it's compatible value
> to gpio_aggregator_dt_ids[], or enable support for it dynamically using
> driver_override.
> The former indeed requires modifying the driver.

I see.

> Note that if you ever want to write a pure kernelspace driver, you do need
> a proper compatible value anyway.

OK, but for our purposes we need just one compatible value.

> I do agree that it's annoying to have "gpio-leds", but not "gpio-motors"
> or "gpio-relays".  However, you can always propose bindings for the
> latter, and, when they have been accepted, add those compatible
> values to upstream gpio_aggregator_dt_ids[].

Having gpio-uio with proper names within it as motor0, motor1, relay0, etc. as
in my solution would be suffice. However, after these discussions, are there any
chances my patch (with needed modifications and documentation) may be accepted? :)

Thanks for your time and answers.

Ciao,

Rodolfo

-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming                     skype:  rodolfo.giometti
