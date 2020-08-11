Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87E8A242060
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Aug 2020 21:34:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725889AbgHKTeE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Aug 2020 15:34:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbgHKTeE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Aug 2020 15:34:04 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E2D2C061787
        for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2020 12:34:04 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id o13so7201626pgf.0
        for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2020 12:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=HPJgVYMlOVpx8CMW1iLnfKWUU9aKgZyZKqJZiVOc4AE=;
        b=X2nYMD+XxV/+IOGD2YouE5zjPO0QlFLkjP5eXZT/K91Na9ZuG+TaAJ8H31hRXuj8p7
         /SKbAPVGvH8U61Mievn5GpQS0s2MgET9lCLkypee8LiqhWmCPazJRIr/Bb815s2YPD3f
         TJojCe6sU4MxN57aVFFFCNoyGsqTSiwLKRJLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=HPJgVYMlOVpx8CMW1iLnfKWUU9aKgZyZKqJZiVOc4AE=;
        b=qHup94C9EGTZhCA19zaqyhC/FB92FAkEwJqf501llD5kZlqCAynmOLY8rRNHSGUqx/
         OlT7axMXqRkUf0a6m4Z8YAATfzB3Rkifa3PEjlACj0a7Q2tlkIzw9tGOW3ajBGE98McI
         f6Xl0+Echti6MYFjvIWXbOxvZcQlsM0WVzg+VW9AzN9pev1bEv/6ECII4IpZdSqSi9/2
         SUrnBXjHDWay5i1c+BPzerd2dCJsmXXhuWwM6XB6YVub2ccLoNk09ry5FZmPJfroK/v3
         cT0F5mGAuRYwLDx6AmKvlKofo+LzlYY5i8q1E7IykhTs/n+mhApZzH7YO5UCWrcOAavZ
         wvUQ==
X-Gm-Message-State: AOAM5303TYS0SBcWLySKi5tDPN4eZxO1TZLvU1rk5BTl/CbwQhOUYyxD
        QIEN6TTRloX9WLaBxxGLRee8+g==
X-Google-Smtp-Source: ABdhPJzVrCh0RgLLeubSmT8J282uZRpSEPD3234rQ5lD8brIDeACcdBYgQwKmuKSC4td4opzp7cm4Q==
X-Received: by 2002:a63:fe54:: with SMTP id x20mr1968326pgj.438.1597174443718;
        Tue, 11 Aug 2020 12:34:03 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id lb1sm3355502pjb.26.2020.08.11.12.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 12:34:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1597058460-16211-3-git-send-email-mkshah@codeaurora.org>
References: <1597058460-16211-1-git-send-email-mkshah@codeaurora.org> <1597058460-16211-3-git-send-email-mkshah@codeaurora.org>
Subject: Re: [PATCH v4 2/7] pinctrl: qcom: Use return value from irq_set_wake call
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org, tglx@linutronix.de,
        jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, linus.walleij@linaro.org, maz@kernel.org,
        mka@chromium.org
Date:   Tue, 11 Aug 2020 12:34:01 -0700
Message-ID: <159717444178.1360974.6520145243224264090@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Maulik Shah (2020-08-10 04:20:55)
> msmgpio irqchip is not using return value of irq_set_wake call.
> Start using it.

Does this work when the irq parent isn't setup in a hierarchy? I seem to
recall that this was written this way because sometimes
irq_set_irq_wake() would fail for the summary irq so it was a best
effort setting of wake on the summary line.

>=20
> Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pi=
nctrl-msm.c
> index 90edf61..c264561 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -1077,12 +1077,10 @@ static int msm_gpio_irq_set_wake(struct irq_data =
*d, unsigned int on)
>          * when TLMM is powered on. To allow that, enable the GPIO
>          * summary line to be wakeup capable at GIC.
>          */
> -       if (d->parent_data)
> -               irq_chip_set_wake_parent(d, on);
> -
> -       irq_set_irq_wake(pctrl->irq, on);
> +       if (d->parent_data && test_bit(d->hwirq, pctrl->skip_wake_irqs))
> +               return irq_chip_set_wake_parent(d, on);

So this bit is probably fine.

> =20
> -       return 0;
> +       return irq_set_irq_wake(pctrl->irq, on);

But this one is probably not fine.

>  }
> =20
>  static int msm_gpio_irq_reqres(struct irq_data *d)
