Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C06B521F8DE
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2020 20:15:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726989AbgGNSPE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jul 2020 14:15:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725951AbgGNSPD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jul 2020 14:15:03 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A7D2C061755;
        Tue, 14 Jul 2020 11:15:03 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id z2so23797409wrp.2;
        Tue, 14 Jul 2020 11:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dSp7R1vKTnKdzsxqMgBtcDq/n3QLykSpSbeQuD3hfjc=;
        b=iu3vQTCv0leQpsnybURB1+EIrvo+36TwXadSzcO7dbgQS5eJ/HVVXkryMCf3CZDa5V
         M6zpTobveJkRbL2cnQ5//mKpcsLOjCk4I+owDrHcoVA49TcOal1FA/DFGqFR1VDp1elb
         bZVfx7pgjMG5+9iixXvfyLDEkMNVPiZWHe+Eaw/3VaZB5NZWIOjnLNOZ4GR1+C3dUvmu
         Cb+A9lbdIgT3TfNeeBpuID/O3oB+o44zv4HDE5EawQeEuLdZFzTdU3ID6szd/Xdb7hrj
         r5TFHCPGGXl+0M4uYFlb5AydKP7l/ZHhuop0xk46VMyAG+dYBAk6gSRkJ8TaIqLv59BS
         G//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dSp7R1vKTnKdzsxqMgBtcDq/n3QLykSpSbeQuD3hfjc=;
        b=iavXb0AOH09Nnqtsgl8TAd6aWH2nMs0m7y73kSEZyrxaK+JYCzvQkp3xYjkwPYdPeP
         7jjOVlP+aPh5KG+I/NCpvDawqKxx1Zhouo8wHkJb67rfOv5rr40bbwtKnORK83RkA+Uf
         3wfkHs10o7wB86p3Y8iYSO8roSh02pMQ/XCwHd3b/+pEE8Qm7E69pD2NRsKo9/BMERVm
         lO7rBGPYHMD7BOndo1NnulQ0WmgZadgLL+7WnS5GjyJ0OReQC7m2v7iQ5QfChgJM7FZF
         lapkZs0zf/UgdvwPSazdUHt9LyAcKN7klE7Kc6nqY3DOvGI3B8zr6zC4cL49Lzdf82ud
         L1xQ==
X-Gm-Message-State: AOAM531mAUv5IE+fGOMRtSA6GHYInAfmw/8C72Y/Ade4s9wlQMgNRqlW
        s1omQQwiWAR3+G8+KOipYrI=
X-Google-Smtp-Source: ABdhPJyyGdhWu0u0CbQOeLDCSz6P+/Yov6DrHDS6EiOJPgFRClfh0pllHT3IxqJnRE4/8NrmgSZ6fA==
X-Received: by 2002:adf:e60e:: with SMTP id p14mr7062800wrm.31.1594750501837;
        Tue, 14 Jul 2020 11:15:01 -0700 (PDT)
Received: from ziggy.stardust ([84.236.220.84])
        by smtp.gmail.com with ESMTPSA id k20sm5572396wmi.27.2020.07.14.11.15.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2020 11:15:00 -0700 (PDT)
Subject: Re: [PATCH v8 6/7] arm64: dts: add dts nodes for MT6779
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
References: <1594718402-20813-1-git-send-email-hanks.chen@mediatek.com>
 <1594718402-20813-7-git-send-email-hanks.chen@mediatek.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <1b335463-b0af-9010-feed-c4b673ebb6c5@gmail.com>
Date:   Tue, 14 Jul 2020 20:14:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1594718402-20813-7-git-send-email-hanks.chen@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 14/07/2020 11:20, Hanks Chen wrote:
> this adds initial MT6779 dts settings for board support,
> including cpu, gic, timer, ccf, pinctrl, uart, sysirq...etc.
> 
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/Makefile       |   1 +
>   arch/arm64/boot/dts/mediatek/mt6779-evb.dts |  31 +++
>   arch/arm64/boot/dts/mediatek/mt6779.dtsi    | 271 ++++++++++++++++++++
>   3 files changed, 303 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt6779-evb.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt6779.dtsi
> 
[...]
> +
> +		uart0: serial@11002000 {
> +			compatible = "mediatek,mt6779-uart",
> +				     "mediatek,mt6577-uart";
> +			reg = <0 0x11002000 0 0x400>;
> +			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
> +			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_UART0>;
> +			clock-names = "baud", "bus";
> +			status = "disabled";
> +		};
> +
> +		uart1: serial@11003000 {
> +			compatible = "mediatek,mt6779-uart",
> +				     "mediatek,mt6577-uart";
> +			reg = <0 0x11003000 0 0x400>;
> +			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_LOW>;
> +			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_UART1>;
> +			clock-names = "baud", "bus";
> +			status = "disabled";
> +		};
> +
> +		uart2: serial@11004000 {
> +			compatible = "mediatek,mt6779-uart",
> +				     "mediatek,mt6577-uart";
> +			reg = <0 0x11004000 0 0x400>;
> +			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_LOW>;
> +			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_UART2>;
> +			clock-names = "baud", "bus";
> +			status = "disabled";
> +		};

Devicetree describes the HW we have. As far as I know, we have 4 UARTs on 
MT6779. So we should list them all here.

Regards,
Matthias
