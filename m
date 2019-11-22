Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B51181074A4
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2019 16:14:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbfKVPOc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Nov 2019 10:14:32 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:55134 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbfKVPOb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Nov 2019 10:14:31 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAMFEMoe002803;
        Fri, 22 Nov 2019 09:14:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574435662;
        bh=LEoKzP+gjwdd+jJNdlnzot4AMyZh5+QDRZw7mWkYVlw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Nxoz37wTLG2Kc65jwGRBK6zLymqsD3Xq+Ex/iBMd6FRlaArNNbRMscdA1+fUNZC5S
         HQ3GHtB4d7kg9VL0Jjvpir9/GFTbvsATEv93WtK8ehC2tD6pZ7zOuPaJcm1CdWRld5
         sV7LJM2IPIfsMyZDFM9N+gzuXdAk84NvX1/afb58=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAMFEMr8099775
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 22 Nov 2019 09:14:22 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 22
 Nov 2019 09:14:21 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 22 Nov 2019 09:14:21 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAMFEJJD069844;
        Fri, 22 Nov 2019 09:14:19 -0600
Subject: Re: [RFC 2/2] gpiolib: Support for (output only) shared GPIO line
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
 <20191120133409.9217-3-peter.ujfalusi@ti.com>
 <CACRpkdYt5P=GNc3EgHb-ry9fxMbXfpZd4FC=tuLqonNJKUM2wg@mail.gmail.com>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <18d7bc91-2fd8-fe33-bda6-b3a200d280d0@ti.com>
Date:   Fri, 22 Nov 2019 17:14:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdYt5P=GNc3EgHb-ry9fxMbXfpZd4FC=tuLqonNJKUM2wg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 22/11/2019 14.22, Linus Walleij wrote:
> On Wed, Nov 20, 2019 at 2:34 PM Peter Ujfalusi <peter.ujfalusi@ti.com> wrote:
> 
>> This patch adds basic support for handling shared GPIO lines in the core.
>> The line must be configured with a child node in DT.
>> Based on the configuration the core will use different strategy to manage
>> the shared line:
>> refcounted low: Keep the line low as long as there is at least one low
>>                 request is registered
>> refcounted high: Keep the line high as long as there is at least one high
>>                 request is registered
>> pass through: all requests are allowed to go through without refcounting.
>>
>> The pass through mode is equivalent to how currently the
>> GPIOD_FLAGS_BIT_NONEXCLUSIVE is handled.
>>
>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> 
> This is a good start! Some ideas on how I'd like this to develop.

Thanks!

> 
>>  drivers/gpio/gpiolib-of.c |  28 ++++++--
>>  drivers/gpio/gpiolib.c    | 132 +++++++++++++++++++++++++++++++++++---
> 
> Please put this API under its own Kconfig option
> and in its own file in
> drivers/gpio/gpiolib-refcounted.c
> local header in
> drivers/gpio/gpiolib-refcounted.h
> only built in if the appropriate Kconfig is selected.

This patch is not really an API, but extension to the current one so
that clients does not need to be aware of the shared use.

> Consumer header in
> include/linux/gpio/reference-counted.h
> And add external driver API to this last file.

would it be better to have
include/linux/gpio/consumer-refcounted.h

> 
>> --- a/drivers/gpio/gpiolib-of.c
> 
> No commenting on this because as pointed out in the binding
> patch I want this done by simply detecting the same GPIO
> being referenced by several <&gpio N> phandles.

Would you scan all pins for each gpio-chip during boot time or scan only
when a gpio is requested and it is not already requested (so it is shared)?

>> diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
>> index ca9bc1e4803c..0eec0857e3a8 100644
>> --- a/drivers/gpio/gpiolib.h
>> +++ b/drivers/gpio/gpiolib.h
>> @@ -111,11 +111,18 @@ struct gpio_desc {
>>  #define FLAG_PULL_UP    13     /* GPIO has pull up enabled */
>>  #define FLAG_PULL_DOWN  14     /* GPIO has pull down enabled */
>>  #define FLAG_BIAS_DISABLE    15        /* GPIO has pull disabled */
>> +#define FLAG_IS_SHARED 16      /* GPIO is shared */
> 
> This is a good way of flagging that this is a refcounted GPIO
> I would call it FLAG_IS_REFERENCE_COUNTED as it is
> more precise to what it means.

As I said before, I think this refcounting is not going to work nicely
when we have actually shared gpio.

>> +#define FLAG_REFCOUNT_LOW 17   /* Shared GPIO is refcounted for raw low */
>> +#define FLAG_REFCOUNT_HIGH 18  /* Shared GPIO is refcounted for raw high */
> 
> Do not put this here, keep it in the local refcounted GPIO
> struct gpio_refcount_desc.

OK.

>>         /* Connection label */
>>         const char              *label;
>>         /* Name of the GPIO */
>>         const char              *name;
>> +       /* Number of users of a shared GPIO */
>> +       int                     shared_users;
>> +       /* Reference counter for shared GPIO (low or high level) */
>> +       int                     level_refcount;
> 
> We can't expand this struct for everyone on the planet like this.
> 
> In the local header
> 
> drivers/gpio/gpiolib-refcount.h create something like:
> 
> struct gpio_refcount_desc {
>     struct gpio_desc *gd;
>     int shared_users;
>     int level_refcount;
> };

So. If we give this to multiple users then how different GPIO_ACTIVE_*
would be handled? What flag would be used for gd?
How do we know which level that needs to be preserved?

struct gpio_refcount_desc *gpiod_refcounted_get(struct device *dev,
					const char *con_id,
					enum gpiod_flags flags,
					bool i_care_for_asserted_state);

Would take care of that, but we will still have the issue coming from
the global refcounting.

Hrm, actually we might not. If we use the level_refcount to count for
high for example, then we would never decrement below 0 (as I do in this
patch) then things might be balanced.
No, they are not:

We want high refcount for the gpio.
Driver1 probes, asks for gpio and it asks it to be low.
Driver1 sets the gpio to high as it is enabled.
Driver2 probes, asks for the gpio and it asks it to be low.
Device1 also got reset.
Driver2 is not enabling the gpio as it is not needing it
Driver1 bugs out on access to chip.

> This should be the opaque cookie returned to consumers of this new
> refcounted API.
> 
> It defines the reference counted API as separate and optional from
> the non-reference counted API, also using its own API.
> 
> The only effect on the core
> gpiolib will be the single flag in struct gpio_desc; and some
> calls into the shared code with stubs if the support for systems
> that do not enable the reference counting API.

One thing which might work, but it might be a longer shot:
If there is a chance that the driver is used in shared gpio case, the
driver needs to use the new API. I would not call it refcounted, but
perhaps 'managed'?

When the first driver requests the gpio, then we would allocate a
'master' managed descriptor, similar to "struct gpio_refcount_desc" but
with list_head and probably something else as well (lock/mutex, whatever
we need). Get the gpio for it, mark it as shared.
Allocate a 'client' managed struct which we add to the list and give it
back to the driver requesting the gpio line.

Likely the 'master' struct needs to be in a global list as well to be
able to find the correct one when someone else is requesting the same
gpio, which is already managed.
SO we might need to list_heads in there, one for the global 'masters'
list and one for it's 'clients' list.

From here it is kind of simple as when a client driver asks for a level,
we will change the 'client' node's state the the level and then ask the
'master' to check all of it's 'clients' current state and decide if the
real GPIO needs to be changed and to what level.

> 
> Yours,
> Linus Walleij
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
