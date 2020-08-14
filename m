Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A8102449EB
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Aug 2020 14:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728012AbgHNMn0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Aug 2020 08:43:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726209AbgHNMn0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Aug 2020 08:43:26 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9828CC061384;
        Fri, 14 Aug 2020 05:43:25 -0700 (PDT)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1597409003;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/i5quBEHOUiEWbSlPICXRpE8LPmHlTEYkvSOImfh/R8=;
        b=SJrKMe+dhkz8mqYvSm1e3oBcNuMqzj+vKg2nmRvxCMocVOYxiR8hR8W5A5OaMsQ5eaXR+h
        s7OkQsvCSQIKdFkpRWVJje01s5cMnZyE67XTqnZjDT9+W9drRPQb4Z6C7cJ6De4c2niyOS
        flq+s8FYRYtir4SvAgp3/bSDrLcUVLsggqIOjgZbmsTbuGRe1fGI5psw0V71kBU9pmTfLr
        +9kJpggyh/g8HZfVm4PIzrORvKjA0OPCWoy6q+ae7LDNHYMuEZtRd5bKJB5P6PsIrHHMfh
        fun6UsKWyYtiZfEYCzgiKdAUYazF6mV33S35Z0/D84Ps4+jxA/ieqo0WzAlsZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1597409003;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/i5quBEHOUiEWbSlPICXRpE8LPmHlTEYkvSOImfh/R8=;
        b=wCiXtVzl9KyVOqjtdNk4AHVJumpRqaSpCZ9HC97XShRjOmcy9x+d74s433K+ZrFzbItPma
        WAXqqS9/MwtJgpAw==
To:     Doug Anderson <dianders@chromium.org>
Cc:     Maulik Shah <mkshah@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        LinusW <linus.walleij@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list\:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Srinivas Rao L <lsrao@codeaurora.org>
Subject: Re: [PATCH v4 3/7] genirq: Introduce irq_suspend_one() and irq_resume_one() callbacks
In-Reply-To: <CAD=FV=V1hvWZ0ANX9nsvRX_iXjuzw0X_tL2hgg4zYGgsqRtLTQ@mail.gmail.com>
References: <1597058460-16211-1-git-send-email-mkshah@codeaurora.org> <1597058460-16211-4-git-send-email-mkshah@codeaurora.org> <87pn7ulwr5.fsf@nanos.tec.linutronix.de> <CAD=FV=WN4R1tS47ZzdZa_hsbvLifwnv6rgETVaiea0+QSZmiOw@mail.gmail.com> <878sei42ql.fsf@nanos.tec.linutronix.de> <CAD=FV=Wyp8B6183avk4on4Akz6dANkuJ25h_o_ERDuiZ87mwNw@mail.gmail.com> <87364q3rqb.fsf@nanos.tec.linutronix.de> <CAD=FV=V1hvWZ0ANX9nsvRX_iXjuzw0X_tL2hgg4zYGgsqRtLTQ@mail.gmail.com>
Date:   Fri, 14 Aug 2020 14:43:23 +0200
Message-ID: <87bljdl7o4.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Doug,

On Thu, Aug 13 2020 at 20:04, Doug Anderson wrote:
> On Thu, Aug 13, 2020 at 7:07 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>>    Having a quick and dirty POC for illustration is fine and usually
>>    useful.
>
> OK, I will try to remember that, in the future, I should send
> questions rather than patches to you.  I'm always learning the

The quick and dirty POC patch for illustration along with the questions
is always good to catch my attention.

> workflows of the different maintainers, so sorry for killing so much
> time.  :(

No problem. 

>> If it solves the problem and from what you explained it should do so
>> then this is definitely the right way to go.
>
> Wonderful!  Looking forward to Maulik's post doing it this way.

/me closes the case for now and moves on.

Thanks

        tglx
