Return-Path: <linux-gpio+bounces-922-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8200802C45
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 08:42:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 370371F210B6
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 07:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D7DC129;
	Mon,  4 Dec 2023 07:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Hvof9gE1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02436F2
	for <linux-gpio@vger.kernel.org>; Sun,  3 Dec 2023 23:41:56 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40c05ce04a8so17848345e9.0
        for <linux-gpio@vger.kernel.org>; Sun, 03 Dec 2023 23:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1701675714; x=1702280514; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c8G1sh0qsI8d58akFwoRpnCXTsdhgVmXQ1PhU0QEiJM=;
        b=Hvof9gE1GoQ+OfRFXpgiu2mIiTaIJdI356AHy95RhmF2FNZ1ms0wtP7NpMes0r3qLZ
         ZWmo99RKANNBN6pm/CvRXJJcONHeRgPf9isIDMwIPsRfXfh3YsQUP4VNbhxwRJkRahyT
         XnMwWcYqQf/9b8j2VIpyIjbLHfe7or0B58Eu9wpB074MKPO/W7zqRlXQrHIG5L8WRjYr
         0n4aByVFHP1AKOjih0r8w1YLXB6+JyYLbxIfuoA4eu/m5x+BIepiykB2dGZTgv3tCnp0
         TssAjm887DMBhtDMbLpTwNvniznWdoQjqLrwiMUsWmMO02r8X4B4AB0H4aKiZp4vNXn7
         brjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701675714; x=1702280514;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c8G1sh0qsI8d58akFwoRpnCXTsdhgVmXQ1PhU0QEiJM=;
        b=Jaw/H0q6+INEe4vJR1z6W9LnJK782KMd3HiioqYgUE4o6N2806UhXYxc84bazAc0qF
         1tLfPHFX4uxY8uHzl312rniysQ0Jx7D8v37KLe43x7EdlM7qJIsw1u5vN1oFC/9ZyYjG
         lPmE8NQDkErEqPd6AKuKGeO3lSSWVMWyTeKDn0LxGg3X89DEJZ4ZI2J11Hd51r50U/qG
         U5RPpmDh2j5NeI2XbevnrokDOSNvXHXCG+gKehZg3hizxu+RNRtxQ4CtVvKVNNFSs1oq
         vZtYU6rJyVQauxQMKKJRQj7rMkxURTFuL+UuO8QLRIQ//I6Y1wi1OCEizX4nekYunb4j
         VUIw==
X-Gm-Message-State: AOJu0YwIIBRvhasts9005IFhKXmbQaT++9bnqhSJYThTLWW2T9Zb+HPg
	Jal3oBZOqn+x8LzN0scpLCw5HA==
X-Google-Smtp-Source: AGHT+IGnFhIB39yiIipKRI//SLw4hneqeadl9YkXMdwKranCz3MpSxZ/BicSrPOtY7Bi6Mkk854YEQ==
X-Received: by 2002:a05:600c:3488:b0:40b:5f03:b3ef with SMTP id a8-20020a05600c348800b0040b5f03b3efmr1153446wmq.273.1701675714498;
        Sun, 03 Dec 2023 23:41:54 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.22])
        by smtp.gmail.com with ESMTPSA id o15-20020a05600c510f00b004064cd71aa8sm12582868wms.34.2023.12.03.23.41.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Dec 2023 23:41:54 -0800 (PST)
Message-ID: <96dd3f54-9560-4587-b4e8-bf75422ff5ef@tuxon.dev>
Date: Mon, 4 Dec 2023 09:41:51 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/14] arm64: renesas: r9a08g045: Add Ethernet nodes
Content-Language: en-US
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
 <20231120070024.4079344-11-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdW9Unpw7NQOGWd4SeFV8XgvRYTKTXnt9Tsagb3Q3U9tNA@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdW9Unpw7NQOGWd4SeFV8XgvRYTKTXnt9Tsagb3Q3U9tNA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 01.12.2023 19:35, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Mon, Nov 20, 2023 at 8:01 AM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Add Ethernet nodes available on RZ/G3S (R9A08G045).
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
>> @@ -149,6 +149,38 @@ sdhi2: mmc@11c20000 {
>>                         status = "disabled";
>>                 };
>>
>> +               eth0: ethernet@11c30000 {
>> +                       compatible = "renesas,r9a08g045-gbeth", "renesas,rzg2l-gbeth";
>> +                       reg = <0 0x11c30000 0 0x10000>;
>> +                       interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
>> +                                    <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
>> +                                    <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
>> +                       interrupt-names = "mux", "fil", "arp_ns";
>> +                       clocks = <&cpg CPG_MOD R9A08G045_ETH0_CLK_AXI>,
>> +                                <&cpg CPG_MOD R9A08G045_ETH0_CLK_CHI>,
>> +                                <&cpg CPG_MOD R9A08G045_ETH0_REFCLK>;
>> +                       clock-names = "axi", "chi", "refclk";
>> +                       resets = <&cpg R9A08G045_ETH0_RST_HW_N>;
>> +                       power-domains = <&cpg>;
> 
> Perhaps add a default phy mode, like on other SoCs?
> 
>     phy-mode = "rgmii"';

I skipped this (even it was available on the other SoCs) as I consider the
phy-mode is board specific.

> 
> Also missing:
> 
>     #address-cells = <1>;
>     #size-cells = <0>;

Same for these.

> 
>> +                       status = "disabled";
>> +               };
> 
> Same comments for eth1.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

