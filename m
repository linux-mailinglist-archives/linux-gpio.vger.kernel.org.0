Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 481B21E0E52
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2020 14:22:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390509AbgEYMWf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 May 2020 08:22:35 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:34673 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390488AbgEYMWe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 25 May 2020 08:22:34 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id dC7fj8fagdPgTdC7ijaZQo; Mon, 25 May 2020 14:22:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1590409351; bh=B004EXCgq5FrmDeibsrHD2vF8zO47mml9XuJ8YnmPBQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=iKYRZLN0U0CQNPfS5AXa4jjimA9eaomJkUa2wkjeWE5ZnZkSI4PTbjCVhKKJCSddh
         rMwqG3oGB0g7RzXqBaxUrsvGJl+upwNmlzpHl05FZo96sREURbXOZboeJDjjQLgpYH
         mYEEKAffzQ3n9IisUK/1R49OMQvrnSTYkDSNdUu4qqVIbbQX+Tq4xBsxgfSVF4drcM
         7VPhkkhNuJqsTTCdddpphL9rl23YZLjpwBn1gZDNTEK5Hl6m14RknIoF8hCgsMYCXu
         jn2ENJSmwtQdilS7ZiE6pDsNg0qIL2XCfimgSFm8FG32gchMQIckSd8u683IH/cNCU
         ylym6wnDvFgmA==
Subject: Re: [PATCH v2 1/4] gpio: gpiolib: Allow GPIO IRQs to lazy disable
To:     Linus Walleij <linus.walleij@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Doug Anderson <dianders@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org
References: <1590253873-11556-1-git-send-email-mkshah@codeaurora.org>
 <1590253873-11556-2-git-send-email-mkshah@codeaurora.org>
 <CACRpkdba9j4EdCkD5OeL=3A4Zeb57vO78FAXA9fo0SOgBE57ag@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <e4ebd476-1c34-0c58-bba0-14dfd4d31941@xs4all.nl>
Date:   Mon, 25 May 2020 14:22:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdba9j4EdCkD5OeL=3A4Zeb57vO78FAXA9fo0SOgBE57ag@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOGdb2RJOxdUV50pu4jnoPs5bZNeYuMlblQqlhIhssLZRmK5wQA0xb9Rm7/40hdvblQdz0Kb59N1KM362w7jtAh4KEHh2xtaGge1gIv38uJ9stTMJ+fB
 2d9RBuCzmC/HvkVoNwEEa77G16IuQpXqcpdojxRMeFgz0I2MLZbUyKK99Fpbl/fQYNzrKG5DX1sQqJS5Isq1hH+NjuwTG9BOp2YM2NMzYglSYxylS0RVf17X
 VVq6+QAWQf55rXB1yf9ahsKGJjZZm0HchaQA794/RPJDZA9hxsTO427mQ2leGiGA8eGMDSpOqc8G5g8P9iJbhMi6zljI+4W+836MCc0Rp5Sp7U0frjwS3eDL
 z39sMoL3JFrSCbPHhIKpGwYWAV39eF8ftDzL1rEUyjkqRhIwxMMtA920vVuFIhXzBRsUuvBaR/8VHczH9QLuZujouYmyvj4KL9x9aEjSD4wmg4TVUMldOxAQ
 Yd9bbgJ5D4YIZ0bmGu/5fVWb60+++5VQvjQSeNJdMCTj4dl/xqOXoAMW1Dw7PYaS0RQ4Nw6exPIzzICGKbGaQmVEp9nxROHF6XufAKunk+Z98sVPccrN2a7M
 nZNSetq3KERNU5rc9Tyl7WWSgAVDsaeTJkqzhyyZ3Rvd2jM5meMyfytFPz3Uoy0kK8skMVIZdYeqk/dRLY1QuuXCZvIGydMUmO8IS+zlUJ9FxcnUtdGUwGkP
 ayqvEtVpjJA=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 25/05/2020 13:55, Linus Walleij wrote:
> On Sat, May 23, 2020 at 7:11 PM Maulik Shah <mkshah@codeaurora.org> wrote:
> 
>> With 'commit 461c1a7d4733 ("gpiolib: override irq_enable/disable")' gpiolib
>> overrides irqchip's irq_enable and irq_disable callbacks. If irq_disable
>> callback is implemented then genirq takes unlazy path to disable irq.
>>
>> Underlying irqchip may not want to implement irq_disable callback to lazy
>> disable irq when client drivers invokes disable_irq(). By overriding
>> irq_disable callback, gpiolib ends up always unlazy disabling IRQ.
>>
>> Allow gpiolib to lazy disable IRQs by overriding irq_disable callback only
>> if irqchip implemented irq_disable. In cases where irq_disable is not
>> implemented irq_mask is overridden. Similarly override irq_enable callback
>> only if irqchip implemented irq_enable otherwise irq_unmask is overridden.
>>
>> Fixes: 461c1a7d47 (gpiolib: override irq_enable/disable)
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> 
> I definitely want Hans Verkuils test and review on this, since it
> is a usecase that he is really dependent on.

Maulik, since I am no longer subscribed to linux-gpio, can you mail the
series to me?

I have two use-cases, but I can only test one (I don't have access to the
SBC I need to test the other use-case for the next few months).

Once I have the whole series I'll try to test the first use-case and at
least look into the code if this series could affect the second use-case.

Regards,

	Hans

> 
> Also the irqchip people preferredly.
> 
> But it does seem to mop up my mistakes and fix this up properly!
> 
> So with some testing I'll be happy to merge it, even this one
> patch separately if Hans can verify that it works.
> 
> Yours,
> Linus Walleij
> 

