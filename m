Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6977441E131
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Sep 2021 20:31:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbhI3Sd1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 14:33:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbhI3Sd0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Sep 2021 14:33:26 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B3EBC06176C
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 11:31:43 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id s17so25015782edd.8
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 11:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=57Llzgrk8lHt7Xo2P5Ng2+YQoTMIOMCchXp4xSgknMk=;
        b=qCNHubRpYsl2KShLEgoKcAg1XkM+flFqwpUFpfl2SvYHun9wUbaWdDYiyGjRW2Jsbd
         VdQPKfO3YnpxBAihCSVu2sOPft8zM0KJl86yBloC1fLvkwYL0S4GdRmD/0hggep9YwD9
         M7eYKSXF1d4Kv0w91VICm13eNfB1YVm2D23lLykPv0sObzl+HuVastAApQNKEWHimaQv
         AMigogxGRcuLGSCvEbq9IsWR/Lk5JMywo3O3KQw8oWHJHJ3NkRLsy1Ii4ldoY8ObOIY8
         mD0cGvrtuz/hGR+0Cx6y5rhF0voZzYTfUA/rJNTJTdCqeD2k4AGzWL1Uwpj/sK7tmQE6
         tgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=57Llzgrk8lHt7Xo2P5Ng2+YQoTMIOMCchXp4xSgknMk=;
        b=TJK20KATJWphh5AdIvUmmZkGTxRxj8LhAIrCjkaTM+CPnidXs0udIjv8Z7W1v225CG
         srSi0X53EZH/RIDS9hcF/cRgoRH4P3AjXA3a0Ux/ln3Acj+/oYuip1fjDt08sh6ERjWS
         hrayVBcROdJHlHmEbILI5E9z22ZvSU1c6M73CdMMlCpD6xa8IsvaawJFpuhPAZgRFcDW
         sTDjHUEDxKuEHvyvIdaw2NamNguheXTKizb9RapbEZJjOOrlxcXUWpQUUobffLzHWOdO
         rHeEoQM3rdRMj3zfAs1873tT/Z38JN7zpKpkHv+TID1zJ/6KEx/Y2EZlUXx5SFpQOW5Y
         VApw==
X-Gm-Message-State: AOAM530xXBLE89JiHAQfZUcljln7Qs1EqAbwtFr7vqjeH7FZQ2w+7qIe
        JA9x+jP4sSaUxliOBbjbK+vqx1Jxv1lXTM2GIt8afg==
X-Google-Smtp-Source: ABdhPJzlSNDKjr2XQYyGWvZ6wVqvdu6JiqBsgpApQl0wZaMzJq4PH9as3kJjSkfYWfTwWQP4lOv/sqEpvKhejHkecug=
X-Received: by 2002:a17:907:9908:: with SMTP id ka8mr905842ejc.164.1633026701077;
 Thu, 30 Sep 2021 11:31:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <20210928235635.1348330-3-willmcvicker@google.com> <CALAqxLUju1Bw0dDpi_oK6-eOiP6B2Xm1MV19G53WaRFm3Z_AWw@mail.gmail.com>
 <CABYd82Z4pgJpYVhJEGjgbWgSQp7if_=Rf03VmTu+U9D3b=dVzA@mail.gmail.com> <CALAqxLXUOY+tdJat0YaxAEiS_AWrwxBaLq3M90btSVdWfvFBag@mail.gmail.com>
In-Reply-To: <CALAqxLXUOY+tdJat0YaxAEiS_AWrwxBaLq3M90btSVdWfvFBag@mail.gmail.com>
From:   Will McVicker <willmcvicker@google.com>
Date:   Thu, 30 Sep 2021 11:31:23 -0700
Message-ID: <CABYd82YVpP=OGmehwEkc_Q-JBiNy3ZN3LFkEKwv2s4RQn20YZw@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] timekeeping: add API for getting timekeeping_suspended
To:     John Stultz <john.stultz@linaro.org>
Cc:     Russell King <linux@armlinux.org.uk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Lee Jones <lee.jones@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Saravana Kannan <saravanak@google.com>,
        Android Kernel Team <kernel-team@android.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thanks for the suggestion. That makes sense. I'll look into that for
the next version.

--Will

On Wed, Sep 29, 2021 at 1:46 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Wed, Sep 29, 2021 at 1:01 PM Will McVicker <willmcvicker@google.com> wrote:
> > On Tue, Sep 28, 2021 at 8:42 PM John Stultz <john.stultz@linaro.org> wrote:
> > > On Tue, Sep 28, 2021 at 4:56 PM Will McVicker <willmcvicker@google.com> wrote:
> > > >
> > > > This allows modules to access the value of timekeeping_suspended without
> > > > giving them write access to the variable.
> > > >
> > >
> > > It's important to cover "the why" not "the what" in these commit
> > > messages, so you might add a note as to what code will be the user of
> > > this (the samsung/clk-pll.c code changed later in this series).
> > >
> > > thanks
> > > -john
> >
> > Thanks John for the tip. I will try to be better at that in the followup.
>
> I have to remind myself regularly as well. :)  Apologies if my quick
> reply above seemed curt (as it does to me re-reading it now). Wasn't
> my intent.
>
> > For this specific patch, I am adding this new API because the Samsung
> > PLL driver (drivers/clk/samsung/clk-pll.c) currently is using the
> > variable 'timekeeping_suspended' to detect timeouts before the
> > clocksource is initialized or timekeeping itself is suspended. My
> > patch series aims to modularize the Samsung PLL driver. So to keep the
> > driver's functionality intact, I need to add this additional API.
>
> Sounds good!
>
> Another small/medium suggestion:  Since you're adding a new interface
> for non-core users of timekeeping_suspended, it might be good to
> switch the other users as well (seems like just
> drivers/clk/ti/clkctrl.c and kernel/sched/clock.c), then also remove
> the extern in include/linux/timekeeping.h (so there's one consistent
> method to access it)?  I know it's a sort of scope creep, so apologies
> for asking, but it would make the series more attractive if it's not
> leaving something for others to clean up later.
>
> thanks
> -john
