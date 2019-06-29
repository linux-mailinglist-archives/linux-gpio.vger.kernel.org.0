Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3995AC8A
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Jun 2019 18:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbfF2Q2T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Jun 2019 12:28:19 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:47009 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726837AbfF2Q2T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Jun 2019 12:28:19 -0400
Received: by mail-lj1-f196.google.com with SMTP id v24so8881800ljg.13;
        Sat, 29 Jun 2019 09:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UHacZalSuCYOHZspYGAnQfamsfWZBNs56bktpU32GpA=;
        b=eeOSf24YZrPztGoI0/WgmJ/cvqtjVp4w4sFh89J2mKh0EyWBYY6W5rSwJ4E9F1ZGEp
         Ak9aSwK0TDD47ZufOblgj7g7W/mkJ2qTC7X0jPoWJB1zVt6o8BqjEp55k5V9FaiyE//O
         hApyaM0U0IunEym+y9r+H3Ppw9wCWsehad5GUPf345UERtSAL00rRm7tvyZesU6A6AD0
         d7hFN4nZvy08+tE241GXbWeMLQ8FTgCdcJGqo65q/ep7eeq8t3dtvJzIlYAWl7q21/54
         5onPD6s0cuTZhDbWVY4hQEuKAxDCZOBi+qTbVT5ohebuHBrbiUDdvgBZLTJLPIQE/Z3k
         79UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UHacZalSuCYOHZspYGAnQfamsfWZBNs56bktpU32GpA=;
        b=Bcm808T7vKfF40r5vATvlHgpF0l4jrIdfNpM1E911F4oHD5LG9A/tGIHfy6c3epIG4
         be2f+21EIqTuTJy4Sl13tWgALbEWemzMo4zTF0ZaiX3HUfQMoBJz23h3l6JKHPrjIIH9
         aDCyfO6/xjVe/mjKKcSZ3ClW9EySURD3FG/NxsaDr3/agGeJOWFM404P8BQBmanIlG4t
         BNH23aZSvDrHQmtEIPZS3YGpsB90kW5y8pHeJIaOuANKGEO8Rc/KDz6EVFAAhbJdiGPQ
         MLLQ12m25CBfh8kQVLDRoUa5A1ulaEokmHSO883RcdpXRNhRaPyzFXAHLL1rCudZWE8Y
         U+BA==
X-Gm-Message-State: APjAAAWIXTAnUsFdqL30Mqt3ydKO7u3h10NxIOs6FQF+aeroAZRQZeaR
        LShQ8BQqNvqfgD4MD1T9NOyLYP5l
X-Google-Smtp-Source: APXvYqyE/K9bJgpn1ckbdvDl2gXW6sWLRckeurkBvCQqCRqB99DArcU2kKVYH4CAYs0RdteVT0zaTQ==
X-Received: by 2002:a2e:80c8:: with SMTP id r8mr9262458ljg.168.1561825696039;
        Sat, 29 Jun 2019 09:28:16 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru. [79.139.233.208])
        by smtp.googlemail.com with ESMTPSA id m25sm1472959lfp.97.2019.06.29.09.28.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 29 Jun 2019 09:28:15 -0700 (PDT)
Subject: Re: [PATCH V5 02/18] pinctrl: tegra: Add suspend and resume support
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de,
        jason@lakedaemon.net, marc.zyngier@arm.com,
        linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc:     pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org
References: <1561687972-19319-1-git-send-email-skomatineni@nvidia.com>
 <1561687972-19319-3-git-send-email-skomatineni@nvidia.com>
 <a262cbb3-845c-3ad1-16cc-375a24b9f7e9@gmail.com>
 <822867d6-4a4d-5f68-9b21-84a20d73c589@gmail.com>
Message-ID: <b7bfe578-69d3-bbe6-9613-bf5e98359703@gmail.com>
Date:   Sat, 29 Jun 2019 19:28:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <822867d6-4a4d-5f68-9b21-84a20d73c589@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

29.06.2019 18:58, Dmitry Osipenko пишет:
> 29.06.2019 18:46, Dmitry Osipenko пишет:
>> 28.06.2019 5:12, Sowjanya Komatineni пишет:
>>> This patch adds support for Tegra pinctrl driver suspend and resume.
>>>
>>> During suspend, context of all pinctrl registers are stored and
>>> on resume they are all restored to have all the pinmux and pad
>>> configuration for normal operation.
>>>
>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>> ---
>>>  drivers/pinctrl/tegra/pinctrl-tegra.c    | 52 ++++++++++++++++++++++++++++++++
>>>  drivers/pinctrl/tegra/pinctrl-tegra.h    |  3 ++
>>>  drivers/pinctrl/tegra/pinctrl-tegra210.c |  1 +
>>>  3 files changed, 56 insertions(+)
>>>
>>> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
>>> index 34596b246578..e7c0a1011cba 100644
>>> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
>>> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
>>> @@ -621,6 +621,43 @@ static void tegra_pinctrl_clear_parked_bits(struct tegra_pmx *pmx)
>>>  	}
>>>  }
>>>  
>>> +static int tegra_pinctrl_suspend(struct device *dev)
>>> +{
>>> +	struct tegra_pmx *pmx = dev_get_drvdata(dev);
>>> +	u32 *backup_regs = pmx->backup_regs;
>>> +	u32 *regs;
>>> +	unsigned int i, j;
>>> +
>>> +	for (i = 0; i < pmx->nbanks; i++) {
>>> +		regs = pmx->regs[i];
>>> +		for (j = 0; j < pmx->reg_bank_size[i] / 4; j++)
>>> +			*backup_regs++ = readl(regs++);
>>> +	}
>>> +
>>> +	return pinctrl_force_sleep(pmx->pctl);
>>> +}
>>> +
>>> +static int tegra_pinctrl_resume(struct device *dev)
>>> +{
>>> +	struct tegra_pmx *pmx = dev_get_drvdata(dev);
>>> +	u32 *backup_regs = pmx->backup_regs;
>>> +	u32 *regs;
>>> +	unsigned int i, j;
>>> +
>>> +	for (i = 0; i < pmx->nbanks; i++) {
>>> +		regs = pmx->regs[i];
>>> +		for (j = 0; j < pmx->reg_bank_size[i] / 4; j++)
>>> +			writel(*backup_regs++, regs++);
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +const struct dev_pm_ops tegra_pinctrl_pm = {
>>> +	.suspend = &tegra_pinctrl_suspend,
>>> +	.resume = &tegra_pinctrl_resume
>>> +};
>>
>> Hm, so this are the generic platform-driver suspend-resume OPS here, which is very
>> nice! But.. shouldn't pinctrl be resumed before the CLK driver (which is syscore_ops
>> in this version of the series)? .. Given that "clock" function may need to be
>> selected for some of the pins.
>>
> 
> Oh, also what about GPIO-pinctrl suspend resume ordering .. is it okay that pinctrl
> will be resumed after GPIO? Shouldn't a proper pin-muxing be selected at first?
> 
> This also looks to me very unsafe in a context of older Tegras which are initializing
> the static muxing very early during of the boot, otherwise things won't work well for
> the drivers.
> 

Although, scratch what I wrote about older Tegras. We are probing pinctl driver very
early, hence it should suspend last and resume first. Should be okay.
