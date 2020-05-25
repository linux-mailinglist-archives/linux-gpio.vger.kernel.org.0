Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B2691E0DF1
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2020 13:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390306AbgEYLzu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 May 2020 07:55:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390286AbgEYLzu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 May 2020 07:55:50 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFD3AC05BD43
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 04:55:49 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id z18so20407961lji.12
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 04:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+mkEBPdVGpBGFyoI8j8HFLVKYs4hB0Ze1NrDN+H9//4=;
        b=Dl9TrwmQPeoE3jaUpcbhwTsZJCgQoRRdu4baaLsu04TpdTNzaqoI6O3YXQ+GOf6Sjp
         FB0MZ0UTIz1JjeI1Z2dk6xN2Fp9Fmkmep7JxkbmiabYb5gilLzb3dxM5Rrm8qBIsa7ku
         sPaakWkOAr6eIqCD+XlAJbUP3W0TuDCwK2BNkVndEMiBbKxXGomN4j7kaLJgKZwbWXc9
         8jHHyW8egtFvlYcDOvqFxk4kjTXOovA6bT1z7CQKYB/RMjnSuSE9M8bzVT5c8PHdel3b
         zBhhIdRVdIa0/32PC73lIN8+gsj0wVNTOdl7Gg51WLQgMJB6sTWXu9c7Da+QEorLu53m
         dxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+mkEBPdVGpBGFyoI8j8HFLVKYs4hB0Ze1NrDN+H9//4=;
        b=iZfNOmBnFO7R4M2IK0BFr2i0q21YhA0Q3aspoo1SCr2eNrccV0PqGojCtuvcnP45Nz
         7kKC24GUzJyupMwEl9+VkhALEwv4HHUoTJve/p1K5PN215Zrjvu2/H/n1K6HO8AsKrvS
         inyTh5ud2wopd5J6x7tC5eTr5uM4fLMgyJXV78MoOsyIgWg13n2ezVgaJOiABOz9aRk5
         PIDI3C7Mw0FiCki0p6BAWuE1emC1RON+VTNNxraDH3OB5Xqd0OpTWFxXN8o36bqTR5Sb
         6yBJ80C1gupYHZLUKVEpGGMe5dBgda+pVxRp16uVD51JsZVrUEtwAzRFYaUcU6LVxfAP
         yKPg==
X-Gm-Message-State: AOAM5319qb5JWG/0do8H/odbLrCSXmag0QspX8P0bSjQLIdpPs4ekAqn
        b1XDSGwZV/4cwESst/xN8f6hLHALMoBtnTY211vX+A==
X-Google-Smtp-Source: ABdhPJyCykHTiRF9bx/CWTPtp2I0DZ+jTkLxBQaoNUbWITp445SBYxAQbXbtO2c017bHBytURvA27YjWsWZBsXSIrME=
X-Received: by 2002:a2e:8e91:: with SMTP id z17mr10762076ljk.144.1590407748281;
 Mon, 25 May 2020 04:55:48 -0700 (PDT)
MIME-Version: 1.0
References: <1590253873-11556-1-git-send-email-mkshah@codeaurora.org> <1590253873-11556-2-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1590253873-11556-2-git-send-email-mkshah@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 25 May 2020 13:55:37 +0200
Message-ID: <CACRpkdba9j4EdCkD5OeL=3A4Zeb57vO78FAXA9fo0SOgBE57ag@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] gpio: gpiolib: Allow GPIO IRQs to lazy disable
To:     Maulik Shah <mkshah@codeaurora.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Doug Anderson <dianders@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, May 23, 2020 at 7:11 PM Maulik Shah <mkshah@codeaurora.org> wrote:

> With 'commit 461c1a7d4733 ("gpiolib: override irq_enable/disable")' gpiolib
> overrides irqchip's irq_enable and irq_disable callbacks. If irq_disable
> callback is implemented then genirq takes unlazy path to disable irq.
>
> Underlying irqchip may not want to implement irq_disable callback to lazy
> disable irq when client drivers invokes disable_irq(). By overriding
> irq_disable callback, gpiolib ends up always unlazy disabling IRQ.
>
> Allow gpiolib to lazy disable IRQs by overriding irq_disable callback only
> if irqchip implemented irq_disable. In cases where irq_disable is not
> implemented irq_mask is overridden. Similarly override irq_enable callback
> only if irqchip implemented irq_enable otherwise irq_unmask is overridden.
>
> Fixes: 461c1a7d47 (gpiolib: override irq_enable/disable)
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>

I definitely want Hans Verkuils test and review on this, since it
is a usecase that he is really dependent on.

Also the irqchip people preferredly.

But it does seem to mop up my mistakes and fix this up properly!

So with some testing I'll be happy to merge it, even this one
patch separately if Hans can verify that it works.

Yours,
Linus Walleij
