Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A2AC389A2A
	for <lists+linux-gpio@lfdr.de>; Thu, 20 May 2021 01:55:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230023AbhESX4g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 May 2021 19:56:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230194AbhESX4d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 May 2021 19:56:33 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74E8EC061761
        for <linux-gpio@vger.kernel.org>; Wed, 19 May 2021 16:55:12 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id j10so21641612lfb.12
        for <linux-gpio@vger.kernel.org>; Wed, 19 May 2021 16:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zJt4FvOdaHnERK7zPswPmt+3fi+oS0bIfqgJwwAG+cs=;
        b=J/puEMOqZ8T7DKVZKypmjoPKYZMTdm7d14F3rAgMbCOnsJToM3PxHQae9wcGe0qK+N
         1GbFwe+U3EFT1xj8JIqlx8z8eybFL2ZwItzst7aaCoYtGmxQv2XXNupjR0xn4X6k3mF2
         JSvrhlnnPppLwlydiZfepQUHKVhGW31Q5YRRJkK7zmr7AiLoqTsl4Kf8GR9U22edkAIq
         sAB8UGa/P2IQr/qz6iKBVH4BFfn1cqMKz9p0CQ20QFCV9+8F0FHaMi0jMop5a4HmH2tq
         ZB89rgPrhEmrOkDDNwkqKd/gDO05zbaYh3+XmoVpQgCol+MpN+jfG1aFoKGKRZe3Phum
         GxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zJt4FvOdaHnERK7zPswPmt+3fi+oS0bIfqgJwwAG+cs=;
        b=kbNX1MHEwtjot3LHpuzA7vlZyMy9ab0r+7V1ZMxgz5q1NMI3KOFS90fRUHEA1WfXiK
         RCnaShYL4SVoYUXz2yM3mhIdlYC80bSj+m7woloqTwNeGtIhPX9PGbjNrbqHlSjG4lkD
         J0bwD/P8A0ixauN0q9qBIP5NYRUTXrVOixPZff0u+ePacmoEN4BaEjB3W/OsmvSjqs0U
         EfEjgMy+OEM8JaeMhP5R4TyMZGUYvHhjFJ+ocf29EhPXzaz4s9RMnk/219m4kRHvPXmg
         WYi7Rl71XuxCc0ebLWsyTs2XYa+5M6TrbhikPwimAgHh4TQyatPk5ELSuLtFgnVQmT/t
         z/wg==
X-Gm-Message-State: AOAM531TbTqMHge00I+s5lLs7SAZIyEybnl3gtc8Q70WI/8VMmNazBqT
        rpQblJS/kzk6fHWOSuME3rfMEA60Sh8BMaPkc9L1iQ==
X-Google-Smtp-Source: ABdhPJyfBZRTzjC/9N+poQDvG5+7aOsGGoNjXyeSwTGurMLagNUJVa7/uQRokc6Sj+EI5moCmHs3OO5kaEMwNq7bjU0=
X-Received: by 2002:a19:b0b:: with SMTP id 11mr1383425lfl.291.1621468510806;
 Wed, 19 May 2021 16:55:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210516061425.8757-1-aardelean@deviqon.com>
In-Reply-To: <20210516061425.8757-1-aardelean@deviqon.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 20 May 2021 01:55:00 +0200
Message-ID: <CACRpkdb6Y4j0Pq5B+WaHy6akvczc-1foABFSq=uHpUg9=GL1GQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-stmpe: fully use convert probe to device-managed
To:     Alexandru Ardelean <aardelean@deviqon.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        alexandre.torgue@foss.st.com,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, May 16, 2021 at 8:14 AM Alexandru Ardelean
<aardelean@deviqon.com> wrote:

> The driver doesn't look like it can be built as a kmod, so leaks cannot
> happen via a rmmod mechanism.
> The remove hook was removed via commit 3b52bb960ec6 ("gpio: stmpe: make
> it explicitly non-modular").
>
> The IRQ is registered via devm_request_threaded_irq(), making the driver
> only partially device-managed.
>
> In any case all resources should be made device-managed, mostly as a good
> practice. That way at least the unwinding on error is happening in reverse
> order (as the probe).
>
> This change also removes platform_set_drvdata() since the information is
> never retrieved to be used in the driver.
>
> Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>

Nice!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
