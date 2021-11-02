Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3778443A15
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Nov 2021 00:54:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230462AbhKBX5M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 19:57:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229960AbhKBX5L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 19:57:11 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46219C061714;
        Tue,  2 Nov 2021 16:54:36 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id ay20so689368qkb.7;
        Tue, 02 Nov 2021 16:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=LUJiTUBUz+nDDvCf1YrbjU2s+1FnYiIkeo+EME3kWwE=;
        b=BNApYS/cqy5Q8pdJ6jerjEhOsDIbqWdYf8uPLunlFYkDoZhIBYDV7KLx9u1GGpwkbx
         VDeMVUv2ZWvR9TRrck38B+vOyhfL9gTBUy629STDqNUMp1uGHHayoc7tZXW8D6YU6To9
         kUvOO+J/uKtfxlmdUxI+rWQFwuy7C+ika/nna4YYGHKvLgLcTPbT6GxAQLPmCbwaoUg1
         6fyU5H9l69w0bBtEA1OhYyxBIrSSOoXKjB1V27h1u8Cykxgs0k6m2y8CLpIlhK1dFLW4
         tSNxarNGJIzfTiMXyL/IoiAOFpa+k+W9VH7iCSucuZNt0iM7bA1bkFYZdkr7zuLJGx5t
         FSbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LUJiTUBUz+nDDvCf1YrbjU2s+1FnYiIkeo+EME3kWwE=;
        b=sWQ9curxuOlQcjmc4DU6GSxlQ+FlatpwLvk+kDmrC2A49c+HhVg4SQd2x4qEr7Oqu2
         iwqztHwN2Spa0BUNbA7ptmo5BJQg+kkmwG7pSJzaKvC+m4PC/fnFjkUZLL/9IM3MR8Fx
         K9wt3szx45E1ko6ysxGmpMv/OGImPMDxp/30NrRj/yuZM2SK03MPOz/5hwrnBdAYeCXl
         RFaKgo0CvsgK9sM/7QdrM82EhlEQ1p+ADmiub7SnnUu5tI9+KApJ4WU4WR4hV/vaKmeI
         sl+G5LyOmAI3Bnad/KRFG1hJ9Wq7y/7HQEcvRkjmreA60NxlLq4SzstpbqRbeSFQIn9g
         weqQ==
X-Gm-Message-State: AOAM531ifXzUvh1XvqBwYUz4M0JYtxlPYwrRiMiIt41iFk8ILnsBW2/R
        g59qxz5pbgYMbcMQo7tbNFk=
X-Google-Smtp-Source: ABdhPJzxro4hWmMP7y5iTOVWvZMs+GGc/IGEN1fn/TBo+Ziw7KfVlQyzMaZ6cwWeXs/C99ERXXqZjA==
X-Received: by 2002:a05:620a:4150:: with SMTP id k16mr16278131qko.186.1635897275437;
        Tue, 02 Nov 2021 16:54:35 -0700 (PDT)
Received: from [10.4.10.38] (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id w1sm382768qtj.28.2021.11.02.16.54.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 16:54:35 -0700 (PDT)
Message-ID: <e2f81ad7-9c58-3e39-fbb0-5ef3132bba7d@gmail.com>
Date:   Tue, 2 Nov 2021 19:54:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 12/13] ARM: dts: imx: add i.MXRT1050-EVK support
Content-Language: en-US
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
From:   Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <CAOMZO5DV-6dKnaGMgARhtv7mq-nOr9jO-XUWAJDmJWwNxc+B1g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 11/2/21 19:42, Fabio Estevam wrote:
> On Tue, Nov 2, 2021 at 7:57 PM Jesse Taube <mr.bossman075@gmail.com> wrote:
> 
>> +/ {
>> +       model = "NXP IMXRT1050-evk board";
>> +       compatible = "fsl,imxrt1050-evk", "fsl,imxrt1050";
>> +
>> +       chosen {
>> +               bootargs = "root=/dev/ram";
> 
> No need to pass bootargs here.
> 
>> +               stdout-path = &lpuart1;
>> +       };
>> +
>> +       aliases {
>> +               gpio0 = &gpio1;
>> +               gpio1 = &gpio2;
>> +               gpio2 = &gpio3;
>> +               gpio3 = &gpio4;
>> +               gpio4 = &gpio5;
>> +               mmc0 = &usdhc1;
>> +               serial0 = &lpuart1;
>> +       };
>> +
>> +       memory@0 {
> 
> memory@80000000
> 
> Building with W=1 should give a dtc warning due to the unit address
> and reg mismatch.
Oh that makes sense.
I guess I'm going to have to figure out how to get warnings to work as I 
couldn't last time I tried.
> 
>> +               device_type = "memory";
>> +               reg = <0x80000000 0x2000000>;
>> +       };
>> +
> 
> Unneeded blank line.
>> +
>> +&iomuxc {
>> +       pinctrl-names = "default";
>> +
>> +       imxrt1050-evk {
> 
> No need for this imxrt1050-evk container.
I was wondering if that was needed, u-boot has it, good to know.
> 
>> +               pinctrl_lpuart1: lpuart1grp {
>> +                       fsl,pins = <
>> +                               MXRT1050_IOMUXC_GPIO_AD_B0_12_LPUART1_TXD
>> +                                       0xf1
> 
> Put it on a single line. It helps readability. Same applies globally.
>> +&usdhc1 {
>> +       pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
>> +       pinctrl-0 = <&pinctrl_usdhc0>;
>> +       pinctrl-1 = <&pinctrl_usdhc0>;
>> +       pinctrl-2 = <&pinctrl_usdhc0>;
>> +       pinctrl-3 = <&pinctrl_usdhc0>;
>> +       status = "okay";
>> +
>> +       cd-gpios = <&gpio2 28 GPIO_ACTIVE_LOW>;
> 
> Make 'status' to be the last property. Remove the blank line.
> 
>> +               edma1: dma-controller@400e8000 {
>> +                       #dma-cells = <2>;
>> +                       compatible = "fsl,imx7ulp-edma";
>> +                       reg = <0x400e8000 0x4000>,
>> +                               <0x400ec000 0x4000>;
>> +                       dma-channels = <32>;
>> +                       interrupts = <0>,
>> +                               <1>,
>> +                               <2>,
>> +                               <3>,
>> +                               <4>,
>> +                               <5>,
>> +                               <6>,
>> +                               <7>,
>> +                               <8>,
>> +                               <9>,
>> +                               <10>,
>> +                               <11>,
>> +                               <12>,
>> +                               <13>,
>> +                               <14>,
>> +                               <15>,
>> +                               <16>;
> 
> Please group more elements into the same line.
> 
> Putting one entry per line makes it extremely long.
> 
>> +               gpio5: gpio@400c0000 {
>> +                       compatible = "fsl,imxrt-gpio", "fsl,imx35-gpio";
>> +                       reg = <0x400c0000 0x4000>;
>> +                       interrupts = <88>,
>> +                               <89>;
> 
> Put the interrupts into a single line.
> 
Ah all these make sense, will fix, sry about that.
