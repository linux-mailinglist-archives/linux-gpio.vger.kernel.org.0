Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE8A237BBD7
	for <lists+linux-gpio@lfdr.de>; Wed, 12 May 2021 13:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbhELLes (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 May 2021 07:34:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230096AbhELLer (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 May 2021 07:34:47 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06D28C06174A
        for <linux-gpio@vger.kernel.org>; Wed, 12 May 2021 04:33:40 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id i4so30303065ybe.2
        for <linux-gpio@vger.kernel.org>; Wed, 12 May 2021 04:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hwqwx4LJYn+nGrs/s7vt3MWR+fST/FOpGPjuEVfqI1Y=;
        b=ZzghOpmFjMBck1DvPmfzHW9Sdd7J4gJKsYxzxHyT/K6yCOmAqFHSIghrHgQCxbq2tl
         3UVfc6d1p1Xt+yDdLD6Og7RCTTD8O+NPaToKV/DXRYMEaMhWju5fad+YssppnmMA5hTA
         Z5Ar6zGcfi35Lw0yHYk/Zcxi4psHs7/la7mptBxbVoeGmlUYvbyZ9jzzygTn8kP87K+Y
         hksbrePF7VxFYOG7wBoN6L6/QCNQgUzRTtPP5SQMWYx9Tvru9NKiJbKbV2NvXrVbojHs
         k4xoMJe4TL+6PrKAe+cQLMehmqVWre2lC6vNQ2Oq9a43g4ghs+6UzBJv//PpYfeXb1qE
         a4Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hwqwx4LJYn+nGrs/s7vt3MWR+fST/FOpGPjuEVfqI1Y=;
        b=hyPOJZnQsViO+p7/DVjhdFHsIQSQWZ+KXBZ1ANPXxCHOtVTjr/Qcg1oF01mnZuMdge
         +b0nT4af8k+yIbL2mLUk4rc+8BmEkSMIih8A2Rydchu2daDJ9RiGB8etKASrG+Rh6lUC
         NoFX9fQvyZStXMGWXS9pBsF3dc/j2ltphi5bpFO5x1/63Lf252ZJ535MgRqe7B61LNjX
         aQunoCSxWTkvky/fsRNIuXo5VJqkaFa5pfi8UJSycA5vA5mBSU3TDWQjDZzIo+jCxCbN
         Mth7ENgtrxxmgnIYOogDIjrsUIpm8bvvbqDlefuB9pRJx8RRxnFKp+aKNCxcsiPkRXus
         g/mA==
X-Gm-Message-State: AOAM533eurjKKezmTlXknN6n7skTPCKHihmdh6EG9Y7XsYJXjyjS4T9m
        DkA+02SMdKG3kEPhcbX5Owiiv9FnHnl2bsr4Iq+U0Q==
X-Google-Smtp-Source: ABdhPJzVDgzsy/eNX1ps1bd8bp+PkNNtBxIF7Wh4nsVHVqC87fdjHMvHoqdIsZ0U8nQlU9VMEcEjqK5fZzdFDLjoMGQ=
X-Received: by 2002:a25:dbca:: with SMTP id g193mr20139314ybf.0.1620819219357;
 Wed, 12 May 2021 04:33:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210511050511.5973-1-jbx6244@gmail.com> <20210511050511.5973-2-jbx6244@gmail.com>
In-Reply-To: <20210511050511.5973-2-jbx6244@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 12 May 2021 13:33:28 +0200
Message-ID: <CAMpxmJU9K9t+LOT6SLarXQYZs1YCqVZHMz_ZM+iMpzfMtqUH8g@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: gpio: convert rk3328-grf-gpio.txt to YAML
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        jay.xu@rock-chips.com, shawn.lin@rock-chips.com,
        david.wu@rock-chips.com, zhangqing@rock-chips.com,
        Tao Huang <huangtao@rock-chips.com>, cl@rock-chips.com,
        linux-gpio <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 11, 2021 at 7:05 AM Johan Jonker <jbx6244@gmail.com> wrote:
>
> Current dts files with RK3328 GRF 'gpio' nodes are manually verified.
> In order to automate this process rk3328-grf-gpio.txt has to be
> converted to YAML.
>
> Rename 'grf-gpio' nodename to 'gpio'.
>
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Patch applied, thanks!

Bartosz
