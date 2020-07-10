Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3B421B6FD
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2020 15:47:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbgGJNrc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Jul 2020 09:47:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727910AbgGJNrb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Jul 2020 09:47:31 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B0C3C08C5CE;
        Fri, 10 Jul 2020 06:47:31 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id z15so6002789wrl.8;
        Fri, 10 Jul 2020 06:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FbKNbXw5+ofG9RyKnBh68SnbvorNSKKjBU7WOLXWQE4=;
        b=HiUD1SeS9oNEOQGLlGjspqlx1ucgIHwcztodspOdsWF5ZLU+APPJD7sBYoCs4essF+
         iXgSyAj2XPcG3o0aOB4IvQ7R+0mCaei3Vineeb3Jnx6Iix8KSmow+PxMGaa/BzxztTPy
         4rbyx0c8P12c5p1sgmpGPzsj1/CRo+hL11l1RTydDnt82Fjj7hflsJezjbzZocMlYe7t
         3fcb3ZuCkDRaexCjlYWVuJ0pa1YLBTdk5C8/mzS3IdNLnwwyWDjp7vW8Tgv7st0tSHaa
         fSTZN5E5d3BiwyZy+8IV6CghewKF9APDlPS7mjHJCClCC3aUJIFsXvWSBEkfC3My+R1w
         FJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FbKNbXw5+ofG9RyKnBh68SnbvorNSKKjBU7WOLXWQE4=;
        b=rkqRjJ0tjtbLHRxrtjZ0IXxrYgnTkWRmE3iTDTGI2zC0meRgfO5HB9IoIZnBiz0LGF
         h5TSw2qBXiVWX9DCAgPYLKNJDSV0FPJeuY3Qj/UKNNV8bikIb6NrnkLWdO6mk81LpyNs
         fs2gFNZzL12BXBuby3/fF4w0RftKIyTIXFCrS/v+NcgV+gKYlaxIdPXFgdFICIrz1RhJ
         0qtORv63kuiylQ4Aa7BjKcE8uXZxWCPA9Zai3W7S7UL26W9CkTQoY9EteChWZf4VTiOB
         jLoffK7AVZOtdUaL/YgF2pD8+PnC7I/jseHa0psyc8+5SYFPvZlZgwtgJdKD39RyjyV4
         D4Uw==
X-Gm-Message-State: AOAM530aUXBcx32WVQaqeXnvEbAAditxUbNHurw5C3pdMIN3p7nIysA8
        9XKCONSLeAq2bU/1X0AFvCo=
X-Google-Smtp-Source: ABdhPJz30P3Ja6nlaCcxoVO3T84UFVmzRkAQoQzS2oPJFdsgjFqTddAfgdfaqHdktNmYIqTpnDGbFQ==
X-Received: by 2002:adf:e6c1:: with SMTP id y1mr42243181wrm.116.1594388850081;
        Fri, 10 Jul 2020 06:47:30 -0700 (PDT)
Received: from ziggy.stardust ([213.195.114.245])
        by smtp.gmail.com with ESMTPSA id y6sm4572954wrr.74.2020.07.10.06.47.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2020 06:47:29 -0700 (PDT)
Subject: Re: [PATCH v7 7/7] arm64: dts: add dts nodes for MT6779
To:     Hanks Chen <hanks.chen@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sean Wang <sean.wang@kernel.org>
Cc:     mtk01761 <wendell.lin@mediatek.com>,
        Andy Teng <andy.teng@mediatek.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        wsd_upstream@mediatek.com, CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>
References: <1593694630-26604-1-git-send-email-hanks.chen@mediatek.com>
 <1593694630-26604-9-git-send-email-hanks.chen@mediatek.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <2eee3a1f-464a-359e-e7d3-0d331c8898ed@gmail.com>
Date:   Fri, 10 Jul 2020 15:47:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1593694630-26604-9-git-send-email-hanks.chen@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 02/07/2020 14:57, Hanks Chen wrote:
> this adds initial MT6779 dts settings for board support,
> including cpu, gic, timer, ccf, pinctrl, uart, sysirq...etc.
> 
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/Makefile       |    1 +
>   arch/arm64/boot/dts/mediatek/mt6779-evb.dts |   31 +++
>   arch/arm64/boot/dts/mediatek/mt6779.dtsi    |  271 +++++++++++++++++++++++++++
>   3 files changed, 303 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt6779-evb.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt6779.dtsi
> 
[...]
> +
> +		uart2: serial@11004000 {
> +			compatible = "mediatek,mt6779-uart",
> +				     "mediatek,mt6577-uart";
> +			reg = <0 0x11004000 0 0x400>;
> +			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_LOW>;
> +			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_UART1>;

I suppose that should be:

clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_UART2>;


Regards,
Matthias

> +			clock-names = "baud", "bus";
> +			status = "disabled";
> +		};
> +
> +		audio: clock-controller@11210000 {
> +			compatible = "mediatek,mt6779-audio", "syscon";
> +			reg = <0 0x11210000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		mfgcfg: clock-controller@13fbf000 {
> +			compatible = "mediatek,mt6779-mfgcfg", "syscon";
> +			reg = <0 0x13fbf000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		mmsys: syscon@14000000 {
> +			compatible = "mediatek,mt6779-mmsys", "syscon";
> +			reg = <0 0x14000000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		imgsys: clock-controller@15020000 {
> +			compatible = "mediatek,mt6779-imgsys", "syscon";
> +			reg = <0 0x15020000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		vdecsys: clock-controller@16000000 {
> +			compatible = "mediatek,mt6779-vdecsys", "syscon";
> +			reg = <0 0x16000000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		vencsys: clock-controller@17000000 {
> +			compatible = "mediatek,mt6779-vencsys", "syscon";
> +			reg = <0 0x17000000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		camsys: clock-controller@1a000000 {
> +			compatible = "mediatek,mt6779-camsys", "syscon";
> +			reg = <0 0x1a000000 0 0x10000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		ipesys: clock-controller@1b000000 {
> +			compatible = "mediatek,mt6779-ipesys", "syscon";
> +			reg = <0 0x1b000000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +	};
> +};
> 
