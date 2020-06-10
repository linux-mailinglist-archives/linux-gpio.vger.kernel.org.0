Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B95FB1F50FA
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2020 11:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgFJJNU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jun 2020 05:13:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbgFJJNU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jun 2020 05:13:20 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAD38C03E96B
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2020 02:13:18 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id e125so1035967lfd.1
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2020 02:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C38mlKFbKcn0KxflluI+40IimgVnduQnhaBOHbkWa8E=;
        b=TWzngnQIgK9IeP2unLrjbP2Nq3Pxntzaj1eVDSWc25mWOIpm8isZibtRz6skHc1PfG
         uuoXBeQTDjC6NmfpP0ZwdZ1GHRFKXlJDI8QctYnsr2ubz+wkvDC295kESRHh0HLIfFZB
         WwG1yaDH+MjUFA5cruCUKV4z9FWeU7hkwMmnn3GIcXK8VO1iUZR1HDyp5bFzCbI51tLl
         W79qWy35Ib1RhXQzkfwuVBUPIXntIKiGc1NXQso1Nrl9RPZAtAQqAnP7MTArEVHqA2Re
         Wc4xWwm5lbUyl2Z5Bb6ptXu76oedSrvofnMELcMiPNBFBTPbddKU1MrE+vxuUQaxDkYH
         eVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C38mlKFbKcn0KxflluI+40IimgVnduQnhaBOHbkWa8E=;
        b=RPgt5X3OJ3oKnOCqTNx3d54Akh9b6XWCP8DuJcNOfIa+Zzl4fIAvF9/kMl/yIPSqu+
         PKWXN2KGDLPgi1a2wCAtOl8BYhuuBAzLFgGpCjT83QTYart+UOJAQvNxmkF4zFMZVH5S
         nGlOw9M5dybFOIj8xlh/+e3emFusPe3rx0JBHwi1Jw1a2+xhKqJzJR2LgeEYuVqZ6h7P
         Lxu3YKF3FJqPqlZPALoxViOBNpg8kt76T2Pbi/vYCo5l7aNyVx9PBIsIbHNt6zMY82n9
         0MsU6QVBMuhKebXDeDRFZwPAzEiUB+1vsLZIzqrCsWIPBlw3pNWcPrQsGTV4TR5+Mtxv
         7ebA==
X-Gm-Message-State: AOAM5306P/dd+8f3hML0+twBCGYoQm/PD1hzW/7DynjKzbNqYD8Iyi1D
        dhhZB4wFVajgv8f3YZ10rhw5P8SX499zcrzN+4Amhw==
X-Google-Smtp-Source: ABdhPJz+O3CiP/rQT2+fskrv9NUMEXKRdot09KjDq1C18L6A+qUjVgcXu1eTGOkzU+Rmxr5tJWULYao3d+wWZfCgSsk=
X-Received: by 2002:ac2:4823:: with SMTP id 3mr1184193lft.194.1591780397116;
 Wed, 10 Jun 2020 02:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200602141048.1995-1-warthog618@gmail.com>
In-Reply-To: <20200602141048.1995-1-warthog618@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 10 Jun 2020 11:13:06 +0200
Message-ID: <CACRpkdbVmrjgqXHvav3JWmncrKhNnroJKvTYm57dgKu1VrVfUQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: split character device into gpiolib-cdev
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 2, 2020 at 4:11 PM Kent Gibson <warthog618@gmail.com> wrote:

> Split the cdev specific functionality out of gpiolib.c and into
> gpiolib-cdev.c. This improves the readability and maintainability of both
> the cdev and core gpiolib code.
>
> Suggested-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>

Patch applied as early v5.9 development.

I will include it into linux-next after v5.8-rc1 is out.

Yours,
Linus Walleij
