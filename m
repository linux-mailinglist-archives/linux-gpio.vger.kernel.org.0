Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A3A148FC7D
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Jan 2022 13:07:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235006AbiAPMHJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Jan 2022 07:07:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231932AbiAPMHJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Jan 2022 07:07:09 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89C43C061574
        for <linux-gpio@vger.kernel.org>; Sun, 16 Jan 2022 04:07:08 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id x31-20020a056830245f00b00599111c8b20so2713711otr.7
        for <linux-gpio@vger.kernel.org>; Sun, 16 Jan 2022 04:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7o2yHBJnbdgBA14paBxnQ07Miq57N45X/orHzH3UYOU=;
        b=LO+72frJu+DNTvMhQZVhuGanlYhZPe4ZG9J8lwuaPGnb79xbpLy/Fvdo2kesOn2Rin
         81WFCPtwZYnCHbTZ10vA+fp0fAnIOnKvjqHTM1RIwCnAYgPrWt115M8kwke52A+BXuYV
         uMTdvQEQN6pZwYYZm868xk/PtYzlm1Xx2Rp0wmtwoqhDIkt55Ajp9GMn0zNQzzHYfGlc
         uw9mWbRYRj3rk1by15iR97Mf+OIdaDL8uj0P+igWbFmgei7VgSzWLKFmL9gGtEwkcKRa
         jZftuMKhTo8GqhPWPr8C/t/bUIXmOH8plS1PFfhuJERBOgEnUzpX8dAWVweJUg5iILN+
         gVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7o2yHBJnbdgBA14paBxnQ07Miq57N45X/orHzH3UYOU=;
        b=rLfIeezfanPl64vy4nwJ8KkD4Sl5wdzU6w4Li85TWO/1FWsfXoABneFsSR1DENZ/YQ
         jl9tmiPo1TSOqmUrVgKB2HcwdZSnaIG4HoCIrpEIDb4gVUTDbX/E3FfL6tl5H6itkCY4
         ZDSwSnUql4fVVkqf7+VwT26IAt703MdebCjyHgKBxBPIIcTIuTWJ4ymeJuFlHUzV226/
         FRIDzfveEhvTJuBT4OxAiuQ96aFMtzn6MKCZh9cSADdRe03toMMO9DaqMGqiUaGb0aG8
         oIxFaU7zlOzE3zbv6pi3dnjyPupZN1veVYO8yzlWjwuUwuJIoGRpZ963+h0BXyisdX7d
         QtFQ==
X-Gm-Message-State: AOAM530qJNzOOpv/y6lkyNt8MXyEkZw02tOWOTDT+tIbU/jiZ1L4K5VL
        4Y0ZHQ6qAnBsJFu4F/3jhLm5NEFZD7Q26avJWci61w==
X-Google-Smtp-Source: ABdhPJzC7R5kASQ5N7DSNlI11orcz/x4ZKwts91l8N+wYwPvWdzadkjEJzbCp6IPTu6rcJ59GjTIw6RyJwvdn/ooapY=
X-Received: by 2002:a9d:465:: with SMTP id 92mr12890735otc.35.1642334827966;
 Sun, 16 Jan 2022 04:07:07 -0800 (PST)
MIME-Version: 1.0
References: <20220114064821.20200-1-linmq006@gmail.com>
In-Reply-To: <20220114064821.20200-1-linmq006@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 16 Jan 2022 13:06:56 +0100
Message-ID: <CACRpkdaKYwse8NhKVgKi5y7xykEtB+UrL-cGo70mV9Q23K372A@mail.gmail.com>
Subject: Re: [PATCH] gpio: mpc8xxx: Fix IRQ check in mpc8xxx_probe
To:     Miaoqian Lin <linmq006@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, Ran Wang <ran.wang_1@nxp.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 14, 2022 at 7:48 AM Miaoqian Lin <linmq006@gmail.com> wrote:

> platform_get_irq() returns negative error number instead 0 on failure.
> And the doc of platform_get_irq() provides a usage example:
>
>     int irq = platform_get_irq(pdev, 0);
>     if (irq < 0)
>         return irq;
>
> Fix the check of return value to catch errors correctly.
>
> Fixes: 76c47d1449fc ("gpio: mpc8xxx: Add ACPI support")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
