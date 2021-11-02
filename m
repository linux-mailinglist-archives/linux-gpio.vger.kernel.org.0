Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD6294439BA
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Nov 2021 00:30:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230516AbhKBXc6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 19:32:58 -0400
Received: from smtpcmd12131.aruba.it ([62.149.156.131]:40793 "EHLO
        smtpcmd12131.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230447AbhKBXc5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 19:32:57 -0400
Received: from [192.168.153.129] ([146.241.216.221])
        by Aruba Outgoing Smtp  with ESMTPSA
        id i3EPm4vnjnxSqi3EPmcRjP; Wed, 03 Nov 2021 00:30:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1635895819; bh=CVH4E3T74mSLJgFr0+2baxsEGjTaCKZhPlnfRz38Urk=;
        h=Subject:To:From:Date:MIME-Version:Content-Type;
        b=Uc3Rw42EQnXVNFsK02zGrc5yAf03SDmcFOlh65qeVovEWtu6bUJl1KS4DpEp/bsa0
         yah9gfcPBM25sIoH4/mR1cDwsHndi68rt5bLZo5zWWg6QR05HT2gyMkOPBho5sOF8U
         icDGb6a1G9m+iEtCsAh0MekRLU4M8k3uyWHBvQvMWJ5wSeHcmFFPGTO9nI+xrZRwSo
         B8zZbEj7Gq6xzqwYhvauGB8QC0mO0b9qSN+H7JN3AAJKOidAX2XaE6DoORmkKjeJ7L
         AnMbnC5h9ZU4uRDEPX+uF8nKK4ufX3Qylqi7jaET13hzlxpOIclqXI87zpXfCbcLuk
         4nKLDxdxtl5ug==
Subject: Re: [PATCH v2 11/13] mmc: sdhci-esdhc-imx: Add sdhc support for
 i.MXRT series
To:     Jesse Taube <mr.bossman075@gmail.com>,
        Fabio Estevam <festevam@gmail.com>
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
 <c1610093-95ae-68d3-57ae-93b1bc9715d7@gmail.com>
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <5ebe48f5-7b9c-be99-d50c-65a056084b96@benettiengineering.com>
Date:   Wed, 3 Nov 2021 00:30:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <c1610093-95ae-68d3-57ae-93b1bc9715d7@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFF0kMKCgHuPZZdTmE48caZfrYeN7mNuy9LJ5DmgdBa7PMy3yw4JyTgPV4UtB8gv8UWudxmi7EUMA7kBCNVePf5f6/hVKPgKmzEkfqfUXuHzumzwNTLp
 Q1NtqsuDyb1jwU+35ZCycH1OV5YBjAO7yqXi+7RTucxA1jN8hYaocJ2iEX2j/12cfz/5KlEowUfU2CYfZIBfFTZvYm/5/qvdh5Nv6zY8ZrcwxkQBkEoKMoyL
 bRKC6ajuyVQ7LxrOsCTs9UgQyjuKYsSuEMGHsrwoOg2cvS5bBTUtnf2utEFoOu6PTapJnzx8NYfFFCQLTAJytx9m6gzTMyEUsT4WQOpFNg1zIt59njdutT3S
 93mtFCyyLAJqjOPnaH3w1drDngGo6MdWIuTClPsbMpGY0BVurVmkhvGMqkTM6dtJ3EQRuoiz7J8hheiMZPDKjynmKkzCs8T0K0K67cb9N6LlB514im8UFZTy
 E/CyYouaf3y1yMWTOTeh8HU3Z6RtZCuTtbXD6pvCfyzjMJFJ5jWjFgTMhpDuaMwOo6OPmc9COW4NyHhI4fVDxAh1Wh/XLGyVGEzGrO4lsBCTN7DqCTe7lHnA
 UMVCb5huuzONw726B8vJOsk+5pFNwBAk2nnGev7aqPDpMxlcfuw9Rl8QafNXMHkTOGPGv1GVX/xxVP+HVrAilUqes3+OnZ+OOfA7BlrljqbvcsXLreUUmhoU
 +lL/9x7iJAslxzl/zHNgYm0vQbJiVwjKyWYS3c86tZ1PNrrBypxUBKCP1Pjr74ufE4ZeqMWAUYBqxdYZ7kAGloMdFCLVwpybUvQ/Jx7c0ECAtltSthJ8bYG/
 Blm7C9xps0o4nRT6H8AkjuYslA+rAGd8Q/TRv3apW1sAxuoFuMWlKvyZO2KNs8kNlHKfkMeAZ3ubrc+gX59FCUMQvTOM70AUrqBvGgrnmUBtbVRSdUUCWrbX
 6VlMF7RiDy6kWIeRW/skiSnPAdN0cnofXbwR0sBItsztUonf9AudWecAEkZM9mlWu2F43k0/jOmPqN+q3AcstG14vyw3v8F50L3M18jZ3rMw/TjtQU9tQiia
 dJFiLZiiKMQa/hKTfuQHLdPER3G17gr0F7Qu2ijcTqi9STRkj+7jJ1t8w+IWuEmaN0JgC5pcshctaWkITgFAuPNEn81soe4VaNY=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Fabio, Jesse, All,

On 11/3/21 12:25 AM, Jesse Taube wrote:
> 
> 
> On 11/2/21 19:17, Fabio Estevam wrote:
>> On Tue, Nov 2, 2021 at 7:57 PM Jesse Taube <mr.bossman075@gmail.com> wrote:
>>
>>>    static struct esdhc_soc_data usdhc_imx8qxp_data = {
>>>           .flags = ESDHC_FLAG_USDHC | ESDHC_FLAG_STD_TUNING
>>> @@ -357,6 +363,7 @@ static const struct of_device_id imx_esdhc_dt_ids[] = {
>>>           { .compatible = "fsl,imx7ulp-usdhc", .data = &usdhc_imx7ulp_data, },
>>>           { .compatible = "fsl,imx8qxp-usdhc", .data = &usdhc_imx8qxp_data, },
>>>           { .compatible = "fsl,imx8mm-usdhc", .data = &usdhc_imx8mm_data, },
>>> +       { .compatible = "fsl,imxrt-usdhc", .data = &usdhc_imxrt_data, },
>>
>> I thought Rob suggested to use the SoC name, so this would be:
>>
> Uh i think that may have been for the UART.
>> { .compatible = "fsl,imxrt1050-usdhc", .data = &usdhc_imxrt1050_data, },
>>
>> The same applies to the other bindings in the series.
>>
>> This way it would be possible to differentiate between future
>> supported i.MX RT devices.
>>
> This makes sense will do in V3.
> 

If we add every SoC we will end up having a long list for every device 
driver. At the moment it would be 7 parts:
1) imxrt1020
2) imxrt1024
.
.
.
7) imxrt1170

Is it ok anyway?

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
