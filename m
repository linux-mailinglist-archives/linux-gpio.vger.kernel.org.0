Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45B47FB819
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 19:53:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727582AbfKMSxI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 13:53:08 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:36529 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726422AbfKMSxI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 13 Nov 2019 13:53:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573671186;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5+HAHo4BNOqRrUG4b1K5kwYbPMXRPwWPUh+sV4jx464=;
        b=CawJUF7jGVCGW8kiR0vlsRL+RguvylIpyrsfKCZS8CDauX+AEEcEI2IGn9zSLmcmsTZy2Z
        NUIxkr3iFKAMF8Pk2UlbtyTx09AGPQveYfEATSrlz+XWcTfLajeX3QHust3t+NNBkTwfkR
        SQUmGJ0w6EkkqU2KHDuw95rjmA5VNOQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-fOD4ObEAMJee4FqeCgi9tA-1; Wed, 13 Nov 2019 13:53:02 -0500
Received: by mail-wr1-f71.google.com with SMTP id y3so2203614wrm.12
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2019 10:53:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lOcI/zp+bxBnYkB4CrKpl1njMNwmC2784UB3qltnyqw=;
        b=TTrEfVNlxavSvlJnhj75AyynM1jRX8/2NQMrMKNnwfRVfxL/azttPGL87NH3IDaiU9
         8Ju5Cd9NgPs15jZvqA5VBZRCy1EFiJ5icpCfDq6YhagMIhvbU0gblHsiLAq8bwAorFaj
         nTLn07e2celbxJeRzxWJYQzI+ntRfoUuS4GkCMZDx8wolaf/3hgVfFXjEwr+b/xEY57j
         FNOY9rQC9Jk3Dq89/oHmUuJRRPAtpAolf0o/OA9pfGe2uEX7XZ131tncEUZcF5O17Kgm
         Z+mOKHv7eew+5p7OkHRzSP9s5e1CKw9VhtzrErQAMppQCgzFLsyzdwyRyZchn9KxUUye
         bxIA==
X-Gm-Message-State: APjAAAUyI4P+mYmvV/K9YfLigsCTuI6T4VQzivXw9i44BCxBzE1Hxb59
        SBHM6skmZ8s/ymK+CFGVlvStWVVvYpd+99tsIpoXL1SRbkxrul0fj1jvdppwRwtuCO/UMtTmvph
        eoUIJj4AswOkG8HvWI4PDWw==
X-Received: by 2002:a5d:448f:: with SMTP id j15mr1072834wrq.70.1573671181501;
        Wed, 13 Nov 2019 10:53:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqxFyZKber1u3LPbNRbr1/dl4EJ6L4KuzEpLv31MGG9lKn4KkBDLP10DXdNtzZYAKEzXmOkqUg==
X-Received: by 2002:a5d:448f:: with SMTP id j15mr1072814wrq.70.1573671181302;
        Wed, 13 Nov 2019 10:53:01 -0800 (PST)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id x8sm3942716wrm.7.2019.11.13.10.53.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2019 10:53:00 -0800 (PST)
Subject: Re: [PATCH v2 3/3] pinctrl: cherryview: Pass irqchip when adding
 gpiochip
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org
References: <20191106154715.155596-1-hdegoede@redhat.com>
 <20191106154715.155596-4-hdegoede@redhat.com>
 <20191106161622.GM32742@smile.fi.intel.com>
 <20191106161753.GN32742@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <46a5e93d-b6d9-8c8d-647b-5a74840cea3d@redhat.com>
Date:   Wed, 13 Nov 2019 19:52:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191106161753.GN32742@smile.fi.intel.com>
Content-Language: en-US
X-MC-Unique: fOD4ObEAMJee4FqeCgi9tA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 06-11-2019 17:17, Andy Shevchenko wrote:
> On Wed, Nov 06, 2019 at 06:16:22PM +0200, Andy Shevchenko wrote:
>> On Wed, Nov 06, 2019 at 04:47:15PM +0100, Hans de Goede wrote:
>>> We need to convert all old gpio irqchips to pass the irqchip
>>> setup along when adding the gpio_chip. For more info see
>>> drivers/gpio/TODO.
>>>
>>> For chained irqchips this is a pretty straight-forward conversion.
>>
>>> +=09chip->irq.chip =3D &pctrl->irqchip;
>>
>>> +=09if (pctrl->need_valid_mask)
>>> +=09=09chip->irq.init_valid_mask =3D chv_init_irq_valid_mask;
>>
>> I just realize we probably may assign here unconditionally
>=20
> Continuing...
>=20
>>
>>> +=09chip->irq.init_hw =3D chv_gpio_irq_init_hw;
>>> +=09chip->irq.parent_handler =3D chv_gpio_irq_handler;
>>> +=09chip->irq.num_parents =3D 1;
>>> +=09chip->irq.parents =3D &pctrl->irq;
>>> +=09chip->irq.default_type =3D IRQ_TYPE_NONE;
>>> +=09chip->irq.handler =3D handle_bad_irq;
>>>  =20
>>>   =09if (!pctrl->need_valid_mask) {
>=20
> And here turn it back to NULL and check the pointer against NULL instead =
of
> additional variable.
>=20
> What do you think?

I think that first setting it and then clearing it again is not
very pretty. But ...

I do think you are on to something, we can use pctrl->chip.irq.init_valid_m=
ask
instead of storing the dmi quirk in the chv_pinctrl struct.

Then we can leave the dmi handling as is, and replace later checks for
the dmi quirk (in callbacks) with a check for pctrl->chip.irq.init_valid_ma=
sk
I do believe that that is better then adding a need_validmask member to
the chv_pinctrl struct, I will prepare a v3 of the series with this change.

Regards,

Hans

