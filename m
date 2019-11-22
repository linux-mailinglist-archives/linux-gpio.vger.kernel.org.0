Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2565F107356
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2019 14:37:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727809AbfKVNhG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Nov 2019 08:37:06 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:53034 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbfKVNhG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Nov 2019 08:37:06 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAMDas63078389;
        Fri, 22 Nov 2019 07:36:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574429814;
        bh=Wi6ZgZI4r6IS9bms8nXC10YWQfy3n++xOx+J8yqDN7c=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=w5ReVDww8V4Nfd1yP8V/lPs17pwBkSEHTSVVgG5kMYIvWsrXSMVEogFSJe0/ick3W
         Iiv8ZYStBToJZpshsa93ZiK4QWghiEBg5XPRIOdHt8CSVsuyhHDzIU002JbAXzpK/+
         0Y8QTQ+CGLy3krx1/G9UTngrpIcNqi4Dr0R5970M=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAMDas92072643
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 22 Nov 2019 07:36:54 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 22
 Nov 2019 07:36:53 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 22 Nov 2019 07:36:53 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAMDaoTH018858;
        Fri, 22 Nov 2019 07:36:51 -0600
Subject: Re: [RFC 1/2] dt-bindings: gpio: Document shared GPIO line usage
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mark Brown <broonie@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <20191120133409.9217-1-peter.ujfalusi@ti.com>
 <20191120133409.9217-2-peter.ujfalusi@ti.com>
 <CACRpkdbXX3=1EGpGRf6NgwUfY2Q0AKbGM8gJvVpY+BRAo5MQvQ@mail.gmail.com>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <d423bc53-31df-b1b4-37da-932b7208a29e@ti.com>
Date:   Fri, 22 Nov 2019 15:36:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdbXX3=1EGpGRf6NgwUfY2Q0AKbGM8gJvVpY+BRAo5MQvQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 22/11/2019 14.10, Linus Walleij wrote:
> On Wed, Nov 20, 2019 at 2:34 PM Peter Ujfalusi <peter.ujfalusi@ti.com> wrote:
> 
>> Boards might use the same GPIO line to control several external devices.
>> Add section to document on how a shared GPIO pin can be described.
>>
>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> 
> As I've stated earlier I think this information is surplus.
> If two devices have a phandle to the same GPIO line
> then it is by definition shared.

Well, phandle + line number to be precise. There might be a way to grep
the whole DT and figure out if really we have multiple users for the
same line behind of the phandle.

> 
>> +               line_a {
>> +                       gpio-shared;
> 
> So this is unnecessary: if the same line is referenced
> by phandle from two places it is shared, simple as that.

phandle is pointing to the gpio controller, not to the line.

> It is up to code in the operating system (like Linux) to
> detect if they are shared in practice (both consumer
> nodes are enabled) and then deal with the outcome.

Ideally yes.

>> +                       gpios = <5 0>;
>> +                       output-low;
> 
> This is overlapping with the use case to define initial
> state values for GPIOs, something that has been
> brought up repeatedly and I've collected links for
> previous discussions several times.

I don't mind this to go away and the first set would configure the level.
Kept it here so I can reuse the gpio-hog code from gpiolib-of ;)

> I guess if need be I have to look them up again.
> 
> The DT maintainers don't like the hog syntax so
> something else is desired for this.

I see, so the gpio-hog might change?

>> +                       refcounted-high;
> (snip)
>> +The shared GPIO line management strategy can be selected with either of the
>> +following properties:
>> +- refcounted-low: The line must be kept low as long as there is at least one
>> +               request asking it to be low.
>> +- refcounted-high: The line must be kept high as long as there is at least one
>> +               request asking it to be high.
> 
> Is this really needed? Isn't it more appropriate to just define the
> semantics such that as soon as some consumer requests the line
> high it will be refcounted high, and as soon as it is requested
> low by any consumer it will be refcounted low.

Well. How do we decide which level is the one that should be preserved?

How would the core decide what to in a simplest case:
two device, they are the same part.
ENABLE pin which needs to be high to enable the device.
When the driver probes it asks for initial deasserted GPIO as the device
is not in active use.

We are refcouting low?

Then one device is enabled, it asks for assert for the line.

We are now refcounting high?

Then the other device is also enabled, it also asserts the line.

We are still refcounting high?

_one_ of the device is no longer in use, the driver asks for deassert.

We are switching to refcount low and set the line low?
That would break the other device as it still want the line high.

and no, we can not refcount for the asserted state as if the pin is
RESET and active low, then assert will disable the devices.

Now if you throw in a third device to the mix, the whole global
refcounting will be off even more.

Furthermore:
If you have two different devices one with ENABLE (low=reset,
high=enabled) the other with RESET (low=reset, high=enabled) pin and
they are described in DT correctly and the driver is written correctly
for assert/deassert, then this dummy shared implementation will just
fail as we are sharing the same gpio_desc between them, but they want to
use it with different GPIO_ACTIVE_* level.

>> +If neither of the refcounting strategy was selected then the shared GPIO is
>> +handled as pass through. In this mode all user requests will be forwarded to the
>> +shared GPIO pin without refcounting.
> 
> Why should this even be allowed? If we are defining a special semantic
> for refcounted GPIOs (even defining a separate API in the Linux
> OS, though it is beside the point) why do we have to have a fallback
> to the old behaviour at all?

I kept it because there were comments for the gpio-shared driver
indicating that in some cases pass-through shared line might be needed
for some setups.

> I think you can do this by just detecting multiple phandles to the
> same GPIO and implicit refcounting for > 1 consumers.

You mean that at every gpio request we would parse the DT to see if
there is another gpio binding pointing to the same gpio pin?
Or want to do a parse for all gpio pins during boot and mark the pins
which have multiple gpio binding pointing to them?

> I.e. no new bindings at all, maybe some patches explaining the
> semantic effect of using the same GPIO from two consumer
> nodes.

The level that needs to be preserved need to be communicated somehow imho.

If you plan to have separate API for this as I believe you do, then probably

struct gpio_refcount_desc *gpiod_refcounted_get(struct device *dev,
					const char *con_id,
					enum gpiod_flags flags,
					bool i_care_for_asserted_state);

If the device have ENABLE with active high, the driver would:
gpiod_refcounted_get(dev, "enable", GPIOD_OUT_DEASSERTED, true);

if it has RESET with active low, the driver would:
gpiod_refcounted_get(dev, "reset", GPIOD_OUT_ASSERTED, false);

if it is desired that the device would be placed in reset/power-down
when the driver probes.

Then the core would need to figure out what these actually mean at the end.

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
