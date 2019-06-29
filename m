Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEBAF5AC5B
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Jun 2019 17:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbfF2P6s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Jun 2019 11:58:48 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37522 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726837AbfF2P6s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Jun 2019 11:58:48 -0400
Received: by mail-lf1-f67.google.com with SMTP id d11so5973863lfb.4;
        Sat, 29 Jun 2019 08:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cyDlqS8O+ETStaI7Z/NPe+oie16h8/OkCmdUka/nvu0=;
        b=p8ry45TeGG8F9VzwBLbwfGSW040vUOhn5vmH22YzaUFsPChv/AgOVp3iB4Xd0xhZBj
         WVH4KX9LssEOhpbcIe0whzEhuPHP7f5qRbmzUvgZjdm077xSPS32+f6NzJd6HErfFat3
         w3Y8sN2RTrlPStohugC2xxivCbRFihAomNgVKuv7Vo+6P+4BqFoAYHi2DmkdX4CwDi44
         fPzAjhktJ5bj7FVsK974xTXwd5RJH1G/+L7RsY9LVWXd+kBIdlaHf1qQMejaHsQ0daYM
         yUQu15FSpuHlmUbLcHRJQELcqDKmLPI/+7A2it0ZHobW8EZ5i007u6kdegClVBg86pgH
         OLGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cyDlqS8O+ETStaI7Z/NPe+oie16h8/OkCmdUka/nvu0=;
        b=F6i8cQm6PN78WwVb36g1mJFE4Vycp+7eD6ERbp1eirf8XS1a87mSz2ycfwi9gjic9s
         U+HxDYfbr/A1e1nlPtw2ynu5NBKnnCb5AtrJ12IxePF46nDjHjRNJm3EeqyCBvNEI6u+
         7AO9EAg/PV0CEl4OCJqMoBPsefDe/sT2rxWuqCsIK8bXVaw61HXk/kIS6mFpCb75F01n
         bSjdSoiCMCnbbaWUGUXf0IU8g1pg0XHVWmV9NmvVzMUIYPO17qHHgvxULf+5TQVSGb8X
         pezLkkdY6MRcMhEW8EoDj4wNmyO+bxdmYH428fOiTPvxcxhWwen7n37gcTjCSLDwUhkx
         lwNA==
X-Gm-Message-State: APjAAAUYdoj41MzM3Kd5nr9Cz1IIsRspzdvI9Wx1uFX/iH/qjieUaj2D
        m9Lq9O3msu4qP39LvEIqZvKgWm0k
X-Google-Smtp-Source: APXvYqw20rfKMoupFkFVytjknQYQZFmTnNun5nhtOvBf4v4LReYpOwSRUeXZcvERgqAIh9IQkOhrhA==
X-Received: by 2002:ac2:5310:: with SMTP id c16mr1552415lfh.119.1561823925054;
        Sat, 29 Jun 2019 08:58:45 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru. [79.139.233.208])
        by smtp.googlemail.com with ESMTPSA id v17sm2006940ljg.36.2019.06.29.08.58.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 29 Jun 2019 08:58:44 -0700 (PDT)
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
Message-ID: <822867d6-4a4d-5f68-9b21-84a20d73c589@gmail.com>
Date:   Sat, 29 Jun 2019 18:58:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <a262cbb3-845c-3ad1-16cc-375a24b9f7e9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

29.06.2019 18:46, Dmitry Osipenko пишет:
> 28.06.2019 5:12, Sowjanya Komatineni пишет:
>> This patch adds support for Tegra pinctrl driver suspend and resume.
>>
>> During suspend, context of all pinctrl registers are stored and
>> on resume they are all restored to have all the pinmux and pad
>> configuration for normal operation.
>>
>> Acked-by: Thierry Reding <treding@nvidia.com>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>  drivers/pinctrl/tegra/pinctrl-tegra.c    | 52 ++++++++++++++++++++++++++++++++
>>  drivers/pinctrl/tegra/pinctrl-tegra.h    |  3 ++
>>  drivers/pinctrl/tegra/pinctrl-tegra210.c |  1 +
>>  3 files changed, 56 insertions(+)
>>
>> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
>> index 34596b246578..e7c0a1011cba 100644
>> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
>> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
>> @@ -621,6 +621,43 @@ static void tegra_pinctrl_clear_parked_bits(struct tegra_pmx *pmx)
>>  	}
>>  }
>>  
>> +static int tegra_pinctrl_suspend(struct device *dev)
>> +{
>> +	struct tegra_pmx *pmx = dev_get_drvdata(dev);
>> +	u32 *backup_regs = pmx->backup_regs;
>> +	u32 *regs;
>> +	unsigned int i, j;
>> +
>> +	for (i = 0; i < pmx->nbanks; i++) {
>> +		regs = pmx->regs[i];
>> +		for (j = 0; j < pmx->reg_bank_size[i] / 4; j++)
>> +			*backup_regs++ = readl(regs++);
>> +	}
>> +
>> +	return pinctrl_force_sleep(pmx->pctl);
>> +}
>> +
>> +static int tegra_pinctrl_resume(struct device *dev)
>> +{
>> +	struct tegra_pmx *pmx = dev_get_drvdata(dev);
>> +	u32 *backup_regs = pmx->backup_regs;
>> +	u32 *regs;
>> +	unsigned int i, j;
>> +
>> +	for (i = 0; i < pmx->nbanks; i++) {
>> +		regs = pmx->regs[i];
>> +		for (j = 0; j < pmx->reg_bank_size[i] / 4; j++)
>> +			writel(*backup_regs++, regs++);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +const struct dev_pm_ops tegra_pinctrl_pm = {
>> +	.suspend = &tegra_pinctrl_suspend,
>> +	.resume = &tegra_pinctrl_resume
>> +};
> 
> Hm, so this are the generic platform-driver suspend-resume OPS here, which is very
> nice! But.. shouldn't pinctrl be resumed before the CLK driver (which is syscore_ops
> in this version of the series)? .. Given that "clock" function may need to be
> selected for some of the pins.
> 

Oh, also what about GPIO-pinctrl suspend resume ordering .. is it okay that pinctrl
will be resumed after GPIO? Shouldn't a proper pin-muxing be selected at first?

This also looks to me very unsafe in a context of older Tegras which are initializing
the static muxing very early during of the boot, otherwise things won't work well for
the drivers.
