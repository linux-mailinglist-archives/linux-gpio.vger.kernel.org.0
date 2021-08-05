Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C39013E16FA
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Aug 2021 16:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241960AbhHEO35 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Aug 2021 10:29:57 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:40964 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240801AbhHEO35 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Aug 2021 10:29:57 -0400
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 175EBmGX031318;
        Thu, 5 Aug 2021 16:29:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=64HVz0Gg+wUo7z89cmaaEfQ54A59MSPLHnaUZCxYN+8=;
 b=4L4CeUNf2sOsb8dX3pB3ooJ6Sbv97tbMXVQiszaUfnQ1dr/ytgBL5M5jfcezU+g66R45
 tvaUPcthHSfmduxSGx7CsZMlX99N4BDWHGISL5LdG6pcgAb5wuiFBNZuJ6H6bmSq4M2k
 WBh0uxqTxp54H/erqxdmyKxrlmR7MmORGbYYyZW5sBL+HbmwHpLx0HA3XxJLBqaiO1lG
 UmwkhNgF57MZQcIEDX1N7rGWSQPxHoQPmdrl2vg4SwdkwfashSazYfhOd7i8SjA0u4W3
 R9hdzF3LlxDCsDd4LNtjDLigyz47TTcxl7Pi0cSkef0OOmudIEu0BqaVgoccTi4UkWeg yQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3a854tkmf9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 05 Aug 2021 16:29:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1C97410002A;
        Thu,  5 Aug 2021 16:29:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 008BD22FA5A;
        Thu,  5 Aug 2021 16:29:21 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 5 Aug
 2021 16:29:21 +0200
Subject: Re: [PATCH 1/7] dt-bindings: pinctrl: stm32: add new compatible for
 STM32MP135 SoC
To:     Linus Walleij <linus.walleij@linaro.org>, <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>, <robh+dt@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>
CC:     <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20210723132810.25728-1-alexandre.torgue@foss.st.com>
 <20210723132810.25728-2-alexandre.torgue@foss.st.com>
From:   Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <1d7fe9a6-bf37-e8ca-1bc3-fda536a10359@foss.st.com>
Date:   Thu, 5 Aug 2021 16:29:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723132810.25728-2-alexandre.torgue@foss.st.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-08-05_05:2021-08-05,2021-08-05 signatures=0
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus

On 7/23/21 3:28 PM, Alexandre Torgue wrote:
> New compatible to manage ball out and pin muxing of STM32MP135 SoC.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> index 72877544ca78..dfee6d38a701 100644
> --- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> @@ -24,6 +24,7 @@ properties:
>         - st,stm32f746-pinctrl
>         - st,stm32f769-pinctrl
>         - st,stm32h743-pinctrl
> +      - st,stm32mp135-pinctrl
>         - st,stm32mp157-pinctrl
>         - st,stm32mp157-z-pinctrl
>   
> 

If you are ok with this patch, can I take it in my tree to avoid yaml 
validation issue ? If you disagree I'll wait the next cycle to take DT 
patches.

cheers
alex
