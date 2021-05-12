Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C811237BE34
	for <lists+linux-gpio@lfdr.de>; Wed, 12 May 2021 15:29:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbhELNam (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 May 2021 09:30:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230196AbhELNal (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 May 2021 09:30:41 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB348C06174A
        for <linux-gpio@vger.kernel.org>; Wed, 12 May 2021 06:29:32 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id s20so29473317ejr.9
        for <linux-gpio@vger.kernel.org>; Wed, 12 May 2021 06:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V2Xm0zvt+awRTlmfOBDWYmZKbcrwWg30pJhiDIwcPTA=;
        b=urBYN7ecbgtyQef30Glwk8bNUDY42SI4LloNazJn8gqCtA2H7kJ1C6oQWM6Gb6FGEh
         LPrcNpnRg7o30MxHMXob72hOOWZBQ4sjp18v7g/quUUksFlP/0Tzef31SrQiRzp2SWXp
         Qny2CVZ0EpbrY6z4BFTjElB9EYUueEeNCBXd+btD5wJYlp7vyyo4lY5hwUbfjj7jaBT+
         hZL9SZdSgVjBHho5XdD6r1V34qY4+l4JcKOkiassPaD7DLn3Hl4JSWFgnJ5hbwR5koCj
         L53ukQvIPuSYRGQ3sbMjYxKGKPIspFA+FqM+oD62Kl1ccyPXzotOlBIW4pCM5qAtDH0L
         B1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V2Xm0zvt+awRTlmfOBDWYmZKbcrwWg30pJhiDIwcPTA=;
        b=hkJ3I2UAimTyidy6LWNKRIa9eLjGXSVkIsrIpIEZS9Ar147westFnlw3W4NvlXAzkR
         FEhKUp4uIRWjSZ2d409PbrLQ5eZVDsiyYWlvoZcvgGzUPK7cs12jqOUC+dEWGtqY7lo0
         Ay5clXzSzfq4jIt2v5TYYypiBOtOCW7xjSCmsTdzV4HNp2FeeUESiK3eqmQV6M72H4+R
         LWLHMGG6NwXH9AxcStOaEqFOhkuWDLrbsIobPP6nxQeFLLgXr9g+tGu+99lv3rR0O0Va
         ZSnP+LvWe+uw79lqwL4AQP9mLyULIhHeFBJg4eCfpeGF3kvaMlqqreV9gEOB9WUB5KyT
         iCUQ==
X-Gm-Message-State: AOAM532v+a9dlMgutY8pQS0YHPHHqCktq+UIWaott/JPruIeZ9SBAHlJ
        /qvI/rvZKB4uLwvLmyYXTT4hSx5zkQ97ZBz+b/zfMw==
X-Google-Smtp-Source: ABdhPJzJND28/5zCNEuN6yQt6amOBLo1vpCnc/DKTzTtz3QIsjgaSayxUHgqB1W155wwKouhuYsoCV8wPo3/2Qb8U6s=
X-Received: by 2002:a17:906:82d4:: with SMTP id a20mr37693177ejy.14.1620826171029;
 Wed, 12 May 2021 06:29:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210510063602.505829-1-jay.xu@rock-chips.com> <CAAEAJfALROYg5awL88Uux0yXyMxBthbFjRgJCyhvu4hWioSO2w@mail.gmail.com>
In-Reply-To: <CAAEAJfALROYg5awL88Uux0yXyMxBthbFjRgJCyhvu4hWioSO2w@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 12 May 2021 15:29:20 +0200
Message-ID: <CAMRc=MfqzrjxZBbnmpqjgR6KP6O7zr5xTwTq26oqhwu39kaLHw@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] gpio-rockchip driver
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     Jianqun Xu <jay.xu@rock-chips.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 11, 2021 at 12:16 AM Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
>
> Hi Jianqun,
>
> Thanks a lot for the patch, and for pushing this work forward.
>
> On Mon, 10 May 2021 at 03:36, Jianqun Xu <jay.xu@rock-chips.com> wrote:
> >
> > Separate gpio driver from pinctrl driver, and support v2 controller.
> >
>
> Usually, we expect to see a changelog here, with some information
> about the changes from in v2, v3, etc. Also, note that only the cover
> letter says "v4", and the individual patches are missing that. You can
> use git-format-patch --subject-prefix="PATCH v4", and then all the patches
> will get the same prefix.
>
> However, the last patchset I can find in lore.kernel.org (or my
> mailbox) is a v2:
>
> https://lore.kernel.org/linux-gpio/20210411133030.1663936-1-pgwipeout@gmail.com/
>
> .. which was sent by Peter Geis (so you should have Cced him).
>
> These are just some friendly tips on the submission process,
> for you to keep in mind,  you don't really need to resend the
> series or do anything else.
>
> Also, I added Bartosz the GPIO maintainer in Cc.
>

Thanks. Jianqun: please resend the series so that I get it in my inbox.

Bart
