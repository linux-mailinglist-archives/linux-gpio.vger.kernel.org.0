Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCF9840FD7A
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Sep 2021 18:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243282AbhIQQCY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Sep 2021 12:02:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233287AbhIQQCX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Sep 2021 12:02:23 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82B96C061574
        for <linux-gpio@vger.kernel.org>; Fri, 17 Sep 2021 09:01:01 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id a22so12792063iok.12
        for <linux-gpio@vger.kernel.org>; Fri, 17 Sep 2021 09:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yrx9mUpYYXVMYMF5W2tOzCxi5BgPJ1piaqpqhUs30nU=;
        b=KG9UKz2JOIJvh6oJ0MHFu18IZTc9o0NgjkkE1hrCedZhS6HTVepEp0lRP9lPktc+i8
         TZxMxlML2Tm0YJn1x1zqvFfsJQQ/PugcysvZ+tJ7XUevgKTsgzcqOoiDmVKd0EKzYy2f
         jTVTAAB+W5sFx+2Bqer2ehhSLqxcAnazYFrWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yrx9mUpYYXVMYMF5W2tOzCxi5BgPJ1piaqpqhUs30nU=;
        b=rXR2sXHVzBH9LMQc2C35xXOhziPHjOs6mWfTEqt7B4DL/V3SZfe+3YV62guVow3rrB
         15KZCyrd0KRxkyyi5HgX608RH6EySxq77C8sH+pc51ER4bJcwxJ3W1C3RFRHe4GS+9oQ
         PqTngX2CFBDLKqJxnLfCsYTGw9EAVJMWHElstRPYOGK6cyH4plzSaTXrpr5WQUff4vui
         1i708G/SZUShYQT9hC3tpVAY9I5RqlrVSQFLcMPj5Lu4zAhWGJ/NYeopfdW1rNP2Vhhf
         UadJqigmEw9XWTf0QD8NByBUpzRqmtImxS2Urq2B9ee/KROArygDaX491WR076lS+wIF
         h8vQ==
X-Gm-Message-State: AOAM531g+7j73zyILseV+3o4ejHOeA57R6fjjoOvxRz2l5gurgk4q/jr
        EmDgg8lX1wJaveYTzH7ILstdnDN2/EUG7A==
X-Google-Smtp-Source: ABdhPJzUtT+GzP65Y7LDmLhS/f8lIYXDhcQBWgiQ2uUvz121PmquitfKOMpTslTIMTrrjUVUzyO3cA==
X-Received: by 2002:a5d:9581:: with SMTP id a1mr5087539ioo.24.1631894460752;
        Fri, 17 Sep 2021 09:01:00 -0700 (PDT)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com. [209.85.166.49])
        by smtp.gmail.com with ESMTPSA id b2sm677217ilj.72.2021.09.17.09.01.00
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Sep 2021 09:01:00 -0700 (PDT)
Received: by mail-io1-f49.google.com with SMTP id a22so12791875iok.12
        for <linux-gpio@vger.kernel.org>; Fri, 17 Sep 2021 09:01:00 -0700 (PDT)
X-Received: by 2002:a02:5d45:: with SMTP id w66mr9377491jaa.82.1631894459637;
 Fri, 17 Sep 2021 09:00:59 -0700 (PDT)
MIME-Version: 1.0
References: <1631860648-31774-1-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1631860648-31774-1-git-send-email-rnayak@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 17 Sep 2021 09:00:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WSjLU72hXS4H_it_VQS1LOsWGoq_1MW=eeGfXFDds0rw@mail.gmail.com>
Message-ID: <CAD=FV=WSjLU72hXS4H_it_VQS1LOsWGoq_1MW=eeGfXFDds0rw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Add egpio feature support
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        LinusW <linus.walleij@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Thu, Sep 16, 2021 at 11:38 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> From: Prasad Sodagudi <psodagud@codeaurora.org>
>
> egpio is a scheme which allows special power Island Domain IOs
> (LPASS,SSC) to be reused as regular chip GPIOs by muxing regular
> TLMM functions with Island Domain functions.
> With this scheme, an IO can be controlled both by the cpu running
> linux and the Island processor. This provides great flexibility to
> re-purpose the Island IOs for regular TLMM usecases.
>
> 2 new bits are added to ctl_reg, egpio_present is a read only bit
> which shows if egpio feature is available or not on a given gpio.
> egpio_enable is the read/write bit and only effective if egpio_present
> is 1. Once its set, the Island IO is controlled from Chip TLMM.
> egpio_enable when set to 0 means the GPIO is used as Island Domain IO.
>
> The support exists on most recent qcom SoCs, and we add support
> for sm8150/sm8250/sm8350 and sc7280 as part of this patch.
>
> Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
> [rnayak: rewrite commit log, minor rebase]
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c    | 4 ++++
>  drivers/pinctrl/qcom/pinctrl-msm.h    | 2 ++
>  drivers/pinctrl/qcom/pinctrl-sc7280.c | 2 ++
>  drivers/pinctrl/qcom/pinctrl-sm8150.c | 2 ++
>  drivers/pinctrl/qcom/pinctrl-sm8250.c | 2 ++
>  drivers/pinctrl/qcom/pinctrl-sm8350.c | 2 ++
>  6 files changed, 14 insertions(+)
>
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 8476a8a..f4a2343 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -220,6 +220,10 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
>         val = msm_readl_ctl(pctrl, g);
>         val &= ~mask;
>         val |= i << g->mux_bit;
> +       /* Check if egpio present and enable that feature */

nit: blank line above the comment?

> +       if (val & BIT(g->egpio_present))
> +               val |= BIT(g->egpio_enable);

Thinking about this on systems that don't support egpio,
g->egpio_present will be 0, right? BIT(0) = 1, so I guess this is
equivalent to the code below on non-eGPIO systems:

  if (val & 1)
    val |= 1;

I guess that's not the end of the world (it's a noop) and I can't
think of anything better. In theory you could add a boolean
"egpio_used" or you could just assume egpio is used if "egpio_present"
!= "egpio_enable", but all of those seem like a waste. Maybe just
change the comment to something like:

/*
 * Check if egpio present and enable that feature. For SoCs that
 * don't support egpio `egpio_present` will equal `egpio_enable` (they
 * will both be zero) and the statement below will be a no-op.
 */

Another question I have is: don't we need a way to turn off
egpio_enable? Maybe this should be something like this:

if (val & BIT(g->egpio_present)) {
  if (i == gpio_func)
    val |= BIT(g->egpio_enable);
  else
    val &= ~BIT(g->egpio_enable);
}

...oh, but then you probably _do_ need to check if "egpio_present" !=
"egpio_enable" since the clearing of the bit won't be a no-op on
non-egpio SoCs.

-Doug
