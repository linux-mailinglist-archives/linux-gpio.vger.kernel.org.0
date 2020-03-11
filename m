Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4AA018217A
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2020 20:03:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730972AbgCKTDE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Mar 2020 15:03:04 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52927 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730979AbgCKTDE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Mar 2020 15:03:04 -0400
Received: by mail-wm1-f67.google.com with SMTP id 11so3308124wmo.2;
        Wed, 11 Mar 2020 12:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kMk8XoGQR0xpzuD33tIqb6u2vZiLCLdnSBR1yPeTFRU=;
        b=svh6HxiorQ6lESmobtjOHPpu5c3KwR4hvmG+FAn9vTRmu4cVMygiYnAP55pzPCQKkE
         ddQnbXek4NwjKIvF7j9nxsmnOkIj7Pb5aByRmLIBxRFDDC7729ApgTdIx8reyYMflfQp
         RQCyHJDMyrKcV61Nv3rrmMh2WbRW85FXro1JToA5MmBaE+EXGzuEDoegRy47NepFlQY9
         duaW6rM/F9wp+ZOFpR0735wMutWnClfQ8IGlYwcZQApmjYCdKZxeuWlOuxAGhQdOw/mM
         c0hlK78ibRJ3OmevJ/8zV6Sw/SxS40P2u81K+COLYI6F9MyXf3ntpGTGZAFNqodRY0on
         M7KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=kMk8XoGQR0xpzuD33tIqb6u2vZiLCLdnSBR1yPeTFRU=;
        b=XDoMGLBUYISQlE3NBM9Ch4qjwf0KSt6KdRPyjs1XLLjgY+eEQidQkupuXH0LNzKGWx
         A1igiC5OZic3F+flxkM4e6uI9EessJXBarwlb3BWZa0XuyGEGqvlH9rMpRXgW/eMzHyP
         cuP5RBerlt7ClxogfUQRs2jVOchaKOuelSU5kuqOhlcCBXZA4V7Gzj4eTCq//eq291oV
         AJce9svmZ8KnhO2eWRQBQQc3zYuDY5r57ysLYHWyOfRfc9zyR3281NAmMT0P8AC15U/t
         2EUhJeE3XLj0laxvYrNwRGpaloNzx9gTkjDIrx1PLUkwu7oYKG68TZAAoQtuc7WsFeci
         j3WQ==
X-Gm-Message-State: ANhLgQ3Y3juafTDjIyT+DZv9IvZwrPvWA/e91DbUgKvcazBxKpCH8jPH
        lFCyuQXeOLQw6NgOiwbaitkOSDpL
X-Google-Smtp-Source: ADFU+vuqWG859dAoRXEKTellTNSb3AXRx7u3fdKqKW0Kd2ZrtW4OfhFrTLg1wU4mdeB+u95yTTigyA==
X-Received: by 2002:a7b:ca47:: with SMTP id m7mr216507wml.4.1583953378725;
        Wed, 11 Mar 2020 12:02:58 -0700 (PDT)
Received: from [10.67.49.112] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id f3sm9292698wml.24.2020.03.11.12.02.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2020 12:02:56 -0700 (PDT)
Subject: Re: [PATCH V2] gpio: brcmstb: support gpio-line-names property
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Gregory Fong <gregory.0xf0@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-gpio <linux-gpio@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <1583780521-45702-1-git-send-email-opendmb@gmail.com>
 <CAMpxmJXNQQTxRWZSP0RZTUuefAk3+AeDMVeVkgERy7f9X=CBsA@mail.gmail.com>
From:   Doug Berger <opendmb@gmail.com>
Autocrypt: addr=opendmb@gmail.com; prefer-encrypt=mutual; keydata=
 xsBNBFWUMnYBCADCqDWlxLrPaGxwJpK/JHR+3Lar1S3M3K98bCw5GjIKFmnrdW4pXlm1Hdk5
 vspF6aQKcjmgLt3oNtaJ8xTR/q9URQ1DrKX/7CgTwPe2dQdI7gNSAE2bbxo7/2umYBm/B7h2
 b0PMWgI0vGybu6UY1e8iGOBWs3haZK2M0eg2rPkdm2d6jkhYjD4w2tsbT08IBX/rA40uoo2B
 DHijLtRSYuNTY0pwfOrJ7BYeM0U82CRGBpqHFrj/o1ZFMPxLXkUT5V1GyDiY7I3vAuzo/prY
 m4sfbV6SHxJlreotbFufaWcYmRhY2e/bhIqsGjeHnALpNf1AE2r/KEhx390l2c+PrkrNABEB
 AAHNJkRvdWcgQmVyZ2VyIDxkb3VnLmJlcmdlckBicm9hZGNvbS5jb20+wsEHBBABAgCxBQJa
 sDPxFwoAAb9Iy/59LfFRBZrQ2vI+6hEaOwDdIBQAAAAAABYAAWtleS11c2FnZS1tYXNrQHBn
 cC5jb22OMBSAAAAAACAAB3ByZWZlcnJlZC1lbWFpbC1lbmNvZGluZ0BwZ3AuY29tcGdwbWlt
 ZQgLCQgHAwIBCgIZAQUXgAAAABkYbGRhcDovL2tleXMuYnJvYWRjb20uY29tBRsDAAAAAxYC
 AQUeAQAAAAQVCAkKAAoJEEv0cxXPMIiXDXMH/Aj4wrSvJTwDDz/pb4GQaiQrI1LSVG7vE+Yy
 IbLer+wB55nLQhLQbYVuCgH2XmccMxNm8jmDO4EJi60ji6x5GgBzHtHGsbM14l1mN52ONCjy
 2QiADohikzPjbygTBvtE7y1YK/WgGyau4CSCWUqybE/vFvEf3yNATBh+P7fhQUqKvMZsqVhO
 x3YIHs7rz8t4mo2Ttm8dxzGsVaJdo/Z7e9prNHKkRhArH5fi8GMp8OO5XCWGYrEPkZcwC4DC
 dBY5J8zRpGZjLlBa0WSv7wKKBjNvOzkbKeincsypBF6SqYVLxFoegaBrLqxzIHPsG7YurZxE
 i7UH1vG/1zEt8UPgggTOwE0EVZQydwEIAM90iYKjEH8SniKcOWDCUC2jF5CopHPhwVGgTWhS
 vvJsm8ZK7HOdq/OmA6BcwpVZiLU4jQh9d7y9JR1eSehX0dadDHld3+ERRH1/rzH+0XCK4JgP
 FGzw54oUVmoA9zma9DfPLB/Erp//6LzmmUipKKJC1896gN6ygVO9VHgqEXZJWcuGEEqTixm7
 kgaCb+HkitO7uy1XZarzL3l63qvy6s5rNqzJsoXE/vG/LWK5xqxU/FxSPZqFeWbX5kQN5XeJ
 F+I13twBRA84G+3HqOwlZ7yhYpBoQD+QFjj4LdUS9pBpedJ2iv4t7fmw2AGXVK7BRPs92gyE
 eINAQp3QTMenqvcAEQEAAcLCoAQYAQIBKwUCVZQyeAUbDAAAAMBdIAQZAQgABgUCVZQydwAK
 CRCmyye0zhoEDXXVCACjD34z8fRasq398eCHzh1RCRI8vRW1hKY+Ur8ET7gDswto369A3PYS
 38hK4Na3PQJ0kjB12p7EVA1rpYz/lpBCDMp6E2PyJ7ZyTgkYGHJvHfrj06pSPVP5EGDLIVOV
 F5RGUdA/rS1crcTmQ5r1RYye4wQu6z4pc4+IUNNF5K38iepMT/Z+F+oDTJiysWVrhpC2dila
 6VvTKipK1k75dvVkyT2u5ijGIqrKs2iwUJqr8RPUUYpZlqKLP+kiR+p+YI16zqb1OfBf5I6H
 F20s6kKSk145XoDAV9+h05X0NuG0W2q/eBcta+TChiV3i8/44C8vn4YBJxbpj2IxyJmGyq2J
 ASkJEEv0cxXPMIiXwF0gBBkBCAAGBQJVlDJ3AAoJEKbLJ7TOGgQNddUIAKMPfjPx9Fqyrf3x
 4IfOHVEJEjy9FbWEpj5SvwRPuAOzC2jfr0Dc9hLfyErg1rc9AnSSMHXansRUDWuljP+WkEIM
 ynoTY/IntnJOCRgYcm8d+uPTqlI9U/kQYMshU5UXlEZR0D+tLVytxOZDmvVFjJ7jBC7rPilz
 j4hQ00XkrfyJ6kxP9n4X6gNMmLKxZWuGkLZ2KVrpW9MqKkrWTvl29WTJPa7mKMYiqsqzaLBQ
 mqvxE9RRilmWoos/6SJH6n5gjXrOpvU58F/kjocXbSzqQpKTXjlegMBX36HTlfQ24bRbar94
 Fy1r5MKGJXeLz/jgLy+fhgEnFumPYjHImYbKrYlN5gf8CIoI48e2+5V9b6YlvMeOCGMajcvU
 rHJGgdF+SpHoc95bQLV+cMLFO5/4UdPxP8NFnJWoeoD/6MxKa6Z5SjqUS8k3hk81mc3dFQh3
 yWj74xNe+1SCn/7UYGsnPQP9rveri8eubraoRZMgLe1XdzyjG8TsWqemAa7/kcMbu3VdHe7N
 /jdoA2BGF7+/ZujdO89UCrorkH0TOgmicZzaZwN94GYmm69lsbiWWEBvBOLbLIEWAzS0xG//
 PxsxZ8Cr0utzY4gvbg+7lrBd9WwZ1HU96vBSAeUKAV5YMxvFlZCTS2O3w0Y/lxNR57iFPTPx
 rQQYjNSD8+NSdOsIpGNCZ9xhWw==
Message-ID: <7fcc5cb2-5fdb-d1cf-e55b-c0f2d407e072@gmail.com>
Date:   Wed, 11 Mar 2020 12:02:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAMpxmJXNQQTxRWZSP0RZTUuefAk3+AeDMVeVkgERy7f9X=CBsA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 3/11/20 5:44 AM, Bartosz Golaszewski wrote:
> pon., 9 mar 2020 o 20:02 Doug Berger <opendmb@gmail.com> napisał(a):
>>
>> The default handling of the gpio-line-names property by the
>> gpiolib-of implementation does not work with the multiple
>> gpiochip banks per device structure used by the gpio-brcmstb
>> driver.
>>
>> This commit adds driver level support for the device tree
>> property so that GPIO lines can be assigned friendly names.
>>
>> Signed-off-by: Doug Berger <opendmb@gmail.com>
>> ---
>>  drivers/gpio/gpio-brcmstb.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 44 insertions(+)
>>
>> diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
>> index 05e3f99ae59c..fcfc1a1f1a5c 100644
>> --- a/drivers/gpio/gpio-brcmstb.c
>> +++ b/drivers/gpio/gpio-brcmstb.c
>> @@ -603,6 +603,49 @@ static const struct dev_pm_ops brcmstb_gpio_pm_ops = {
>>         .resume_noirq = brcmstb_gpio_resume,
>>  };
>>
>> +static void brcmstb_gpio_set_names(struct device *dev,
>> +                                  struct brcmstb_gpio_bank *bank)
>> +{
>> +       struct device_node *np = dev->of_node;
>> +       const char **names;
>> +       int nstrings, base;
>> +       unsigned int i;
>> +
>> +       base = bank->id * MAX_GPIO_PER_BANK;
>> +
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
> 
> This bit is confusing to me. If we can't read the property we break
> the loop and leave the remaining line names null but at the same time
> it isn't considered a probe failure? Would you mind at least
> commenting on this in the code?
> 
> Bart
> 
The label names are viewed as a convenience for the user and are not
necessary for the proper functionality of the driver and device, so we
don't want to prevent the driver from succeeding at probe due to an
error in the gpio-line-names property. The bank->gc.names member is
still made non-NULL which is what we really care about to prevent the
misapplication of label names by devprop_gpiochip_set_names().

In fact, it is expected that the device-tree will only include label
strings up to the last GPIO of interest so the ENODATA error is
considered a valid result to terminate any further labeling so there is
no need for an error message in that case.

Other error results are unexpected so an error message indicating the
consequence of the error is appropriate here.

I'm not sure which aspect is confusing to you, so it's not clear to me
how best to comment the code. I can hazard a guess, but if you have a
suggestion I'm happy to submit a v3.

Thanks for taking the time to review this,
    Doug
