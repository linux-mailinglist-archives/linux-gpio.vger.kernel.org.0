Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4BBD21D869
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2020 16:27:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729893AbgGMO1h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jul 2020 10:27:37 -0400
Received: from smtpcmd02101.aruba.it ([62.149.158.101]:40833 "EHLO
        smtpcmd02101.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729784AbgGMO1h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2020 10:27:37 -0400
X-Greylist: delayed 427 seconds by postgrey-1.27 at vger.kernel.org; Mon, 13 Jul 2020 10:27:36 EDT
Received: from [192.168.1.129] ([93.146.66.165])
        by smtpcmd02.ad.aruba.it with bizsmtp
        id 2eLN230113Zw7e501eLPZ4; Mon, 13 Jul 2020 16:20:27 +0200
Subject: Re: [RFC] GPIO lines [was: GPIO User I/O]
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <01afcac0-bd34-3fd0-b991-a8b40d4b4561@enneenne.com>
 <CACRpkdbX9T9EuN-nxkMPC=sN74PEdoLuWurNLdGCzZJwwFrdpQ@mail.gmail.com>
 <1c4f1a83-835a-9317-3647-b55f6f39c0ba@enneenne.com>
 <CACRpkdZPjJSryJc+RtYjRN=X7xKMcao5pYek1fUM2+sE9xgdFQ@mail.gmail.com>
 <CAMuHMdUtguuu4FWU4nRS=pBUyEwKM1JZ8DYPdCQHXBYN0i_Frg@mail.gmail.com>
 <87efe96c-3679-14d5-4d79-569b6c047b00@enneenne.com>
 <CAMuHMdUght0hkJT1N8ub5xR5GB+U18MAhAg+zDmAAuxoRSRaYg@mail.gmail.com>
 <d30e64c9-ad7f-7cd5-51a4-3f37d6f1e3d8@enneenne.com>
 <070fa558-6e20-0fbf-d3e4-0a0eca4fe82c@enneenne.com>
 <CACRpkdYFAW2bcB53M3_b2LsveJO_PWZJhprGhdTtfmW11B1WmQ@mail.gmail.com>
From:   Rodolfo Giometti <giometti@enneenne.com>
Message-ID: <f66dc9c4-b164-c934-72a8-d4aca063fca5@enneenne.com>
Date:   Mon, 13 Jul 2020 16:20:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdYFAW2bcB53M3_b2LsveJO_PWZJhprGhdTtfmW11B1WmQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aruba.it; s=a1;
        t=1594650027; bh=htV99MPbzwj4JWvKbJWvdYMsckXanjJlxRhiqpDyOD0=;
        h=Subject:To:From:Date:MIME-Version:Content-Type;
        b=g5wR0zIG3iO0Xj/NjCc4RWlVwTb4BTE1PzRK9fwEzWeCY2pyFGE2VztebYSgXAsjZ
         Vh6ei6C3yAOKF+xlvPqWKNKCFIKao0nUMJ7CI1KsBBmMKXRqdYzApq94XSW6J5QZOS
         fAWI8X9IctbQe0JxCWWLX/WYo8OikFfUQBixY9is/OL5nKAaiEPtfFytV13CtRTQBf
         ueEpbCDaHpwJ8k0tsL7RkD/iC7aQYM57hwaWCp8SVep8d6N4xTJ7UwhpJ1eqlfKx6p
         czsx5Y2f9cLsOG2aC0F21VGZDre5j/+Ya+yQUKdsri4OGiGqCOxKIXbX/qSn6fYzCz
         Xorg+Nfz0/V4A==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11/07/2020 17:21, Linus Walleij wrote:
> On Thu, Jul 9, 2020 at 4:11 PM Rodolfo Giometti <giometti@enneenne.com> wrote:
> 
>>         gpio_lines {
>>                 compatible = "gpio-line";
>>
>>                 bypass0 {
>>                         gpios = <&gpionb 10 GPIO_ACTIVE_HIGH>;
>>                         mode = "out-low";
>>                 };
>>
>>                 bypass1 {
>>                         gpios = <&gpiosb 11 GPIO_ACTIVE_HIGH>;
>>                         mode = "out-low";
>>                 };
>>
>>                 key {
>>                         gpios = <&gpionb 4 GPIO_ACTIVE_HIGH>;
>>                         mode = "input";
>>                 };
>>
>>                 motor {
>>                         gpios = <&gpionb 8 GPIO_ACTIVE_HIGH>;
>>                         mode = "out-high-open-drain";
>>                 };
> 
> These mode = ... strings are really just a big confusion for me since
> they reinvent several of the flags you can already give to the gpios,
> see include/dt-bindings/gpio/gpio.h:
> 
> /* Bit 0 express polarity */
> #define GPIO_ACTIVE_HIGH 0
> #define GPIO_ACTIVE_LOW 1
> 
> /* Bit 1 express single-endedness */
> #define GPIO_PUSH_PULL 0
> #define GPIO_SINGLE_ENDED 2
> 
> /* Bit 2 express Open drain or open source */
> #define GPIO_LINE_OPEN_SOURCE 0
> #define GPIO_LINE_OPEN_DRAIN 4
> 
> /*
>  * Open Drain/Collector is the combination of single-ended open drain interface.
>  * Open Source/Emitter is the combination of single-ended open source interface.
>  */
> #define GPIO_OPEN_DRAIN (GPIO_SINGLE_ENDED | GPIO_LINE_OPEN_DRAIN)
> #define GPIO_OPEN_SOURCE (GPIO_SINGLE_ENDED | GPIO_LINE_OPEN_SOURCE)

These modes came from include/linux/gpio/consumer.h:

/**
 * Optional flags that can be passed to one of gpiod_* to configure direction
 * and output value. These values cannot be OR'd.
 */
enum gpiod_flags {
        GPIOD_ASIS      = 0,
        GPIOD_IN        = GPIOD_FLAGS_BIT_DIR_SET,
        GPIOD_OUT_LOW   = GPIOD_FLAGS_BIT_DIR_SET | GPIOD_FLAGS_BIT_DIR_OUT,
        GPIOD_OUT_HIGH  = GPIOD_FLAGS_BIT_DIR_SET | GPIOD_FLAGS_BIT_DIR_OUT |
                          GPIOD_FLAGS_BIT_DIR_VAL,
        GPIOD_OUT_LOW_OPEN_DRAIN = GPIOD_OUT_LOW | GPIOD_FLAGS_BIT_OPEN_DRAIN,
        GPIOD_OUT_HIGH_OPEN_DRAIN = GPIOD_OUT_HIGH | GPIOD_FLAGS_BIT_OPEN_DRAIN,
};

So a setting like the following should set at boot gpio10 as output to 0:

bypass0 {
        gpios = <&gpionb 10 GPIO_ACTIVE_HIGH>;
        mode = "out-low";
};

While the next one should set gpio10 as output to 1:

bypass0 {
        gpios = <&gpionb 10 GPIO_ACTIVE_LOW>;
        mode = "out-low";
};

Maybe I can do something similar to hog-gpio as below, if you prefer...

bypass0 {
        gpios = <&gpionb 10 GPIO_ACTIVE_LOW>;
	output-low;
};

Ciao,

Rodolfo

-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming                     skype:  rodolfo.giometti
