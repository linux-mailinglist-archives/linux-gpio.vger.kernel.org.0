Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00C4A1CF461
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2020 14:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729378AbgELMas (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 May 2020 08:30:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727859AbgELMas (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 May 2020 08:30:48 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7D4FC061A0C
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2020 05:30:47 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id h4so13401935ljg.12
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2020 05:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DkbzZyFNKR5xF9Zj0XXSLiW6F+Uc35unyhuy5/Nx/Q0=;
        b=exCeW+nP77zJ0TV1K0EGNA+H5dOM/e46KBa/p2zQGq61zsrFTTx7KZa5cldAt97Ijl
         uwywF17fXwO0Y2J8N458zCY761VkF06TyT0wXmXeCEhP522u18UyGR4fACmDugGvm7g+
         iKwhuQc5slkVhiBkG+a0xKgBo9iJpN4k+oOr+Avdnnhsa1Qb0NQn+t7ztSODllLqm/Oo
         ea0/5ry8lpH3UTmbt0dCeMpjgutQAtCibc8scwfVMNVVolq4HhKolP10/HvVk4H6fkf0
         N5h2cevIpBluCumqyoMVJ26Z24EyM2rmAUzbkxtbZtIGQRGc1VHm7JEsplkKN7zh0nWF
         6EQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DkbzZyFNKR5xF9Zj0XXSLiW6F+Uc35unyhuy5/Nx/Q0=;
        b=Tis/F5S1Jdzy3N5VEJuxTwtpUcKc5ScjYAxbupSz2JbHWdLnYXPChg49pGFvVeF7l2
         Z4BVNZON9nWXIdYCPfjd6vCb+QEsVcVnYT/h+AeoUtLb9miTFQkdZLidwlHeIvvlpbrl
         TC6tzKjGQfeAT60wSsAWT+80FJPGjzISyMDJ4bMl1HGgPT3wNyucCfhpWPinO0MrpKLZ
         sUBYXmdEH4n++40HSMx7EyBVI/PuwioFe5TPEwl7Zy/bFVdvMSpBK8cpUhft6W/v38RE
         VrR4YkHoctj4OCx2UavrfPPTdh8ted6K/waKQaMzUguO8BKU075uSiRCPeNwRNoTnDRr
         c/Rg==
X-Gm-Message-State: AOAM5307mvRt67HdyI2Xs+g0lj1uEBwOq7o+T/jivv/qe+K5GjCLR+lz
        VyRb0B29T2aODcU+TGae208RPf7aA5e0RmwFCg4q6w==
X-Google-Smtp-Source: ABdhPJyQ1XkAcDYdXIDP8J2lY9e4GdpmrmWTg4XAQwyJXe2xgn9EQQgalxHJmKDmPx5R0kd7PzBNkmSwwYjMe3jXEHA=
X-Received: by 2002:a2e:8805:: with SMTP id x5mr14097206ljh.223.1589286646283;
 Tue, 12 May 2020 05:30:46 -0700 (PDT)
MIME-Version: 1.0
References: <1588314617-4556-1-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1588314617-4556-1-git-send-email-mkshah@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 12 May 2020 14:30:35 +0200
Message-ID: <CACRpkdau3+OytK93=6SA-mzdcded6Jsx=WoxgXXd4KMUc_WwPg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Add affinity callbacks to msmgpio IRQ chip
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Andy Gross <andy.gross@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Doug Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org,
        Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 1, 2020 at 8:31 AM Maulik Shah <mkshah@codeaurora.org> wrote:

> From: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
>
> Wakeup capable GPIO IRQs routed via PDC are not being migrated when a CPU
> is hotplugged. Add affinity callbacks to msmgpio IRQ chip to update the
> affinity of wakeup capable IRQs.
>
> Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
> Signed-off-by: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
> [mkshah: updated commit text and minor code fixes]
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>

Patch applied for fixes, will go upstream soon (unless
Bjorn stops me).

Yours,
Linus Walleij
