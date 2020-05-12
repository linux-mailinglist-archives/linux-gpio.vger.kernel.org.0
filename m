Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9DAC1CF418
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2020 14:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729243AbgELMRD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 May 2020 08:17:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726891AbgELMRC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 May 2020 08:17:02 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39997C061A0C
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2020 05:17:02 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id 8so7652031lfp.4
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2020 05:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AHRgMLmA3AvBWPfR6NKWwxmRE4rkD36q1pi3BiamBuk=;
        b=zawdNdom/gNdPx47D4yLAoF6P7G0lSQgL3HWoaTE5pIWlvLTLXvSgmJEAGLFAG5VGb
         /G7eaYc6og9aU4x4M7FTxm81UsoCa/45aiA5gY4tGQ2nVbaTMFmxcXsBl/dejya1fspB
         vuywN7waQfGB/WfPQNp9AS0c8Tc7UP5ZRUi0fdRxxFlktSSVW9rccOOp2fxxlHUfQf5D
         nEBX/9KNhiLH7lvfPT1ZjdrrfBc5k88EY57RUm+E8RKZ36irVE8C+CnyzGAJd56EWpX/
         jE8zVu3h1jj2JT28gOJMBYBIh8b5mcGCW6IcPVx93BDudEuaAtSIbnMBWyTet65NItej
         Gh0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AHRgMLmA3AvBWPfR6NKWwxmRE4rkD36q1pi3BiamBuk=;
        b=VKUvBuOxClj2AQUEDy7e3rdZ8SFCC2lxPQ5bTwc2ttgEVFt0DIqk3Tv6Lsy+dMEZxb
         Sj1yUCOm1KMYlaTF9fF0wvR97GcWYlRUuwzPwldUqyv/f+N3+f+nKmLvAYh0qdELdP4F
         Pj5p3im2rSFOv8pgVHstk0gpI2pY+P9XQMEwfawCSH3/Tj33X/6xwwgiRQsQIclfsyXQ
         Qozw0qgtYHv6KVp0Np3wyVta37N5rKpladTThdduBgQaBBIvZH4eJULvlZSm0glchO0T
         vYU9UNsDFkddID7CTPBF8pPHxBcGDo50zJEdniVnMDU503TVxdwyP8GVPuPwGCgQwXaz
         /DYw==
X-Gm-Message-State: AOAM531Ok1gk1EKq8zsyK4U9nup3MK4Jz+dyuOoMk9MjjHgvkpPGKaNz
        +15YAWj7s335nhP0GkskYHPDQ7nHbi97sEgPzbT9iA==
X-Google-Smtp-Source: ABdhPJznRAGEou4bDAZ+Qk/iOY8Hj6nqKR5DclT1eBmeTxgT/t1dvz+w7MKesU2FRotY9nN6kN31SK96tUzVsopvN4M=
X-Received: by 2002:ac2:5588:: with SMTP id v8mr14010972lfg.217.1589285820682;
 Tue, 12 May 2020 05:17:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200430143019.1704-1-brgl@bgdev.pl> <20200430143019.1704-3-brgl@bgdev.pl>
In-Reply-To: <20200430143019.1704-3-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 12 May 2020 14:16:49 +0200
Message-ID: <CACRpkdbzyMY2uOZ4woKyv0otYyO9fK7zSsBaYHtCB6Z+Xtm7Mg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] irq/irq_sim: simplify the API
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-iio <linux-iio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 30, 2020 at 4:30 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> The interrupt simulator API exposes a lot of custom data structures and
> functions and doesn't reuse the interfaces already exposed by the irq
> subsystem. This patch tries to address it.
>
> We hide all the simulator-related data structures from users and instead
> rely on the well-known irq domain. When creating the interrupt simulator
> the user receives a pointer to a newly created irq_domain and can use it
> to create mappings for simulated interrupts.
>
> It is also possible to pass a handle to fwnode when creating the simulator
> domain and retrieve it using irq_find_matching_fwnode().
>
> The irq_sim_fire() function now only takes the virtual interrupt number
> as argument - there's no need anymore to pass it any data structure linked
> to the simulator.
>
> We modify the two modules that use the simulator at the same time as
> adding these changes in order to reduce the intermediate bloat that would
> result when trying to migrate the drivers in separate patches.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> #for IIO

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
