Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C37A216CDB
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2020 14:31:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbgGGMb3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jul 2020 08:31:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726540AbgGGMb2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jul 2020 08:31:28 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0995DC061755
        for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2020 05:31:28 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id d17so34949241ljl.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2020 05:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c5PreIccieZzqDCuD5xHlKY1sTvI9Idr6J7wd3fIaUk=;
        b=uVo/UujyMsGtl1IhZIf0UfXMtcUtvlZX259B37NgwfYCeh029ftdKMBqsJRUu7n99r
         mcWou1pG39QO5sW0vG3t5VUb5l1ZlAnH44S/oKfc2m9pED+MK9+JoL7Do+suRPF+zEkX
         lKbflXau3wnWjRdb7uiecHhqfEpksnVQ9zPnP9/rv4FeAFW6/A/Ei1qVeb1FFbTOI9vO
         1akzd2uycaQzqAm34MrtEEXuKRpKQTuWcLxG8PGItET728a1GwoKnePxh9NtKHyhUzx6
         xVDMpALjWzsN9IvchROet9Rca6PgP5yYFK1NgXP2psQXFEttr9uF5+30x+4tRNKO8ZP0
         6O8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c5PreIccieZzqDCuD5xHlKY1sTvI9Idr6J7wd3fIaUk=;
        b=fE6DdDleKFsKu1V0Fjweq9CR0lDTc+uVBaEU1Zv9WYw/XiBiaCngqqhrT80ZTQe2oA
         W3mT4OdDdaguDN50qC6TEtypgwQbR7V4KmXO5RTOF3K6hwPZLXwY9Vrf96xjIN4Tj0ND
         f21AcKURqm2h5esxpXrNIWND25/1d2cRxdSOFK4RVBgJOku1PzDasyE+27ZgG+gORCRg
         1+bV7+3sRFwY2yQJrRQzO5cV1kMcySzwvrFQl9smXGhFfSUhuDiZElzhqaX4WlV5mUoI
         zXwfCfoSO0mZQXJKgDwiGAkaWPHpdI+j6XRc6J0wVKHJ3OmIIZA8pmaFKqnx8n9Xbd+A
         3S5Q==
X-Gm-Message-State: AOAM530lU7TQaFKDkPSQyxpsiMyC0kyGTZPz4LMenPPkr9yk7he/zBmA
        vgKP2VMhNrG3eWUd6E/1J6ec7iSachxWwPD3WUwh0Q==
X-Google-Smtp-Source: ABdhPJzNuXjFxL4eLB0ZfXEgPVcJc64eKxEfq0oxGzOkKZvSKhOBaXkoArxnE8a880A6ThE3ocyS7OoFjYdLe/YYRdU=
X-Received: by 2002:a2e:7a1a:: with SMTP id v26mr14132869ljc.104.1594125086553;
 Tue, 07 Jul 2020 05:31:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200701114212.8520-1-geert+renesas@glider.be>
In-Reply-To: <20200701114212.8520-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jul 2020 14:31:15 +0200
Message-ID: <CACRpkdYr1don64ZCcJ7w223+cMntjCzeHg9VrZrE4rzf77bOcA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] gpio: aggregator: Misc parsing improvements
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 1, 2020 at 1:42 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> This patch series contains two improvements for the parsing code in the
> GPIO Aggregator.
>
> The second one converts the driver to use bitmap_parselist() for parsing
> GPIO offsets and/or ranges, as suggested by Andy[1].  This should have
> no impact on the format of the configuration parameters written to the
> "new_device" virtual file in sysfs.
>
> Changes compared to v1:
>   - Rename mask to bitmap,
>   - Allocate bitmap dynamically.

Patches applied for v5.9! If there are further review comments they can surely
be addressed by new patches.

Yours,
Linus Walleij
