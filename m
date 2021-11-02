Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D76494439DB
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Nov 2021 00:38:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbhKBXkl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 19:40:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbhKBXkk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 19:40:40 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 655A6C061714;
        Tue,  2 Nov 2021 16:38:05 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id a24so734054qvb.5;
        Tue, 02 Nov 2021 16:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=VDFUI6+9Gqle4Fl3GuOcqR9GGqL6hKFREJxfpi8AcUg=;
        b=DWclfIX0rDqNx+2O/T+hKL5tIPSEoGQxWRd3THANNkvDydCU3FkXzg2qmZDK/IJEgS
         pYzQB8gDR9PeLDzxiIZLvHya59tfFQLn/IBO5UW8vyr+tZmbHAAGGfvFSAn/ANu2XtLu
         AbvSadfIhQlpm/mG+J2lnVlL8Rf46Rx0LRn+Ns+mxvSgtNV/9UQ1bnQRakIJnflPNy/K
         qDrVNBV9ptlFTeUbzeNzNpqe74l1a+ZCd/JUNIuCUgGxQg7wKWmNFUTjHkMt2exeWbMS
         yIRLC+QkddF7lAZ7DBrTcaO784Zp/AnPgoJdHO7zkY54iOTF6yWt4yX0InDBlt0Kdz4V
         ezkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VDFUI6+9Gqle4Fl3GuOcqR9GGqL6hKFREJxfpi8AcUg=;
        b=4jdekJXO6V9Hxu+LefVOfBoYuw1mOSszYUEul2KFzAB1N3GpXrJaU6FLdrLOg6+rvg
         d9EQkArzgn+6NMwfTIsE8xgOMsW2fUSSOEPZfakHItlIvDEF7dBrqP4tr1RIpjFDtiU1
         1uV7OSr+V4LlFZt2RuNLIZcqJqA12lBiuehxZu035CY2vdNqMMIDb2hCog/+RPcvY7Eh
         oqikbV1AXbV7Fe8f6VDSF9iVN643GnseVpECPpu01Uu5ic4BEmQIptaG9XvrbEwM70g7
         XlBXhNXmdGY6VSKnGzGFLM//MlgpaZQYd66c2b2y4VdJ/tszic33hTDknO9uFdE1YtNC
         VubQ==
X-Gm-Message-State: AOAM533S/N4QuYdNeCd4Gi2Z1mR2EbwBd9xTBiAaxGAi7CiplowV1uup
        ckwTD9zVQySZjFWpppJXviM=
X-Google-Smtp-Source: ABdhPJxZ9E6SGKd4V2qIEhjfOAf1okxxeTzu4O+sd/JwEx3NZ1FjLuwJ3N9jwneBbIQUfOi0xTWATQ==
X-Received: by 2002:a0c:ecc7:: with SMTP id o7mr8789778qvq.46.1635896284646;
        Tue, 02 Nov 2021 16:38:04 -0700 (PDT)
Received: from [10.4.10.38] (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id n15sm354561qkp.102.2021.11.02.16.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 16:38:04 -0700 (PDT)
Message-ID: <9d480d93-c350-f219-e069-d12e16dabb13@gmail.com>
Date:   Tue, 2 Nov 2021 19:38:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 07/13] clk: imx: Add initial support for i.MXRT clock
 driver
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
 <20211102225701.98944-8-Mr.Bossman075@gmail.com>
 <CAOMZO5C9wY-BRbF-3D+mvaK3DaYi1kURt5QX-r3=umqpsT+hhw@mail.gmail.com>
From:   Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <CAOMZO5C9wY-BRbF-3D+mvaK3DaYi1kURt5QX-r3=umqpsT+hhw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 11/2/21 19:34, Fabio Estevam wrote:
> On Tue, Nov 2, 2021 at 7:57 PM Jesse Taube <mr.bossman075@gmail.com> wrote:
> 
>> +#include "clk.h"
This is necessary for the indices.
>> +#define ANATOP_BASE_ADDR       0x400d8000
OOPs my bad will fix.
> 
> This is now unused. Please remove it.
> 
>> +       clk[IMXRT1050_CLK_USDHC1] = imx_clk_gate2("usdhc1", "usdhc1_podf", ccm_base + 0x80, 2);
>> +       clk[IMXRT1050_CLK_USDHC2] = imx_clk_gate2("usdhc2", "usdhc2_podf", ccm_base + 0x80, 4);
>> +       clk[IMXRT1050_CLK_LPUART1] = imx_clk_gate2("lpuart1", "lpuart_podf", ccm_base + 0x7c, 24);
>> +       clk[IMXRT1050_CLK_LCDIF_APB] = imx_clk_gate2("lcdif", "lcdif_podf", ccm_base + 0x74, 10);
>> +       clk[IMXRT1050_CLK_DMA] = imx_clk_gate("dma", "ipg", ccm_base + 0x7C, 6);
>> +       clk[IMXRT1050_CLK_DMA_MUX] = imx_clk_gate("dmamux0", "ipg", ccm_base + 0x7C, 7);
> 
> The imx clock drivers have been converted to the clk_hw API.
> 
Oh will do, didn't know this.
> For a reference, please check:
> f1541e15e38e ("clk: imx6sx: Switch to clk_hw based API")
> 
> The same conversion could be done here.
> 
>> +       imx_check_clocks(clk, ARRAY_SIZE(clk));
>> +       clk_data.clks = clk;
>> +       clk_data.clk_num = ARRAY_SIZE(clk);
>> +       of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
>> +       clk_prepare_enable(clk[IMXRT1050_CLK_PLL1_ARM]);
>> +       clk_prepare_enable(clk[IMXRT1050_CLK_PLL2_SYS]);
>> +       clk_prepare_enable(clk[IMXRT1050_CLK_PLL3_USB_OTG]);
>> +       clk_prepare_enable(clk[IMXRT1050_CLK_PLL3_PFD1_664_62M]);
>> +       clk_prepare_enable(clk[IMXRT1050_CLK_PLL2_PFD2_396M]);
> 
> If these clocks are essential for the SoC to work, then you could pass
> the CLK_IS_CRITICAL flag instead of calling clk_prepare_enable()
> 
I'll look into that Thx
