Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18770443B40
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Nov 2021 03:19:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbhKCCVs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 22:21:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbhKCCVr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 22:21:47 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 299C4C061714;
        Tue,  2 Nov 2021 19:19:12 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id gh1so1194019qvb.8;
        Tue, 02 Nov 2021 19:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=L6N++OXbiQ++WWRxdLoBQIcLBmefSWDWQ3m0E3cuKUs=;
        b=QDvkU+3x9rPI046k0PUyt5niFs4wNe+UzIm+fLt/bZUbPNBPkfgNawdhqePx+1HSkn
         bKR+udI4YDieAFP9AWzR19vifU7sAg8eAYvMJQzQd+GtwXcRbuuD4ebXyJlAShYRuYHc
         v1gBTGNXVPSOdfDXkD626nKdU2aGCTzo61gg38xBPkt38PqWvoKmz44uBYKL/dX0KxLj
         C+G5gD4nHiT8mXQ6UfBN9o2Xu62m9HrS81gnVZh25X6KUErMohg/Ov2iBN1QMwTTzRWy
         k3GSJ9c1ikCSblEP/gzGnqQc09JS1QzqBp+CEgi8UBZiJMbvFdYmxzuozDhK28BR/r+i
         xF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=L6N++OXbiQ++WWRxdLoBQIcLBmefSWDWQ3m0E3cuKUs=;
        b=D3go5n+xsKxG8JsDqc/uADDD+BKahf606WDkBW6jxxZk1TdbtGyJKeJfCgGziu7mOj
         wKfAuZyiSqNJj0ZRERyxF6LZLUYUdMq01/rr6eEOaD6DYKzFdyZWOB3xhNy2SlXcsmye
         xhvG6QZiitIrpt/oVHiqJxOb7U7AL1AsEvPihe+TOwahByWq8uSjGYka6YDq/P6lByFX
         wT/ZZKGngIas/Zc+4bG+xwn4dDN5rGaMbYzFxFW7dbbkmFSkL/8zJAU/XDiyHdA6Js+C
         PXP8wCrsCukB5ubaXPVqLXYlSpV36+S4GeIRwASoqLR18SN3hQHumZNm1r3heti7u8Fh
         qKFw==
X-Gm-Message-State: AOAM53287H2dQJLIwhoQ+zWYogiiOOguYILcldGRrK1KX5UeddYZRiTe
        4oXzDkOsZeyx7QneNjq4AbM=
X-Google-Smtp-Source: ABdhPJyStGa6ALGT7a9HuLOAfF37IRWpJUhJou9Ga7+i3LE11S7fpDMhER3fzk6jVgwNT6vkr4BY4w==
X-Received: by 2002:ad4:43e8:: with SMTP id f8mr40707115qvu.41.1635905950891;
        Tue, 02 Nov 2021 19:19:10 -0700 (PDT)
Received: from [10.4.10.38] (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id s13sm605316qki.23.2021.11.02.19.19.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 19:19:10 -0700 (PDT)
Message-ID: <2fbe7ced-60a7-2fd2-6032-e4ddae21b565@gmail.com>
Date:   Tue, 2 Nov 2021 22:19:08 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 12/13] ARM: dts: imx: add i.MXRT1050-EVK support
Content-Language: en-US
From:   Jesse Taube <mr.bossman075@gmail.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     NXP Linux Team <linux-imx@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Stefan Agner <stefan@agner.ch>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
        Abel Vesa <abel.vesa@nxp.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Giulio Benetti <giulio.benetti@benettiengineering.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-serial@vger.kernel.org
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
 <20211102225701.98944-13-Mr.Bossman075@gmail.com>
 <CAOMZO5DV-6dKnaGMgARhtv7mq-nOr9jO-XUWAJDmJWwNxc+B1g@mail.gmail.com>
 <e2f81ad7-9c58-3e39-fbb0-5ef3132bba7d@gmail.com>
In-Reply-To: <e2f81ad7-9c58-3e39-fbb0-5ef3132bba7d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 11/2/21 19:54, Jesse Taube wrote:
> 
> 
> On 11/2/21 19:42, Fabio Estevam wrote:
>> On Tue, Nov 2, 2021 at 7:57 PM Jesse Taube <mr.bossman075@gmail.com> wrote:
>>
>>> +/ {
>>> +       model = "NXP IMXRT1050-evk board";
>>> +       compatible = "fsl,imxrt1050-evk", "fsl,imxrt1050";
>>> +
>>> +       chosen {
>>> +               bootargs = "root=/dev/ram";
>>
>> No need to pass bootargs here.
>>
>>> +               stdout-path = &lpuart1;
>>> +       };
>>> +
>>> +       aliases {
>>> +               gpio0 = &gpio1;
>>> +               gpio1 = &gpio2;
>>> +               gpio2 = &gpio3;
>>> +               gpio3 = &gpio4;
>>> +               gpio4 = &gpio5;
>>> +               mmc0 = &usdhc1;
>>> +               serial0 = &lpuart1;
>>> +       };
>>> +
>>> +       memory@0 {
>>
>> memory@80000000
>>
>> Building with W=1 should give a dtc warning due to the unit address
>> and reg mismatch.
> Oh that makes sense.
> I guess I'm going to have to figure out how to get warnings to work as I
> couldn't last time I tried.
Oh i got it to work I did something dumb...
I didn't give a warning for this i still changed it of course.
>>
>>> +               device_type = "memory";
>>> +               reg = <0x80000000 0x2000000>;
>>> +       };
>>> +
>>
>> Unneeded blank line.
>>> +
>>> +&iomuxc {
>>> +       pinctrl-names = "default";
>>> +
>>> +       imxrt1050-evk {
>>
>> No need for this imxrt1050-evk container.
> I was wondering if that was needed, u-boot has it, good to know.
>>
>>> +               pinctrl_lpuart1: lpuart1grp {
>>> +                       fsl,pins = <
>>> +                               MXRT1050_IOMUXC_GPIO_AD_B0_12_LPUART1_TXD
>>> +                                       0xf1
>>
>> Put it on a single line. It helps readability. Same applies globally.
>>> +&usdhc1 {
>>> +       pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
>>> +       pinctrl-0 = <&pinctrl_usdhc0>;
>>> +       pinctrl-1 = <&pinctrl_usdhc0>;
>>> +       pinctrl-2 = <&pinctrl_usdhc0>;
>>> +       pinctrl-3 = <&pinctrl_usdhc0>;
>>> +       status = "okay";
>>> +
>>> +       cd-gpios = <&gpio2 28 GPIO_ACTIVE_LOW>;
>>
>> Make 'status' to be the last property. Remove the blank line.
>>
>>> +               edma1: dma-controller@400e8000 {
>>> +                       #dma-cells = <2>;
>>> +                       compatible = "fsl,imx7ulp-edma";
>>> +                       reg = <0x400e8000 0x4000>,
>>> +                               <0x400ec000 0x4000>;
>>> +                       dma-channels = <32>;
>>> +                       interrupts = <0>,
>>> +                               <1>,
>>> +                               <2>,
>>> +                               <3>,
>>> +                               <4>,
>>> +                               <5>,
>>> +                               <6>,
>>> +                               <7>,
>>> +                               <8>,
>>> +                               <9>,
>>> +                               <10>,
>>> +                               <11>,
>>> +                               <12>,
>>> +                               <13>,
>>> +                               <14>,
>>> +                               <15>,
>>> +                               <16>;
>>
>> Please group more elements into the same line.
>>
>> Putting one entry per line makes it extremely long.
>>
>>> +               gpio5: gpio@400c0000 {
>>> +                       compatible = "fsl,imxrt-gpio", "fsl,imx35-gpio";
>>> +                       reg = <0x400c0000 0x4000>;
>>> +                       interrupts = <88>,
>>> +                               <89>;
>>
>> Put the interrupts into a single line.
>>
> Ah all these make sense, will fix, sry about that.
> 
