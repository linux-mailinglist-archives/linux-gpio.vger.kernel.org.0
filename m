Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 721BE4DD62
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2019 00:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbfFTWUm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jun 2019 18:20:42 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:41203 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbfFTWUl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jun 2019 18:20:41 -0400
Received: by mail-lf1-f66.google.com with SMTP id 136so3534774lfa.8;
        Thu, 20 Jun 2019 15:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ytb9Muk0Hu4DrHGYX2rIqBECoD0TVDIUCusyYv+Gdsc=;
        b=idNsJsRUqy6U7ssGXzcjZuc1FUJihynWecsQ3enGHiJ++LY0zIq5p90lEbQ2OBuIyw
         So+kOFF3AOmbcpIWdfqLZ6uZil+QegcSAW3H9J8+mMRskmA6IitefNRJdjPS6sbaDXMf
         dto5nWKB838cVBu01Ie7uRayNogeBMlp0qf0VeppgiTqfZhwvY549hZs+HaL2pI4/gQ3
         8FEvw8fsvQbjhJ4TYqWrCRZM62YvHYKoU3ZEYSqFpo1d4+yjE957R41CNPltOyVXpjiL
         MtDnRx2OZ5aVBoVE3HW6dt+2NFiuaHWTEmyQ5SneCgqoShIVbA/l746Afgs0KUW0PHta
         7mpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ytb9Muk0Hu4DrHGYX2rIqBECoD0TVDIUCusyYv+Gdsc=;
        b=ugM4waIiNwnLNAF4uP7pI1VW9gBtKZ6zlRsZAMiP5MJcEGboTFeq9bo+CfIe144GE9
         gggD9YsflE2YtQtx8xeWGTgsvGyur4aUHMTrBHCpiabJ5Ikpq0yN/HI2dZ9FDC44bNkP
         9aVZHoOX0GZ+fL0uFhIuzkrDoGs0Y/2o9vddvAmSYWziCoNYRfpDTPOxKWoKmoDHkd0r
         NiLWyNYoljmnF9JeVZ8aru5nFfNgjraoTNHWSRsf6260X+CyMFSDSxdN8RUOG311WGDF
         tismaI9YkubHTAoBQndz5Mb5Wt9suOqjzKe6+GmzUkJsDXSLMx9cy8q+7n0HYvw9cqRe
         A27w==
X-Gm-Message-State: APjAAAVP0K3l13k17VgRXwZtyW7dpzq8HPu9HX0loqp7sG6jLp+o8i6z
        O2XKjDili7JksnKGkRvwLJnrQWM4
X-Google-Smtp-Source: APXvYqyq6TeRNLzHZ1lWEE6MnNHVP1O/Mj3m8XiADl7OpvF3XHE3TorZFqlO4EXUfE6aN1QSuxNawA==
X-Received: by 2002:a19:5044:: with SMTP id z4mr5984546lfj.80.1561069239626;
        Thu, 20 Jun 2019 15:20:39 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.googlemail.com with ESMTPSA id i188sm123433lji.4.2019.06.20.15.20.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jun 2019 15:20:39 -0700 (PDT)
Subject: Re: [PATCH 2/2] pinctrl: tegra: Add bitmask support for parked bits
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Stephen Warren <swarren@wwwdotorg.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Stefan Agner <stefan@agner.ch>, linux-tegra@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20190620170350.20224-1-thierry.reding@gmail.com>
 <20190620170350.20224-2-thierry.reding@gmail.com>
 <9324e541-7953-801e-4b7a-2075236ed054@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8af10354-1705-15b5-492a-cae8fd3f0537@gmail.com>
Date:   Fri, 21 Jun 2019 01:20:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <9324e541-7953-801e-4b7a-2075236ed054@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

20.06.2019 20:41, Sowjanya Komatineni пишет:
> 
> On 6/20/19 10:03 AM, Thierry Reding wrote:
>> From: Thierry Reding <treding@nvidia.com>
>>
>> Some pin groups have park bits for multiple pins in one register.
>> Support this by turning the parked bit field into a parked bitmask
>> field. If no parked bits are supported, the bitmask can be 0.
>>
>> Update the pingroup table on Tegra210, which is the only generation
>> where this is supported, with the parked bitmask.
>>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>> ---
>>   drivers/pinctrl/tegra/pinctrl-tegra.c    |  4 +-
>>   drivers/pinctrl/tegra/pinctrl-tegra.h    |  4 +-
>>   drivers/pinctrl/tegra/pinctrl-tegra114.c |  4 +-
>>   drivers/pinctrl/tegra/pinctrl-tegra124.c |  4 +-
>>   drivers/pinctrl/tegra/pinctrl-tegra194.c |  4 +-
>>   drivers/pinctrl/tegra/pinctrl-tegra20.c  |  6 +--
>>   drivers/pinctrl/tegra/pinctrl-tegra210.c | 60 ++++++++++++------------
>>   drivers/pinctrl/tegra/pinctrl-tegra30.c  |  4 +-
>>   8 files changed, 45 insertions(+), 45 deletions(-)
>>
>> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c
>> b/drivers/pinctrl/tegra/pinctrl-tegra.c
>> index 34596b246578..9df30809aaf6 100644
>> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
>> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
>> @@ -613,9 +613,9 @@ static void tegra_pinctrl_clear_parked_bits(struct
>> tegra_pmx *pmx)
>>         for (i = 0; i < pmx->soc->ngroups; ++i) {
>>           g = &pmx->soc->groups[i];
>> -        if (g->parked_bit >= 0) {
>> +        if (g->parked_bitmask > 0) {
>>               val = pmx_readl(pmx, g->mux_bank, g->mux_reg);
>> -            val &= ~(1 << g->parked_bit);
>> +            val &= ~g->parked_bitmask;
>>               pmx_writel(pmx, val, g->mux_bank, g->mux_reg);
>>           }
> 
> As parked_bit is now supported with DRV_PINGROUP, need to add check if
> name preceeds with drive_ and should use drv_bank/drv_reg OR
> 
> mux_bank/mux_reg. Otherwise this will cause a crash.

Yes, you should check whether mux_reg == -1.
