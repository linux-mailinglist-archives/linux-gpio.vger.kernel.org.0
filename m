Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7ED925216A
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Aug 2020 21:59:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726542AbgHYT73 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Aug 2020 15:59:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726723AbgHYT71 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Aug 2020 15:59:27 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4C4AC061756
        for <linux-gpio@vger.kernel.org>; Tue, 25 Aug 2020 12:59:26 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id y8so52144vsq.8
        for <linux-gpio@vger.kernel.org>; Tue, 25 Aug 2020 12:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8b4RVU+WnTo74tNhlNkNqnD8k6zvXZjBOKRfwHkRmnI=;
        b=Vo8PAURx7ORtd6yU5einn0LAVp/LY4DkDOYh0P4dgOmDIaVsQRPmUDC28SYLYa9rqq
         SDKtkNjLuobPZZ5I+QrAE/JInPIxlmrhZKHva5dOV+4H+EK1EvC/dDnBaL2d0qUPuW5s
         ACUhet6iMVgWy7rrxhpcnQ6E2hoN0yuhAH4f4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8b4RVU+WnTo74tNhlNkNqnD8k6zvXZjBOKRfwHkRmnI=;
        b=Yv7RE/au/BiqFke10TCSgk9USwPT1zpksbhTyGCfTMlyhYGpwfMyoqDzf2HpISmMl0
         81WObyHXMScY7OX02oT4Sx125hZUXo6KBmnM1OcM8yFstcmaLj9mm6mYR2ntuBl2Kuli
         kHRvTCPjQEjqqBGTLNfysxQKrXmn6k4dZtt0V5fRNYNWpGZOYRxrDCJd+SM1oy3yZd6G
         A9vMJ3BHPN4Wz/3kW/HgsvaEEnlee25mUIAREOQzdjachMkojfcO76aAGJQKrJVIxJfJ
         Sn4Dpw/xiy7rUXShxOgMOBWTYQ75HyQ+MqSw4ijtPx5FyB2mBe8YRIc5sOdY0r2w0V5/
         d8TA==
X-Gm-Message-State: AOAM530v1dcwaFumI/+2LoKpKV4od7ivvKviyqF/2gVHbU2fYYJrhgC1
        jl/4eiorXe3UPZHtVWIiIQN9OyaIWpFakA==
X-Google-Smtp-Source: ABdhPJz+E09RoG3zVLUZKFFEWpLztE9lhPDapVYvCwBoPpTMpUIdVWQuRZxRcc3Bh+r5hr/dIdOMGA==
X-Received: by 2002:a67:f44d:: with SMTP id r13mr7527349vsn.184.1598385565631;
        Tue, 25 Aug 2020 12:59:25 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 67sm5109vsl.13.2020.08.25.12.59.24
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2020 12:59:24 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id v138so55381vsv.7
        for <linux-gpio@vger.kernel.org>; Tue, 25 Aug 2020 12:59:24 -0700 (PDT)
X-Received: by 2002:a67:2787:: with SMTP id n129mr7024016vsn.219.1598385564167;
 Tue, 25 Aug 2020 12:59:24 -0700 (PDT)
MIME-Version: 1.0
References: <1598113021-4149-1-git-send-email-mkshah@codeaurora.org> <1598113021-4149-6-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1598113021-4149-6-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 25 Aug 2020 12:59:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=ViaBn-HJ3d3ofLXNRKVaVDTKeOrMruvmEj9cVAGBntww@mail.gmail.com>
Message-ID: <CAD=FV=ViaBn-HJ3d3ofLXNRKVaVDTKeOrMruvmEj9cVAGBntww@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] irqchip: qcom-pdc: Set IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND
 flag
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        LinusW <linus.walleij@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
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

On Sat, Aug 22, 2020 at 9:18 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> Set IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND flag to enable/unmask the
> wakeirqs during suspend entry.
>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  drivers/irqchip/qcom-pdc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
