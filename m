Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4703112CC9
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 14:39:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727714AbfLDNjs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 08:39:48 -0500
Received: from zimbra2.kalray.eu ([92.103.151.219]:40756 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727530AbfLDNjr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2019 08:39:47 -0500
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 7201627E06C1;
        Wed,  4 Dec 2019 14:39:46 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id I6_byX5Hm-4B; Wed,  4 Dec 2019 14:39:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id D13A427E0E3A;
        Wed,  4 Dec 2019 14:39:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu D13A427E0E3A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1575466785;
        bh=b/51G/JMtf/RESNKdaIDSR4mSDKkq9pwc0l6qcotXLY=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=Kn5OrMwOhbHMsx/vlp7Sjz/9eV0/OfeaF3PfbpYUpSraVzgvHGpR6lYTxBUTrgVkB
         EjeC9f1SKfzGm+lzDPbuGvlnTcRsMfYCk1CfSoZyHctTrHBORotntaSFHizMwoOGFl
         GEYLPCps2Wn1SGEbkfc29Rn8hLmQ1jzQCU4yit9I=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 5kGNwuvub3ZN; Wed,  4 Dec 2019 14:39:45 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id B903B27E06C1;
        Wed,  4 Dec 2019 14:39:45 +0100 (CET)
Date:   Wed, 4 Dec 2019 14:39:45 +0100 (CET)
From:   =?utf-8?Q?Cl=C3=A9ment?= Leger <cleger@kalray.eu>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list, GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Message-ID: <1746901411.95313623.1575466785578.JavaMail.zimbra@kalray.eu>
In-Reply-To: <CAHp75VfL5mRB0wy86_352nosKkKqVLZC_amCbLvhBTyNZztgRw@mail.gmail.com>
References: <20191204101042.4275-2-cleger@kalray.eu> <CAHp75VfL5mRB0wy86_352nosKkKqVLZC_amCbLvhBTyNZztgRw@mail.gmail.com>
Subject: Re: [PATCH 1/5] gpio: export acpi_gpiochip_request_interrupts in
 gpio/driver.h
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.40.202]
X-Mailer: Zimbra 8.8.12_GA_3794 (ZimbraWebClient - GC75 (Linux)/8.8.12_GA_3794)
Thread-Topic: gpio: export acpi_gpiochip_request_interrupts in gpio/driver.h
Thread-Index: 8yoxvWMoD8iFH9qbEgN6KjALSsb5cw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Ok, should I fix the original driver first and then submit the serie to add pinctrl ?

----- On 4 Dec, 2019, at 13:35, Andy Shevchenko andy.shevchenko@gmail.com wrote:

> On Wed, Dec 4, 2019 at 12:13 PM Clement Leger <cleger@kalray.eu> wrote:
>>
>> dwapb-gpio driver which uses this function will be moved to pinctrl for
>> pinctrl support. Export this function in gpio/driver.h to allow using
>> it.
>>
> 
> I don't think this is proper way to do it.
> The driver has to register IRQ chip and GPIO core will take care of
> ACPI related stuff.
> 
>> Signed-off-by: Clement Leger <cleger@kalray.eu>
>> ---
>>  drivers/gpio/gpiolib-acpi.h |  4 ----
>>  include/linux/gpio/driver.h | 12 ++++++++++++
>>  2 files changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpio/gpiolib-acpi.h b/drivers/gpio/gpiolib-acpi.h
>> index 1c6d65cf0629..ba2f187babe3 100644
>> --- a/drivers/gpio/gpiolib-acpi.h
>> +++ b/drivers/gpio/gpiolib-acpi.h
>> @@ -34,7 +34,6 @@ struct acpi_gpio_info {
>>  void acpi_gpiochip_add(struct gpio_chip *chip);
>>  void acpi_gpiochip_remove(struct gpio_chip *chip);
>>
>> -void acpi_gpiochip_request_interrupts(struct gpio_chip *chip);
>>  void acpi_gpiochip_free_interrupts(struct gpio_chip *chip);
>>
>>  int acpi_gpio_update_gpiod_flags(enum gpiod_flags *flags,
>> @@ -56,9 +55,6 @@ int acpi_gpio_count(struct device *dev, const char *con_id);
>>  static inline void acpi_gpiochip_add(struct gpio_chip *chip) { }
>>  static inline void acpi_gpiochip_remove(struct gpio_chip *chip) { }
>>
>> -static inline void
>> -acpi_gpiochip_request_interrupts(struct gpio_chip *chip) { }
>> -
>>  static inline void
>>  acpi_gpiochip_free_interrupts(struct gpio_chip *chip) { }
>>
>> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
>> index e2480ef94c55..40b9f13d77e1 100644
>> --- a/include/linux/gpio/driver.h
>> +++ b/include/linux/gpio/driver.h
>> @@ -733,6 +733,18 @@ void gpiochip_unlock_as_irq(struct gpio_chip *chip,
>> unsigned int offset);
>>
>>  struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc);
>>
>> +
>> +#ifdef CONFIG_GPIO_ACPI
>> +
>> +void acpi_gpiochip_request_interrupts(struct gpio_chip *chip);
>> +
>> +#else
>> +
>> +static inline void acpi_gpiochip_request_interrupts(struct gpio_chip *chip)
>> +{
>> +}
>> +
>> +#endif /* CONFIG_GPIO_ACPI */
>>  #else /* CONFIG_GPIOLIB */
>>
>>  static inline struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc)
>> --
>> 2.15.0.276.g89ea799
>>
> 
> 
> --
> With Best Regards,
> Andy Shevchenko
