Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA41D21E300
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2020 00:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726803AbgGMWZR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jul 2020 18:25:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726358AbgGMWZR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2020 18:25:17 -0400
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com [IPv6:2607:f8b0:4864:20::a42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3649DC061755
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 15:25:17 -0700 (PDT)
Received: by mail-vk1-xa42.google.com with SMTP id 66so3204281vka.13
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 15:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q6bh/1yGmZao7f6eku70ZfEjUaW4mF5NYpD2HrmZqeI=;
        b=j/XT5yyFl2LbkH2lZtHlwHq+F8pmbt1Tm85qFPI0z7iEFb3EPc0mzXcrqsqbTS90ZE
         m+To0qUhXZYncSMgOThqPs0W9mh1DSWxfcv8lMcNrpkhXIgav4O5Rdvp3cc2hXPZIt4/
         scL1jsPMSGprQyr2BJIXvr5HxYY7wWu9lH3s8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q6bh/1yGmZao7f6eku70ZfEjUaW4mF5NYpD2HrmZqeI=;
        b=iKf1Me+z013gJdmQa7uUqy4z0VNHyMVojyq+IXiqvAM1q67VvNwjtfOzJJf49NlzsU
         H/doG1ZPXotPz9axWXkyv6gW3Le7xReQiVPyfz4OoISUQgQuJJcgcabU0cdg0QorDS9d
         nm1202Qg2MbYMtm08hI5XC50vUCoWNKrxlihOgEp/mn2JgtTy2VltkNz6cZ4CCvQKri2
         C+2dPVCoQHFF97k0IGX+SA0l9h6E4IVJrtHAGMhoyc5fShDRTTp/XbkcpYNX0oWjxFMY
         rDfcUMT45mXjsE51Fl/r1iXoy/0gAq+U4db3tFMNWJz+9q3+8QQI+Iz6/oD6y/P/98jo
         /rWA==
X-Gm-Message-State: AOAM530vGxFisMnzpa148kxVXWMIQmrb9aHRD5V/3JR1oDe04ga1nwu0
        dQSxHmgyphgH0tvKi77wG8QtLVc3qBE=
X-Google-Smtp-Source: ABdhPJwTGAh9Qi8CJMNs99gfuj3Fs0VNvOgDHCJUmrDzHndz4cP8oyV+KnXbp7QfLyBtNVFg2iz0XA==
X-Received: by 2002:ac5:cbee:: with SMTP id i14mr1761147vkn.6.1594679116219;
        Mon, 13 Jul 2020 15:25:16 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id a24sm1965871uap.1.2020.07.13.15.25.15
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2020 15:25:16 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id t187so3219472vke.5
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 15:25:15 -0700 (PDT)
X-Received: by 2002:a05:6102:30b5:: with SMTP id y21mr1130601vsd.42.1594678673804;
 Mon, 13 Jul 2020 15:17:53 -0700 (PDT)
MIME-Version: 1.0
References: <1592818308-23001-1-git-send-email-mkshah@codeaurora.org> <1592818308-23001-3-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1592818308-23001-3-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 13 Jul 2020 15:17:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WcKB0AbcYNymAbfvDac-8c3uGgOn3B1Q-U4d3ZrvGuag@mail.gmail.com>
Message-ID: <CAD=FV=WcKB0AbcYNymAbfvDac-8c3uGgOn3B1Q-U4d3ZrvGuag@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] pinctrl: qcom: Add msmgpio irqchip flags
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

On Mon, Jun 22, 2020 at 2:32 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> Add irqchip specific flags for msmgpio irqchip to mask non wakeirqs
> during suspend and mask before setting irq type.
>
> Masking before changing type should make sure any spurious interrupt
> is not detected during this operation.
>
> Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 2419023..b909ffe 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -1143,6 +1143,8 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
>         pctrl->irq_chip.irq_release_resources = msm_gpio_irq_relres;
>         pctrl->irq_chip.irq_set_affinity = msm_gpio_irq_set_affinity;
>         pctrl->irq_chip.irq_set_vcpu_affinity = msm_gpio_irq_set_vcpu_affinity;
> +       pctrl->irq_chip.flags = IRQCHIP_MASK_ON_SUSPEND

I haven't tested it, but with my suggestion in patch #4 to use
irq_suspend and irq_resume, I presume adding IRQCHIP_MASK_ON_SUSPEND
is no longer needed?


> +                               | IRQCHIP_SET_TYPE_MASKED;

IIUC adding "IRQCHIP_SET_TYPE_MASKED" is unrelated to the rest of this
series, right?

-Doug
