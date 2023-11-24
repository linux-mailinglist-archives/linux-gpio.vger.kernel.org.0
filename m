Return-Path: <linux-gpio+bounces-462-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 614057F6F7C
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 10:25:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 94C45B20FF1
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 09:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C51DDCD;
	Fri, 24 Nov 2023 09:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Co9JE82E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8272DD72
	for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 01:24:44 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a02cc476581so225158666b.2
        for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 01:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700817883; x=1701422683; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tP7iDHeY/GImPwmVPQj8nL6E/oGA2tu11UlMq0fOEuY=;
        b=Co9JE82EK+QdDBxpvOsoAHUn9KmvE0NtViDmEyaS7ge1lpXFI45ON5XgjBjj3asx6q
         hKJ8ZH3y9GYcnygpbeZmZw01S19IlBVfJU1nnElZ2VP5Dw70GiLoxvJvYoWCRcNDHtKL
         ++YDCJ6NO8NvMGXfxvi1X86dZTYxCR6ewIidNJ/X/qHKMuPmn4GWow+g9tcEWDPoT248
         FOeqyRcJwMM4sAff7/ipjeu9xZZuC4C1pUVlJsrAP8f8yWYA8Bkc1o6Zhzj8NDRHFCc5
         1+UDsoQMtl1/S/ONDXk3Wzw33FglMSu66mo/LBRelD9qgusDT6tvqp+UX/G2Ux+pjnhj
         5gUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700817883; x=1701422683;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tP7iDHeY/GImPwmVPQj8nL6E/oGA2tu11UlMq0fOEuY=;
        b=IjHur9s1h/4kLYdP12WvLzxoPx1hGeP5aXQW1A4+YG3kDRGswtLIgr+TCtBj+YVOm1
         v3y5UjtA5EauCoSMA9myJHwZ/GMNMIN+PbVHxazllkU3MRSVw75HEduiKJv/cN+QjaH1
         rokkJYZUWF/xWpilXv13LqD5lY2b+FhY3e5lGj/TMiYOVl0UqHJo1oyYwezI887K5pUo
         fumXJnS0qwfM9FDJ0X9QWmr+0Jot3JKoeCu6/oJ2T7d6XpWK7uS7IKhg0Qa4M6vJXqYw
         fd7T3l5347vhQqP0/MQsSEQFjbRecqhq7hB4KHp1LKl2f7IyeLpUoaKP9PAW0U2xR9Le
         4FNQ==
X-Gm-Message-State: AOJu0Yy5nhxxEuwTAH1L+pk6vIgHLqlvZa4PKoPxa6LhJGHMs5opZIms
	gumpWRBCx3jUNFAhVDzfkieWRw==
X-Google-Smtp-Source: AGHT+IF5wnmdU+9Ge45kUoBqgtGwPWqSG7G8vXh5qyjB+1hbTEU57wYmB+BsFMxgRrbV9yMfGGawnQ==
X-Received: by 2002:a17:906:2c45:b0:9da:eefb:854c with SMTP id f5-20020a1709062c4500b009daeefb854cmr1507598ejh.25.1700817882750;
        Fri, 24 Nov 2023 01:24:42 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.3])
        by smtp.gmail.com with ESMTPSA id dv23-20020a170906b81700b009fc6e3ef4e4sm1808465ejb.42.2023.11.24.01.24.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Nov 2023 01:24:42 -0800 (PST)
Message-ID: <a162c0df-6c1d-4cdf-a25e-528c79106374@tuxon.dev>
Date: Fri, 24 Nov 2023 11:24:39 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/14] clk: renesas: rzg2l-cpg: Add support for MSTOP
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 linux@armlinux.org.uk, magnus.damm@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org, linus.walleij@linaro.org, p.zabel@pengutronix.de,
 arnd@arndb.de, m.szyprowski@samsung.com, alexandre.torgue@foss.st.com,
 afd@ti.com, broonie@kernel.org, alexander.stein@ew.tq-group.com,
 eugen.hristev@collabora.com, sergei.shtylyov@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, biju.das.jz@bp.renesas.com,
 linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20231120070024.4079344-1-claudiu.beznea.uj@bp.renesas.com>
 <20231120070024.4079344-4-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdVMpKVY8WX7dbtHfgnwgePH+i9+2BAumb37sFmqccb44g@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAMuHMdVMpKVY8WX7dbtHfgnwgePH+i9+2BAumb37sFmqccb44g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 23.11.2023 18:35, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Mon, Nov 20, 2023 at 8:01 AM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> RZ/{G2L, V2L, G3S} based CPG versions have support for saving extra
>> power when clocks are disabled by activating module standby. This is done
>> though MSTOP specific registers that are part of CPG. Each individual
>> module have one or more bits associated in one MSTOP register (see table
>> "Registers for Module Standby Mode" from HW manuals). Hardware manual
>> associates modules' clocks to one or more MSTOP bits. There are 3 mappings
>> available (identified by researching RZ/G2L, RZ/G3S, RZ/V2L HW manuals):
>>
>> case 1: N clocks mapped to N MSTOP bits (with N={0, ..., X})
>> case 2: N clocks mapped to 1 MSTOP bit  (with N={0, ..., X})
>> case 3: N clocks mapped to M MSTOP bits (with N={0, ..., X}, M={0, ..., Y})
>>
>> Case 3 has been currently identified on RZ/V2L for VCPL4 module.
>>
>> To cover all 3 cases the individual platform drivers will provide to
>> clock driver MSTOP register offset and associated bits in this register
>> as a bitmask and the clock driver will apply this bitmask to proper
>> MSTOP register.
>>
>> As most of the modules have more than one clock and these clocks are
>> mapped to 1 MSTOP bitmap that need to be applied to MSTOP registers,
>> to avoid switching the module to/out of standby when the module has
>> enabled/disabled clocks a counter has been associated to each module
>> (though struct mstop::count) which is incremented/decremented every
>> time a module's clock is enabled/disabled and the settings to MSTOP
>> register are applied only when the counter reaches zero (counter zero
>> means either 1st clock of the module is going to be enabled or all clocks
>> of the module are going to be disabled).
> 
> Thanks for your patch!
> 
>> The MSTOP functionality has been instantiated at the moment for RZ/G3S.
> 
> Do you plan to add support for the other SoCs, too?

Yes.

> 
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
>> --- a/drivers/clk/renesas/r9a08g045-cpg.c
>> +++ b/drivers/clk/renesas/r9a08g045-cpg.c
>> @@ -187,23 +187,39 @@ static const struct cpg_core_clk r9a08g045_core_clks[] __initconst = {
>>  };
>>
>>  static const struct rzg2l_mod_clk r9a08g045_mod_clks[] = {
>> -       DEF_MOD("gic_gicclk",           R9A08G045_GIC600_GICCLK, R9A08G045_CLK_P1, 0x514, 0),
>> -       DEF_MOD("ia55_clk",             R9A08G045_IA55_CLK, R9A08G045_CLK_P1, 0x518, 1),
>> -       DEF_MOD("dmac_aclk",            R9A08G045_DMAC_ACLK, R9A08G045_CLK_P3, 0x52c, 0),
>> -       DEF_MOD("sdhi0_imclk",          R9A08G045_SDHI0_IMCLK, CLK_SD0_DIV4, 0x554, 0),
>> -       DEF_MOD("sdhi0_imclk2",         R9A08G045_SDHI0_IMCLK2, CLK_SD0_DIV4, 0x554, 1),
>> -       DEF_MOD("sdhi0_clk_hs",         R9A08G045_SDHI0_CLK_HS, R9A08G045_CLK_SD0, 0x554, 2),
>> -       DEF_MOD("sdhi0_aclk",           R9A08G045_SDHI0_ACLK, R9A08G045_CLK_P1, 0x554, 3),
>> -       DEF_MOD("sdhi1_imclk",          R9A08G045_SDHI1_IMCLK, CLK_SD1_DIV4, 0x554, 4),
>> -       DEF_MOD("sdhi1_imclk2",         R9A08G045_SDHI1_IMCLK2, CLK_SD1_DIV4, 0x554, 5),
>> -       DEF_MOD("sdhi1_clk_hs",         R9A08G045_SDHI1_CLK_HS, R9A08G045_CLK_SD1, 0x554, 6),
>> -       DEF_MOD("sdhi1_aclk",           R9A08G045_SDHI1_ACLK, R9A08G045_CLK_P1, 0x554, 7),
>> -       DEF_MOD("sdhi2_imclk",          R9A08G045_SDHI2_IMCLK, CLK_SD2_DIV4, 0x554, 8),
>> -       DEF_MOD("sdhi2_imclk2",         R9A08G045_SDHI2_IMCLK2, CLK_SD2_DIV4, 0x554, 9),
>> -       DEF_MOD("sdhi2_clk_hs",         R9A08G045_SDHI2_CLK_HS, R9A08G045_CLK_SD2, 0x554, 10),
>> -       DEF_MOD("sdhi2_aclk",           R9A08G045_SDHI2_ACLK, R9A08G045_CLK_P1, 0x554, 11),
>> -       DEF_MOD("scif0_clk_pck",        R9A08G045_SCIF0_CLK_PCK, R9A08G045_CLK_P0, 0x584, 0),
>> -       DEF_MOD("gpio_hclk",            R9A08G045_GPIO_HCLK, R9A08G045_OSCCLK, 0x598, 0),
>> +       DEF_MOD("gic_gicclk",           R9A08G045_GIC600_GICCLK, R9A08G045_CLK_P1, 0x514, 0,
>> +                                       MSTOP(ACPU, BIT(3))),
> 
> According to Rev. 1.00 of the Hardware User's Manual, bit 3 of the
> CPG_BUS_ACPU_MSTOP register is reserved?

Hm... you're right. I've followed table 44.4 Registers for Module Standby
Mode to populate MSTOPs in r9a08g045_mod_clks[]. That table indicates bit 3
for GIC.

> 
> Also, gic_gicclk is a critical module clock, so I guess this module
> must never be put into standby?

Good point. I'll remove the MSTOPs for critical clocks.

> 
>> --- a/drivers/clk/renesas/rzg2l-cpg.c
>> +++ b/drivers/clk/renesas/rzg2l-cpg.c
>> @@ -1177,6 +1177,17 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
>>                 core->name, PTR_ERR(clk));
>>  }
>>
>> +/**
>> + * struct mstop - MSTOP specific data structure
>> + * @count: reference counter for MSTOP settings (when zero the settings
>> + *        are applied to register)
>> + * @conf: MSTOP configuration (register offset, setup bits)
>> + */
>> +struct mstop {
>> +       u32 count;
>> +       u32 conf;
>> +};
>> +
>>  /**
>>   * struct mstp_clock - MSTP gating clock
>>   *
>> @@ -1186,6 +1197,7 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
>>   * @enabled: soft state of the clock, if it is coupled with another clock
>>   * @priv: CPG/MSTP private data
>>   * @sibling: pointer to the other coupled clock
>> + * @mstop: MSTOP configuration
>>   */
>>  struct mstp_clock {
>>         struct clk_hw hw;
>> @@ -1194,10 +1206,46 @@ struct mstp_clock {
>>         bool enabled;
>>         struct rzg2l_cpg_priv *priv;
>>         struct mstp_clock *sibling;
>> +       struct mstop *mstop;
>>  };
>>
>>  #define to_mod_clock(_hw) container_of(_hw, struct mstp_clock, hw)
>>
>> +/* Need to be called with a lock held to avoid concurent access to mstop->count. */
> 
> concurrent
> 
>> +static void rzg2l_mod_clock_module_set_standby(struct mstp_clock *clock,
>> +                                              bool standby)
>> +{
>> +       struct rzg2l_cpg_priv *priv = clock->priv;
>> +       struct mstop *mstop = clock->mstop;
>> +       bool update = false;
>> +       u32 value;
>> +
>> +       if (!mstop)
>> +               return;
>> +
>> +       value = MSTOP_MASK(mstop->conf) << 16;
>> +
>> +       if (standby) {
>> +               value |= MSTOP_MASK(mstop->conf);
>> +               /* Avoid overflow. */
>> +               if (mstop->count > 0)
>> +                       mstop->count--;
> 
> Should we add a WARN() here, or is it sufficient to rely on the WARN()
> in drivers/clk/clk.c:clk_core_disable()?

I think it would be good to have it as mstop->count could be
incremented/decremented by more than one clock and could overflow faster
than struct clk_core::enable_count

> 
>> +
>> +               if (!mstop->count)
>> +                       update = true;
>> +       } else {
>> +               if (!mstop->count)
>> +                       update = true;
>> +
>> +               /* Avoid overflow. */
>> +               if (mstop->count + 1 != 0)
>> +                       mstop->count++;
> 
> Trying to avoid an overflow won't help much here.  The counter
> will be wrong afterwards anyway, and when decrementing again later, the
> module will be put in standby too soon...

That's true. Would you prefer to have a WARN() for this too?

> 
>> +       }
>> +
>> +       if (update)
>> +               writel(value, priv->base + MSTOP_OFF(mstop->conf));
>> +}
>> +
>>  static int rzg2l_mod_clock_endisable(struct clk_hw *hw, bool enable)
>>  {
>>         struct mstp_clock *clock = to_mod_clock(hw);
> 
>> @@ -1401,6 +1474,37 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
>>                 }
>>         }
>>
>> +       if (mod->mstop_conf) {
>> +               struct mstop *mstop = rzg2l_mod_clock_get_mstop(priv, mod->mstop_conf);
>> +
>> +               if (mstop) {
>> +                       clock->mstop = mstop;
> 
> Please move the common assignment after the if/else block...
> 
>> +               } else {
> 
> ... so this can just become "if (!mstop) {".

Ok, I'll review it.

> 
>> +                       mstop = devm_kzalloc(dev, sizeof(*mstop), GFP_KERNEL);
>> +                       if (!mstop) {
>> +                               clk_unregister(clk);
>> +                               goto fail;
> 
> Please use "goto unregister", and call clk_unregister() after the new
> unregister label.

I kept it like this as I considered otherwise the error path might become
unnecessary complicated.

> 
>> +                       }
>> +
>> +                       mstop->conf = mod->mstop_conf;
>> +                       clock->mstop = mstop;
>> +               }
>> +
>> +               if (rzg2l_mod_clock_is_enabled(&clock->hw)) {
>> +                       if (clock->sibling)
>> +                               clock->mstop->count = 1;
>> +                       else
>> +                               clock->mstop->count++;
>> +               }
>> +
>> +               /*
>> +                * Out of reset all modules are enabled. Set module to standby
>> +                * in case associated clocks are disabled at probe.
> 
> Is that always true?
> What about kexec and crashdump kernels?

I was referring to the hardware reset. In case we reach this point with
clocks already enabled by a previous kernel the state of the clocks in
hardware should be enabled and the mstop->count should be updated
accordingly by the above if block. Let me know if I'm missing something.

> 
>> +                */
>> +               if (!clock->mstop->count)
>> +                       rzg2l_mod_clock_module_set_standby(clock, true);
>> +       }
>> +
>>         return;
>>
>>  fail:
>> diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
>> index 6e38c8fc888c..10ee8aa4a5da 100644
>> --- a/drivers/clk/renesas/rzg2l-cpg.h
>> +++ b/drivers/clk/renesas/rzg2l-cpg.h
> 
>> @@ -68,6 +73,10 @@
>>  #define SEL_PLL6_2     SEL_PLL_PACK(CPG_PL6_ETH_SSEL, 0, 1)
>>  #define SEL_GPU2       SEL_PLL_PACK(CPG_PL6_SSEL, 12, 1)
>>
>> +#define MSTOP(name, bitmask)   ((CPG_##name##_MSTOP) << 16 | (bitmask))
> 
> I believe the bitmask is always a single bit.
> So perhaps let MSTOP() take the bit number instead of the bitmaskl?
> You can still store BIT(bit) inside the macro.

It is not always the case. That is why I've added the bitmask. The
identified scenarios are highlighted in commit description:

case 1: N clocks mapped to N MSTOP bits (with N={0, ..., X})
case 2: N clocks mapped to 1 MSTOP bit  (with N={0, ..., X})
case 3: N clocks mapped to M MSTOP bits (with N={0, ..., X}, M={0, ..., Y})

Thank you for your review,
Claudiu Beznea

> 
>> +#define MSTOP_OFF(conf)                ((conf) >> 16)
>> +#define MSTOP_MASK(conf)       ((conf) & GENMASK(15, 0))
>> +
>>  #define EXTAL_FREQ_IN_MEGA_HZ  (24)
>>
>>  /**
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

