Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FED05E321
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2019 13:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbfGCLuF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Jul 2019 07:50:05 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37395 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726621AbfGCLuF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jul 2019 07:50:05 -0400
Received: by mail-wr1-f68.google.com with SMTP id v14so2461913wrr.4
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jul 2019 04:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=7uvBYhEU4nI128pEYv9ytFvk53eb5435th+fm03iKcg=;
        b=DF/MFQ6MyohAUyQB2wmDmAbZiJgzfmk8k3Dx5wuKjOqnkBkYXOacFlm9t/CjjsIh1J
         evCwgD5PqOt6Z4bxpDCttR3ylIAyjOtAHUi7dIvqKvipf9pyi/1PPUvdPAFZqZkQXvJ1
         aQ8WAJWotfS9Z3BYLvuExGSceD7EhMpij4qtLo+iA0MRFCoXywBCAt5Wr/6oJTheDqw2
         BrbbdzdvVOV27geEvbpljdzf6v9ZdWRRmEgWuc3/FUicZrUMMtAphstTsZ5ILoxZHrm3
         IVER9PwQZ+dBfxWOXghi1GwFz/fhSeBZfWjxT+ee5tjKz+b2oE8Er65AR2SWMfUvR8Md
         qaSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=7uvBYhEU4nI128pEYv9ytFvk53eb5435th+fm03iKcg=;
        b=IN3IQXq8eNxIgMVls+Vzc8rGc4aaI7IkOhQkGJq2uQwSo5FuPFmP7CbP+HndExyf2v
         u7bxxcvBiXqciTsrndVFtBkREszK5Xdc5Yz9YVFrzQ0PzcVtWyoGvbEBY/bkzx4dkWtv
         xvtcm6waBA0kdee4GmHDTAwgMDus1qpCRKo/MNIuuNr2H+DkmLYTQhGwh9sLLcv08XEd
         swj4mlcnosCtSwQGR8h5/bhxGpDCouAzFmhj4Tu34iT+M1OJZk7J5RKgCDSGkru8YXdv
         7wwVcJqRVr5gmjjfNf2aT6wiOD3np7LlINmrZsRDJmaHKKSSJo1UWYcFBeI5tJOoxO8n
         WaLw==
X-Gm-Message-State: APjAAAUwQS/dCH4zB5VqRdja6QNFKYNc78AL4u53vMJEiMe+8TE3G3jM
        gcpj5Eb5U+tdAxYnTx0pE6VeXV2HMHg=
X-Google-Smtp-Source: APXvYqzi0wTHbPFiBrdoZu2OelnCAbLZIwrt4pfCou5ILbK1Fv7JdHGkIwxmjqqLpFmGcgxHUgKUmw==
X-Received: by 2002:adf:ec12:: with SMTP id x18mr28390898wrn.145.1562154601634;
        Wed, 03 Jul 2019 04:50:01 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id v204sm3152548wma.20.2019.07.03.04.50.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 04:50:01 -0700 (PDT)
Subject: Re: [RFC/RFT v3 07/14] clk: meson: g12a: add notifiers to handle cpu
 clock change
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        sboyd@codeaurora.org
Cc:     jbrunet@baylibre.com, khilman@baylibre.com,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20190701091258.3870-1-narmstrong@baylibre.com>
 <20190701091258.3870-8-narmstrong@baylibre.com>
 <CAFBinCAnKeGYkyCmEMugWuQaSxgBp4DqtHN3b0rLJY6jwOF0QA@mail.gmail.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <369f5e9b-b02a-5f5c-25a7-49803650e9c5@baylibre.com>
Date:   Wed, 3 Jul 2019 13:50:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCAnKeGYkyCmEMugWuQaSxgBp4DqtHN3b0rLJY6jwOF0QA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 03/07/2019 01:28, Martin Blumenstingl wrote:
> Hi Stephen, Hi Neil,
> 
> On Mon, Jul 1, 2019 at 11:13 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> In order to implement clock switching for the CLKID_CPU_CLK and
>> CLKID_CPUB_CLK, notifiers are added on specific points of the
>> clock tree :
>>
>> cpu_clk / cpub_clk
>> |   \- cpu_clk_dyn
>> |      |  \- cpu_clk_premux0
>> |      |        |- cpu_clk_postmux0
>> |      |        |    |- cpu_clk_dyn0_div
>> |      |        |    \- xtal/fclk_div2/fclk_div3
>> |      |        \- xtal/fclk_div2/fclk_div3
>> |      \- cpu_clk_premux1
>> |            |- cpu_clk_postmux1
>> |            |    |- cpu_clk_dyn1_div
>> |            |    \- xtal/fclk_div2/fclk_div3
>> |            \- xtal/fclk_div2/fclk_div3
>> \ sys_pll / sys1_pll
>>
>> This for each cluster, a single one for G12A, two for G12B.
>>
>> Each cpu_clk_premux1 tree is marked as read-only and CLK_SET_RATE_NO_REPARENT,
>> to be used as "parking" clock in a safe clock frequency.
> it seems that this is one case where the "coordinated clocks" feature
> would come handy: [0]

We could still migrate over it later on.

> Stephen, do you know if those patches stopped in March or if there's
> still some ongoing effort to get them ready?
> 
> [...]
>> -/*
>> - * Internal sys pll emulation configuration parameters
>> - */
>> -static const struct reg_sequence g12a_sys_init_regs[] = {
>> -       { .reg = HHI_SYS_PLL_CNTL1,     .def = 0x00000000 },
>> -       { .reg = HHI_SYS_PLL_CNTL2,     .def = 0x00000000 },
>> -       { .reg = HHI_SYS_PLL_CNTL3,     .def = 0x48681c00 },
>> -       { .reg = HHI_SYS_PLL_CNTL4,     .def = 0x88770290 },
>> -       { .reg = HHI_SYS_PLL_CNTL5,     .def = 0x39272000 },
>> -       { .reg = HHI_SYS_PLL_CNTL6,     .def = 0x56540000 },
>> +static const struct pll_mult_range g12a_sys_pll_mult_range = {
>> +       .min = 128,
>> +       .max = 250,
>>  };
>>
>>  static struct clk_regmap g12a_sys_pll_dco = {
>> @@ -124,14 +118,15 @@ static struct clk_regmap g12a_sys_pll_dco = {
>>                         .shift   = 29,
>>                         .width   = 1,
>>                 },
>> -               .init_regs = g12a_sys_init_regs,
>> -               .init_count = ARRAY_SIZE(g12a_sys_init_regs),
>> +               .range = &g12a_sys_pll_mult_range,
> Neil, I believe that this should be a separate patch with a
> description which explains why we don't need the "init regs" anymore

Sure

> 
>>         },
>>         .hw.init = &(struct clk_init_data){
>>                 .name = "sys_pll_dco",
>> -               .ops = &meson_clk_pll_ro_ops,
>> +               .ops = &meson_clk_pll_ops,
>>                 .parent_names = (const char *[]){ IN_PREFIX "xtal" },
>>                 .num_parents = 1,
>> +               /* This clock feeds the CPU, avoid disabling it */
>> +               .flags = CLK_IS_CRITICAL,
> maybe we should have a separate patch for making the CPU clock tree
> mutable as well

Indeed

> 
> [...]
>> +/* This divider uses bit 26 to take change in account */
>> +static int g12b_cpub_clk_mux0_div_set_rate(struct clk_hw *hw,
>> +                                          unsigned long rate,
>> +                                          unsigned long parent_rate)
>> +{
>> +       struct clk_regmap *clk = to_clk_regmap(hw);
>> +       struct clk_regmap_div_data *div = clk_get_regmap_div_data(clk);
>> +       unsigned int val;
>> +       int ret;
>> +
>> +       ret = divider_get_val(rate, parent_rate, div->table, div->width,
>> +                             div->flags);
>> +       if (ret < 0)
>> +               return ret;
>> +
>> +       val = (unsigned int)ret << div->shift;
>> +
>> +       regmap_update_bits(clk->map, HHI_SYS_CPUB_CLK_CNTL,
>> +                          SYS_CPU_DYN_ENABLE, SYS_CPU_DYN_ENABLE);
>> +
>> +       return regmap_update_bits(clk->map, div->offset,
>> +                                 clk_div_mask(div->width) << div->shift |
>> +                                 SYS_CPU_DYN_ENABLE, val);
>> +};
> the public S922X datasheet doesn't mention bit 26
> do I understand the semantics correctly?:
> - set SYS_CPU_DYN_ENABLE
> - update the divider
> - unset SYS_CPU_DYN_ENABLE

Exact, it's how Amlogic uses it, seems the HW takes the divider value
only on the "falling edge" of this bit !

> 
> too bad it's not a gate which we could model with
> CLK_SET_RATE_GATE/CLK_SET_RATE_UNGATE

Yep, but it only works when I write the new divider value *and* I remove the bit.
It must be a glitch-free divider mechanism.

Neil

> 
> 
> Martin
> 
> [0] https://patchwork.kernel.org/patch/10838949/
> 

