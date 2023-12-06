Return-Path: <linux-gpio+bounces-1058-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 27648806E07
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Dec 2023 12:31:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5A5E281C03
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Dec 2023 11:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58E92321A5;
	Wed,  6 Dec 2023 11:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="OAc93qBc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBAD6DE
	for <linux-gpio@vger.kernel.org>; Wed,  6 Dec 2023 03:31:38 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a1db6816177so61969466b.0
        for <linux-gpio@vger.kernel.org>; Wed, 06 Dec 2023 03:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1701862297; x=1702467097; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BQRUqPOJl21pxtz+qvje3X0j5jgtYYR7vWEnGFon7J0=;
        b=OAc93qBcLB0JINXohmFJNv5Ts61bZbpqAHTl0zkR9MjIADcMXHb53F1aoWWBGyK7YY
         KtdTd3LNzyUJZTK1ZJBZmUrXMBPhNLAHwZnKk28SgAJz1DGTGQYqJqp4GPeeezp3CN3Q
         HrAMF70lAM/AHzMwFRPDIwXK1sAyB6UWzOOiAHIAZLwDt9cF74Ymjlami7W2ZDWCC80k
         xJXMMGlTHUqTcpnReSs5FUPlqgfMcBuxViPpU9Hig8wpzCuQiFOrQkPqfawboCG+K7fW
         wYgsfUrNOPd4deWhMDLQ1Fpvb+LKGohHxXY/cT6pXqtyQ49FIoEuFOKG6orXGeJSxDRR
         g1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701862297; x=1702467097;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BQRUqPOJl21pxtz+qvje3X0j5jgtYYR7vWEnGFon7J0=;
        b=GjJcvEq7wdEsJDPRxbzT1DYXL9vXpcqaHhJyetjaS8jyU3gIY0U5Ndu2fSq3o6OMWj
         MXW/VVUwUYd0SWJ5r9OiZbr9ZP/p2pZpVMROVZiXlVF0fnUGxJFRFIAO3T8gZ+NYvtKQ
         /brIGHUmHWeIptpqizMaU1bN1GYawoh+esBfqB2sr5hCszd2zqaP6a0eTGdPKu8/8gca
         xyeaWr7RRkCDG60Wij2bqgLriJ/sgelhrXqkRPlthmfwdanH3grlY4B0yp4ExQbXLPDP
         TpyGpx0SqSP948nS5rr0YmtBfz3xbaso39khhqCrgGII/UsLa0NS2goZM7MYNDq0eMNM
         ClrA==
X-Gm-Message-State: AOJu0YyOjMub/J8BhMU234TlqivQQRyaZ2BSgMllBBbl4K6CJIGDUh9a
	wzquq+zlw9fqgUTgDbmPb94xFQ==
X-Google-Smtp-Source: AGHT+IFJ5a4vYKI7Ln74gNmwZjaExprtFCgmvccSvvLloul8tJqzuxrCdC0bjxwuxKyuhboAbKrUYQ==
X-Received: by 2002:a17:906:358e:b0:a1a:5cbf:4b5a with SMTP id o14-20020a170906358e00b00a1a5cbf4b5amr370491ejb.104.1701862297106;
        Wed, 06 Dec 2023 03:31:37 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.22])
        by smtp.gmail.com with ESMTPSA id hd18-20020a170907969200b00a1cbb289a7csm2054875ejc.183.2023.12.06.03.31.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 03:31:36 -0800 (PST)
Message-ID: <6e14077c-ceb6-4921-8db2-1dc4a99856c6@tuxon.dev>
Date: Wed, 6 Dec 2023 13:31:32 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/14] arm64: renesas: rzg3s-smarc-som: Invert the logic
 for SW_SD2_EN macro
Content-Language: en-US
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
 <248d24a9-589e-4b92-94b6-98504f78d7b9@tuxon.dev>
 <CAMuHMdXo9Pj1NJ+XK-XKj18ynZ3gOxrXQpjMsTjfziTAyjYMdA@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdXo9Pj1NJ+XK-XKj18ynZ3gOxrXQpjMsTjfziTAyjYMdA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 06.12.2023 13:27, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Wed, Dec 6, 2023 at 12:12 PM claudiu beznea <claudiu.beznea@tuxon.dev> wrote:
>> On 06.12.2023 12:56, Geert Uytterhoeven wrote:
>>> On Wed, Dec 6, 2023 at 11:33 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>>> On Mon, Nov 20, 2023 at 8:03 AM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>
>>>>> The intention of SW_SD2_EN macro was to reflect the state of SW_CONFIG3
>>>>> switch available on RZ/G3S Smarc Module. According to documentation SD2
>>>>> is enabled when switch is in OFF state. For this, changed the logic of
>>>>> marco to map value 0 to switch's OFF state and value 1 to switch's ON
>>>>> state. Along with this update the description for each state for better
>>>>> understanding.
>>>>>
>>>>> The value of SW_SD2_EN macro was not changed in file because, according to
>>>>> documentation, the default state for this switch is ON.
>>>>>
>>>>> Fixes: adb4f0c5699c ("arm64: dts: renesas: Add initial support for RZ/G3S SMARC SoM")
>>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>
>>>> Thanks for your patch!
>>>>
>>>>> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
>>>>> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
>>>>> @@ -14,8 +14,8 @@
>>>>>   *     0 - SD0 is connected to eMMC
>>>>>   *     1 - SD0 is connected to uSD0 card
>>>>>   * @SW_SD2_EN:
>>>>> - *     0 - SCIF1, SSI0, IRQ0, IRQ1 connected to SoC
>>>>> - *     1 - SD2 is connected to SoC
>>>>> + *     0 - (switch OFF) SD2 is connected to SoC
>>>>> + *     1 - (switch ON)  SCIF1, SSI0, IRQ0, IRQ1 connected to SoC
>>>>
>>>> I think this is still confusing: SW_SD2_EN refers to an active-low signal
>>>> (SW_SD2_EN#) in the schematics.
>>>
>>> OMG, while the signal is called "SW_SD2_EN#" in the schematics, it is
>>> _not_ active-low!
>>> SW_D2_EN# drives a STG3692 quad SPDT switch, and SD2 is enabled
>>> if SW_D2_EN# is high...
>>>
>>> The RZ/G3S SMARC Module User Manual says:
>>>
>>> Signal SW_SD2_EN ON: SD2 is disabled.
>>> Signal SW_SD2_EN OFF: SD2 is enabled.
>>
>> I followed the description in this manual, chapter 2.1.1 SW_CONFIG. The
>> idea was that these macros to correspond to individual switches, to match
>> that table (describing switches position) with this code as the user in the
>> end sets those switches described in table at 2.1.1 w/o necessary going
>> deep into schematic (at least in the beginning when trying different
>> functionalities).
>>
>> Do you think it would be better if we will have these macros named
>> SWCONFIGX, X in {1, 2, 3, 4, 5, 6} ?
> 
> Perhaps. A disadvantage would be that SW_CONFIG%u doesn't
> give any indication about its purpose...

That's the reason I chose initially to have the signal names instead of
SWCONFIGX.

Now seeing that signal names could be confusing I tend to go with SWCONFIGx
instead.

> 
>>> So whatever we do, something will look odd :-(
>>>
>>>> Before, SW_SD2_EN used assertion-logic (1 is enabled), and didn't
>>>> match the physical signal level.
>>>> After your patch, SW_SD2_EN matches the active-low physical level, but
>>>> this is not reflected in the name...
>>>>
>>>>>   */
>>>>>  #define SW_SD0_DEV_SEL 1
>>>>>  #define SW_SD2_EN      1
>>>>> @@ -25,7 +25,7 @@ / {
>>>>>
>>>>>         aliases {
>>>>>                 mmc0 = &sdhi0;
>>>>> -#if SW_SD2_EN
>>>>> +#if !SW_SD2_EN
>>>>
>>>> ... so this condition looks really weird.
>>>
>>> Still, I think the original looks nicer here.
>>>
>>> So I suggest to keep the original logic, but clarify the position of
>>> the switch.
>>> Does that make sense?
>>
>> It will still be odd, AFAICT, as this way as we will map 0 to ON and 1 to
>> OFF... A bit counterintuitive.
> 
> Most switches on board pull signals LOW when the switch is ON...
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

