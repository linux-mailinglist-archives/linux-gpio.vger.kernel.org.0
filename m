Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2903252196
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Aug 2020 22:08:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbgHYUI0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Aug 2020 16:08:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgHYUI0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Aug 2020 16:08:26 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4B4CC061574
        for <linux-gpio@vger.kernel.org>; Tue, 25 Aug 2020 13:08:25 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id kx11so49935pjb.5
        for <linux-gpio@vger.kernel.org>; Tue, 25 Aug 2020 13:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vx1r2CNa1rBAm3wMcMuYtNO0QstZgyCPzPi8kkUlIz4=;
        b=KZ3pczexEVfIWGV0IPWdQYQBqYBChCLEGtApRH3QfnlBWqlOq7DlgnonpQmEeHUr9Q
         CcDjp+GBQCLuy08q0QefeFt/oMhUiuz7IYGYn7y53OmbbjhagUOyhSljtDmaGrh+QCYk
         IBApJr1K/C8AUJcz5Qn0It9c7W46C0PZP4bo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vx1r2CNa1rBAm3wMcMuYtNO0QstZgyCPzPi8kkUlIz4=;
        b=SJfOV+04g8oPeuhR0LwGFKQZvib5QN8Jx45gD3wSYnLLYHGiqlWTJt7MHr+D6o1kFp
         bM5nWXJurNO+nDKTt/1ko4snzqfK1/zpE2kohUxIiRixbgEvynmLfLkVPdkN4fr06Xf7
         jyaIVhGIfXduzMP1mlLJtMP4mRxJN7UPwLX0xWNG/1qAQRRFg7nky3N0EVgtuuu/o/UI
         7C/7AcADS8TyWwD9j6eNH2GF0GBMg0svPvoJEMaW+9eEDE+iN5Lh6tyr0CoiK1CA6VNn
         EZfvan4u0ejetXGyk481ZOtCjJg/XDEGxGV82ezhJS5EF/bUeKDKfGWr8vU+kpOkjI+F
         txDQ==
X-Gm-Message-State: AOAM533VGqDYRDkuWwMWuTlvvjkkkB0aWUUSj+fz3n8VjC/VYEYm9CzL
        k31xrbnfOh/eyJooXE2ad1R2fEFo4cAulA==
X-Google-Smtp-Source: ABdhPJzPq5ZxYXbXunRmzcQDdroIX+dBTmwSUNvm36ZDqCnC8TElM7L5tn++tpeF5Y11f1p0kjIL3Q==
X-Received: by 2002:a17:90a:fe82:: with SMTP id co2mr3106584pjb.216.1598386105001;
        Tue, 25 Aug 2020 13:08:25 -0700 (PDT)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com. [209.85.210.180])
        by smtp.gmail.com with ESMTPSA id d10sm65374pjg.0.2020.08.25.13.08.24
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2020 13:08:24 -0700 (PDT)
Received: by mail-pf1-f180.google.com with SMTP id 17so8187513pfw.9
        for <linux-gpio@vger.kernel.org>; Tue, 25 Aug 2020 13:08:24 -0700 (PDT)
X-Received: by 2002:a1f:9b8f:: with SMTP id d137mr7014781vke.97.1598385615556;
 Tue, 25 Aug 2020 13:00:15 -0700 (PDT)
MIME-Version: 1.0
References: <1598113021-4149-1-git-send-email-mkshah@codeaurora.org> <1598113021-4149-7-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1598113021-4149-7-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 25 Aug 2020 13:00:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XBidZvVit+P-HmQpxdi0XwD7uwkawJMCjPAp715Cg=4g@mail.gmail.com>
Message-ID: <CAD=FV=XBidZvVit+P-HmQpxdi0XwD7uwkawJMCjPAp715Cg=4g@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] irqchip: qcom-pdc: Reset PDC interrupts during init
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
> Kexec can directly boot into a new kernel without going to complete
> reboot. This can leave the previous kernel's configuration for PDC
> interrupts as is.
>
> Clear previous kernel's configuration during init by setting interrupts
> in enable bank to zero. The IRQs specified in qcom,pdc-ranges property
> are the only ones that can be used by the new kernel so clear only those
> IRQs. The remaining ones may be in use by a different kernel and should
> not be set by new kernel.
>
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  drivers/irqchip/qcom-pdc.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
