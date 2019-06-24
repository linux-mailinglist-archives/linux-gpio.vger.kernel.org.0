Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4644C5024B
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2019 08:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbfFXGcW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jun 2019 02:32:22 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:42925 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726334AbfFXGcW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jun 2019 02:32:22 -0400
Received: from [192.168.1.110] ([77.4.138.202]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MPGJf-1hw0Yn0km5-00PfNe; Mon, 24 Jun 2019 08:32:16 +0200
Subject: Re: [RFC] Initial state for GPIOs
To:     Martyn Welch <martyn.welch@collabora.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>, kernel@collabora.com
References: <bee53b48c96603ae8970d42bc4bff386b876bc51.camel@collabora.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <716ee0b5-21b8-e245-e957-e3e18b3d44b1@metux.net>
Date:   Mon, 24 Jun 2019 08:32:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <bee53b48c96603ae8970d42bc4bff386b876bc51.camel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:v6LAyBpIGe6lIiMrXzH4pY9bu4ZOeUoNSnKm+SfUoGIiGdL6lYL
 pU+QrGRDUbibm51wmq/Ikc1IPexETJtuSLvew6GtENFgfBgjwDWJYyHckij8q8QzmIbAYii
 /6FiIKEi+zprH/ZPZXg20kW/GgZTqMMOk+rP6MU2WE4/XV71p+8EiCkj2dpNbl9c8OWnfgf
 GRZUcby9V531WcQgN+SdA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ehtJl6zmzCM=:bzF/ZgDB7DtflWwBJy8dMK
 1tZYRm9lncQSasrSu5md+W7gc+Gob7wCrPtYFgpuh/Nx2bWeMi466QHZS2iEuRFQjW9gCX0oi
 6UmmwSsNFHJNybaovO925b1L/cSZZf+ykfNVaAggQk3mDqVviT2JuiP17XaiBxH31nrhZaU9i
 1AxYElxrDvelfumSCjwoLA3qFS52OllwaCJ6gzxKr7WImpKhUzUntpe/y3hwcOmK+BsENgMbz
 hZy03bnDusHfK5XxwWD8ZK9burzvAcJmCaN3xg1pHI9uGJByZ5DHsMmrvPL5oz8dyAfAHH6H+
 p4P/fPOSWJ7Jfs7slQbIx0RnLpFpUu+cN+6NjA8k4BmVNoP+1dPfPk1b0YsVrery7VhzFEP6Q
 mv82q4IT/tIOm/XXGZX6j2XSHR+5GbpaH+vjWLftj56PBm3jVQ1xT2KcuuX9GzhTn/H0u4xwB
 ilieZLddmRt2hhfwAkqzM2xi1ih8nTc7s9AJVd8wLh4DfEbenW+laKFuUI9mcj+DyjZsUp6iJ
 yIx3Kwbm4JGTWQPO5QP30Z6Qne7DsnxSBo4zC6TpfJwzA/KNQG1W5lJmJBNU3XNZXjCHqGlJ1
 6RcBDouP21UoI8IvE4ccOvqkmxiwjN5nIpiFSEoMFVc/zkJbDzIDlUCrLcFFuXzFAUm7HKpZ9
 ioNS+83t0fVqHv7W8XhyngmsOjSBklSw+8eueFccVhrqIkqBNMp7LEmWZPjUWgRab7oqg5EE8
 HnSs6MoRuAkQLwvGMgv76Kf+FEq3V3VuwZQnzK9p/cGCK16dUVhlwDZXLA0=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 20.06.19 15:16, Martyn Welch wrote:

Hi,

I haven't followed the previous discussions, so please forgive me when
I'm missing something and asking dumb or already answered questions:

> An alternative that has been briefly raised[4] when I approached the> subject recently on the GPIO mailing list is to add a property to the>
controller node, rather than child nodes, that listed the expected>
initial states of the pins as an array, much like the line names are>
handled through "gpio-line-names".
If it's really about early setting a specific state *once*, then I think
this would be the best approach.

OTOH, I'm still a bit unsure, whether the whole idea is really correct
to begin with:

I'd guess if a specific initial state is required, the pin has some
special meaning, which indicates there should be a specific driver for
it. I've got a strange feeling on splitting the semantics between board
configuration like DT (or some board init code) and the driver - even if
the driver is just some script in userland.

What are the reasons for not just doing it in a bootup script ?

Another problem might be timing: in either case, we don't know when the
initial state is actually set. Doing it in the kernel instead of
userland certainly moves it to an earlier point in time, but still a
pretty much unpredictable one.

> --- gpio.h
>         /* Bit 4 express initial state */
>         #define GPIO_INPUT 0
>         #define GPIO_OUTPUT 16
> 
>         /* Bit 5 express initial state */
>         #define GPIO_INITIAL_LOW 0
>         #define GPIO_INITIAL_HIGH 32
>         
>         #define GPIO_OUTPUT_LOW (GPIO_OUTPUT | GPIO_INITIAL_LOW)
>         #define GPIO_OUTPUT_HIGH (GPIO_OUTPUT | GPIO_INITIAL_HIGH)

Does it need to be an int value in DT ?
Why not using human-readable strings, eg:

   "in"
   "out-low"
   "out-hi"

Yes, doing three strcmp()s takes more cycles than just a switch(),
but does that really matter ?

> An alternative option may be to provide the offset as the first item
> (though this is then different from "gpio-line-names"), so:
>
> 
> --- device tree
>         &gpiochip {
>                 gpio-line-names = "", "", "", "widget_en",
> 			"widget_signal";
>                 gpio-initial-states =
> 			<3 GPIO_OUTPUT_HIGH | GPIO_LINE_OPEN_DRAIN>,
> 			<4 GPIO_INPUT | GPIO_ACTIVE_LOW>;
>         };

hmm, feels a bit strange to me. Yes, it allows a shorter notation, if
one just wants to set very few lines, but IMHO complicates things.
I feel a list w/ possibly NULL entries is cleaner.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
