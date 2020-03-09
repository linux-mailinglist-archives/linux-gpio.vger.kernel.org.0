Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3871A17E5E6
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2020 18:42:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727279AbgCIRmP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Mar 2020 13:42:15 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53671 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727270AbgCIRmP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Mar 2020 13:42:15 -0400
Received: by mail-wm1-f68.google.com with SMTP id g134so446755wme.3;
        Mon, 09 Mar 2020 10:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=O5XzlRhJXpNd17/Q76toYeUyU8DPAcT326EwGlOZF0s=;
        b=Lj7DWSw+kOYjv01pETYilz6LW14y0nMDyeJQC8epwaQzKflWIeQw/Cbmh0qhmorkGz
         eigKpe1tp2Ooo4Rao6mdypvT05TriZ0WZLJQmTwEGXIIdU+w+p+OrNnBnYl8tyoEjE8B
         bLLDGjqhHa1WQL97KMBlUuAPEF5I3XrlyZJckaJHsGZGnYdDIiKRePNPpYoZsa8suUfJ
         b9cMxxXPl7PrZVfDQGm5Akd7jqyz1sd+2zMpzIpzdhlyzVtRZ21MMzu2O1vrHSZLldYd
         wWB90AtkNSdIIhK9c657+WT0sUlzWEdZ/nJpkEKK/UAO9WLNb1fdujX8sGw2kOC6QgFe
         JpnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=O5XzlRhJXpNd17/Q76toYeUyU8DPAcT326EwGlOZF0s=;
        b=r6ywhngrc9ZfdXNfK+rK2w0RAWGi3BQwtQkcgTEaEyH6wlHsgRBWgraXTRxvyOoz+x
         pm/nGu8Sl+paQA+MWmL1TsWOxcifoypfhEPVp/0rlay+NlHcC8mOSYbK9P5wTg3MAoXY
         jwXlbxaGdifj/q8sk3XlpxNgVhS8DdLC6BUtni3UKNZGJ3WIAr0eYOHoP3cKkvb8zvjp
         9Fk7epvLSG7FVyt/mV7f2htVAPUYgW9DMHP6q/JmguYLyQ2ACakuS2JtdyBis+ykIm6V
         YruFnOiSrvRqBwGRouOphk7TuX19uZg6/Hefd6cKS8Us2caVSLz0brwj0ffh8snWHwL7
         mGQQ==
X-Gm-Message-State: ANhLgQ17CM3Gu4X680w76tMAp6HjlbSxGSAcfYiX3vH2OOG7Np9rVjXJ
        agOvc/IY8Z2VmLpBKePtuC300iL7
X-Google-Smtp-Source: ADFU+vsgfcaDnGCgWzq7miqzip7oobaJk0VZBJ3UrJVPQc39Yk5G4P9OVGUsu05EbLby4faR/vJsQw==
X-Received: by 2002:a1c:25c1:: with SMTP id l184mr367337wml.122.1583775732276;
        Mon, 09 Mar 2020 10:42:12 -0700 (PDT)
Received: from [10.67.49.112] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id c8sm1517272wrt.33.2020.03.09.10.42.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2020 10:42:11 -0700 (PDT)
Subject: Re: [PATCH] gpio: brcmstb: support gpio-line-names property
To:     Gregory Fong <gregory.0xf0@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <1583539986-573-1-git-send-email-opendmb@gmail.com>
 <CADtm3G4eq_p1YZtQrtcx4LGPiY82BpgXf55YtJCW+WJSrM7siw@mail.gmail.com>
From:   Doug Berger <opendmb@gmail.com>
Autocrypt: addr=opendmb@gmail.com; prefer-encrypt=mutual; keydata=
 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
 rQQYjNSD8+NSdOsIpGNCZ9xhWw==
Message-ID: <810d8c3d-482f-078c-70b5-c4123c2679b8@gmail.com>
Date:   Mon, 9 Mar 2020 10:42:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CADtm3G4eq_p1YZtQrtcx4LGPiY82BpgXf55YtJCW+WJSrM7siw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 3/9/20 12:45 AM, Gregory Fong wrote:
> Hi Doug,
> 
> On Fri, Mar 6, 2020 at 4:14 PM Doug Berger <opendmb@gmail.com> wrote:
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
> 
> I've added a few comments below.  With the suggested updates:
> Acked-by: Gregory Fong <gregory.0xf0@gmail.com>
> 
>> ---
>>  drivers/gpio/gpio-brcmstb.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 44 insertions(+)
>>
>> diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
>> index 05e3f99ae59c..e9ab246e2d42 100644
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
>> +       names = devm_kcalloc(dev, MAX_GPIO_PER_BANK, sizeof(char *),
> 
> Please use sizeof(*names) instead of sizeof(char *).
Good idea. Will do.

> 
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
>> +                                       i, ret);
> 
> Recommend adding the GPIO bank ID to this error message.
I'll use the absolute line number rather than the bank relative line
number to reduce confusion, but since it's different from your
suggestion I'll leave off your Ack in case you really want the bank
number for some reason.

> 
> Best regards,
> Gregory
> 
Thanks Gregory!
V2 coming soon.
