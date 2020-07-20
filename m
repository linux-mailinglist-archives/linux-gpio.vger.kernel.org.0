Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5C7122684E
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jul 2020 18:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388173AbgGTQNw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jul 2020 12:13:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388168AbgGTQNt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jul 2020 12:13:49 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85222C061794;
        Mon, 20 Jul 2020 09:13:49 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id c80so97163wme.0;
        Mon, 20 Jul 2020 09:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YGGS+lJpiE0eLgk6zkqUqROfE8WRidPw66ft3m8PrAw=;
        b=bViycVFx8iriZx27qZBxJSpd3rB14eEO3Ix1ovgt1PvsYFN1OKJMePH2P6SrHpf4ED
         L5gN+i7f30DD0zUxuhUEegm1GGQ3EwDcwMSEgZt1CIiWmT/ZyY9AVWmh2uRKW8N9h1kl
         IgN/sHJdsOU4LmICiOdrzBtNL8OtD4rENHbVcbpZyMM061QrCiSlvnrNXBFibemfTjBG
         Lehc8ImZr+MWMxuxNWqx6s83kYDNJNZz3v2bDdDn+KUaz6B7//hhtwq3db8Z7wV+5eDO
         uozjqa4rTkiVyDVyf4Ays0tyfTlg06YjzGSslK3JAdFQS0KDf9aYVpUIufefWx2dIjg4
         M7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YGGS+lJpiE0eLgk6zkqUqROfE8WRidPw66ft3m8PrAw=;
        b=UFbtbKbLWf4O4e6dBIct8M7Yq4MxaURs/LopocwMUN9J1aAL2/MbL41t+4ZJiUQaS+
         mFHpWUm1Dym35GikgiURnzRCa5USyjjmSiX/3S1V0iJ+O0iVc0B8p/Hy/KbefQhJw70q
         uqn320khM7fhl8ff9nScw0EBvjvrFz8k7FWOObuUt6St1b77dcreaDfnoCVBk5D7/Jxs
         7sCWe1bqgW/62xINHoz6PmKfxA1GxBwVGOxS5NcoyQT1imGuGt2gteXUsiTdrSAYFp4k
         Zo8wdUisG5xZuG8ObYaBSXf8rosKLfr+uX8B4DutDJaU6llHCibAQ6PHDwZohrJxvHu5
         eK7w==
X-Gm-Message-State: AOAM530f2W9K1l2vW+kpJQ3KzBpJ4k8HOMwPET464kbbkRPEnzrnfb8B
        twAxvZtiAvy7AHEZXu1t1fQ=
X-Google-Smtp-Source: ABdhPJw9IDtKuHVh4un4iPMF4LNiPzwqgzZ73RwATsGe8QmFlE85s3PsZxWK0uEjjI9rY0din4fQRQ==
X-Received: by 2002:a05:600c:21cb:: with SMTP id x11mr73928wmj.141.1595261628261;
        Mon, 20 Jul 2020 09:13:48 -0700 (PDT)
Received: from ziggy.stardust (81.172.57.81.dyn.user.ono.com. [81.172.57.81])
        by smtp.gmail.com with ESMTPSA id 207sm55718wme.13.2020.07.20.09.13.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2020 09:13:47 -0700 (PDT)
Subject: Re: [PATCH v8 6/7] arm64: dts: add dts nodes for MT6779
To:     Hanks Chen <hanks.chen@mediatek.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        mtk01761 <wendell.lin@mediatek.com>,
        Andy Teng <andy.teng@mediatek.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        wsd_upstream@mediatek.com, CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>
References: <1594718402-20813-1-git-send-email-hanks.chen@mediatek.com>
 <1594718402-20813-7-git-send-email-hanks.chen@mediatek.com>
 <1b335463-b0af-9010-feed-c4b673ebb6c5@gmail.com>
 <1594872242.11090.8.camel@mtkswgap22>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <742eefe1-954b-eb3f-98b7-469833df729a@gmail.com>
Date:   Mon, 20 Jul 2020 18:13:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1594872242.11090.8.camel@mtkswgap22>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 16/07/2020 06:04, Hanks Chen wrote:
> On Tue, 2020-07-14 at 20:14 +0200, Matthias Brugger wrote:
>>
>> On 14/07/2020 11:20, Hanks Chen wrote:
>>> this adds initial MT6779 dts settings for board support,
>>> including cpu, gic, timer, ccf, pinctrl, uart, sysirq...etc.
>>>
>>> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
>>> ---
>>>    arch/arm64/boot/dts/mediatek/Makefile       |   1 +
>>>    arch/arm64/boot/dts/mediatek/mt6779-evb.dts |  31 +++
>>>    arch/arm64/boot/dts/mediatek/mt6779.dtsi    | 271 ++++++++++++++++++++
>>>    3 files changed, 303 insertions(+)
>>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt6779-evb.dts
>>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt6779.dtsi
>>>
>> [...]
>>> +
>>> +		uart0: serial@11002000 {
>>> +			compatible = "mediatek,mt6779-uart",
>>> +				     "mediatek,mt6577-uart";
>>> +			reg = <0 0x11002000 0 0x400>;
>>> +			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
>>> +			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_UART0>;
>>> +			clock-names = "baud", "bus";
>>> +			status = "disabled";
>>> +		};
>>> +
>>> +		uart1: serial@11003000 {
>>> +			compatible = "mediatek,mt6779-uart",
>>> +				     "mediatek,mt6577-uart";
>>> +			reg = <0 0x11003000 0 0x400>;
>>> +			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_LOW>;
>>> +			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_UART1>;
>>> +			clock-names = "baud", "bus";
>>> +			status = "disabled";
>>> +		};
>>> +
>>> +		uart2: serial@11004000 {
>>> +			compatible = "mediatek,mt6779-uart",
>>> +				     "mediatek,mt6577-uart";
>>> +			reg = <0 0x11004000 0 0x400>;
>>> +			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_LOW>;
>>> +			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_UART2>;
>>> +			clock-names = "baud", "bus";
>>> +			status = "disabled";
>>> +		};
>>
>> Devicetree describes the HW we have. As far as I know, we have 4 UARTs on
>> MT6779. So we should list them all here.
>>
> 
> Actually, We have only 3 UARTs HW on MT6779, but have 4 UART clk in
> header file of clk.

Correct, I got confused by the four clocks.
With that clarified I'm fine with the patch and will take it as soon as the 
clock driver patch is accepted.

Regards,
Matthias

> CLK_INFRA_UART3 is a dummy clk interface, it has no effect on the
> operation of the read/write instruction.
> 
> If you think it is not good, I can remove it in the header file of clk.
> 
> Thanks
> 
>> Regards,
>> Matthias
> 
