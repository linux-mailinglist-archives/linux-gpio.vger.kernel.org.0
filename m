Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F3411643A9
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2020 12:48:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbgBSLst (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Feb 2020 06:48:49 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:28866 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726495AbgBSLss (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 19 Feb 2020 06:48:48 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01JBljd3031749;
        Wed, 19 Feb 2020 12:48:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=ppGyWN/rpvA2EeDjdJUYYRKU10eqJrd2U/W28J2fkE8=;
 b=vJIGRiXrJcum25nl1bU5aAhwtJPba7wsfayg63db9VmlnPGbnQnXfiITtdETz/3amIFY
 q2+1FHJdUzoDtWSe0xbwpIaWb2zNsacSGKYla6z+f+nY4AGFaVlBpUSfdNXzvHl2dxiY
 2bRxu000aPySznEKvoolOx6G1NkaZ6mrO0V3uHdZDcVE0fgeMsvEXwafV86VYKOfWR62
 e0KS0rhFfXS2svQeSEWduBJGC+wk0rXA+5ynGDMDW4qp5oLQHRSICfh40kDUrs+KPP/P
 g98+9G1B03wjJfXozEOGQ3GpPlhwl+cBQ64D1e75GlZF3KlG3EA5ePzd2PbqlPxs+LsZ zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2y8ub02rur-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 19 Feb 2020 12:48:30 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 385BE10002A;
        Wed, 19 Feb 2020 12:48:30 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 212092B2E12;
        Wed, 19 Feb 2020 12:48:30 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.44) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 19 Feb
 2020 12:48:29 +0100
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
 <24e7fe14-f4a2-503a-b1a2-777b813917b8@st.com>
 <3d6e666de8e65f913d9f90c67d5d8e46@kernel.org>
From:   Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <3524657d-98b1-803b-6ead-e206daf08dc5@st.com>
Date:   Wed, 19 Feb 2020 12:48:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <3d6e666de8e65f913d9f90c67d5d8e46@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-19_03:2020-02-19,2020-02-19 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 2/19/20 12:39 PM, Marc Zyngier wrote:
> On 2020-02-19 11:30, Alexandre Torgue wrote:
>> On 2/19/20 12:19 PM, Marc Zyngier wrote:
>>> On 2020-02-11 10:08, Alexandre Torgue wrote:
>>>
>>> [...]
>>>
>>>> Yes. It'll be fixed in v2.
>>>
>>> And when you do that, please use my official email address (my @arm.com
>>> address goes to my ex manager, and I don't think he cares much about 
>>> this).
>>
>> Ok I update my script.
> 
> Surely your script is a wrapper around scripts/get_maintainer.pl, right?

No. it's an old script which create groups (hard coded) to be used for 
git send-mail. But yes, a good improvement would be to use 
get_maintainer.pl.

> 
>          M.
