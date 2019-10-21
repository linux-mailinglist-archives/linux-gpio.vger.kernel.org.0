Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD955DECCD
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2019 14:52:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727985AbfJUMwX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Oct 2019 08:52:23 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33044 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727256AbfJUMwX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Oct 2019 08:52:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1571662341;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=v0q/2r1staKsQqPYNqdrvoxSoEvvpK1J/Oj8MMto9ec=;
        b=e6OSZQ3lWg1mhOwIz5v2SEYlo2PEGHGU+MHh1Pn49DWiWbrk/fBFWihWrqqgGMoknc9lqp
        prY8WSFdN1JkmG3Q7135ffaQX/6Lm0MqCGzqSGneev+8vN++WbApxg2tZsmtE9tL41X7ZS
        DsdKgJ3oOek734tavXlJ70pOidS9E94=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-sZsIBzbkM4CPlkwmk4W-1Q-1; Mon, 21 Oct 2019 08:52:18 -0400
Received: by mail-wr1-f72.google.com with SMTP id f4so7235467wrj.12
        for <linux-gpio@vger.kernel.org>; Mon, 21 Oct 2019 05:52:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=L3a2L4n50fLugXvRAz4YfEyDEkIb5FdOOCPTaoR8O7E=;
        b=EBlhpYXrXKuknQn/mKk2hdS8t9EQgnd2IRmWvz1I+esI8KqXd0YiiNURa9/CLZKjQf
         902U0f4n65vmfoSwMdEP/vqh/PobXnF5A8rb1ZjNXj1CZFHsV1llM7Mvcsq8DUpduW/3
         +gZkWRWIuOHVj0TyWghtgye5JxRzl3EY7G38wS82rPUlY1QiBUn0tOoKDLj9YvhnvjDp
         oEIAEfPiAUtS4Nq3AO/T68NHFSDEVdvWqrhWGwKFYuvuKTtpT8da9PjsSf8UDm25OACO
         e8y1vlCAphPhyWph/LW12aZ5GPC32QOiF2yO5XFF12elagrlHpg3sJ8Sn3EQ/ZDlzqld
         tQoA==
X-Gm-Message-State: APjAAAW6ChKH5wJ97LjXYMbZa1qsqi+EdYGB7+F+vu9q+5kiTO+LBlp6
        sp88aN6faE8oLl/+csIQrEZFVwoKDdU585ejQMoDeR9EpymdDbne7/NbTYF+Msi3CCP+pU1i5Oe
        FJK1YCuVp68Egfys7aa5r6w==
X-Received: by 2002:a1c:a751:: with SMTP id q78mr7163547wme.129.1571662336980;
        Mon, 21 Oct 2019 05:52:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwh+9X9yUCNJ47ZHE6Aj3Otv40L+iJkSA4CdOIMemhpWoReytWc3J4znlr0MqYoA863d7pzuw==
X-Received: by 2002:a1c:a751:: with SMTP id q78mr7163534wme.129.1571662336794;
        Mon, 21 Oct 2019 05:52:16 -0700 (PDT)
Received: from shalem.localdomain (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl. [2001:1c00:c14:2800:ec23:a060:24d5:2453])
        by smtp.gmail.com with ESMTPSA id c21sm13265212wmb.46.2019.10.21.05.52.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2019 05:52:15 -0700 (PDT)
Subject: Re: [PATCH] gpiolib: acpi: Print pin number on
 acpi_gpiochip_alloc_event errors
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org
References: <20191018195208.94405-1-hdegoede@redhat.com>
 <20191021091124.GK32742@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f3294033-8105-8c26-a8e2-3ced55276fdb@redhat.com>
Date:   Mon, 21 Oct 2019 14:52:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191021091124.GK32742@smile.fi.intel.com>
Content-Language: en-US
X-MC-Unique: sZsIBzbkM4CPlkwmk4W-1Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 21-10-2019 11:11, Andy Shevchenko wrote:
> On Fri, Oct 18, 2019 at 09:52:08PM +0200, Hans de Goede wrote:
>> Print pin number on acpi_gpiochip_alloc_event errors, to help debugging
>> these.
>=20
> I'm not sure which one is better decimal or hex, perhaps Mika can help me=
, in any case

They are listed as hex in the dis-assembled DSTD.

Regards,

Hans




> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>=20
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/gpio/gpiolib-acpi.c | 9 ++++++---
>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
>> index 609ed16ae933..2911dd6f2625 100644
>> --- a/drivers/gpio/gpiolib-acpi.c
>> +++ b/drivers/gpio/gpiolib-acpi.c
>> @@ -230,19 +230,22 @@ static acpi_status acpi_gpiochip_alloc_event(struc=
t acpi_resource *ares,
>>   =09desc =3D gpiochip_request_own_desc(chip, pin, "ACPI:Event",
>>   =09=09=09=09=09 GPIO_ACTIVE_HIGH, GPIOD_IN);
>>   =09if (IS_ERR(desc)) {
>> -=09=09dev_err(chip->parent, "Failed to request GPIO\n");
>> +=09=09dev_err(chip->parent,
>> +=09=09=09"Failed to request GPIO for pin 0x%02X\n", pin);
>>   =09=09return AE_ERROR;
>>   =09}
>>  =20
>>   =09ret =3D gpiochip_lock_as_irq(chip, pin);
>>   =09if (ret) {
>> -=09=09dev_err(chip->parent, "Failed to lock GPIO as interrupt\n");
>> +=09=09dev_err(chip->parent,
>> +=09=09=09"Failed to lock GPIO pin 0x%02X as interrupt\n", pin);
>>   =09=09goto fail_free_desc;
>>   =09}
>>  =20
>>   =09irq =3D gpiod_to_irq(desc);
>>   =09if (irq < 0) {
>> -=09=09dev_err(chip->parent, "Failed to translate GPIO to IRQ\n");
>> +=09=09dev_err(chip->parent,
>> +=09=09=09"Failed to translate GPIO pin 0x%02X to IRQ\n", pin);
>>   =09=09goto fail_unlock_irq;
>>   =09}
>>  =20
>> --=20
>> 2.23.0
>>
>=20

