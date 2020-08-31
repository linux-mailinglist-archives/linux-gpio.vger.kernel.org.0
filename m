Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3264C257BEE
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 17:13:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728109AbgHaPNL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Aug 2020 11:13:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728210AbgHaPMa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Aug 2020 11:12:30 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E419CC061755
        for <linux-gpio@vger.kernel.org>; Mon, 31 Aug 2020 08:12:29 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id o184so3423772vsc.0
        for <linux-gpio@vger.kernel.org>; Mon, 31 Aug 2020 08:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MkA7kkMZ28SM9aq6Oba8O8kVaNHfOTZlxqtGBVCQhrc=;
        b=jgOG3A76uagJjEXXUrgjaviRJXDyL5GPp/LE3dmC5pKG/zAdmf4V5gCOhr5ivUElnI
         X1SMWQyEUxlFSjx7OYK2dYZ5r6QEBc7mdzqWGKJZH4knTpXSGrjvnV9gXhi9GGxwrxn/
         pONqUFY418QiUIAXCy7S6jhIYDHmM4D0e9+Jg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MkA7kkMZ28SM9aq6Oba8O8kVaNHfOTZlxqtGBVCQhrc=;
        b=pLjLBnBHT7Q9rQdCbu02Bw1rSPciMmKqMkCKpM2QR8VUDVI905I6ydUa+Wpt37+pZk
         qrsJtDh3Y6xXomS/jh66K/9ZbHYu1+z9zDd/iLItZSxA9Z3u9lT1rx3mJv5CSF7WmwBl
         HrjDS9KSQIQ3dKgVitnwPfOZvqWecqM4y9t8QZ8+L8R7Sm8j4oKzI/WoG8GbyVBiw0z+
         1pYs2oA7uKLrZga9KUNDqYq7+filQo3n9o1FIH2KM3vD65rS94/OFxcs1KTMHulfQNQa
         BOHduQUGvlWDByuGXOTp8Fi0rCJu3BfDsk+Hkcxo4GCnlE06QeREQ2Erb32JwWsYBDJq
         yC8A==
X-Gm-Message-State: AOAM530IgXg1xiDq400ubOjsNl8lId6qTwOoqg54Km3LI8vDPEucEess
        S/tOEown+XiJbj1qrUQTctWbiv89z1r7xQ==
X-Google-Smtp-Source: ABdhPJw5/DflAJ/5PHuwP+ucie591AuL1dCgs3zF0L+6JJdtrdBUNToe0HFJwIr70V+7V3/z+iCMJg==
X-Received: by 2002:a67:fc49:: with SMTP id p9mr1448005vsq.142.1598886748841;
        Mon, 31 Aug 2020 08:12:28 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id b206sm1446065vka.41.2020.08.31.08.12.26
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2020 08:12:27 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id k1so1375280vkb.7
        for <linux-gpio@vger.kernel.org>; Mon, 31 Aug 2020 08:12:26 -0700 (PDT)
X-Received: by 2002:a1f:f848:: with SMTP id w69mr1345108vkh.86.1598886745879;
 Mon, 31 Aug 2020 08:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <1598113021-4149-1-git-send-email-mkshah@codeaurora.org>
 <1598113021-4149-4-git-send-email-mkshah@codeaurora.org> <159835036999.334488.14725849347753031927@swboyd.mtv.corp.google.com>
 <874koqxv6t.fsf@nanos.tec.linutronix.de> <8763521f-b121-877a-1d59-5f969dd75e51@codeaurora.org>
 <87y2m1vhkm.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87y2m1vhkm.fsf@nanos.tec.linutronix.de>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 31 Aug 2020 08:12:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XXf3_tjqK14WdMuKygJptMTS+bKhH_ceiUE3wyYoCnxg@mail.gmail.com>
Message-ID: <CAD=FV=XXf3_tjqK14WdMuKygJptMTS+bKhH_ceiUE3wyYoCnxg@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] genirq/PM: Introduce IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND
 flag
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Maulik Shah <mkshah@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        LinusW <linus.walleij@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Srinivas Rao L <lsrao@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,


On Wed, Aug 26, 2020 at 3:15 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> On Wed, Aug 26 2020 at 15:22, Maulik Shah wrote:
> > On 8/26/2020 3:08 AM, Thomas Gleixner wrote:
> >>> Where is the corresponding change to resume_irq()? Don't we need to
> >>> disable an irq if it was disabled on suspend and forcibly enabled here?
> >>>
> > I should have added comment explaining why i did not added.
> > I thought of having corresponding change to resume_irq() but i did not
> > kept intentionally since i didn't
> > observe any issue in my testing.
>
> That makes it correct in which way? Did not explode in my face is hardly
> proof of anything.
>
> > Actually the drivers which called (disable_irq() + enable_irq_wake()),
> > are invoking enable_irq()
> > in the resume path everytime. With the driver's call to enable_irq()
> > things are restoring back already.
>
> No, that's just wrong because you again create inconsistent state.
>
> > If above is not true in some corner case, then the IRQ handler of
> > driver won't get invoked, in such case, why even to wake up with such
> > IRQs in the first place, right?
>
> I don't care about the corner case. If the driver misses to do it is
> buggy in the first place. Silently papering over it is just mindless
> hackery.
>
> There are two reasonable choices here:
>
> 1) Do the symmetric thing
>
> 2) Let the drivers call a new function disable_wakeup_irq_for_suspend()
>    which marks the interrupt to be enabled from the core on suspend and
>    remove the enable call on the resume callback of the driver.
>
>    Then you don't need the resume part in the core and state still is
>    consistent.
>
> I'm leaning towards #2 because that makes a lot of sense.

IIUC, #2 requires that we change existing drivers that are currently
using disable_irq() + enable_irq_wake(), right?  Presumably, if we're
going to do #2, we should declare that what drivers used to do is now
considered illegal, right?  Perhaps we could detect that and throw a
warning so that they know that they need to change to use the new
disable_wakeup_irq_for_suspend() API.  Otherwise these drivers will
work fine on some systems (like they always have) but will fail in
weird corner cases for systems that are relying on drivers to call
disable_wakeup_irq_for_suspend().  That doesn't sound super great to
me...

...or, if doing the symmetric thing isn't too bad, we could do that?

-Doug
