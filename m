Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89728453C63
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Nov 2021 23:52:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232064AbhKPWz3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Nov 2021 17:55:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232032AbhKPWz3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Nov 2021 17:55:29 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C8F3C061764
        for <linux-gpio@vger.kernel.org>; Tue, 16 Nov 2021 14:52:32 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id g91-20020a9d12e4000000b0055ae68cfc3dso1076844otg.9
        for <linux-gpio@vger.kernel.org>; Tue, 16 Nov 2021 14:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OecF1BbqsxHuxs1+6x6lNqlLgG9K3kJNOTTucdcNkPg=;
        b=MtXwM7O5OKvUbeiN2lwW8Ov64fKBAExk180fpvGV+pavI2cbx3Hxt5pyO3yMECmq5X
         LW/pNuqPYP5wpO60MORNu5O4acyH7Uf8iLj+Gqz8p0WqvN82hBLeIrMNzjLZQ1XuFhpu
         ry8yZ3qKdkbGjHzxkb916C2D8n7FT4A05jm8Z8C5kn2WNhwH7fDRxeVoUpY4mXN+c5fc
         7I55116jWuy2qjYjiinKs7LxnfMV0CT3mBwN6/GT7hBwmIcg3YtGgoHhwi7a4eYrV4oR
         B4my2Ux1HnJiaAfIiLKaYM9dOf7bHVsvKUQRzg11mbIRV2mD5BN6jVpYPdYmOjsiQqR2
         huLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OecF1BbqsxHuxs1+6x6lNqlLgG9K3kJNOTTucdcNkPg=;
        b=ozkxl/83fdLZW+wWt9UTot5Q/biyPWt7eVE0LkzzhCEg97ZRRQ8Ifj+e5RPvmJ5jGm
         SbVZvxFCLI4KXkqM8A+7YeMeFGiW7KOx9gZosbCYpifahqeLXHkta5bXf14lI/glPMH/
         amMA2dvY/BXZpMw/Uz4+xr11sd1Dbl87R1fZXckPVKQXaEgx3KrUog+knKofGo2gzDJ8
         qUqpOZ3febxluue0Z8rGFh+28E2F25iZIxBPXo2FbCzcLYlkme+VeLuM0Rfr1Ghn2iKa
         Rnmfx43PrqgHGBUyY6fIb1eSqge7V767lhwu1J3yDuZOyVksF+ezJsOdh2I6rvetmYnU
         r48A==
X-Gm-Message-State: AOAM530eIJG9tLHKIdYGzQ+GqpfGkN+NY7qr4vQgFmEwfVr+t8QzAaUZ
        baNi3+HlATSxtktisSl5+CJLikyfMyJIsVBs+gyfWA==
X-Google-Smtp-Source: ABdhPJy3xSZkgt5J1IN15s2fGgvywYH5rJ/4MbT3jfNX+qjb6TCizzD79OANTnNUA9T03S0RnwU1spPqTJ/pHKES0UI=
X-Received: by 2002:a9d:74d0:: with SMTP id a16mr9065421otl.237.1637103151373;
 Tue, 16 Nov 2021 14:52:31 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637066805.git.matti.vaittinen@fi.rohmeurope.com>
 <CAHp75Ve_qS0Qc8XLHLwFnWEPzQtgNfEeVr8q9L4gK2m5a-By0A@mail.gmail.com> <50c260a1-c6d0-1a0b-45da-ab1a2d1379c3@gmail.com>
In-Reply-To: <50c260a1-c6d0-1a0b-45da-ab1a2d1379c3@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 16 Nov 2021 23:52:19 +0100
Message-ID: <CACRpkda_=LSyqKq=+mocqie667b5pTfM_SAWozxnWpgjMvHg5g@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/4] Drop ROHM BD70528 support
To:     Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 16, 2021 at 7:41 PM Matti Vaittinen
<mazziesaccount@gmail.com> wrote:

> I see acks from Andu, Bartosz, Lee and Rob. It'd be nice to see ack from
> Linus W too - but other than that - I guess this is good to go.

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
