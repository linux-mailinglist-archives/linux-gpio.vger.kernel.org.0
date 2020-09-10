Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC11F264087
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Sep 2020 10:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729953AbgIJIvT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Sep 2020 04:51:19 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:38448 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727820AbgIJIvR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Sep 2020 04:51:17 -0400
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1599727874;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=qepHrW+rdQoQ9vl8ZgAgXzcx8fv7hhN4FIsqOz07Dfg=;
        b=da9Ha+I/iosLUR9+jA0ZjI5DE4mPz0NwPQnA7utFmvwZtvsqnTZu/rwakjiVkXD3ax0DXG
        MLAk/hEEbGMSvRHt1oRjndcsduQjOvKST3wIxFzRDqEvKPID7ExkvTL9/CE5bAQ+Frw9FA
        Y1pmTw42x0qyHH0dA7AM6QZpmkbuxV+7VBUXgxnUUYBkd3StIHYDgWzkSMJJ1/S6cCAVf2
        8YOjYXHVrPZAPOCNt/eTu8TnFjyQyqlaWu+x/dzuCQfIzpIZGOAwh0l9lmQBKUu2qGq2xH
        B8695IyEWRpq7kya1xS7kMksJb4LGfY8lC/NiOLGosHJ9WU338uaxOdTRH22aQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1599727874;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=qepHrW+rdQoQ9vl8ZgAgXzcx8fv7hhN4FIsqOz07Dfg=;
        b=a1R7LZaRAJtMpLJTIaOSZmXkW6DemWGjMPcnAC8qEe49nc1YVYGUen3pop+3k6BWuS0iZ7
        f0WCQETCEkxr5NAw==
To:     Doug Anderson <dianders@chromium.org>
Cc:     Maulik Shah <mkshah@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        LinusW <linus.walleij@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list\:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Srinivas Rao L <lsrao@codeaurora.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v5 3/6] genirq/PM: Introduce IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND flag
In-Reply-To: <CAD=FV=X0wjOYC9u1y=fhDTVSW+jd5G8ydSYJEE-a8BTfnhRgTA@mail.gmail.com>
References: <1598113021-4149-1-git-send-email-mkshah@codeaurora.org> <1598113021-4149-4-git-send-email-mkshah@codeaurora.org> <159835036999.334488.14725849347753031927@swboyd.mtv.corp.google.com> <874koqxv6t.fsf@nanos.tec.linutronix.de> <8763521f-b121-877a-1d59-5f969dd75e51@codeaurora.org> <87y2m1vhkm.fsf@nanos.tec.linutronix.de> <CAD=FV=XXf3_tjqK14WdMuKygJptMTS+bKhH_ceiUE3wyYoCnxg@mail.gmail.com> <877dtdj042.fsf@nanos.tec.linutronix.de> <CAD=FV=Ua7fLGw6JiG1rnCKpAdO1nXX4A4x1Why-LE9L_FBFe8Q@mail.gmail.com> <87zh67uife.fsf@nanos.tec.linutronix.de> <CAD=FV=U8vchyRXOjozYYroq3Mit_gt=XXADLfn0W4N4TyQzyjQ@mail.gmail.com> <87pn7150li.fsf@nanos.tec.linutronix.de> <CAD=FV=X0wjOYC9u1y=fhDTVSW+jd5G8ydSYJEE-a8BTfnhRgTA@mail.gmail.com>
Date:   Thu, 10 Sep 2020 10:51:14 +0200
Message-ID: <87imcmj9q5.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 08 2020 at 12:05, Doug Anderson wrote:
> On Fri, Sep 4, 2020 at 2:54 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>> Right and that's where we want the new chip flag with the unmask if
>> armed.
>
> OK, so we're back in Maulik's court to spin, right?  I think the last
> word before our tangent was at:
>
> http://lore.kernel.org/r/87y2m1vhkm.fsf@nanos.tec.linutronix.de
>
> There you were leaning towards #2 ("a new function
> disable_wakeup_irq_for_suspend()").  Presumably you'd now be
> suggesting #1 ("Do the symmetric thing") since I've pointed out the
> bunch of drivers that would need to change.

Yes #1 is what we need.

Thanks,

        tglx
