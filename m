Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C63F540ED7D
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Sep 2021 00:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241229AbhIPWpO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Sep 2021 18:45:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241258AbhIPWpO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Sep 2021 18:45:14 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3672C061574
        for <linux-gpio@vger.kernel.org>; Thu, 16 Sep 2021 15:43:52 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id m3so22876851lfu.2
        for <linux-gpio@vger.kernel.org>; Thu, 16 Sep 2021 15:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e9vK4vGdDC63WMAqL32ZNqGgnqulhBvjxKLEPBFCsPA=;
        b=j2X3xuesVddiYakqolrzCKr9jK5YwQRvS1m/NFUYB2C+E2msRu3jOs0+A8oGBZ+DLw
         lvXAr/8dZTXiKo1MfPOBQTj2hnJZDAfkqwF0g1H4fMuNyVPc4Ge0FLCVrDlq9UmFPfY3
         Fsq7OpO90y86sZb5RToJH9HC0TSuAkIWYiGh6ijyazJXyge2HgBdsOdtGuRa/fPnpCxr
         nqyVEeTSqOA5tRSaVrZhji4L5+9R4uZbB6Yg1a8iga5Kio0Yp3xTuT3AaSmMF4bE9ulH
         f66WJA7HV08KrnfsNikDoySAO7nfsQxrEfda1kaP15QKvzwcEA51PvPTHswnIuMrdRXZ
         gRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e9vK4vGdDC63WMAqL32ZNqGgnqulhBvjxKLEPBFCsPA=;
        b=lR2o7jzIPnBioR3rRTdUWwxvakD+UY7sqJoPSBvJza6FoaeGfAb76LCuXQrewUJ2BM
         Fp936JgOovtH/LjnIci8BrYET28C7gVKKLI+33qQ6I78vpu9DQ/Rcd4jywyZxHAtKY0E
         K0YfUKJVIA/EpQFuJ1LryW/+j8W7a5tAdD48NRuT1mlSepngYwP4CbUCizJvNcxv86v4
         y32Z2loiSNb5RQW848KnkRtoOTbJNh2k/q8U3BdlDcMaTJpEazIR4taPntQni24CPz0Y
         Iu0ScTf/hyGpN+5ozdLIOKRPgHuRq7Uw9VDxICp032XeYv5gt88oxDkfH4jgcE34GSvq
         zrQQ==
X-Gm-Message-State: AOAM530cug41LVC3oL6l/YlzG0CuyR0pIJ0Gye7r2sWTi5EM6llcPTsV
        t/S0OUb0z0RysvOWIyTEEcdPVQRYJRIuGExLpZ6nrg==
X-Google-Smtp-Source: ABdhPJwLtz+ZO0Z2RjSau7oR30xF9dsV8wJbMLCWs0Yp4WIzSOFFcj8LCcpAQQfg4rw614RBF+9sWq+9RBEShjwIMoI=
X-Received: by 2002:a2e:b5a7:: with SMTP id f7mr6906537ljn.19.1631832231047;
 Thu, 16 Sep 2021 15:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210830095357.21108-1-pshete@nvidia.com> <CACRpkdau6v-QQhtWKVqiVaT3kPERRwmLtMWh3zXSM8+tStF9RQ@mail.gmail.com>
In-Reply-To: <CACRpkdau6v-QQhtWKVqiVaT3kPERRwmLtMWh3zXSM8+tStF9RQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 17 Sep 2021 00:43:40 +0200
Message-ID: <CACRpkdaZG0U8Z6bV+uZxJBjkfWHnmfSJ4iGcwW9JSsZUWfJgiw@mail.gmail.com>
Subject: Re: [PATCH] gpio: tegra: add multiple interrupt support
To:     Prathamesh Shete <pshete@nvidia.com>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 17, 2021 at 12:38 AM Linus Walleij <linus.walleij@linaro.org> wrote:

> > Signed-off-by: pshete <pshete@nvidia.com>
> (...)
> >  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 49 +++++++++++++++++++++++-
> >  drivers/gpio/gpio-tegra186.c             | 25 ++++++++++--
>
> It is a bit unorthodox to patch the driver and the DTSI in the same
> patch, can these be split in two and applied separately?

I see you already fixed this, sorry for the fuzz.

Yours,
Linus Walleij
