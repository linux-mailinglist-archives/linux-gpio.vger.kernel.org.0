Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A858AA3A68
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2019 17:33:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728208AbfH3Pc7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Aug 2019 11:32:59 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33384 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727979AbfH3Pc7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Aug 2019 11:32:59 -0400
Received: by mail-pf1-f194.google.com with SMTP id g2so4888152pfq.0
        for <linux-gpio@vger.kernel.org>; Fri, 30 Aug 2019 08:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=typeblog-net.20150623.gappssmtp.com; s=20150623;
        h=date:user-agent:in-reply-to:references:mime-version
         :content-transfer-encoding:subject:to:cc:from:message-id;
        bh=akL/vzGq+lNV9YkALeJQ4aXXX3G8w5n79bs7dYEdyvc=;
        b=jA2jg3EMAc+Z03EJefu2AjTGWyurMgUv5WPaiMUdJetx9G66cfmRCPao9YkhUXW5n9
         n2XKm2WJJbb97jOllhEGi7VRlR7QnwJ1xq37V9tFvUZx4fdikRK9fPInZWbh9G7Vo6C3
         xWkaoZyMRnrop1UzkWtTJi2icL4lA7W/HlkCHVZ1NaKVVgwdyLUE1k683xiNtTOW8sCu
         LCHVIQ7wJRWo0enwCii8AJSZn/OmXumOkwFLbmfhc9pJJgivF6tCRiapM5rbB3vpwkkY
         O+PnsETVQc9vtlYmmgqdUTogb3AWHgj+Ol9L6TdOaDaJme/1KvKrzSsREjcIzMqDMOaB
         pRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:user-agent:in-reply-to:references
         :mime-version:content-transfer-encoding:subject:to:cc:from
         :message-id;
        bh=akL/vzGq+lNV9YkALeJQ4aXXX3G8w5n79bs7dYEdyvc=;
        b=GZvDjLpIDsMsHcgKa9lNBKC30oepm8tm4OQujfv15A3Knk1HlUzNR8n3WAz9kyVWNK
         Egtrkpm9VdyoUHbXE2qokj2CJuKQUfkljxVuzhSB6jSiCwDkpG9syEZX+uLMX+39+xMY
         90AxS4MQoTZDIReOarxFy45sKk1U81TNslNFxxWKhCRzvt8UN478q7WVr4sg9JhC7H+8
         ZGaWDWnXR3bqtO3frrDxvEkFebPrQQs5fg911A6qqyrmdue4i6q6uST2HLUCNktmQJjB
         M1SH+5SN67A3ldAUzTNTDUuHLfgrG3XGPCrfZHyrMlOefUXcDOyEW+RLbq+G67qSLxne
         jyAg==
X-Gm-Message-State: APjAAAW/tDmHxs0vaKl80YGRZhAc5Fm1LuK5j49C71UFUjAHwKQewBjh
        a2LP/OLZQtP/mo0W9k9aCBPYwA==
X-Google-Smtp-Source: APXvYqwCk3b/JUPn4IzgflSH3AD53+n85ervNpkFp1wYSX70ki280dLNL7xph+UzpG0nQUx7mcn6Yg==
X-Received: by 2002:a62:640e:: with SMTP id y14mr18441295pfb.222.1567179178862;
        Fri, 30 Aug 2019 08:32:58 -0700 (PDT)
Received: from [172.19.0.1] ([91.207.174.229])
        by smtp.gmail.com with ESMTPSA id a13sm6572268pfn.104.2019.08.30.08.32.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Aug 2019 08:32:58 -0700 (PDT)
Date:   Fri, 30 Aug 2019 23:32:53 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <20190830115505.GX2680@smile.fi.intel.com>
References: <20190830000024.20384-1-peter@typeblog.net> <20190830000024.20384-2-peter@typeblog.net> <20190830115505.GX2680@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] touchscreen: goodix: define GPIO mapping for GPD P2 Max
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bastien Nocera <hadess@hadess.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org
From:   Peter Cai <peter@typeblog.net>
Message-ID: <D5227099-6120-446B-A39D-6AE437F5E11E@typeblog.net>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On August 30, 2019 7:55:05 PM GMT+08:00, Andy Shevchenko <andriy=2Eshevchen=
ko@linux=2Eintel=2Ecom> wrote:
>On Fri, Aug 30, 2019 at 08:00:24AM +0800, Peter Cai wrote:
>> The firmware of GPD P2 Max could not handle panel resets although
>code
>> is present in DSDT=2E The kernel needs to take on this job instead, but
>> the DSDT does not provide _DSD, rendering kernel helpless when trying
>to
>> find the respective GPIO pins=2E
>>=20
>> Fortunately, this time GPD has proper DMI vendor / product strings
>that
>> we could match against=2E We simply apply an acpi_gpio_mapping table
>when
>> GPD P2 Max is matched=2E
>>=20
>> Additionally, the DSDT definition of the irq pin specifies a wrong
>> polarity=2E The new quirk introduced in the previous patch
>> (ACPI_GPIO_QUIRK_OVERRIDE_POLARITY) is applied to correct this=2E
>
>> +#ifdef CONFIG_ACPI
>
>I guess most of these #ifdef:s makes code less readable for exchange of
>saving
>few bytes in the module footprint=2E
>
>> +	{ "irq-gpios", &irq_gpios_default, 1,
>> +		ACPI_GPIO_QUIRK_OVERRIDE_POLARITY },
>
>One line?
>
>> +		=2Ematches =3D {
>> +			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
>> +			DMI_MATCH(DMI_PRODUCT_NAME, "P2 MAX")
>
>Comma at the end?
>
>> +		},
>> +		=2Edriver_data =3D &gpio_mapping_force_irq_active_high
>
>Ditto=2E

> I guess most of these #ifdef:s makes code less readable for exchange of =
saving
few bytes in the module footprint=2E

Since they can only be used when ACPI is supported (devm_acpi_dev_add_driv=
er_gpios does not exist without ACPI defined, thus the last guard must exis=
t), if they were not guarded then we would be left with a bunch of unused v=
ariables warnings when building without ACPI which doesn't seem good=2E

Should we use __maybe_unused here instead of #ifdef guards?

> Comma at the end?

I was trying to follow the style of this driver but it doesn't seem to be =
really consistent within itself=2E Another dmi_system_id definition in the =
same file mixed both styles so I was kind of confused=2E

--=20
Regards,
Xiyu Cai
