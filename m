Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC17EFFE4
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 15:34:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389537AbfKEOeZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 09:34:25 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35973 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389505AbfKEOeZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 09:34:25 -0500
Received: by mail-lf1-f68.google.com with SMTP id a6so11901208lfo.3
        for <linux-gpio@vger.kernel.org>; Tue, 05 Nov 2019 06:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mE4B26PLyfdSEPu42T0Vc58mzmdMSqZyZyS3WXIQfEA=;
        b=DZjmCemA9B6pbWd89WUtuR257XeKPlWmL1YsI1WXDsLlQe9En9uo7/KWp107T6FC4g
         dMqkS47PtQLjwGUpMLHJiVER9Rx9eHewjTec3k7ujgniBxkzqtv983OfxMPABXYZFtkt
         Inyq6wRvYH5gRMss48KHGAipMoFbVTvcgFQl402aymS4BSAVagTtPM65FkYxvmVC6Yw3
         DxK+Xxb1y0b6WdtENCn/Q5prT5OD018T9P85xeS9pu3hcGAVTYHidz6K+QbWfV+Sv9qz
         PfIZjkPvnVb1arR1AjG+HOkBvMVnfH0144FsjYqa0b6s16Eq9CxHqXCDb5uPJw5zx2u2
         tFxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mE4B26PLyfdSEPu42T0Vc58mzmdMSqZyZyS3WXIQfEA=;
        b=T49Kpvt2ToQjfSm4Fsq+yMgLp3C/mCSC9tX0PxtusjXOGVW6Tv+opXmELnkMqzAME3
         KU99Y9q1sLARhFJuq3K4Pv4HjFXvtB/dzQWjP1N7oz91T3YLxLz0QZJDG/FX1K5fiQS/
         fGdL3xJR9IZRdYjr2/f+t6X20sOhYUGEcVCBHUXoHz3RROpl0eehq+nEiL3sni2wvfuW
         wgPnxsmrVwIvUaMukQjoM+pU3tFO4hBj42wzFCZQe3K+KmhRogwHREpTY24/dHhtWLKG
         wIP2YsG2McgsMSZ0q2oiNOTA6xcKroOBkUlewYKeohbpnHaHGmHjju5jQDL5RZLB+dqC
         RGPA==
X-Gm-Message-State: APjAAAUiE39BZYC2mz/faXjmZDgUk0L/ba2rKOVrJy883aWD2he8lW5R
        f6SGbMTQwK/FJ3fjBsjfHD0UD0zBIHgC4fAEcu69sQ==
X-Google-Smtp-Source: APXvYqxktk1gD0mzdjJC7FeWKhTuZXLyZl4wOriHJZvkr/LZx8C100O1WzNfmE2iu/D6k7t4x70dWHHGazB5tXqUtSk=
X-Received: by 2002:a19:6a0d:: with SMTP id u13mr12046688lfu.86.1572964463497;
 Tue, 05 Nov 2019 06:34:23 -0800 (PST)
MIME-Version: 1.0
References: <CACRpkdb8D_zxHfzY=+ramnNjXVsN9MMO8Q-3=iZFLS2A_ZDQuw@mail.gmail.com>
 <20191104142654.39256-1-yuehaibing@huawei.com>
In-Reply-To: <20191104142654.39256-1-yuehaibing@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 5 Nov 2019 15:34:12 +0100
Message-ID: <CACRpkdZ7Qqd8STdSJP4jHjpfAmpPq878gmUXOrD9N_LANdJ0=Q@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: use devm_platform_ioremap_resource() to
 simplify code
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Thierry Reding <treding@nvidia.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jesper Nilsson <jesper.nilsson@axis.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 4, 2019 at 3:29 PM YueHaibing <yuehaibing@huawei.com> wrote:

> devm_platform_ioremap_resource() internally have platform_get_resource()
> and devm_ioremap_resource() in it. So instead of calling them separately
> use devm_platform_ioremap_resource() directly.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
> Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> v2: squash all into one patch

Patch applied.

Yours,
Linus Walleij
