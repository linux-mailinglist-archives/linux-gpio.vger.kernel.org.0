Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1DBE162DCF
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2020 19:10:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgBRSKg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Feb 2020 13:10:36 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:7280 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726246AbgBRSKf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 Feb 2020 13:10:35 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01IHrvve005912;
        Tue, 18 Feb 2020 19:10:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=xNEAHaZmjG+dizQJ5LA4/u9LlslrrIeo9frKOjluLvE=;
 b=Sb5mUHF4yAYaVeseQBJjLZ7YzajRiE1kCopcm9LPWaRW1xn61nDZjUAxa+gxxFs8rJea
 tmxeol4PqiGdtrkiqPrSLHPntmKa33mJ/1T8V06KIH40z0WWtJitSKkYVPvaqC/DQbTV
 yn/DbmpuTJQIQjQxVS1XqEUcU8ilAZAgwPARUhpcVe+523xRVD4XzDDVSvmY+E4wu/bj
 RRqbo40k6/RZBeJ8yc2uPcpSU+MpaFuci7htgzh1/Sca3AxpGEMNIY+xQdGSxtbL5A/0
 Vqxizj+wlSZw6kouhxziZq8fr2BLfS5XG3h7vOxgDv1ngzIHTZrSoisJ8cz4l/XwU8iC EQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2y66ne2xwn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 18 Feb 2020 19:10:18 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D8CFA10003D;
        Tue, 18 Feb 2020 19:10:13 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A81F92BD50D;
        Tue, 18 Feb 2020 19:10:13 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.47) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 18 Feb
 2020 19:10:12 +0100
Subject: Re: [PATCH v2 0/2] Add GPIO level-sensitive interrupt support
To:     Marek Vasut <marex@denx.de>, Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
References: <20200218131218.10789-1-alexandre.torgue@st.com>
 <b5a2dcab-06db-4863-ac5c-28f4ef0c5ac9@denx.de>
From:   Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <32e409e6-d475-802a-6a90-c8ba6c0cf6d5@st.com>
Date:   Tue, 18 Feb 2020 19:10:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <b5a2dcab-06db-4863-ac5c-28f4ef0c5ac9@denx.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-18_05:2020-02-18,2020-02-18 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Marek

On 2/18/20 5:25 PM, Marek Vasut wrote:
> On 2/18/20 2:12 PM, Alexandre Torgue wrote:
>> This series adds the possibility to handle gpio interrupts on level.
>>
>> GPIO hardware block is directly linked to EXTI block but EXTI handles
>> external interrupts only on edge. To be able to handle GPIO interrupt on
>> level a "hack" is done in gpio irq chip: parent interrupt (exti irq chip)
>> is retriggered following interrupt type and gpio line value.
>>
>> In exti irq chip, retrigger ops function is added.
> 
> btw. this might be unrelated, but is it possible to have e.g. gpioC2 set
> as trigger-level-low and gpioD2 set as trigger-edge-falling ? It seems
> 8eb2dfee9fb1 ("pinctrl: stm32: add lock mechanism for irqmux selection")
> prevents that.
> 

No it's not possible. Each gpio line doesn't have a dedicated Exti line 
Each Exti line is muxing between gpio banks.

Mapping is done as following:

EXTI0 = A0 or B0 or C0 .... or Z0 : selected by Mux
EXTI1 = A1 or B1 or C1 ....or Z1 : selected by Mux
EXTI2 = A2 or B2 or C2 ....or Z2 : selected by Mux
...

regards
Alexandre
