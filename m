Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A4112E32ED
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Dec 2020 22:25:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbgL0VXg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Dec 2020 16:23:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbgL0VXf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Dec 2020 16:23:35 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EAC9C061794
        for <linux-gpio@vger.kernel.org>; Sun, 27 Dec 2020 13:22:55 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id o13so20089003lfr.3
        for <linux-gpio@vger.kernel.org>; Sun, 27 Dec 2020 13:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QWNvqT718TtFHxxL1hVou0I3CjOu5jdAB/yTtW9J2ac=;
        b=Qj1Y7TvpDFDZOd7YVj9PzhP38t+aoI+cYPF0ZIcFaRId6RMD8qDrMj4k5lp1vjTCFd
         VRxTyfnsiolX+d6zJekiX6uEgXrHMzZFULyePSvS/a+PO6RDIixGXjtyD6wFDccRXnmJ
         3beoeQTsQT//OecH1tCf9I+AZwnaWhGFODhEH8qrkiHXzpcYxUO0jIQfNLDf8ayhPXes
         WYxjiku0ut/LlFMhjaFLPT8cGXP4jLnXEIlHOiRWMNpaSGA1FVygjdJXMuJQV/jVIxCo
         slxjaFCpWJkafsLrUVZjvBR4AjigxgK8/+nwm3So3zsiGY0nmKJ4pKJlW/N1em39VR2F
         a5hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QWNvqT718TtFHxxL1hVou0I3CjOu5jdAB/yTtW9J2ac=;
        b=CCZry25iu7+u8iAu4Cs09Hu1BSSmfK0SruOu+Ne6n85l52i+nXZfrizxvw6m83WGve
         PmtpfbVBSpKsv38uXjmxPpwSxST9Hpyhh9AzWyl8NNd76GJch+9Fk80X4Kz9guYu40r1
         bTlymABnnEQDmG5eAjjq4b4yn2TXHl9pINmBE3Erm8qqo74LRVhQW7R5buOorxMpu9iU
         S3kVD0HRu5fxGU339KMUoAb3bcHnL1Yt9FwcKBgmOYMWq07BsYGtnrfeqnkDmsNxQbHm
         24XMXg9PYvFqOaO+S9gAuqfUCVwH6zhde11d7KJqi00d4rmEeC2XaMSKv3qcrf4yicHC
         YgMg==
X-Gm-Message-State: AOAM532FiuG5M/S8z3oJPSeeZucikLGBF5qXkNoisfiOZ0mcOO77+9vx
        qRWftffezGCxOASaB9jRaScbYerLUsf5yTHuxr9uUw==
X-Google-Smtp-Source: ABdhPJw7AJsmxtGqtNjd1OluKJUYV+CiQlo3p+CbhgWibggLiv2sZvQOt2AiqsV3sbfqS/R4yPu+yV4pxMlSXJKtj+I=
X-Received: by 2002:a05:6512:3238:: with SMTP id f24mr17645305lfe.29.1609104174071;
 Sun, 27 Dec 2020 13:22:54 -0800 (PST)
MIME-Version: 1.0
References: <20201224112203.7174-1-nikita.shubin@maquefel.me> <20201224112203.7174-4-nikita.shubin@maquefel.me>
In-Reply-To: <20201224112203.7174-4-nikita.shubin@maquefel.me>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 27 Dec 2020 22:22:43 +0100
Message-ID: <CACRpkdaB2OXrVo+8cEMY_vLODnQXsuv72bu12qBusxFj++H9HA@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] gpio: ep93xx: specify gpio_irq_chip->first
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 24, 2020 at 12:22 PM Nikita Shubin
<nikita.shubin@maquefel.me> wrote:

> Port F irq's should be statically mapped to EP93XX_GPIO_F_IRQ_BASE.
>
> So we need to specify girq->first otherwise:
>
> "If device tree is used, then first_irq will be 0 and
> irqs get mapped dynamically on the fly"
>
> And that's not the thing we want.
>
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

We can only fix this properly once we convert the platform
to device tree. (Along with making the irqchip hierarchical.)

Yours,
Linus Walleij
