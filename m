Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BB5F44B40A
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 21:33:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243688AbhKIUgE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 15:36:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242985AbhKIUgD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Nov 2021 15:36:03 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F864C061766
        for <linux-gpio@vger.kernel.org>; Tue,  9 Nov 2021 12:33:17 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id bk14so917403oib.7
        for <linux-gpio@vger.kernel.org>; Tue, 09 Nov 2021 12:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k2TaFwHsbXjBOLwoUPmGtwmeFDp722Ju9YBr445crS4=;
        b=dnfcnF+8Zqd8/+Ws2YPd61ebhZoDJNfV1YEfMmXLWNk3G6IquPU0hlucl8mRI9okE3
         PGifEqFaixLVcSogvxfVZPVl+zFMzsqp0nrU9lCivxneYw4uiRu/tWaqWDEUJbIO+hTE
         jYGY7TguSj8MjeeDOiXKxqByetn/NyTJkUMNUC5F8h8d5yG/Iyy/FBIr/0SA6NwjXeI9
         j+bKPw4COh9scyhMdPhBcdSz8pB8iQdcEi4BMne3/miQr0v3oBJQJFOK+bPDyCgAGNGe
         Sf9xZFd2LR5UkruHFgi6l/Ez9IRJN6wFK4Pxf17Fd7TYHvPIEmr4fbwR1G5kPxcNEYic
         Df6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k2TaFwHsbXjBOLwoUPmGtwmeFDp722Ju9YBr445crS4=;
        b=bOeIvHmQ1gwU+HBTADvza8PDaf3dsF4qe670iTUyS11ch5wCDvdVL9T5aFvxmWaVV3
         0033NPX6VbN/JVo32PbVJ54tzL1bSqkp87suYFMRK2hHwKxdJ84Gd44W9Elgs1HN9PoA
         EIwmwH1yI52suEXonSz2R1zezDWe1HZwhRPi0T8UD2hiFzeosIlk46/c7DcQjj3rEsa2
         /v4Z/BSod1eMX4fZ+hHyJL6DdrfqV8ZV4tgLxhGhnsqyuaaPig1ZP65sDT4Wo//wpefu
         wRAQlTvoYK1BrZ96tSYPndkcZDdetoycAkOboCRMc4XBFw+UjZ/50Aqh08ouJkXJsF2t
         pngw==
X-Gm-Message-State: AOAM5312HPVw7LvQwVaWTIUEZUkvBkva3X80au2HWrW/awDPy8sqxXNr
        TuoiHRtaC0Ej+oPB9oV1gGK7zA2ssiyehdAjUQdsRg==
X-Google-Smtp-Source: ABdhPJyAdTp8i7h+7QtZ3iNedi4O4TI5wuLoFW2GRe8l0+FtrdecnIDSV6gORtzUyIfhUdFZnB+I3Ng4ycf0QnkqUbw=
X-Received: by 2002:a05:6808:60e:: with SMTP id y14mr8577118oih.162.1636489996902;
 Tue, 09 Nov 2021 12:33:16 -0800 (PST)
MIME-Version: 1.0
References: <20211109100207.2474024-1-arnd@kernel.org> <20211109100207.2474024-7-arnd@kernel.org>
 <YYpN3LzXz638l6FG@smile.fi.intel.com>
In-Reply-To: <YYpN3LzXz638l6FG@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 21:33:05 +0100
Message-ID: <CACRpkdbvY28feBrDUzon79nSyH9=JOJWGSYGhb1V9125wbQ=5g@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] gpiolib: remove legacy gpio_export
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Arnd Bergmann <arnd@kernel.org>, linux-gpio@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 9, 2021 at 11:31 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> What I wish to see meanwhile is a section in the TODO list somewhere to clean
> up those modules that have gpio.h. Linus, do we have one in the kernel or is
> it your personal TODO?

It's hidden in plain sight :D
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpio/TODO

> In case we have one in the kernel, please add there modules you modified in
> a way that they still need further attention.

The TODO is maybe a bit generic, I would simply add comments directly
in these modules/files with some fat TODO stamps over them.

Yours,
Linus Walleij
