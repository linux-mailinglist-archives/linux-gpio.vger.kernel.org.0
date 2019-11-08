Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 144D8F458C
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2019 12:20:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725730AbfKHLUL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Nov 2019 06:20:11 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:38572 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730144AbfKHLUL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Nov 2019 06:20:11 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA8BJxaQ061094;
        Fri, 8 Nov 2019 05:19:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573211999;
        bh=1sYnVYmhFnu7+WIH7nNDITfLUYTO+zpaIxaGA/cU59U=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=R2G5oq2KJJvCBmW8d1xZpPU+SFWdMrcwHZMJmbgAidMwgedWq9tQrbgDKxLhS0Nqo
         fWg73CQgDB+BjvXVpX5L6C8c+baTfkAD2XJ9YPCMBa5PKWJOQAnibCIS+7kKrSea0W
         FaDCSZHr1Oz7Uelh/E0Ksbl5xvt0kTbA0Ca1qMH4=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA8BJxpC106318
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 8 Nov 2019 05:19:59 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 8 Nov
 2019 05:19:42 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 8 Nov 2019 05:19:42 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA8BJtIp107908;
        Fri, 8 Nov 2019 05:19:56 -0600
Subject: Re: [RFC 0/2] gpio: Support for shared GPIO lines on boards
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Grant Likely <glikely@secretlab.ca>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mark Brown <broonie@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        Maxime Ripard <mripard@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
References: <20191030114530.872-1-peter.ujfalusi@ti.com>
 <CACRpkdbw9MVrQMSgVMenSqAOiti1pAy4d2LvWY-ssx9dhzWEcw@mail.gmail.com>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <8bd0f286-dc54-72a6-0aaf-2dc7b9972883@ti.com>
Date:   Fri, 8 Nov 2019 13:21:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdbw9MVrQMSgVMenSqAOiti1pAy4d2LvWY-ssx9dhzWEcw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On 01/11/2019 17.56, Linus Walleij wrote:
> Hi folks,
> 
> cutting all the discussions in this thread

the mail got disconnected from the thread and almost missed it ;)

> we need to see the bigger
> pattern:
> 
> On GPIO rails
> 
> People want "something like rails" for GPIO. In power supplies
> and thus the regulator subsystem, rails are connected to many
> logical endpoints.
> 
> - The suggested inverter bindings would be effectively an
>   inverter on a GPIO rail.
> 
> - This suggestion would be equal to many power consumers
>   on a rail, such as the usecase of shared gpio-enable lines in
>   the regulator subsystem already provides.
> 
> The former seems to have been identified as solveable for the
> userspace that needed it and absorbed into the drafts for a
> virtualized GPIO controller. (Aggregating and creating a new
> virtual GPIO chip for some select physical GPIO lines.)
> 
> I haven't seen an exact rationale from the DT community as
> to why these things should not be modeled, but as can be
> clearly seen in
> Documentation/devicetree/bindings/regulator/regulator.yaml
> the "rail abstraction" from the regulator subsystem which
> is in effect struct regulation_constraints and it sibling
> struct regulator_init_data is not in the DT bindings, instead
> this is encoded as properties in the regulator itself, so this
> is pretty consistent: the phandle from regulator to consumer
> *is* the rail.
> 
> This goes back to Rajendras initial DT regulator support code
> see:
> git log -p 69511a452e6d
> 
> So it would be logical then to just have:
> 
> - More than one phandle taking the same GPIO line
> - Figure this situation out in the gpiolib OF core
> - Resolve the manageability of the situation (same
>   consumer flags etc)
> - Instantiate a kernel component as suggested,
>   mediating requests.
> - Handle it from there.
> 
> So:
> 
> gpio: gpio-controller@0 {
>         compatible = "foo,gpio";
>         gpio-controller;
>         #gpio-cells = <2>;
> };
> 
> consumer-a {
>        compatible = "foo,consumer-a";
>        rst-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
> };
> 
> consumer-b {
>        compatible = "foo,consumer-b";
>        rst-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
> };

Should be fine I think.
Again, I would trust the board design to take into consideration of the
consumer's needs when sharing the same GPIO line for any purpose.

> Hi kernel: figure it out.
> 
> From this point the kernel driver(s) have to figure it out.
> 
> I don't think this requires any changes to the DT bindings
> other than perhaps spelling out that if you link more than one
> phandle to a GPIO line, magic will happen. (We should probably
> make very verbose dmesg prints about this magic.)

To start with I would let GPIO core to allow requesting the same GPIO
line by multiple consumers all the time.

If the flags for the gpio_request does not contain
GPIOD_FLAGS_BIT_NONEXCLUSIVE (probably we can have another define for
BIT(4) as GPIOD_FLAGS_BIT_MIGHT_BE_SHARED?) then print with dev_warn()
to get the attention of the developer that all users of the shared GPIO
line must be checked and change the current dev_info() to dev_dbg() when
the flag is provided.

When the consumer drivers are checked (and modified if needed) that they
behave OK in this situation we can snap the
GPIOD_FLAGS_BIT_MIGHT_BE_SHARED to silence the warning.

> This is enough to start with. After that we can discuss adding
> flags and constraint properties to a certain GPIO line if
> need be. (That will be a big discussion as well, as we haven't
> even figured out how to assign default values to individual
> GPIO lines yet.)

Not sure how the core would refcount things, but to align with what Rob
was saying about the misleading API naming:
gpiod_set_value(priv->en_gpio, 1/0) against the DT's
GPIO_ACTIVE_HIGH/LOW of the line's active state we might want to have:
gpiod_assert(priv->en_gpio);
gpiod_deassert(priv->en_gpio);

Basically assert would set the level to the active state defined by the
DT. deassert would, well, de-assert the active state.

gpiod_deassert() would be equivalent to Philipp's
gpiod_politely_suggest_value()

Gradually drivers can be moved to this API pair from gpiod_set_value()
when it makes sense.
The current gpiod_set_* would operate like as it is right now by not
asking politely a level, whatever it is.

Hrm, probably both gpiod_assert() and gpiod_deassert() should be polite
when asking for level change?

If all consumers of the shared line is using gpiod_assert/deassert, then
the core should 'protect' the raw level of the gpiod_assert() calls.

At the end we will see drivers converted to assert/deassert API when a
developer faces issues that they use shared GPIO line on a board.

gpiod_get should also use the polite version when setting the initial
level most likely.

Another thing is that currently gpio core does not have refcounting and
most of the client drivers treat it like that. It is perfectly fine to
gpiod_get(priv->en_gpio,1);
gpiod_get(priv->en_gpio,1);
gpiod_get(priv->en_gpio,1);
gpiod_get(priv->en_gpio,0);

at the last call the GPIO value is going to be set to 0 no matter if it
was set to 1 three times prior, but I guess this can be worked out when
the driver(s) are converted to assert/deassert.

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
