Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34204459A60
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Nov 2021 04:13:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232134AbhKWDQt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Nov 2021 22:16:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbhKWDQs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Nov 2021 22:16:48 -0500
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25833C061574;
        Mon, 22 Nov 2021 19:13:41 -0800 (PST)
Received: by mail-qv1-xf33.google.com with SMTP id jo22so13914720qvb.13;
        Mon, 22 Nov 2021 19:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Sy7JaU2EDn5D2wYuyqGh4o1BUOWyto7RBqAd1Ba53AU=;
        b=lVp7SmTyo4bC69l84XIYCHz429co3+/tXnqFK2KvZYRvxj033ZXlq4sMn3O909lClG
         +N+9j3w1xiNNav8B0rlgJcmcOdN68BneiSvVDGyU09Um+v1tbjGePFsIhd7/EToH7l8J
         HUD23gTBNqiq5XGH66V6+U9Ka0g1iOPSgLkdLuJWraWOUtPu0XpNwBLK8f/pPICHEY/8
         006+EwPmVljhmm7lIvtfzCbXZ4PK7f2yJdvf/SaM9he1ethAi5EPThqtU/PG3q7fuYLs
         3LiLGCqaSXLSSeq91QI5QDT/1d45+OGepRTlfdUwE2zJHML/yiOB5cEESjb8mWKcgH4Z
         Ie/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Sy7JaU2EDn5D2wYuyqGh4o1BUOWyto7RBqAd1Ba53AU=;
        b=Snq4lmmuu6J1t2+M1MBT3mwgexmN3JRMLHC6DoS6YLHmWutY/WolPUpzZ7xI1ELTVn
         hnykpTCm+uAZkO7g13EXwnwJo1tVkI44LZ9gX4DotSanswElE4D+clKjPHoiYbIKNdxZ
         UoR/kItrBCNRrZu9VyRgXbNlFN8Ys2fCz/vFfbqWGPy+B7eozioMlIXSICKxxJCU5xoB
         TKmLM9z0AWPbk0+lVyZQr1q5VUlwqi/5KJ9wkzEpqS0rhFlQzsaNLaVBWXsVbb4gKvDJ
         1D/mF6hpaKFRnLHvL567n49WuSaH0i3/RO4su2XgTulIeAM+/AfQtSrzoV1TtgADpg1P
         JXLw==
X-Gm-Message-State: AOAM533HR0TQRUkmqGu2ryVyiowabPFUe30mQRFqlduarAtIcLtjfwj9
        hCvo0jy3EQuIvqheO3qPc4Y=
X-Google-Smtp-Source: ABdhPJxtys1Np0ntBaXrohAUw6BXAy5s++dHp2Us2B8HDqjYlTZcDXxEGJseqdiYfXGmvv6z/n3M5w==
X-Received: by 2002:a05:6214:2427:: with SMTP id gy7mr2449608qvb.38.1637637220347;
        Mon, 22 Nov 2021 19:13:40 -0800 (PST)
Received: from [10.4.10.38] (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id j126sm5502755qke.103.2021.11.22.19.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Nov 2021 19:13:39 -0800 (PST)
Message-ID: <9bcb9068-25f5-edfb-98a0-92a7e9cc1909@gmail.com>
Date:   Mon, 22 Nov 2021 22:13:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 11/13] mmc: sdhci-esdhc-imx: Add sdhc support for
 i.MXRT series
Content-Language: en-US
To:     Bough Chen <haibo.chen@nxp.com>, dl-linux-imx <linux-imx@nxp.com>
Cc:     "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "arnd@arndb.de" <arnd@arndb.de>, "olof@lixom.net" <olof@lixom.net>,
        "soc@kernel.org" <soc@kernel.org>,
        "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
        Abel Vesa <abel.vesa@nxp.com>,
        "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
        "jirislaby@kernel.org" <jirislaby@kernel.org>,
        "giulio.benetti@benettiengineering.com" 
        <giulio.benetti@benettiengineering.com>,
        "nobuhiro1.iwamatsu@toshiba.co.jp" <nobuhiro1.iwamatsu@toshiba.co.jp>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
 <20211102225701.98944-12-Mr.Bossman075@gmail.com>
 <DB7PR04MB401021F7155E723194BA857E908C9@DB7PR04MB4010.eurprd04.prod.outlook.com>
From:   Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <DB7PR04MB401021F7155E723194BA857E908C9@DB7PR04MB4010.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 11/2/21 22:19, Bough Chen wrote:
>> -----Original Message-----
>> From: Jesse Taube [mailto:mr.bossman075@gmail.com]
>> Sent: 2021年11月3日 6:57
>> To: dl-linux-imx <linux-imx@nxp.com>
>> Cc: mturquette@baylibre.com; sboyd@kernel.org; robh+dt@kernel.org;
>> shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
>> festevam@gmail.com; ulf.hansson@linaro.org; Aisheng Dong
>> <aisheng.dong@nxp.com>; stefan@agner.ch; linus.walleij@linaro.org;
>> gregkh@linuxfoundation.org; arnd@arndb.de; olof@lixom.net;
>> soc@kernel.org; linux@armlinux.org.uk; Abel Vesa <abel.vesa@nxp.com>;
>> adrian.hunter@intel.com; jirislaby@kernel.org;
>> giulio.benetti@benettiengineering.com; nobuhiro1.iwamatsu@toshiba.co.jp;
>> Mr.Bossman075@gmail.com; linux-clk@vger.kernel.org;
>> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
>> linux-kernel@vger.kernel.org; linux-mmc@vger.kernel.org;
>> linux-gpio@vger.kernel.org; linux-serial@vger.kernel.org; Jesse Taube
>> <mr.bossman075@gmail.com>
>> Subject: [PATCH v2 11/13] mmc: sdhci-esdhc-imx: Add sdhc support for
> i.MXRT
>> series
>>
>> From: Jesse Taube <mr.bossman075@gmail.com>
>>
>> Add support for i.MXRT1050's sdhc.
>>
>> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>---
>> V1->V2:
>> * Nothing done
>> ---
>>   drivers/mmc/host/sdhci-esdhc-imx.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c
>> b/drivers/mmc/host/sdhci-esdhc-imx.c
>> index afaf33707d46..c852a6df5611 100644
>> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
>> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
>> @@ -305,6 +305,12 @@ static struct esdhc_soc_data usdhc_imx7ulp_data = {
>>   			| ESDHC_FLAG_PMQOS | ESDHC_FLAG_HS400
>>   			| ESDHC_FLAG_STATE_LOST_IN_LPMODE,
>>   };
>> +static struct esdhc_soc_data usdhc_imxrt_data = {
>> +	.flags = ESDHC_FLAG_USDHC | ESDHC_FLAG_MAN_TUNING
>> +			| ESDHC_FLAG_HS200 | ESDHC_FLAG_ERR004536
>> +			| ESDHC_FLAG_BROKEN_AUTO_CMD23,
>> +};
>> +
> 
> Hi Jesse,
> 	I have few question here.
> 	Why only use manual tuning here? Does this usdhc don't support
> standard tuning? or meet any issue when use standard tuning?
No std tuning works, so does cmd23, i changed it to use them.
> 	Please also double check why not use ADMA in default? Any issue
> found?
Yes this is the output with ADMA:
[0.00] mmc0: Unable to allocate ADMA buffers - falling back to standard DMA
NOTE: I did not look into why this occurs.
> 	
> 
> Best Regards
> Haibo Chen
>>
>>   static struct esdhc_soc_data usdhc_imx8qxp_data = {
>>   	.flags = ESDHC_FLAG_USDHC | ESDHC_FLAG_STD_TUNING @@ -357,6
>> +363,7 @@ static const struct of_device_id imx_esdhc_dt_ids[] = {
>>   	{ .compatible = "fsl,imx7ulp-usdhc", .data = &usdhc_imx7ulp_data, },
>>   	{ .compatible = "fsl,imx8qxp-usdhc", .data = &usdhc_imx8qxp_data, },
>>   	{ .compatible = "fsl,imx8mm-usdhc", .data = &usdhc_imx8mm_data, },
>> +	{ .compatible = "fsl,imxrt-usdhc", .data = &usdhc_imxrt_data, },
>>   	{ .compatible = "nxp,s32g2-usdhc", .data = &usdhc_s32g2_data, },
>>   	{ /* sentinel */ }
>>   };
>> --
>> 2.33.1
> 
