Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4126E22B0ED
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jul 2020 16:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728002AbgGWOCn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jul 2020 10:02:43 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:45214 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727111AbgGWOCm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 23 Jul 2020 10:02:42 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06NDrCdw019917;
        Thu, 23 Jul 2020 16:02:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=2s9++maMnmQlaHoFweGqpleGAEqmizK6DFBHoz7LIV4=;
 b=RVPyEEp93S5zGSAdEbIBRtATQnRmu2fwnM3B+KN55e564gWntEnnsFdrugQOZJGBNqCY
 0AOs7cPq9KbLg3rG8oc9Ogi2iwyTzKLJbwgdzu/uiN4x1Sr2Pv/E/fDwY8jznUXpnk9Z
 tXtxY28F1NFZSNN3K/pwQ36ylU29Cg+Luz8NU7CzhUGGyMkh8+71Um8Aa07y2tylfHqV
 Opn96A4NwmtmUhj+1C3VbbX3xkrXX58iQ+Mll6GOa49hm6xH0VL5YwVO3OoOCa9UUjsY
 Yda7aJ9UiCL7Gth0GwNXS3Hv0BnzLGGimrfDMJwimBMb6JL/gBWjgQHIVHs7scHOPPLD xQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 32bsahb4as-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 23 Jul 2020 16:02:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6C5E210002A;
        Thu, 23 Jul 2020 16:02:35 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5DFDA2B8A05;
        Thu, 23 Jul 2020 16:02:35 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.47) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 23 Jul
 2020 16:02:33 +0200
Subject: Re: [PATCH] pinctrl: stm32: use the hwspin_lock_timeout_in_atomic()
 API
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20200615124456.27328-1-alexandre.torgue@st.com>
 <CACRpkdbWUop6hyKM80zxaz85oQ8BfDLCtxBTzjOypnDpUm-a4Q@mail.gmail.com>
From:   Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <7f9648bd-6dcc-de70-a713-e889caf021ba@st.com>
Date:   Thu, 23 Jul 2020 16:02:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdbWUop6hyKM80zxaz85oQ8BfDLCtxBTzjOypnDpUm-a4Q@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-23_06:2020-07-23,2020-07-23 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 7/23/20 3:20 PM, Linus Walleij wrote:
> On Mon, Jun 15, 2020 at 2:44 PM Alexandre Torgue
> <alexandre.torgue@st.com> wrote:
> 
>> From: Fabien Dessenne <fabien.dessenne@st.com>
>>
>> Use the hwspin_lock_timeout_in_atomic() API which is the most appropriated
>> here. Indeed:
>> - hwspin_lock_() is called after spin_lock_irqsave()
>> - the hwspin_lock_timeout() API relies on jiffies count which won't work
>>    if IRQs are disabled which is the case here.
>>
>> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
>> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> 
> Patch applied, sorry for missing this one.

No pb, thanks.

> 
> Yours,
> Linus Walleij
> 
