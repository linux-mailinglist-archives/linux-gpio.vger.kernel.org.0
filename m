Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCE2C485A09
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jan 2022 21:31:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244038AbiAEUbn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Jan 2022 15:31:43 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:55570
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244044AbiAEUbk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Jan 2022 15:31:40 -0500
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 909F24075B
        for <linux-gpio@vger.kernel.org>; Wed,  5 Jan 2022 20:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641414698;
        bh=V4kULDmcSO9fvI4MXJMndJlczlOJyUZ0Dz0uloeZzoM=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=u9tvnpV1cyQG9gtZEV+OOJ8Grsggg+mX8ZXGy2EB+/q51HtZ9rnk1+NZDvU6fVJm9
         bzcOJanVviCXhahVlQZ1hSIoxXAFe8tuN9bIlPhLjHGCEEYAXNiL6exxb2OBIutJRc
         WfLIRwdig8FrdOI6YuJRBnWMKgPbE/2Q2MsJUxV4HgtVJVRkOhZEyarqun8FIIgYvp
         w2MO0RMY3iVujWz6/Cx9iHZu3aLxobtDKa4MA0PYhHBHHT3Gdc0rUOTDZ/pl2UX/o2
         gs567RlW0c2ofvPYfdgm8tr7ElNrrRIhjocIFXfmh87rY53Q5Y4n29fEJNtuFVFtOw
         ALKHGUwOI6mdQ==
Received: by mail-wm1-f71.google.com with SMTP id p18-20020a05600c1d9200b00346da4a9e26so957854wms.1
        for <linux-gpio@vger.kernel.org>; Wed, 05 Jan 2022 12:31:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=V4kULDmcSO9fvI4MXJMndJlczlOJyUZ0Dz0uloeZzoM=;
        b=LGgKDhzXnYCOOiuJ692VFwK2ZE8PfmNNT2axzGQAXqEEqGBw7+7mkrByioLWzaGYQO
         sgoWFrgzIVASWnEeCIn1vF+G6BgO14w2Wu+IVWTTFfbX67oX20z2e18kdE4PLeU7Ohkm
         I/P8F3DcKVQ5gR0agawxWMOiTmNWI5TIquTe8VN9dlBVdkUuGTcNlAX+B2PjL8ts/e/W
         3NEWwdKfp59LlcpQW/rT9Fi9Faeuu0/zyOvbB+ohm47iSTtIF9ejxKlnqWmpwyayHzmG
         qXCvF1y1aa60Z20mLqiDY2Ihgx4e9ER71Jtv1BslvVraHMN8azAadfTORGKUNxmAg5rv
         4Kbg==
X-Gm-Message-State: AOAM5326UcWMxvkvoXSsl+HZGEBNLA0AS5z8RGeTfG3+Eom/exP/xIQl
        AQNpio+C6IClY4oDDU7eYheaq6DUl3AQmW5kq2MnpgzBs2Wv/DOkqIBBhrpAFsTnfPn7WWjg0W6
        SI0BM0FoKfR8fMjSlgbtg2ZZ9xDYJAdXcsx/mUc8=
X-Received: by 2002:adf:f8cb:: with SMTP id f11mr47726195wrq.700.1641414698088;
        Wed, 05 Jan 2022 12:31:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwfycNJZSN3SIT7Pdqt18EECjlkeSLsfzV4kAhj6FeSMwg1AcBqMTk4rYmgxR4Fp+L98Z2zeA==
X-Received: by 2002:adf:f8cb:: with SMTP id f11mr47726180wrq.700.1641414697952;
        Wed, 05 Jan 2022 12:31:37 -0800 (PST)
Received: from [192.168.1.124] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id f6sm4185158wmq.6.2022.01.05.12.31.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jan 2022 12:31:37 -0800 (PST)
Message-ID: <9c4d825a-1f35-3e47-b91c-499525213343@canonical.com>
Date:   Wed, 5 Jan 2022 21:31:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 02/24] pinctrl: samsung: accept GPIO bank nodes with a
 suffix
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanho Park <chanho61.park@samsung.com>
References: <20211231161930.256733-1-krzysztof.kozlowski@canonical.com>
 <20211231161930.256733-3-krzysztof.kozlowski@canonical.com>
 <CAPLW+4kVjswvcx7PjkBq_cPrmoi1_yJw9qGOO2tcRCDm27zKmA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAPLW+4kVjswvcx7PjkBq_cPrmoi1_yJw9qGOO2tcRCDm27zKmA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 03/01/2022 19:43, Sam Protsenko wrote:
> On Fri, 31 Dec 2021 at 18:20, Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> Existing dt-bindings expected that each GPIO/pin bank within pin
>> controller has its own node with name matching the bank (e.g. gpa0,
>> gpx2) and "gpio-controller" property.  The node name is then used for
>> matching between driver data and DTS.
>>
>> Newly introduced dtschema expects to have nodes ending with "-gpio-bank"
>> suffix, so rewrite bank-devicetree matching to look for old and new
>> style of naming.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
>>  drivers/pinctrl/samsung/pinctrl-samsung.c | 57 ++++++++++++++++++-----
>>  1 file changed, 45 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
>> index f2864a7869b3..561853df8ef7 100644
>> --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
>> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
>> @@ -1011,13 +1011,56 @@ static void samsung_banks_of_node_put(struct samsung_pinctrl_drv_data *d)
>>                 of_node_put(bank->of_node);
>>  }
>>
>> +/*
>> + * Iterate over all driver pin banks to find one matching the name of node,
>> + * skipping optional "-gpio" node suffix. When found, assign node to the bank.
>> + */
>> +static void samsung_banks_of_node_get(struct device *dev,
>> +                                     struct samsung_pinctrl_drv_data *d,
>> +                                     struct device_node *node)
>> +{
>> +       const char *suffix = "-gpio-bank";
>> +       struct samsung_pin_bank *bank;
>> +       struct device_node *child;
>> +       /* Pin bank names are up to 4 characters */
>> +       char node_name[20];
>> +       unsigned int i;
>> +       size_t len;
>> +
>> +       bank = d->pin_banks;
>> +       for (i = 0; i < d->nr_banks; ++i, ++bank) {
>> +               strscpy(node_name, bank->name, sizeof(node_name));
>> +               len = strlcat(node_name, suffix, sizeof(node_name));
>> +               if (len == sizeof(sizeof(node_name))) {
> 
> Double sizeof is probably wrong?

Thanks, copy-paste error... it should be also "len >= sizeof".


Best regards,
Krzysztof
