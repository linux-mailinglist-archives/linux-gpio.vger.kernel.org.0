Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12FB0252B37
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Aug 2020 12:15:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728281AbgHZKPl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Aug 2020 06:15:41 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:56494 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728191AbgHZKPk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Aug 2020 06:15:40 -0400
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1598436938;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=rMxf05Zh5rg5fiuN4Y5ZaPXwW3Mlg4s5ZeNNHexJaj4=;
        b=CHzqWuIQH5JHUjI0kmpjxllDQTFu2MfaeG4HSUFmw6DiNvaZVgeOuzogrvmMdUGpIdZ71X
        Im4rQxXlBwO7QKb+Vp8thpbPPIvcH5cNPbpCXwf3342/4QjPVvDD5gCPS0CAwHblqVreTA
        iwBhmBXxtD1MMH10wRAlaAEfXMK1dHD0OrP31zwvGGEFe24P7lJ3Ei5BJCmfOCYZ8vygyi
        1K8SSsRYbDLIUdlhO2XYuVSsRwYNN6dvzuHuOxP5H8sll527qkTW+WDEujumA+jvpfpLnG
        eiIHsCPT3tM3cUbU9otpdyTx0Ed1vgkufiRFG95YvpWxMg8Iq/hPkgPMTnV6KQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1598436938;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=rMxf05Zh5rg5fiuN4Y5ZaPXwW3Mlg4s5ZeNNHexJaj4=;
        b=Klejnk9mTGP+PDaLOLuyNlPzRoehYgLlmsRSMQ7iaxGUpPi8n2jJsgYQ5F98S21EG6IpU7
        GuYrJMYy6mM+xyDQ==
To:     Maulik Shah <mkshah@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, linus.walleij@linaro.org, maz@kernel.org,
        mka@chromium.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org
Subject: Re: [PATCH v5 3/6] genirq/PM: Introduce IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND flag
In-Reply-To: <8763521f-b121-877a-1d59-5f969dd75e51@codeaurora.org>
References: <1598113021-4149-1-git-send-email-mkshah@codeaurora.org> <1598113021-4149-4-git-send-email-mkshah@codeaurora.org> <159835036999.334488.14725849347753031927@swboyd.mtv.corp.google.com> <874koqxv6t.fsf@nanos.tec.linutronix.de> <8763521f-b121-877a-1d59-5f969dd75e51@codeaurora.org>
Date:   Wed, 26 Aug 2020 12:15:37 +0200
Message-ID: <87y2m1vhkm.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 26 2020 at 15:22, Maulik Shah wrote:
> On 8/26/2020 3:08 AM, Thomas Gleixner wrote:
>>> Where is the corresponding change to resume_irq()? Don't we need to
>>> disable an irq if it was disabled on suspend and forcibly enabled here?
>>>
> I should have added comment explaining why i did not added.
> I thought of having corresponding change to resume_irq() but i did not 
> kept intentionally since i didn't
> observe any issue in my testing.

That makes it correct in which way? Did not explode in my face is hardly
proof of anything.

> Actually the drivers which called (disable_irq() + enable_irq_wake()), 
> are invoking enable_irq()
> in the resume path everytime. With the driver's call to enable_irq() 
> things are restoring back already.

No, that's just wrong because you again create inconsistent state.

> If above is not true in some corner case, then the IRQ handler of
> driver won't get invoked, in such case, why even to wake up with such
> IRQs in the first place, right?

I don't care about the corner case. If the driver misses to do it is
buggy in the first place. Silently papering over it is just mindless
hackery.

There are two reasonable choices here:

1) Do the symmetric thing

2) Let the drivers call a new function disable_wakeup_irq_for_suspend()
   which marks the interrupt to be enabled from the core on suspend and
   remove the enable call on the resume callback of the driver.

   Then you don't need the resume part in the core and state still is
   consistent.

I'm leaning towards #2 because that makes a lot of sense.

Thanks,

        tglx
