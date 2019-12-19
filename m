Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F53D1265AE
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 16:25:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726779AbfLSPZ4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 10:25:56 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34246 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726776AbfLSPZ4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 10:25:56 -0500
Received: by mail-lj1-f194.google.com with SMTP id z22so1857831ljg.1;
        Thu, 19 Dec 2019 07:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yqXyqCEU/X28oi4oNMERZW19vUW8+ITl1VJ657B32AQ=;
        b=F63mDoYG+4XNcwtFC5rbojj7p2G1SYZ2dSzGNihTpA6GQ5Eaq8AB4BevQ7HB/YXE6L
         JDsuyeAN1tABCdOus9JeI0o/m29KUb42zGru4W+kyZENE1F078cKFExWKODh76lPV9v/
         lKVRrBfEFEy0G2UoGF7HPeLjNCOFcuB8pD1z3i1060LdMdG/3hkFVVQlEdSjG5oIWdMD
         4sRASqkHA5CGV/yTgttZnRKAWK7dR07tZSzFVLMvsXNYqVF6I5ihnPzbPFE+jAv0sAxw
         2Y+10PXQHiPIpy3+7u2QJafe17FzsmQt6Cwwd+xIEM5CPQOft72hxhno5U1Q6bOu5f8d
         0KbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yqXyqCEU/X28oi4oNMERZW19vUW8+ITl1VJ657B32AQ=;
        b=ZALvkvPv1/8J+20QZvMb528exgBJnj5ztuluH378CqXc7esPpg5qV62QXs3+Rr2OU1
         MR0A2m+3s4vmD1cZwuFneeyc44o6/Y+Mpz6RFhkv69zxJzTJXty+Ue9H8XsuYndS1tc2
         V/WEIOjX+xREoCRGIo2lVeXpho379c9d4D39vqiXNjS9w9gXRoQRvjLZnqtmKrEeST1b
         k7rFZqXEJ0kiv0VQ8lydQ7TKzuigdID9jTCbhAsn6S+dOQ+jmee4regH2akiTZL5U5iO
         HXlRsX3TJ1ieeJ3aLPP3eb0D/F1aPszEsaFBJQSi1CeLgSOK4ch8a+I/kOY3T2mlTvWs
         YI7Q==
X-Gm-Message-State: APjAAAUVJpb2hO8YhzKInkyf7lBePdfldIs4YKeP1+GNfUUNqyfWCluc
        6iwnfBBiNOxyj0n2DGlP9pfaF1Qu
X-Google-Smtp-Source: APXvYqy5diovob/ZJdsyh0gLijnyKUDNXGbYOijwkRSTKNzQJaAtxAWV4K6nd87cOjuAx212Bmq/jA==
X-Received: by 2002:a2e:81c7:: with SMTP id s7mr6419075ljg.3.1576769153989;
        Thu, 19 Dec 2019 07:25:53 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id e9sm2922774ljp.87.2019.12.19.07.25.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2019 07:25:53 -0800 (PST)
Subject: Re: [PATCH v1 1/3] gpio: tegra: Use generic
 readl_relaxed/writel_relaxed accessors
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        LKML <linux-kernel@vger.kernel.org>
References: <20191215183047.9414-1-digetx@gmail.com>
 <20191215183047.9414-2-digetx@gmail.com>
 <CAMpxmJUmLOZoKeeo4XMVEOWKRgwfS4O2szVboY-qTTYXg_aTVg@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1e214577-1abe-22e6-ca55-2e9806fdb9b0@gmail.com>
Date:   Thu, 19 Dec 2019 18:25:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <CAMpxmJUmLOZoKeeo4XMVEOWKRgwfS4O2szVboY-qTTYXg_aTVg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

19.12.2019 14:01, Bartosz Golaszewski пишет:
> niedz., 15 gru 2019 o 19:31 Dmitry Osipenko <digetx@gmail.com> napisał(a):
>>
>> There is no point in using old-style raw accessors, the generic accessors
>> do the same thing and also take into account CPU endianness. Tegra SoCs do
>> not support big-endian mode in the upstream kernel, but let's switch away
>> from the outdated things anyway, just to keep code up-to-date.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/gpio/gpio-tegra.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
>> index 6fdfe4c5303e..f6a382fbd12d 100644
>> --- a/drivers/gpio/gpio-tegra.c
>> +++ b/drivers/gpio/gpio-tegra.c
>> @@ -96,12 +96,12 @@ struct tegra_gpio_info {
>>  static inline void tegra_gpio_writel(struct tegra_gpio_info *tgi,
>>                                      u32 val, u32 reg)
>>  {
>> -       __raw_writel(val, tgi->regs + reg);
>> +       writel_relaxed(val, tgi->regs + reg);
>>  }
>>
>>  static inline u32 tegra_gpio_readl(struct tegra_gpio_info *tgi, u32 reg)
>>  {
>> -       return __raw_readl(tgi->regs + reg);
>> +       return readl_relaxed(tgi->regs + reg);
>>  }
>>
>>  static unsigned int tegra_gpio_compose(unsigned int bank, unsigned int port,
>> --
>> 2.24.0
>>
> 
> The entire series looks good to me, but I'll wait for Thierry's acks
> just in case.

Thank you very much for taking a look at the patches!
