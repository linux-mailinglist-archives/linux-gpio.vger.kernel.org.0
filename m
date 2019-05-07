Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AC561629C
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2019 13:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbfEGLMh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 May 2019 07:12:37 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:45254 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725844AbfEGLMh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 May 2019 07:12:37 -0400
Received: from nat-ies.mentorg.com ([192.94.31.2] helo=svr-ies-mbx-01.mgc.mentorg.com)
        by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
        id 1hNy1S-0004Fb-5x from Harish_Kandiga@mentor.com ; Tue, 07 May 2019 04:12:34 -0700
Received: from [10.0.4.15] (137.202.0.90) by svr-ies-mbx-01.mgc.mentorg.com
 (139.181.222.1) with Microsoft SMTP Server (TLS) id 15.0.1320.4; Tue, 7 May
 2019 12:12:29 +0100
Subject: Re: [PATCH V1 1/2] gpio: make it possible to set active-state on GPIO
 lines
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <1557122501-5183-1-git-send-email-harish_kandiga@mentor.com>
 <1557122501-5183-2-git-send-email-harish_kandiga@mentor.com>
 <CACRpkdZ84hkg_8J+OAYpZD0CFzENkUMeaSZoMyTK+hBdTCKGqA@mail.gmail.com>
 <ca559ed5-69ac-b578-2b82-fc0a4d532d3d@mentor.com>
 <CACRpkdYJ930fnO5a1HtUzRL5x1qA9cbgvEJb7mnwC=JLQOKXqQ@mail.gmail.com>
 <aaf22e96-a963-0dfc-a377-05383a219d0a@mentor.com>
 <CACRpkdYzOOOT4YVW2HxS99-aoBiAvqOW8XAUjwiF4=8g=MCizg@mail.gmail.com>
From:   Harish Jenny K N <harish_kandiga@mentor.com>
Message-ID: <867f4d8c-89ba-883e-a881-7526e693426d@mentor.com>
Date:   Tue, 7 May 2019 16:42:19 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CACRpkdYzOOOT4YVW2HxS99-aoBiAvqOW8XAUjwiF4=8g=MCizg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 07/05/19 1:58 PM, Linus Walleij wrote:
> On Mon, May 6, 2019 at 11:15 AM Harish Jenny K N
> <harish_kandiga@mentor.com> wrote:
>
>> Again I wanted to highlight that the intention of the patch was to make it generic
>> and avoid changes in userspace for different hardware samples. (i.e  Some pins in
>> hardware be configured as active low, this can vary between hardware samples
> First, can you explain what you mean by that? Is it that you mean to use the
> kernel gpiolib for prototyping, so we are not talking about production
> systems, such as any kind of product coming off a factory line?
>
> In that case I think it is in the maker-prototyping charter, which means
> it is actually appropriate for having that configuration in userspace,
> since it is a one-off. It will not have any generic use. The kernel is
> generally for reusable stuff.
>
> Second, I question the use of a property on the gpio chip for this. I
> highly doubt
> that the silicon chip will be manufactured with some random inverters
> on some lines depending on which silicon sample we are using.
> (Correct me if I'm wrong.)
>
> What I think is happening is that you are using different PCBs or
> wiremeshes and you have inverters outside the gpio chip.
> That should not be a property of the gpio chip.
>
> In this case what you need is either encode it on the consumer side
> as we already do, or start to model inverters in the device tree
> to properly describe the hardware, so we have a hierarchy of
> gpio lines:
>
> gpio0: gpio {
>    compatible = "foo,chip";
>    gpio-controller;
>    (...)
> };
>
> inv0: inverter {
>     compatible = "inverter";
>     gpio-controller;
>     gpios = <&gpio0 0 GPIO_ACTIVE_HIGH>;
> };
>
> consumer {
>    compatible = "bar";
>    gpios = <&inv0 0 GPIO_ACTIVE_HIGH>;
> };
>
> This is a rough sketch, it would need some elaborate thinking
> and DT-bindings and changes in gpiolib to deal with those
> inverters as gpiochips.
>
> It is a better model of what is really happening: altering the
> polarity on the gpiochip is wrong since the signal out from
> the chip is actually the same, and altering the consumer flag
> as we do today is also wrong because the component does
> have a very specific polarity.
>
> We have several boards like this already, but they all just
> summarize the inversions happening between the gpio chip
> and the consumer and put the resulting flag in the consumer
> polarity flag, so no explicit inverters in the device tree so far.
> This is a simplification of the actual electronics, but the goal
> with those device trees is running systems, not perfect
> abstraction of hardware in the device tree.
>
> However your usecase might warrant an introduction of
> this inverter concept, if it is like you say that you get new stuff
> every week that need testing and you like to use the DT to
> help with this. Again, this is under the assumption that you
> are actually not changing the GPIO chip, just the PCB.
>
> But I think real inverter nodes is what you should use if this
> is your usecase.
>
>> . User application uses gpio-line-name property to map pins
>> and port, this helps the application to handle pin change
>> from hardware sample to sample.
> I'm happy you can use this :)
> I worked a lot to make that available.
>
>> As of now there is no
>> configuration available for user space applications for polarity.)
> I think GPIOHANDLE_REQUEST_ACTIVE_LOW does
> that? Is there some misunderstanding?


Sorry I was not aware of this earlier. But yes, I confirmed that we could GPIOHANDLE_REQUEST_ACTIVE_LOW.

Thanks for the detailed comments.

Yes, We are talking about different PCBs. An example would be a product PCB A and a product PCB B, mainly identical, but due to slightly different hardware different GPIO polarity on some lines. Driven by the same Linux kernel and user space, just different device trees.

The proposal of "inverters" defining the polarity configuration makes sense.


Thanks,

Harish Jenny K N


