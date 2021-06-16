Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8489D3A9519
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jun 2021 10:31:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232215AbhFPIdX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Jun 2021 04:33:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232208AbhFPIdV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Jun 2021 04:33:21 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F087C061574
        for <linux-gpio@vger.kernel.org>; Wed, 16 Jun 2021 01:31:14 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 131so2676519ljj.3
        for <linux-gpio@vger.kernel.org>; Wed, 16 Jun 2021 01:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GQWVokfQZgVGHdyHPg/yFmcebJpq41KrWGaOdOQKipI=;
        b=m0/Lt4BIjXjdpqGSJBLEKjOIX3eirzK2CqDEpDte2Sj3Gc7g8xgdCxCBn5e95uOn1v
         ydDh6KT8HjktRKBXr1sdmueW7V4AkYTsqPeNXbUVcW/kihKPAvf6QZEZ26aLyCwGCXrg
         B0NFEy2eKiuPOZbOScS8JT/qvFA26HvVb5TVNHXylkJDGQ+WF7lLmhyxfj0lH189yFUe
         WbameZzm/vatSMhg+KQhcKgMzrom/GUB5AQ4qAJPeNo2uMheV3oy2PfOEwlMbfyR503e
         S6lCpLduJS7PzOZ448xLpkvuUTIhu8BKQefZo9YXer3ULTU44FfVpVAeNhv+OXRp2LkD
         kCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GQWVokfQZgVGHdyHPg/yFmcebJpq41KrWGaOdOQKipI=;
        b=nvk1qeFA3UnNlhx2q8lBS1Flo0J/nZ1OBZjKIQrqtji/cqfOXBGIhjZ2xEBbwHICmi
         FLwqR/cPT6mreXr1AlvdvZEbl7u8uZgxn+TOV1rdU0SSz8zInRYvGt4BOxV1ImirF0ey
         ilTRkbAFecW7Y7Fi+Ev9gFBfhmV8JTeUAD7rypq8kPC/y4rkUOWLVa32IScRgZFiH+9a
         1Vc/fKSYkfAPUnei10PlygKlLnLZmHDESKYtMNv/gSMu1X6T4YuLkCX3AeYehq6cj9qT
         0X8V2tSP5FEkYJO719ads20AAXbOT1Bj6TMsDpXHvVuEJq0MKivgp2uaONo6NM5n9tgi
         7S7g==
X-Gm-Message-State: AOAM533NJNyUScaTIFrfWErgSgVe88yqpOPpNgf0PWVTHkUFe8rzdP2C
        WFGUuR8BoyuY/x8BO5aP0WI1N98+RpPPJyQ4ZQb9wg==
X-Google-Smtp-Source: ABdhPJzxWPvgV7p6eSpQF1eWW888O48hzZKsx5O5oRnUA6LyT2IOxPBYEipMULn1541CTP+g3/b9As5YqpuN8cY58j0=
X-Received: by 2002:a05:651c:1501:: with SMTP id e1mr3610433ljf.74.1623832272136;
 Wed, 16 Jun 2021 01:31:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210615174911.973-1-info@metux.net>
In-Reply-To: <20210615174911.973-1-info@metux.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 16 Jun 2021 10:31:00 +0200
Message-ID: <CACRpkdbwLOOT6nuhpkT5x-AZVipsD2qG8Qu4xoiRotHQNknwzw@mail.gmail.com>
Subject: Re: [PATCH] drivers: gpio: add virtio-gpio guest driver
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Enrico,

On Tue, Jun 15, 2021 at 7:49 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:

> Introduce new GPIO driver for virtual GPIO devices via virtio.
>
> The driver implements the virtio-gpio protocol (ID 41), which can be
> used by either VM guests (e.g. bridging virtual gpios from the guest
> to real gpios in the host or attaching simulators for automatic
> application testing), as well as virtio-gpio hardware devices.
>
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>

So now there are two contesting patches for this and that creates a
social problem for us as maintainers. I am not too happy about that.

This situation activates the kernel management style document so
I advise involved parties to familiarize themselves with it:
https://www.kernel.org/doc/html/latest/process/management-style.html

Can we get the discussion down to actual technical points?
We really need a virtio GPIO driver, no doubt, so if everyone could
just work toward that goal and compromise with their specific pet
peeves that would be great.

Yours,
Linus Walleij
