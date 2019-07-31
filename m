Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFB9F7BF12
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2019 13:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387466AbfGaLPh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Jul 2019 07:15:37 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37201 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728739AbfGaLPh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Jul 2019 07:15:37 -0400
Received: by mail-lj1-f194.google.com with SMTP id z28so10956383ljn.4;
        Wed, 31 Jul 2019 04:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6z0jtE10XtL+WjLPVGjCGsdJe3oZV5LH8j0ivYKyCt4=;
        b=m7LSUnp2AKhEQPzsHUvNhCfeivbslGOTTAPSQoRg7tdq7CIrz5928vLy3BEFklBZKb
         RYXkVnRMp23ntLIEhvMtMZrcd/Ce4fPXS+ynw8gQenwGm1bTumBxKI/MaJRzgyPLMDxX
         u/0yC8NkQzIM6IV3dmzlwhP9GZsu84ErcUZxqyWcMd8CzgAspDM5apcrk5bzLXUI9leu
         cqC0VYHrqkQiV3hO4/Dw39WZxwWK6kbUnkO47TgCjcOmMaU7eAdCeNd7Fi9GnaRZVU0H
         SRjohnKlGTx2VRYURDVWQZlhXaigAHCcPhkwf6bCvE4hOiWyKDVYNMPHGL+xXjfSjj9g
         tjcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6z0jtE10XtL+WjLPVGjCGsdJe3oZV5LH8j0ivYKyCt4=;
        b=GWCIqVk3pL8IRuqKBpLcDQ2SATFIzRIlP/lOjE32iIGcjNsGyI43X3eEFE0rWUvaEa
         H6uqkIDHlPnwYReJ6/Aq0YW0jRzzzY56gL09aH0VpyFXS/OTnruwfcCnbSIzzgBtwCik
         /9BKHl5477kxculrCWOiS4vUmaYC9N9hz098I5oU32WAGhhiWqetel85g0p9xdZdc2GX
         TQ7iCObrj30Uy5tpWK2b0DjTTmvjC8OmuJAG93cZX9d6RRZq70q7+y+OayUEEOkX+tnJ
         qLqmOdgV2+GJYBpEQ08JdGq7jnPBCMotrpYGtL+Vc4wlT6LavWNo4SRFjnP9m4C6mlYP
         oCvw==
X-Gm-Message-State: APjAAAWZh4slE8mObPkZGxL8B1xR5zz2U862jFhOsbpnKQVZBQhAs8H6
        5geiKXDp0GlAd6d4wMzUO/SXciu7
X-Google-Smtp-Source: APXvYqw91V/d9X1aLzic6f0zRJ0w1EuOIfqVFc+gfTo/wK4IYGv/9BDAISF90iCiwdueJAcscGgXWQ==
X-Received: by 2002:a2e:9643:: with SMTP id z3mr65172467ljh.43.1564571734209;
        Wed, 31 Jul 2019 04:15:34 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id s20sm11611282lfb.95.2019.07.31.04.15.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 04:15:33 -0700 (PDT)
Subject: Re: [PATCH v7 11/20] cpufreq: tegra124: Add suspend and resume
 support
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
References: <1564532424-10449-1-git-send-email-skomatineni@nvidia.com>
 <1564532424-10449-12-git-send-email-skomatineni@nvidia.com>
 <98aae4b7-d95a-90ba-0d55-7512b3712f54@gmail.com>
Message-ID: <505bbdc0-c48a-8583-3838-ec5c128f375f@gmail.com>
Date:   Wed, 31 Jul 2019 14:14:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <98aae4b7-d95a-90ba-0d55-7512b3712f54@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

31.07.2019 13:23, Dmitry Osipenko пишет:
> 31.07.2019 3:20, Sowjanya Komatineni пишет:
>> This patch adds suspend and resume pm ops for cpufreq driver.
>>
>> PLLP is the safe clock source for CPU during system suspend and
>> resume as PLLP rate is below the CPU Fmax at Vmin.
>>
>> CPUFreq driver suspend switches the CPU clock source to PLLP and
>> disables the DFLL clock.
>>
>> During system resume, warmboot code powers up the CPU with PLLP
>> clock source. So CPUFreq driver resume enabled DFLL clock and
>> switches CPU back to DFLL clock source.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>  drivers/cpufreq/tegra124-cpufreq.c | 60 ++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 60 insertions(+)
>>
>> diff --git a/drivers/cpufreq/tegra124-cpufreq.c b/drivers/cpufreq/tegra124-cpufreq.c
>> index 4f0c637b3b49..e979a3370988 100644
>> --- a/drivers/cpufreq/tegra124-cpufreq.c
>> +++ b/drivers/cpufreq/tegra124-cpufreq.c
>> @@ -6,6 +6,7 @@
>>  #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
>>  
>>  #include <linux/clk.h>
>> +#include <linux/cpufreq.h>
>>  #include <linux/err.h>
>>  #include <linux/init.h>
>>  #include <linux/kernel.h>
>> @@ -128,8 +129,67 @@ static int tegra124_cpufreq_probe(struct platform_device *pdev)
>>  	return ret;
>>  }
>>  
>> +static int __maybe_unused tegra124_cpufreq_suspend(struct device *dev)
>> +{
>> +	struct tegra124_cpufreq_priv *priv = dev_get_drvdata(dev);
>> +	int err;
>> +
>> +	/*
>> +	 * PLLP rate 408Mhz is below the CPU Fmax at Vmin and is safe to
>> +	 * use during suspend and resume. So, switch the CPU clock source
>> +	 * to PLLP and disable DFLL.
>> +	 */
>> +	err = clk_set_parent(priv->cpu_clk, priv->pllp_clk);
>> +	if (err < 0) {
>> +		dev_err(dev, "failed to reparent to PLLP: %d\n", err);
>> +		return err;
>> +	}
>> +
>> +	/* disable DFLL clock */
>> +	clk_disable_unprepare(priv->dfll_clk);
>> +
>> +	return 0;
>> +}
>> +
>> +static int __maybe_unused tegra124_cpufreq_resume(struct device *dev)
>> +{
>> +	struct tegra124_cpufreq_priv *priv = dev_get_drvdata(dev);
>> +	int err;
>> +
>> +	/*
>> +	 * Warmboot code powers up the CPU with PLLP clock source.
>> +	 * Enable DFLL clock and switch CPU clock source back to DFLL.
>> +	 */
>> +	err = clk_prepare_enable(priv->dfll_clk);
>> +	if (err < 0) {
>> +		dev_err(dev, "failed to enable DFLL clock for CPU: %d\n", err);
>> +		goto disable_cpufreq;
>> +	}
>> +
>> +	err = clk_set_parent(priv->cpu_clk, priv->dfll_clk);
>> +	if (err < 0) {
>> +		dev_err(dev, "failed to reparent to DFLL clock: %d\n", err);
>> +		goto disable_dfll;
>> +	}
>> +
>> +	return 0;
>> +
>> +disable_dfll:
>> +	clk_disable_unprepare(priv->dfll_clk);
>> +disable_cpufreq:
>> +	disable_cpufreq();
>> +
>> +	return err;
>> +}
>> +
>> +static const struct dev_pm_ops tegra124_cpufreq_pm_ops = {
>> +	SET_SYSTEM_SLEEP_PM_OPS(tegra124_cpufreq_suspend,
>> +				tegra124_cpufreq_resume)
>> +};
>> +
>>  static struct platform_driver tegra124_cpufreq_platdrv = {
>>  	.driver.name	= "cpufreq-tegra124",
>> +	.driver.pm	= &tegra124_cpufreq_pm_ops,
>>  	.probe		= tegra124_cpufreq_probe,
>>  };
>>  
>>
> 
> Looks good,
> 
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> 

BTW, you should also CC the CPUFreq maintainers because this patch can't
be applied without theirs ACK.
