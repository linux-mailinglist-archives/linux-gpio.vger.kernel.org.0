Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED2621E2E6
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2020 00:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgGMWSH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jul 2020 18:18:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbgGMWRe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2020 18:17:34 -0400
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com [IPv6:2607:f8b0:4864:20::a41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E15E7C08C5DE
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 15:17:33 -0700 (PDT)
Received: by mail-vk1-xa41.google.com with SMTP id v26so3210998vkn.2
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 15:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KyzzzEfQ3Uc/t+bUav/3x8lC62pgjGuDPMIXbn4bZbw=;
        b=InUYU/sUXni6t/s3Y0tEzsg6QRkbF8CdHi29QeizGklCp2wPj8fVd34LQ23a0P4iuU
         nDGgnyMb2+gOlkblxRAG3WGfZEczi+XzLqzr3/WSm+8/OTockDZ0K70oggBRR7nwiPQZ
         WlrLXTDfpeFBc2CMm04EkptdN+M89zgyRIiPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KyzzzEfQ3Uc/t+bUav/3x8lC62pgjGuDPMIXbn4bZbw=;
        b=ZjcInCM6wLzkL4dlJV328yeZpZKVikEXuGoawsOXiSWUyKKWVHPHveYDBliq/2Ll8Q
         KFdRiZsdl3EwxtsrzB84Lc27r5ESEDM9CmuNWOadV+dGKLzW9DwGNORLnKgDIX/spwEI
         ICaGWD/D4s/wmrutXMgWsUk93heutIMw9HQa/Ae/SWN1Nf++JU9EB9ZjSGMVJjGii3qn
         b12QiOBA6Lic8g9zFtYH35noVuV+6jy9/jmnWcfq6vic+wswEwDevFS4Gca85JhPzJAs
         TLObUATBoo8QHxCuGAeoAp0U8C464e4U818zgF3ZwGiLrr5kgaVkwKjyv8V3qJjVoK8J
         bzww==
X-Gm-Message-State: AOAM5312saZDktqKfgWjrydw/RCaspsGLuAa55UXnAj1Pr1NffAsV938
        AYRwNC3dRmdXyx4OKfNyTdCfRqrG2ZY=
X-Google-Smtp-Source: ABdhPJwNY6tCuY3zt8YfOyPKXwgiRvFrN9tqNYWznQ5nc+YQ9VQnzaf6BBIZkFft7sETPmW9T7bcEQ==
X-Received: by 2002:a1f:5986:: with SMTP id n128mr1672291vkb.93.1594678652970;
        Mon, 13 Jul 2020 15:17:32 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id a23sm1740528uaj.12.2020.07.13.15.17.31
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2020 15:17:32 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id s20so7495053vsq.5
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 15:17:31 -0700 (PDT)
X-Received: by 2002:a67:ec0f:: with SMTP id d15mr1113618vso.121.1594678651291;
 Mon, 13 Jul 2020 15:17:31 -0700 (PDT)
MIME-Version: 1.0
References: <1592818308-23001-1-git-send-email-mkshah@codeaurora.org> <1592818308-23001-4-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1592818308-23001-4-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 13 Jul 2020 15:17:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xfi+5ms_pRyGjOG2EhkkGf9jCzXvEt=cHkBQMn1wkU7g@mail.gmail.com>
Message-ID: <CAD=FV=Xfi+5ms_pRyGjOG2EhkkGf9jCzXvEt=cHkBQMn1wkU7g@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] pinctrl: qcom: Use return value from irq_set_wake call
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

On Mon, Jun 22, 2020 at 2:32 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> msmgpio irqchip is not using return value of irq_set_wake call.
> Start using it.
>
> Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)

Seems right to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
