Return-Path: <linux-gpio+bounces-39684-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ntOhKl/DTmqETgIAu9opvQ
	(envelope-from <linux-gpio+bounces-39684-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 23:38:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0C272A93E
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 23:38:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b="vSo1/gwo";
	dmarc=pass (policy=none) header.from=arm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39684-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39684-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52FCB30480F9
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2026 21:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B403F58C4;
	Wed,  8 Jul 2026 21:31:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BDF53E1CF4;
	Wed,  8 Jul 2026 21:31:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783546315; cv=none; b=DFiTWW/7Uv+CEzQ1+gH+FQHwNaTK+IQODh4gFS2/GUT8gstR6uUFmlOz/A/ioCXzzh3hIlXrfd3uniVfhB1iJPRYbl08QXiMO4npIr/S/+E2m0cGtqjlQP+Whr1/8ADu7rYKv7VwYbAAq5hFtnNLlPJWWw6vOBuzQ190/2HbDR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783546315; c=relaxed/simple;
	bh=+4gaZD2CDpjlyl0wK8WUbWgheN0F7E51RWUGwzhlNho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gq6rMn6nlonisgNAlnN0vMRAhB3c4IUYFn8mqrmUrSAo4GgaCjKTQ1Hs6D+yZcleNl/uQgFS66OikHvLy0eUXO+beYMzMBHeVLUE4yPmsyfYjaSWiZ9s88NPJtTtVska5pR09pUFSyWyUJLnkmeE5phPsmK9Nhyknxnkpmik4Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=vSo1/gwo; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4D2B1A00;
	Wed,  8 Jul 2026 14:31:47 -0700 (PDT)
Received: from [10.20.1.47] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A8CB3F905;
	Wed,  8 Jul 2026 14:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783546312; bh=+4gaZD2CDpjlyl0wK8WUbWgheN0F7E51RWUGwzhlNho=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vSo1/gwoag9ds+EaTxKNDNyxJz1HbaB9WcTaIQrDMpce8hm0Bv5etX/ovU8IvR58U
	 7uoP1N6954gCQhzHXndyxfoCrEE9SQNIrbM2TqQoldF9jrjuz1ZTxv/Og5974anjpK
	 U7UrjfV5jOm49cRfOs/bUU/y7/fBHzzGqBk9DGpE=
Message-ID: <55dda4c0-10c8-46d2-be90-4f6a5f609313@arm.com>
Date: Wed, 8 Jul 2026 23:31:39 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] pinctrl: sunxi: convert to GPIO_GENERIC
To: wens@kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Bartosz Golaszewski <brgl@kernel.org>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260313000652.11470-1-andre.przywara@arm.com>
 <CAGb2v66_S44PVae0D5a5Q8DSEAWuP-LxD6gtEpgrd=vVMvZedQ@mail.gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <CAGb2v66_S44PVae0D5a5Q8DSEAWuP-LxD6gtEpgrd=vVMvZedQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,sholland.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-39684-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andre.przywara@arm.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:wens@kernel.org,m:linusw@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.przywara@arm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:from_mime,arm.com:email,arm.com:mid,arm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E0C272A93E

Hi Chen-Yu,

many thanks for the thorough review, finally found some time to reply:

On 3/14/26 10:59, Chen-Yu Tsai wrote:
> On Fri, Mar 13, 2026 at 8:08 AM Andre Przywara <andre.przywara@arm.com> wrote:
>>
>> Allwinner SoCs combine pinmuxing and GPIO control in one device/MMIO
>> register frame. So far we were instantiating one GPIO chip per pinctrl
>> device, which covers multiple banks of up to 32 GPIO pins per bank. The
>> GPIO numbers were set to match the absolute pin numbers, even across the
>> typically two instances of the pinctrl device.
>>
>> Convert the GPIO part of the sunxi pinctrl over to use the gpio_generic
>> framework. This alone allows to remove some sunxi specific code, which
>> is replaced with the existing generic code. This will become even more
>> useful with the upcoming A733 support, which adds set and clear
>> registers for the output.
>> As a side effect this also changes the GPIO device and number
>> allocation: Each bank is now represented by its own gpio_chip, with only
>> as many pins as there are actually implemented. The numbering is left up
>> to the kernel (.base = -1).
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> ---
>>   drivers/pinctrl/sunxi/Kconfig         |   1 +
>>   drivers/pinctrl/sunxi/pinctrl-sunxi.c | 245 ++++++++++++--------------
>>   drivers/pinctrl/sunxi/pinctrl-sunxi.h |  11 +-
>>   3 files changed, 124 insertions(+), 133 deletions(-)
>>
>> diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kconfig
>> index dc62eba96348e..5905810dbf398 100644
>> --- a/drivers/pinctrl/sunxi/Kconfig
>> +++ b/drivers/pinctrl/sunxi/Kconfig
>> @@ -4,6 +4,7 @@ if ARCH_SUNXI
>>   config PINCTRL_SUNXI
>>          bool
>>          select PINMUX
>> +       select GPIO_GENERIC
>>          select GENERIC_PINCONF
>>          select GPIOLIB
>>
>> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
>> index 48434292a39b5..4235f9feff00d 100644
>> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
>> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> 
> [...]
> 
>>   static int sunxi_pinctrl_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
>>   {
>>          struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);
>>          struct sunxi_desc_function *desc;
>> -       unsigned pinnum = pctl->desc->pin_base + offset;
>> -       unsigned irqnum;
>> +       unsigned int pinnum, irqnum, i;
>>
>>          if (offset >= chip->ngpio)
>>                  return -ENXIO;
>>
>> +       for (i = 0; i < SUNXI_PINCTRL_MAX_BANKS; i++)
>> +               if (pctl->banks[i].chip.gc.base == chip->base)
> 
> Can't you simply compare the instance?
> 
>      if (&pctl->bankd[i].chip.gc == chip)

Yes, I could, by I think comparing pointers is somewhat frowned upon, 
and since base is considered a unique identifiers within all GPIO chips, 
I found it cleaner to compare the base.
Is comparing pointers commonly accepts in the kernel? Theoretically 
there could be multiple VAs pointing to the same object.

> 
>> +                       break;
>> +       if (i == SUNXI_PINCTRL_MAX_BANKS)
>> +               return -EINVAL;
>> +       pinnum = pctl->desc->pin_base + i * PINS_PER_BANK + offset;
>> +
>>          desc = sunxi_pinctrl_desc_find_function_by_pin(pctl, pinnum, "irq");
>>          if (!desc)
>>                  return -EINVAL;
>> @@ -1039,18 +952,19 @@ static int sunxi_pinctrl_irq_request_resources(struct irq_data *d)
>>   {
>>          struct sunxi_pinctrl *pctl = irq_data_get_irq_chip_data(d);
>>          struct sunxi_desc_function *func;
>> -       int ret;
>> +       int pinnum = pctl->irq_array[d->hwirq], ret;
>> +       int bank = (pinnum - pctl->desc->pin_base) / PINS_PER_BANK;
>>
>> -       func = sunxi_pinctrl_desc_find_function_by_pin(pctl,
>> -                                       pctl->irq_array[d->hwirq], "irq");
>> +       func = sunxi_pinctrl_desc_find_function_by_pin(pctl, pinnum, "irq");
>>          if (!func)
>>                  return -EINVAL;
>>
>> -       ret = gpiochip_lock_as_irq(pctl->chip,
>> -                       pctl->irq_array[d->hwirq] - pctl->desc->pin_base);
>> +       ret = gpiochip_lock_as_irq(&pctl->banks[bank].chip.gc,
>> +                                  d->hwirq % IRQ_PER_BANK);
>>          if (ret) {
>>                  dev_err(pctl->dev, "unable to lock HW IRQ %lu for IRQ\n",
>>                          irqd_to_hwirq(d));
>> +
>>                  return ret;
>>          }
>>
>> @@ -1063,9 +977,10 @@ static int sunxi_pinctrl_irq_request_resources(struct irq_data *d)
>>   static void sunxi_pinctrl_irq_release_resources(struct irq_data *d)
>>   {
>>          struct sunxi_pinctrl *pctl = irq_data_get_irq_chip_data(d);
>> +       int pinnum = pctl->irq_array[d->hwirq] - pctl->desc->pin_base;
>> +       struct gpio_chip *gc = &pctl->banks[pinnum / PINS_PER_BANK].chip.gc;
>>
>> -       gpiochip_unlock_as_irq(pctl->chip,
>> -                             pctl->irq_array[d->hwirq] - pctl->desc->pin_base);
>> +       gpiochip_unlock_as_irq(gc, pinnum);
>>   }
>>
>>   static int sunxi_pinctrl_irq_set_type(struct irq_data *d, unsigned int type)
>> @@ -1493,6 +1408,84 @@ static int sunxi_pinctrl_setup_debounce(struct sunxi_pinctrl *pctl,
>>          return 0;
>>   }
>>
>> +static bool sunxi_of_node_instance_match(struct gpio_chip *chip, unsigned int i)
>> +{
>> +       struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);
>> +
>> +       if (i >= SUNXI_PINCTRL_MAX_BANKS)
>> +               return false;
>> +
>> +       return (chip->base == pctl->banks[i].chip.gc.base);
> 
> Same here.
> 
>> +}
>> +
>> +static int sunxi_num_pins_of_bank(struct sunxi_pinctrl *pctl, int bank)
> 
> IMHO num_pins_in_bank would be better.

Ah yes, I agree.

> 
> And I think having a comment above saying this returns the *actual* number
> of valid pins would help.

That looks indeed useful, added that.

> Or just call it sunxi_num_valid_pins_in_bank?

Mmh, maybe not, see below ...

> 
>> +{
>> +       int max = -1, i;
>> +
>> +       for (i = 0; i < pctl->desc->npins; i++) {
>> +               int pinnum = pctl->desc->pins[i].pin.number - pctl->desc->pin_base;
>> +
>> +               if (pinnum / PINS_PER_BANK < bank)
>> +                       continue;
>> +               if (pinnum / PINS_PER_BANK > bank)
>> +                       break;
>> +               if (pinnum % PINS_PER_BANK > max)
>> +                       max = pinnum % PINS_PER_BANK;
> 
> This doesn't work for existing sun5i platforms, which have pins non-existent
> on some variants, so we end up with holes in each bank.
> 
> Instead we have to actually calculate the number of valid pins.

Well, I think the function name promises too much, what we really need 
is "the maximum pin index used + 1", to allocate an array holding pins, 
indexed by their number. IIUC the GPIO code doesn't really support holes 
in each gpiochip. And it doesn't really need to, we just have 
potentially a few smaller gaps, compared to the bigger number of larger 
gaps we have today. They wouldn't be referenced at all, so I don't think 
it's a problem.
I can rename the function to include "max" somewhere.

> 
>> +       }
>> +
>> +       return max + 1;
>> +}
>> +
>> +static int sunxi_gpio_add_bank(struct sunxi_pinctrl *pctl, int index)
>> +{
>> +       char bank_name = 'A' + index + pctl->desc->pin_base / PINS_PER_BANK;
>> +       struct sunxi_gpio_bank *bank = &pctl->banks[index];
>> +       struct gpio_generic_chip_config config;
>> +       struct gpio_chip *gc = &bank->chip.gc;
>> +       int ngpio, ret;
>> +
>> +       ngpio = sunxi_num_pins_of_bank(pctl, index);
>> +       bank->pctl = pctl;
>> +       bank->base = pctl->membase + index * pctl->bank_mem_size;
>> +       if (!ngpio) {
>> +               gc->owner = THIS_MODULE;
>> +               gc->ngpio = 0;
>> +               gc->base = -1;
>> +               gc->of_gpio_n_cells = 3;
>> +
>> +               return 0;
>> +       }
>> +
>> +       config = (struct gpio_generic_chip_config) {
>> +               .dev = pctl->dev,
>> +               .sz = 4,
>> +               .dat = bank->base + DATA_REGS_OFFSET,
>> +               .set = bank->base + DATA_REGS_OFFSET,
>> +               .clr = NULL,
>> +               .flags = GPIO_GENERIC_READ_OUTPUT_REG_SET |
>> +                        GPIO_GENERIC_PINCTRL_BACKEND,
>> +       };
>> +
>> +       ret = gpio_generic_chip_init(&bank->chip, &config);
>> +       if (ret)
>> +               return dev_err_probe(pctl->dev, ret,
>> +                                    "failed to init generic gpio chip\n");
> 
> Generic GPIO assumes that the GPIO pin range starts from 0, and is contiguous.
> This breaks down with the sun5i and sun6i families. For example, on the A31s,
> there is no PC16 ~ PC23, nor PH0 ~ PH8, just to show a few.

But is this really a problem? We have much larger gaps today already, in 
the existing driver. At the end of the day those pins just wouldn't be 
referenced. Or am I missing something?

>> +       gc->owner               = THIS_MODULE;
>> +       gc->label               = devm_kasprintf(pctl->dev, GFP_KERNEL,
>> +                                                "%s-P%c", gc->label,
>> +                                                bank_name);
>> +       gc->ngpio               = ngpio;
> 
> Also set gc->offset?

Yes, I figured this myself when playing around with the gpio-line-names 
property. Fixed.

> 
>> +       gc->base                = -1;
>> +       gc->of_gpio_n_cells     = 3;
>> +       gc->of_node_instance_match = sunxi_of_node_instance_match;
>> +       gc->set_config          = gpiochip_generic_config;
>> +       gc->to_irq              = sunxi_pinctrl_gpio_to_irq;
>> +       gc->can_sleep           = false;
>> +
>> +       return gpiochip_add_data(gc, pctl);
> 
> Can we switch to devm_gpiochip_add_data() instead? It simplifies the
> teardown as well.

Sure, didn't know this existed.

> 
>> +}
>> +
>>   int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
>>                                    const struct sunxi_pinctrl_desc *desc,
>>                                    unsigned long flags)
>> @@ -1503,6 +1496,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
>>          struct sunxi_pinctrl *pctl;
>>          struct pinmux_ops *pmxops;
>>          int i, ret, last_pin, pin_idx;
>> +       int gpio_banks;
>>          struct clk *clk;
>>
>>          pctl = devm_kzalloc(&pdev->dev, sizeof(*pctl), GFP_KERNEL);
>> @@ -1590,38 +1584,23 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
>>                  return PTR_ERR(pctl->pctl_dev);
>>          }
>>
>> -       pctl->chip = devm_kzalloc(&pdev->dev, sizeof(*pctl->chip), GFP_KERNEL);
>> -       if (!pctl->chip)
>> -               return -ENOMEM;
>> -
>> -       last_pin = pctl->desc->pins[pctl->desc->npins - 1].pin.number;
>> -       pctl->chip->owner = THIS_MODULE;
>> -       pctl->chip->request = gpiochip_generic_request;
>> -       pctl->chip->free = gpiochip_generic_free;
>> -       pctl->chip->set_config = gpiochip_generic_config;
>> -       pctl->chip->direction_input = sunxi_pinctrl_gpio_direction_input;
>> -       pctl->chip->direction_output = sunxi_pinctrl_gpio_direction_output;
>> -       pctl->chip->get = sunxi_pinctrl_gpio_get;
>> -       pctl->chip->set = sunxi_pinctrl_gpio_set;
>> -       pctl->chip->of_xlate = sunxi_pinctrl_gpio_of_xlate;
>> -       pctl->chip->to_irq = sunxi_pinctrl_gpio_to_irq;
>> -       pctl->chip->of_gpio_n_cells = 3;
>> -       pctl->chip->can_sleep = false;
>> -       pctl->chip->ngpio = round_up(last_pin, PINS_PER_BANK) -
>> -                           pctl->desc->pin_base;
>> -       pctl->chip->label = dev_name(&pdev->dev);
>> -       pctl->chip->parent = &pdev->dev;
>> -       pctl->chip->base = pctl->desc->pin_base;
>> -
>> -       ret = gpiochip_add_data(pctl->chip, pctl);
>> -       if (ret)
>> -               return ret;
>> +       last_pin = pctl->desc->pins[pctl->desc->npins - 1].pin.number -
>> +                  pctl->desc->pin_base;
>> +       for (gpio_banks = 0;
> 
> If you switch to devm_gpiochip_add_data() above, you won't need
> gpiochip_remove() below, and you can declare |gpio_banks| inline here in
> the for statement.

Nice, will do this.


>> +            gpio_banks <= last_pin / PINS_PER_BANK;
>> +            gpio_banks++) {
>> +               ret = sunxi_gpio_add_bank(pctl, gpio_banks);
>> +               if (ret)
>> +                       goto gpiochip_error;
>> +       }
>>
>>          for (i = 0; i < pctl->desc->npins; i++) {
>>                  const struct sunxi_desc_pin *pin = pctl->desc->pins + i;
>> +               int bank = (pin->pin.number - pctl->desc->pin_base) / PINS_PER_BANK;
>> +               struct gpio_chip *gc = &pctl->banks[bank].chip.gc;
>>
>> -               ret = gpiochip_add_pin_range(pctl->chip, dev_name(&pdev->dev),
>> -                                            pin->pin.number - pctl->desc->pin_base,
>> +               ret = gpiochip_add_pin_range(gc, dev_name(&pdev->dev),
>> +                                            pin->pin.number % PINS_PER_BANK,
>>                                               pin->pin.number, 1);
>>                  if (ret)
>>                          goto gpiochip_error;
>> @@ -1690,6 +1669,8 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
>>          return 0;
>>
>>   gpiochip_error:
>> -       gpiochip_remove(pctl->chip);
>> +       while (--gpio_banks >= 0)
>> +               gpiochip_remove(&pctl->banks[gpio_banks].chip.gc);
>> +
>>          return ret;
>>   }
>> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
>> index ad26e4de16a85..085131caa02fe 100644
>> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
>> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
>> @@ -14,6 +14,7 @@
>>   #define __PINCTRL_SUNXI_H
>>
>>   #include <linux/kernel.h>
>> +#include <linux/gpio/generic.h>
> 
> gpio comes before kernel?

Indeed.

> And maybe we should try to stop including the massive kernel.h header.

OK, will have a look what should be included instead.

Cheers,
Andre

> 
> 
> Thanks
> ChenYu
> 
>>   #include <linux/spinlock.h>
>>
>>   #define PA_BASE        0
>> @@ -159,9 +160,17 @@ struct sunxi_pinctrl_regulator {
>>          refcount_t              refcount;
>>   };
>>
>> +struct sunxi_pinctrl;
>> +
>> +struct sunxi_gpio_bank {
>> +       struct gpio_generic_chip chip;
>> +       struct sunxi_pinctrl *pctl;
>> +       void __iomem *base;
>> +};
>> +
>>   struct sunxi_pinctrl {
>>          void __iomem                    *membase;
>> -       struct gpio_chip                *chip;
>> +       struct sunxi_gpio_bank          banks[SUNXI_PINCTRL_MAX_BANKS];
>>          const struct sunxi_pinctrl_desc *desc;
>>          struct device                   *dev;
>>          struct sunxi_pinctrl_regulator  regulators[11];
>> --
>> 2.46.4
>>
>>


