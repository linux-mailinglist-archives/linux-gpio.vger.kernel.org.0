Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBB3C1820F4
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2020 19:38:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730838AbgCKSiI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Mar 2020 14:38:08 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42427 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730734AbgCKSiH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Mar 2020 14:38:07 -0400
Received: by mail-wr1-f67.google.com with SMTP id v11so3965808wrm.9;
        Wed, 11 Mar 2020 11:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=i3ki1XFvn7TEp/5S0kbEyql6MIJlqruhqzKBemgHTXI=;
        b=hU6s6cMWtfJinGOlywjEnRZPgbi3fgg/h5p15Sw/ZRdT8ciQdCPu4/TRqj2/0/cKAO
         tapz0Qb41Ge7EiBZoZRVMcqjRb+R0qFew5S91XbSwzW8ICb5Cn6AOZ5NV73U5uwMPNqv
         qsVK+VQ+YM6P6Dx71Yk9tgwwLPZCYbrr7O61NoSoWGwrnNYK9sO2SC1IOIT+b6hd1Bz8
         SqylbB5wkXHgAyNbZjzRuXxvTgpC5fC8eEeFypY+KfpoktDcbhsq04TdKchOo5RqTJo7
         t7x3qqGd+/vq+nqOpqtCCo1p9LhrYUH5BBHrJ1q2R1H49WCFOLuCessJ2DdyjuiafVwT
         yJWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=i3ki1XFvn7TEp/5S0kbEyql6MIJlqruhqzKBemgHTXI=;
        b=OVX49LpF2AYEEtM/CUJrLWKZA31GXfqqu7mwv4453PD4vHO92jm8UMBAxe/bk43BbP
         mLJJdiv/A/lLlY1emFmI9gU6IzfuyNsihQ2pNYrq+7VHgo0Mp/EdtkVauQrWYHqG5G3e
         1MWS5aq8IDw7S77oOTUpb5drieCoGk+7noKcjcpM/Kh5LQPFuLYLOrPQuxNPjM4A6Wnv
         Qm7SSoiuIKWfLYuUAnimPbew+X0nyv6Ed8AzFe8me/9hTxT0+mP4FN8AMYBUkyJmvMgS
         g+GhajFNcdH3iqwj96OIr/c580UqkOXHG/O/73urHXUArN79CXRvwuAlk2iz8wBh+rXp
         X2Xg==
X-Gm-Message-State: ANhLgQ28U9y55R7oakueSW0l93FQsX1e3fGQLE+m7Gb3x9IgLWkUBk/r
        n+5dQIEYOXQL3VQqMh2BddFGPeD4
X-Google-Smtp-Source: ADFU+vscy1B3ZoGebvGm7rLx0dU9YDFxvjnzwYRa/owwer+niXOu6ljuIWQwfP4jmGZUxvVmu2qNrg==
X-Received: by 2002:a5d:608e:: with SMTP id w14mr6150991wrt.201.1583951883840;
        Wed, 11 Mar 2020 11:38:03 -0700 (PDT)
Received: from [10.67.49.112] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id u204sm6644688wmg.40.2020.03.11.11.38.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2020 11:38:03 -0700 (PDT)
Subject: Re: [PATCH V2] gpio: brcmstb: support gpio-line-names property
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Gregory Fong <gregory.0xf0@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <1583780521-45702-1-git-send-email-opendmb@gmail.com>
 <CACRpkdZ1p3_U_yth-rCEKdPsuFNFnxsE3kTeP7krf-xHuSGkFw@mail.gmail.com>
From:   Doug Berger <opendmb@gmail.com>
Autocrypt: addr=opendmb@gmail.com; prefer-encrypt=mutual; keydata=
 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
 rQQYjNSD8+NSdOsIpGNCZ9xhWw==
Message-ID: <fea85d07-85de-b886-da8d-bfa23ee61b85@gmail.com>
Date:   Wed, 11 Mar 2020 11:38:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CACRpkdZ1p3_U_yth-rCEKdPsuFNFnxsE3kTeP7krf-xHuSGkFw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thanks for taking the time to review this.

On 3/11/20 8:32 AM, Linus Walleij wrote:
> On Mon, Mar 9, 2020 at 8:02 PM Doug Berger <opendmb@gmail.com> wrote:
> 
>> The default handling of the gpio-line-names property by the
>> gpiolib-of implementation does not work with the multiple
>> gpiochip banks per device structure used by the gpio-brcmstb
>> driver.
To expand on this description, the crux of the issue is that the
gpio-brcmstb hardware has some nicely banked registers and some
not-so-nicely-banked common registers.

This lead to the decision to implement the driver to manage multiple
banks as a single GPIO device with a single device-tree node rather than
separate devices for each bank each with its own device-tree node.

In addition, most implementations include a hardware block within an
"Always On" power island and a second block that can be powered down.
Each of these blocks is represented as a separate device with their own
device-tree node and are managed by this driver.

The gpio_chip abstraction in the gpiolib provides a lot of useful
functionality for managing the banks of GPIO for the gpio-brcmstb
driver, but unfortunately it breaks down in a couple of places because
of the common device tree node that is shared by each bank.

One area is the IRQ chip helpers which were tried but needed to be reverted.

Another is labeling, which this commit attempts to address. The
device-tree node for each device can optionally contain a single
gpio-line-names property with a list of names to be applied to the GPIO
managed by the driver.

>>
>> This commit adds driver level support for the device tree
>> property so that GPIO lines can be assigned friendly names.
>>
> 
> 
>> Signed-off-by: Doug Berger <opendmb@gmail.com>
>> +static void brcmstb_gpio_set_names(struct device *dev,
>> +                                  struct brcmstb_gpio_bank *bank)
>> +{
>> +       struct device_node *np = dev->of_node;
>> +       const char **names;
>> +       int nstrings, base;
> 
> I don't understand why that thing is named "base".Since this function is applied to each bank, it is necessary to know
what the device relative index is for the first GPIO contained within
this bank. That is the purpose of this base variable. It is used to
index the device relative list of gpio labels.

GPIO0 of bank 0 would have a base of 0. GPIO0 of bank 1 would have a
base of MAX_GPIO_PER_BANK, and so on.

>> +       unsigned int i;
>> +
>> +       base = bank->id * MAX_GPIO_PER_BANK;
> 
> That would be ngpios or something.
> 
> But you alread have what you need in bank->gc.ngpio, right?
> 
> So why calculate it?
Almost. ngpios is the number of gpios in the bank which in this case is
always MAX_GPIO_PER_BANK.

bank->gc.base is almost the right value, but it is relative to the GPIO
subsystem which can include multiple devices rather than the specific
device that contains this bank.

bank->id is device relative so bank->id * MAX_GPIO_PER_BANK gives us the
desired device relative offset.

>> +       nstrings = of_property_count_strings(np, "gpio-line-names");
>> +       if (nstrings <= base)
>> +               /* Line names not present */
>> +               return;
>> +
>> +       names = devm_kcalloc(dev, MAX_GPIO_PER_BANK, sizeof(*names),
>> +                            GFP_KERNEL);
>> +       if (!names)
>> +               return;
>> +
>> +       /*
>> +        * Make sure to not index beyond the end of the number of descriptors
>> +        * of the GPIO device.
>> +        */
>> +       for (i = 0; i < bank->width; i++) {
>> +               const char *name;
>> +               int ret;
>> +
>> +               ret = of_property_read_string_index(np, "gpio-line-names",
>> +                                                   base + i, &name);
>> +               if (ret) {
>> +                       if (ret != -ENODATA)
>> +                               dev_err(dev, "unable to name line %d: %d\n",
>> +                                       base + i, ret);
>> +                       break;
>> +               }
>> +               if (*name)
>> +                       names[i] = name;
>> +       }
>> +
>> +       bank->gc.names = names;
>> +}
> 
> Why can't you just make the function
> devprop_gpiochip_set_names() public, (line in <linux/gpio/driver.h>)
> and convert your np to a fwnode and call that &bank->gc ?
This is basically the current functionality as provided by the call to
gpiochip_add_data() in probe that this commit attempts to correct.

Since the fwnode is the same for all banks of the same device each bank
repeats the first MAX_GPIO_PER_BANK label names in each bank.

This commit populates the gc.names member of each bank from the
device-tree node within the driver. This overrides the default behavior
since devprop_gpiochip_set_names() will only be called if names is NULL.

> 
> Yours,
> Linus Walleij
> 

I hope that explanation makes sense.

Thanks again,
    Doug
