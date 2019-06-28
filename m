Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F09B8599FC
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2019 14:05:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbfF1MFw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Jun 2019 08:05:52 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:33473 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbfF1MFv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Jun 2019 08:05:51 -0400
Received: by mail-lf1-f68.google.com with SMTP id y17so3835586lfe.0;
        Fri, 28 Jun 2019 05:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HA/mPpQJOKYmVDyeCe0ETFHFBZHAQQF5tQSIphSoyfk=;
        b=unBDizVA3kYuY0YF8aLYmRhRZrrqklXZDHk1SvjbwIEQuEmA87L1/au6QBeUR0gnNm
         gKZfpFreasGnUWIuaFOpP8M6475t1ynfTv7VoOwWF7LjU84m5F2xONdilbuR256ErgcK
         udQnRpeNuHB8WN8isFNQshf9NwXiK+iaLIhqQY8Em4os6fkb+nLL3lY98B+HkYmQrvlX
         8vVi3ZYS9pKxz5bsYFgeyCKveeNnu8dp2NrDRpt3quWe5YnVz7UxrSlH4N9vD8JcKNj+
         9qdFki+pvKdT6N7wjczDD04WMJZiHUAmtbEgOqExdqzcMUj8k136X6GGbsUMMCc6Hkxa
         kutQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HA/mPpQJOKYmVDyeCe0ETFHFBZHAQQF5tQSIphSoyfk=;
        b=tR4d2xI/K1zh2Oi5GqI4mB0s4nKAbwoJDwfr9GhMwKfTXoVw+TNulbzHJqDfxyCBdO
         x1DpyiLr+VS6r+iIdmtm3+BA+RSh6jQYuRnaRmek1amB8y8sTl3/nwxAuxzt57nxHyxG
         11HVhvFbi7hs+uakTQtD1yaW3eKDWa4LbiKE9zN4+2Rn4pX3XxlvpNjUvUJ9VB5Vp9WA
         v6cd6Ovxqh08xsuxaRoe8vuDIML4/yT0ln8R44NQzD/IGzX79A8TacwYfj102s0rUPit
         MYpcvqYDF0Qo8OJTLgeKE/izOr+xl6u3zmmujaJwEXjHJ/NG9GGdN5zIPN4KcBlXAFkY
         YYTg==
X-Gm-Message-State: APjAAAWVHFv3jvk78os1JrOc2N24zyRqveVsJP8lt1Te9rj714c7TBuC
        WnEMPkY6uVb1U4r6FL3oTAAUs8ED
X-Google-Smtp-Source: APXvYqxYiX9E8tGPpW2NlAcJ5oa6Bfp5m9cKFDQysAJTMIDvJhIFywx9lJeV13Ji3iPVX/JLRCw5QQ==
X-Received: by 2002:ac2:5446:: with SMTP id d6mr4727924lfn.138.1561723548837;
        Fri, 28 Jun 2019 05:05:48 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru. [79.139.233.208])
        by smtp.googlemail.com with ESMTPSA id a17sm561986lfk.0.2019.06.28.05.05.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Jun 2019 05:05:48 -0700 (PDT)
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
 <0409f478-e425-4e7f-5fff-8c3a94f47ee8@gmail.com>
Message-ID: <ca8199af-43db-c878-a93f-66c275acf864@gmail.com>
Date:   Fri, 28 Jun 2019 15:05:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <0409f478-e425-4e7f-5fff-8c3a94f47ee8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

28.06.2019 14:56, Dmitry Osipenko пишет:
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

>>  int tegra_pinctrl_probe(struct platform_device *pdev,
>>  			const struct tegra_pinctrl_soc_data *soc_data);
>>  #endif
>> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra210.c b/drivers/pinctrl/tegra/pinctrl-tegra210.c
>> index 0b56ad5c9c1c..edd3f4606cdb 100644
>> --- a/drivers/pinctrl/tegra/pinctrl-tegra210.c
>> +++ b/drivers/pinctrl/tegra/pinctrl-tegra210.c
>> @@ -1571,6 +1571,7 @@ static struct platform_driver tegra210_pinctrl_driver = {
>>  	.driver = {
>>  		.name = "tegra210-pinctrl",
>>  		.of_match_table = tegra210_pinctrl_of_match,
>> +		.pm = &tegra_pinctrl_pm,
>>  	},
>>  	.probe = tegra210_pinctrl_probe,
>>  };
>>
> 
> Could you please address my comments in the next revision if there will be one?
> 

Also, what about adding ".pm' for other Tegras? I'm sure Jon could test them for you.
