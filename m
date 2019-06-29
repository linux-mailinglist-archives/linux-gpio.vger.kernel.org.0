Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8C8E5AB38
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Jun 2019 15:02:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbfF2NCK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Jun 2019 09:02:10 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37934 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbfF2NCJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Jun 2019 09:02:09 -0400
Received: by mail-lj1-f194.google.com with SMTP id r9so8604550ljg.5;
        Sat, 29 Jun 2019 06:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ElMV5kfQRWNSHmnKy0nA7dWYtgHHYXlf1LlwoG/GExU=;
        b=pDSQMNtum3zKwv7gQNTf8Ma5x7pi3yE8YcGVrvvzmXdtxD9u3RulvLZWdUrjBEdE2i
         7sBFi9u1fQhQf25YUEANORqrMhLPkw+qHF9dQ3AT9uFmRlFzDffILaCNQWUGeTjLI8E6
         VVM54xpxHUcWXZCYB7+wzdb0NbYIyDLepWE4PhLv4VTmMY539Db3fcRRbEpGbvlLTPC1
         AloI4PmiVD4TAi9LuxJcUeyDW13lCOq2883r1LI4pmVt3e3Ck1zFjNwh5k7l8sxxPVKo
         NHdOBN7869ITBzV57Z+FE/w66ExiQiD+3+5r8xfP4Mk9gdjy4Gwxf2qJsRibfb/NmlbY
         u2qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ElMV5kfQRWNSHmnKy0nA7dWYtgHHYXlf1LlwoG/GExU=;
        b=YWpiNcdNMPwKm2px7/rKfqHBm1IarhMOnNruo7oFipCD+GJ+VQ7r7ONk2EAq5bvmgF
         YHCHCt9sNFgSDdwtMY6R9O/t4jIk9a9KYKyUIqBhVNwZKQiaoNEVZjMIhh/qsMk8vIJG
         hu9ZxaS8k7VaTLBO36EWZDn44CmHMEOpOo5tEqbzax3I2wybBXThNJw6f7JZJm1tjhW8
         ilSPiKrftJhkhhOGneVOt37k/4IXe1rxyMBylcQiiBCj7n0U8HWSLB6dPk7BIwnZP09o
         o1V7YBgW2GhefzFNmBEAhpc3VHM2hcWxQ+Lg1fhAMnEZjuvpjTFvlIqQasbFto2sw15k
         Wnyw==
X-Gm-Message-State: APjAAAVn01B2VRSQkyekhl8o5mk/x1R0Z92Tj7+Q4/DoqusICVqBTqW9
        EBVxJLJ93cg6VyTWAolRSu8/hULg
X-Google-Smtp-Source: APXvYqyn1WaW4ewJK4I5+8lbjM7wD0X5/UwFZvdN/XqiHXg/GCoMHovTmOZ4yjJVtEl/vb4m6pBJaQ==
X-Received: by 2002:a2e:5b1b:: with SMTP id p27mr8659452ljb.97.1561813326956;
        Sat, 29 Jun 2019 06:02:06 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru. [79.139.233.208])
        by smtp.googlemail.com with ESMTPSA id j23sm1383434lfb.93.2019.06.29.06.02.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 29 Jun 2019 06:02:06 -0700 (PDT)
Subject: Re: [PATCH V5 16/18] soc/tegra: pmc: Configure deep sleep control
 settings
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
 <1561687972-19319-17-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <27fdeee4-7dbe-2562-ea11-750c6fd3b952@gmail.com>
Date:   Sat, 29 Jun 2019 16:02:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <1561687972-19319-17-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

28.06.2019 5:12, Sowjanya Komatineni пишет:
> Tegra210 and prior Tegra chips have deep sleep entry and wakeup related
> timings which are platform specific that should be configured before
> entering into deep sleep.
> 
> Below are the timing specific configurations for deep sleep entry and
> wakeup.
> - Core rail power-on stabilization timer
> - OSC clock stabilization timer after SOC rail power is stabilized.
> - Core power off time is the minimum wake delay to keep the system
>   in deep sleep state irrespective of any quick wake event.
> 
> These values depends on the discharge time of regulators and turn OFF
> time of the PMIC to allow the complete system to finish entering into
> deep sleep state.
> 
> These values vary based on the platform design and are specified
> through the device tree.
> 
> This patch has implementation to configure these timings which are must
> to have for proper deep sleep and wakeup operations.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/soc/tegra/pmc.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index ed83c0cd09a3..7e4a8f04f4c4 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -89,6 +89,8 @@
>  
>  #define PMC_CPUPWRGOOD_TIMER		0xc8
>  #define PMC_CPUPWROFF_TIMER		0xcc
> +#define PMC_COREPWRGOOD_TIMER		0x3c
> +#define PMC_COREPWROFF_TIMER		0xe0
>  
>  #define PMC_PWR_DET_VALUE		0xe4
>  
> @@ -2291,6 +2293,7 @@ static const struct tegra_pmc_regs tegra20_pmc_regs = {
>  static void tegra20_pmc_init(struct tegra_pmc *pmc)
>  {
>  	u32 value;
> +	unsigned long osc, pmu, off;

I'd write this as:

 	u32 value, osc, pmu, off;

Because "unsigned long" has the same size as u32 in this case.
