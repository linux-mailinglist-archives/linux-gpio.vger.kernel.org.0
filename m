Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7D1750C32C
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Apr 2022 01:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233170AbiDVWyb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Apr 2022 18:54:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234154AbiDVWwp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Apr 2022 18:52:45 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C8EB239555
        for <linux-gpio@vger.kernel.org>; Fri, 22 Apr 2022 15:15:28 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-2f7b90e8b37so21698267b3.6
        for <linux-gpio@vger.kernel.org>; Fri, 22 Apr 2022 15:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IEPmT3Gc9bc0kGpLDKNES5cFyu9wmRr1DONuGP7aDR0=;
        b=h55822QjC3AXppBz6+TPMH1WBShBvQoSl7j+Ah3WF7IH9+as3Q8+Y+oOlXw4ByoWoK
         sHTqCrEsDRmby5GV4cSZhjofTTZtEZOnDHtRKRxh8hpf/ctupQSKr+7kAv69oMCrdFHh
         8WveGXyKifkMGu9ztHfoVyOOhaZQtMPcVGIqgoUIcLYLsTGAXzwOkg2pHtRGZyqj8P9Y
         ahF/0VLwX4xIgfUKIlCj+mhF9tlQ7KUfxRQmboz89tS/Q3d+lP12iYg1bM7bndBAQKI1
         +45i6sQ0OaJlrPI1pEZsgwQYpHUc8+06+f5xxQw95OVCOsY5KO5ZyOPtfd3pOHt2SWiw
         GZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IEPmT3Gc9bc0kGpLDKNES5cFyu9wmRr1DONuGP7aDR0=;
        b=PjgvKaDBwSCVKJTqsvW6im3SDqlDSOCvGxNmbj6yeG0nD9GjH3TtZuX7iRNRBUXHvK
         c/U+KeZK/uusvmpmSczcNOR4O4sZ3n2ws3+nAG4wsDcyFbUYrUpbqY61KIFlp8/Fe5YT
         5xIa51D30F2+FDDmr7yMwQPVVxJDR7LTfHE8BleQizpP3qvdSHx2TkVh4wUtOpgqX21e
         2UCOEj3JwVdG1vGkfSJHNLz/pLikpOUBjPqjr7zWEighKmA9caC7AZIuNYo324qBvXaR
         XoVJJof6ilBRQIqGm7X99MRqmHa/TQgsHljkdCzV30FhSXzNDicXz49Kx6RcEp8rTTYu
         zIaQ==
X-Gm-Message-State: AOAM532V9RiyQfzpiH0tWSQYDISO2sebtQcASJYL3E/XgM6wzOhzyyei
        b1jpRcAwE0UETO/yuqnnxdgh+LQqHfCHnOKnej5Qjw==
X-Google-Smtp-Source: ABdhPJxN7EB8el/52hKdd0E0KMl71hy177PrIfN+MxrWdFqg7VvCGGjbq/I1Lz6aF6VguU+NaI5B7f3pJL4j9uTOFuw=
X-Received: by 2002:a81:1d48:0:b0:2f1:8ebf:25f3 with SMTP id
 d69-20020a811d48000000b002f18ebf25f3mr6946723ywd.118.1650665728190; Fri, 22
 Apr 2022 15:15:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220422161933.163347-1-marex@denx.de>
In-Reply-To: <20220422161933.163347-1-marex@denx.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 23 Apr 2022 00:15:17 +0200
Message-ID: <CACRpkdZNvNqx4DR_Dcwv4AU1x=MhLLUpSTewzUnsQwh8ibqzqQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: stm32: Keep pinctrl block clock enabled when
 LEVEL IRQ requested
To:     Marek Vasut <marex@denx.de>
Cc:     linux-gpio@vger.kernel.org,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Marc Zyngier <maz@kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 22, 2022 at 6:19 PM Marek Vasut <marex@denx.de> wrote:

> V2: - Use pinctrl: stm32: tags
>     - Add RB from Fabien

Hm I applied v1 with those changes so it should be fine I think.

Yours,
Linus Walleij
