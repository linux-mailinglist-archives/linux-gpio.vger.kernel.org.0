Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 965191E0D62
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2020 13:35:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390142AbgEYLe6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 May 2020 07:34:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390073AbgEYLe6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 May 2020 07:34:58 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38EA3C08C5C0
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 04:34:58 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id w10so20455968ljo.0
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 04:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Wi+gk3CC8jugnfSNVoMn5WXhzhJYTbdK21k8+STJk6k=;
        b=Y+pESXNupJYz2M2etZnKieO/VeNhDEch9p7SVInZEB86XRO8h8M0GoDFaLeaBHge/W
         Xp9kIUqUEkWWSw7pjtUsHwOtULbYumcsJXagBz9Ug1w/NyvSgP0CQ3BbjxCv+HgrB1fH
         v0FMESlvZPYhwTC1m2O/dm7zggf8bAm563//moUatJJH3uVnOVQ1G5LKgQlw+V4pmaQE
         nFAU4UIJmnE5qEc7JF6agjan+4tXxbuDF5lKRg0yWE12MncRS99VJLMnqTN2QXnDp6Ne
         9pZ90O0+wuTvskb5fFW0cpQxlH0kvGuiwxPPgcUyNGvUm478ynq1TcZi70/WmqqsQyp4
         NTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Wi+gk3CC8jugnfSNVoMn5WXhzhJYTbdK21k8+STJk6k=;
        b=AOIMquPHt/RDg6qg2zfpGiTs5hafCnm2ILemzIdMsBmF3hE3RHKJB8E+zq1qS2Czmg
         DLi2d5EVHxD4fAPUcH/KG/7FD/FmS6U2FsS6LUAxUQWUtzxEqBdtPti1Q5+kH/rH4rdC
         81DUE06mSiFqnAS9Q+hyDhQEeCuq4oMKVLByL4M6KZpZr2lAeNgIMy0zFt7R//y9JC6A
         dMhv4U2AY1CThwKdPuINFyXEqdTdJeX5KFLZhG7KD32HkYdri5OQPR5Tx4ucONigo8zc
         nybwRY99FFnw2DLQM7VWYMvtBIMIN83JL5btorDLs+IBj6al2sz/O8BFk5rb1NZZHmMO
         Yx/g==
X-Gm-Message-State: AOAM531mXu+RMR6fsMNt8GctOXhmYHhvkedr/MXA45n1ek4zSkVwJ5pY
        rqh1vIXuQZQ+q0Gi/t67jkxdu3B8sFjOGF9ipNKnPw==
X-Google-Smtp-Source: ABdhPJxFW58LmjFQ2sV+aQMAz5AdRkRbkgO4NOt9cugPGtvFDYY4xWr6++WnNjKk6nO+SbTF8QVEWA7J+F6+Lk6vtb4=
X-Received: by 2002:a2e:8703:: with SMTP id m3mr14339462lji.286.1590406496492;
 Mon, 25 May 2020 04:34:56 -0700 (PDT)
MIME-Version: 1.0
References: <1590153569-21706-1-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1590153569-21706-1-git-send-email-mkshah@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 25 May 2020 13:34:45 +0200
Message-ID: <CACRpkdbpbOPfMfgjF17C=ET1SCiY49Wu55fgO6-kjBwR0mmQrg@mail.gmail.com>
Subject: Re: [PATCH 0/4] irqchip: qcom: pdc: Introduce irq_set_wake call
To:     Maulik Shah <mkshah@codeaurora.org>
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
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 22, 2020 at 3:20 PM Maulik Shah <mkshah@codeaurora.org> wrote:

>   pinctrl: qcom: Remove irq_disable callback from msmgpio irqchip
>   pinctrl: qcom: Add msmgpio irqchip flags

For these two:
Acked-by: Linus Walleij <linus.walleij@linaro.org>
so the irqchip maintainers can merge them.

But you ideally also need Bj=C3=B6rn's ACKs.

Yours,
Linus Walleij
