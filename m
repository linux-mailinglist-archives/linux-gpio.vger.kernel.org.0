Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 496682A809A
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 15:17:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730618AbgKEORW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 09:17:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727275AbgKEORW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 09:17:22 -0500
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD186C0613D3
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 06:17:21 -0800 (PST)
Received: by mail-lj1-x241.google.com with SMTP id m16so1735761ljo.6
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 06:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ckFCYgz4p7fV/Rv1ULwzhaLsz6xFc6pP5TZ8DCIkxxA=;
        b=LCaGszICBBAWv70tAKMjDm5ZOV0L4wNQX13Eecy0BkI6e1/k8zmE5W8HTwBm/ZX8M+
         v49/+xKIETMrC1vQV6v0+Ci5Wnex0X5SRy8K3waOOb0ohDg3IyZwFelFWOLwRfKHg5td
         ZSy0Kqof+2A8UXB/Fvm3dnyjDmCJ+LrOI0xpeedQqhf6mIQv0AL29Q2YnYo0tU3Kr1ds
         ipoC5YUtTwXbS1xY2KBYh5WWQvT/7XDJYrgV2pDqkW6yrm6Mf/yiuhF8zhHxizc7M/lP
         biay1WeEs45NggRz/rO2TZQ2zdbe4aW188+ciVgWWFrj/n5ldTFATiVGGa0nI/+Dr9w0
         VV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ckFCYgz4p7fV/Rv1ULwzhaLsz6xFc6pP5TZ8DCIkxxA=;
        b=BaYdAM+dIAwXXOxf0a6rZ/BqgoYJoi/SmJJioJ2lQc/bz3eMvTrSHUZdhRQT8lXs1S
         KqyFtjlA/YpBkBI0m4++4v2TRZNNaKb0ednp6V7uL9Hhm/u0I/qsNuhXwEDaIgblA8lW
         NF0G4ak0iTl4mJeW1oQgC1cUYHZ1LwCAOI7efCIXzy/NvEIVYi6Tk0TZZFpyKFa3DsV5
         UlqYrgw/SZQa9vZ113Dj2WQdWPkmdhhogKzaaxnE5Oepb8BE3PaxNdVUek1mUj2J8aDZ
         ExjFj/OSf0lda/c9rHHqH0ZclqQbZneEqvxlJbJnqB/cmjIKAP2tJLHMWaRvPwPMaAdJ
         w1Fg==
X-Gm-Message-State: AOAM533ucIDaTCLD6YkI+LBpn1qneM7nFtXoIh3NE2hCvcK0xJ50CXPM
        GUENtEUm4QxlwDPv127Hz10KqZM6BASyop/Yp/Q2Wg==
X-Google-Smtp-Source: ABdhPJwbKFPhoBPzVE12zAliR3cQNeWctJKtHRHeIQIXzMArYYL00YURYRptpkIiDgn3MbyelUxvyacBOiB03zwHAW4=
X-Received: by 2002:a2e:80d2:: with SMTP id r18mr1049377ljg.286.1604585840115;
 Thu, 05 Nov 2020 06:17:20 -0800 (PST)
MIME-Version: 1.0
References: <20201031003845.41137-1-john.stultz@linaro.org>
In-Reply-To: <20201031003845.41137-1-john.stultz@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 Nov 2020 15:17:09 +0100
Message-ID: <CACRpkda1MV2=0MOMk3t4mr1RczdvfeiNTdbYXX6Jig+6p3TABA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] pinctrl: qcom: Allow pinctrl-msm code to be
 loadable as a module
To:     John Stultz <john.stultz@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Andy Gross <agross@kernel.org>,
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

On Sat, Oct 31, 2020 at 1:38 AM John Stultz <john.stultz@linaro.org> wrote:

> Tweaks to allow pinctrl-msm code to be loadable as a module.
>
> This is needed in order to support having the qcom-scm driver,
> which pinctrl-msm calls into, configured as a module.
>
> This requires that we tweak Kconfigs selecting PINCTRL_MSM to
> also depend on QCOM_SCM || QCOM_SCM=n so that we match the
> module setting of QCOM_SCM.
>
> Unlike the previous revision of this patch:
>   https://lore.kernel.org/lkml/20200625001039.56174-5-john.stultz@linaro.org/
> this version reworks PINCTRL_MSM to be a visible option and
> instead of having the various SoC specific drivers select
> PINCTRL_MSM, this switches those configs to depend on
> PINCTRL_MSM. This avoids adding the oddish looking:
>   "depend on QCOM_SCM || QCOM_SCM=n"
> to every SoC specific driver, as that becomes a maintenance
> headache.
>
> We also add PINCTRL_MSM to the arm64 defconfig to avoid
> surprises as otherwise PINCTRL_MSM/IPQ* options previously
> enabled, will be off.
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
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
> v2:
> * Module description and whitespace fixes suggested by Bjorn
> * Added QCOM_SCM || QCOM_SCM=n bits on Kconfigs selecting
>   PINCTRL_MSM. Reported by both Todd and Bjorn.
> v3:
> * Make sure the QCOM_SCM || QCOM_SCM=n trick is commented
> v4:
> * Rework "select PINCTRL_MSM" to "depends on PINCTRL_MSM"
>   to consolidate the QCOM_SCM dependency.
> v5:
> * Add PINCTRL_MSM to arm64 defconfig

Bjorn can you have a look at this series?

BTW John  I'm afraid I just merged a new QCOM subdriver so we might
need to respin this to cover all.

It's an important patch so I'll help out in rebasing it if the only problem is
that my tree is moving under your feet.

Yours,
Linus Walleij
