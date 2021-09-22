Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E1EF415455
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Sep 2021 01:59:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238505AbhIWAAj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 20:00:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230414AbhIWAAi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Sep 2021 20:00:38 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAE81C061574
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 16:59:07 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id m3so19099815lfu.2
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 16:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NhCsWJP1rDtHt7FwE+mxgJvAlg8hfVs5kHECjEjQSxs=;
        b=vI4AkLTcagamUh3LwLFi8MptKtRIJgZ9fCR3vglPKUbHbCS5cxlyKkCar7UkrR+N3E
         vhozk72mdnXMtJbpwlTSmSwGZnt2wJX1IyRYQZpPoN/bAxGP1ORfidfzZxFiK0CzJ3hY
         NYNFXCsA6WuJsdXJ2Eh0yyIJT9R04YbiQCc5bUHOHZQznoYLXGYadOjysFktGOtXy3Yt
         QqOEyHJq6uRaYgWpwAre9kzR54ixRqIuDQ7RF/rSjh1V5LpOVOb5CDcP8IPYPimdS+8n
         /0gr5jU/DybOzNBpOPu0dt5AIN0eP4W38fLmI5Uk2srYtiiAO7Mo6RIlZy7zXG6qduge
         jhPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NhCsWJP1rDtHt7FwE+mxgJvAlg8hfVs5kHECjEjQSxs=;
        b=YwUsifZeTZyruyCGwoeR/aNbDTmFtQ0SKbywaS6+co8gToCenDHD++TgFD7BZFSxNa
         GOdNTvLXY4GLrEmxlDAnpDdQX1+RM/CADZD6i839aWmkOWdx5L9GcmbksnFsYi9PqKw9
         bUrYwU8ckn8aypRMXjXLOQ8qer8dP4W1JREgSyNeEIHNuyoMP4p/3X7Qv3Z7Rtc5hpA1
         TIrlq+itm6X5Nsl7deCYRPNbboJZkSsozWpxTkF1yCO4ZcNIBeMIYacVp82gqc7NSLkh
         6M5HD9UOAW5AJ0Bh2PhtVg0FEs5TsAaiOSDfiR0bhcn9z1sJIYqLo2mDV7fl1Lja9Lrp
         kXrQ==
X-Gm-Message-State: AOAM530U+KXofWAQx2LJbm+L6aTf23HeFuDu8wIK35lqQ2ptcWEL/ktP
        hDlUE7vgRAZMoxv65YudSth1DI/adwnIzqIWxRPIG0Qiucg=
X-Google-Smtp-Source: ABdhPJz5iE5pbqsEOqRJgBjlc+AOLFnPSjCWwpjjyIdZMfBsmy7s0s8/OhmzQzEz7QCIy13CO0M1gGX759XvR4JW7Dc=
X-Received: by 2002:a05:651c:1124:: with SMTP id e4mr2045224ljo.261.1632355146205;
 Wed, 22 Sep 2021 16:59:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210921222956.40719-1-joey.gouly@arm.com> <20210921222956.40719-2-joey.gouly@arm.com>
 <87bl4kvjs7.wl-maz@kernel.org>
In-Reply-To: <87bl4kvjs7.wl-maz@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Sep 2021 01:58:55 +0200
Message-ID: <CACRpkdbtzDE6Sdf5NwNHxWn3PMWUk7OW+yGbSsWhh7i2Cxyp1Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: add pinctrl/GPIO driver for Apple SoCs
To:     Marc Zyngier <maz@kernel.org>
Cc:     Joey Gouly <joey.gouly@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hector Martin <marcan@marcan.st>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sven Peter <sven@svenpeter.dev>, nd <nd@arm.com>,
        Stan Skowronek <stan@corellium.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 22, 2021 at 3:09 PM Marc Zyngier <maz@kernel.org> wrote:
> Joey Gouly <joey.gouly@arm.com> wrote:

> > +             pctl->irq_chip.name = dev_name(pctl->dev);
>
> No, please. We don't need a massively long name that will make
> /proc/interrupts more messy than it needs to be (and creates ABI
> issues when someone repaints the DT). Just say "GPIO".

There may be some GPIO expanders in some systems as well
so I'd use "APPLE-GPIO" or similar so we know it is the one
on the SoC.

Yours,
Linus Walleij
