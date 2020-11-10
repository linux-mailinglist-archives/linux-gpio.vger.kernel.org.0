Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F181E2AD799
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 14:34:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731962AbgKJNeP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 08:34:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730373AbgKJNeP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 08:34:15 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7522C0613D1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 05:34:14 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id r17so9028324ljg.5
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 05:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KGLM9fPNY7+GT4p8nJCSTip3uZZh4KalRevc6NBKqSw=;
        b=h3fs2yDbhXzIKAaNrM+h8p/XSPvr3EH34ss06aruBBygOKO9jCk2Y2fGVpLMiUHrXI
         LE6Lep9wERBSv9edvF2R2doBF6UAXzV/t6wvEqJGmP2fv/BKT/WdMvx9o3EnhCP6JLVi
         Q1xUeqe6Uu/vuhmQBEe7HAqerEUcGEq2nQwgaTgrpDmXvvfR5zTO9Gvv6n00nixmJ40E
         IwnKLpjoF9/iK0H8bBSdj24Ftf0Wj/OpGR7dBsrwYGZC2Z+nEBeRufIeob+3TLmbiUHU
         tgVSzrE7cn5YGxROsHaRqAZ4NEXXzsPQLOwEu1nPCsTN9ZyJANwF9wGuLlNEpwaEPI9O
         /iOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KGLM9fPNY7+GT4p8nJCSTip3uZZh4KalRevc6NBKqSw=;
        b=c7M+WwZYdyvi6BYf5tOlU3ZlyzsL2nfUiMjinKMK2tuHx43Hy/0lkbb42RRTfLhBEU
         AXdwHQaxuMW0q0n2Zw907HEz7BHzkqhpgJ5mzk3BX1zVK1nx/FsPenaBx4erfdD6xWQA
         TT6zYyQebpgJItoyVWgyhNnwmZAIkbzkl6TnqWrTz4kw8m/hw7H0q0DbCcVLh22c6x/Q
         swt5Zb64eAtH2SUOvLXQTmewRh/c3n/NmLZVC2iFfxzK4DRrwMeQMFrUw6ZflL4i0/rX
         mx8VGGq39Bdw+2EQ25KtpDnMkhY04WLkwl0VuJWNLCJw4qIKfRgfeoyiJQd4KP6YIti6
         YHRQ==
X-Gm-Message-State: AOAM532bdLWx0x5Yrz5ScIIcFnHAKoLDrOvZBOWT1TfUVaB6tX0RuQ8e
        AV/bp1xqex74ejcmBkIiPiUgjHq1pb+SAAU3+RuiUg==
X-Google-Smtp-Source: ABdhPJw4l95Aug60napiBX1bSOo2GaerufcLINoM+ZkU5hACFyVVdkrKEpvI/w+Qkg+bt6DgzwF/QHjFBj4ZnqZLbQo=
X-Received: by 2002:a2e:8604:: with SMTP id a4mr8277742lji.100.1605015253248;
 Tue, 10 Nov 2020 05:34:13 -0800 (PST)
MIME-Version: 1.0
References: <20201106042710.55979-1-john.stultz@linaro.org> <20201106042710.55979-2-john.stultz@linaro.org>
In-Reply-To: <20201106042710.55979-2-john.stultz@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Nov 2020 14:34:02 +0100
Message-ID: <CACRpkdYf-SGfqjbE_SFfJLidH8v+Q3=_hwKkHZGfKNgD_GdLMg@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] pinctrl: qcom: Allow pinctrl-msm code to be
 loadable as a module
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 6, 2020 at 5:27 AM John Stultz <john.stultz@linaro.org> wrote:

> Tweaks to allow pinctrl-msm code to be loadable as a module.
>
> This is needed in order to support having the qcom-scm driver,
> which pinctrl-msm calls into, configured as a module.
>
> This requires that we tweak Kconfigs selecting PINCTRL_MSM to
> also depend on QCOM_SCM || QCOM_SCM=n so that we match the
> module setting of QCOM_SCM.
>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Jason Cooper <jason@lakedaemon.net>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Kalle Valo <kvalo@codeaurora.org>
> Cc: Maulik Shah <mkshah@codeaurora.org>
> Cc: Lina Iyer <ilina@codeaurora.org>
> Cc: Saravana Kannan <saravanak@google.com>
> Cc: Todd Kjos <tkjos@google.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: iommu@lists.linux-foundation.org
> Cc: linux-gpio@vger.kernel.org
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: John Stultz <john.stultz@linaro.org>

Patch applied!

Yours,
Linus Walleij
