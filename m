Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 889D26F98E
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 08:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726895AbfGVGcu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 02:32:50 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44299 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726404AbfGVGcu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jul 2019 02:32:50 -0400
Received: by mail-lj1-f194.google.com with SMTP id k18so36382591ljc.11;
        Sun, 21 Jul 2019 23:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=h55/At6J9CPBgcZi6TKTS0lA6V1xQY/1tTGwqlNw1zk=;
        b=ljAal1kR5KGX+wRGnJq40om8Wl6IjXl+mVeajXd6ZNkrv5WYeb/JSG92+Q9ONBeUKX
         nBuuAkie/JgNdn8zNBfGXXrqIvIdyNTTIjeVr6JOtXoywGlgnFB4Y81VoWbO7ClfTuB5
         nMcKjQfncwK9oeXbxZH8JdVbR9uBCObC+VVV0RFJFng7B/p1dLIBCvRWVZ3DoaEEdOlx
         hBBRRwxUNssFpFuarPIf6HLegHch0ZvMs9NCZEXLI87SvA4qRkL/Pz/TGXSKLQK9Zlag
         /5EbwMv//4zhY7t83O0eHxErifgAgoLjuLBtP8Gb4XwirGW5lPy5CvU483MMCyPavjD1
         aG9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=h55/At6J9CPBgcZi6TKTS0lA6V1xQY/1tTGwqlNw1zk=;
        b=kaJg1NbQZC5kf+TP4vYWTLLxIUKha0Atm8zBtn5W7uGeapD6rfV2LIhX8bD7x7j+fi
         51adyD3tYuQtcRxdJhDQ43lz5g3V6ymzaBvRRwn/d71uhKwhNwW3t3QlBgVqq54K1ibi
         aIv4YtEcsvi/qqF8PpkYz7i4o8U1agUa2chlRs+XlhbuDFbnlXLsPX0JBBJuyFSbpJvb
         pDaZjEBt9xNlwUCEYDHdAvub9g2yux+R7nnOSfVJ34lLPZtBAzsCH89Ryja/gB3k0dwh
         T3eQSYh+27JYLxOy/hb/JAvqu+fUGQkaPru/hk2K6sazIYOgTxCkf5NxriI6oZmC/Hwo
         8ptg==
X-Gm-Message-State: APjAAAXdUNvm0q0KbsqvLW96RnxVYeClYMeO26cVCvXfhSg2Rw2OKSHL
        71b7j1NRL5jrksqyuVtjgV2AdqM0
X-Google-Smtp-Source: APXvYqz17T7X33n+IASByssuuS0S1B+eW/snQjI/d/9WOVA9iXgDePtDVEGadkagJbxazhQvIpl5Cw==
X-Received: by 2002:a2e:9ac6:: with SMTP id p6mr18888797ljj.100.1563777167013;
        Sun, 21 Jul 2019 23:32:47 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id e12sm5824916lfb.66.2019.07.21.23.32.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 21 Jul 2019 23:32:45 -0700 (PDT)
Subject: Re: [PATCH V6 09/21] clk: tegra: clk-super: Fix to enable PLLP
 branches to CPU
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
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
 <1563738060-30213-10-git-send-email-skomatineni@nvidia.com>
 <0c86cd7f-81b5-40c5-6f1e-796e8f13b522@gmail.com>
 <042f4b43-7b9c-533d-2548-d903b34363da@nvidia.com>
 <7933a83c-3208-b551-d41d-70285ae528e3@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f6ac50af-c3a5-1fef-2e0d-a9ecadeb2495@gmail.com>
Date:   Mon, 22 Jul 2019 09:32:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <7933a83c-3208-b551-d41d-70285ae528e3@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

22.07.2019 6:17, Sowjanya Komatineni пишет:
> 
> On 7/21/19 3:39 PM, Sowjanya Komatineni wrote:
>>
>> On 7/21/19 2:16 PM, Dmitry Osipenko wrote:
>>> 21.07.2019 22:40, Sowjanya Komatineni пишет:
>>>> This patch has a fix to enable PLLP branches to CPU before changing
>>>> the CPU clusters clock source to PLLP for Gen5 Super clock.
>>>>
>>>> During system suspend entry and exit, CPU source will be switched
>>>> to PLLP and this needs PLLP branches to be enabled to CPU prior to
>>>> the switch.
>>>>
>>>> On system resume, warmboot code enables PLLP branches to CPU and
>>>> powers up the CPU with PLLP clock source.
>>>>
>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>> ---
>>>>   drivers/clk/tegra/clk-super.c            | 11 +++++++++++
>>>>   drivers/clk/tegra/clk-tegra-super-gen4.c |  4 ++--
>>>>   drivers/clk/tegra/clk.h                  |  4 ++++
>>>>   3 files changed, 17 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/clk/tegra/clk-super.c
>>>> b/drivers/clk/tegra/clk-super.c
>>>> index 39ef31b46df5..d73c587e4853 100644
>>>> --- a/drivers/clk/tegra/clk-super.c
>>>> +++ b/drivers/clk/tegra/clk-super.c
>>>> @@ -28,6 +28,9 @@
>>>>   #define super_state_to_src_shift(m, s) ((m->width * s))
>>>>   #define super_state_to_src_mask(m) (((1 << m->width) - 1))
>>>>   +#define CCLK_SRC_PLLP_OUT0 4
>>>> +#define CCLK_SRC_PLLP_OUT4 5
>>>> +
>>>>   static u8 clk_super_get_parent(struct clk_hw *hw)
>>>>   {
>>>>       struct tegra_clk_super_mux *mux = to_clk_super_mux(hw);
>>>> @@ -97,6 +100,14 @@ static int clk_super_set_parent(struct clk_hw
>>>> *hw, u8 index)
>>>>           if (index == mux->div2_index)
>>>>               index = mux->pllx_index;
>>>>       }
>>>> +
>>>> +    /*
>>>> +     * Enable PLLP branches to CPU before selecting PLLP source
>>>> +     */
>>>> +    if ((mux->flags & TEGRA_CPU_CLK) &&
>>>> +        ((index == CCLK_SRC_PLLP_OUT0) || (index ==
>>>> CCLK_SRC_PLLP_OUT4)))
>>>> +        tegra_clk_set_pllp_out_cpu(true);
>>> Should somewhere here be tegra_clk_set_pllp_out_cpu(false) when
>>> switching from PLLP?
>> PLLP may be used for other CPU clusters.
> 
> Though to avoid flag and check needed to make sure other CPU is not
> using before disabling PLLP branch to CPU.
> 
> But leaving it enabled shouldn't impact much as clock source mux is
> after this in design anyway.
> 
> But can add as well if its clear that way.

The TRM doc says "The CPU subsystem supports a switch-cluster mode
meaning that only one of the clusters can be active at any given time".

Given that cluster-switching isn't supported in upstream, I don't think
that you need to care about the other cluster at all, at least for now.

The cluster-switching implementation in upstream is very complicated
because it requires a special "hotplugging" CPU governor, which
apparently no other platform needs.

[snip]
