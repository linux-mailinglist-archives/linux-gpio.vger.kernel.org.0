Return-Path: <linux-gpio+bounces-1056-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7956806D82
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Dec 2023 12:12:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27A591F2142F
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Dec 2023 11:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C04315A0;
	Wed,  6 Dec 2023 11:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="DlncmySJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FCDCCA
	for <linux-gpio@vger.kernel.org>; Wed,  6 Dec 2023 03:12:00 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a196f84d217so80700566b.3
        for <linux-gpio@vger.kernel.org>; Wed, 06 Dec 2023 03:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1701861119; x=1702465919; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dcUwLRWzoKCiLujNLbeBgYDSgnjO4m7YhLdFf0vhr4A=;
        b=DlncmySJI0BK09GpYxHKtmX5lq6kWZTu+SiBkeOU6alFzv21K4opxJnQMZQ35bi2aw
         KaeRLP0JT+qSl/jIXwIxniERDGPVmyxzwxrO1jEechOUwuVIIgmuZ5e+JbFfyZxcKHd0
         4JzXLkXx1Un11ugPboa5KhsJesspWH1ag2BjvEVBIih+Fp7H2sBKZf5f1NPEC5U940FQ
         JersVQ1FyvU4Jnr47TZVmGeug+OVT4yC2A2jbHbRhnMszJtAzU6aY4IleFCvoQEfmpMD
         nQ9m5Ynq+mL+LV50A1RBK1DwMfuAxtoz29tIhi6nvZNqAXhmDVOmdy+3wlbcRO+8srRp
         2K2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701861119; x=1702465919;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dcUwLRWzoKCiLujNLbeBgYDSgnjO4m7YhLdFf0vhr4A=;
        b=vCVSq2wpjzSOTPSTc9BbpP5yvCzibFYBin+TI000zD/PKBPMr2KKNvWaZCMOZDKkcb
         JItuCutaNZZSWK6UoDTn0ZQuJ2lUW+uXUzAHfPCBoBysADjVR9t8QORN6Wc+vIBZOqHR
         dLBb3fQcvtWrMNxgfEawJrO+4DV2RGNHuKXC9CMAn5PpG2LJ9/tWonJ2lF0N5GLHBrNw
         sJru9eGwcPr5y2LLUmbbUszR+mNXkPuSTCIlcpoSAb9/7DVB0AsSMB9z7ACXIokHZrj5
         z1B3U37siGSTxE79wdHmf2zIIg3MdX+oiEWoaiUNjVzx49/BNC9vPVQ3BcsITV7DepHQ
         CLbg==
X-Gm-Message-State: AOJu0YxDddUmZA8aHsCxh/JvUVph34vUH4qY4dIARsMwCAIuU2sSp/uZ
	uX7ftTiT30mRb41S4qsTUm6LHA==
X-Google-Smtp-Source: AGHT+IG3qcWvsI2ibZlg8aF3jqdwhI35Pva3o+lOtVXoK2FasThHPg+BRgLUAXOVFiJ2Rh0QB4rE+A==
X-Received: by 2002:a17:906:3f5b:b0:9ff:53b6:f951 with SMTP id f27-20020a1709063f5b00b009ff53b6f951mr451808ejj.23.1701861118706;
        Wed, 06 Dec 2023 03:11:58 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.22])
        by smtp.gmail.com with ESMTPSA id o26-20020a170906289a00b009e5ce1acb01sm8100203ejd.103.2023.12.06.03.11.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 03:11:58 -0800 (PST)
Message-ID: <248d24a9-589e-4b92-94b6-98504f78d7b9@tuxon.dev>
Date: Wed, 6 Dec 2023 13:11:55 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/14] arm64: renesas: rzg3s-smarc-som: Invert the logic
 for SW_SD2_EN macro
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 linux@armlinux.org.uk, geert+renesas@glider.be, magnus.damm@gmail.com,
 mturquette@baylibre.com, sboyd@kernel.org, linus.walleij@linaro.org,
 p.zabel@pengutronix.de, arnd@arndb.de, m.szyprowski@samsung.com,
 alexandre.torgue@foss.st.com, afd@ti.com, broonie@kernel.org,
 alexander.stein@ew.tq-group.com, eugen.hristev@collabora.com,
 sergei.shtylyov@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 biju.das.jz@bp.renesas.com, linux-renesas-soc@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20231120070024.4079344-1-claudiu.beznea.uj@bp.renesas.com>
 <20231120070024.4079344-12-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdUbKe=yiXWNmk5BJFLtF2psx9khiDRGasT9WsnHz4RWsg@mail.gmail.com>
 <CAMuHMdXwSo1L9UuFg9RL0TLL_xzVt2r6QEFc0gtPoydpr4FmSQ@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAMuHMdXwSo1L9UuFg9RL0TLL_xzVt2r6QEFc0gtPoydpr4FmSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 06.12.2023 12:56, Geert Uytterhoeven wrote:
> On Wed, Dec 6, 2023 at 11:33 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> On Mon, Nov 20, 2023 at 8:03 AM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>
>>> The intention of SW_SD2_EN macro was to reflect the state of SW_CONFIG3
>>> switch available on RZ/G3S Smarc Module. According to documentation SD2
>>> is enabled when switch is in OFF state. For this, changed the logic of
>>> marco to map value 0 to switch's OFF state and value 1 to switch's ON
>>> state. Along with this update the description for each state for better
>>> understanding.
>>>
>>> The value of SW_SD2_EN macro was not changed in file because, according to
>>> documentation, the default state for this switch is ON.
>>>
>>> Fixes: adb4f0c5699c ("arm64: dts: renesas: Add initial support for RZ/G3S SMARC SoM")
>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Thanks for your patch!
>>
>>> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
>>> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
>>> @@ -14,8 +14,8 @@
>>>   *     0 - SD0 is connected to eMMC
>>>   *     1 - SD0 is connected to uSD0 card
>>>   * @SW_SD2_EN:
>>> - *     0 - SCIF1, SSI0, IRQ0, IRQ1 connected to SoC
>>> - *     1 - SD2 is connected to SoC
>>> + *     0 - (switch OFF) SD2 is connected to SoC
>>> + *     1 - (switch ON)  SCIF1, SSI0, IRQ0, IRQ1 connected to SoC
>>
>> I think this is still confusing: SW_SD2_EN refers to an active-low signal
>> (SW_SD2_EN#) in the schematics.
> 
> OMG, while the signal is called "SW_SD2_EN#" in the schematics, it is
> _not_ active-low!
> SW_D2_EN# drives a STG3692 quad SPDT switch, and SD2 is enabled
> if SW_D2_EN# is high...
> 
> The RZ/G3S SMARC Module User Manual says:
> 
> Signal SW_SD2_EN ON: SD2 is disabled.
> Signal SW_SD2_EN OFF: SD2 is enabled.

I followed the description in this manual, chapter 2.1.1 SW_CONFIG. The
idea was that these macros to correspond to individual switches, to match
that table (describing switches position) with this code as the user in the
end sets those switches described in table at 2.1.1 w/o necessary going
deep into schematic (at least in the beginning when trying different
functionalities).

Do you think it would be better if we will have these macros named
SWCONFIGX, X in {1, 2, 3, 4, 5, 6} ?

> 
> So whatever we do, something will look odd :-(
> 
>> Before, SW_SD2_EN used assertion-logic (1 is enabled), and didn't
>> match the physical signal level.
>> After your patch, SW_SD2_EN matches the active-low physical level, but
>> this is not reflected in the name...
>>
>>>   */
>>>  #define SW_SD0_DEV_SEL 1
>>>  #define SW_SD2_EN      1
>>> @@ -25,7 +25,7 @@ / {
>>>
>>>         aliases {
>>>                 mmc0 = &sdhi0;
>>> -#if SW_SD2_EN
>>> +#if !SW_SD2_EN
>>
>> ... so this condition looks really weird.
> 
> Still, I think the original looks nicer here.
> 
> So I suggest to keep the original logic, but clarify the position of
> the switch.
> Does that make sense?

It will still be odd, AFAICT, as this way as we will map 0 to ON and 1 to
OFF... A bit counterintuitive.

> 
> 
>>
>>>                 mmc2 = &sdhi2;
>>>  #endif
>>>         };
>>> @@ -116,7 +116,7 @@ &sdhi0 {
>>>  };
>>>  #endif
>>>
>>> -#if SW_SD2_EN
>>> +#if !SW_SD2_EN
>>>  &sdhi2 {
>>>         pinctrl-0 = <&sdhi2_pins>;
>>>         pinctrl-names = "default";
>>
>> So I think SW_SD2_EN should be renamed to SW_SD2_EN_N.
>>
>> Cfr. SW_ET0_EN_N on RZ/G2UL:
>>
>> arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts- * DIP-Switch SW1 setting
>> arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts- * 1 : High; 0: Low
>> arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts- * SW1-2 :
>> SW_SD0_DEV_SEL    (0: uSD; 1: eMMC)
>> arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts- * SW1-3 :
>> SW_ET0_EN_N               (0: ETHER0; 1: CAN0, CAN1, SSI1, RSPI1)
>> arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts- * Please change
>> below macros according to SW1 setting on the SoM
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

