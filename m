Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED70641451C
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 11:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234388AbhIVJ3I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 05:29:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234393AbhIVJ3I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Sep 2021 05:29:08 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B70DC061574
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 02:27:38 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id t4so7216594qkb.9
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 02:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tilLj76TPuTpGDBFmhCvj0XM+49+fiZL/DQswhreJ10=;
        b=nofHkNUbYZJvR4FoyoBpnjRnqf1qNSRV6vW8PlecT60OgNgezJSuZ8F8xsvsTa4RiX
         qstp+7BG0ldBR15Yrt+ebdFB9rpBPDvkSkIp2nVChS2b/BEqM2iOhGdz8FUQsJZPEbw6
         CNXKjna7Sq+FlRpCA7dhwAxDfHWDG/xOYceelI0KuyWtkHWDnHsG/dP0uJmm8/gWvLjG
         vrBnB74DHp20uq43sdBTOwZq/3HND/7TSQVKuj5BOHprjA6KCdJd+Xj3mmmNs4abR88I
         sxW8jNG7sCScDebqqIrSZCE8zz1UpezSpxb+T1LfXiMWyvo4WHTXHW88K1phn79BJWRH
         xRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tilLj76TPuTpGDBFmhCvj0XM+49+fiZL/DQswhreJ10=;
        b=F57iFA15fiJaOkUAIswnkt0yvHoCBQrbDDMNezVfjq6MbA93wxUlXawOhEv2bQn39Q
         DMA3BAApf2PLnagGcqjkHOz9hV7X/7n7/1guL68Ql7rYFh77pi2Ghe9jw4DyoeWeHy+2
         1EGP16A3ONz9JuEQcRjrFb1omvmVcyRY6SxcOk15c1uNINDaaBQaEMQYWyskCZK/NaQp
         c9EvuOd4aOPEzKvhZ0RHWmAXIIjQRVoxl7nJUaJ4IU6igZVLQyZUGzm9zTtIzYG93Pge
         cCGs9HAJ7QoEcbHxGrzWXKHwNoE+FznkFRgfYw3RdHdgGTcRDzh54/rJ0m+DZ8mI9wtw
         NpTg==
X-Gm-Message-State: AOAM531nXqQrCXd9Pkx0/9n5U5IfYYhFlqOAONXUgmt+meIiZGo0CVsc
        wGW35t9dikKpvSorBWyvmZQwB7pGo9iUcO6GAs6mxQ==
X-Google-Smtp-Source: ABdhPJx+7jMUDAlovngPB82cNaH261sjiihbmIpUdUWI+Yq4Gh0SgtwiTP2LNAxQ2CQe+tUN/BPbism8KQnVzsefdz4=
X-Received: by 2002:a5b:783:: with SMTP id b3mr40104169ybq.328.1632302857487;
 Wed, 22 Sep 2021 02:27:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210917105412.595539-1-thierry.reding@gmail.com> <20210917105412.595539-2-thierry.reding@gmail.com>
In-Reply-To: <20210917105412.595539-2-thierry.reding@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 22 Sep 2021 11:27:26 +0200
Message-ID: <CAMpxmJW5XkwrawJX0ypJ9BVV4_LEO6g3EkptGKG0LCxsmHKriQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: tegra186: Support multiple interrupts per bank
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 17, 2021 at 12:54 PM Thierry Reding
<thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> Tegra194 and later support more than a single interrupt per bank. This
> is primarily useful for virtualization but can also be helpful for more
> fine-grained CPU affinity control. To keep things simple for now, route
> all pins to the first interrupt.
>
> For backwards-compatibility, support old device trees that specify only
> one interrupt per bank by counting the interrupts at probe time.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

Applied, thanks!

Bart
