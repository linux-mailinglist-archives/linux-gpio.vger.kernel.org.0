Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C80540EDB2
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Sep 2021 01:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbhIPXKK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Sep 2021 19:10:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241256AbhIPXKJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Sep 2021 19:10:09 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A206C061766
        for <linux-gpio@vger.kernel.org>; Thu, 16 Sep 2021 16:08:48 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id i7so24743715lfr.13
        for <linux-gpio@vger.kernel.org>; Thu, 16 Sep 2021 16:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EEZ3KzJ/OoVk3tZxbZ8tD6FSY51r/kCa6gRIxucdHJM=;
        b=z48XNACMi5II30bJAbbmdTmkselHRQoTfWaZRmNYCVPyXUj5bLzFr1Bh2hqfadlIV/
         qUOax18dNGgiRKBPpDX9sEtQ5kjm7KUNdIrkxI218QPrls6K2KTjGz6+mjYo3emrVm5X
         WRnJFUdDh1oUplNZCRK2y/l9zMClcM+nkpOsFqu/F6awihIeu6bWgVLsqQPJEwZ/DDsd
         9nrySfUBYR/rPcaL06JHsseWnnK1k3WPoZsUcvZyn+yu6sicOR85UeR0K0/erM6ggzjh
         dBKggmeAp1OhpVf1hcKPytH37NiRy7FXKYi3VrsfWugw50mnNUe2ZYNI3XCJFJFNLZE8
         YnjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EEZ3KzJ/OoVk3tZxbZ8tD6FSY51r/kCa6gRIxucdHJM=;
        b=r532cyn4MYhr3vrfmIS80Tp+7Qkee1GLURO8jivdqX9iTBDuAUUPmB7UHcsotugkrZ
         bEJ164UJCelfqerUHQ0Nm/co/wPdBjnfm4jhxu6C2vpZ/vGsZOwEg+fi8fUYdJp3U2YL
         hv5pXtGWwjAA2FqQrre3lvPL3Qi+iU3hXzoz3lY+V2TFSm2eIqNAzwyR1tku8RFUBMSl
         Y3DE8NTpv8xlRZYlosVXLWFEqVwsga5XXS3/S5N1voPIrmgOmg/o5HKo6mGchmKLIXpU
         nFbHIW0PgJKuPpfSIBCoq2hxTjSYZQZ2RWKF33vpB7cT5ACYEjmjtCwhInc3zs4QbjMr
         emXA==
X-Gm-Message-State: AOAM533Q3cPpFgPMTNzfxdS0UgF1Ece9lptSSQPkgCt/ZqM2DzseJR/x
        lMeXy6ak9xwsAZ8jO5rdHHyyyMx3ACa/bAkhJ5oorQ==
X-Google-Smtp-Source: ABdhPJymcPdf0VI+AxaenTQWWVdAj6oiW83pqHfJDqYKIz35Ixkc9MmtlBYPB2581adUDpiVJFaiyWCHh3v//qtvxac=
X-Received: by 2002:a2e:4c19:: with SMTP id z25mr663526lja.145.1631833726007;
 Thu, 16 Sep 2021 16:08:46 -0700 (PDT)
MIME-Version: 1.0
References: <1631798498-10864-1-git-send-email-skakit@codeaurora.org> <1631798498-10864-2-git-send-email-skakit@codeaurora.org>
In-Reply-To: <1631798498-10864-2-git-send-email-skakit@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 17 Sep 2021 01:08:35 +0200
Message-ID: <CACRpkdYenJw10ddiXh1FhwQQvCJ-ssV96ezQxVboDe5bVzpR5A@mail.gmail.com>
Subject: Re: [PATCH V5 1/2] pinctrl: qcom: spmi-gpio: correct parent irqspec translation
To:     Satya Priya <skakit@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Collins <collinsd@codeaurora.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 16, 2021 at 3:22 PM Satya Priya <skakit@codeaurora.org> wrote:

> From: David Collins <collinsd@codeaurora.org>
>
> pmic_gpio_child_to_parent_hwirq() and
> gpiochip_populate_parent_fwspec_fourcell() translate a pinctrl-
> spmi-gpio irqspec to an SPMI controller irqspec.  When they do
> this, they use a fixed SPMI slave ID of 0 and a fixed GPIO
> peripheral offset of 0xC0 (corresponding to SPMI address 0xC000).
> This translation results in an incorrect irqspec for secondary
> PMICs that don't have a slave ID of 0 as well as for PMIC chips
> which have GPIO peripherals located at a base address other than
> 0xC000.
>
> Correct this issue by passing the slave ID of the pinctrl-spmi-
> gpio device's parent in the SPMI controller irqspec and by
> calculating the peripheral ID base from the device tree 'reg'
> property of the pinctrl-spmi-gpio device.
>
> Signed-off-by: David Collins <collinsd@codeaurora.org>
> Signed-off-by: satya priya <skakit@codeaurora.org>
> Fixes: ca69e2d165eb ("qcom: spmi-gpio: add support for hierarchical IRQ chip")
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Patch applied for fixes.

Is a similar patch needed for
drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
?

Notice ssbi rather than sbmi...

Yours,
Linus Walleij
