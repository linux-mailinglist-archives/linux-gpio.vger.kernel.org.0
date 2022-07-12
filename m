Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5194B57173A
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Jul 2022 12:24:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232380AbiGLKYR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Jul 2022 06:24:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232805AbiGLKYK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Jul 2022 06:24:10 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60B67ADD67
        for <linux-gpio@vger.kernel.org>; Tue, 12 Jul 2022 03:24:09 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id m16so9474706edb.11
        for <linux-gpio@vger.kernel.org>; Tue, 12 Jul 2022 03:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AmO51byIMiOVb4cRzs66BBjupIjrQQmBiHJH/wAWMQk=;
        b=XHFr5hfGXn/Nw+Hxav30NPiwSpMaSjFeRW9xeebgnEQ65ddoHX9DWUhNvWEALbShXa
         ULAkHZt5gG1cIDI+nYcgk78l0H3rbtOxmAIOfSy8FFK9hsBA9JicQQ/rqsDbFV0jkrFa
         jUOUgSiUKw0IFQspJSHe/iDrMde884XlxPwnhA8J5oX6NSdsfzDjzx1fEolBzTB7xjyR
         MKFaZgFYwDUA46seOv6Jf/tEoB8hOabMXW5lZWz3HrI8Shku/GmsDuBPB8sX0pvERUD6
         TtGDjmW1gqjhLGYu4DPZreadxaEh4Kodll7jAT8xAMy3HB57R3P9fIMBAHVRKZGZXpfH
         htwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AmO51byIMiOVb4cRzs66BBjupIjrQQmBiHJH/wAWMQk=;
        b=BPNLHB0NID6QeeMIa2W5oX2pYGq+dZsJbE32Jd+rFMWN06XFtnoTDyvujvLq1/vkgd
         qqXZuHHJ7ZoJjOwTyLBRkWOHTEvQoJ0f0d9L9JqEM1HvyhCcGjld7TDIeL6jHIHxXRI1
         N7W5tC7bb/Nl+WYPdwiafjDLisQDFGmHmn3zcx7nHWLoVesYhBBmY/AFeEUIAay/1tC5
         Xkr86bUbn+t5PaywgYUU6dK2SOFqFUnlIeSXeArPqtA7FRWDvozo579ErqAsy9g8LDrb
         VbEPP2MdFyPHuDTYoQVxHiG/gDadzETiKXo3F6CRh+1ivIXzXwKPEPwXhxv5mJMwRuZM
         jd7g==
X-Gm-Message-State: AJIora9Q3+6KVcvKUa2tcdskJvUsFh1wAF8Qz98+oOQZCit+00370kSx
        Mthbe2z4pXxnJzfRqvZ/UZjkzc9d6/yr7SWq3LglVg==
X-Google-Smtp-Source: AGRyM1srkG0qvmIar6mDAAoHm0Gh7RSLqulhEcDlDx31EiT1+eqj12pqGn4VbkGhRUeqL0umg3iSuQc62JdtTBJGhTc=
X-Received: by 2002:a05:6402:150:b0:437:b93c:3a9 with SMTP id
 s16-20020a056402015000b00437b93c03a9mr29626324edu.82.1657621447950; Tue, 12
 Jul 2022 03:24:07 -0700 (PDT)
MIME-Version: 1.0
References: <9996cb86818d2e935494d6b414d549432f91797a.1657528504.git.geert+renesas@glider.be>
In-Reply-To: <9996cb86818d2e935494d6b414d549432f91797a.1657528504.git.geert+renesas@glider.be>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 12 Jul 2022 12:23:57 +0200
Message-ID: <CAMRc=MdDp+Pwqifp0xCkFic+DO65RL=qOw3Prrze9WoyKkV8fQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: GPIO_SAMA5D2_PIOBU should depend on ARCH_AT91
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Ludovic Desroches <ludovic.desroches@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 11, 2022 at 12:27 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> The SAMA5D2 PIOBU is only present on some AT91/Microchip SoCs.  Hence
> add a dependency on ARCH_AT91, to prevent asking the user about this
> driver when configuring a kernel without AT91/Microchip SoC support.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/gpio/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 63a89ff7865e374f..1852656d5eb248f6 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -553,6 +553,7 @@ config GPIO_SAMA5D2_PIOBU
>         tristate "SAMA5D2 PIOBU GPIO support"
>         depends on MFD_SYSCON
>         depends on OF_GPIO
> +       depends on ARCH_AT91 || COMPILE_TEST
>         select GPIO_SYSCON
>         help
>           Say yes here to use the PIOBU pins as GPIOs.
> --
> 2.25.1
>

Applied, thanks!

Bart
