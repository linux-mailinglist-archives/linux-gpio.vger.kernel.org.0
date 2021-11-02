Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BCF944399D
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Nov 2021 00:25:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230299AbhKBX2b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 19:28:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbhKBX2b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 19:28:31 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9964C061714;
        Tue,  2 Nov 2021 16:25:55 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id s9so671337qvk.12;
        Tue, 02 Nov 2021 16:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=1Q2vdfG7RGBNovRi6ZQgZ1wF88cREbVfT7Wm+Vm56C0=;
        b=nin7+qKSHkzYWEGvEdvgnH3/O8EKsM31mjLCTIVDC0RU6Gjmc6FDyPc3T7eF1RLPbV
         q+so6Yb1Mj9jH6UXA2ptlzJYWBOKXBKRIrWI6pfZntqMT5T8QuT7O6mLm5RZqOThkg8j
         VfijQqx9EXqMw/1Lt/mInH5GPH3krcyc3y8Xl/JPvvxIZzizcIU8bUJUjFq3RzlipP7B
         QKzywxYCjyBUh0Bqv/3+7N6sbK+brvEPio3NBypN15XXjUPuKu92W7ydx+jERRd1+w+Y
         4bmPiTDHiXBJr8+sl6WQ3KzH+8mU+04ZEHriY+Drn+c4+lfz5PorTr4Kb6P+mM5+LlQK
         +tfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1Q2vdfG7RGBNovRi6ZQgZ1wF88cREbVfT7Wm+Vm56C0=;
        b=o0CopbaikGRGR2kfGFzZp0xRvyqco0jf0iAY+NZGVYX+SGxyTFyLaKdnzxWF9AVyrl
         dTduxkXkG5SO7yVaUOsBYDWVqfcFfO0TJW22A3OrRjbgPS52HlY/XXkZL6wGgWgRQNKb
         NGxmgcwP6F6/pMreKtHhyrnCpURW9KXx1/MXQRZYKN3rqeAyBFzQ6Z4i5JNdXlJk7MWu
         A/04ku9Xi14LQNOKrVY7KXzI+AZa71cy4vLg175AeWHjaLow4AOZwS/RlyVfYKXfWxgf
         pE2mbZGH/A8Gs8RgpONyQCBNbI1lh1/bhRP5JNGxoLSkwLWzjVYmiISyymJvgFzQEaZU
         Ywug==
X-Gm-Message-State: AOAM532vwmg5c3DWOnsZiwqVUSp4NB0SSNj0y4DBa/GdfO3uYfy4hsfy
        35PMz0q1oeWxs493JlRuYno=
X-Google-Smtp-Source: ABdhPJy433blIlKuyCcnmKWrFmRgcmIIJ8Ghs12aXE0aeRJk94WZUPEN2SxC+eIuy2D2cCyxLBwFRA==
X-Received: by 2002:ac8:3d49:: with SMTP id u9mr42492742qtf.264.1635895554931;
        Tue, 02 Nov 2021 16:25:54 -0700 (PDT)
Received: from [10.4.10.38] (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id k16sm295890qkj.70.2021.11.02.16.25.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 16:25:54 -0700 (PDT)
Message-ID: <c1610093-95ae-68d3-57ae-93b1bc9715d7@gmail.com>
Date:   Tue, 2 Nov 2021 19:25:52 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 11/13] mmc: sdhci-esdhc-imx: Add sdhc support for
 i.MXRT series
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
 <20211102225701.98944-12-Mr.Bossman075@gmail.com>
 <CAOMZO5AxMXxDkNDqGJDhtepqSUxGRCWO+L=c67O==4fx66M7XQ@mail.gmail.com>
From:   Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <CAOMZO5AxMXxDkNDqGJDhtepqSUxGRCWO+L=c67O==4fx66M7XQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 11/2/21 19:17, Fabio Estevam wrote:
> On Tue, Nov 2, 2021 at 7:57 PM Jesse Taube <mr.bossman075@gmail.com> wrote:
> 
>>   static struct esdhc_soc_data usdhc_imx8qxp_data = {
>>          .flags = ESDHC_FLAG_USDHC | ESDHC_FLAG_STD_TUNING
>> @@ -357,6 +363,7 @@ static const struct of_device_id imx_esdhc_dt_ids[] = {
>>          { .compatible = "fsl,imx7ulp-usdhc", .data = &usdhc_imx7ulp_data, },
>>          { .compatible = "fsl,imx8qxp-usdhc", .data = &usdhc_imx8qxp_data, },
>>          { .compatible = "fsl,imx8mm-usdhc", .data = &usdhc_imx8mm_data, },
>> +       { .compatible = "fsl,imxrt-usdhc", .data = &usdhc_imxrt_data, },
> 
> I thought Rob suggested to use the SoC name, so this would be:
> 
Uh i think that may have been for the UART.
> { .compatible = "fsl,imxrt1050-usdhc", .data = &usdhc_imxrt1050_data, },
> 
> The same applies to the other bindings in the series.
> 
> This way it would be possible to differentiate between future
> supported i.MX RT devices.
> 
This makes sense will do in V3.
