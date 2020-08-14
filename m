Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 925CE244F25
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Aug 2020 22:24:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727942AbgHNUYp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Aug 2020 16:24:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbgHNUYo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Aug 2020 16:24:44 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98C34C061385
        for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2020 13:24:44 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id g15so779804plj.6
        for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2020 13:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=rwpaXnT2EeEfwGVu4ev0tx59FKrNBxWx6TusqvWIrO4=;
        b=Jdo0NGDfaHr6zmtamxEimY/fqPy2jmUHSXfgnVas6TIV83p6Tc/4V+90pUHvallzEc
         C/iVNYD1ikU9HKFeCoEiaUSjHf2k+OPtnGgDgyt+1oAyoSPy0oZSZZtOYGwuovPd/bPN
         bh/7iVIqEXktIv/8CZAJqfNXvvD1oqgSa989k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=rwpaXnT2EeEfwGVu4ev0tx59FKrNBxWx6TusqvWIrO4=;
        b=cnXnc7BzgqkC8pLVbELXV4yq3skBDGK3j1N8vgULQk3M13nHeNwSiSkIYLUZqU7ine
         8uMkim8gLy9ej57FTRldw+UxX1v7J2nTlDPEL+k61r4sxRQv+aAjs7uqCFhVvLbG4GaJ
         h+PU2t5+DvgNWwMCTAanolT1EZlER6v+21/bCpzhBL+RJLSmu7vsqbOmRQJ0xmgeNS85
         dlfpn5li+YLM5eBm4p7l6Z0IWjIjzR/dueWw0Alhx9vRLpPRuwqI8YebNIbbBF7dSX78
         3u4SYxmnR41f1SVZm+cX6dyRt+ZVQLjWbKfNV3IgreSg6Q4byEvJNkeSSjuWTyT+ZSLN
         4cqg==
X-Gm-Message-State: AOAM532urVaTYvpXjx1OQz2lEljqgTTbP3QE9TATzHsmwplVgWbXOS/O
        4g57j9ntj/oSupMypdZgyp63hA==
X-Google-Smtp-Source: ABdhPJy/guAnpNvjPltmDRyGFOwK8QXlT4NftOMstfwJ8I5HPq/JZI2YY8fQWzE+0d728rj4fPnFbQ==
X-Received: by 2002:a17:90a:1fca:: with SMTP id z10mr3536837pjz.209.1597436684024;
        Fri, 14 Aug 2020 13:24:44 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id r15sm10581689pfq.189.2020.08.14.13.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2020 13:24:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1272cba3-1a6c-4d2e-0b4b-a19dfb5f3a4d@codeaurora.org>
References: <1597058460-16211-1-git-send-email-mkshah@codeaurora.org> <1597058460-16211-8-git-send-email-mkshah@codeaurora.org> <159718150946.1360974.10983789401181131846@swboyd.mtv.corp.google.com> <1272cba3-1a6c-4d2e-0b4b-a19dfb5f3a4d@codeaurora.org>
Subject: Re: [PATCH v4 7/7] irqchip: qcom-pdc: Reset all pdc interrupts during init
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org, tglx@linutronix.de,
        jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, linus.walleij@linaro.org, maz@kernel.org,
        mka@chromium.org
Date:   Fri, 14 Aug 2020 13:24:42 -0700
Message-ID: <159743668207.33733.6711446681138353287@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Maulik Shah (2020-08-13 00:30:44)
> Hi,
>=20
> On 8/12/2020 3:01 AM, Stephen Boyd wrote:
> > Quoting Maulik Shah (2020-08-10 04:21:00)
> >> Clear previous kernel's configuration during init by resetting
> >> interrupts in enable bank to zero.
> > Can you please add some more information here about why we're not
> > clearing all the pdc irqs and only the ones that are listed in DT?
> sure.
> >   Is
> > that because the pdc is shared between exception levels of the CPU and
> > so some irqs shouldn't be used? Does the DT binding need to change to
> > only list the hwirqs that are usable by the OS instead of the ones that
> > are usable for the entire system? The binding doesn't mention this at
> > all so I am just guessing here.
>=20
> The IRQs specified in qcom,pdc-ranges property in DT are the only ones=20
> that can be used in the current OS for the PDC.
>=20
> So instead of setting entire register to zero (each reg supports 32=20
> interrupts enable bit) only clearing the ones that can be used.
>=20

Ok. Is something wrong with setting all the register bits to 0? Is there
something else in those registers that shouldn't be touched? Please add
these details to the commit message.
