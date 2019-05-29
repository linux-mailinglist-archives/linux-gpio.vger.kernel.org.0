Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C13A2E116
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2019 17:31:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbfE2PbA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 May 2019 11:31:00 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:38595 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbfE2PbA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 May 2019 11:31:00 -0400
Received: by mail-lj1-f196.google.com with SMTP id o13so2915404lji.5;
        Wed, 29 May 2019 08:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QNpp3+TXidOjskLGVibpmvR3MRh+7pSnFlPt1lVhXAg=;
        b=NKA8q0dUoVO+aTq7Rqo9sd8x62qlwWNod/NJ5sZaeoRy8ZCEGzwWOoMC8Fuenf19nu
         Bo7a7UuNPKal73cypz5P+XdcTFseO+8+KDypD6UuXhJpWUgg9UCbluRuzefcfzKdDXr/
         uLzwYoYNbQxhxRTHR1GGO6MjPgR93dGZRisH0LHWPiNsytCk3dEz9mqSnLETXAWyERpq
         +8FVfIafQRtKTL3ai8iTBXQ+7ZTRhibvIYcUjUwXEO3BxTu0yo5Q7pfkp54KK2rnJHru
         B36vhsgeZ/G6pD88rwABCnIUs+g0rm38xl3AF4HmSoTSUPf+L1/eYk6BgGYWo5t2SQVq
         hGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QNpp3+TXidOjskLGVibpmvR3MRh+7pSnFlPt1lVhXAg=;
        b=V69wezC6uXRH7dtOdgjOQIT519P2nV1zi8srIzHKM1wyycsT1NjlK3Et8aMZu+6iUb
         78NSgTfT79shZb+/9HlshIboX/fFkf9RIniMQdWJ6JDQqS6viI2KAOtpR6eUPYaLnNAe
         1L2nrdp3e9vSBv+F1PAmPkuBCuARxxjVYb2UlK7Oz0/yYQxXZSQ7lHHWbyVTsKSajEB/
         ZeKf0SIsjRytbYRT1sRs8Dd8nZHtGEudOvI8iFkmHFUr87favI/RVj4N2TAQI2ecrPAj
         NVRfB+84a1Ao49ptdVb6E9qLTnrS3vz8LGFGMHFLC7wJ7+xPFI3vgVpRwV/dsFVc406n
         hhIA==
X-Gm-Message-State: APjAAAUGsXPr6f0l1P07kegf5O4HnpWSdvoA1E2a+WQeZirl5G0Gsoz2
        ZP2BXDlDM+3YrJoIk6t7g/ui9r4C
X-Google-Smtp-Source: APXvYqxVea962JccPcGD+nidzhwVcdWpV3Mraq2NwASgddvLewsOBGWSeZUAHcTT2aBtS+2o2xTM0A==
X-Received: by 2002:a2e:970e:: with SMTP id r14mr20439581lji.86.1559143857576;
        Wed, 29 May 2019 08:30:57 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.35.141])
        by smtp.googlemail.com with ESMTPSA id c10sm3497637lfh.79.2019.05.29.08.30.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 08:30:56 -0700 (PDT)
Subject: Re: [PATCH V2 02/12] pinctrl: tegra: add suspend and resume support
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
References: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
 <1559084936-4610-3-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6273a790-d4b7-c501-3fec-d9816288b139@gmail.com>
Date:   Wed, 29 May 2019 18:29:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1559084936-4610-3-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

29.05.2019 2:08, Sowjanya Komatineni пишет:
> This patch adds suspend and resume support for Tegra pinctrl driver
> and registers them to syscore so the pinmux settings are restored
> before the devices resume.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/pinctrl/tegra/pinctrl-tegra.c    | 68 +++++++++++++++++++++++++++++++-
>  drivers/pinctrl/tegra/pinctrl-tegra.h    |  3 ++
>  drivers/pinctrl/tegra/pinctrl-tegra114.c |  1 +
>  drivers/pinctrl/tegra/pinctrl-tegra124.c |  1 +
>  drivers/pinctrl/tegra/pinctrl-tegra20.c  |  1 +
>  drivers/pinctrl/tegra/pinctrl-tegra210.c |  1 +
>  drivers/pinctrl/tegra/pinctrl-tegra30.c  |  1 +
>  7 files changed, 75 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
> index a5008c066bac..bdc47e62c457 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
> @@ -28,11 +28,18 @@
>  #include <linux/pinctrl/pinmux.h>
>  #include <linux/pinctrl/pinconf.h>
>  #include <linux/slab.h>
> +#include <linux/syscore_ops.h>
>  
>  #include "../core.h"
>  #include "../pinctrl-utils.h"
>  #include "pinctrl-tegra.h"
>  
> +#define EMMC2_PAD_CFGPADCTRL_0			0x1c8
> +#define EMMC4_PAD_CFGPADCTRL_0			0x1e0
> +#define EMMC_DPD_PARKING			(0x1fff << 14)
> +
> +static struct tegra_pmx *pmx;
> +
>  static inline u32 pmx_readl(struct tegra_pmx *pmx, u32 bank, u32 reg)
>  {
>  	return readl(pmx->regs[bank] + reg);
> @@ -629,6 +636,50 @@ static void tegra_pinctrl_clear_parked_bits(struct tegra_pmx *pmx)
>  	}
>  }
>  
> +static int __maybe_unused tegra_pinctrl_suspend(void)
> +{
> +	u32 *backup_regs = pmx->backup_regs;
> +	u32 *regs;
> +	int i, j;
> +
> +	for (i = 0; i < pmx->nbanks; i++) {
> +		regs = pmx->regs[i];
> +		for (j = 0; j < pmx->reg_bank_size[i] / 4; j++)
> +			*backup_regs++ = readl(regs++);
> +	}
> +
> +	return pinctrl_force_sleep(pmx->pctl);
> +}
> +
> +static void __maybe_unused tegra_pinctrl_resume(void)
> +{
> +	u32 *backup_regs = pmx->backup_regs;
> +	u32 *regs;
> +	u32 val;
> +	int i, j;
> +
> +	for (i = 0; i < pmx->nbanks; i++) {
> +		regs = pmx->regs[i];
> +		for (j = 0; j < pmx->reg_bank_size[i] / 4; j++)
> +			writel(*backup_regs++, regs++);
> +	}
> +
> +	if (pmx->soc->has_park_padcfg) {
> +		val = pmx_readl(pmx, 0, EMMC2_PAD_CFGPADCTRL_0);
> +		val &= ~EMMC_DPD_PARKING;
> +		pmx_writel(pmx, val, 0, EMMC2_PAD_CFGPADCTRL_0);
> +
> +		val = pmx_readl(pmx, 0, EMMC4_PAD_CFGPADCTRL_0);
> +		val &= ~EMMC_DPD_PARKING;
> +		pmx_writel(pmx, val, 0, EMMC4_PAD_CFGPADCTRL_0);
> +	}
> +}
>

But the CFGPADCTRL registers are already programmed by restoring the
backup_regs and hence the relevant EMMC's are already unparked. Hence
why do you need to force-unpark both of the EMMC's? What if EMMC is
unpopulated on a board, why do you need to unpark it then?

-- 
Dmitry
