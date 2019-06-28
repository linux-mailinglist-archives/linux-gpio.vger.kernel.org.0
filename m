Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37F1759720
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2019 11:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbfF1JQL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Jun 2019 05:16:11 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:50904 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726819AbfF1JQI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Jun 2019 05:16:08 -0400
Received: from nat-ies.mentorg.com ([192.94.31.2] helo=svr-ies-mbx-01.mgc.mentorg.com)
        by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
        id 1hgmzH-0001Ld-Hn from Harish_Kandiga@mentor.com ; Fri, 28 Jun 2019 02:16:07 -0700
Received: from [10.0.3.15] (137.202.0.90) by svr-ies-mbx-01.mgc.mentorg.com
 (139.181.222.1) with Microsoft SMTP Server (TLS) id 15.0.1320.4; Fri, 28 Jun
 2019 10:16:03 +0100
Subject: Re: [PATCH V4 1/2] gpio: inverter: Add Inverter controller for gpio
 configuration
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Balasubramani Vivekanandan 
        <balasubramani_vivekanandan@mentor.com>
References: <1561699236-18620-1-git-send-email-harish_kandiga@mentor.com>
 <1561699236-18620-2-git-send-email-harish_kandiga@mentor.com>
 <CACRpkdZQpr78=ZzBQEkbjS714W0HPEurO8haM8PpmpvYFivm-A@mail.gmail.com>
From:   Harish Jenny K N <harish_kandiga@mentor.com>
Message-ID: <d70eec4a-a2e3-f312-d3ef-4a2f653ec9de@mentor.com>
Date:   Fri, 28 Jun 2019 14:45:54 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CACRpkdZQpr78=ZzBQEkbjS714W0HPEurO8haM8PpmpvYFivm-A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 28/06/19 2:25 PM, Linus Walleij wrote:
> On Fri, Jun 28, 2019 at 6:20 AM Harish Jenny K N
> <harish_kandiga@mentor.com> wrote:
>
>> Provides a new inverter gpio controller to configure the polarity
>> of the gpio pins. This driver enables the consumers to directly
>> use the gpio pin without worrying about the hardware level
>> polarity configuration. Polarity configuration will be done by
>> the inverter gpio controller based on device tree information.
>>
>> Signed-off-by: Balasubramani Vivekanandan <balasubramani_vivekanandan@mentor.com>
>> Signed-off-by: Harish Jenny K N <harish_kandiga@mentor.com>
> This code is finished, very nice.


Thanks.

>
> We still need some review from the DT people before I
> apply it.


Are the DT people in the same mailing list or do I need to send review request separately ?

Regards,

Harish Jenny K N


