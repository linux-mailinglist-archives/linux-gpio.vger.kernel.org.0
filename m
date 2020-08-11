Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2037242126
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Aug 2020 22:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726274AbgHKUMR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Aug 2020 16:12:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725889AbgHKUMR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Aug 2020 16:12:17 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5345FC06174A
        for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2020 13:12:17 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id x6so7223821pgx.12
        for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2020 13:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vF7UMROFE+dAJKvt4jRLzJ1y/Thu+BCzQUX/As3ZgXM=;
        b=gjXSyPyXZoPTlyrC5XR/K9JyfeE+I1aFx5WTng1nCFxKNi2DXwnibyuUdLyRZ/bzRz
         yNxYdmLEWKclEDlwLKm+mxedlq9DiWpV4FxLYj19eUGHv9Z7PWwO+cbkPuMA8qjPxdYp
         uZSF/mQuyDOMl+8Wy70Tl5CxdDML5f8yRR3GU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vF7UMROFE+dAJKvt4jRLzJ1y/Thu+BCzQUX/As3ZgXM=;
        b=p3Qc1lN8v//DSlnN/pmw5m0RQcOG97JHYZtXrTpEo/yXCQcpoe5qFneUJfE0SDPJ6e
         49O7VI8bFT+zSyeHZMsz0jC9FAPTo1YS0coo91YMX3Ky1OsihRpSAyCOe/i3lPsCQm6l
         ZK7eaD/GWep8GQGOCAePzO8wjTHR97qlmFbUnZedqRS5CDF2b7P4koF93rEsGS9xl/pk
         BH6cYMFYlAP2D3YNrZLCLeE9n3LbG186ppanYKhcXzQ6hxVWapj4hiRMGwwsYsg1b+Zd
         ayGdRcVUHYJE7GvNMb8NzqX45YYsvt/LHk5G9OYgmwAkfX/qz4Cj6uXAmp6u3FQl2fbW
         cbBw==
X-Gm-Message-State: AOAM533pn6EAE3DDgu7mIbB2XmTpFEOzfesL9N/jGpBfTmPny8YpTndg
        68dUSIGxHwFyBVfd8IwNVxQwNMYA3R4=
X-Google-Smtp-Source: ABdhPJwXhXC2CpQQPT1SNqHVQsbiX9Fv770On4cxW4/rwJ23rzFaM2nzyaJVzsDxP5kq61Uv9f4Iqg==
X-Received: by 2002:a63:de4e:: with SMTP id y14mr522417pgi.106.1597176736631;
        Tue, 11 Aug 2020 13:12:16 -0700 (PDT)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com. [209.85.214.172])
        by smtp.gmail.com with ESMTPSA id z4sm26065038pfb.55.2020.08.11.13.12.16
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2020 13:12:16 -0700 (PDT)
Received: by mail-pl1-f172.google.com with SMTP id r4so66735pls.2
        for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2020 13:12:16 -0700 (PDT)
X-Received: by 2002:a1f:2fc1:: with SMTP id v184mr26376890vkv.42.1597176274522;
 Tue, 11 Aug 2020 13:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <1597058460-16211-1-git-send-email-mkshah@codeaurora.org> <1597058460-16211-2-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1597058460-16211-2-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 11 Aug 2020 13:04:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U4YVAqQXoJ47KY78kEsdoK33ic0P0rADkFWe=yU1x1nQ@mail.gmail.com>
Message-ID: <CAD=FV=U4YVAqQXoJ47KY78kEsdoK33ic0P0rADkFWe=yU1x1nQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] pinctrl: qcom: Add msmgpio irqchip flags
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

On Mon, Aug 10, 2020 at 4:21 AM Maulik Shah <mkshah@codeaurora.org> wrote:
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
> index a2567e7..90edf61 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -1243,6 +1243,8 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
>         pctrl->irq_chip.irq_release_resources = msm_gpio_irq_relres;
>         pctrl->irq_chip.irq_set_affinity = msm_gpio_irq_set_affinity;
>         pctrl->irq_chip.irq_set_vcpu_affinity = msm_gpio_irq_set_vcpu_affinity;
> +       pctrl->irq_chip.flags = IRQCHIP_MASK_ON_SUSPEND
> +                               | IRQCHIP_SET_TYPE_MASKED;
>
>         np = of_parse_phandle(pctrl->dev->of_node, "wakeup-parent", 0);
>         if (np) {

After taking Stephen's suggestion of improving the subject:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
