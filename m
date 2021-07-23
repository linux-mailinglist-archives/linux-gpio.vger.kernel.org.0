Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CFB23D3BDD
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 16:36:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235376AbhGWN4Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 09:56:24 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:4722 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233665AbhGWN4Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 23 Jul 2021 09:56:24 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16NEVTgp014144;
        Fri, 23 Jul 2021 16:36:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=n+jv0fD33/CgdMUX9dBcGBkC8K9zyQoTqjfbXyjDB8Y=;
 b=lv4XIk83ZU2zORjYXmjXjx0yb+/JSUq6dh4DKuicAwRqQKcsvB0foo/dKLya+MQAt+st
 5BHueZ+73OdUhW12SqHreULH16JcOth61rDZwMB3tf6gqTpXNnOLmRBJ8GoR0FHhhtzG
 1OamR/zyDlapBO5yA7UyL6h74GUf1LSSD5cFwg2LPBVt+9pA+cYcepIrLkwkujGF/F4v
 qfE4I3oRFkdZofJCZU+p9oBYlXdMCL5IsI3LZPtyXwEqbH9lm5IuKujBhgdhxvYZNxrG
 fmKIbe3Tvux3d3zjwZANvvuuTY/qaWlKO6KJMzQlvx63trEipuesJZZfdNH75Fq5rfd2 Eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 39yt3ehux8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 23 Jul 2021 16:36:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DD00B10002A;
        Fri, 23 Jul 2021 16:36:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C2BFA2248CE;
        Fri, 23 Jul 2021 16:36:40 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 23 Jul
 2021 16:36:39 +0200
Subject: Re: [PATCH 0/7] Add STM32MP13 SoCs and discovery board support
To:     Arnd Bergmann <arnd@arndb.de>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Olof Johansson <olof@lixom.net>,
        Rob Herring <robh+dt@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        DTML <devicetree@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20210723132810.25728-1-alexandre.torgue@foss.st.com>
 <CAK8P3a1ax29ThCG867phtx1Xb12GgiJFcLDd8H9VLbsJQ1uoAw@mail.gmail.com>
From:   Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <ce1fc3e3-190f-6174-a34c-41132807f64e@foss.st.com>
Date:   Fri, 23 Jul 2021 16:36:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1ax29ThCG867phtx1Xb12GgiJFcLDd8H9VLbsJQ1uoAw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-23_08:2021-07-23,2021-07-23 signatures=0
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 7/23/21 3:46 PM, Arnd Bergmann wrote:
> On Fri, Jul 23, 2021 at 3:28 PM Alexandre Torgue
> <alexandre.torgue@foss.st.com> wrote:
>>
>> This series enhance the STM32 MPU family by adding STM32MP13 SoCs support.
>> It adds machine support and device tree diversity to support the whole
>> stm32mp13 family (STM32MP131/STM32MP133/STM32MP135, plus security feature
>> diversity).
>>
>> Basically STM32MP13 SoCs embeds one Cortex A7, storage (SD/MMC/SDIO, QSPI FMC),
>> network (ETH, CAN), display (DCMIPP, LTDC, ...), audio(SAI, DFSDM, SPDIFRX),
>> com (USB EHCI/OHCI, USB OTG, I2C, SPI/I2S, U(S)ART).
>>
>> This series also adds STM32MP135F Discovery board support (stm32mp135f-dk). It
>> embeds a STM32MP135f SOC with 512 MB of DDR3. Several connections are available
>> on this board:
>>   - 4*USB2.0, 1*USB2.0 typeC DRD, SDcard, 2*RJ45, HDMI, Combo Wifi/BT, ...
>>
>> Only SD card, uart4 (console) and watchdog IPs are enabled in this commit.
>>
>> Note that file stm32mp135.dtsi doesn't define nodes but I add it now to ease adding
>> of new nodes in a (close) future.
> 
> I had a brief look and it seems all fine to me, nice work!
> 
> The only (very minor) thing I noticed is that the crypto engine device node
> has an unusual name 'cryp@' instead of the usual 'crypto@', but this is already
> the case on stm32mp157.
> 
> With this changed,
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de
> 

Thanks Arnd. I'll change "cryp: cryp@" by "cryp: crypto@" (either in V2 
or directly during the merge).

regards
Alex
