Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 029BA49D43
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 11:30:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729541AbfFRJap (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 05:30:45 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35413 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbfFRJao (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jun 2019 05:30:44 -0400
Received: by mail-lj1-f195.google.com with SMTP id x25so2783951ljh.2;
        Tue, 18 Jun 2019 02:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hwSDkScSTH1y8sb3aftSeN21vZ+s3ceMmS61Z1eIWFg=;
        b=IOehSmarBYtYG0PESpyQ5pXtttvQrv4cn6RnKaUml6NcUFPgEnZ4p3s2+KnQTzJ5R3
         njsVw+Y0UqiN7ZYQ9IHfdpFDjgdeBLHUgR8KWGgaogvXcwIxgED0Nlubsugg2ilIXMmp
         LzvBrVxbwvIH6HluvcTtnKciuadwIa/tXeug4lhRfKjC9jb5ij6QI8OEhkrqipUQ9t/2
         OY9x9adFYgZ2syqQBqOkk2zHp/iX9DgKNT+R6mveMP1Y6+3B6b4DPwpF4vE5rNmrtOTG
         i+J3zUHmBHsf3vPOqECQaFMvbWw7cRLntoCAwekfKL3lOX3Mxs0rJXmy8tRMQMXVQUfk
         rzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hwSDkScSTH1y8sb3aftSeN21vZ+s3ceMmS61Z1eIWFg=;
        b=d4UVfACq/+0fGUiaxR/KdzQ5mhrXfQgyYW0WFXq1i1QV+k+Pg40JjZX+4/qDJTcDYN
         WuV+bRWTd0Pn+xueI+MRkg6FcMq3ibUnBVIoWuZi4DwevQavY4+Yci067LqmfcFbWyGy
         YpNYUTJT4DPmAeW3REVSdE301XaQu7b9YB6jgGC0LM7GI1H+K4IASUOooyjE5qVDZJty
         Q1iLGSWGtmqzl5LB3WtS5ndWOWFdILZ8u4DIpXszYiZz42rkvvq0vdsV+Waz3bZXEfkR
         Lo5hoyGrpfkMaqM5fKsQrNTtpqFus1QLvD+4UNfJyzEMdKJdCx/OEr6E0mRDYsHd9KQ2
         Ldlw==
X-Gm-Message-State: APjAAAVbxrKuMAB3Ct7kxKaRpGshaIBKIKzKa5uzBW62gO8Bx+firXpu
        KtgRKh8076uSwIxPsoHY+ih/NmAK
X-Google-Smtp-Source: APXvYqzuLpP3JYktzxazLNNIsazSiiqdNS4Ctr1RcL4eCpoQTgI0mNPjSHZa1/yoASQxaOiRlZjddw==
X-Received: by 2002:a2e:4794:: with SMTP id u142mr16247893lja.222.1560850240997;
        Tue, 18 Jun 2019 02:30:40 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.googlemail.com with ESMTPSA id r17sm1306703ljb.77.2019.06.18.02.30.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Jun 2019 02:30:40 -0700 (PDT)
Subject: Re: [PATCH V3 02/17] pinctrl: tegra: add suspend and resume support
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de,
        jason@lakedaemon.net, marc.zyngier@arm.com,
        linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com,
        Stephen Warren <swarren@wwwdotorg.org>
Cc:     pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
 <1560843991-24123-3-git-send-email-skomatineni@nvidia.com>
 <7706a287-44b7-3ad6-37ff-47e97172a798@gmail.com>
Message-ID: <a23ffbae-dd85-c023-7aae-3b81e0b17ebc@gmail.com>
Date:   Tue, 18 Jun 2019 12:30:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <7706a287-44b7-3ad6-37ff-47e97172a798@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

18.06.2019 12:22, Dmitry Osipenko пишет:
> 18.06.2019 10:46, Sowjanya Komatineni пишет:
>> This patch adds suspend and resume support for Tegra pinctrl driver
>> and registers them to syscore so the pinmux settings are restored
>> before the devices resume.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>  drivers/pinctrl/tegra/pinctrl-tegra.c    | 62 ++++++++++++++++++++++++++++++++
>>  drivers/pinctrl/tegra/pinctrl-tegra.h    |  5 +++
>>  drivers/pinctrl/tegra/pinctrl-tegra114.c |  1 +
>>  drivers/pinctrl/tegra/pinctrl-tegra124.c |  1 +
>>  drivers/pinctrl/tegra/pinctrl-tegra20.c  |  1 +
>>  drivers/pinctrl/tegra/pinctrl-tegra210.c | 13 +++++++
>>  drivers/pinctrl/tegra/pinctrl-tegra30.c  |  1 +
>>  7 files changed, 84 insertions(+)
>>
>> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
>> index 34596b246578..ceced30d8bd1 100644
>> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
>> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
>> @@ -20,11 +20,16 @@
>>  #include <linux/pinctrl/pinmux.h>
>>  #include <linux/pinctrl/pinconf.h>
>>  #include <linux/slab.h>
>> +#include <linux/syscore_ops.h>
>>  
>>  #include "../core.h"
>>  #include "../pinctrl-utils.h"
>>  #include "pinctrl-tegra.h"
>>  
>> +#define EMMC2_PAD_CFGPADCTRL_0			0x1c8
>> +#define EMMC4_PAD_CFGPADCTRL_0			0x1e0
>> +#define EMMC_DPD_PARKING			(0x1fff << 14)
>> +
>>  static inline u32 pmx_readl(struct tegra_pmx *pmx, u32 bank, u32 reg)
>>  {
>>  	return readl(pmx->regs[bank] + reg);
>> @@ -619,6 +624,48 @@ static void tegra_pinctrl_clear_parked_bits(struct tegra_pmx *pmx)
>>  			pmx_writel(pmx, val, g->mux_bank, g->mux_reg);
>>  		}
>>  	}
>> +
>> +	if (pmx->soc->has_park_padcfg) {
>> +		val = pmx_readl(pmx, 0, EMMC2_PAD_CFGPADCTRL_0);
>> +		val &= ~EMMC_DPD_PARKING;
>> +		pmx_writel(pmx, val, 0, EMMC2_PAD_CFGPADCTRL_0);
>> +
>> +		val = pmx_readl(pmx, 0, EMMC4_PAD_CFGPADCTRL_0);
>> +		val &= ~EMMC_DPD_PARKING;
>> +		pmx_writel(pmx, val, 0, EMMC4_PAD_CFGPADCTRL_0);
>> +	}
>> +}
> 
> Is there any reason why parked_bit can't be changed to parked_bitmask like I was
> asking in a comment to v2?
> 
> I suppose that it's more preferable to keep pinctrl-tegra.c platform-agnostic for
> consistency when possible, hence adding platform specifics here should be discouraged.
> And then the parked_bitmask will also result in a proper hardware description in the code.
> 

I'm now also vaguely recalling that Stephen Warren had some kind of a "code generator"
for the pinctrl drivers. So I guess all those tables were auto-generated initially.

Stephen, maybe you could adjust the generator to take into account the bitmask (of
course if that's a part of the generated code) and then re-gen it all for Sowjanya?
