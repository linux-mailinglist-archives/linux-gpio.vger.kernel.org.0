Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD5A92522F5
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Aug 2020 23:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbgHYVih (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Aug 2020 17:38:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726222AbgHYVig (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Aug 2020 17:38:36 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89125C061574;
        Tue, 25 Aug 2020 14:38:36 -0700 (PDT)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1598391515;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Bzrluaqlq3krRM30SsNwVNRIRZVbuCOAOPYCtGzqAAI=;
        b=J9oc+MDLMdReE5k69O6GhTmcW1kbRigczO+p80fP9tL2V05Y6kHJDM8DW04APAucV5gWlC
        1TwOZNHF1XGdntATDmI7j+t3jZgkiWV5uBL+Iy8BiL9Dt6quUYyqkRT6N0ovhdd3EZAyQO
        ogIFvMiqCL35QGNFp3uXoaKpl8p95O3plq+1hVInOFw/B7sYC4XkF7K3at0pQN/qMnfVm1
        WbL7jgL6LrW6nt9NmHl36iC+km/gChilKRZz+LchETQTwOChFLMjt3TIUDqr2nIQxl5nnZ
        E+yWGXbTD/11EeX/2Y1PmqUM9gBCVxNPeTJM/su45mjJh5k0J2JefY9ojMHrsg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1598391515;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Bzrluaqlq3krRM30SsNwVNRIRZVbuCOAOPYCtGzqAAI=;
        b=y4jw2WD7k5ZcqN2mnAhVVjasNzleQUESsZxjn10jpa64PgF9Rsh8A38qKu0+8EveS4+jOQ
        29ANfqxmomGx24Aw==
To:     Stephen Boyd <swboyd@chromium.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        bjorn.andersson@linaro.org, evgreen@chromium.org,
        linus.walleij@linaro.org, maz@kernel.org, mka@chromium.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: Re: [PATCH v5 3/6] genirq/PM: Introduce IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND flag
In-Reply-To: <159835036999.334488.14725849347753031927@swboyd.mtv.corp.google.com>
References: <1598113021-4149-1-git-send-email-mkshah@codeaurora.org> <1598113021-4149-4-git-send-email-mkshah@codeaurora.org> <159835036999.334488.14725849347753031927@swboyd.mtv.corp.google.com>
Date:   Tue, 25 Aug 2020 23:38:34 +0200
Message-ID: <874koqxv6t.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 25 2020 at 03:12, Stephen Boyd wrote:
> Quoting Maulik Shah (2020-08-22 09:16:58)
>> diff --git a/kernel/irq/pm.c b/kernel/irq/pm.c
>> index c6c7e18..2cc800b 100644
>> --- a/kernel/irq/pm.c
>> +++ b/kernel/irq/pm.c
>> @@ -69,12 +69,17 @@ void irq_pm_remove_action(struct irq_desc *desc, struct irqaction *action)
>>  
>>  static bool suspend_device_irq(struct irq_desc *desc)
>>  {
>> +       unsigned long chipflags = irq_desc_get_chip(desc)->flags;
>> +
>>         if (!desc->action || irq_desc_is_chained(desc) ||
>>             desc->no_suspend_depth)
>>                 return false;
>>  
>>         if (irqd_is_wakeup_set(&desc->irq_data)) {
>>                 irqd_set(&desc->irq_data, IRQD_WAKEUP_ARMED);
>> +
>> +               if (chipflags & IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND)
>> +                       irq_enable(desc);
>
> Where is the corresponding change to resume_irq()? Don't we need to
> disable an irq if it was disabled on suspend and forcibly enabled here?

That part was below the POC code I provided in the fine print:

 "plus the counterpart in the resume path. This also ensures that state is
  consistent."

Who reads the fine print? :)
