Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E395177097
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Mar 2020 08:57:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727619AbgCCH5z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Mar 2020 02:57:55 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:39618 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727594AbgCCH5z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Mar 2020 02:57:55 -0500
Received: by mail-io1-f68.google.com with SMTP id h3so2531290ioj.6
        for <linux-gpio@vger.kernel.org>; Mon, 02 Mar 2020 23:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1jgWIQ5qhHPD/OB0fU45dANprOVpISqKroX9vsY1CRU=;
        b=EjwZW+SH7EytjtajDXzNRus07lEWu2Mmz+276Cm00/dkoK8mPqSqpz72bN7oJ/1rTt
         igTkBSmgVGzsvMiKS5hAXTh7tCKfzEfJKcsdxRbx0CSbpwNks+QNzyli2PY0pQzKC18J
         Kokec4Qq9CPSuu5Jq7a2YEo5spm5ifQEEnB40YjVO2h3TfQWuYQ/CCB5jPsqcChgFH9Q
         3C5DYQVvkLjw4dIDyHbO5NKA0Gmqj01H86u0wBgTenloo6ZKCpXzywIozg072/+ZZtDJ
         LiDSgFnfktSASPcs0ZoDbQeaNphYswaOmN4wO0ZSIlTt4yxL8ooRx2MVN+n1mqCXtO7S
         itcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1jgWIQ5qhHPD/OB0fU45dANprOVpISqKroX9vsY1CRU=;
        b=SwHE7XJWw8iUBq4+70gD+nnuC4TK2S0kasxKk6g0yj/kBPtxhCVbhF9WJ8wpcEQ+aw
         mWN2zRtMvzC/t/WSFq2MWiOMjuzkM2GeFxqrope6+0+yhvtN8MXVTuhsmMj2a/SurszE
         hz8vf4boUAkoa9dRkTWMVTwqGxNagr8cXAYsIn3WgX9RQq3HQpmC0H35uzOFe5KBCcNY
         aUpJH+f7r7OMpxB5XAA9KUeMGkzS+XMvVmFvIlPpDY8tfQTYjizKWZwaQADUEQtSlYxV
         fwnbfCwL/jqMthgONhP27Twh8x7RbVZOnUzQrvMs7NRVwlZC1XgeeE699yknhAUUAB8K
         cyaw==
X-Gm-Message-State: ANhLgQ0esNaMSqZ+RrsBGr9bQCHt4XmHI0pNAUcR7nEzaS3h8o1I84GL
        KNYWyPpoGJfQFru1OVHtDawP2fIYJp4+0etcuZGnxw==
X-Google-Smtp-Source: ADFU+vvoKoITM9L9lN5OjwuNnB6xxSEKbotb40pNpHliF7dxzlREj4wVsiU8LUIO4QoB9MpXOOqCqy0BqktL/JUyTeg=
X-Received: by 2002:a5d:8952:: with SMTP id b18mr3019929iot.40.1583222274495;
 Mon, 02 Mar 2020 23:57:54 -0800 (PST)
MIME-Version: 1.0
References: <20200211131240.15853-1-brgl@bgdev.pl>
In-Reply-To: <20200211131240.15853-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 3 Mar 2020 08:57:43 +0100
Message-ID: <CAMRc=Mc=gTrpQsMdOTBJaYT6JLg=o17Mm78ijAGUJYE2pXcCQQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] irq/irq_sim: try to improve the API
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-iio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 11 lut 2020 o 14:12 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=82(a=
):
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> This is my second take at improving the interrupt simulator interface.
> I marked it as v2 but it actually takes a completely different approach.
>
> The interrupt simulator API exposes a lot of custom data structures and
> functions and doesn't reuse the interfaces already exposed by the irq
> subsystem. This series tries to address it.
>
> First, we make irq_domain_reset_irq_data() available to non-V2 domain API
> users - that'll be used in the subsequent patch. Next we overhaul the
> public interfaces - we hide all specific data structures and instead
> rely on the irq_domain struct and virtual interrupt numberspace.
>
> Next four patches simplify the interface even more, but since the change
> may be a bit more controversial due to modification of the irq_domain
> I decided to split them out of the second patch.
>
> In patch 3/6 we're adding a new callback to irq_domain_ops that is called
> right before all the other code in irq_domain_remove(). Next we use it to
> remove the simulator-specific cleanup function from irq_sim.h - users now
> can simply use the regular irq_domain_remove().
>
> Last two patches show that the new callback isn't limited to the interrup=
t
> simulator and can be used to shrink code in real driver too. We introduce
> a new helper for a common use case of disposing of all mappings before
> removing the irq_domain and use it in the keystone irqchip driver.
>
> The end effect is that we limit the interrupt simulator API to two
> functions (plus one device managed variant) and zero new structures.
>
> v1: https://lkml.org/lkml/2019/8/12/558
>
> v1 -> v2:
> - instead of just making the new data structures opaque for users, remove
>   them entirely in favor of irq_domain
> - call irq_set_handler() & irq_domain_reset_irq_data() when unmapping
>   the simulated interrupt
> - fix a memory leak in error path
> - make it possible to use irq_find_matching_fwnode() with the simulator
>   domain
> - correctly use irq_create_mapping() and irq_find_mapping(): only use the
>   former at init-time and the latter at interrupt-time
>

Hi,

it's been three weeks, so gentle ping on that.

Or should I resend the entire series with a more elaborate commit
message for patch 1/6?

Bartosz
