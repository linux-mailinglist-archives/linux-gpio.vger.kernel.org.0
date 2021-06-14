Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98C1F3A5E1F
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jun 2021 10:11:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232563AbhFNIN2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Jun 2021 04:13:28 -0400
Received: from mail-pf1-f175.google.com ([209.85.210.175]:38490 "EHLO
        mail-pf1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232560AbhFNIN2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Jun 2021 04:13:28 -0400
Received: by mail-pf1-f175.google.com with SMTP id z26so9962903pfj.5
        for <linux-gpio@vger.kernel.org>; Mon, 14 Jun 2021 01:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Pgi/EMTO8YCA+/qiOMgkcaEavCEHCEXPkwAgb1oCC7E=;
        b=cKMSnBmZKXuPmn5SBa/Vflrru71Zqa+u8ZKG5zOCYj03ID+fnDbMHPKrjelyA5L+ii
         a3kHXMqTGuDDQsE5TyGUq0sXQ+v1IeqatQQE2J7K9E58AAtX/m3vsATWZYpcELoQ/k5W
         6tmzai1WZFl3SRGlRjOG/nI+lPQBtlqIAIs6SK1pS2qPvRl8vEkBzu0JVzK4N75p6n9A
         hHbnXMhpcoA0TOQVcrwjy734DwLhzEg8GvYToOTT3x3i0iomt+HSlnPDMdxLuyC8X0dx
         4lCDPoazdmok+A6OJTF+/UWKr3kvylWpyytFQNfzzEXn3cvKBWII92Y7GRRe0Qp0e2XK
         vu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Pgi/EMTO8YCA+/qiOMgkcaEavCEHCEXPkwAgb1oCC7E=;
        b=cYXrB4qeFkm88UXAm77Cb7z4q4uQxrCTs5LlBLc+xNjj4DJR3Ns/1EI5TU/cqfLjVC
         bm27yg5OMB/I4CHSGuws0X622yVeOgV0MxJq8yaRgLzQv2M2oJwFV4w5Zv2mpOgJQe6e
         /ncG/2HTJEZ/swrhBXoS1f3OHPq9AlAClqu7NqJ//tM+2f9x1it18ca8nSrYs2zlVMlt
         zPTpP86PJ7dMl1ckw6SYQLjsS3zZcwG2YiobkEwiiOPjZuCpRoBeP/pT3iIeQSE1zHxs
         FwZMIiUdWUwNZfCuOQHkjJ60WZfktamdSF6ER3pbBa9nY9v5r5Z6HHXMKfXsQy3mX5eL
         nUTQ==
X-Gm-Message-State: AOAM531zgQdpWgfGLI9EKHSysPUaPO5eDJ/YEGzD3qr3PsRODCJpEPbd
        E/fEbAAceSO47frJq8SNnrq25Hl6N67gu+5CSPU=
X-Google-Smtp-Source: ABdhPJzSMN91uYSRKlP06T+Mgqd0D/iNR5+ni7v0xYKiek61ZLxNLemtRiYtLIl+3WU0SFopdZIa38f0biYX6lfxLLo=
X-Received: by 2002:a62:e404:0:b029:2ee:f086:726f with SMTP id
 r4-20020a62e4040000b02902eef086726fmr20453698pfh.7.1623658225619; Mon, 14 Jun
 2021 01:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210613220326.831040-1-pbrobinson@gmail.com>
In-Reply-To: <20210613220326.831040-1-pbrobinson@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 14 Jun 2021 11:10:09 +0300
Message-ID: <CAHp75Vc91=PSj+4F652Wo4iEHsek_NuLGuQmyovWtQ1UMO2xeA@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: Add support for the On Semi pca9655
To:     Peter Robinson <pbrobinson@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 14, 2021 at 1:05 AM Peter Robinson <pbrobinson@gmail.com> wrote:
>
> The On Semi pca9655 is a 16 bit variant of the On Semi pca9654 GPIO
> expander, with 16 GPIOs and interrupt functionality.

I don't remember the context...

>         { .compatible = "onnn,cat9554", .data = OF_953X( 8, PCA_INT), },
>         { .compatible = "onnn,pca9654", .data = OF_953X( 8, PCA_INT), },
> +       { .compatible = "onnn,pca9655", .data = OF_953X( 16, PCA_INT), },

...but the first space (before 16) seems not necessary and the idea as
far as I can see from here is to have those columns to be indented
nicely.

>         { .compatible = "exar,xra1202", .data = OF_953X( 8, 0), },
>         { }

-- 
With Best Regards,
Andy Shevchenko
