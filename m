Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92CD52222EA
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 14:52:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728488AbgGPMwI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 08:52:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728093AbgGPMwI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 08:52:08 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6E07C08C5CE
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 05:52:07 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id z24so6976634ljn.8
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 05:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HCnwyZoMzuPKsERhk3jj3Z4cbSkn3iN0nOs3nxQkMq0=;
        b=sOjZAMG0GZhuc7hKNYzLVK9cSOp5waHIXzYWhb43Fz8ZgX9z9+bNavNcAEpG70dgBk
         ymAxg8CBGeGJogHJ8EZfOJxQxQrcVu4fbyFxrtPhw/lrQtdZwuFiFnU3Ns9+2O77tI7T
         t+cLNEO2tso3H8qv2p3wup/rHCTC9UnJFDeLIR9S3z+CUU/XMjzPHMO8ZlQKuTNz6l/0
         eNvh5dAs47H6r7AMj0WyGKIZ3da6n+akTPo1vtDqAr7R9LVFcAQzgEkzK7V29ThxVSfl
         tlafLPmggszgOc2KgLZv3yeFkDfhxzR7uBKLqBJdhVoSPaG7IxVDNowwB3Q79TU4M5aw
         Us8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HCnwyZoMzuPKsERhk3jj3Z4cbSkn3iN0nOs3nxQkMq0=;
        b=rsIFd9w6f02XzO0rYQYWyUJFskh1WpyVxXSrJpU3RRRUloCP+4m0PFx2Q+uMlSuhkL
         kPHo3oUrvx94h3eJakTGODrYl35fLS5ciIoHh/ezwGCfNHfnSwhd6DnxKT7y5TvD520M
         2IU9EUEIpfpVCpElWzFtwOxShBIyG17NUjJ8sC0Dxd4pTMOI7Um3TYzG8D5yFIF8Wsst
         625rtWLgmtidHi54I+eFPsH9uLA014Eg7Yn7iNTcHIwVLgqOPA4l31mQHIX9HB+q9gR0
         hfnK2qwbh6IKisHreTQ077GOYVUNlfib4b2DoOg1PrMwDX3meW5i+GbmJRMR6ZsqdUkq
         7FHw==
X-Gm-Message-State: AOAM532XFem61Yaz0nEJrhkOiHrP/6I1SvrQPSGTpRGHZcM/kuqShL9b
        M99Djsl8H3iXQ2m26DWbbpduhPFGq2juJcno4eU5Aw==
X-Google-Smtp-Source: ABdhPJw/BhPEYT/8575MJQZaoQ8ocAWYoTgsBn5QFuT7ytXA0Q8/v+AT4JkXs2IK1Vyo3oIafinMzE0ToIsQaj9hRe4=
X-Received: by 2002:a2e:810a:: with SMTP id d10mr1900535ljg.144.1594903926142;
 Thu, 16 Jul 2020 05:52:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200710231824.60699-1-john.stultz@linaro.org>
In-Reply-To: <20200710231824.60699-1-john.stultz@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Jul 2020 14:51:55 +0200
Message-ID: <CACRpkdaSiUwa0i5nQy8EZOg7smN3g2a+1AV2x+1PShNc071UFg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Allow for qcom-pdc to be loadable as a module
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 11, 2020 at 1:18 AM John Stultz <john.stultz@linaro.org> wrote:

> This patch series provides exports and config tweaks to allow
> the qcom-pdc driver to be able to be configured as a permement
> modules (particularlly useful for the Android Generic Kernel
> Image efforts).
>
> This was part of a larger patch series, to enable qcom_scm
> driver to be a module as well, but I've split it out as there
> are some outstanding objections I still need to address with
> the follow-on patches, and wanted to see if progress could be
> made on this subset of the series in the meantime.
>
> New in v3:
> *  Drop conditional usage of IRQCHIP_DECLARE as suggested by
>    Stephen Boyd and Marc Zyngier

This patch set looks entirely reasonable to me.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
