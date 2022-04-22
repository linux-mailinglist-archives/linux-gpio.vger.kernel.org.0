Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1092C50B4F2
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Apr 2022 12:25:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233905AbiDVK2i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Apr 2022 06:28:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233879AbiDVK2h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Apr 2022 06:28:37 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F83A546BE
        for <linux-gpio@vger.kernel.org>; Fri, 22 Apr 2022 03:25:44 -0700 (PDT)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23M9H37f028185;
        Fri, 22 Apr 2022 12:25:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=8wWAgJP7/dwDs/xoLVcxe4nIqREZiN+wBYa1KXpuRmg=;
 b=6Q6XD2F7blTKGNKtrJkuBSgcIBay7/WHXALf5SbnlaHEVWmrwcpe2Dt/v6qP1TcQwm/L
 FzSDOCoajGN3N2Fb2jFiwuzkZlrJuMPlAUq191jsxSTkoK0COhmgZRxqUk88t85WC2iw
 OGzIPUmOYfGUOJs1IAjXdi1W76vXRcr2uJhgpMrnwgziRiaupIEIy7C6YIkHJSD7rIqJ
 P0P1C+W/WU/I75p01hM9aKcgdAApUXFZPOzUCTVL9Exz5M7npacYtGBa43k4x2jnNEts
 xjYajYWaE4HXZIXkbiwpmjoOo1NWy06/qSxYsE+QeH/Aiy7N1UmAtpHlqBZB7QCHElLf zg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fkskgrcdy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 22 Apr 2022 12:25:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8E57D100034;
        Fri, 22 Apr 2022 12:25:31 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 83FC721FE9A;
        Fri, 22 Apr 2022 12:25:31 +0200 (CEST)
Received: from [10.211.7.146] (10.75.127.49) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 22 Apr
 2022 12:25:30 +0200
Message-ID: <85d3b83b-4c2c-7cd8-2147-0a58c5bb8251@foss.st.com>
Date:   Fri, 22 Apr 2022 12:25:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] irqchip/stm32: Keep pinctrl block clock enabled when
 LEVEL IRQ requested
Content-Language: en-US
To:     Marc Zyngier <maz@kernel.org>
CC:     Marek Vasut <marex@denx.de>, <linux-gpio@vger.kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20220421140827.214088-1-marex@denx.de>
 <5f3aa91e-0ca3-a13a-1ea3-daae982b3d8f@foss.st.com>
 <878rrxa0rr.wl-maz@kernel.org>
From:   Fabien DESSENNE <fabien.dessenne@foss.st.com>
In-Reply-To: <878rrxa0rr.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-22_02,2022-04-22_01,2022-02-23_01
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Mark and Marek,

My intention was to have a single commit, instead of two commits with 
the second one making a part of the previous one obsolete.

Nevertheless I understand your points which are valid, so I will review 
Marek's patch first before submitting another patch.

BR
Fabien


On 22/04/2022 12:08, Marc Zyngier wrote:
> On Fri, 22 Apr 2022 10:20:36 +0100,
> Fabien DESSENNE <fabien.dessenne@foss.st.com> wrote:
>>
>> Hi Marek,
>>
>> I agree there is something wrong with the clock management in IRQ
>> context here and your patch goes in the right way.
>> There are also some other problems regarding performance (enabling /
>> disabling clock each time we want to change the IO value, ...).
>> For these both issues I have a patch, which basically keeps the GPIO
>> clocks enabled from probe.
>> I did not have time to submit it, but, considering your concerns, I
>> will do it in the coming days.
>> For the time being I suggest that we do not apply your patch.
> 
> Why? This fixes a glaring issue, and there are no alternatives at the
> moment. So if there is something to improve on, please base your patch
> on top of Marek's.
> 
> Thanks,
> 
> 	M.
> 
