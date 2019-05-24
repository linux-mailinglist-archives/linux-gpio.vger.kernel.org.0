Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1E3929801
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2019 14:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391289AbfEXM1o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 May 2019 08:27:44 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:8646 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2391244AbfEXM1o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 24 May 2019 08:27:44 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4OCJ95L021182;
        Fri, 24 May 2019 14:27:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=MdpIdUdNGJR6m4iESQ3gTxnReITFgYYhJ/kDykj9tog=;
 b=I9t2r1VA8l2a7kr7zIZnBibwo+QjBbH1wDc+jwQ5/0t0RfGUSDAkjkMiQ8p1JNJQ5X42
 peFlxwVSZ00L4hJmPpGv45mLkjtXnMEGnHq4Pojwux83AKCe5AWsOjLLXKq+Vcn+8jD9
 3FkCwXGEsI8GQEfqyslfRbUEhBtuvVoYEhz0wvDEcT1nvjDN8kHvHqdqNkjkGLawOQnG
 p9WNLO7Tb+5UezMvRsI1ttZhyrFa7vHzHgVL5DzJHgeBXAcekRr/cC5QRwNqQWVDANDk
 q3UWWniN8o3t1SpLuQmgu24AVcILsESj0IecZphlm2Gva2+Ly5vC72Wkq/7m4lHP43qH 7A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2sj774nn1r-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Fri, 24 May 2019 14:27:37 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E567038;
        Fri, 24 May 2019 12:27:36 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CD1912BCE;
        Fri, 24 May 2019 12:27:36 +0000 (GMT)
Received: from [10.48.0.204] (10.75.127.50) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 24 May
 2019 14:27:36 +0200
Subject: Re: [PATCH] pinctrl: stm32: add lock mechanism for irqmux selection
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <1557474183-19719-1-git-send-email-alexandre.torgue@st.com>
 <CACRpkdZ4P=PSCu86p48nBPeVk-h5T0Ytc1CYV3XZGd4fLuJLGw@mail.gmail.com>
From:   Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <ae00fd9c-d25e-c401-4d21-d526a63538f2@st.com>
Date:   Fri, 24 May 2019 14:27:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CACRpkdZ4P=PSCu86p48nBPeVk-h5T0Ytc1CYV3XZGd4fLuJLGw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-24_05:,,
 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 5/24/19 1:26 PM, Linus Walleij wrote:
> On Fri, May 10, 2019 at 9:43 AM Alexandre Torgue
> <alexandre.torgue@st.com> wrote:
> 
>> GPIOs are split between several banks (A, B, ...) and each bank can have
>> up to 16 lines. Those GPIOs could be used as interrupt lines thanks to
>> exti lines. As there are only 16 exti lines, a mux is used to select which
>> gpio line is connected to which exti line. Mapping is done as follow:
>>
>> -A0, B0, C0.. -->exti_line_0 (X0 selected by mux_0)
>> -A1, B1, C1.. -->exti_line_1 (X1 selected by mux_1)
>> ...
>>
>> This patch adds a protection to avoid overriding on mux_n for exti_line_n.
>>
>> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> 
> Patch applied, can't say I fully understand it but you know what
> you're doing!

Thanks :). Do you need a better explanation ?

> 
> Yours,
> Linus Walleij
> 
