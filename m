Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8437D5AC36
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Jun 2019 17:40:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbfF2Pkj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Jun 2019 11:40:39 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38723 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726819AbfF2Pkj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Jun 2019 11:40:39 -0400
Received: by mail-lj1-f193.google.com with SMTP id r9so8828984ljg.5;
        Sat, 29 Jun 2019 08:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XMv95h7PvzqJGn4e1p6N1/DUxaWRpggi5N+BdiEEdBU=;
        b=Wgndi82TOGLLU7o/HZ6iW8lbCH7JirxRBWgEFMThNz9WtK7yJaDuS6rRiZannS3wys
         WinulJG5LhjHKhtVapaDKTvow6ZvpxFOWd/PNn2nn5edOlIQv+QkOGlt0y+7FW3pFrZr
         ko/xRXnAMPis3rilYrcpkgfzdksE7q9weeDHDcH1GyGA1l9lXnv1Gvsz+yFwUhJVkS7q
         Ji37ob8XN9Zbh3qG6QNQpxYx/aKTH+lK0+M1ira7p/il/ZynYb0bPytPwcfnIerF2rJY
         mjqsVpxRx6hxFu1qpAiQynEdlId5noq2Kuchptyb6Lmj2yUcsoj3ycunyuNW7ZsOydCN
         S94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XMv95h7PvzqJGn4e1p6N1/DUxaWRpggi5N+BdiEEdBU=;
        b=X/l6VofTXkeDH8sbCe9TOfw3D1EeF+jh5mGXnalRY41pnSxD+6iFBRu01N1nw5IVLW
         siJOuP8ask2Rg5NaLyaCaSQDNuYLmOczwgE69XdK/LPq4VnEDkWudTzpzMBXC5mBrKqP
         PT+PfIta7oM4l+dGWk0YvGhz/HLY5TNrmzsVXit627jLL36jWkPH+9uXUeveL225YZVM
         cihZXVu6IonBACJ9uEGNXyUdzHmoJKV/IM0ZS4ua5EXCcCq51GqVxZISm2Qpr0ldnyfD
         +Hbaqmj0keGXCMZiwfkvbB3NT4qPu6N8kLl2PA1+Zo50KTbBRRftJYhnYUrCTdMqaXfx
         ALqQ==
X-Gm-Message-State: APjAAAXkLf0aB/zkcMhNQsMAXrgX/LhZ0vA6P2AFytS8KIx01pnfXo0b
        /f/AlUqNn+XrnLZR2fcCIq/j9yev
X-Google-Smtp-Source: APXvYqzL9CBSBNNjZ2m0OcDwSYbJiF2iWyvB096BDAPPiJ29stmMjms9pHQscLjWfkcQKdchv0ZmAw==
X-Received: by 2002:a2e:3c1a:: with SMTP id j26mr9361160lja.230.1561822835986;
        Sat, 29 Jun 2019 08:40:35 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru. [79.139.233.208])
        by smtp.googlemail.com with ESMTPSA id 24sm2000483ljs.63.2019.06.29.08.40.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 29 Jun 2019 08:40:35 -0700 (PDT)
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
 <ca8199af-43db-c878-a93f-66c275acf864@gmail.com>
 <99403cb1-aaef-4dd4-68a0-67864ca7ce6c@nvidia.com>
 <fbfb2167-d0b3-b66a-d1ba-378c877817ed@gmail.com>
Message-ID: <364c7381-1431-1f0d-b162-3da9706fdcb8@gmail.com>
Date:   Sat, 29 Jun 2019 18:40:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <fbfb2167-d0b3-b66a-d1ba-378c877817ed@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

29.06.2019 15:38, Dmitry Osipenko пишет:
> 29.06.2019 2:00, Sowjanya Komatineni пишет:
>>
>> On 6/28/19 5:05 AM, Dmitry Osipenko wrote:
>>> 28.06.2019 14:56, Dmitry Osipenko пишет:
>>>> 28.06.2019 5:12, Sowjanya Komatineni пишет:
>>>>> This patch adds support for Tegra pinctrl driver suspend and resume.
>>>>>
>>>>> During suspend, context of all pinctrl registers are stored and
>>>>> on resume they are all restored to have all the pinmux and pad
>>>>> configuration for normal operation.
>>>>>
>>>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>> ---
>>>>>   int tegra_pinctrl_probe(struct platform_device *pdev,
>>>>>               const struct tegra_pinctrl_soc_data *soc_data);
>>>>>   #endif
>>>>> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra210.c
>>>>> b/drivers/pinctrl/tegra/pinctrl-tegra210.c
>>>>> index 0b56ad5c9c1c..edd3f4606cdb 100644
>>>>> --- a/drivers/pinctrl/tegra/pinctrl-tegra210.c
>>>>> +++ b/drivers/pinctrl/tegra/pinctrl-tegra210.c
>>>>> @@ -1571,6 +1571,7 @@ static struct platform_driver tegra210_pinctrl_driver = {
>>>>>       .driver = {
>>>>>           .name = "tegra210-pinctrl",
>>>>>           .of_match_table = tegra210_pinctrl_of_match,
>>>>> +        .pm = &tegra_pinctrl_pm,
>>>>>       },
>>>>>       .probe = tegra210_pinctrl_probe,
>>>>>   };
>>>>>
>>>> Could you please address my comments in the next revision if there will be one?
>>>>
>>> Also, what about adding ".pm' for other Tegras? I'm sure Jon could test them for you.
>>
>> This series is for Tegra210 SC7 entry/exit along with clocks and pinctrl suspend
>> resume needed for Tegra210 basic sc7 entry and exit.
>>
>> This includes pinctrl, pmc changes, clock-tegra210 driver changes all w.r.t Tegra210
>> platforms specific.
>>
>> Suspend/resume support for other Tegras will be in separate patch series.
> 
> Okay, fair enough.
> 

It may also make some sense to split this patch into two:

 1) add generic tegra-pinctrl suspend-resume support
 2) add suspend-resume OPS to the pinctrl-tegra210

For consistency.
