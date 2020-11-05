Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF6B92A8768
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 20:37:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731149AbgKEThh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 14:37:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727017AbgKEThh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 14:37:37 -0500
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B991C0613D2
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 11:37:37 -0800 (PST)
Received: by mail-oi1-x244.google.com with SMTP id u127so2884282oib.6
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 11:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0IeuWIyuaS2pCWkh8SM9vIHTk3Z9xKMgQga1epoP3ng=;
        b=KhyQlJxDU6io8FVXlTraVtbTy3bQuNC6sKWSQlCJoDV3eVUN8R8qBKymBN5FpTznBJ
         4MhBYMa2IuKyTowiy9/fZZPa8rYN0sdd7tu4P2gSHcjnay4/Ewu7Fnkn90lA7bFKqFwU
         yb6Ge7spA+x/jLS4G8ilTQ0oIFhVBUcg0IOm74/C4jRoKRtkmLSh/gFsNOSLkaQvAvkX
         LhSfYwfDvUD2o+ek/F5TywPUJ/TNO/UTLQPZ5VTC7cDsFWpESDgcORcU32pa8PnSWqnO
         98vNzQjj6t5oS5WFavOU9azcEjKsPpiPdpnK/9hEeczBP+OekrcPzv7NotIFDIo4DCVj
         gLig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0IeuWIyuaS2pCWkh8SM9vIHTk3Z9xKMgQga1epoP3ng=;
        b=R+iUOQ5FZ9y1YTbD8ZlGrV0i2abrmBxxzBYqUJ+o+Gn4lEOAk8hSR3qJtEATGKe3AZ
         wsK9ALZCcUWbPRt3hd9K/4FR02UlSyNdKDaJvjH440G7ZkaJxvFJVorLl17sGN4Qlm2v
         d+DDa88hJqcBf9U0gnPm44EorSYK15NTIYyrnBuT5bxjFWTGlPRxO0MIWQCuTPHbpDUJ
         7Sib8aV2EmtFi2JwJfvYsk4AcTYMN9gueWa4ZKTUCBeN+9PKnzhA134ajgPti/b0Plo8
         kKvDHtV0j9vNb/r1LyVwf8fJkpD/3jGvWwCRy28HYummLNK6hDJtRv68UMulkdwhTv9U
         spCQ==
X-Gm-Message-State: AOAM530WQDr9ZFaauWecnXWVrxLEe0TsebTbLC7UIcSDdS/UPToIpADR
        MP4/w2k9fx40BR1HJTjaFTcbaHtnUU4m/AvGhE5kng==
X-Google-Smtp-Source: ABdhPJy6EmV/kijD0O5lYgC/y/tG7BvaOubM7LfjvxCX96j17pkf6e0nRm/f++LPHQRFDQ7t06YdyL9HKphcyBMRX3A=
X-Received: by 2002:aca:1a07:: with SMTP id a7mr587040oia.169.1604605056727;
 Thu, 05 Nov 2020 11:37:36 -0800 (PST)
MIME-Version: 1.0
References: <20201031003845.41137-1-john.stultz@linaro.org> <CACRpkda1MV2=0MOMk3t4mr1RczdvfeiNTdbYXX6Jig+6p3TABA@mail.gmail.com>
In-Reply-To: <CACRpkda1MV2=0MOMk3t4mr1RczdvfeiNTdbYXX6Jig+6p3TABA@mail.gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 5 Nov 2020 11:37:26 -0800
Message-ID: <CALAqxLV_GG1tPf9NEHhQN0dtL6DJmOvENVvzdnS-4_o3pNOzoA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] pinctrl: qcom: Allow pinctrl-msm code to be
 loadable as a module
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
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

On Thu, Nov 5, 2020 at 6:17 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Sat, Oct 31, 2020 at 1:38 AM John Stultz <john.stultz@linaro.org> wrote:
>
> > Tweaks to allow pinctrl-msm code to be loadable as a module.
> >
> > This is needed in order to support having the qcom-scm driver,
> > which pinctrl-msm calls into, configured as a module.
> >
> > This requires that we tweak Kconfigs selecting PINCTRL_MSM to
> > also depend on QCOM_SCM || QCOM_SCM=n so that we match the
> > module setting of QCOM_SCM.
> >
> > Unlike the previous revision of this patch:
> >   https://lore.kernel.org/lkml/20200625001039.56174-5-john.stultz@linaro.org/
> > this version reworks PINCTRL_MSM to be a visible option and
> > instead of having the various SoC specific drivers select
> > PINCTRL_MSM, this switches those configs to depend on
> > PINCTRL_MSM. This avoids adding the oddish looking:
> >   "depend on QCOM_SCM || QCOM_SCM=n"
> > to every SoC specific driver, as that becomes a maintenance
> > headache.
> >
> > We also add PINCTRL_MSM to the arm64 defconfig to avoid
> > surprises as otherwise PINCTRL_MSM/IPQ* options previously
> > enabled, will be off.
> >
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Andy Gross <agross@kernel.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Joerg Roedel <joro@8bytes.org>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Jason Cooper <jason@lakedaemon.net>
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Vinod Koul <vkoul@kernel.org>
> > Cc: Kalle Valo <kvalo@codeaurora.org>
> > Cc: Maulik Shah <mkshah@codeaurora.org>
> > Cc: Lina Iyer <ilina@codeaurora.org>
> > Cc: Saravana Kannan <saravanak@google.com>
> > Cc: Todd Kjos <tkjos@google.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: iommu@lists.linux-foundation.org
> > Cc: linux-gpio@vger.kernel.org
> > Signed-off-by: John Stultz <john.stultz@linaro.org>
> > ---
> > v2:
> > * Module description and whitespace fixes suggested by Bjorn
> > * Added QCOM_SCM || QCOM_SCM=n bits on Kconfigs selecting
> >   PINCTRL_MSM. Reported by both Todd and Bjorn.
> > v3:
> > * Make sure the QCOM_SCM || QCOM_SCM=n trick is commented
> > v4:
> > * Rework "select PINCTRL_MSM" to "depends on PINCTRL_MSM"
> >   to consolidate the QCOM_SCM dependency.
> > v5:
> > * Add PINCTRL_MSM to arm64 defconfig
>
> Bjorn can you have a look at this series?
>
> BTW John  I'm afraid I just merged a new QCOM subdriver so we might
> need to respin this to cover all.
>
> It's an important patch so I'll help out in rebasing it if the only problem is
> that my tree is moving under your feet.

No worries. I'm mostly wanting to make sure there are no objections
with switching PINCTRL_MSM from a selected config to a depended
config.

If that seems ok, I can redo it on whatever point you would like.

I realize I can also split that change out separately from the module
enablement bits as well if its helpful.

thanks
-john
