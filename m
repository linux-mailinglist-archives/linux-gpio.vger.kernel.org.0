Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B8955466E8
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jun 2022 14:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345266AbiFJMxi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Jun 2022 08:53:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349128AbiFJMxg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Jun 2022 08:53:36 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B52BB544E5
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jun 2022 05:53:33 -0700 (PDT)
Received: from [192.168.1.107] ([37.4.249.155]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MqINP-1nLJAD1R9X-00nSQ6; Fri, 10 Jun 2022 14:53:18 +0200
Message-ID: <c42fd256-e988-ebed-b6b8-91419c30e57d@i2se.com>
Date:   Fri, 10 Jun 2022 14:53:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH RFC] pinctrl: bcm2835: Make the irqchip immutable
Content-Language: en-US
To:     Marc Zyngier <maz@misterjones.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Phil Elwell <phil@raspberrypi.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220607103302.37558-1-stefan.wahren@i2se.com>
 <80790ad5a55e58f923de1c411e970875@misterjones.org>
From:   Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <80790ad5a55e58f923de1c411e970875@misterjones.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/+iuI1oqgHN8gZy/l8aWrc328byTLNiGKL1i6uzfn5aTJZmqycd
 Esd622mhWdI6N4UYXSeOIBGgzMW6E6boYzNQosWHvffNp2jaMajkP73e5UYhr2stmJgH4Hk
 b6CVZ6ZjvR6zhBKbhD0TocD5sGl752EtPgOzKP2p+k4kNy+CzhzlK9+5lYTIzxTX75WWfYe
 6ksuEzwvQskZHQ6d0EB1A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4lRIhYH2/wE=:oxAbwIv94jNEYAZUcKcN9I
 rcbumF4rdHm0b48Qs/fSVJUflxXAx5kPBqSqyDr+HabvPK30frkht6vDup2LTDJZsmlx8cho5
 dsHRN8Y/SZjbwRqXFeZxQpv1T6HXUQfKK4Vn/jeUhCHXkO9EJsUEddsanlu/1UNcWSjfuCNF0
 8HlZ4KR3ApC4hSempO8c8YC8qlzk871pAqGPzX7ioiTfs2AGS/K7wQPgDntK8JA/IvItpCg/Q
 6+CU+Rnk+z9FiP0/LaWbFHPkjmkRoGFJh1VUYnLzRfsbbZ9BHzhDT/Jx0EDUdPvT11q7jC/Pv
 MjwcnTtbxotl/Ouw1b4GLl5Ys6JCt9lph1xPIlxNXUkaEgpDSLKzgXvM2weUvay4J8i8h1RGl
 oB8C2Q60lST4mReaqmGtDzneK9q8tNjTvURtG4hOw6LmHWSZcwWuZh7UXd6/LjRjIOKqgruvr
 9vUvaxiCHUMSQ5aEWLKzObpGZ5bS9blCwkvS3VGDpg1X9i6ydBuQTi97iIG3Fga3mmstkPdQ+
 4/eoTFy6XCt4RWLzI74dbPqzIkj2T+7KvgUbFr1VAx3unx5wuE0KCl0/10tgeLJO03a2FKpw8
 pTaMvJvjADHl8Cl80nCyIZSz7WOursyplAiuYhIHgkeJ7yDgFLVzemQHaILmBqs2P5C6vW3qO
 qmnk+6HW/Llq/jNPGdCiQbHrOyM5QG7UEA47cAcCtookcS586oireAH423zYNUHK++vZDg77J
 i2G7WJRfzC5Smyo+9Nq5tlJg1xVMSWy0MIxV86jWyN0AQDqW0k0o33RrbsU=
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Marc,

Am 10.06.22 um 10:51 schrieb Marc Zyngier:
> On 2022-06-07 11:33, Stefan Wahren wrote:
>> Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
>> immutable") added a warning to indicate if the gpiolib is altering the
>> internals of irqchips. The bcm2835 pinctrl is also affected by this
>> warning.
>>
>> Fix this by making the irqchip in the bcm2835 pinctrl driver immutable.
>>
>> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
>> ---
>>
>> Hi, not sure about this change because irq_mask/unmask also uses the
>> enable/disable callbacks.
>
> Yeah, that's totally broken.
>
> If you have both enable and mask, they *must* be doing something
> different (the names are pretty unambiguous...). If they do the
> same thing, then enable/disable has to go.
i will send a seperate fix for this.
>
>>
>>  drivers/pinctrl/bcm/pinctrl-bcm2835.c | 10 +++++++---
>>  1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
>> b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
>> index dad453054776..f754f7ed9eb9 100644
>> --- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
>> +++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
>> @@ -516,6 +516,8 @@ static void bcm2835_gpio_irq_enable(struct 
>> irq_data *data)
>>      unsigned bank = GPIO_REG_OFFSET(gpio);
>>      unsigned long flags;
>>
>> +    gpiochip_enable_irq(chip, gpio);
>> +
>>      raw_spin_lock_irqsave(&pc->irq_lock[bank], flags);
>>      set_bit(offset, &pc->enabled_irq_map[bank]);
>>      bcm2835_gpio_irq_config(pc, gpio, true);
>> @@ -537,6 +539,8 @@ static void bcm2835_gpio_irq_disable(struct 
>> irq_data *data)
>>      bcm2835_gpio_set_bit(pc, GPEDS0, gpio);
>>      clear_bit(offset, &pc->enabled_irq_map[bank]);
>>      raw_spin_unlock_irqrestore(&pc->irq_lock[bank], flags);
>> +
>> +    gpiochip_disable_irq(chip, gpio);
>>  }
>>
>>  static int __bcm2835_gpio_irq_set_type_disabled(struct 
>> bcm2835_pinctrl *pc,
>> @@ -693,7 +697,7 @@ static int bcm2835_gpio_irq_set_wake(struct
>> irq_data *data, unsigned int on)
>>      return ret;
>>  }
>>
>> -static struct irq_chip bcm2835_gpio_irq_chip = {
>> +static const struct irq_chip bcm2835_gpio_irq_chip = {
>>      .name = MODULE_NAME,
>>      .irq_enable = bcm2835_gpio_irq_enable,
>>      .irq_disable = bcm2835_gpio_irq_disable,
>> @@ -702,7 +706,7 @@ static struct irq_chip bcm2835_gpio_irq_chip = {
>>      .irq_mask = bcm2835_gpio_irq_disable,
>>      .irq_unmask = bcm2835_gpio_irq_enable,
>>      .irq_set_wake = bcm2835_gpio_irq_set_wake,
>> -    .flags = IRQCHIP_MASK_ON_SUSPEND,
>> +    .flags = (IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_IMMUTABLE),
>
> You are missing the callbacks into the resource management
> code (GPIOCHIP_IRQ_RESOURCE_HELPERS).
Thanks
>
> Thanks,
>
>         M.
