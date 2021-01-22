Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8FEC301059
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 23:56:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728105AbhAVWyi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 17:54:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729204AbhAVWsh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 17:48:37 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 932F8C061794
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 14:47:56 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id l12so5816485ljc.3
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 14:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dIWgpxTzAU7neyLO5D8TajLhANUxOv5nY7y9DCeaEWs=;
        b=h//3sL6KUkJSBcB5nEzL5E4dPLIsbya6teNaf37vh/c4AtQZPFnYyvkI0mJ1Ltd3mi
         Szs7f8j7jaygtecvGggDrQQY/AOFN630S/RUKaIRjiBw6btTBRjSPCLDpvWJKpshVeF/
         4W/vu64bNdRRuXYIWPWgJ8F/5zdgBCLvgvkFjp3N3gObDHQlGqJyKoDgk5RPJh8Cf5G2
         5QCTieOHwA8k4uOi8FFXX5DDfmwYkfLZNcyYRAXWq6AUb0zGNcuMkhZ28aAiQRxscJFr
         M7xlU0E3DlY5/IMUsxPd6QfL2+DTMMARrgXq2IxayqP81vVA254gpo17eY9C/Tu9hs2K
         +soA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dIWgpxTzAU7neyLO5D8TajLhANUxOv5nY7y9DCeaEWs=;
        b=OOoYPKT0HeBTp2+eW+66NdHUDVnGiNKqF7zvOi+NU77j9PQdTYtEI/oXA1q6SkyZ+j
         zPx+i9xIfV3JdAdFX0CeX7xH36tuWzYgBiDg6kn23TQOKRY1F1HnEqjvSYRUui2tNvVF
         QVbEc1fht7dGtsSI9QU3Zc3zHsRq93sn/PlKrgksjNy7aSbRCWbATTQY61Ty4YLbxvIC
         W/p+EbXBdv1gPW3C8BENnJOzp59j7t3u10pVZ6lztb3/tHCx5CeEsW/gvFe8i3ciuOni
         cGDIK4LuvZMeqNvvs1PqHnVEOqN5gkBgwrIIrvmU8BpAMCdyHidFrKGaaSJaRcaox9aN
         jhkg==
X-Gm-Message-State: AOAM5321eI17/Zwu9u0AkblinF70ijIbuEroww08PMTuvsVMVYvMqS7B
        LpeRY0J7N/wSFrg2jVnG3fwTx/Qx4w7pJW6NKVCziw==
X-Google-Smtp-Source: ABdhPJzoMWpLu1sd1E0uopGczpCuawrVcYbO8BSD89jWRBAsY/YPKGcQeZu2gy5KLDUwD4A7OlfUU0/ukrGAGDhXIaw=
X-Received: by 2002:a2e:88c1:: with SMTP id a1mr79313ljk.74.1611355675097;
 Fri, 22 Jan 2021 14:47:55 -0800 (PST)
MIME-Version: 1.0
References: <20210121121355.31654-1-brgl@bgdev.pl>
In-Reply-To: <20210121121355.31654-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Jan 2021 23:47:44 +0100
Message-ID: <CACRpkdZ-TT8wwRr6bJgvqjBcw5OkyB7+jyBO3AKdhaWSQTxuVw@mail.gmail.com>
Subject: Re: [PATCH] gpio: mockup: tweak the Kconfig help text
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 21, 2021 at 1:14 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> gpio-mockup doesn't require SYSFS to be selected so drop that bit from
> the Kconfig text.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
