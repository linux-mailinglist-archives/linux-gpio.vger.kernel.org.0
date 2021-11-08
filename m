Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75EAD448185
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Nov 2021 15:22:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236270AbhKHOYh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Nov 2021 09:24:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:60592 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235502AbhKHOYh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Nov 2021 09:24:37 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2971D610E9;
        Mon,  8 Nov 2021 14:21:49 +0000 (UTC)
Subject: Re: [RFC 3/3] gpiolib: coldfire: remove custom asm/gpio.h
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Arnd Bergmann <arnd@kernel.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Russell King <linux@armlinux.org.uk>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Rich Felker <dalias@libc.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20211105130338.241100-1-arnd@kernel.org>
 <20211105130338.241100-3-arnd@kernel.org>
 <CAMuHMdX=e5HB8gh25DMbrbUHagS9eOQokbjneJTY6HrSSf4Njw@mail.gmail.com>
From:   Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <b45d970e-c02b-a843-4c38-dc7aee3cf8d3@linux-m68k.org>
Date:   Tue, 9 Nov 2021 00:21:46 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdX=e5HB8gh25DMbrbUHagS9eOQokbjneJTY6HrSSf4Njw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi arnd, Geert,

On 8/11/21 6:24 pm, Geert Uytterhoeven wrote:
> Hi Arnd,
> 
> On Fri, Nov 5, 2021 at 2:05 PM Arnd Bergmann <arnd@kernel.org> wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> Now that coldfire is the only user of a custom asm/gpio.h, it seems
>> better to remove this as well, and have the same interface everywhere.
>>
>> For the gpio_get_value()/gpio_set_value()/gpio_to_irq(), gpio_cansleep()
>> functions, the custom version is only a micro-optimization to inline the
>> function for constant GPIO numbers. However, in the coldfire defconfigs,
>> I was unable to find a single instance where this micro-optimization
>> was even used, so to my best knowledge removing this has no downsides.
> 
> The only user seems to be QSPI chip select handling (not bit-banged
> data transfer) in arch/m68k/coldfire/device.c, but that indeed depends
> on CONFIG_SPI_COLDFIRE_QSPI, which is not set in any of the defconfigs.
> That doesn't mean there were/are no real users, though ;-)

That is definitely used by some.
But the generalization and removal of the special casing seems like a win to me.


>> The custom gpio_request_one() function is even less useful, as it is
>> guarded by an #ifdef that is never true.
>>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Reviewed-by: Greg Ungerer <gerg@linux-m68k.org>

Regards
Greg



> Gr{oetje,eeting}s,
> 
>                          Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
> 
