Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5467818FD3B
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2020 20:04:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727793AbgCWTE2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Mar 2020 15:04:28 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:48858 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727451AbgCWTE2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Mar 2020 15:04:28 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 48mP213YTmz1qs3f;
        Mon, 23 Mar 2020 20:04:25 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 48mP212dwFz1qyDb;
        Mon, 23 Mar 2020 20:04:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id QqK1mG1Wus-J; Mon, 23 Mar 2020 20:04:24 +0100 (CET)
X-Auth-Info: I4MqN1cNOhqaPCP1appfZmyf8HYmdhHvee0xhz+7aVc=
Received: from [IPv6:::1] (unknown [195.140.253.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Mon, 23 Mar 2020 20:04:24 +0100 (CET)
Subject: Re: [PATCH v3 2/2] pinctrl: stm32: Add level interrupt support to
 gpio irq chip
To:     Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Alexandre Torgue <alexandre.torgue@st.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <20200219143229.18084-1-alexandre.torgue@st.com>
 <20200219143229.18084-3-alexandre.torgue@st.com>
 <CACRpkdZ7uq4U6GBQQQh=pTLf4wW3KfH3Zrz9z_3ZQgoaJD9Ynw@mail.gmail.com>
 <c991edca3e8925cf0489c0a5676f77b2@kernel.org>
From:   Marek Vasut <marex@denx.de>
Message-ID: <a7fc5e43-34c2-a4e6-e0c5-1584f17fb024@denx.de>
Date:   Mon, 23 Mar 2020 20:04:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <c991edca3e8925cf0489c0a5676f77b2@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2/20/20 10:17 AM, Marc Zyngier wrote:
> On 2020-02-20 09:04, Linus Walleij wrote:
>> On Wed, Feb 19, 2020 at 3:32 PM Alexandre Torgue
>> <alexandre.torgue@st.com> wrote:
>>
>>> GPIO hardware block is directly linked to EXTI block but EXTI handles
>>> external interrupts only on edge. To be able to handle GPIO interrupt on
>>> level a "hack" is done in gpio irq chip: parent interrupt (exti irq
>>> chip)
>>> is retriggered following interrupt type and gpio line value.
>>>
>>> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
>>> Tested-by: Marek Vasut <marex@denx.de>
>>
>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>
>> If Marc want to merge it with patch 1/2 go ahead!
> 
> I'll queue the whole thing for 5.7.

I have a feeling this doesn't work with threaded interrupts.

If the interrupt handler runs in a thread context, the EOI will happen
almost right away (while the IRQ handler runs) and so will the code
handling the IRQ retriggering. But since the IRQ handler still runs and
didn't return yet, the retriggering doesn't cause the IRQ handler to be
called again once it finishes, even if the IRQ line is still asserted.
And that could result in some of the retriggers now happening I think.
Or am I doing something wrong ?
