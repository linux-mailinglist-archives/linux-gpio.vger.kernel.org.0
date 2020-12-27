Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 304DB2E32D9
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Dec 2020 22:17:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726314AbgL0VQY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Dec 2020 16:16:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbgL0VQX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Dec 2020 16:16:23 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28C78C061798
        for <linux-gpio@vger.kernel.org>; Sun, 27 Dec 2020 13:15:43 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id x20so19975407lfe.12
        for <linux-gpio@vger.kernel.org>; Sun, 27 Dec 2020 13:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kMqIbGNT1uRm2Dt7z/3RZr+PEtVxh923UTsM0yVqWHM=;
        b=ef4XuZI8QNn8O49uxxm4f8UtYLcNbKzVHchsqHrpGTmI6u7KmkfD8tLeG/wTuQQ3e/
         DkEl0MCkL9AwAGvBSS0aoUeHdfYZSU8/t/h5yaVXTJdjDNBbkiCzPdf46yM1gmOr0e3Z
         qxDbFw6GAKSWszZzCX74Q1UXe2pUBUMP7uGw0UW197rCuIK7QYQqOO4pHd3i1Gvxro3A
         aueP6dyL3m4NI9ThtASAjbYN5nnNQGsvbD+5ddgRyxPe/wktBpUpd5WZaxemxd22VGTo
         3L0ZGIHt5Q9GYC3j93PJMFk305LWaYkCIZ+LuoiAba4keVkgF1joFthm8GSOd5qnUArq
         6H/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kMqIbGNT1uRm2Dt7z/3RZr+PEtVxh923UTsM0yVqWHM=;
        b=fo2sA3EmP97BqIRCMAx4cvq9a/n4JztiblQXNRhdj/yN7B9V9DZnEwiO8gYoqNrWag
         PtKl9p/HGboJqigB2kfNgG8+lxRmab08IWXUOI5Ekma++fjpVqMdlCR3tV1hXw0gTCXa
         4m3h5kpqAI/gAZk/YbzC/70/LK0+TDKvHvPKf7H9+1RcKISBx8zmHZk8gkP4rqKN5oU6
         uH5PENMsE3Vv5leEv2ifd1UOlTu/fxDF85jdqOOS+FQbRfFjj9zLpREwXs7gLm/9mqfx
         PRqs4BCQMsL005PPLr7ruNOeOpYt6nllRvVde2bhcNHNwBobbwlnDfzhib31gJByi2bq
         eFNA==
X-Gm-Message-State: AOAM531UZdjEo/EfB0QUE3Sj+Owq8/Uw9XsFyqHcA7f8RuphL/Ox7t3O
        TuCs2iau5GCmj184++ED7M4C+Y5QoeeR50s+mtPq1g==
X-Google-Smtp-Source: ABdhPJyP3kmgjYBT7Dm+PX5wPDwFtO91CJVAMuLe6iKDSuOFANzhIFZA3QjoxYnDcfpOZkaT04Hm+jZxnkIClgOcAUk=
X-Received: by 2002:a19:8bc6:: with SMTP id n189mr17161577lfd.291.1609103741538;
 Sun, 27 Dec 2020 13:15:41 -0800 (PST)
MIME-Version: 1.0
References: <1608718963-21818-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1608718963-21818-8-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1608718963-21818-8-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 27 Dec 2020 22:15:30 +0100
Message-ID: <CACRpkdauO+9npR-p7BV3DK=54U9J0BWE39e+C5j0SCPvf8RT6g@mail.gmail.com>
Subject: Re: [PATCH v6 07/12] gpio: bd9571mwv: rid of using struct bd9571mwv
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        khiem.nguyen.xt@renesas.com, linux-power@fi.rohmeurope.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 23, 2020 at 11:22 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:

> To simplify this driver, use dev_get_regmap() and
> rid of using struct bd9571mwv.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Is this patch depending on other patches in the series or can it
be applied directly to the GPIO tree as-is?

Yours,
Linus Walleij
