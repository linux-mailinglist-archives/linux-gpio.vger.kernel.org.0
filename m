Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A3C840B645
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Sep 2021 19:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbhINR4q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Sep 2021 13:56:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbhINR4q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Sep 2021 13:56:46 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54F54C061574;
        Tue, 14 Sep 2021 10:55:28 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id i3so179106wmq.3;
        Tue, 14 Sep 2021 10:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=o4N33InZazxjk2fm8q6vK8YiuSMIHI0rSm1Fto78HVY=;
        b=Kq6HIns1wxIDQW7wVZGqtPs8Lakk8I2+OcNr4+nPCS8f/mzDXYIWAZxRV8SyM5sUl7
         KThkCXKwt+hQ2dt63JusPyHaXkRQd/hdG4E/7waUU3CQ460zJKlwL3YYywxYlkQSRipj
         eG2H/DFdMmgjEnu0ITT0qTmWNjC1TP+FcblWcm4/CiJFBebBVfahFriCoBHSbFSzGGpp
         r60UtLtehM2QgVDXIgJQAsaNl1kpDPQVKHEzz5aPcMNQXZFOFRb3y3urst5VCx1aRF0k
         xPfk6JJjY1uTSynF5d8puaV6rOVlAbsQrnhbUZJe+Dh5ke4Fj9YQTYDCZwnlEX32XaFZ
         YnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=o4N33InZazxjk2fm8q6vK8YiuSMIHI0rSm1Fto78HVY=;
        b=PIfq5osUmHw/9xCG6+QgWbwEjpBMUIS8oQskvVn9JaY5M88iV5rgb9smHvxnv1zj0v
         zHKoyE7kI0tuPpj8OfDEfJob8tMq6oPUHo3OsugGEN4nAGApxeLEmehEAzTeeBD3OXRd
         NNZkzFmVFiY1YrtUqe7bMOGeKxkOQB3pkNAsxpjdRRa2KEsiA8ZizgNmKkhIWAk2G9Ve
         yeHtevV9fuNh2gGDrXvf18qBOMdt2TF8FY0chUheXb2Hu1aVeeng8eyy6eHGExWqn1zc
         n2UFYkU6boJrTjbZiiEkv4EcUBJm/tcrbyns5Cfog3oQ7my7C1lNFHj+kNr7Olbn9etZ
         bzhA==
X-Gm-Message-State: AOAM531yEr8nuyGmZL4QLjrC+5DCW+zvknrunfut/juPG3PifT9p6Fco
        H2/nRUD376Pc8sK+gMShyLs=
X-Google-Smtp-Source: ABdhPJzUGxuis/ruDJdd5qDR8TPtVsMGxpsuKrk+eTnAx/luvB3WM899gSd766IT/oCv1KftVjMfMQ==
X-Received: by 2002:a05:600c:3203:: with SMTP id r3mr371006wmp.175.1631642126910;
        Tue, 14 Sep 2021 10:55:26 -0700 (PDT)
Received: from [192.168.0.16] ([37.223.140.66])
        by smtp.gmail.com with ESMTPSA id u16sm1982308wmc.41.2021.09.14.10.55.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Sep 2021 10:55:26 -0700 (PDT)
Message-ID: <016b501b-a4bf-c74d-9f7f-8145800ca6e0@gmail.com>
Date:   Tue, 14 Sep 2021 19:55:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Subject: Re: [RESEND,v2,8/9] arm64: dts: mediatek: add mt7986a support
Content-Language: en-US
To:     Sam Shih <sam.shih@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Fabien Parent <fparent@baylibre.com>,
        Seiya Wang <seiya.wang@mediatek.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc:     John Crispin <john@phrozen.org>, Ryder Lee <Ryder.Lee@mediatek.com>
References: <20210914085137.31761-1-sam.shih@mediatek.com>
 <20210914085137.31761-9-sam.shih@mediatek.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20210914085137.31761-9-sam.shih@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 14/09/2021 10:51, Sam Shih wrote:
> Add basic chip support for Mediatek mt7986a, include
> uart nodes with correct clocks, rng node with correct clock,
> and watchdog node and mt7986a pinctrl node.
> 
> Add cpu node, timer node, gic node, psci and reserved-memory node
> for ARM Trusted Firmware,
> 
> Add clock controller nodes, include 40M clock source, topckgen, infracfg,
> apmixedsys and ethernet subsystem.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> 
> ---
> v2: modified clock and uart node due to clock driver updated
> ---
>   arch/arm64/boot/dts/mediatek/Makefile        |   1 +
>   arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts |  49 ++++
>   arch/arm64/boot/dts/mediatek/mt7986a.dtsi    | 227 +++++++++++++++++++
>   3 files changed, 277 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index 4f68ebed2e31..e6c3a73b9e4a 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -7,6 +7,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-rfb.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8167-pumpkin.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana.dtb
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> new file mode 100644
> index 000000000000..a58347c09ab2
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> @@ -0,0 +1,49 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2021 MediaTek Inc.
> + * Author: Sam.Shih <sam.shih@mediatek.com>
> + */
> +
> +/dts-v1/;
> +#include "mt7986a.dtsi"
> +
> +/ {
> +	model = "MediaTek MT7986a RFB";
> +	compatible = "mediatek,mt7986a-rfb";
> +	chosen {
> +		bootargs = "console=ttyS0,115200n1 loglevel=8  \
> +				earlycon=uart8250,mmio32,0x11002000";

We should be able to achieve this by using the stdout-path instead.

Regards,
Matthias
