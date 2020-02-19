Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4F54164367
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2020 12:31:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbgBSLbL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Feb 2020 06:31:11 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:25624 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726270AbgBSLbL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 19 Feb 2020 06:31:11 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01JBO558023963;
        Wed, 19 Feb 2020 12:30:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=wwdCyO89dMA9z9IZCGyAvqqIWknoG7iFZf5BCqBp83I=;
 b=wqjOPoFPdTuIlDUpFtuKYLHttV4XQQsfXHeEvKAyVjO9AXXoyt9ufUaWAmIL3soCPJLu
 F44NsL/Hq8wqDygU7xjuowsYy3NoMI8SexxP8Gve61AHl6ANp8y7Gg26qT269lMtsNuG
 Re/r03qbs0S1sXI6ofQNjheRdgXZV52BWlLcpkxnYeRTA8EMmiMYBcXXJDdllputNNuS
 8+ATB8yuAJXZhROj6+8Z9Bn8x9S+U++hjyzef9NUWdsM2i+gdHKSMzRIxmxSZBtzXABk
 6innD0lgap9KnhUSV0JShGi8y91kbi1bHDhTMAldUzFI1m9ot6olJ697rdOx6cm0Anb6 bQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2y8ub5jr0g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 19 Feb 2020 12:30:50 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7A59B100034;
        Wed, 19 Feb 2020 12:30:44 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4827A2B188F;
        Wed, 19 Feb 2020 12:30:44 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.46) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 19 Feb
 2020 12:30:43 +0100
Subject: Re: [PATCH 2/2] pinctrl: stm32: Add level interrupt support to gpio
 irq chip
To:     Marc Zyngier <maz@kernel.org>
CC:     Marek Vasut <marex@denx.de>, Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel-owner@vger.kernel.org>
References: <20200210134901.1939-1-alexandre.torgue@st.com>
 <20200210134901.1939-3-alexandre.torgue@st.com>
 <377b0895-aaeb-b12e-cad7-469332787b4e@denx.de>
 <dd6434a7-aff1-94ec-2fdf-51374c695ada@st.com>
 <b7965be80f0e5fe32599f188ae8b231d@kernel.org>
From:   Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <24e7fe14-f4a2-503a-b1a2-777b813917b8@st.com>
Date:   Wed, 19 Feb 2020 12:30:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <b7965be80f0e5fe32599f188ae8b231d@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-19_03:2020-02-19,2020-02-19 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 2/19/20 12:19 PM, Marc Zyngier wrote:
> On 2020-02-11 10:08, Alexandre Torgue wrote:
> 
> [...]
> 
>> Yes. It'll be fixed in v2.
> 
> And when you do that, please use my official email address (my @arm.com
> address goes to my ex manager, and I don't think he cares much about this).

Ok I update my script.

Alex

> 
>          M.
