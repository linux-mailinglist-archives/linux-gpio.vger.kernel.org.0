Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7CCD41DEA6
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Sep 2021 18:16:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349323AbhI3QS2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 12:18:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349120AbhI3QS1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Sep 2021 12:18:27 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6F8EC06176A
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 09:16:44 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id m3so27116057lfu.2
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 09:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wrVVL6Q5oh52S40J0qY1IDd3nrzVJ/J8U0I1hgcarO4=;
        b=GGcKF1QOHQHdbK27J87+CXDf1OO+VZ4YO3NuP9kI2G8+4sWkeEA0OekFLzxL/L0w6H
         9nYnWC1zP7NmSdzsSEPUjMqDV5kXvs4oyZRlY+aUdk/RSgbjfZMi94mmTJTuz0cIMU9p
         CTHp6440J8LeqZSNzjqs6YNApx5rLH2OIRa3Jm1dJP+FE3e2aiK2ldl/2ss/r6oTcIfC
         7lXCk1V9kPA0b2fDE6xrjG7VoSAIAvbe8gVQUH2KDZT/66mrPBoSnKqW0oJzO54mqO21
         WYS+EE7VCVS+OxSjVYJ4cUrVK/qlUuYyTmB6bHW6Z7ZCkD5cXSRWMjDiSLmNxLiEoAbu
         JtzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wrVVL6Q5oh52S40J0qY1IDd3nrzVJ/J8U0I1hgcarO4=;
        b=ZFMqVOZMkZLNrcaCdUG8I1NOcHht3naqtbiGhnno91I3h5UwKKqb1LjW40JRXXybx6
         L5CFaM8HwV7Y2T+Hyr+p531QpQTK+gfHGYhUrXPqUo9ngTx7kBCPli7GWWmq1MiZaBxP
         FvnPDeDb3a8NsLkABsnPc5y0l//EgbOe6jpqyxDeuFlPY6uJxXysTfbrYjcMoqrbMapV
         jeXXkaddwLwU7lSw3ggf/SQZIzgOSL+v1gHATV4QjK+jJj6UFFY5MJjls/mNafkpiM/4
         O7kpH/knm7jH/Hivm2BHwRfuhihiVH1uvNh1cj6UaOaCS/Gs8WhHi02jluy0Dz+Gi/zq
         DpLw==
X-Gm-Message-State: AOAM530h42+yHCYCE2WNO9cEz5v+YfDCfI+OEgEJctb7Turt7sCP1vOW
        CW7Puqi6G0s4oAEN4N80uy66ohF1Ec+i7FM+uROSzw==
X-Google-Smtp-Source: ABdhPJzral1Se1YwknQbfsFc4flERKu85KncR+/GFdjE4b1oI/LFJgmnco2+Q+rENklt6Pbapdku3puvBG55dvJW1y4=
X-Received: by 2002:a2e:510a:: with SMTP id f10mr6681946ljb.358.1633018603142;
 Thu, 30 Sep 2021 09:16:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210930095225.9718-1-jbx6244@gmail.com> <20210930095225.9718-2-jbx6244@gmail.com>
In-Reply-To: <20210930095225.9718-2-jbx6244@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 30 Sep 2021 18:16:32 +0200
Message-ID: <CACRpkdYvKiO_jU5rakwpkpDNq=gCjqtqnVebSECGuWioBOG4wg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] ARM: dts: rockchip: change gpio nodenames
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 30, 2021 at 11:52 AM Johan Jonker <jbx6244@gmail.com> wrote:

> Currently all gpio nodenames are sort of identical to there label.
> Nodenames should be of a generic type, so change them all.
>
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Please funnel this patch through the SoC tree.

Yours,
Linus Walleij
