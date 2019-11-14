Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F8AEFC379
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2019 11:00:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbfKNKAl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Nov 2019 05:00:41 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56515 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725977AbfKNKAl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Nov 2019 05:00:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573725640;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=O8YWe8yK+T1KdpozhYe48rwSiMeJJznKbthAkqCF0LQ=;
        b=YlTQxFbhAXeYwQ+frgOQaqQZgQngNwqZF8BOwDnUFaCfyYT3XRkvO1ghh0mAKEwgV/GTkQ
        VyWmUv+BfKfJ4pdiT2URvRacUonWFpR2WZd3GiIvnXNYKmXMlKqWkcSyxP4Bkc34ghxlsE
        KYKKijG/GvpkZq231JFOondcoBLU100=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-j59FNaTBPzSQajCWcqhStQ-1; Thu, 14 Nov 2019 05:00:39 -0500
Received: by mail-wr1-f70.google.com with SMTP id b4so4092498wrn.8
        for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2019 02:00:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+4GFx2q9fN2h3EdrJtju3tt8akWWsgPxZJ2KeupG3js=;
        b=uVeonWdCOgMnHdfyAXRILpShUNLILyqJ3nDg/PXZ6OoqED1B2D4xFhNAxf+T9CWFG8
         SqAV6KY64IGxme4eFQn0RZqSKIDw2wPf0BBDQhxAIcLImxU7kSIWA6qVRnvS/2rUhKfX
         0Ny+NFg9Phc3yJpc4pyIvI8PJTJh73UZCXJG1LR5Z+WueMbBYBim8QB+pX8KLkkLcEYC
         bAqGuw3ujfIzREFWP9GqND5iRLXsfOULblCe9Y+BF8hrhcOiIJ4Yqw/LeLN5GYf8UyH7
         N/YlYNAlTq+fPCjbAVZN1P3ao3R69HdW25U2LL2loN7kjt2jsRa50IlxPZVahVOyeYmT
         eopg==
X-Gm-Message-State: APjAAAUioO1GBUAOo8xJLXHi98Vi6h0SgtCs89XL4n6DdMxEqpfaMEr+
        dXruvTjeKh8lLPg1SVtOJGPUS9MHlWUSw0pk7q4ecNLMXOafMu3Ylu/JKHBnWaMuotXe9zIgQ/z
        cwxLh9FFCYjag3B3OFlLPXA==
X-Received: by 2002:a1c:544b:: with SMTP id p11mr7309464wmi.46.1573725638536;
        Thu, 14 Nov 2019 02:00:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqxZ21GFvErXeJ1vGEJsYCgDUDxccSjuUAoJajJT+I+IBYExwp8sW/BN7+QAzVKccYFVuxyqdw==
X-Received: by 2002:a1c:544b:: with SMTP id p11mr7309445wmi.46.1573725638303;
        Thu, 14 Nov 2019 02:00:38 -0800 (PST)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id z11sm8286936wrg.0.2019.11.14.02.00.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2019 02:00:37 -0800 (PST)
Subject: Re: [PATCH v3 3/3] pinctrl: cherryview: Pass irqchip when adding
 gpiochip
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org
References: <20191113190520.305410-1-hdegoede@redhat.com>
 <20191113190520.305410-3-hdegoede@redhat.com>
 <20191113192722.GK32742@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ee61eaa1-320c-964c-711c-407b7dec8311@redhat.com>
Date:   Thu, 14 Nov 2019 11:00:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191113192722.GK32742@smile.fi.intel.com>
Content-Language: en-US
X-MC-Unique: j59FNaTBPzSQajCWcqhStQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 13-11-2019 20:27, Andy Shevchenko wrote:
> On Wed, Nov 13, 2019 at 08:05:20PM +0100, Hans de Goede wrote:
>> We need to convert all old gpio irqchips to pass the irqchip
>> setup along when adding the gpio_chip. For more info see
>> drivers/gpio/TODO.
>>
>> For chained irqchips this is a pretty straight-forward conversion.
>>
>> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>=20
>>   =09struct irq_chip irqchip;
>>   =09void __iomem *regs;
>> +=09unsigned int irq;
>>   =09unsigned intr_lines[16];
>=20
> This will conflict with our for-next.

Ah, I did cherry-pick intel-pinctrl for-next into my tree a couple of days
back, but I see there is a new "pinctrl: cherryview: Missed type change to =
unsigned int"
commit there which causes this conflict. I have cherry picked this new
commit into my tree and I will send out a v4 which should not conflict.

>=20
>> +=09if (need_valid_mask)
>> +=09=09chip->irq.init_valid_mask =3D chv_init_irq_valid_mask;
>> +=09chip->irq.init_hw =3D chv_gpio_irq_init_hw;
>> +=09chip->irq.parent_handler =3D chv_gpio_irq_handler;
>> +=09chip->irq.num_parents =3D 1;
>> +=09chip->irq.parents =3D &pctrl->irq;
>> +=09chip->irq.default_type =3D IRQ_TYPE_NONE;
>> +=09chip->irq.handler =3D handle_bad_irq;
>>  =20
>>   =09if (!need_valid_mask) {
>>   =09=09irq_base =3D devm_irq_alloc_descs(pctrl->dev, -1, 0,
>=20
>=20
> Perhaps now it makes sense to
>=20
> =09if (need_valid_mask) {
> =09=09chip->irq.init_valid_mask =3D chv_init_irq_valid_mask;
> =09} else {
> =09=09irq_base =3D devm_irq_alloc_descs(pctrl->dev, -1, 0,
> =09=09...
> =09} >
> ?

Ack good one, will also change this for v4.

Regards,

Hans

p.s.

About upstreaming this, I know this has a pre-requisite on the new add_rang=
es
callback stuff, but how about Linus Walleij creating an immutable branch
of his tree with the first series which adds the add_ranges callback in
there and then you merge that branch into pinctrl-intel/for-next and then
we just upstream all of this for 5.5 ? That seems easier then spreading
it out over 2 cycles. Just my 2 cents.

